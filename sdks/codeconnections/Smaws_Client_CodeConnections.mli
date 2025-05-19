(** 
    CodeConnections client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vpc_configuration =
  {
  tls_certificate: string option ;
  security_group_ids: string list ;
  subnet_ids: string list ;
  vpc_id: string }[@@ocaml.doc
                    "The VPC configuration provisioned for the host.\n"]
type nonrec provider_type =
  | GITLAB_SELF_MANAGED 
  | GITLAB 
  | GITHUB_ENTERPRISE_SERVER 
  | GITHUB 
  | BITBUCKET [@@ocaml.doc ""]
type nonrec sync_configuration_type =
  | CFN_STACK_SYNC [@@ocaml.doc ""]
type nonrec publish_deployment_status =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec trigger_resource_update_on =
  | FILE_CHANGE 
  | ANY_CHANGE [@@ocaml.doc ""]
type nonrec sync_configuration =
  {
  trigger_resource_update_on: trigger_resource_update_on option ;
  publish_deployment_status: publish_deployment_status option ;
  sync_type: sync_configuration_type ;
  role_arn: string ;
  resource_name: string ;
  repository_name: string ;
  repository_link_id: string ;
  provider_type: provider_type ;
  owner_id: string ;
  config_file: string option ;
  branch: string }[@@ocaml.doc
                    "Information, such as repository, branch, provider, and resource names for a specific sync configuration.\n"]
type nonrec update_sync_configuration_output =
  {
  sync_configuration: sync_configuration }[@@ocaml.doc ""]
type nonrec update_sync_configuration_input =
  {
  trigger_resource_update_on: trigger_resource_update_on option ;
  publish_deployment_status: publish_deployment_status option ;
  sync_type: sync_configuration_type ;
  role_arn: string option ;
  resource_name: string ;
  repository_link_id: string option ;
  config_file: string option ;
  branch: string option }[@@ocaml.doc ""]
type nonrec update_out_of_sync_exception = {
  message: string option }[@@ocaml.doc
                            "The update is out of sync. Try syncing again.\n"]
type nonrec throttling_exception = {
  message: string option }[@@ocaml.doc
                            "The request was denied due to request throttling.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Resource not found. Verify the connection resource ARN and try again.\n"]
type nonrec invalid_input_exception = {
  message: string option }[@@ocaml.doc
                            "The input is not valid. Verify that the action is typed correctly.\n"]
type nonrec internal_server_exception = {
  message: string option }[@@ocaml.doc
                            "Received an internal server exception. Try again later.\n"]
type nonrec concurrent_modification_exception = {
  message: string option }[@@ocaml.doc
                            "Exception thrown as a result of concurrent modification to an application. For example, two individuals attempting to edit the same application at the same time. \n"]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "You do not have sufficient access to perform this action.\n"]
type nonrec blocker_type =
  | AUTOMATED [@@ocaml.doc ""]
type nonrec blocker_status =
  | RESOLVED 
  | ACTIVE [@@ocaml.doc ""]
type nonrec sync_blocker_context = {
  value: string ;
  key: string }[@@ocaml.doc "The context for a specific sync blocker.\n"]
type nonrec sync_blocker =
  {
  resolved_at: CoreTypes.Timestamp.t option ;
  resolved_reason: string option ;
  contexts: sync_blocker_context list option ;
  created_at: CoreTypes.Timestamp.t ;
  created_reason: string ;
  status: blocker_status ;
  type_: blocker_type ;
  id: string }[@@ocaml.doc "Information about a blocker for a sync event.\n"]
