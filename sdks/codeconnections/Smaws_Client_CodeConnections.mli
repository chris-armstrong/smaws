(** CodeConnections client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_sync_configuration :
  ?config_file:deployment_file_path ->
  ?publish_deployment_status:publish_deployment_status ->
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?pull_request_comment:pull_request_comment ->
  branch:branch_name ->
  owner_id:owner_id ->
  provider_type:provider_type ->
  repository_link_id:repository_link_id ->
  repository_name:repository_name ->
  resource_name:resource_name ->
  role_arn:iam_role_arn ->
  sync_type:sync_configuration_type ->
  unit ->
  sync_configuration

val make_update_sync_configuration_output :
  sync_configuration:sync_configuration -> unit -> update_sync_configuration_output

val make_update_sync_configuration_input :
  ?branch:branch_name ->
  ?config_file:deployment_file_path ->
  ?repository_link_id:repository_link_id ->
  ?role_arn:iam_role_arn ->
  ?publish_deployment_status:publish_deployment_status ->
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?pull_request_comment:pull_request_comment ->
  resource_name:resource_name ->
  sync_type:sync_configuration_type ->
  unit ->
  update_sync_configuration_input

val make_sync_blocker_context :
  key:sync_blocker_context_key -> value:sync_blocker_context_value -> unit -> sync_blocker_context

val make_sync_blocker :
  ?contexts:sync_blocker_context_list ->
  ?resolved_reason:resolved_reason ->
  ?resolved_at:timestamp ->
  id:id ->
  type_:blocker_type ->
  status:blocker_status ->
  created_reason:created_reason ->
  created_at:timestamp ->
  unit ->
  sync_blocker

val make_update_sync_blocker_output :
  ?parent_resource_name:resource_name ->
  resource_name:resource_name ->
  sync_blocker:sync_blocker ->
  unit ->
  update_sync_blocker_output

val make_update_sync_blocker_input :
  id:id ->
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  resolved_reason:resolved_reason ->
  unit ->
  update_sync_blocker_input

val make_repository_link_info :
  ?encryption_key_arn:kms_key_arn ->
  connection_arn:connection_arn ->
  owner_id:owner_id ->
  provider_type:provider_type ->
  repository_link_arn:repository_link_arn ->
  repository_link_id:repository_link_id ->
  repository_name:repository_name ->
  unit ->
  repository_link_info

val make_update_repository_link_output :
  repository_link_info:repository_link_info -> unit -> update_repository_link_output

val make_update_repository_link_input :
  ?connection_arn:connection_arn ->
  ?encryption_key_arn:kms_key_arn ->
  repository_link_id:repository_link_id ->
  unit ->
  update_repository_link_input

val make_update_host_output : unit -> unit

val make_vpc_configuration :
  ?tls_certificate:tls_certificate ->
  vpc_id:vpc_id ->
  subnet_ids:subnet_ids ->
  security_group_ids:security_group_ids ->
  unit ->
  vpc_configuration

val make_update_host_input :
  ?provider_endpoint:url ->
  ?vpc_configuration:vpc_configuration ->
  host_arn:host_arn ->
  unit ->
  update_host_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_input :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_input

val make_list_sync_configurations_output :
  ?next_token:sharp_next_token ->
  sync_configurations:sync_configuration_list ->
  unit ->
  list_sync_configurations_output

val make_list_sync_configurations_input :
  ?max_results:max_results ->
  ?next_token:sharp_next_token ->
  repository_link_id:repository_link_id ->
  sync_type:sync_configuration_type ->
  unit ->
  list_sync_configurations_input

val make_repository_sync_definition :
  branch:branch_name ->
  directory:directory ->
  parent:parent ->
  target:target ->
  unit ->
  repository_sync_definition

val make_list_repository_sync_definitions_output :
  ?next_token:sharp_next_token ->
  repository_sync_definitions:repository_sync_definition_list ->
  unit ->
  list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  repository_link_id:repository_link_id ->
  sync_type:sync_configuration_type ->
  unit ->
  list_repository_sync_definitions_input

val make_list_repository_links_output :
  ?next_token:sharp_next_token ->
  repository_links:repository_link_list ->
  unit ->
  list_repository_links_output

val make_list_repository_links_input :
  ?max_results:max_results -> ?next_token:sharp_next_token -> unit -> list_repository_links_input

val make_host :
  ?name:host_name ->
  ?host_arn:host_arn ->
  ?provider_type:provider_type ->
  ?provider_endpoint:url ->
  ?vpc_configuration:vpc_configuration ->
  ?status:host_status ->
  ?status_message:host_status_message ->
  unit ->
  host

val make_list_hosts_output : ?hosts:host_list -> ?next_token:next_token -> unit -> list_hosts_output

val make_list_hosts_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_hosts_input

val make_connection :
  ?connection_name:connection_name ->
  ?connection_arn:connection_arn ->
  ?provider_type:provider_type ->
  ?owner_account_id:account_id ->
  ?connection_status:connection_status ->
  ?host_arn:host_arn ->
  unit ->
  connection

val make_list_connections_output :
  ?connections:connection_list -> ?next_token:next_token -> unit -> list_connections_output

val make_list_connections_input :
  ?provider_type_filter:provider_type ->
  ?host_arn_filter:host_arn ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_connections_input

val make_get_sync_configuration_output :
  sync_configuration:sync_configuration -> unit -> get_sync_configuration_output

val make_get_sync_configuration_input :
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  unit ->
  get_sync_configuration_input

val make_sync_blocker_summary :
  ?parent_resource_name:resource_name ->
  ?latest_blockers:latest_sync_blocker_list ->
  resource_name:resource_name ->
  unit ->
  sync_blocker_summary

val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary -> unit -> get_sync_blocker_summary_output

val make_get_sync_blocker_summary_input :
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  unit ->
  get_sync_blocker_summary_input

val make_revision :
  branch:branch_name ->
  directory:directory ->
  owner_id:owner_id ->
  repository_name:repository_name ->
  provider_type:provider_type ->
  sha:sh_a ->
  unit ->
  revision

val make_resource_sync_event :
  ?external_id:external_id ->
  event:event ->
  time:timestamp ->
  type_:type_ ->
  unit ->
  resource_sync_event

val make_resource_sync_attempt :
  events:resource_sync_event_list ->
  initial_revision:revision ->
  started_at:timestamp ->
  status:resource_sync_status ->
  target_revision:revision ->
  target:target ->
  unit ->
  resource_sync_attempt

val make_get_resource_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  latest_sync:resource_sync_attempt ->
  unit ->
  get_resource_sync_status_output

val make_get_resource_sync_status_input :
  resource_name:resource_name ->
  sync_type:sync_configuration_type ->
  unit ->
  get_resource_sync_status_input

val make_repository_sync_event :
  ?external_id:external_id ->
  event:event ->
  time:timestamp ->
  type_:type_ ->
  unit ->
  repository_sync_event

val make_repository_sync_attempt :
  started_at:timestamp ->
  status:repository_sync_status ->
  events:repository_sync_event_list ->
  unit ->
  repository_sync_attempt

val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt -> unit -> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  branch:branch_name ->
  repository_link_id:repository_link_id ->
  sync_type:sync_configuration_type ->
  unit ->
  get_repository_sync_status_input

val make_get_repository_link_output :
  repository_link_info:repository_link_info -> unit -> get_repository_link_output

val make_get_repository_link_input :
  repository_link_id:repository_link_id -> unit -> get_repository_link_input

val make_get_host_output :
  ?name:host_name ->
  ?status:host_status ->
  ?provider_type:provider_type ->
  ?provider_endpoint:url ->
  ?vpc_configuration:vpc_configuration ->
  unit ->
  get_host_output

val make_get_host_input : host_arn:host_arn -> unit -> get_host_input
val make_get_connection_output : ?connection:connection -> unit -> get_connection_output
val make_get_connection_input : connection_arn:connection_arn -> unit -> get_connection_input
val make_delete_sync_configuration_output : unit -> unit

val make_delete_sync_configuration_input :
  sync_type:sync_configuration_type ->
  resource_name:resource_name ->
  unit ->
  delete_sync_configuration_input

val make_delete_repository_link_output : unit -> unit

val make_delete_repository_link_input :
  repository_link_id:repository_link_id -> unit -> delete_repository_link_input

val make_delete_host_output : unit -> unit
val make_delete_host_input : host_arn:host_arn -> unit -> delete_host_input
val make_delete_connection_output : unit -> unit
val make_delete_connection_input : connection_arn:connection_arn -> unit -> delete_connection_input

val make_create_sync_configuration_output :
  sync_configuration:sync_configuration -> unit -> create_sync_configuration_output

val make_create_sync_configuration_input :
  ?publish_deployment_status:publish_deployment_status ->
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?pull_request_comment:pull_request_comment ->
  branch:branch_name ->
  config_file:deployment_file_path ->
  repository_link_id:repository_link_id ->
  resource_name:resource_name ->
  role_arn:iam_role_arn ->
  sync_type:sync_configuration_type ->
  unit ->
  create_sync_configuration_input

val make_create_repository_link_output :
  repository_link_info:repository_link_info -> unit -> create_repository_link_output

val make_create_repository_link_input :
  ?encryption_key_arn:kms_key_arn ->
  ?tags:tag_list ->
  connection_arn:connection_arn ->
  owner_id:owner_id ->
  repository_name:repository_name ->
  unit ->
  create_repository_link_input

val make_create_host_output : ?host_arn:host_arn -> ?tags:tag_list -> unit -> create_host_output

val make_create_host_input :
  ?vpc_configuration:vpc_configuration ->
  ?tags:tag_list ->
  name:host_name ->
  provider_type:provider_type ->
  provider_endpoint:url ->
  unit ->
  create_host_input

val make_create_connection_output :
  ?tags:tag_list -> connection_arn:connection_arn -> unit -> create_connection_output

val make_create_connection_input :
  ?provider_type:provider_type ->
  ?tags:tag_list ->
  ?host_arn:host_arn ->
  connection_name:connection_name ->
  unit ->
  create_connection_input
(** {1:operations Operations} *)

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_input ->
    ( create_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_input ->
    ( create_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection that can then be given to other Amazon Web Services services like \
   CodePipeline so that it can access third-party code repositories. The connection is in pending \
   status until the third-party connection handshake is completed from the console.\n"]

module CreateHost : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_host_input ->
    ( create_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_host_input ->
    ( create_host_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
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
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_repository_link_input ->
    ( create_repository_link_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a link to a specified external Git repository. A repository link allows Git sync to \
   monitor and sync changes to files in a specified Git repository.\n"]

module CreateSyncConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_sync_configuration_input ->
    ( create_sync_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a sync configuration which allows Amazon Web Services to sync content from a Git \
   repository to update a specified Amazon Web Services resource. Parameters for the sync \
   configuration are determined by the sync type.\n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_input ->
    ( delete_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_input ->
    ( delete_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The connection to be deleted.\n"]

module DeleteHost : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_host_input ->
    ( delete_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_host_input ->
    ( delete_host_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The host to be deleted. Before you delete a host, all connections associated to the host must \
   be deleted.\n\n\
  \  A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or VPC_CONFIG_DELETING state.\n\
  \  \n\
  \   "]

module DeleteRepositoryLink : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedProviderTypeException of unsupported_provider_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_link_input ->
    ( delete_repository_link_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedProviderTypeException of unsupported_provider_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association between your connection and a specified external Git repository.\n"]

module DeleteSyncConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_sync_configuration_input ->
    ( delete_sync_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the sync configuration for a specified repository and connection.\n"]

module GetConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connection_input ->
    ( get_connection_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_input ->
    ( get_connection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the connection ARN and details such as status, owner, and provider type.\n"]

module GetHost : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_host_input ->
    ( get_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_host_input ->
    ( get_host_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the host ARN and details such as status, provider type, endpoint, and, if applicable, \
   the VPC configuration.\n"]

module GetRepositoryLink : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_link_input ->
    ( get_repository_link_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details about a repository link. A repository link allows Git sync to monitor and sync \
   changes from files in a specified Git repository.\n"]

module GetRepositorySyncStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_sync_status_input ->
    ( get_repository_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_sync_status_input ->
    ( get_repository_sync_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details about the sync status for a repository. A repository sync uses Git sync to push \
   and pull changes from your remote repository.\n"]

module GetResourceSyncStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_sync_status_input ->
    ( get_resource_sync_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_sync_status_input ->
    ( get_resource_sync_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the status of the sync with the Git repository for a specific Amazon Web Services \
   resource.\n"]

module GetSyncBlockerSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_sync_blocker_summary_input ->
    ( get_sync_blocker_summary_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_sync_blocker_summary_input ->
    ( get_sync_blocker_summary_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the most recent sync blockers.\n"]

module GetSyncConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_sync_configuration_input ->
    ( get_sync_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_sync_configuration_input ->
    ( get_sync_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details about a sync configuration, including the sync type and resource name. A sync \
   configuration allows the configuration to sync (push and pull) changes from the remote \
   repository for a specified branch in a Git repository.\n"]

module ListConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connections_input ->
    ( list_connections_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connections_input ->
    ( list_connections_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the connections associated with your account.\n"]

module ListHosts : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hosts_input ->
    (list_hosts_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hosts_input ->
    ( list_hosts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the hosts associated with your account.\n"]

module ListRepositoryLinks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_repository_links_input ->
    ( list_repository_links_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the repository links created for connections in your account.\n"]

module ListRepositorySyncDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_repository_sync_definitions_input ->
    ( list_repository_sync_definitions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_repository_sync_definitions_input ->
    ( list_repository_sync_definitions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the repository sync definitions for repository links in your account.\n"]

module ListSyncConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sync_configurations_input ->
    ( list_sync_configurations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sync_configurations_input ->
    ( list_sync_configurations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of sync configurations for a specified repository.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the set of key-value pairs (metadata) that are used to manage the resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds to or modifies the tags of the given resource. Tags are metadata that can be used to \
   manage a resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from an Amazon Web Services resource.\n"]

module UpdateHost : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_host_input ->
    ( update_host_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_host_input ->
    ( update_host_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a specified host with the provided configurations.\n"]

module UpdateRepositoryLink : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConditionalCheckFailedException of conditional_check_failed_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UpdateOutOfSyncException of update_out_of_sync_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_repository_link_input ->
    ( update_repository_link_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConditionalCheckFailedException of conditional_check_failed_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UpdateOutOfSyncException of update_out_of_sync_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the association between your connection and a specified external Git repository. A \
   repository link allows Git sync to monitor and sync changes to files in a specified Git \
   repository.\n"]

module UpdateSyncBlocker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
    | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_sync_blocker_input ->
    ( update_sync_blocker_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
      | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows you to update the status of a sync blocker, resolving the blocker and allowing syncing \
   to continue.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateSyncConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `UpdateOutOfSyncException of update_out_of_sync_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
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

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_sync_configuration_input ->
    ( update_sync_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `UpdateOutOfSyncException of update_out_of_sync_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the sync configuration for your connection and a specified external Git repository.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
