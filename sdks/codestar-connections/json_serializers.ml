open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let account_id_to_yojson = string_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson

let blocker_status_to_yojson (x : blocker_status) =
  match x with ACTIVE -> `String "ACTIVE" | RESOLVED -> `String "RESOLVED"

let blocker_type_to_yojson (x : blocker_type) = match x with AUTOMATED -> `String "AUTOMATED"
let branch_name_to_yojson = string_to_yojson

let update_out_of_sync_exception_to_yojson (x : update_out_of_sync_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let trigger_resource_update_on_to_yojson (x : trigger_resource_update_on) =
  match x with ANY_CHANGE -> `String "ANY_CHANGE" | FILE_CHANGE -> `String "FILE_CHANGE"

let publish_deployment_status_to_yojson (x : publish_deployment_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let sync_configuration_type_to_yojson (x : sync_configuration_type) =
  match x with CFN_STACK_SYNC -> `String "CFN_STACK_SYNC"

let iam_role_arn_to_yojson = string_to_yojson
let resource_name_to_yojson = string_to_yojson
let repository_name_to_yojson = string_to_yojson
let repository_link_id_to_yojson = string_to_yojson

let provider_type_to_yojson (x : provider_type) =
  match x with
  | BITBUCKET -> `String "Bitbucket"
  | GITHUB -> `String "GitHub"
  | GITHUB_ENTERPRISE_SERVER -> `String "GitHubEnterpriseServer"
  | GITLAB -> `String "GitLab"
  | GITLAB_SELF_MANAGED -> `String "GitLabSelfManaged"

let owner_id_to_yojson = string_to_yojson
let deployment_file_path_to_yojson = string_to_yojson

let sync_configuration_to_yojson (x : sync_configuration) =
  assoc_to_yojson
    [
      ("Branch", Some (branch_name_to_yojson x.branch));
      ("ConfigFile", option_to_yojson deployment_file_path_to_yojson x.config_file);
      ("OwnerId", Some (owner_id_to_yojson x.owner_id));
      ("ProviderType", Some (provider_type_to_yojson x.provider_type));
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
      ("RepositoryName", Some (repository_name_to_yojson x.repository_name));
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ( "PublishDeploymentStatus",
        option_to_yojson publish_deployment_status_to_yojson x.publish_deployment_status );
      ( "TriggerResourceUpdateOn",
        option_to_yojson trigger_resource_update_on_to_yojson x.trigger_resource_update_on );
    ]

let update_sync_configuration_output_to_yojson (x : update_sync_configuration_output) =
  assoc_to_yojson
    [ ("SyncConfiguration", Some (sync_configuration_to_yojson x.sync_configuration)) ]

let update_sync_configuration_input_to_yojson (x : update_sync_configuration_input) =
  assoc_to_yojson
    [
      ("Branch", option_to_yojson branch_name_to_yojson x.branch);
      ("ConfigFile", option_to_yojson deployment_file_path_to_yojson x.config_file);
      ("RepositoryLinkId", option_to_yojson repository_link_id_to_yojson x.repository_link_id);
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ( "PublishDeploymentStatus",
        option_to_yojson publish_deployment_status_to_yojson x.publish_deployment_status );
      ( "TriggerResourceUpdateOn",
        option_to_yojson trigger_resource_update_on_to_yojson x.trigger_resource_update_on );
    ]

let sync_blocker_does_not_exist_exception_to_yojson (x : sync_blocker_does_not_exist_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let retry_latest_commit_failed_exception_to_yojson (x : retry_latest_commit_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let resolved_reason_to_yojson = string_to_yojson
let sync_blocker_context_value_to_yojson = string_to_yojson
let sync_blocker_context_key_to_yojson = string_to_yojson

let sync_blocker_context_to_yojson (x : sync_blocker_context) =
  assoc_to_yojson
    [
      ("Key", Some (sync_blocker_context_key_to_yojson x.key));
      ("Value", Some (sync_blocker_context_value_to_yojson x.value));
    ]

let sync_blocker_context_list_to_yojson tree = list_to_yojson sync_blocker_context_to_yojson tree
let created_reason_to_yojson = string_to_yojson
let id_to_yojson = string_to_yojson

let sync_blocker_to_yojson (x : sync_blocker) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("Type", Some (blocker_type_to_yojson x.type_));
      ("Status", Some (blocker_status_to_yojson x.status));
      ("CreatedReason", Some (created_reason_to_yojson x.created_reason));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("Contexts", option_to_yojson sync_blocker_context_list_to_yojson x.contexts);
      ("ResolvedReason", option_to_yojson resolved_reason_to_yojson x.resolved_reason);
      ("ResolvedAt", option_to_yojson timestamp_to_yojson x.resolved_at);
    ]

let update_sync_blocker_output_to_yojson (x : update_sync_blocker_output) =
  assoc_to_yojson
    [
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("ParentResourceName", option_to_yojson resource_name_to_yojson x.parent_resource_name);
      ("SyncBlocker", Some (sync_blocker_to_yojson x.sync_blocker));
    ]

let update_sync_blocker_input_to_yojson (x : update_sync_blocker_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("ResolvedReason", Some (resolved_reason_to_yojson x.resolved_reason));
    ]

let conditional_check_failed_exception_to_yojson (x : conditional_check_failed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let repository_link_arn_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson
let connection_arn_to_yojson = string_to_yojson

let repository_link_info_to_yojson (x : repository_link_info) =
  assoc_to_yojson
    [
      ("ConnectionArn", Some (connection_arn_to_yojson x.connection_arn));
      ("EncryptionKeyArn", option_to_yojson kms_key_arn_to_yojson x.encryption_key_arn);
      ("OwnerId", Some (owner_id_to_yojson x.owner_id));
      ("ProviderType", Some (provider_type_to_yojson x.provider_type));
      ("RepositoryLinkArn", Some (repository_link_arn_to_yojson x.repository_link_arn));
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
      ("RepositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let update_repository_link_output_to_yojson (x : update_repository_link_output) =
  assoc_to_yojson
    [ ("RepositoryLinkInfo", Some (repository_link_info_to_yojson x.repository_link_info)) ]

let update_repository_link_input_to_yojson (x : update_repository_link_input) =
  assoc_to_yojson
    [
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("EncryptionKeyArn", option_to_yojson kms_key_arn_to_yojson x.encryption_key_arn);
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
    ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_host_output_to_yojson = unit_to_yojson
let tls_certificate_to_yojson = string_to_yojson
let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson

let vpc_configuration_to_yojson (x : vpc_configuration) =
  assoc_to_yojson
    [
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
      ("TlsCertificate", option_to_yojson tls_certificate_to_yojson x.tls_certificate);
    ]

let url_to_yojson = string_to_yojson
let host_arn_to_yojson = string_to_yojson

let update_host_input_to_yojson (x : update_host_input) =
  assoc_to_yojson
    [
      ("HostArn", Some (host_arn_to_yojson x.host_arn));
      ("ProviderEndpoint", option_to_yojson url_to_yojson x.provider_endpoint);
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
    ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tag_resource_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let sharp_next_token_to_yojson = string_to_yojson
let sync_configuration_list_to_yojson tree = list_to_yojson sync_configuration_to_yojson tree

let list_sync_configurations_output_to_yojson (x : list_sync_configurations_output) =
  assoc_to_yojson
    [
      ("SyncConfigurations", Some (sync_configuration_list_to_yojson x.sync_configurations));
      ("NextToken", option_to_yojson sharp_next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_sync_configurations_input_to_yojson (x : list_sync_configurations_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson sharp_next_token_to_yojson x.next_token);
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
    ]

let target_to_yojson = string_to_yojson
let parent_to_yojson = string_to_yojson
let directory_to_yojson = string_to_yojson

let repository_sync_definition_to_yojson (x : repository_sync_definition) =
  assoc_to_yojson
    [
      ("Branch", Some (branch_name_to_yojson x.branch));
      ("Directory", Some (directory_to_yojson x.directory));
      ("Parent", Some (parent_to_yojson x.parent));
      ("Target", Some (target_to_yojson x.target));
    ]

let repository_sync_definition_list_to_yojson tree =
  list_to_yojson repository_sync_definition_to_yojson tree

let list_repository_sync_definitions_output_to_yojson (x : list_repository_sync_definitions_output)
    =
  assoc_to_yojson
    [
      ( "RepositorySyncDefinitions",
        Some (repository_sync_definition_list_to_yojson x.repository_sync_definitions) );
      ("NextToken", option_to_yojson sharp_next_token_to_yojson x.next_token);
    ]

let list_repository_sync_definitions_input_to_yojson (x : list_repository_sync_definitions_input) =
  assoc_to_yojson
    [
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
    ]

let repository_link_list_to_yojson tree = list_to_yojson repository_link_info_to_yojson tree

let list_repository_links_output_to_yojson (x : list_repository_links_output) =
  assoc_to_yojson
    [
      ("RepositoryLinks", Some (repository_link_list_to_yojson x.repository_links));
      ("NextToken", option_to_yojson sharp_next_token_to_yojson x.next_token);
    ]

let list_repository_links_input_to_yojson (x : list_repository_links_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson sharp_next_token_to_yojson x.next_token);
    ]

let next_token_to_yojson = string_to_yojson
let host_status_message_to_yojson = string_to_yojson
let host_status_to_yojson = string_to_yojson
let host_name_to_yojson = string_to_yojson

let host_to_yojson (x : host) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson host_name_to_yojson x.name);
      ("HostArn", option_to_yojson host_arn_to_yojson x.host_arn);
      ("ProviderType", option_to_yojson provider_type_to_yojson x.provider_type);
      ("ProviderEndpoint", option_to_yojson url_to_yojson x.provider_endpoint);
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ("Status", option_to_yojson host_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson host_status_message_to_yojson x.status_message);
    ]

let host_list_to_yojson tree = list_to_yojson host_to_yojson tree

let list_hosts_output_to_yojson (x : list_hosts_output) =
  assoc_to_yojson
    [
      ("Hosts", option_to_yojson host_list_to_yojson x.hosts);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hosts_input_to_yojson (x : list_hosts_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let connection_status_to_yojson (x : connection_status) =
  match x with
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"
  | ERROR -> `String "ERROR"