type nonrec update_sync_blocker_output =
  {
  sync_blocker: sync_blocker ;
  parent_resource_name: string option ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec update_sync_blocker_input =
  {
  resolved_reason: string ;
  resource_name: string ;
  sync_type: sync_configuration_type ;
  id: string }[@@ocaml.doc ""]
type nonrec sync_blocker_does_not_exist_exception = {
  message: string option }[@@ocaml.doc
                            "Unable to continue. The sync blocker does not exist.\n"]
type nonrec retry_latest_commit_failed_exception = {
  message: string option }[@@ocaml.doc
                            "Retrying the latest commit failed. Try again later.\n"]
type nonrec repository_link_info =
  {
  repository_name: string ;
  repository_link_id: string ;
  repository_link_arn: string ;
  provider_type: provider_type ;
  owner_id: string ;
  encryption_key_arn: string option ;
  connection_arn: string }[@@ocaml.doc
                            "Information about the repository link resource, such as the repository link ARN, the associated connection ARN, encryption key ARN, and owner ID.\n"]
type nonrec update_repository_link_output =
  {
  repository_link_info: repository_link_info }[@@ocaml.doc ""]
type nonrec update_repository_link_input =
  {
  repository_link_id: string ;
  encryption_key_arn: string option ;
  connection_arn: string option }[@@ocaml.doc ""]
type nonrec conditional_check_failed_exception = {
  message: string option }[@@ocaml.doc
                            "The conditional check failed. Try again later.\n"]
type nonrec update_host_output = unit
type nonrec update_host_input =
  {
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string option ;
  host_arn: string }[@@ocaml.doc ""]
type nonrec unsupported_operation_exception = {
  message: string option }[@@ocaml.doc
                            "The operation is not supported. Check the connection status and try again.\n"]
type nonrec resource_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "Resource not found. Verify the ARN for the host resource and try again.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "Two conflicting operations have been made on the same resource.\n"]
type nonrec untag_resource_output = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec unsupported_provider_type_exception = {
  message: string option }[@@ocaml.doc
                            "The specified provider type is not supported for connections.\n"]
type nonrec tag_resource_output = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A tag is a key-value pair that is used to manage the resource.\n\n This tag is available for use by Amazon Web Services services that support tags.\n "]
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "Exceeded the maximum limit for connections.\n"]
type nonrec sync_configuration_still_exists_exception =
  {
  message: string option }[@@ocaml.doc
                            "Unable to continue. The sync blocker still exists.\n"]
type nonrec sync_blocker_summary =
  {
  latest_blockers: sync_blocker list option ;
  parent_resource_name: string option ;
  resource_name: string }[@@ocaml.doc "A summary for sync blockers.\n"]
type nonrec revision =
  {
  sha: string ;
  provider_type: provider_type ;
  repository_name: string ;
  owner_id: string ;
  directory: string ;
  branch: string }[@@ocaml.doc
                    "Information about the revision for a specific sync event, such as the branch, owner ID, and name of the repository.\n"]
type nonrec resource_sync_status =
  | SUCCEEDED 
  | IN_PROGRESS 
  | INITIATED 
  | FAILED [@@ocaml.doc ""]
type nonrec resource_sync_event =
  {
  type_: string ;
  time: CoreTypes.Timestamp.t ;
  external_id: string option ;
  event: string }[@@ocaml.doc
                   "Information about a resource sync event for the resource associated with a sync configuration.\n"]
type nonrec resource_sync_attempt =
  {
  target: string ;
  target_revision: revision ;
  status: resource_sync_status ;
  started_at: CoreTypes.Timestamp.t ;
  initial_revision: revision ;
  events: resource_sync_event list }[@@ocaml.doc
                                      "Information about a resource sync attempt.\n"]
type nonrec resource_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "Unable to create resource. Resource already exists.\n"]
type nonrec repository_sync_status =
  | QUEUED 
  | SUCCEEDED 
  | IN_PROGRESS 
  | INITIATED 
  | FAILED [@@ocaml.doc ""]
type nonrec repository_sync_event =
  {
  type_: string ;
  time: CoreTypes.Timestamp.t ;
  external_id: string option ;
  event: string }[@@ocaml.doc "Information about a repository sync event.\n"]
type nonrec repository_sync_definition =
  {
  target: string ;
  parent: string ;
  directory: string ;
  branch: string }[@@ocaml.doc
                    "The definition for a repository with a sync configuration.\n"]
type nonrec repository_sync_attempt =
  {
  events: repository_sync_event list ;
  status: repository_sync_status ;
  started_at: CoreTypes.Timestamp.t }[@@ocaml.doc
                                       "Information about a repository sync attempt for a repository with a sync configuration.\n"]
