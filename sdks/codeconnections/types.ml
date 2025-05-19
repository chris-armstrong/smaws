open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "codeconnections";
      endpointPrefix = "codeconnections";
      version = "2023-12-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
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
  provider_type: provider_type option }[@@ocaml.doc ""]