let connection_name_to_yojson = string_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("ConnectionName", option_to_yojson connection_name_to_yojson x.connection_name);
      ("ConnectionArn", option_to_yojson connection_arn_to_yojson x.connection_arn);
      ("ProviderType", option_to_yojson provider_type_to_yojson x.provider_type);
      ("OwnerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("ConnectionStatus", option_to_yojson connection_status_to_yojson x.connection_status);
      ("HostArn", option_to_yojson host_arn_to_yojson x.host_arn);
    ]

let connection_list_to_yojson tree = list_to_yojson connection_to_yojson tree

let list_connections_output_to_yojson (x : list_connections_output) =
  assoc_to_yojson
    [
      ("Connections", option_to_yojson connection_list_to_yojson x.connections);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_connections_input_to_yojson (x : list_connections_input) =
  assoc_to_yojson
    [
      ("ProviderTypeFilter", option_to_yojson provider_type_to_yojson x.provider_type_filter);
      ("HostArnFilter", option_to_yojson host_arn_to_yojson x.host_arn_filter);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_sync_configuration_output_to_yojson (x : get_sync_configuration_output) =
  assoc_to_yojson
    [ ("SyncConfiguration", Some (sync_configuration_to_yojson x.sync_configuration)) ]

let get_sync_configuration_input_to_yojson (x : get_sync_configuration_input) =
  assoc_to_yojson
    [
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
    ]

let latest_sync_blocker_list_to_yojson tree = list_to_yojson sync_blocker_to_yojson tree

let sync_blocker_summary_to_yojson (x : sync_blocker_summary) =
  assoc_to_yojson
    [
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("ParentResourceName", option_to_yojson resource_name_to_yojson x.parent_resource_name);
      ("LatestBlockers", option_to_yojson latest_sync_blocker_list_to_yojson x.latest_blockers);
    ]

let get_sync_blocker_summary_output_to_yojson (x : get_sync_blocker_summary_output) =
  assoc_to_yojson
    [ ("SyncBlockerSummary", Some (sync_blocker_summary_to_yojson x.sync_blocker_summary)) ]

let get_sync_blocker_summary_input_to_yojson (x : get_sync_blocker_summary_input) =
  assoc_to_yojson
    [
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
    ]

let sh_a_to_yojson = string_to_yojson

let revision_to_yojson (x : revision) =
  assoc_to_yojson
    [
      ("Branch", Some (branch_name_to_yojson x.branch));
      ("Directory", Some (directory_to_yojson x.directory));
      ("OwnerId", Some (owner_id_to_yojson x.owner_id));
      ("RepositoryName", Some (repository_name_to_yojson x.repository_name));
      ("ProviderType", Some (provider_type_to_yojson x.provider_type));
      ("Sha", Some (sh_a_to_yojson x.sha));
    ]

let resource_sync_status_to_yojson (x : resource_sync_status) =
  match x with
  | FAILED -> `String "FAILED"
  | INITIATED -> `String "INITIATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"

let type__to_yojson = string_to_yojson
let external_id_to_yojson = string_to_yojson
let event_to_yojson = string_to_yojson

let resource_sync_event_to_yojson (x : resource_sync_event) =
  assoc_to_yojson
    [
      ("Event", Some (event_to_yojson x.event));
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("Time", Some (timestamp_to_yojson x.time));
      ("Type", Some (type__to_yojson x.type_));
    ]

let resource_sync_event_list_to_yojson tree = list_to_yojson resource_sync_event_to_yojson tree

let resource_sync_attempt_to_yojson (x : resource_sync_attempt) =
  assoc_to_yojson
    [
      ("Events", Some (resource_sync_event_list_to_yojson x.events));
      ("InitialRevision", Some (revision_to_yojson x.initial_revision));
      ("StartedAt", Some (timestamp_to_yojson x.started_at));
      ("Status", Some (resource_sync_status_to_yojson x.status));
      ("TargetRevision", Some (revision_to_yojson x.target_revision));
      ("Target", Some (target_to_yojson x.target));
    ]

let get_resource_sync_status_output_to_yojson (x : get_resource_sync_status_output) =
  assoc_to_yojson
    [
      ("DesiredState", option_to_yojson revision_to_yojson x.desired_state);
      ( "LatestSuccessfulSync",
        option_to_yojson resource_sync_attempt_to_yojson x.latest_successful_sync );
      ("LatestSync", Some (resource_sync_attempt_to_yojson x.latest_sync));
    ]

let get_resource_sync_status_input_to_yojson (x : get_resource_sync_status_input) =
  assoc_to_yojson
    [
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
    ]

let repository_sync_event_to_yojson (x : repository_sync_event) =
  assoc_to_yojson
    [
      ("Event", Some (event_to_yojson x.event));
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("Time", Some (timestamp_to_yojson x.time));
      ("Type", Some (type__to_yojson x.type_));
    ]

let repository_sync_event_list_to_yojson tree = list_to_yojson repository_sync_event_to_yojson tree

let repository_sync_status_to_yojson (x : repository_sync_status) =
  match x with
  | FAILED -> `String "FAILED"
  | INITIATED -> `String "INITIATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | QUEUED -> `String "QUEUED"

let repository_sync_attempt_to_yojson (x : repository_sync_attempt) =
  assoc_to_yojson
    [
      ("StartedAt", Some (timestamp_to_yojson x.started_at));
      ("Status", Some (repository_sync_status_to_yojson x.status));
      ("Events", Some (repository_sync_event_list_to_yojson x.events));
    ]

let get_repository_sync_status_output_to_yojson (x : get_repository_sync_status_output) =
  assoc_to_yojson [ ("LatestSync", Some (repository_sync_attempt_to_yojson x.latest_sync)) ]

let get_repository_sync_status_input_to_yojson (x : get_repository_sync_status_input) =
  assoc_to_yojson
    [
      ("Branch", Some (branch_name_to_yojson x.branch));
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
    ]

let get_repository_link_output_to_yojson (x : get_repository_link_output) =
  assoc_to_yojson
    [ ("RepositoryLinkInfo", Some (repository_link_info_to_yojson x.repository_link_info)) ]

let get_repository_link_input_to_yojson (x : get_repository_link_input) =
  assoc_to_yojson [ ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id)) ]

