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
  tls_certificate: string option
    [@ocaml.doc
      "The value of the Transport Layer Security (TLS) certificate associated with the infrastructure where your provider type is installed.\n"];
  security_group_ids: string list
    [@ocaml.doc
      "The ID of the security group or security groups associated with the Amazon VPC connected to the infrastructure where your provider type is installed.\n"];
  subnet_ids: string list
    [@ocaml.doc
      "The ID of the subnet or subnets associated with the Amazon VPC connected to the infrastructure where your provider type is installed.\n"];
  vpc_id: string
    [@ocaml.doc
      "The ID of the Amazon VPC connected to the infrastructure where your provider type is installed.\n"]}
[@@ocaml.doc "The VPC configuration provisioned for the host.\n"]
type nonrec provider_type =
  | GITLAB_SELF_MANAGED [@ocaml.doc ""]
  | GITLAB [@ocaml.doc ""]
  | GITHUB_ENTERPRISE_SERVER [@ocaml.doc ""]
  | GITHUB [@ocaml.doc ""]
  | BITBUCKET [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sync_configuration_type =
  | CFN_STACK_SYNC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec publish_deployment_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec trigger_resource_update_on =
  | FILE_CHANGE [@ocaml.doc ""]
  | ANY_CHANGE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sync_configuration =
  {
  trigger_resource_update_on: trigger_resource_update_on option
    [@ocaml.doc "When to trigger Git sync to begin the stack update.\n"];
  publish_deployment_status: publish_deployment_status option
    [@ocaml.doc
      "Whether to enable or disable publishing of deployment status to source providers.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc "The type of sync for a specific sync configuration.\n"];
  role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role associated with a specific sync configuration.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the connection resource associated with a specific sync configuration.\n"];
  repository_name: string
    [@ocaml.doc
      "The name of the repository associated with a specific sync configuration.\n"];
  repository_link_id: string
    [@ocaml.doc
      "The ID of the repository link associated with a specific sync configuration.\n"];
  provider_type: provider_type
    [@ocaml.doc
      "The connection provider type associated with a specific sync configuration, such as GitHub.\n"];
  owner_id: string
    [@ocaml.doc
      "The owner ID for the repository associated with a specific sync configuration, such as the owner ID in GitHub.\n"];
  config_file: string option
    [@ocaml.doc
      "The file path to the configuration file associated with a specific sync configuration. The path should point to an actual file in the sync configurations linked repository.\n"];
  branch: string
    [@ocaml.doc
      "The branch associated with a specific sync configuration.\n"]}
[@@ocaml.doc
  "Information, such as repository, branch, provider, and resource names for a specific sync configuration.\n"]
type nonrec update_sync_configuration_output =
  {
  sync_configuration: sync_configuration
    [@ocaml.doc
      "The information returned for the sync configuration to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_sync_configuration_input =
  {
  trigger_resource_update_on: trigger_resource_update_on option
    [@ocaml.doc "When to trigger Git sync to begin the stack update.\n"];
  publish_deployment_status: publish_deployment_status option
    [@ocaml.doc
      "Whether to enable or disable publishing of deployment status to source providers.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc "The sync type for the sync configuration to be updated.\n"];
  role_arn: string option
    [@ocaml.doc
      "The ARN of the IAM role for the sync configuration to be updated.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource for the sync configuration to be updated.\n"];
  repository_link_id: string option
    [@ocaml.doc
      "The ID of the repository link for the sync configuration to be updated.\n"];
  config_file: string option
    [@ocaml.doc
      "The configuration file for the sync configuration to be updated.\n"];
  branch: string option
    [@ocaml.doc "The branch for the sync configuration to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_out_of_sync_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The update is out of sync. Try syncing again.\n"]
type nonrec throttling_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was denied due to request throttling.\n"]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Resource not found. Verify the connection resource ARN and try again.\n"]
type nonrec invalid_input_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The input is not valid. Verify that the action is typed correctly.\n"]
type nonrec internal_server_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Received an internal server exception. Try again later.\n"]
type nonrec concurrent_modification_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception thrown as a result of concurrent modification to an application. For example, two individuals attempting to edit the same application at the same time. \n"]
type nonrec access_denied_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You do not have sufficient access to perform this action.\n"]
type nonrec blocker_type =
  | AUTOMATED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec blocker_status =
  | RESOLVED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sync_blocker_context =
  {
  value: string
    [@ocaml.doc
      "The value provided for a context key-value pair for a specific sync blocker.\n"];
  key: string
    [@ocaml.doc
      "The key provided for a context key-value pair for a specific sync blocker.\n"]}
[@@ocaml.doc "The context for a specific sync blocker.\n"]
type nonrec sync_blocker =
  {
  resolved_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time that a specific sync blocker was resolved.\n"];
  resolved_reason: string option
    [@ocaml.doc "The resolved reason for a specific sync blocker.\n"];
  contexts: sync_blocker_context list option
    [@ocaml.doc "The contexts for a specific sync blocker.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The creation time for a specific sync blocker.\n"];
  created_reason: string
    [@ocaml.doc "The provided reason for a specific sync blocker.\n"];
  status: blocker_status
    [@ocaml.doc "The status for a specific sync blocker.\n"];
  type_: blocker_type [@ocaml.doc "The sync blocker type.\n"];
  id: string [@ocaml.doc "The ID for a specific sync blocker.\n"]}[@@ocaml.doc
                                                                    "Information about a blocker for a sync event.\n"]
type nonrec update_sync_blocker_output =
  {
  sync_blocker: sync_blocker
    [@ocaml.doc "Information about the sync blocker to be updated.\n"];
  parent_resource_name: string option
    [@ocaml.doc "The parent resource name for the sync blocker.\n"];
  resource_name: string
    [@ocaml.doc "The resource name for the sync blocker.\n"]}[@@ocaml.doc ""]
type nonrec update_sync_blocker_input =
  {
  resolved_reason: string
    [@ocaml.doc "The reason for resolving the sync blocker.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the resource for the sync blocker to be updated.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc "The sync type of the sync blocker to be updated.\n"];
  id: string [@ocaml.doc "The ID of the sync blocker to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec sync_blocker_does_not_exist_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Unable to continue. The sync blocker does not exist.\n"]
type nonrec retry_latest_commit_failed_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Retrying the latest commit failed. Try again later.\n"]
type nonrec repository_link_info =
  {
  repository_name: string
    [@ocaml.doc
      "The name of the repository associated with the repository link.\n"];
  repository_link_id: string [@ocaml.doc "The ID of the repository link.\n"];
  repository_link_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the repository link.\n"];
  provider_type: provider_type
    [@ocaml.doc
      "The provider type for the connection, such as GitHub, associated with the repository link.\n"];
  owner_id: string
    [@ocaml.doc
      "The owner ID for the repository associated with the repository link, such as the owner ID in GitHub.\n"];
  encryption_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the encryption key for the repository associated with the repository link.\n"];
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the connection associated with the repository link.\n"]}
[@@ocaml.doc
  "Information about the repository link resource, such as the repository link ARN, the associated connection ARN, encryption key ARN, and owner ID.\n"]
type nonrec update_repository_link_output =
  {
  repository_link_info: repository_link_info
    [@ocaml.doc "Information about the repository link to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_repository_link_input =
  {
  repository_link_id: string
    [@ocaml.doc "The ID of the repository link to be updated.\n"];
  encryption_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the encryption key for the repository link to be updated.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the connection for the repository link to be updated. The updated connection ARN must have the same providerType (such as GitHub) as the original connection ARN for the repo link.\n"]}
[@@ocaml.doc ""]
type nonrec conditional_check_failed_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The conditional check failed. Try again later.\n"]
type nonrec update_host_input =
  {
  vpc_configuration: vpc_configuration option
    [@ocaml.doc
      "The VPC configuration of the host to be updated. A VPC must be configured and the infrastructure to be represented by the host must already be connected to the VPC.\n"];
  provider_endpoint: string option
    [@ocaml.doc "The URL or endpoint of the host to be updated.\n"];
  host_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the host to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec unsupported_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation is not supported. Check the connection status and try again.\n"]
type nonrec resource_unavailable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Resource not found. Verify the ARN for the host resource and try again.\n"]
type nonrec conflict_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Two conflicting operations have been made on the same resource.\n"]
type nonrec untag_resource_input =
  {
  tag_keys: string list
    [@ocaml.doc
      "The list of keys for the tags to be removed from the resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]}
[@@ocaml.doc ""]
type nonrec unsupported_provider_type_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified provider type is not supported for connections.\n"]
type nonrec tag =
  {
  value: string [@ocaml.doc "The tag's value.\n"];
  key: string [@ocaml.doc "The tag's key.\n"]}[@@ocaml.doc
                                                "A tag is a key-value pair that is used to manage the resource.\n\n This tag is available for use by Amazon Web Services services that support tags.\n "]
type nonrec tag_resource_input =
  {
  tags: tag list
    [@ocaml.doc "The tags you want to modify or add to the resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.\n"]}
[@@ocaml.doc ""]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exceeded the maximum limit for connections.\n"]
type nonrec sync_configuration_still_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Unable to continue. The sync blocker still exists.\n"]
type nonrec sync_blocker_summary =
  {
  latest_blockers: sync_blocker list option
    [@ocaml.doc "The latest events for a sync blocker summary.\n"];
  parent_resource_name: string option
    [@ocaml.doc "The parent resource name for a sync blocker summary.\n"];
  resource_name: string
    [@ocaml.doc "The resource name for sync blocker summary.\n"]}[@@ocaml.doc
                                                                   "A summary for sync blockers.\n"]
type nonrec revision =
  {
  sha: string
    [@ocaml.doc "The SHA, such as the commit ID, for a specific revision.\n"];
  provider_type: provider_type
    [@ocaml.doc "The provider type for a revision, such as GitHub.\n"];
  repository_name: string
    [@ocaml.doc "The repository name for a specific revision.\n"];
  owner_id: string
    [@ocaml.doc
      "The owner ID for a specific revision, such as the GitHub owner ID for a GitHub repository.\n"];
  directory: string
    [@ocaml.doc "The directory, if any, for a specific revision.\n"];
  branch: string [@ocaml.doc "The branch name for a specific revision.\n"]}
[@@ocaml.doc
  "Information about the revision for a specific sync event, such as the branch, owner ID, and name of the repository.\n"]
type nonrec resource_sync_status =
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | INITIATED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_sync_event =
  {
  type_: string [@ocaml.doc "The type of resource sync event.\n"];
  time: CoreTypes.Timestamp.t
    [@ocaml.doc "The time that a resource sync event occurred.\n"];
  external_id: string option
    [@ocaml.doc "The ID for a resource sync event.\n"];
  event: string [@ocaml.doc "The event for a resource sync event.\n"]}
[@@ocaml.doc
  "Information about a resource sync event for the resource associated with a sync configuration.\n"]
type nonrec resource_sync_attempt =
  {
  target: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource that is attempted to be synchronized.\n"];
  target_revision: revision
    [@ocaml.doc
      "The desired state of the resource as defined in the resource's [config-file] in the linked repository. Git sync attempts to update the resource to this state.\n"];
  status: resource_sync_status
    [@ocaml.doc
      "The status for a resource sync attempt. The follow are valid statuses:\n\n {ul\n       {-  SYNC-INITIATED - A resource sync attempt has been created and will begin soon.\n           \n            }\n       {-  SYNCING - Syncing has started and work is being done to reconcile state.\n           \n            }\n       {-  SYNCED - Syncing has completed successfully.\n           \n            }\n       {-  SYNC_FAILED - A resource sync attempt has failed.\n           \n            }\n       }\n  "];
  started_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The start time for a resource sync attempt.\n"];
  initial_revision: revision
    [@ocaml.doc
      "The current state of the resource as defined in the resource's [config-file] in the linked repository.\n"];
  events: resource_sync_event list
    [@ocaml.doc "The events related to a resource sync attempt.\n"]}[@@ocaml.doc
                                                                    "Information about a resource sync attempt.\n"]
type nonrec resource_already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Unable to create resource. Resource already exists.\n"]
type nonrec repository_sync_status =
  | QUEUED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | INITIATED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec repository_sync_event =
  {
  type_: string [@ocaml.doc "The event type for a repository sync event.\n"];
  time: CoreTypes.Timestamp.t
    [@ocaml.doc "The time that a repository sync event occurred.\n"];
  external_id: string option
    [@ocaml.doc "The ID for a repository sync event.\n"];
  event: string [@ocaml.doc "A description of a repository sync event.\n"]}
[@@ocaml.doc "Information about a repository sync event.\n"]
type nonrec repository_sync_definition =
  {
  target: string
    [@ocaml.doc
      "The target resource specified for a repository sync definition. In some cases, such as CFN_STACK_SYNC, the parent and target resource are the same.\n"];
  parent: string
    [@ocaml.doc
      "The parent resource specified for a repository sync definition.\n"];
  directory: string
    [@ocaml.doc
      "The configuration file for a repository sync definition. This value comes from creating or updating the [config-file] field of a [sync-configuration].\n"];
  branch: string
    [@ocaml.doc "The branch specified for a repository sync definition.\n"]}
[@@ocaml.doc "The definition for a repository with a sync configuration.\n"]
type nonrec repository_sync_attempt =
  {
  events: repository_sync_event list
    [@ocaml.doc "The events associated with a specific sync attempt.\n"];
  status: repository_sync_status
    [@ocaml.doc
      "The status of a specific sync attempt. The following are valid statuses:\n\n {ul\n       {-  INITIATED - A repository sync attempt has been created and will begin soon.\n           \n            }\n       {-  IN_PROGRESS - A repository sync attempt has started and work is being done to reconcile the branch.\n           \n            }\n       {-  SUCCEEDED - The repository sync attempt has completed successfully.\n           \n            }\n       {-  FAILED - The repository sync attempt has failed.\n           \n            }\n       {-  QUEUED - The repository sync attempt didn't execute and was queued.\n           \n            }\n       }\n  "];
  started_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The start time of a specific sync attempt.\n"]}[@@ocaml.doc
                                                                  "Information about a repository sync attempt for a repository with a sync configuration.\n"]
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of tag key and value pairs associated with the specified resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource for which you want to get information about tags, if any.\n"]}
[@@ocaml.doc ""]
type nonrec list_sync_configurations_output =
  {
  next_token: string option
    [@ocaml.doc
      "An enumeration token that allows the operation to batch the next results of the operation.\n"];
  sync_configurations: sync_configuration list
    [@ocaml.doc
      "The list of repository sync definitions returned by the request.\n"]}
[@@ocaml.doc ""]
type nonrec list_sync_configurations_input =
  {
  sync_type: sync_configuration_type
    [@ocaml.doc
      "The sync type for the requested list of sync configurations.\n"];
  repository_link_id: string
    [@ocaml.doc
      "The ID of the repository link for the requested list of sync configurations.\n"];
  next_token: string option
    [@ocaml.doc
      "An enumeration token that allows the operation to batch the results of the operation.\n"];
  max_results: int option
    [@ocaml.doc
      "A non-zero, non-negative integer used to limit the number of returned results.\n"]}
[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_output =
  {
  next_token: string option
    [@ocaml.doc
      "An enumeration token that, when provided in a request, returns the next batch of the results.\n"];
  repository_sync_definitions: repository_sync_definition list
    [@ocaml.doc
      "The list of repository sync definitions returned by the request. A [RepositorySyncDefinition] is a mapping from a repository branch to all the Amazon Web Services resources that are being synced from that branch.\n"]}
[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_input =
  {
  sync_type: sync_configuration_type
    [@ocaml.doc
      "The sync type of the repository link for the the sync definition for which you want to retrieve information.\n"];
  repository_link_id: string
    [@ocaml.doc
      "The ID of the repository link for the sync definition for which you want to retrieve information.\n"]}
[@@ocaml.doc ""]
type nonrec list_repository_links_output =
  {
  next_token: string option
    [@ocaml.doc
      "An enumeration token that allows the operation to batch the results of the operation. \n"];
  repository_links: repository_link_info list
    [@ocaml.doc
      "Lists the repository links called by the list repository links operation.\n"]}
[@@ocaml.doc ""]
type nonrec list_repository_links_input =
  {
  next_token: string option
    [@ocaml.doc
      " An enumeration token that, when provided in a request, returns the next batch of the results.\n"];
  max_results: int option
    [@ocaml.doc
      " A non-zero, non-negative integer used to limit the number of returned results.\n"]}
[@@ocaml.doc ""]
type nonrec host =
  {
  status_message: string option
    [@ocaml.doc "The status description for the host.\n"];
  status: string option
    [@ocaml.doc
      "The status of the host, such as PENDING, AVAILABLE, VPC_CONFIG_DELETING, VPC_CONFIG_INITIALIZING, and VPC_CONFIG_FAILED_INITIALIZATION.\n"];
  vpc_configuration: vpc_configuration option
    [@ocaml.doc "The VPC configuration provisioned for the host.\n"];
  provider_endpoint: string option
    [@ocaml.doc
      "The endpoint of the infrastructure where your provider type is installed.\n"];
  provider_type: provider_type option
    [@ocaml.doc
      "The name of the installed provider to be associated with your connection. The host resource represents the infrastructure where your provider type is installed. The valid provider type is GitHub Enterprise Server.\n"];
  host_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the host.\n"];
  name: string option [@ocaml.doc "The name of the host.\n"]}[@@ocaml.doc
                                                               "A resource that represents the infrastructure where a third-party provider is installed. The host is used when you create connections to an installed third-party provider type, such as GitHub Enterprise Server. You create one host for all connections to that provider.\n\n  A host created through the CLI or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by setting up the host in the console.\n  \n   "]
type nonrec list_hosts_output =
  {
  next_token: string option
    [@ocaml.doc
      "A token that can be used in the next [ListHosts] call. To view all items in the list, continue to call this operation with each subsequent token until no more [nextToken] values are returned.\n"];
  hosts: host list option
    [@ocaml.doc
      "A list of hosts and the details for each host, such as status, endpoint, and provider type.\n"]}
[@@ocaml.doc ""]
type nonrec list_hosts_input =
  {
  next_token: string option
    [@ocaml.doc
      "The token that was returned from the previous [ListHosts] call, which can be used to return the next set of hosts in the list.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned [nextToken] value.\n"]}
[@@ocaml.doc ""]
type nonrec connection_status =
  | ERROR [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec connection =
  {
  host_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the host associated with the connection.\n"];
  connection_status: connection_status option
    [@ocaml.doc "The current status of the connection. \n"];
  owner_account_id: string option
    [@ocaml.doc
      "The identifier of the external provider where your third-party code repository is configured. For Bitbucket, this is the account ID of the owner of the Bitbucket repository.\n"];
  provider_type: provider_type option
    [@ocaml.doc
      "The name of the external provider where your third-party code repository is configured.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the connection. The ARN is used as the connection reference when the connection is shared between Amazon Web Services.\n\n  The ARN is never reused if the connection is deleted.\n  \n   "];
  connection_name: string option
    [@ocaml.doc
      "The name of the connection. Connection names must be unique in an Amazon Web Services account.\n"]}
[@@ocaml.doc
  "A resource that is used to connect third-party source providers with services like CodePipeline.\n\n Note: A connection created through CloudFormation, the CLI, or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by updating the connection in the console.\n "]
type nonrec list_connections_output =
  {
  next_token: string option
    [@ocaml.doc
      "A token that can be used in the next [ListConnections] call. To view all items in the list, continue to call this operation with each subsequent token until no more [nextToken] values are returned.\n"];
  connections: connection list option
    [@ocaml.doc
      "A list of connections and the details for each connection, such as status, owner, and provider type.\n"]}
[@@ocaml.doc ""]
type nonrec list_connections_input =
  {
  next_token: string option
    [@ocaml.doc
      "The token that was returned from the previous [ListConnections] call, which can be used to return the next set of connections in the list.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned [nextToken] value.\n"];
  host_arn_filter: string option
    [@ocaml.doc
      "Filters the list of connections to those associated with a specified host.\n"];
  provider_type_filter: provider_type option
    [@ocaml.doc
      "Filters the list of connections to those associated with a specified provider, such as Bitbucket.\n"]}
[@@ocaml.doc ""]
type nonrec get_sync_configuration_output =
  {
  sync_configuration: sync_configuration
    [@ocaml.doc
      "The details about the sync configuration for which you want to retrieve information.\n"]}
[@@ocaml.doc ""]
type nonrec get_sync_configuration_input =
  {
  resource_name: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource for the sync configuration for which you want to retrieve information.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc
      "The sync type for the sync configuration for which you want to retrieve information.\n"]}
[@@ocaml.doc ""]
type nonrec get_sync_blocker_summary_output =
  {
  sync_blocker_summary: sync_blocker_summary
    [@ocaml.doc "The list of sync blockers for a specified resource.\n"]}
[@@ocaml.doc ""]
type nonrec get_sync_blocker_summary_input =
  {
  resource_name: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource currently blocked from automatically being synced from a Git repository.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc "The sync type for the sync blocker summary.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec get_resource_sync_status_output =
  {
  latest_sync: resource_sync_attempt
    [@ocaml.doc
      "The latest sync for the sync status with the Git repository, whether successful or not.\n"];
  latest_successful_sync: resource_sync_attempt option
    [@ocaml.doc
      "The latest successful sync for the sync status with the Git repository.\n"];
  desired_state: revision option
    [@ocaml.doc
      "The desired state of the Amazon Web Services resource for the sync status with the Git repository.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_sync_status_input =
  {
  sync_type: sync_configuration_type
    [@ocaml.doc
      "The sync type for the sync status with the Git repository.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource for the sync status with the Git repository.\n"]}
[@@ocaml.doc ""]
type nonrec get_repository_sync_status_output =
  {
  latest_sync: repository_sync_attempt
    [@ocaml.doc
      "The status of the latest sync returned for a specified repository and branch.\n"]}
[@@ocaml.doc ""]
type nonrec get_repository_sync_status_input =
  {
  sync_type: sync_configuration_type
    [@ocaml.doc "The sync type of the requested sync status.\n"];
  repository_link_id: string
    [@ocaml.doc
      "The repository link ID for the requested repository sync status.\n"];
  branch: string
    [@ocaml.doc
      "The branch of the repository link for the requested repository sync status.\n"]}
[@@ocaml.doc ""]
type nonrec get_repository_link_output =
  {
  repository_link_info: repository_link_info
    [@ocaml.doc
      "The information returned for a specified repository link.\n"]}
[@@ocaml.doc ""]
type nonrec get_repository_link_input =
  {
  repository_link_id: string
    [@ocaml.doc "The ID of the repository link to get.\n"]}[@@ocaml.doc ""]
type nonrec get_host_output =
  {
  vpc_configuration: vpc_configuration option
    [@ocaml.doc "The VPC configuration of the requested host.\n"];
  provider_endpoint: string option
    [@ocaml.doc
      "The endpoint of the infrastructure represented by the requested host.\n"];
  provider_type: provider_type option
    [@ocaml.doc
      "The provider type of the requested host, such as GitHub Enterprise Server.\n"];
  status: string option [@ocaml.doc "The status of the requested host.\n"];
  name: string option [@ocaml.doc "The name of the requested host.\n"]}
[@@ocaml.doc ""]
type nonrec get_host_input =
  {
  host_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the requested host.\n"]}
[@@ocaml.doc ""]
type nonrec get_connection_output =
  {
  connection: connection option
    [@ocaml.doc
      "The connection details, such as status, owner, and provider type.\n"]}
[@@ocaml.doc ""]
type nonrec get_connection_input =
  {
  connection_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of a connection.\n"]}
[@@ocaml.doc ""]
type nonrec delete_sync_configuration_input =
  {
  resource_name: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource associated with the sync configuration to be deleted.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc "The type of sync configuration to be deleted.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_repository_link_input =
  {
  repository_link_id: string
    [@ocaml.doc "The ID of the repository link to be deleted.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_host_input =
  {
  host_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the host to be deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_connection_input =
  {
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the connection to be deleted.\n\n  The ARN is never reused if the connection is deleted.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec create_sync_configuration_output =
  {
  sync_configuration: sync_configuration
    [@ocaml.doc
      "The created sync configuration for the connection. A sync configuration allows Amazon Web Services to sync content from a Git repository to update a specified Amazon Web Services resource. \n"]}
[@@ocaml.doc ""]
type nonrec create_sync_configuration_input =
  {
  trigger_resource_update_on: trigger_resource_update_on option
    [@ocaml.doc "When to trigger Git sync to begin the stack update.\n"];
  publish_deployment_status: publish_deployment_status option
    [@ocaml.doc
      "Whether to enable or disable publishing of deployment status to source providers.\n"];
  sync_type: sync_configuration_type
    [@ocaml.doc "The type of sync configuration.\n"];
  role_arn: string
    [@ocaml.doc
      "The ARN of the IAM role that grants permission for Amazon Web Services to use Git sync to update a given Amazon Web Services resource on your behalf.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the Amazon Web Services resource (for example, a CloudFormation stack in the case of CFN_STACK_SYNC) that will be synchronized from the linked repository.\n"];
  repository_link_id: string
    [@ocaml.doc
      "The ID of the repository link created for the connection. A repository link allows Git sync to monitor and sync changes to files in a specified Git repository.\n"];
  config_file: string
    [@ocaml.doc
      "The file name of the configuration file that manages syncing between the connection and the repository. This configuration file is stored in the repository.\n"];
  branch: string
    [@ocaml.doc
      "The branch in the repository from which changes will be synced.\n"]}
[@@ocaml.doc ""]
type nonrec create_repository_link_output =
  {
  repository_link_info: repository_link_info
    [@ocaml.doc
      "The returned information about the created repository link.\n"]}
[@@ocaml.doc ""]
type nonrec create_repository_link_input =
  {
  tags: tag list option
    [@ocaml.doc
      "The tags for the repository to be associated with the repository link.\n"];
  encryption_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) encryption key for the repository to be associated with the repository link.\n"];
  repository_name: string
    [@ocaml.doc
      "The name of the repository to be associated with the repository link.\n"];
  owner_id: string
    [@ocaml.doc
      "The owner ID for the repository associated with a specific sync configuration, such as the owner ID in GitHub.\n"];
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the connection to be associated with the repository link.\n"]}
[@@ocaml.doc ""]
type nonrec create_host_output =
  {
  tags: tag list option [@ocaml.doc "Tags for the created host.\n"];
  host_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the host to be created.\n"]}
[@@ocaml.doc ""]
type nonrec create_host_input =
  {
  tags: tag list option [@ocaml.doc "Tags for the host to be created.\n"];
  vpc_configuration: vpc_configuration option
    [@ocaml.doc
      "The VPC configuration to be provisioned for the host. A VPC must be configured and the infrastructure to be represented by the host must already be connected to the VPC.\n"];
  provider_endpoint: string
    [@ocaml.doc
      "The endpoint of the infrastructure to be represented by the host after it is created.\n"];
  provider_type: provider_type
    [@ocaml.doc
      "The name of the installed provider to be associated with your connection. The host resource represents the infrastructure where your provider type is installed. The valid provider type is GitHub Enterprise Server.\n"];
  name: string [@ocaml.doc "The name of the host to be created.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_connection_output =
  {
  tags: tag list option
    [@ocaml.doc "Specifies the tags applied to the resource.\n"];
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the connection to be created. The ARN is used as the connection reference when the connection is shared between Amazon Web Services services.\n\n  The ARN is never reused if the connection is deleted.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec create_connection_input =
  {
  host_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the host associated with the connection to be created.\n"];
  tags: tag list option
    [@ocaml.doc "The key-value pair to use when tagging the resource.\n"];
  connection_name: string
    [@ocaml.doc "The name of the connection to be created.\n"];
  provider_type: provider_type option
    [@ocaml.doc
      "The name of the external provider where your third-party code repository is configured.\n"]}
[@@ocaml.doc ""]