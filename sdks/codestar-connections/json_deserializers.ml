open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let account_id_of_yojson = string_of_yojson
let amazon_resource_name_of_yojson = string_of_yojson

let blocker_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "RESOLVED" -> RESOLVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerStatus")
     : blocker_status)
    : blocker_status)

let blocker_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATED" -> AUTOMATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerType")
     : blocker_type)
    : blocker_type)

let branch_name_of_yojson = string_of_yojson

let update_out_of_sync_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : update_out_of_sync_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_input_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_modification_exception)

let trigger_resource_update_on_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANY_CHANGE" -> ANY_CHANGE
    | `String "FILE_CHANGE" -> FILE_CHANGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TriggerResourceUpdateOn" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerResourceUpdateOn")
     : trigger_resource_update_on)
    : trigger_resource_update_on)

let publish_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PublishDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PublishDeploymentStatus")
     : publish_deployment_status)
    : publish_deployment_status)

let sync_configuration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CFN_STACK_SYNC" -> CFN_STACK_SYNC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SyncConfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "SyncConfigurationType")
     : sync_configuration_type)
    : sync_configuration_type)

let iam_role_arn_of_yojson = string_of_yojson
let resource_name_of_yojson = string_of_yojson
let repository_name_of_yojson = string_of_yojson
let repository_link_id_of_yojson = string_of_yojson

let provider_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Bitbucket" -> BITBUCKET
    | `String "GitHub" -> GITHUB
    | `String "GitHubEnterpriseServer" -> GITHUB_ENTERPRISE_SERVER
    | `String "GitLab" -> GITLAB
    | `String "GitLabSelfManaged" -> GITLAB_SELF_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProviderType")
     : provider_type)
    : provider_type)

let owner_id_of_yojson = string_of_yojson
let deployment_file_path_of_yojson = string_of_yojson

let sync_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key branch_name_of_yojson "Branch" _list path;
     config_file =
       option_of_yojson (value_for_key deployment_file_path_of_yojson "ConfigFile") _list path;
     owner_id = value_for_key owner_id_of_yojson "OwnerId" _list path;
     provider_type = value_for_key provider_type_of_yojson "ProviderType" _list path;
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
     repository_name = value_for_key repository_name_of_yojson "RepositoryName" _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     publish_deployment_status =
       option_of_yojson
         (value_for_key publish_deployment_status_of_yojson "PublishDeploymentStatus")
         _list path;
     trigger_resource_update_on =
       option_of_yojson
         (value_for_key trigger_resource_update_on_of_yojson "TriggerResourceUpdateOn")
         _list path;
   }
    : sync_configuration)

let update_sync_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_configuration = value_for_key sync_configuration_of_yojson "SyncConfiguration" _list path;
   }
    : update_sync_configuration_output)

let update_sync_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = option_of_yojson (value_for_key branch_name_of_yojson "Branch") _list path;
     config_file =
       option_of_yojson (value_for_key deployment_file_path_of_yojson "ConfigFile") _list path;
     repository_link_id =
       option_of_yojson (value_for_key repository_link_id_of_yojson "RepositoryLinkId") _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     publish_deployment_status =
       option_of_yojson
         (value_for_key publish_deployment_status_of_yojson "PublishDeploymentStatus")
         _list path;
     trigger_resource_update_on =
       option_of_yojson
         (value_for_key trigger_resource_update_on_of_yojson "TriggerResourceUpdateOn")
         _list path;
   }
    : update_sync_configuration_input)

let sync_blocker_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : sync_blocker_does_not_exist_exception)

let retry_latest_commit_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : retry_latest_commit_failed_exception)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let resolved_reason_of_yojson = string_of_yojson
let sync_blocker_context_value_of_yojson = string_of_yojson
let sync_blocker_context_key_of_yojson = string_of_yojson

let sync_blocker_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key sync_blocker_context_key_of_yojson "Key" _list path;
     value = value_for_key sync_blocker_context_value_of_yojson "Value" _list path;
   }
    : sync_blocker_context)

let sync_blocker_context_list_of_yojson tree path =
  list_of_yojson sync_blocker_context_of_yojson tree path

let created_reason_of_yojson = string_of_yojson
let id_of_yojson = string_of_yojson

let sync_blocker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     type_ = value_for_key blocker_type_of_yojson "Type" _list path;
     status = value_for_key blocker_status_of_yojson "Status" _list path;
     created_reason = value_for_key created_reason_of_yojson "CreatedReason" _list path;
     created_at = value_for_key timestamp_of_yojson "CreatedAt" _list path;
     contexts =
       option_of_yojson (value_for_key sync_blocker_context_list_of_yojson "Contexts") _list path;
     resolved_reason =
       option_of_yojson (value_for_key resolved_reason_of_yojson "ResolvedReason") _list path;
     resolved_at = option_of_yojson (value_for_key timestamp_of_yojson "ResolvedAt") _list path;
   }
    : sync_blocker)

let update_sync_blocker_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     parent_resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ParentResourceName") _list path;
     sync_blocker = value_for_key sync_blocker_of_yojson "SyncBlocker" _list path;
   }
    : update_sync_blocker_output)

let update_sync_blocker_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key id_of_yojson "Id" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     resolved_reason = value_for_key resolved_reason_of_yojson "ResolvedReason" _list path;
   }
    : update_sync_blocker_input)

let conditional_check_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conditional_check_failed_exception)

let repository_link_arn_of_yojson = string_of_yojson
let kms_key_arn_of_yojson = string_of_yojson
let connection_arn_of_yojson = string_of_yojson

let repository_link_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_arn = value_for_key connection_arn_of_yojson "ConnectionArn" _list path;
     encryption_key_arn =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "EncryptionKeyArn") _list path;
     owner_id = value_for_key owner_id_of_yojson "OwnerId" _list path;
     provider_type = value_for_key provider_type_of_yojson "ProviderType" _list path;
     repository_link_arn =
       value_for_key repository_link_arn_of_yojson "RepositoryLinkArn" _list path;
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
     repository_name = value_for_key repository_name_of_yojson "RepositoryName" _list path;
   }
    : repository_link_info)

let update_repository_link_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_link_info =
       value_for_key repository_link_info_of_yojson "RepositoryLinkInfo" _list path;
   }
    : update_repository_link_output)

let update_repository_link_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
     encryption_key_arn =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "EncryptionKeyArn") _list path;
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
   }
    : update_repository_link_input)

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unsupported_operation_exception)

let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_unavailable_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conflict_exception)

let update_host_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tls_certificate_of_yojson = string_of_yojson
let security_group_id_of_yojson = string_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path
let subnet_id_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let vpc_id_of_yojson = string_of_yojson

let vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = value_for_key vpc_id_of_yojson "VpcId" _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
     security_group_ids = value_for_key security_group_ids_of_yojson "SecurityGroupIds" _list path;
     tls_certificate =
       option_of_yojson (value_for_key tls_certificate_of_yojson "TlsCertificate") _list path;
   }
    : vpc_configuration)

let url_of_yojson = string_of_yojson
let host_arn_of_yojson = string_of_yojson

let update_host_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_arn = value_for_key host_arn_of_yojson "HostArn" _list path;
     provider_endpoint =
       option_of_yojson (value_for_key url_of_yojson "ProviderEndpoint") _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
   }
    : update_host_input)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_input)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_input)

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_input)

let sharp_next_token_of_yojson = string_of_yojson

let sync_configuration_list_of_yojson tree path =
  list_of_yojson sync_configuration_of_yojson tree path

let list_sync_configurations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_configurations =
       value_for_key sync_configuration_list_of_yojson "SyncConfigurations" _list path;
     next_token = option_of_yojson (value_for_key sharp_next_token_of_yojson "NextToken") _list path;
   }
    : list_sync_configurations_output)

let max_results_of_yojson = int_of_yojson

let list_sync_configurations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key sharp_next_token_of_yojson "NextToken") _list path;
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
   }
    : list_sync_configurations_input)

let target_of_yojson = string_of_yojson
let parent_of_yojson = string_of_yojson
let directory_of_yojson = string_of_yojson

let repository_sync_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key branch_name_of_yojson "Branch" _list path;
     directory = value_for_key directory_of_yojson "Directory" _list path;
     parent = value_for_key parent_of_yojson "Parent" _list path;
     target = value_for_key target_of_yojson "Target" _list path;
   }
    : repository_sync_definition)

let repository_sync_definition_list_of_yojson tree path =
  list_of_yojson repository_sync_definition_of_yojson tree path

let list_repository_sync_definitions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_sync_definitions =
       value_for_key repository_sync_definition_list_of_yojson "RepositorySyncDefinitions" _list
         path;
     next_token = option_of_yojson (value_for_key sharp_next_token_of_yojson "NextToken") _list path;
   }
    : list_repository_sync_definitions_output)

let list_repository_sync_definitions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
   }
    : list_repository_sync_definitions_input)

let repository_link_list_of_yojson tree path =
  list_of_yojson repository_link_info_of_yojson tree path

let list_repository_links_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_links = value_for_key repository_link_list_of_yojson "RepositoryLinks" _list path;
     next_token = option_of_yojson (value_for_key sharp_next_token_of_yojson "NextToken") _list path;
   }
    : list_repository_links_output)

let list_repository_links_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key sharp_next_token_of_yojson "NextToken") _list path;
   }
    : list_repository_links_input)

let next_token_of_yojson = string_of_yojson
let host_status_message_of_yojson = string_of_yojson
let host_status_of_yojson = string_of_yojson
let host_name_of_yojson = string_of_yojson

let host_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key host_name_of_yojson "Name") _list path;
     host_arn = option_of_yojson (value_for_key host_arn_of_yojson "HostArn") _list path;
     provider_type =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderType") _list path;
     provider_endpoint =
       option_of_yojson (value_for_key url_of_yojson "ProviderEndpoint") _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
     status = option_of_yojson (value_for_key host_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key host_status_message_of_yojson "StatusMessage") _list path;
   }
    : host)

let host_list_of_yojson tree path = list_of_yojson host_of_yojson tree path

let list_hosts_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hosts = option_of_yojson (value_for_key host_list_of_yojson "Hosts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_hosts_output)

let list_hosts_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_hosts_input)

let connection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "AVAILABLE" -> AVAILABLE
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")
     : connection_status)
    : connection_status)

let connection_name_of_yojson = string_of_yojson

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_name =
       option_of_yojson (value_for_key connection_name_of_yojson "ConnectionName") _list path;
     connection_arn =
       option_of_yojson (value_for_key connection_arn_of_yojson "ConnectionArn") _list path;
     provider_type =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderType") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "OwnerAccountId") _list path;
     connection_status =
       option_of_yojson (value_for_key connection_status_of_yojson "ConnectionStatus") _list path;
     host_arn = option_of_yojson (value_for_key host_arn_of_yojson "HostArn") _list path;
   }
    : connection)

let connection_list_of_yojson tree path = list_of_yojson connection_of_yojson tree path

let list_connections_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connections =
       option_of_yojson (value_for_key connection_list_of_yojson "Connections") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_connections_output)

let list_connections_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_type_filter =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderTypeFilter") _list path;
     host_arn_filter =
       option_of_yojson (value_for_key host_arn_of_yojson "HostArnFilter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_connections_input)

let get_sync_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_configuration = value_for_key sync_configuration_of_yojson "SyncConfiguration" _list path;
   }
    : get_sync_configuration_output)

let get_sync_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
   }
    : get_sync_configuration_input)

let latest_sync_blocker_list_of_yojson tree path = list_of_yojson sync_blocker_of_yojson tree path

let sync_blocker_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     parent_resource_name =
       option_of_yojson (value_for_key resource_name_of_yojson "ParentResourceName") _list path;
     latest_blockers =
       option_of_yojson
         (value_for_key latest_sync_blocker_list_of_yojson "LatestBlockers")
         _list path;
   }
    : sync_blocker_summary)

let get_sync_blocker_summary_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_blocker_summary =
       value_for_key sync_blocker_summary_of_yojson "SyncBlockerSummary" _list path;
   }
    : get_sync_blocker_summary_output)

let get_sync_blocker_summary_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
   }
    : get_sync_blocker_summary_input)

let sh_a_of_yojson = string_of_yojson

let revision_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key branch_name_of_yojson "Branch" _list path;
     directory = value_for_key directory_of_yojson "Directory" _list path;
     owner_id = value_for_key owner_id_of_yojson "OwnerId" _list path;
     repository_name = value_for_key repository_name_of_yojson "RepositoryName" _list path;
     provider_type = value_for_key provider_type_of_yojson "ProviderType" _list path;
     sha = value_for_key sh_a_of_yojson "Sha" _list path;
   }
    : revision)

let resource_sync_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "INITIATED" -> INITIATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSyncStatus")
     : resource_sync_status)
    : resource_sync_status)

let type__of_yojson = string_of_yojson
let external_id_of_yojson = string_of_yojson
let event_of_yojson = string_of_yojson

let resource_sync_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event = value_for_key event_of_yojson "Event" _list path;
     external_id = option_of_yojson (value_for_key external_id_of_yojson "ExternalId") _list path;
     time = value_for_key timestamp_of_yojson "Time" _list path;
     type_ = value_for_key type__of_yojson "Type" _list path;
   }
    : resource_sync_event)

let resource_sync_event_list_of_yojson tree path =
  list_of_yojson resource_sync_event_of_yojson tree path

let resource_sync_attempt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = value_for_key resource_sync_event_list_of_yojson "Events" _list path;
     initial_revision = value_for_key revision_of_yojson "InitialRevision" _list path;
     started_at = value_for_key timestamp_of_yojson "StartedAt" _list path;
     status = value_for_key resource_sync_status_of_yojson "Status" _list path;
     target_revision = value_for_key revision_of_yojson "TargetRevision" _list path;
     target = value_for_key target_of_yojson "Target" _list path;
   }
    : resource_sync_attempt)

let get_resource_sync_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_state = option_of_yojson (value_for_key revision_of_yojson "DesiredState") _list path;
     latest_successful_sync =
       option_of_yojson
         (value_for_key resource_sync_attempt_of_yojson "LatestSuccessfulSync")
         _list path;
     latest_sync = value_for_key resource_sync_attempt_of_yojson "LatestSync" _list path;
   }
    : get_resource_sync_status_output)

let get_resource_sync_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
   }
    : get_resource_sync_status_input)

let repository_sync_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event = value_for_key event_of_yojson "Event" _list path;
     external_id = option_of_yojson (value_for_key external_id_of_yojson "ExternalId") _list path;
     time = value_for_key timestamp_of_yojson "Time" _list path;
     type_ = value_for_key type__of_yojson "Type" _list path;
   }
    : repository_sync_event)

let repository_sync_event_list_of_yojson tree path =
  list_of_yojson repository_sync_event_of_yojson tree path

let repository_sync_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "INITIATED" -> INITIATED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "QUEUED" -> QUEUED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RepositorySyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositorySyncStatus")
     : repository_sync_status)
    : repository_sync_status)

let repository_sync_attempt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     started_at = value_for_key timestamp_of_yojson "StartedAt" _list path;
     status = value_for_key repository_sync_status_of_yojson "Status" _list path;
     events = value_for_key repository_sync_event_list_of_yojson "Events" _list path;
   }
    : repository_sync_attempt)

let get_repository_sync_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ latest_sync = value_for_key repository_sync_attempt_of_yojson "LatestSync" _list path }
    : get_repository_sync_status_output)

let get_repository_sync_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key branch_name_of_yojson "Branch" _list path;
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
   }
    : get_repository_sync_status_input)

let get_repository_link_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_link_info =
       value_for_key repository_link_info_of_yojson "RepositoryLinkInfo" _list path;
   }
    : get_repository_link_output)

let get_repository_link_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path }
    : get_repository_link_input)

let get_host_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key host_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key host_status_of_yojson "Status") _list path;
     provider_type =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderType") _list path;
     provider_endpoint =
       option_of_yojson (value_for_key url_of_yojson "ProviderEndpoint") _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
   }
    : get_host_output)

let get_host_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ host_arn = value_for_key host_arn_of_yojson "HostArn" _list path } : get_host_input)

let get_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = option_of_yojson (value_for_key connection_of_yojson "Connection") _list path }
    : get_connection_output)

let get_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_arn = value_for_key connection_arn_of_yojson "ConnectionArn" _list path }
    : get_connection_input)

let delete_sync_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_sync_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
   }
    : delete_sync_configuration_input)

let unsupported_provider_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unsupported_provider_type_exception)

let sync_configuration_still_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : sync_configuration_still_exists_exception)

let delete_repository_link_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_repository_link_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path }
    : delete_repository_link_input)

let delete_host_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_host_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ host_arn = value_for_key host_arn_of_yojson "HostArn" _list path } : delete_host_input)

let delete_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection_arn = value_for_key connection_arn_of_yojson "ConnectionArn" _list path }
    : delete_connection_input)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_already_exists_exception)

let create_sync_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sync_configuration = value_for_key sync_configuration_of_yojson "SyncConfiguration" _list path;
   }
    : create_sync_configuration_output)

let create_sync_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch = value_for_key branch_name_of_yojson "Branch" _list path;
     config_file = value_for_key deployment_file_path_of_yojson "ConfigFile" _list path;
     repository_link_id = value_for_key repository_link_id_of_yojson "RepositoryLinkId" _list path;
     resource_name = value_for_key resource_name_of_yojson "ResourceName" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     sync_type = value_for_key sync_configuration_type_of_yojson "SyncType" _list path;
     publish_deployment_status =
       option_of_yojson
         (value_for_key publish_deployment_status_of_yojson "PublishDeploymentStatus")
         _list path;
     trigger_resource_update_on =
       option_of_yojson
         (value_for_key trigger_resource_update_on_of_yojson "TriggerResourceUpdateOn")
         _list path;
   }
    : create_sync_configuration_input)

let create_repository_link_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_link_info =
       value_for_key repository_link_info_of_yojson "RepositoryLinkInfo" _list path;
   }
    : create_repository_link_output)

let create_repository_link_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_arn = value_for_key connection_arn_of_yojson "ConnectionArn" _list path;
     owner_id = value_for_key owner_id_of_yojson "OwnerId" _list path;
     repository_name = value_for_key repository_name_of_yojson "RepositoryName" _list path;
     encryption_key_arn =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "EncryptionKeyArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_repository_link_input)

let create_host_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_arn = option_of_yojson (value_for_key host_arn_of_yojson "HostArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_host_output)

let create_host_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key host_name_of_yojson "Name" _list path;
     provider_type = value_for_key provider_type_of_yojson "ProviderType" _list path;
     provider_endpoint = value_for_key url_of_yojson "ProviderEndpoint" _list path;
     vpc_configuration =
       option_of_yojson (value_for_key vpc_configuration_of_yojson "VpcConfiguration") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_host_input)

let create_connection_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_arn = value_for_key connection_arn_of_yojson "ConnectionArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_connection_output)

let create_connection_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_type =
       option_of_yojson (value_for_key provider_type_of_yojson "ProviderType") _list path;
     connection_name = value_for_key connection_name_of_yojson "ConnectionName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     host_arn = option_of_yojson (value_for_key host_arn_of_yojson "HostArn") _list path;
   }
    : create_connection_input)