let get_host_output_to_yojson (x : get_host_output) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson host_name_to_yojson x.name);
      ("Status", option_to_yojson host_status_to_yojson x.status);
      ("ProviderType", option_to_yojson provider_type_to_yojson x.provider_type);
      ("ProviderEndpoint", option_to_yojson url_to_yojson x.provider_endpoint);
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
    ]

let get_host_input_to_yojson (x : get_host_input) =
  assoc_to_yojson [ ("HostArn", Some (host_arn_to_yojson x.host_arn)) ]

let get_connection_output_to_yojson (x : get_connection_output) =
  assoc_to_yojson [ ("Connection", option_to_yojson connection_to_yojson x.connection) ]

let get_connection_input_to_yojson (x : get_connection_input) =
  assoc_to_yojson [ ("ConnectionArn", Some (connection_arn_to_yojson x.connection_arn)) ]

let delete_sync_configuration_output_to_yojson = unit_to_yojson

let delete_sync_configuration_input_to_yojson (x : delete_sync_configuration_input) =
  assoc_to_yojson
    [
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
    ]

let unsupported_provider_type_exception_to_yojson (x : unsupported_provider_type_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let sync_configuration_still_exists_exception_to_yojson
    (x : sync_configuration_still_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_repository_link_output_to_yojson = unit_to_yojson

let delete_repository_link_input_to_yojson (x : delete_repository_link_input) =
  assoc_to_yojson [ ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id)) ]