type nonrec list_tags_for_resource_output = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_sync_configurations_output =
  {
  next_token: string option ;
  sync_configurations: sync_configuration list }[@@ocaml.doc ""]
type nonrec list_sync_configurations_input =
  {
  sync_type: sync_configuration_type ;
  repository_link_id: string ;
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_output =
  {
  next_token: string option ;
  repository_sync_definitions: repository_sync_definition list }[@@ocaml.doc
                                                                  ""]
type nonrec list_repository_sync_definitions_input =
  {
  sync_type: sync_configuration_type ;
  repository_link_id: string }[@@ocaml.doc ""]
type nonrec list_repository_links_output =
  {
  next_token: string option ;
  repository_links: repository_link_info list }[@@ocaml.doc ""]
type nonrec list_repository_links_input =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec host =
  {
  status_message: string option ;
  status: string option ;
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string option ;
  provider_type: provider_type option ;
  host_arn: string option ;
  name: string option }[@@ocaml.doc
                         "A resource that represents the infrastructure where a third-party provider is installed. The host is used when you create connections to an installed third-party provider type, such as GitHub Enterprise Server. You create one host for all connections to that provider.\n\n  A host created through the CLI or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by setting up the host in the console.\n  \n   "]
type nonrec list_hosts_output =
  {
  next_token: string option ;
  hosts: host list option }[@@ocaml.doc ""]
type nonrec list_hosts_input =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec connection_status =
  | ERROR 
  | AVAILABLE 
  | PENDING [@@ocaml.doc ""]
type nonrec connection =
  {
  host_arn: string option ;
  connection_status: connection_status option ;
  owner_account_id: string option ;
  provider_type: provider_type option ;
  connection_arn: string option ;
  connection_name: string option }[@@ocaml.doc
                                    "A resource that is used to connect third-party source providers with services like CodePipeline.\n\n Note: A connection created through CloudFormation, the CLI, or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by updating the connection in the console.\n "]
type nonrec list_connections_output =
  {
  next_token: string option ;
  connections: connection list option }[@@ocaml.doc ""]
type nonrec list_connections_input =
  {
  next_token: string option ;
  max_results: int option ;
  host_arn_filter: string option ;
  provider_type_filter: provider_type option }[@@ocaml.doc ""]
type nonrec get_sync_configuration_output =
  {
  sync_configuration: sync_configuration }[@@ocaml.doc ""]
type nonrec get_sync_configuration_input =
  {
  resource_name: string ;
  sync_type: sync_configuration_type }[@@ocaml.doc ""]
type nonrec get_sync_blocker_summary_output =
  {
  sync_blocker_summary: sync_blocker_summary }[@@ocaml.doc ""]
type nonrec get_sync_blocker_summary_input =
  {
  resource_name: string ;
  sync_type: sync_configuration_type }[@@ocaml.doc ""]
type nonrec get_resource_sync_status_output =
  {
  latest_sync: resource_sync_attempt ;
  latest_successful_sync: resource_sync_attempt option ;
  desired_state: revision option }[@@ocaml.doc ""]
type nonrec get_resource_sync_status_input =
  {
  sync_type: sync_configuration_type ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec get_repository_sync_status_output =
  {
  latest_sync: repository_sync_attempt }[@@ocaml.doc ""]
type nonrec get_repository_sync_status_input =
  {
  sync_type: sync_configuration_type ;
  repository_link_id: string ;
  branch: string }[@@ocaml.doc ""]
type nonrec get_repository_link_output =
  {
  repository_link_info: repository_link_info }[@@ocaml.doc ""]
type nonrec get_repository_link_input = {
  repository_link_id: string }[@@ocaml.doc ""]
type nonrec get_host_output =
  {
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string option ;
  provider_type: provider_type option ;
  status: string option ;
  name: string option }[@@ocaml.doc ""]
type nonrec get_host_input = {
  host_arn: string }[@@ocaml.doc ""]
type nonrec get_connection_output = {
  connection: connection option }[@@ocaml.doc ""]
type nonrec get_connection_input = {
  connection_arn: string }[@@ocaml.doc ""]
type nonrec delete_sync_configuration_output = unit
type nonrec delete_sync_configuration_input =
  {
  resource_name: string ;
  sync_type: sync_configuration_type }[@@ocaml.doc ""]
type nonrec delete_repository_link_output = unit
type nonrec delete_repository_link_input = {
  repository_link_id: string }[@@ocaml.doc ""]
type nonrec delete_host_output = unit
type nonrec delete_host_input = {
  host_arn: string }[@@ocaml.doc ""]
type nonrec delete_connection_output = unit
type nonrec delete_connection_input = {
  connection_arn: string }[@@ocaml.doc ""]
type nonrec create_sync_configuration_output =
  {
  sync_configuration: sync_configuration }[@@ocaml.doc ""]
type nonrec create_sync_configuration_input =
  {
  trigger_resource_update_on: trigger_resource_update_on option ;
  publish_deployment_status: publish_deployment_status option ;
  sync_type: sync_configuration_type ;
  role_arn: string ;
  resource_name: string ;
  repository_link_id: string ;
  config_file: string ;
  branch: string }[@@ocaml.doc ""]
type nonrec create_repository_link_output =
  {
  repository_link_info: repository_link_info }[@@ocaml.doc ""]
type nonrec create_repository_link_input =
  {
  tags: tag list option ;
  encryption_key_arn: string option ;
  repository_name: string ;
  owner_id: string ;
  connection_arn: string }[@@ocaml.doc ""]
type nonrec create_host_output =
  {
  tags: tag list option ;
  host_arn: string option }[@@ocaml.doc ""]
type nonrec create_host_input =
  {
  tags: tag list option ;
  vpc_configuration: vpc_configuration option ;
  provider_endpoint: string ;
  provider_type: provider_type ;
  name: string }[@@ocaml.doc ""]
type nonrec create_connection_output =
  {
  tags: tag list option ;
  connection_arn: string }[@@ocaml.doc ""]
type nonrec create_connection_input =
  {
  host_arn: string option ;
  tags: tag list option ;
  connection_name: string ;
  provider_type: provider_type option }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_vpc_configuration :
  ?tls_certificate:string ->
    security_group_ids:string list ->
      subnet_ids:string list -> vpc_id:string -> unit -> vpc_configuration
val make_sync_configuration :
  ?trigger_resource_update_on:trigger_resource_update_on ->
    ?publish_deployment_status:publish_deployment_status ->
      ?config_file:string ->
        sync_type:sync_configuration_type ->
          role_arn:string ->
            resource_name:string ->
              repository_name:string ->
                repository_link_id:string ->
                  provider_type:provider_type ->
                    owner_id:string ->
                      branch:string -> unit -> sync_configuration
val make_update_sync_configuration_output :
  sync_configuration:sync_configuration ->
    unit -> update_sync_configuration_output
val make_update_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
    ?publish_deployment_status:publish_deployment_status ->
      ?role_arn:string ->
        ?repository_link_id:string ->
          ?config_file:string ->
            ?branch:string ->
              sync_type:sync_configuration_type ->
                resource_name:string ->
                  unit -> update_sync_configuration_input
val make_sync_blocker_context :
  value:string -> key:string -> unit -> sync_blocker_context
val make_sync_blocker :
  ?resolved_at:CoreTypes.Timestamp.t ->
    ?resolved_reason:string ->
      ?contexts:sync_blocker_context list ->
        created_at:CoreTypes.Timestamp.t ->
          created_reason:string ->
            status:blocker_status ->
              type_:blocker_type -> id:string -> unit -> sync_blocker
val make_update_sync_blocker_output :
  ?parent_resource_name:string ->
    sync_blocker:sync_blocker ->
      resource_name:string -> unit -> update_sync_blocker_output
val make_update_sync_blocker_input :
  resolved_reason:string ->
    resource_name:string ->
      sync_type:sync_configuration_type ->
        id:string -> unit -> update_sync_blocker_input
val make_repository_link_info :
  ?encryption_key_arn:string ->
    repository_name:string ->
      repository_link_id:string ->
        repository_link_arn:string ->
          provider_type:provider_type ->
            owner_id:string ->
              connection_arn:string -> unit -> repository_link_info
val make_update_repository_link_output :
  repository_link_info:repository_link_info ->
    unit -> update_repository_link_output
val make_update_repository_link_input :
  ?encryption_key_arn:string ->
    ?connection_arn:string ->
      repository_link_id:string -> unit -> update_repository_link_input
val make_update_host_output : unit -> update_host_output
val make_update_host_input :
  ?vpc_configuration:vpc_configuration ->
    ?provider_endpoint:string -> host_arn:string -> unit -> update_host_input
val make_untag_resource_output : unit -> untag_resource_output
val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit -> untag_resource_input
val make_tag_resource_output : unit -> tag_resource_output
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_input :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_input
val make_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
    ?parent_resource_name:string ->
      resource_name:string -> unit -> sync_blocker_summary
val make_revision :
  sha:string ->
    provider_type:provider_type ->
      repository_name:string ->
        owner_id:string ->
          directory:string -> branch:string -> unit -> revision
val make_resource_sync_event :
  ?external_id:string ->
    type_:string ->
      time:CoreTypes.Timestamp.t ->
        event:string -> unit -> resource_sync_event
val make_resource_sync_attempt :
  target:string ->
    target_revision:revision ->
      status:resource_sync_status ->
        started_at:CoreTypes.Timestamp.t ->
          initial_revision:revision ->
            events:resource_sync_event list -> unit -> resource_sync_attempt
val make_repository_sync_event :
  ?external_id:string ->
    type_:string ->
      time:CoreTypes.Timestamp.t ->
        event:string -> unit -> repository_sync_event
val make_repository_sync_definition :
  target:string ->
    parent:string ->
      directory:string -> branch:string -> unit -> repository_sync_definition
val make_repository_sync_attempt :
  events:repository_sync_event list ->
    status:repository_sync_status ->
      started_at:CoreTypes.Timestamp.t -> unit -> repository_sync_attempt
val make_list_tags_for_resource_output :
  ?tags:tag list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:string -> unit -> list_tags_for_resource_input
val make_list_sync_configurations_output :
  ?next_token:string ->
    sync_configurations:sync_configuration list ->
      unit -> list_sync_configurations_output
val make_list_sync_configurations_input :
  ?next_token:string ->
    ?max_results:int ->
      sync_type:sync_configuration_type ->
        repository_link_id:string -> unit -> list_sync_configurations_input
val make_list_repository_sync_definitions_output :
  ?next_token:string ->
    repository_sync_definitions:repository_sync_definition list ->
      unit -> list_repository_sync_definitions_output
val make_list_repository_sync_definitions_input :
  sync_type:sync_configuration_type ->
    repository_link_id:string ->
      unit -> list_repository_sync_definitions_input
val make_list_repository_links_output :
  ?next_token:string ->
    repository_links:repository_link_info list ->
      unit -> list_repository_links_output
val make_list_repository_links_input :
  ?next_token:string ->
    ?max_results:int -> unit -> list_repository_links_input
val make_host :
  ?status_message:string ->
    ?status:string ->
      ?vpc_configuration:vpc_configuration ->
        ?provider_endpoint:string ->
          ?provider_type:provider_type ->
            ?host_arn:string -> ?name:string -> unit -> host
val make_list_hosts_output :
  ?next_token:string -> ?hosts:host list -> unit -> list_hosts_output
val make_list_hosts_input :
  ?next_token:string -> ?max_results:int -> unit -> list_hosts_input
val make_connection :
  ?host_arn:string ->
    ?connection_status:connection_status ->
      ?owner_account_id:string ->
        ?provider_type:provider_type ->
          ?connection_arn:string ->
            ?connection_name:string -> unit -> connection
val make_list_connections_output :
  ?next_token:string ->
    ?connections:connection list -> unit -> list_connections_output
val make_list_connections_input :
  ?next_token:string ->
    ?max_results:int ->
      ?host_arn_filter:string ->
        ?provider_type_filter:provider_type -> unit -> list_connections_input
val make_get_sync_configuration_output :
  sync_configuration:sync_configuration ->
    unit -> get_sync_configuration_output
val make_get_sync_configuration_input :
  resource_name:string ->
    sync_type:sync_configuration_type -> unit -> get_sync_configuration_input
val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary ->
    unit -> get_sync_blocker_summary_output
val make_get_sync_blocker_summary_input :
  resource_name:string ->
    sync_type:sync_configuration_type ->
      unit -> get_sync_blocker_summary_input
val make_get_resource_sync_status_output :
  ?latest_successful_sync:resource_sync_attempt ->
    ?desired_state:revision ->
      latest_sync:resource_sync_attempt ->
        unit -> get_resource_sync_status_output
val make_get_resource_sync_status_input :
  sync_type:sync_configuration_type ->
    resource_name:string -> unit -> get_resource_sync_status_input
val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt ->
    unit -> get_repository_sync_status_output
val make_get_repository_sync_status_input :
  sync_type:sync_configuration_type ->
    repository_link_id:string ->
      branch:string -> unit -> get_repository_sync_status_input
val make_get_repository_link_output :
  repository_link_info:repository_link_info ->
    unit -> get_repository_link_output
val make_get_repository_link_input :
  repository_link_id:string -> unit -> get_repository_link_input
val make_get_host_output :
  ?vpc_configuration:vpc_configuration ->
    ?provider_endpoint:string ->
      ?provider_type:provider_type ->
        ?status:string -> ?name:string -> unit -> get_host_output
val make_get_host_input : host_arn:string -> unit -> get_host_input
val make_get_connection_output :
  ?connection:connection -> unit -> get_connection_output
val make_get_connection_input :
  connection_arn:string -> unit -> get_connection_input
val make_delete_sync_configuration_output :
  unit -> delete_sync_configuration_output
val make_delete_sync_configuration_input :
  resource_name:string ->
    sync_type:sync_configuration_type ->
      unit -> delete_sync_configuration_input
val make_delete_repository_link_output :
  unit -> delete_repository_link_output
val make_delete_repository_link_input :
  repository_link_id:string -> unit -> delete_repository_link_input
val make_delete_host_output : unit -> delete_host_output
val make_delete_host_input : host_arn:string -> unit -> delete_host_input
val make_delete_connection_output : unit -> delete_connection_output
val make_delete_connection_input :
  connection_arn:string -> unit -> delete_connection_input
val make_create_sync_configuration_output :
  sync_configuration:sync_configuration ->
    unit -> create_sync_configuration_output
val make_create_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
    ?publish_deployment_status:publish_deployment_status ->
      sync_type:sync_configuration_type ->
        role_arn:string ->
          resource_name:string ->
            repository_link_id:string ->
              config_file:string ->
                branch:string -> unit -> create_sync_configuration_input
val make_create_repository_link_output :
  repository_link_info:repository_link_info ->
    unit -> create_repository_link_output
val make_create_repository_link_input :
  ?tags:tag list ->
    ?encryption_key_arn:string ->
      repository_name:string ->
        owner_id:string ->
          connection_arn:string -> unit -> create_repository_link_input
val make_create_host_output :
  ?tags:tag list -> ?host_arn:string -> unit -> create_host_output
val make_create_host_input :
  ?tags:tag list ->
    ?vpc_configuration:vpc_configuration ->
      provider_endpoint:string ->
        provider_type:provider_type ->
          name:string -> unit -> create_host_input
val make_create_connection_output :
  ?tags:tag list -> connection_arn:string -> unit -> create_connection_output
val make_create_connection_input :
  ?host_arn:string ->
    ?tags:tag list ->
      ?provider_type:provider_type ->
        connection_name:string -> unit -> create_connection_input(** {1:operations Operations} *)

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_input ->
        (create_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
  (** Creates a connection that can then be given to other Amazon Web Services services like CodePipeline so that it can access third-party code repositories. The connection is in pending status until the third-party connection handshake is completed from the console.
 *)

  
end

module CreateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      create_host_input ->
        (create_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** Creates a resource that represents the infrastructure where a third-party provider is installed. The host is used when you create connections to an installed third-party provider type, such as GitHub Enterprise Server. You create one host for all connections to that provider.

  A host created through the CLI or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by setting up the host in the console.
  
    *)

  
end

module CreateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      create_repository_link_input ->
        (create_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Creates a link to a specified external Git repository. A repository link allows Git sync to monitor and sync changes to files in a specified Git repository.
 *)

  
end

module CreateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sync_configuration_input ->
        (create_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Creates a sync configuration which allows Amazon Web Services to sync content from a Git repository to update a specified Amazon Web Services resource. Parameters for the sync configuration are determined by the sync type.
 *)

  
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_input ->
        (delete_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** The connection to be deleted.
 *)

  
end

module DeleteHost : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_host_input ->
        (delete_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
  (** The host to be deleted. Before you delete a host, all connections associated to the host must be deleted.

  A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or VPC_CONFIG_DELETING state.
  
    *)

  
end

module DeleteRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_repository_link_input ->
        (delete_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
            | `ThrottlingException of throttling_exception
            | `UnsupportedProviderTypeException of unsupported_provider_type_exception
            
        ]
      ) result
  (** Deletes the association between your connection and a specified external Git repository.
 *)

  
end

module DeleteSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sync_configuration_input ->
        (delete_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Deletes the sync configuration for a specified repository and connection.
 *)

  
end

module GetConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_input ->
        (get_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
  (** Returns the connection ARN and details such as status, owner, and provider type.
 *)

  
end

module GetHost : sig
  val request :
    Smaws_Lib.Context.t ->
      get_host_input ->
        (get_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
  (** Returns the host ARN and details such as status, provider type, endpoint, and, if applicable, the VPC configuration.
 *)

  
end

module GetRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_link_input ->
        (get_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Returns details about a repository link. A repository link allows Git sync to monitor and sync changes from files in a specified Git repository.
 *)

  
end

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_sync_status_input ->
        (get_repository_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Returns details about the sync status for a repository. A repository sync uses Git sync to push and pull changes from your remote repository.
 *)

  
end

module GetResourceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_sync_status_input ->
        (get_resource_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Returns the status of the sync with the Git repository for a specific Amazon Web Services resource.
 *)

  
end

module GetSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_blocker_summary_input ->
        (get_sync_blocker_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Returns a list of the most recent sync blockers.
 *)

  
end

module GetSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_configuration_input ->
        (get_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Returns details about a sync configuration, including the sync type and resource name. A sync configuration allows the configuration to sync (push and pull) changes from the remote repository for a specified branch in a Git repository.
 *)

  
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_input ->
        (list_connections_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Lists the connections associated with your account.
 *)

  
end

module ListHosts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_hosts_input ->
        (list_hosts_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** Lists the hosts associated with your account.
 *)

  
end

module ListRepositoryLinks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_links_input ->
        (list_repository_links_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Lists the repository links created for connections in your account.
 *)

  
end

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_sync_definitions_input ->
        (list_repository_sync_definitions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Lists the repository sync definitions for repository links in your account.
 *)

  
end

module ListSyncConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sync_configurations_input ->
        (list_sync_configurations_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Returns a list of sync configurations for a specified repository.
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
  (** Gets the set of key-value pairs (metadata) that are used to manage the resource.
 *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Adds to or modifies the tags of the given resource. Tags are metadata that can be used to manage a resource.
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
  (** Removes tags from an Amazon Web Services resource.
 *)

  
end

module UpdateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      update_host_input ->
        (update_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Updates a specified host with the provided configurations.
 *)

  
end

module UpdateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      update_repository_link_input ->
        (update_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
  (** Updates the association between your connection and a specified external Git repository. A repository link allows Git sync to monitor and sync changes to files in a specified Git repository.
 *)

  
end

module UpdateSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_blocker_input ->
        (update_sync_blocker_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
            | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** Allows you to update the status of a sync blocker, resolving the blocker and allowing syncing to continue.
 *)

  
end

module UpdateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_configuration_input ->
        (update_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
  (** Updates the sync configuration for your connection and a specified external Git repository.
 *)

  
end