let delete_host_output_to_yojson = unit_to_yojson

let delete_host_input_to_yojson (x : delete_host_input) =
  assoc_to_yojson [ ("HostArn", Some (host_arn_to_yojson x.host_arn)) ]

let delete_connection_output_to_yojson = unit_to_yojson

let delete_connection_input_to_yojson (x : delete_connection_input) =
  assoc_to_yojson [ ("ConnectionArn", Some (connection_arn_to_yojson x.connection_arn)) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_sync_configuration_output_to_yojson (x : create_sync_configuration_output) =
  assoc_to_yojson
    [ ("SyncConfiguration", Some (sync_configuration_to_yojson x.sync_configuration)) ]

let create_sync_configuration_input_to_yojson (x : create_sync_configuration_input) =
  assoc_to_yojson
    [
      ("Branch", Some (branch_name_to_yojson x.branch));
      ("ConfigFile", Some (deployment_file_path_to_yojson x.config_file));
      ("RepositoryLinkId", Some (repository_link_id_to_yojson x.repository_link_id));
      ("ResourceName", Some (resource_name_to_yojson x.resource_name));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("SyncType", Some (sync_configuration_type_to_yojson x.sync_type));
      ( "PublishDeploymentStatus",
        option_to_yojson publish_deployment_status_to_yojson x.publish_deployment_status );
      ( "TriggerResourceUpdateOn",
        option_to_yojson trigger_resource_update_on_to_yojson x.trigger_resource_update_on );
    ]

let create_repository_link_output_to_yojson (x : create_repository_link_output) =
  assoc_to_yojson
    [ ("RepositoryLinkInfo", Some (repository_link_info_to_yojson x.repository_link_info)) ]

let create_repository_link_input_to_yojson (x : create_repository_link_input) =
  assoc_to_yojson
    [
      ("ConnectionArn", Some (connection_arn_to_yojson x.connection_arn));
      ("OwnerId", Some (owner_id_to_yojson x.owner_id));
      ("RepositoryName", Some (repository_name_to_yojson x.repository_name));
      ("EncryptionKeyArn", option_to_yojson kms_key_arn_to_yojson x.encryption_key_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_host_output_to_yojson (x : create_host_output) =
  assoc_to_yojson
    [
      ("HostArn", option_to_yojson host_arn_to_yojson x.host_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_host_input_to_yojson (x : create_host_input) =
  assoc_to_yojson
    [
      ("Name", Some (host_name_to_yojson x.name));
      ("ProviderType", Some (provider_type_to_yojson x.provider_type));
      ("ProviderEndpoint", Some (url_to_yojson x.provider_endpoint));
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_connection_output_to_yojson (x : create_connection_output) =
  assoc_to_yojson
    [
      ("ConnectionArn", Some (connection_arn_to_yojson x.connection_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_connection_input_to_yojson (x : create_connection_input) =
  assoc_to_yojson
    [
      ("ProviderType", option_to_yojson provider_type_to_yojson x.provider_type);
      ("ConnectionName", Some (connection_name_to_yojson x.connection_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("HostArn", option_to_yojson host_arn_to_yojson x.host_arn);
    ]
