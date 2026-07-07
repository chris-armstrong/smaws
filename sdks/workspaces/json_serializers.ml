open Smaws_Lib.Json.SerializeHelpers
open Types

let exception_message_to_yojson = string_to_yojson
let non_empty_string_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let exception_error_code_to_yojson = string_to_yojson

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson exception_error_code_to_yojson x.reason);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let operation_in_progress_exception_to_yojson (x : operation_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_resource_state_exception_to_yojson (x : invalid_resource_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_values_exception_to_yojson (x : invalid_parameter_values_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let workspaces_pool_id_to_yojson = string_to_yojson
let ar_n_to_yojson = string_to_yojson
let available_user_sessions_to_yojson = int_to_yojson
let desired_user_sessions_to_yojson = int_to_yojson
let actual_user_sessions_to_yojson = int_to_yojson
let active_user_sessions_to_yojson = int_to_yojson

let capacity_status_to_yojson (x : capacity_status) =
  assoc_to_yojson
    [
      ("ActiveUserSessions", Some (active_user_sessions_to_yojson x.active_user_sessions));
      ("ActualUserSessions", Some (actual_user_sessions_to_yojson x.actual_user_sessions));
      ("DesiredUserSessions", Some (desired_user_sessions_to_yojson x.desired_user_sessions));
      ("AvailableUserSessions", Some (available_user_sessions_to_yojson x.available_user_sessions));
    ]

let workspaces_pool_name_to_yojson = string_to_yojson
let update_description_to_yojson = string_to_yojson

let workspaces_pool_state_to_yojson (x : workspaces_pool_state) =
  match x with
  | UPDATING -> `String "UPDATING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let bundle_id_to_yojson = string_to_yojson
let directory_id_to_yojson = string_to_yojson

let workspaces_pool_error_code_to_yojson (x : workspaces_pool_error_code) =
  match x with
  | DEFAULT_OU_IS_MISSING -> `String "DEFAULT_OU_IS_MISSING"
  | INSUFFICIENT_PERMISSIONS_ERROR -> `String "INSUFFICIENT_PERMISSIONS_ERROR"
  | DIRECTORY_NOT_FOUND -> `String "DIRECTORY_NOT_FOUND"
  | BUNDLE_NOT_FOUND -> `String "BUNDLE_NOT_FOUND"
  | DOMAIN_JOIN_ERROR_SECRET_INVALID -> `String "DOMAIN_JOIN_ERROR_SECRET_INVALID"
  | DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND ->
      `String "DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND"
  | DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND -> `String "DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND"
  | DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID -> `String "DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID"
  | DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE ->
      `String "DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE"
  | DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING ->
      `String "DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING"
  | DOMAIN_JOIN_INTERNAL_SERVICE_ERROR -> `String "DOMAIN_JOIN_INTERNAL_SERVICE_ERROR"
  | DOMAIN_JOIN_NERR_PASSWORD_EXPIRED -> `String "DOMAIN_JOIN_NERR_PASSWORD_EXPIRED"
  | DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED ->
      `String "DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED"
  | DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED -> `String "DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED"
  | DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME -> `String "DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME"
  | DOMAIN_JOIN_ERROR_NOT_SUPPORTED -> `String "DOMAIN_JOIN_ERROR_NOT_SUPPORTED"
  | DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN -> `String "DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN"
  | DOMAIN_JOIN_ERROR_MORE_DATA -> `String "DOMAIN_JOIN_ERROR_MORE_DATA"
  | DOMAIN_JOIN_ERROR_INVALID_PARAMETER -> `String "DOMAIN_JOIN_ERROR_INVALID_PARAMETER"
  | DOMAIN_JOIN_ERROR_LOGON_FAILURE -> `String "DOMAIN_JOIN_ERROR_LOGON_FAILURE"
  | DOMAIN_JOIN_ERROR_ACCESS_DENIED -> `String "DOMAIN_JOIN_ERROR_ACCESS_DENIED"
  | DOMAIN_JOIN_ERROR_FILE_NOT_FOUND -> `String "DOMAIN_JOIN_ERROR_FILE_NOT_FOUND"
  | WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE ->
      `String "WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE"
  | WORKSPACES_POOL_STOPPED -> `String "WORKSPACES_POOL_STOPPED"
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION"
  | IGW_NOT_ATTACHED -> `String "IGW_NOT_ATTACHED"
  | SECURITY_GROUPS_NOT_FOUND -> `String "SECURITY_GROUPS_NOT_FOUND"
  | INVALID_SUBNET_CONFIGURATION -> `String "INVALID_SUBNET_CONFIGURATION"
  | IMAGE_NOT_FOUND -> `String "IMAGE_NOT_FOUND"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION"
  | SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES -> `String "SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES"
  | STS_DISABLED_IN_REGION -> `String "STS_DISABLED_IN_REGION"
  | MACHINE_ROLE_IS_MISSING -> `String "MACHINE_ROLE_IS_MISSING"
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"
  | NETWORK_INTERFACE_LIMIT_EXCEEDED -> `String "NETWORK_INTERFACE_LIMIT_EXCEEDED"
  | IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION"
  | IAM_SERVICE_ROLE_IS_MISSING -> `String "IAM_SERVICE_ROLE_IS_MISSING"

let error_message_to_yojson = string_to_yojson

let workspaces_pool_error_to_yojson (x : workspaces_pool_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson workspaces_pool_error_code_to_yojson x.error_code);
    ]

let workspaces_pool_errors_to_yojson tree = list_to_yojson workspaces_pool_error_to_yojson tree

let application_settings_status_enum_to_yojson (x : application_settings_status_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let settings_group_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let application_settings_response_to_yojson (x : application_settings_response) =
  assoc_to_yojson
    [
      ("S3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
      ("Status", Some (application_settings_status_enum_to_yojson x.status));
    ]

let disconnect_timeout_in_seconds_to_yojson = int_to_yojson
let idle_disconnect_timeout_in_seconds_to_yojson = int_to_yojson
let max_user_duration_in_seconds_to_yojson = int_to_yojson

let timeout_settings_to_yojson (x : timeout_settings) =
  assoc_to_yojson
    [
      ( "MaxUserDurationInSeconds",
        option_to_yojson max_user_duration_in_seconds_to_yojson x.max_user_duration_in_seconds );
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson idle_disconnect_timeout_in_seconds_to_yojson
          x.idle_disconnect_timeout_in_seconds );
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson disconnect_timeout_in_seconds_to_yojson x.disconnect_timeout_in_seconds );
    ]

let pools_running_mode_to_yojson (x : pools_running_mode) =
  match x with ALWAYS_ON -> `String "ALWAYS_ON" | AUTO_STOP -> `String "AUTO_STOP"

let workspaces_pool_to_yojson (x : workspaces_pool) =
  assoc_to_yojson
    [
      ("RunningMode", Some (pools_running_mode_to_yojson x.running_mode));
      ("TimeoutSettings", option_to_yojson timeout_settings_to_yojson x.timeout_settings);
      ( "ApplicationSettings",
        option_to_yojson application_settings_response_to_yojson x.application_settings );
      ("Errors", option_to_yojson workspaces_pool_errors_to_yojson x.errors);
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("State", Some (workspaces_pool_state_to_yojson x.state));
      ("Description", option_to_yojson update_description_to_yojson x.description);
      ("PoolName", Some (workspaces_pool_name_to_yojson x.pool_name));
      ("CapacityStatus", Some (capacity_status_to_yojson x.capacity_status));
      ("PoolArn", Some (ar_n_to_yojson x.pool_arn));
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
    ]

let update_workspaces_pool_result_to_yojson (x : update_workspaces_pool_result) =
  assoc_to_yojson
    [ ("WorkspacesPool", option_to_yojson workspaces_pool_to_yojson x.workspaces_pool) ]

let capacity_to_yojson (x : capacity) =
  assoc_to_yojson
    [ ("DesiredUserSessions", Some (desired_user_sessions_to_yojson x.desired_user_sessions)) ]

let application_settings_request_to_yojson (x : application_settings_request) =
  assoc_to_yojson
    [
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
      ("Status", Some (application_settings_status_enum_to_yojson x.status));
    ]

let update_workspaces_pool_request_to_yojson (x : update_workspaces_pool_request) =
  assoc_to_yojson
    [
      ("RunningMode", option_to_yojson pools_running_mode_to_yojson x.running_mode);
      ("TimeoutSettings", option_to_yojson timeout_settings_to_yojson x.timeout_settings);
      ( "ApplicationSettings",
        option_to_yojson application_settings_request_to_yojson x.application_settings );
      ("Capacity", option_to_yojson capacity_to_yojson x.capacity);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("Description", option_to_yojson update_description_to_yojson x.description);
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let update_workspace_image_permission_result_to_yojson = unit_to_yojson
let workspace_image_id_to_yojson = string_to_yojson
let boolean_object_to_yojson = bool_to_yojson
let aws_account_to_yojson = string_to_yojson

let update_workspace_image_permission_request_to_yojson
    (x : update_workspace_image_permission_request) =
  assoc_to_yojson
    [
      ("SharedAccountId", Some (aws_account_to_yojson x.shared_account_id));
      ("AllowCopyImage", Some (boolean_object_to_yojson x.allow_copy_image));
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
    ]

let update_workspace_bundle_result_to_yojson = unit_to_yojson

let update_workspace_bundle_request_to_yojson (x : update_workspace_bundle_request) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
    ]

let update_rules_of_ip_group_result_to_yojson = unit_to_yojson
let ip_group_id_to_yojson = string_to_yojson
let ip_rule_to_yojson = string_to_yojson
let ip_rule_desc_to_yojson = string_to_yojson

let ip_rule_item_to_yojson (x : ip_rule_item) =
  assoc_to_yojson
    [
      ("ruleDesc", option_to_yojson ip_rule_desc_to_yojson x.rule_desc);
      ("ipRule", option_to_yojson ip_rule_to_yojson x.ip_rule);
    ]

let ip_rule_list_to_yojson tree = list_to_yojson ip_rule_item_to_yojson tree

let update_rules_of_ip_group_request_to_yojson (x : update_rules_of_ip_group_request) =
  assoc_to_yojson
    [
      ("UserRules", Some (ip_rule_list_to_yojson x.user_rules));
      ("GroupId", Some (ip_group_id_to_yojson x.group_id));
    ]

let resource_associated_exception_to_yojson (x : resource_associated_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let update_connection_alias_permission_result_to_yojson = unit_to_yojson
let connection_alias_id_to_yojson = string_to_yojson

let connection_alias_permission_to_yojson (x : connection_alias_permission) =
  assoc_to_yojson
    [
      ("AllowAssociation", Some (boolean_object_to_yojson x.allow_association));
      ("SharedAccountId", Some (aws_account_to_yojson x.shared_account_id));
    ]

let update_connection_alias_permission_request_to_yojson
    (x : update_connection_alias_permission_request) =
  assoc_to_yojson
    [
      ( "ConnectionAliasPermission",
        Some (connection_alias_permission_to_yojson x.connection_alias_permission) );
      ("AliasId", Some (connection_alias_id_to_yojson x.alias_id));
    ]

let update_connect_client_add_in_result_to_yojson = unit_to_yojson
let amazon_uuid_to_yojson = string_to_yojson
let add_in_name_to_yojson = string_to_yojson
let add_in_url_to_yojson = string_to_yojson

let update_connect_client_add_in_request_to_yojson (x : update_connect_client_add_in_request) =
  assoc_to_yojson
    [
      ("URL", option_to_yojson add_in_url_to_yojson x.ur_l);
      ("Name", option_to_yojson add_in_name_to_yojson x.name);
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("AddInId", Some (amazon_uuid_to_yojson x.add_in_id));
    ]

let terminate_workspaces_pool_session_result_to_yojson = unit_to_yojson

let terminate_workspaces_pool_session_request_to_yojson
    (x : terminate_workspaces_pool_session_request) =
  assoc_to_yojson [ ("SessionId", Some (amazon_uuid_to_yojson x.session_id)) ]

let terminate_workspaces_pool_result_to_yojson = unit_to_yojson

let terminate_workspaces_pool_request_to_yojson (x : terminate_workspaces_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id)) ]

let workspace_id_to_yojson = string_to_yojson
let error_type_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let failed_workspace_change_request_to_yojson (x : failed_workspace_change_request) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_type_to_yojson x.error_code);
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
    ]

let failed_terminate_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let terminate_workspaces_result_to_yojson (x : terminate_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_terminate_workspace_requests_to_yojson x.failed_requests );
    ]

let terminate_request_to_yojson (x : terminate_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let terminate_workspace_requests_to_yojson tree = list_to_yojson terminate_request_to_yojson tree

let terminate_workspaces_request_to_yojson (x : terminate_workspaces_request) =
  assoc_to_yojson
    [
      ( "TerminateWorkspaceRequests",
        Some (terminate_workspace_requests_to_yojson x.terminate_workspace_requests) );
    ]

let stop_workspaces_pool_result_to_yojson = unit_to_yojson

let stop_workspaces_pool_request_to_yojson (x : stop_workspaces_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id)) ]

let failed_stop_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let stop_workspaces_result_to_yojson (x : stop_workspaces_result) =
  assoc_to_yojson
    [
      ("FailedRequests", option_to_yojson failed_stop_workspace_requests_to_yojson x.failed_requests);
    ]

let stop_request_to_yojson (x : stop_request) =
  assoc_to_yojson [ ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id) ]

let stop_workspace_requests_to_yojson tree = list_to_yojson stop_request_to_yojson tree

let stop_workspaces_request_to_yojson (x : stop_workspaces_request) =
  assoc_to_yojson
    [
      ("StopWorkspaceRequests", Some (stop_workspace_requests_to_yojson x.stop_workspace_requests));
    ]

let start_workspaces_pool_result_to_yojson = unit_to_yojson

let start_workspaces_pool_request_to_yojson (x : start_workspaces_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id)) ]

let failed_start_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let start_workspaces_result_to_yojson (x : start_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_start_workspace_requests_to_yojson x.failed_requests );
    ]

let start_request_to_yojson (x : start_request) =
  assoc_to_yojson [ ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id) ]

let start_workspace_requests_to_yojson tree = list_to_yojson start_request_to_yojson tree

let start_workspaces_request_to_yojson (x : start_workspaces_request) =
  assoc_to_yojson
    [
      ( "StartWorkspaceRequests",
        Some (start_workspace_requests_to_yojson x.start_workspace_requests) );
    ]

let revoke_ip_rules_result_to_yojson = unit_to_yojson
let ip_revoked_rule_list_to_yojson tree = list_to_yojson ip_rule_to_yojson tree

let revoke_ip_rules_request_to_yojson (x : revoke_ip_rules_request) =
  assoc_to_yojson
    [
      ("UserRules", Some (ip_revoked_rule_list_to_yojson x.user_rules));
      ("GroupId", Some (ip_group_id_to_yojson x.group_id));
    ]

let restore_workspace_result_to_yojson = unit_to_yojson

let restore_workspace_request_to_yojson (x : restore_workspace_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let link_id_to_yojson = string_to_yojson

let account_link_status_enum_to_yojson (x : account_link_status_enum) =
  match x with
  | REJECTED -> `String "REJECTED"
  | PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT -> `String "PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT"
  | LINK_NOT_FOUND -> `String "LINK_NOT_FOUND"
  | LINKING_FAILED -> `String "LINKING_FAILED"
  | LINKED -> `String "LINKED"

let account_link_to_yojson (x : account_link) =
  assoc_to_yojson
    [
      ("TargetAccountId", option_to_yojson aws_account_to_yojson x.target_account_id);
      ("SourceAccountId", option_to_yojson aws_account_to_yojson x.source_account_id);
      ( "AccountLinkStatus",
        option_to_yojson account_link_status_enum_to_yojson x.account_link_status );
      ("AccountLinkId", option_to_yojson link_id_to_yojson x.account_link_id);
    ]

let reject_account_link_invitation_result_to_yojson (x : reject_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let client_token_to_yojson = string_to_yojson

let reject_account_link_invitation_request_to_yojson (x : reject_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("LinkId", Some (link_id_to_yojson x.link_id));
    ]

let workspaces_default_role_not_found_exception_to_yojson
    (x : workspaces_default_role_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unsupported_network_configuration_exception_to_yojson
    (x : unsupported_network_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let workspace_directory_state_to_yojson (x : workspace_directory_state) =
  match x with
  | ERROR -> `String "ERROR"
  | DEREGISTERED -> `String "DEREGISTERED"
  | DEREGISTERING -> `String "DEREGISTERING"
  | REGISTERED -> `String "REGISTERED"
  | REGISTERING -> `String "REGISTERING"

let register_workspace_directory_result_to_yojson (x : register_workspace_directory_result) =
  assoc_to_yojson
    [
      ("State", option_to_yojson workspace_directory_state_to_yojson x.state);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
    ]

let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let tenancy_to_yojson (x : tenancy) =
  match x with SHARED -> `String "SHARED" | DEDICATED -> `String "DEDICATED"

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let workspace_directory_name_to_yojson = string_to_yojson
let workspace_directory_description_to_yojson = string_to_yojson

let user_identity_type_to_yojson (x : user_identity_type) =
  match x with
  | AWS_IAM_IDENTITY_CENTER -> `String "AWS_IAM_IDENTITY_CENTER"
  | AWS_DIRECTORY_SERVICE -> `String "AWS_DIRECTORY_SERVICE"
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"

let microsoft_entra_config_tenant_id_to_yojson = string_to_yojson
let secrets_manager_arn_to_yojson = string_to_yojson

let microsoft_entra_config_to_yojson (x : microsoft_entra_config) =
  assoc_to_yojson
    [
      ( "ApplicationConfigSecretArn",
        option_to_yojson secrets_manager_arn_to_yojson x.application_config_secret_arn );
      ("TenantId", option_to_yojson microsoft_entra_config_tenant_id_to_yojson x.tenant_id);
    ]

let workspace_type_to_yojson (x : workspace_type) =
  match x with POOLS -> `String "POOLS" | PERSONAL -> `String "PERSONAL"

let domain_name_to_yojson = string_to_yojson

let active_directory_config_to_yojson (x : active_directory_config) =
  assoc_to_yojson
    [
      ("ServiceAccountSecretArn", Some (secrets_manager_arn_to_yojson x.service_account_secret_arn));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let register_workspace_directory_request_to_yojson (x : register_workspace_directory_request) =
  assoc_to_yojson
    [
      ( "ActiveDirectoryConfig",
        option_to_yojson active_directory_config_to_yojson x.active_directory_config );
      ("WorkspaceType", option_to_yojson workspace_type_to_yojson x.workspace_type);
      ( "MicrosoftEntraConfig",
        option_to_yojson microsoft_entra_config_to_yojson x.microsoft_entra_config );
      ("IdcInstanceArn", option_to_yojson ar_n_to_yojson x.idc_instance_arn);
      ("UserIdentityType", option_to_yojson user_identity_type_to_yojson x.user_identity_type);
      ( "WorkspaceDirectoryDescription",
        option_to_yojson workspace_directory_description_to_yojson x.workspace_directory_description
      );
      ( "WorkspaceDirectoryName",
        option_to_yojson workspace_directory_name_to_yojson x.workspace_directory_name );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Tenancy", option_to_yojson tenancy_to_yojson x.tenancy);
      ("EnableSelfService", option_to_yojson boolean_object_to_yojson x.enable_self_service);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
    ]

let failed_rebuild_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let rebuild_workspaces_result_to_yojson (x : rebuild_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_rebuild_workspace_requests_to_yojson x.failed_requests );
    ]

let rebuild_request_to_yojson (x : rebuild_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let rebuild_workspace_requests_to_yojson tree = list_to_yojson rebuild_request_to_yojson tree

let rebuild_workspaces_request_to_yojson (x : rebuild_workspaces_request) =
  assoc_to_yojson
    [
      ( "RebuildWorkspaceRequests",
        Some (rebuild_workspace_requests_to_yojson x.rebuild_workspace_requests) );
    ]

let failed_reboot_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let reboot_workspaces_result_to_yojson (x : reboot_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_reboot_workspace_requests_to_yojson x.failed_requests );
    ]

let reboot_request_to_yojson (x : reboot_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let reboot_workspace_requests_to_yojson tree = list_to_yojson reboot_request_to_yojson tree

let reboot_workspaces_request_to_yojson (x : reboot_workspaces_request) =
  assoc_to_yojson
    [
      ( "RebootWorkspaceRequests",
        Some (reboot_workspace_requests_to_yojson x.reboot_workspace_requests) );
    ]

let modify_workspace_state_result_to_yojson = unit_to_yojson

let target_workspace_state_to_yojson (x : target_workspace_state) =
  match x with ADMIN_MAINTENANCE -> `String "ADMIN_MAINTENANCE" | AVAILABLE -> `String "AVAILABLE"

let modify_workspace_state_request_to_yojson (x : modify_workspace_state_request) =
  assoc_to_yojson
    [
      ("WorkspaceState", Some (target_workspace_state_to_yojson x.workspace_state));
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
    ]

let unsupported_workspace_configuration_exception_to_yojson
    (x : unsupported_workspace_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_workspace_properties_result_to_yojson = unit_to_yojson

let running_mode_to_yojson (x : running_mode) =
  match x with
  | MANUAL -> `String "MANUAL"
  | ALWAYS_ON -> `String "ALWAYS_ON"
  | AUTO_STOP -> `String "AUTO_STOP"

let running_mode_auto_stop_timeout_in_minutes_to_yojson = int_to_yojson
let root_volume_size_gib_to_yojson = int_to_yojson
let user_volume_size_gib_to_yojson = int_to_yojson

let compute_to_yojson (x : compute) =
  match x with
  | GRAPHICS_GR6F_4XLARGE -> `String "GRAPHICS_GR6F_4XLARGE"
  | GRAPHICS_G6F_4XLARGE -> `String "GRAPHICS_G6F_4XLARGE"
  | GRAPHICS_G6F_2XLARGE -> `String "GRAPHICS_G6F_2XLARGE"
  | GRAPHICS_G6F_XLARGE -> `String "GRAPHICS_G6F_XLARGE"
  | GRAPHICS_G6F_LARGE -> `String "GRAPHICS_G6F_LARGE"
  | GRAPHICS_GR6_8XLARGE -> `String "GRAPHICS_GR6_8XLARGE"
  | GRAPHICS_GR6_4XLARGE -> `String "GRAPHICS_GR6_4XLARGE"
  | GRAPHICS_G6_16XLARGE -> `String "GRAPHICS_G6_16XLARGE"
  | GRAPHICS_G6_8XLARGE -> `String "GRAPHICS_G6_8XLARGE"
  | GRAPHICS_G6_4XLARGE -> `String "GRAPHICS_G6_4XLARGE"
  | GRAPHICS_G6_2XLARGE -> `String "GRAPHICS_G6_2XLARGE"
  | GRAPHICS_G6_XLARGE -> `String "GRAPHICS_G6_XLARGE"
  | GRAPHICSPRO_G4DN -> `String "GRAPHICSPRO_G4DN"
  | GRAPHICS_G4DN -> `String "GRAPHICS_G4DN"
  | GRAPHICSPRO -> `String "GRAPHICSPRO"
  | GENERALPURPOSE_8XLARGE -> `String "GENERALPURPOSE_8XLARGE"
  | GENERALPURPOSE_4XLARGE -> `String "GENERALPURPOSE_4XLARGE"
  | POWERPRO -> `String "POWERPRO"
  | GRAPHICS -> `String "GRAPHICS"
  | POWER -> `String "POWER"
  | PERFORMANCE -> `String "PERFORMANCE"
  | STANDARD -> `String "STANDARD"
  | VALUE -> `String "VALUE"

let protocol_to_yojson (x : protocol) =
  match x with WSP -> `String "WSP" | PCOIP -> `String "PCOIP"

let protocol_list_to_yojson tree = list_to_yojson protocol_to_yojson tree

let operating_system_name_to_yojson (x : operating_system_name) =
  match x with
  | ROCKY_8 -> `String "ROCKY_8"
  | RHEL_8 -> `String "RHEL_8"
  | WINDOWS_SERVER_2025 -> `String "WINDOWS_SERVER_2025"
  | WINDOWS_SERVER_2022 -> `String "WINDOWS_SERVER_2022"
  | WINDOWS_SERVER_2019 -> `String "WINDOWS_SERVER_2019"
  | WINDOWS_SERVER_2016 -> `String "WINDOWS_SERVER_2016"
  | WINDOWS_7 -> `String "WINDOWS_7"
  | WINDOWS_11 -> `String "WINDOWS_11"
  | WINDOWS_10 -> `String "WINDOWS_10"
  | UNKNOWN -> `String "UNKNOWN"
  | UBUNTU_22_04 -> `String "UBUNTU_22_04"
  | UBUNTU_20_04 -> `String "UBUNTU_20_04"
  | UBUNTU_18_04 -> `String "UBUNTU_18_04"
  | AMAZON_LINUX_2 -> `String "AMAZON_LINUX_2"

let aga_mode_for_work_space_enum_to_yojson (x : aga_mode_for_work_space_enum) =
  match x with
  | INHERITED -> `String "INHERITED"
  | DISABLED -> `String "DISABLED"
  | ENABLED_AUTO -> `String "ENABLED_AUTO"

let aga_preferred_protocol_for_work_space_to_yojson (x : aga_preferred_protocol_for_work_space) =
  match x with INHERITED -> `String "INHERITED" | NONE -> `String "NONE" | TCP -> `String "TCP"

let global_accelerator_for_work_space_to_yojson (x : global_accelerator_for_work_space) =
  assoc_to_yojson
    [
      ( "PreferredProtocol",
        option_to_yojson aga_preferred_protocol_for_work_space_to_yojson x.preferred_protocol );
      ("Mode", Some (aga_mode_for_work_space_enum_to_yojson x.mode));
    ]

let workspace_properties_to_yojson (x : workspace_properties) =
  assoc_to_yojson
    [
      ( "GlobalAccelerator",
        option_to_yojson global_accelerator_for_work_space_to_yojson x.global_accelerator );
      ( "OperatingSystemName",
        option_to_yojson operating_system_name_to_yojson x.operating_system_name );
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ("ComputeTypeName", option_to_yojson compute_to_yojson x.compute_type_name);
      ("UserVolumeSizeGib", option_to_yojson user_volume_size_gib_to_yojson x.user_volume_size_gib);
      ("RootVolumeSizeGib", option_to_yojson root_volume_size_gib_to_yojson x.root_volume_size_gib);
      ( "RunningModeAutoStopTimeoutInMinutes",
        option_to_yojson running_mode_auto_stop_timeout_in_minutes_to_yojson
          x.running_mode_auto_stop_timeout_in_minutes );
      ("RunningMode", option_to_yojson running_mode_to_yojson x.running_mode);
    ]

let data_replication_to_yojson (x : data_replication) =
  match x with
  | PRIMARY_AS_SOURCE -> `String "PRIMARY_AS_SOURCE"
  | NO_REPLICATION -> `String "NO_REPLICATION"

let modify_workspace_properties_request_to_yojson (x : modify_workspace_properties_request) =
  assoc_to_yojson
    [
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
      ("WorkspaceProperties", option_to_yojson workspace_properties_to_yojson x.workspace_properties);
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
    ]

let modify_workspace_creation_properties_result_to_yojson = unit_to_yojson
let default_ou_to_yojson = string_to_yojson
let security_group_id_to_yojson = string_to_yojson

let workspace_creation_properties_to_yojson (x : workspace_creation_properties) =
  assoc_to_yojson
    [
      ("InstanceIamRoleArn", option_to_yojson ar_n_to_yojson x.instance_iam_role_arn);
      ("EnableMaintenanceMode", option_to_yojson boolean_object_to_yojson x.enable_maintenance_mode);
      ( "UserEnabledAsLocalAdministrator",
        option_to_yojson boolean_object_to_yojson x.user_enabled_as_local_administrator );
      ( "CustomSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.custom_security_group_id );
      ("DefaultOu", option_to_yojson default_ou_to_yojson x.default_ou);
      ("EnableInternetAccess", option_to_yojson boolean_object_to_yojson x.enable_internet_access);
    ]

let modify_workspace_creation_properties_request_to_yojson
    (x : modify_workspace_creation_properties_request) =
  assoc_to_yojson
    [
      ( "WorkspaceCreationProperties",
        Some (workspace_creation_properties_to_yojson x.workspace_creation_properties) );
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_workspace_access_properties_result_to_yojson = unit_to_yojson

let access_property_value_to_yojson (x : access_property_value) =
  match x with DENY -> `String "DENY" | ALLOW -> `String "ALLOW"

let access_endpoint_type_to_yojson (x : access_endpoint_type) =
  match x with STREAMING_WSP -> `String "STREAMING_WSP"

let alphanumeric_dash_underscore_non_empty_string_to_yojson = string_to_yojson

let access_endpoint_to_yojson (x : access_endpoint) =
  assoc_to_yojson
    [
      ( "VpcEndpointId",
        option_to_yojson alphanumeric_dash_underscore_non_empty_string_to_yojson x.vpc_endpoint_id
      );
      ("AccessEndpointType", option_to_yojson access_endpoint_type_to_yojson x.access_endpoint_type);
    ]

let access_endpoint_list_to_yojson tree = list_to_yojson access_endpoint_to_yojson tree

let internet_fallback_protocol_to_yojson (x : internet_fallback_protocol) =
  match x with PCOIP -> `String "PCOIP"

let internet_fallback_protocol_list_to_yojson tree =
  list_to_yojson internet_fallback_protocol_to_yojson tree

let access_endpoint_config_to_yojson (x : access_endpoint_config) =
  assoc_to_yojson
    [
      ( "InternetFallbackProtocols",
        option_to_yojson internet_fallback_protocol_list_to_yojson x.internet_fallback_protocols );
      ("AccessEndpoints", Some (access_endpoint_list_to_yojson x.access_endpoints));
    ]

let workspace_access_properties_to_yojson (x : workspace_access_properties) =
  assoc_to_yojson
    [
      ( "AccessEndpointConfig",
        option_to_yojson access_endpoint_config_to_yojson x.access_endpoint_config );
      ( "DeviceTypeWorkSpacesThinClient",
        option_to_yojson access_property_value_to_yojson x.device_type_work_spaces_thin_client );
      ("DeviceTypeLinux", option_to_yojson access_property_value_to_yojson x.device_type_linux);
      ( "DeviceTypeZeroClient",
        option_to_yojson access_property_value_to_yojson x.device_type_zero_client );
      ( "DeviceTypeChromeOs",
        option_to_yojson access_property_value_to_yojson x.device_type_chrome_os );
      ("DeviceTypeAndroid", option_to_yojson access_property_value_to_yojson x.device_type_android);
      ("DeviceTypeIos", option_to_yojson access_property_value_to_yojson x.device_type_ios);
      ("DeviceTypeWeb", option_to_yojson access_property_value_to_yojson x.device_type_web);
      ("DeviceTypeOsx", option_to_yojson access_property_value_to_yojson x.device_type_osx);
      ("DeviceTypeWindows", option_to_yojson access_property_value_to_yojson x.device_type_windows);
    ]

let modify_workspace_access_properties_request_to_yojson
    (x : modify_workspace_access_properties_request) =
  assoc_to_yojson
    [
      ( "WorkspaceAccessProperties",
        Some (workspace_access_properties_to_yojson x.workspace_access_properties) );
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let modify_streaming_properties_result_to_yojson = unit_to_yojson

let streaming_experience_preferred_protocol_enum_to_yojson
    (x : streaming_experience_preferred_protocol_enum) =
  match x with UDP -> `String "UDP" | TCP -> `String "TCP"

let user_setting_action_enum_to_yojson (x : user_setting_action_enum) =
  match x with
  | SMART_CARD -> `String "SMART_CARD"
  | PRINTING_TO_LOCAL_DEVICE -> `String "PRINTING_TO_LOCAL_DEVICE"
  | CLIPBOARD_COPY_TO_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
  | CLIPBOARD_COPY_FROM_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"

let user_setting_permission_enum_to_yojson (x : user_setting_permission_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let maximum_length_to_yojson = int_to_yojson

let user_setting_to_yojson (x : user_setting) =
  assoc_to_yojson
    [
      ("MaximumLength", option_to_yojson maximum_length_to_yojson x.maximum_length);
      ("Permission", Some (user_setting_permission_enum_to_yojson x.permission));
      ("Action", Some (user_setting_action_enum_to_yojson x.action));
    ]

let user_settings_to_yojson tree = list_to_yojson user_setting_to_yojson tree

let storage_connector_type_enum_to_yojson (x : storage_connector_type_enum) =
  match x with HOME_FOLDER -> `String "HOME_FOLDER"

let storage_connector_status_enum_to_yojson (x : storage_connector_status_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let storage_connector_to_yojson (x : storage_connector) =
  assoc_to_yojson
    [
      ("Status", Some (storage_connector_status_enum_to_yojson x.status));
      ("ConnectorType", Some (storage_connector_type_enum_to_yojson x.connector_type));
    ]

let storage_connectors_to_yojson tree = list_to_yojson storage_connector_to_yojson tree

let aga_mode_for_directory_enum_to_yojson (x : aga_mode_for_directory_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED_AUTO -> `String "ENABLED_AUTO"

let aga_preferred_protocol_for_directory_to_yojson (x : aga_preferred_protocol_for_directory) =
  match x with NONE -> `String "NONE" | TCP -> `String "TCP"

let global_accelerator_for_directory_to_yojson (x : global_accelerator_for_directory) =
  assoc_to_yojson
    [
      ( "PreferredProtocol",
        option_to_yojson aga_preferred_protocol_for_directory_to_yojson x.preferred_protocol );
      ("Mode", Some (aga_mode_for_directory_enum_to_yojson x.mode));
    ]

let streaming_properties_to_yojson (x : streaming_properties) =
  assoc_to_yojson
    [
      ( "GlobalAccelerator",
        option_to_yojson global_accelerator_for_directory_to_yojson x.global_accelerator );
      ("StorageConnectors", option_to_yojson storage_connectors_to_yojson x.storage_connectors);
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
      ( "StreamingExperiencePreferredProtocol",
        option_to_yojson streaming_experience_preferred_protocol_enum_to_yojson
          x.streaming_experience_preferred_protocol );
    ]

let modify_streaming_properties_request_to_yojson (x : modify_streaming_properties_request) =
  assoc_to_yojson
    [
      ("StreamingProperties", option_to_yojson streaming_properties_to_yojson x.streaming_properties);
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let modify_selfservice_permissions_result_to_yojson = unit_to_yojson

let reconnect_enum_to_yojson (x : reconnect_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let selfservice_permissions_to_yojson (x : selfservice_permissions) =
  assoc_to_yojson
    [
      ("RebuildWorkspace", option_to_yojson reconnect_enum_to_yojson x.rebuild_workspace);
      ("SwitchRunningMode", option_to_yojson reconnect_enum_to_yojson x.switch_running_mode);
      ("ChangeComputeType", option_to_yojson reconnect_enum_to_yojson x.change_compute_type);
      ("IncreaseVolumeSize", option_to_yojson reconnect_enum_to_yojson x.increase_volume_size);
      ("RestartWorkspace", option_to_yojson reconnect_enum_to_yojson x.restart_workspace);
    ]

let modify_selfservice_permissions_request_to_yojson (x : modify_selfservice_permissions_request) =
  assoc_to_yojson
    [
      ("SelfservicePermissions", Some (selfservice_permissions_to_yojson x.selfservice_permissions));
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let modify_saml_properties_result_to_yojson = unit_to_yojson

let saml_status_enum_to_yojson (x : saml_status_enum) =
  match x with
  | ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK -> `String "ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"

let saml_user_access_url_to_yojson = string_to_yojson

let saml_properties_to_yojson (x : saml_properties) =
  assoc_to_yojson
    [
      ( "RelayStateParameterName",
        option_to_yojson non_empty_string_to_yojson x.relay_state_parameter_name );
      ("UserAccessUrl", option_to_yojson saml_user_access_url_to_yojson x.user_access_url);
      ("Status", option_to_yojson saml_status_enum_to_yojson x.status);
    ]

let deletable_saml_property_to_yojson (x : deletable_saml_property) =
  match x with
  | SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME ->
      `String "SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME"
  | SAML_PROPERTIES_USER_ACCESS_URL -> `String "SAML_PROPERTIES_USER_ACCESS_URL"

let deletable_saml_properties_list_to_yojson tree =
  list_to_yojson deletable_saml_property_to_yojson tree

let modify_saml_properties_request_to_yojson (x : modify_saml_properties_request) =
  assoc_to_yojson
    [
      ( "PropertiesToDelete",
        option_to_yojson deletable_saml_properties_list_to_yojson x.properties_to_delete );
      ("SamlProperties", option_to_yojson saml_properties_to_yojson x.saml_properties);
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let modify_endpoint_encryption_mode_response_to_yojson = unit_to_yojson

let endpoint_encryption_mode_to_yojson (x : endpoint_encryption_mode) =
  match x with FIPS_VALIDATED -> `String "FIPS_VALIDATED" | STANDARD_TLS -> `String "STANDARD_TLS"

let modify_endpoint_encryption_mode_request_to_yojson (x : modify_endpoint_encryption_mode_request)
    =
  assoc_to_yojson
    [
      ( "EndpointEncryptionMode",
        Some (endpoint_encryption_mode_to_yojson x.endpoint_encryption_mode) );
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
    ]

let modify_client_properties_result_to_yojson = unit_to_yojson

let log_upload_enum_to_yojson (x : log_upload_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let client_properties_to_yojson (x : client_properties) =
  assoc_to_yojson
    [
      ("LogUploadEnabled", option_to_yojson log_upload_enum_to_yojson x.log_upload_enabled);
      ("ReconnectEnabled", option_to_yojson reconnect_enum_to_yojson x.reconnect_enabled);
    ]

let modify_client_properties_request_to_yojson (x : modify_client_properties_request) =
  assoc_to_yojson
    [
      ("ClientProperties", Some (client_properties_to_yojson x.client_properties));
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
    ]

let modify_certificate_based_auth_properties_result_to_yojson = unit_to_yojson

let certificate_based_auth_status_enum_to_yojson (x : certificate_based_auth_status_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let certificate_authority_arn_to_yojson = string_to_yojson

let certificate_based_auth_properties_to_yojson (x : certificate_based_auth_properties) =
  assoc_to_yojson
    [
      ( "CertificateAuthorityArn",
        option_to_yojson certificate_authority_arn_to_yojson x.certificate_authority_arn );
      ("Status", option_to_yojson certificate_based_auth_status_enum_to_yojson x.status);
    ]

let deletable_certificate_based_auth_property_to_yojson
    (x : deletable_certificate_based_auth_property) =
  match x with
  | CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN ->
      `String "CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN"

let deletable_certificate_based_auth_properties_list_to_yojson tree =
  list_to_yojson deletable_certificate_based_auth_property_to_yojson tree

let modify_certificate_based_auth_properties_request_to_yojson
    (x : modify_certificate_based_auth_properties_request) =
  assoc_to_yojson
    [
      ( "PropertiesToDelete",
        option_to_yojson deletable_certificate_based_auth_properties_list_to_yojson
          x.properties_to_delete );
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let message_to_yojson = string_to_yojson

let modify_account_result_to_yojson (x : modify_account_result) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let dedicated_tenancy_support_enum_to_yojson (x : dedicated_tenancy_support_enum) =
  match x with ENABLED -> `String "ENABLED"

let dedicated_tenancy_management_cidr_range_to_yojson = string_to_yojson

let modify_account_request_to_yojson (x : modify_account_request) =
  assoc_to_yojson
    [
      ( "DedicatedTenancyManagementCidrRange",
        option_to_yojson dedicated_tenancy_management_cidr_range_to_yojson
          x.dedicated_tenancy_management_cidr_range );
      ( "DedicatedTenancySupport",
        option_to_yojson dedicated_tenancy_support_enum_to_yojson x.dedicated_tenancy_support );
    ]

let migrate_workspace_result_to_yojson (x : migrate_workspace_result) =
  assoc_to_yojson
    [
      ("TargetWorkspaceId", option_to_yojson workspace_id_to_yojson x.target_workspace_id);
      ("SourceWorkspaceId", option_to_yojson workspace_id_to_yojson x.source_workspace_id);
    ]

let migrate_workspace_request_to_yojson (x : migrate_workspace_request) =
  assoc_to_yojson
    [
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ("SourceWorkspaceId", Some (workspace_id_to_yojson x.source_workspace_id));
    ]

let dedicated_tenancy_cidr_range_list_to_yojson tree =
  list_to_yojson dedicated_tenancy_management_cidr_range_to_yojson tree

let pagination_token_to_yojson = string_to_yojson

let list_available_management_cidr_ranges_result_to_yojson
    (x : list_available_management_cidr_ranges_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ManagementCidrRanges",
        option_to_yojson dedicated_tenancy_cidr_range_list_to_yojson x.management_cidr_ranges );
    ]

let management_cidr_range_constraint_to_yojson = string_to_yojson
let management_cidr_range_max_results_to_yojson = int_to_yojson

let list_available_management_cidr_ranges_request_to_yojson
    (x : list_available_management_cidr_ranges_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson management_cidr_range_max_results_to_yojson x.max_results);
      ( "ManagementCidrRangeConstraint",
        Some (management_cidr_range_constraint_to_yojson x.management_cidr_range_constraint) );
    ]

let account_link_list_to_yojson tree = list_to_yojson account_link_to_yojson tree

let list_account_links_result_to_yojson (x : list_account_links_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AccountLinks", option_to_yojson account_link_list_to_yojson x.account_links);
    ]

let link_status_filter_list_to_yojson tree = list_to_yojson account_link_status_enum_to_yojson tree
let limit_to_yojson = int_to_yojson

let list_account_links_request_to_yojson (x : list_account_links_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("LinkStatusFilter", option_to_yojson link_status_filter_list_to_yojson x.link_status_filter);
    ]

let import_workspace_image_result_to_yojson (x : import_workspace_image_result) =
  assoc_to_yojson [ ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id) ]

let ec2_image_id_to_yojson = string_to_yojson

let workspace_image_ingestion_process_to_yojson (x : workspace_image_ingestion_process) =
  match x with
  | BYOL_GRAPHICS_G4DN_BYOP -> `String "BYOL_GRAPHICS_G4DN_BYOP"
  | BYOL_REGULAR_BYOP -> `String "BYOL_REGULAR_BYOP"
  | BYOL_GRAPHICS_G4DN_WSP -> `String "BYOL_GRAPHICS_G4DN_WSP"
  | BYOL_REGULAR_WSP -> `String "BYOL_REGULAR_WSP"
  | BYOL_GRAPHICS_G4DN -> `String "BYOL_GRAPHICS_G4DN"
  | BYOL_GRAPHICSPRO -> `String "BYOL_GRAPHICSPRO"
  | BYOL_GRAPHICS -> `String "BYOL_GRAPHICS"
  | BYOL_REGULAR -> `String "BYOL_REGULAR"

let workspace_image_name_to_yojson = string_to_yojson
let workspace_image_description_to_yojson = string_to_yojson

let application_to_yojson (x : application) =
  match x with
  | Microsoft_Office_2019 -> `String "Microsoft_Office_2019"
  | Microsoft_Office_2016 -> `String "Microsoft_Office_2016"

let application_list_to_yojson tree = list_to_yojson application_to_yojson tree

let import_workspace_image_request_to_yojson (x : import_workspace_image_request) =
  assoc_to_yojson
    [
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ImageDescription", Some (workspace_image_description_to_yojson x.image_description));
      ("ImageName", Some (workspace_image_name_to_yojson x.image_name));
      ("IngestionProcess", Some (workspace_image_ingestion_process_to_yojson x.ingestion_process));
      ("Ec2ImageId", Some (ec2_image_id_to_yojson x.ec2_image_id));
    ]

let custom_workspace_image_import_state_to_yojson (x : custom_workspace_image_import_state) =
  match x with
  | ERROR -> `String "ERROR"
  | COMPLETED -> `String "COMPLETED"
  | PUBLISHING -> `String "PUBLISHING"
  | VALIDATING -> `String "VALIDATING"
  | GENERALIZING -> `String "GENERALIZING"
  | INSTALLING_COMPONENTS -> `String "INSTALLING_COMPONENTS"
  | CREATING_TEST_INSTANCE -> `String "CREATING_TEST_INSTANCE"
  | IMAGE_TESTING_GENERALIZATION -> `String "IMAGE_TESTING_GENERALIZATION"
  | IMAGE_COMPATIBILITY_CHECKING -> `String "IMAGE_COMPATIBILITY_CHECKING"
  | UPDATING_OPERATING_SYSTEM -> `String "UPDATING_OPERATING_SYSTEM"
  | IMAGE_TESTING_START -> `String "IMAGE_TESTING_START"
  | PROCESSING_SOURCE_IMAGE -> `String "PROCESSING_SOURCE_IMAGE"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PENDING -> `String "PENDING"

let import_custom_workspace_image_result_to_yojson (x : import_custom_workspace_image_result) =
  assoc_to_yojson
    [
      ("State", option_to_yojson custom_workspace_image_import_state_to_yojson x.state);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
    ]

let image_compute_type_to_yojson (x : image_compute_type) =
  match x with
  | GRAPHICS_G6 -> `String "GRAPHICS_G6"
  | GRAPHICS_G4DN -> `String "GRAPHICS_G4DN"
  | BASE -> `String "BASE"

let custom_image_protocol_to_yojson (x : custom_image_protocol) =
  match x with BYOP -> `String "BYOP" | DCV -> `String "DCV" | PCOIP -> `String "PCOIP"

let ec2_import_task_id_to_yojson = string_to_yojson
let image_build_version_arn_to_yojson = string_to_yojson

let image_source_identifier_to_yojson (x : image_source_identifier) =
  match x with
  | Ec2ImageId arg -> assoc_to_yojson [ ("Ec2ImageId", Some (ec2_image_id_to_yojson arg)) ]
  | ImageBuildVersionArn arg ->
      assoc_to_yojson [ ("ImageBuildVersionArn", Some (image_build_version_arn_to_yojson arg)) ]
  | Ec2ImportTaskId arg ->
      assoc_to_yojson [ ("Ec2ImportTaskId", Some (ec2_import_task_id_to_yojson arg)) ]

let infrastructure_configuration_arn_to_yojson = string_to_yojson
let platform_to_yojson (x : platform) = match x with WINDOWS -> `String "WINDOWS"

let os_version_to_yojson (x : os_version) =
  match x with Windows_11 -> `String "Windows_11" | Windows_10 -> `String "Windows_10"

let import_custom_workspace_image_request_to_yojson (x : import_custom_workspace_image_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OsVersion", Some (os_version_to_yojson x.os_version));
      ("Platform", Some (platform_to_yojson x.platform));
      ( "InfrastructureConfigurationArn",
        Some (infrastructure_configuration_arn_to_yojson x.infrastructure_configuration_arn) );
      ("ImageSource", Some (image_source_identifier_to_yojson x.image_source));
      ("Protocol", Some (custom_image_protocol_to_yojson x.protocol));
      ("ComputeType", Some (image_compute_type_to_yojson x.compute_type));
      ("ImageDescription", Some (workspace_image_description_to_yojson x.image_description));
      ("ImageName", Some (workspace_image_name_to_yojson x.image_name));
    ]

let client_url_to_yojson = string_to_yojson
let client_email_to_yojson = string_to_yojson
let client_login_message_to_yojson = string_to_yojson
let client_locale_to_yojson = string_to_yojson

let login_message_to_yojson tree =
  map_to_yojson client_locale_to_yojson client_login_message_to_yojson tree

let default_client_branding_attributes_to_yojson (x : default_client_branding_attributes) =
  assoc_to_yojson
    [
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("LogoUrl", option_to_yojson client_url_to_yojson x.logo_url);
    ]

let ios_client_branding_attributes_to_yojson (x : ios_client_branding_attributes) =
  assoc_to_yojson
    [
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("Logo3xUrl", option_to_yojson client_url_to_yojson x.logo3x_url);
      ("Logo2xUrl", option_to_yojson client_url_to_yojson x.logo2x_url);
      ("LogoUrl", option_to_yojson client_url_to_yojson x.logo_url);
    ]

let import_client_branding_result_to_yojson (x : import_client_branding_result) =
  assoc_to_yojson
    [
      ( "DeviceTypeWeb",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_web );
      ( "DeviceTypeLinux",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_linux );
      ("DeviceTypeIos", option_to_yojson ios_client_branding_attributes_to_yojson x.device_type_ios);
      ( "DeviceTypeAndroid",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_android );
      ( "DeviceTypeOsx",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_osx );
      ( "DeviceTypeWindows",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_windows );
    ]

let default_logo_to_yojson = blob_to_yojson

let default_import_client_branding_attributes_to_yojson
    (x : default_import_client_branding_attributes) =
  assoc_to_yojson
    [
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("Logo", option_to_yojson default_logo_to_yojson x.logo);
    ]

let ios_logo_to_yojson = blob_to_yojson
let ios2_x_logo_to_yojson = blob_to_yojson
let ios3_x_logo_to_yojson = blob_to_yojson

let ios_import_client_branding_attributes_to_yojson (x : ios_import_client_branding_attributes) =
  assoc_to_yojson
    [
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("Logo3x", option_to_yojson ios3_x_logo_to_yojson x.logo3x);
      ("Logo2x", option_to_yojson ios2_x_logo_to_yojson x.logo2x);
      ("Logo", option_to_yojson ios_logo_to_yojson x.logo);
    ]

let import_client_branding_request_to_yojson (x : import_client_branding_request) =
  assoc_to_yojson
    [
      ( "DeviceTypeWeb",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_web );
      ( "DeviceTypeLinux",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_linux );
      ( "DeviceTypeIos",
        option_to_yojson ios_import_client_branding_attributes_to_yojson x.device_type_ios );
      ( "DeviceTypeAndroid",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_android
      );
      ( "DeviceTypeOsx",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_osx );
      ( "DeviceTypeWindows",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_windows
      );
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let get_account_link_result_to_yojson (x : get_account_link_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let get_account_link_request_to_yojson (x : get_account_link_request) =
  assoc_to_yojson
    [
      ("LinkedAccountId", option_to_yojson aws_account_to_yojson x.linked_account_id);
      ("LinkId", option_to_yojson link_id_to_yojson x.link_id);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let work_space_associated_resource_type_to_yojson (x : work_space_associated_resource_type) =
  match x with APPLICATION -> `String "APPLICATION"

let association_state_to_yojson (x : association_state) =
  match x with
  | REMOVED -> `String "REMOVED"
  | COMPLETED -> `String "COMPLETED"
  | ERROR -> `String "ERROR"
  | UNINSTALLING -> `String "UNINSTALLING"
  | INSTALLING -> `String "INSTALLING"
  | PENDING_UNINSTALL_DEPLOYMENT -> `String "PENDING_UNINSTALL_DEPLOYMENT"
  | PENDING_UNINSTALL -> `String "PENDING_UNINSTALL"
  | PENDING_INSTALL_DEPLOYMENT -> `String "PENDING_INSTALL_DEPLOYMENT"
  | PENDING_INSTALL -> `String "PENDING_INSTALL"

let association_error_code_to_yojson (x : association_error_code) =
  match x with
  | APPLICATION_OLDVERSIONEXIST_FAILURE -> `String "ValidationError.ApplicationOldVersionExists"
  | WORKSPACE_UNREACHABLE -> `String "DeploymentError.WorkspaceUnreachable"
  | INTERNAL_SERVER_ERROR -> `String "DeploymentError.InternalServerError"
  | UNSUPPORTED_OPERATING_SYSTEM -> `String "ValidationError.UnsupportedOperatingSystem"
  | INSUFFICIENT_MEMORY -> `String "ValidationError.InsufficientMemory"
  | INSUFFICIENT_DISKSPACE -> `String "ValidationError.InsufficientDiskSpace"

let string2048_to_yojson = string_to_yojson

let association_state_reason_to_yojson (x : association_state_reason) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string2048_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson association_error_code_to_yojson x.error_code);
    ]

let workspace_resource_association_to_yojson (x : workspace_resource_association) =
  assoc_to_yojson
    [
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ( "AssociatedResourceType",
        option_to_yojson work_space_associated_resource_type_to_yojson x.associated_resource_type );
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
    ]

let disassociate_workspace_application_result_to_yojson
    (x : disassociate_workspace_application_result) =
  assoc_to_yojson
    [ ("Association", option_to_yojson workspace_resource_association_to_yojson x.association) ]

let work_space_application_id_to_yojson = string_to_yojson

let disassociate_workspace_application_request_to_yojson
    (x : disassociate_workspace_application_request) =
  assoc_to_yojson
    [
      ("ApplicationId", Some (work_space_application_id_to_yojson x.application_id));
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
    ]

let disassociate_ip_groups_result_to_yojson = unit_to_yojson
let ip_group_id_list_to_yojson tree = list_to_yojson ip_group_id_to_yojson tree

let disassociate_ip_groups_request_to_yojson (x : disassociate_ip_groups_request) =
  assoc_to_yojson
    [
      ("GroupIds", Some (ip_group_id_list_to_yojson x.group_ids));
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
    ]

let disassociate_connection_alias_result_to_yojson = unit_to_yojson

let disassociate_connection_alias_request_to_yojson (x : disassociate_connection_alias_request) =
  assoc_to_yojson [ ("AliasId", Some (connection_alias_id_to_yojson x.alias_id)) ]

let authentication_type_to_yojson (x : authentication_type) = match x with SAML -> `String "SAML"

let session_connection_state_to_yojson (x : session_connection_state) =
  match x with NOT_CONNECTED -> `String "NOT_CONNECTED" | CONNECTED -> `String "CONNECTED"

let session_instance_id_to_yojson = string_to_yojson

let network_access_configuration_to_yojson (x : network_access_configuration) =
  assoc_to_yojson
    [
      ("EniId", option_to_yojson non_empty_string_to_yojson x.eni_id);
      ("EniPrivateIpAddress", option_to_yojson non_empty_string_to_yojson x.eni_private_ip_address);
    ]

let workspaces_pool_user_id_to_yojson = string_to_yojson

let workspaces_pool_session_to_yojson (x : workspaces_pool_session) =
  assoc_to_yojson
    [
      ("UserId", Some (workspaces_pool_user_id_to_yojson x.user_id));
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "NetworkAccessConfiguration",
        option_to_yojson network_access_configuration_to_yojson x.network_access_configuration );
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
      ("InstanceId", option_to_yojson session_instance_id_to_yojson x.instance_id);
      ("SessionId", Some (amazon_uuid_to_yojson x.session_id));
      ("ConnectionState", option_to_yojson session_connection_state_to_yojson x.connection_state);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
    ]

let workspaces_pool_sessions_to_yojson tree = list_to_yojson workspaces_pool_session_to_yojson tree

let describe_workspaces_pool_sessions_result_to_yojson
    (x : describe_workspaces_pool_sessions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Sessions", option_to_yojson workspaces_pool_sessions_to_yojson x.sessions);
    ]

let limit50_to_yojson = int_to_yojson

let describe_workspaces_pool_sessions_request_to_yojson
    (x : describe_workspaces_pool_sessions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit50_to_yojson x.limit);
      ("UserId", option_to_yojson workspaces_pool_user_id_to_yojson x.user_id);
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
    ]

let workspaces_pools_to_yojson tree = list_to_yojson workspaces_pool_to_yojson tree

let describe_workspaces_pools_result_to_yojson (x : describe_workspaces_pools_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("WorkspacesPools", option_to_yojson workspaces_pools_to_yojson x.workspaces_pools);
    ]

let workspaces_pool_ids_to_yojson tree = list_to_yojson workspaces_pool_id_to_yojson tree

let describe_workspaces_pools_filter_name_to_yojson (x : describe_workspaces_pools_filter_name) =
  match x with POOLNAME -> `String "PoolName"

let describe_workspaces_pools_filter_value_to_yojson = string_to_yojson

let describe_workspaces_pools_filter_values_to_yojson tree =
  list_to_yojson describe_workspaces_pools_filter_value_to_yojson tree

let describe_workspaces_pools_filter_operator_to_yojson
    (x : describe_workspaces_pools_filter_operator) =
  match x with
  | NOTCONTAINS -> `String "NOTCONTAINS"
  | CONTAINS -> `String "CONTAINS"
  | NOTEQUALS -> `String "NOTEQUALS"
  | EQUALS -> `String "EQUALS"

let describe_workspaces_pools_filter_to_yojson (x : describe_workspaces_pools_filter) =
  assoc_to_yojson
    [
      ("Operator", Some (describe_workspaces_pools_filter_operator_to_yojson x.operator));
      ("Values", Some (describe_workspaces_pools_filter_values_to_yojson x.values));
      ("Name", Some (describe_workspaces_pools_filter_name_to_yojson x.name));
    ]

let describe_workspaces_pools_filters_to_yojson tree =
  list_to_yojson describe_workspaces_pools_filter_to_yojson tree

let describe_workspaces_pools_request_to_yojson (x : describe_workspaces_pools_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("Filters", option_to_yojson describe_workspaces_pools_filters_to_yojson x.filters);
      ("PoolIds", option_to_yojson workspaces_pool_ids_to_yojson x.pool_ids);
    ]

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson [ ("SnapshotTime", option_to_yojson timestamp_to_yojson x.snapshot_time) ]

let snapshot_list_to_yojson tree = list_to_yojson snapshot_to_yojson tree

let describe_workspace_snapshots_result_to_yojson (x : describe_workspace_snapshots_result) =
  assoc_to_yojson
    [
      ("RestoreSnapshots", option_to_yojson snapshot_list_to_yojson x.restore_snapshots);
      ("RebuildSnapshots", option_to_yojson snapshot_list_to_yojson x.rebuild_snapshots);
    ]

let describe_workspace_snapshots_request_to_yojson (x : describe_workspace_snapshots_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let connection_state_to_yojson (x : connection_state) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | DISCONNECTED -> `String "DISCONNECTED"
  | CONNECTED -> `String "CONNECTED"

let workspace_connection_status_to_yojson (x : workspace_connection_status) =
  assoc_to_yojson
    [
      ( "LastKnownUserConnectionTimestamp",
        option_to_yojson timestamp_to_yojson x.last_known_user_connection_timestamp );
      ( "ConnectionStateCheckTimestamp",
        option_to_yojson timestamp_to_yojson x.connection_state_check_timestamp );
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
    ]

let workspace_connection_status_list_to_yojson tree =
  list_to_yojson workspace_connection_status_to_yojson tree

let describe_workspaces_connection_status_result_to_yojson
    (x : describe_workspaces_connection_status_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "WorkspacesConnectionStatus",
        option_to_yojson workspace_connection_status_list_to_yojson x.workspaces_connection_status
      );
    ]

let workspace_id_list_to_yojson tree = list_to_yojson workspace_id_to_yojson tree

let describe_workspaces_connection_status_request_to_yojson
    (x : describe_workspaces_connection_status_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("WorkspaceIds", option_to_yojson workspace_id_list_to_yojson x.workspace_ids);
    ]

let user_name_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson
let ipv6_address_to_yojson = string_to_yojson

let workspace_state_to_yojson (x : workspace_state) =
  match x with
  | ERROR -> `String "ERROR"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | UPDATING -> `String "UPDATING"
  | SUSPENDED -> `String "SUSPENDED"
  | TERMINATED -> `String "TERMINATED"
  | TERMINATING -> `String "TERMINATING"
  | ADMIN_MAINTENANCE -> `String "ADMIN_MAINTENANCE"
  | MAINTENANCE -> `String "MAINTENANCE"
  | RESTORING -> `String "RESTORING"
  | REBUILDING -> `String "REBUILDING"
  | STARTING -> `String "STARTING"
  | REBOOTING -> `String "REBOOTING"
  | UNHEALTHY -> `String "UNHEALTHY"
  | IMPAIRED -> `String "IMPAIRED"
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"

let workspace_error_code_to_yojson = string_to_yojson
let computer_name_to_yojson = string_to_yojson
let volume_encryption_key_to_yojson = string_to_yojson
let workspace_name_to_yojson = string_to_yojson

let modification_resource_enum_to_yojson (x : modification_resource_enum) =
  match x with
  | PROTOCOL -> `String "PROTOCOL"
  | COMPUTE_TYPE -> `String "COMPUTE_TYPE"
  | USER_VOLUME -> `String "USER_VOLUME"
  | ROOT_VOLUME -> `String "ROOT_VOLUME"

let modification_state_enum_to_yojson (x : modification_state_enum) =
  match x with
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_INITIATED -> `String "UPDATE_INITIATED"

let modification_state_to_yojson (x : modification_state) =
  assoc_to_yojson
    [
      ("State", option_to_yojson modification_state_enum_to_yojson x.state);
      ("Resource", option_to_yojson modification_resource_enum_to_yojson x.resource);
    ]

let modification_state_list_to_yojson tree = list_to_yojson modification_state_to_yojson tree
let region_to_yojson = string_to_yojson

let standby_workspace_relationship_type_to_yojson (x : standby_workspace_relationship_type) =
  match x with STANDBY -> `String "STANDBY" | PRIMARY -> `String "PRIMARY"

let related_workspace_properties_to_yojson (x : related_workspace_properties) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson standby_workspace_relationship_type_to_yojson x.type_);
      ("State", option_to_yojson workspace_state_to_yojson x.state);
      ("Region", option_to_yojson region_to_yojson x.region);
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
    ]

let related_workspaces_to_yojson tree = list_to_yojson related_workspace_properties_to_yojson tree

let data_replication_settings_to_yojson (x : data_replication_settings) =
  assoc_to_yojson
    [
      ("RecoverySnapshotTime", option_to_yojson timestamp_to_yojson x.recovery_snapshot_time);
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
    ]

let standby_workspaces_properties_to_yojson (x : standby_workspaces_properties) =
  assoc_to_yojson
    [
      ("RecoverySnapshotTime", option_to_yojson timestamp_to_yojson x.recovery_snapshot_time);
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
      ("StandbyWorkspaceId", option_to_yojson workspace_id_to_yojson x.standby_workspace_id);
    ]

let standby_workspaces_properties_list_to_yojson tree =
  list_to_yojson standby_workspaces_properties_to_yojson tree

let workspace_to_yojson (x : workspace) =
  assoc_to_yojson
    [
      ( "StandbyWorkspacesProperties",
        option_to_yojson standby_workspaces_properties_list_to_yojson
          x.standby_workspaces_properties );
      ( "DataReplicationSettings",
        option_to_yojson data_replication_settings_to_yojson x.data_replication_settings );
      ("RelatedWorkspaces", option_to_yojson related_workspaces_to_yojson x.related_workspaces);
      ( "ModificationStates",
        option_to_yojson modification_state_list_to_yojson x.modification_states );
      ("WorkspaceProperties", option_to_yojson workspace_properties_to_yojson x.workspace_properties);
      ("WorkspaceName", option_to_yojson workspace_name_to_yojson x.workspace_name);
      ( "RootVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.root_volume_encryption_enabled );
      ( "UserVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.user_volume_encryption_enabled );
      ( "VolumeEncryptionKey",
        option_to_yojson volume_encryption_key_to_yojson x.volume_encryption_key );
      ("ComputerName", option_to_yojson computer_name_to_yojson x.computer_name);
      ("ErrorCode", option_to_yojson workspace_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("State", option_to_yojson workspace_state_to_yojson x.state);
      ("Ipv6Address", option_to_yojson ipv6_address_to_yojson x.ipv6_address);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
    ]

let workspace_list_to_yojson tree = list_to_yojson workspace_to_yojson tree

let describe_workspaces_result_to_yojson (x : describe_workspaces_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Workspaces", option_to_yojson workspace_list_to_yojson x.workspaces);
    ]

let describe_workspaces_request_to_yojson (x : describe_workspaces_request) =
  assoc_to_yojson
    [
      ("WorkspaceName", option_to_yojson workspace_name_to_yojson x.workspace_name);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("WorkspaceIds", option_to_yojson workspace_id_list_to_yojson x.workspace_ids);
    ]

let operating_system_type_to_yojson (x : operating_system_type) =
  match x with LINUX -> `String "LINUX" | WINDOWS -> `String "WINDOWS"

let operating_system_to_yojson (x : operating_system) =
  assoc_to_yojson [ ("Type", option_to_yojson operating_system_type_to_yojson x.type_) ]

let workspace_image_state_to_yojson (x : workspace_image_state) =
  match x with
  | ERROR -> `String "ERROR"
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"

let workspace_image_required_tenancy_to_yojson (x : workspace_image_required_tenancy) =
  match x with DEDICATED -> `String "DEDICATED" | DEFAULT -> `String "DEFAULT"

let workspace_image_error_code_to_yojson = string_to_yojson

let update_result_to_yojson (x : update_result) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson update_description_to_yojson x.description);
      ("UpdateAvailable", option_to_yojson boolean_object_to_yojson x.update_available);
    ]

let workspace_image_error_detail_code_to_yojson (x : workspace_image_error_detail_code) =
  match x with
  | RESTRICTED_DRIVE_LETTER -> `String "RestrictedDriveLetterInUse"
  | INCOMPATIBLE_MEMORY_INTEGRITY -> `String "MemoryIntegrityIncompatibility"
  | INCOMPATIBLE_PROTOCOL -> `String "ProtocolOSIncompatibility"
  | INSUFFICIENT_REARM_COUNT -> `String "InsufficientRearmCount"
  | UNSUPPORTED_OS_UPGRADE -> `String "UnsupportedOsUpgrade"
  | STAGED_APPX_PACKAGE -> `String "StagedAppxPackage"
  | MULTIPLE_USER_PROFILES -> `String "MultipleUserProfiles"
  | UNSUPPORTED_SECURITY_PROTOCOL -> `String "UnsupportedSecurityProtocol"
  | AMAZON_SSM_AGENT_ENABLED -> `String "AmazonSsmAgentEnabled"
  | WINDOWS_MODULES_INSTALLER_DISABLED -> `String "WindowsModulesInstallerDisabled"
  | REMOTE_DESKTOP_SERVICES_DISABLED -> `String "RemoteDesktopServicesDisabled"
  | INVALID_IP -> `String "InvalidIp"
  | DOMAIN_ACCOUNT_SERVICES_FOUND -> `String "DomainAccountServicesFound"
  | ENVIRONMENT_VARIABLES_PATH_MISSING_ENTRIES -> `String "EnvironmentVariablesPathMissingEntries"
  | INSUFFICIENT_DISK_SPACE -> `String "InsufficientDiskSpace"
  | USER_PROFILE_MISSING -> `String "UserProfileMissing"
  | SYSPREP_FILE_MISSING -> `String "SysPrepFileMissing"
  | WINDOWS_UPDATES_REQUIRED -> `String "WindowsUpdatesRequired"
  | ADDITIONAL_DRIVES_PRESENT -> `String "AdditionalDrivesPresent"
  | RESERVED_STORAGE_IN_USE -> `String "ReservedStorageInUse"
  | APPX_PACKAGES_INSTALLED -> `String "AppXPackagesInstalled"
  | UNKNOWN_ERROR -> `String "UnknownError"
  | UEFI_NOT_SUPPORTED -> `String "UEFINotSupported"
  | ANTI_VIRUS_INSTALLED -> `String "AntiVirusInstalled"
  | IN_PLACE_UPGRADE -> `String "InPlaceUpgrade"
  | ZERO_REARM_COUNT -> `String "ZeroRearmCount"
  | SIXTY_FOUR_BIT_OS -> `String "Requires64BitOS"
  | MULTIPLE_BOOT_PARTITION -> `String "MultipleBootPartition"
  | REALTIME_UNIVERSAL_DISABLED -> `String "RealTimeUniversalDisabled"
  | AUTO_LOGON_ENABLED -> `String "AutoLogonEnabled"
  | PENDING_REBOOT -> `String "PendingReboot"
  | INCOMPATIBLE_PARTITIONING -> `String "IncompatiblePartitioning"
  | DISK_SIZE_EXCEEDED -> `String "DiskSizeExceeded"
  | VMWARE_TOOLS_INSTALLED -> `String "VMWareToolsInstalled"
  | FIREWALL_ENABLED -> `String "FirewallEnabled"
  | AZURE_DOMAIN_JOINED -> `String "AzureDomainJoined"
  | DOMAIN_JOINED -> `String "DomainJoined"
  | OS_NOT_SUPPORTED -> `String "OSNotSupported"
  | ADDITIONAL_DRIVES_ATTACHED -> `String "AdditionalDrivesAttached"
  | DISK_FREE_SPACE -> `String "DiskFreeSpace"
  | DHCP_DISABLED -> `String "DHCPDisabled"
  | WORKSPACES_BYOL_ACCOUNT_DISABLED -> `String "WorkspacesBYOLAccountDisabled"
  | WORKSPACES_BYOL_ACCOUNT_NOT_FOUND -> `String "WorkspacesBYOLAccountNotFound"
  | AUTO_MOUNT_DISABLED -> `String "AutoMountDisabled"
  | WINDOWS_UPDATES_ENABLED -> `String "WindowsUpdatesEnabled"
  | PCOIP_AGENT_INSTALLED -> `String "PCoIPAgentInstalled"
  | OFFICE_INSTALLED -> `String "OfficeInstalled"
  | OUTDATED_POWERSHELL_VERSION -> `String "OutdatedPowershellVersion"

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson workspace_image_error_detail_code_to_yojson x.error_code);
    ]

let error_details_list_to_yojson tree = list_to_yojson error_details_to_yojson tree

let workspace_image_to_yojson (x : workspace_image) =
  assoc_to_yojson
    [
      ("ErrorDetails", option_to_yojson error_details_list_to_yojson x.error_details);
      ("Updates", option_to_yojson update_result_to_yojson x.updates);
      ("OwnerAccountId", option_to_yojson aws_account_to_yojson x.owner_account_id);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson workspace_image_error_code_to_yojson x.error_code);
      ( "RequiredTenancy",
        option_to_yojson workspace_image_required_tenancy_to_yojson x.required_tenancy );
      ("State", option_to_yojson workspace_image_state_to_yojson x.state);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Description", option_to_yojson workspace_image_description_to_yojson x.description);
      ("Name", option_to_yojson workspace_image_name_to_yojson x.name);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
    ]

let workspace_image_list_to_yojson tree = list_to_yojson workspace_image_to_yojson tree

let describe_workspace_images_result_to_yojson (x : describe_workspace_images_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Images", option_to_yojson workspace_image_list_to_yojson x.images);
    ]

let workspace_image_id_list_to_yojson tree = list_to_yojson workspace_image_id_to_yojson tree

let image_type_to_yojson (x : image_type) =
  match x with SHARED -> `String "SHARED" | OWNED -> `String "OWNED"

let describe_workspace_images_request_to_yojson (x : describe_workspace_images_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ImageType", option_to_yojson image_type_to_yojson x.image_type);
      ("ImageIds", option_to_yojson workspace_image_id_list_to_yojson x.image_ids);
    ]

let image_permission_to_yojson (x : image_permission) =
  assoc_to_yojson
    [ ("SharedAccountId", option_to_yojson aws_account_to_yojson x.shared_account_id) ]

let image_permissions_to_yojson tree = list_to_yojson image_permission_to_yojson tree

let describe_workspace_image_permissions_result_to_yojson
    (x : describe_workspace_image_permissions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ImagePermissions", option_to_yojson image_permissions_to_yojson x.image_permissions);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
    ]

let describe_workspace_image_permissions_request_to_yojson
    (x : describe_workspace_image_permissions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
    ]

let alias_to_yojson = string_to_yojson
let directory_name_to_yojson = string_to_yojson
let registration_code_to_yojson = string_to_yojson
let dns_ip_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree
let dns_ipv6_addresses_to_yojson tree = list_to_yojson ipv6_address_to_yojson tree

let workspace_directory_type_to_yojson (x : workspace_directory_type) =
  match x with
  | AWS_IAM_IDENTITY_CENTER -> `String "AWS_IAM_IDENTITY_CENTER"
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"
  | AD_CONNECTOR -> `String "AD_CONNECTOR"
  | SIMPLE_AD -> `String "SIMPLE_AD"

let default_workspace_creation_properties_to_yojson (x : default_workspace_creation_properties) =
  assoc_to_yojson
    [
      ("InstanceIamRoleArn", option_to_yojson ar_n_to_yojson x.instance_iam_role_arn);
      ("EnableMaintenanceMode", option_to_yojson boolean_object_to_yojson x.enable_maintenance_mode);
      ( "UserEnabledAsLocalAdministrator",
        option_to_yojson boolean_object_to_yojson x.user_enabled_as_local_administrator );
      ( "CustomSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.custom_security_group_id );
      ("DefaultOu", option_to_yojson default_ou_to_yojson x.default_ou);
      ("EnableInternetAccess", option_to_yojson boolean_object_to_yojson x.enable_internet_access);
    ]

let idc_config_to_yojson (x : idc_config) =
  assoc_to_yojson
    [
      ("ApplicationArn", option_to_yojson ar_n_to_yojson x.application_arn);
      ("InstanceArn", option_to_yojson ar_n_to_yojson x.instance_arn);
    ]

let workspace_directory_to_yojson (x : workspace_directory) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("StreamingProperties", option_to_yojson streaming_properties_to_yojson x.streaming_properties);
      ( "ActiveDirectoryConfig",
        option_to_yojson active_directory_config_to_yojson x.active_directory_config );
      ("IDCConfig", option_to_yojson idc_config_to_yojson x.idc_config);
      ("WorkspaceType", option_to_yojson workspace_type_to_yojson x.workspace_type);
      ("UserIdentityType", option_to_yojson user_identity_type_to_yojson x.user_identity_type);
      ( "WorkspaceDirectoryDescription",
        option_to_yojson workspace_directory_description_to_yojson x.workspace_directory_description
      );
      ( "WorkspaceDirectoryName",
        option_to_yojson workspace_directory_name_to_yojson x.workspace_directory_name );
      ( "MicrosoftEntraConfig",
        option_to_yojson microsoft_entra_config_to_yojson x.microsoft_entra_config );
      ( "EndpointEncryptionMode",
        option_to_yojson endpoint_encryption_mode_to_yojson x.endpoint_encryption_mode );
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ("SamlProperties", option_to_yojson saml_properties_to_yojson x.saml_properties);
      ( "SelfservicePermissions",
        option_to_yojson selfservice_permissions_to_yojson x.selfservice_permissions );
      ("Tenancy", option_to_yojson tenancy_to_yojson x.tenancy);
      ( "WorkspaceAccessProperties",
        option_to_yojson workspace_access_properties_to_yojson x.workspace_access_properties );
      ("ipGroupIds", option_to_yojson ip_group_id_list_to_yojson x.ip_group_ids);
      ( "WorkspaceCreationProperties",
        option_to_yojson default_workspace_creation_properties_to_yojson
          x.workspace_creation_properties );
      ("State", option_to_yojson workspace_directory_state_to_yojson x.state);
      ( "WorkspaceSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.workspace_security_group_id );
      ("DirectoryType", option_to_yojson workspace_directory_type_to_yojson x.directory_type);
      ("IamRoleId", option_to_yojson ar_n_to_yojson x.iam_role_id);
      ("CustomerUserName", option_to_yojson user_name_to_yojson x.customer_user_name);
      ("DnsIpv6Addresses", option_to_yojson dns_ipv6_addresses_to_yojson x.dns_ipv6_addresses);
      ("DnsIpAddresses", option_to_yojson dns_ip_addresses_to_yojson x.dns_ip_addresses);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("RegistrationCode", option_to_yojson registration_code_to_yojson x.registration_code);
      ("DirectoryName", option_to_yojson directory_name_to_yojson x.directory_name);
      ("Alias", option_to_yojson alias_to_yojson x.alias);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
    ]

let directory_list_to_yojson tree = list_to_yojson workspace_directory_to_yojson tree

let describe_workspace_directories_result_to_yojson (x : describe_workspace_directories_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Directories", option_to_yojson directory_list_to_yojson x.directories);
    ]

let directory_id_list_to_yojson tree = list_to_yojson directory_id_to_yojson tree

let workspace_directory_name_list_to_yojson tree =
  list_to_yojson workspace_directory_name_to_yojson tree

let describe_workspace_directories_filter_name_to_yojson
    (x : describe_workspace_directories_filter_name) =
  match x with
  | WORKSPACE_TYPE -> `String "WORKSPACE_TYPE"
  | USER_IDENTITY_TYPE -> `String "USER_IDENTITY_TYPE"

let describe_workspace_directories_filter_value_to_yojson = string_to_yojson

let describe_workspace_directories_filter_values_to_yojson tree =
  list_to_yojson describe_workspace_directories_filter_value_to_yojson tree

let describe_workspace_directories_filter_to_yojson (x : describe_workspace_directories_filter) =
  assoc_to_yojson
    [
      ("Values", Some (describe_workspace_directories_filter_values_to_yojson x.values));
      ("Name", Some (describe_workspace_directories_filter_name_to_yojson x.name));
    ]

let describe_workspace_directories_filter_list_to_yojson tree =
  list_to_yojson describe_workspace_directories_filter_to_yojson tree

let describe_workspace_directories_request_to_yojson (x : describe_workspace_directories_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson describe_workspace_directories_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ( "WorkspaceDirectoryNames",
        option_to_yojson workspace_directory_name_list_to_yojson x.workspace_directory_names );
      ("DirectoryIds", option_to_yojson directory_id_list_to_yojson x.directory_ids);
    ]

let bundle_owner_to_yojson = string_to_yojson

let root_storage_to_yojson (x : root_storage) =
  assoc_to_yojson [ ("Capacity", Some (non_empty_string_to_yojson x.capacity)) ]

let user_storage_to_yojson (x : user_storage) =
  assoc_to_yojson [ ("Capacity", Some (non_empty_string_to_yojson x.capacity)) ]

let compute_type_to_yojson (x : compute_type) =
  assoc_to_yojson [ ("Name", option_to_yojson compute_to_yojson x.name) ]

let workspace_bundle_state_to_yojson (x : workspace_bundle_state) =
  match x with
  | ERROR -> `String "ERROR"
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"

let bundle_type_to_yojson (x : bundle_type) =
  match x with STANDBY -> `String "STANDBY" | REGULAR -> `String "REGULAR"

let workspace_bundle_to_yojson (x : workspace_bundle) =
  assoc_to_yojson
    [
      ("BundleType", option_to_yojson bundle_type_to_yojson x.bundle_type);
      ("State", option_to_yojson workspace_bundle_state_to_yojson x.state);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("ComputeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ("UserStorage", option_to_yojson user_storage_to_yojson x.user_storage);
      ("RootStorage", option_to_yojson root_storage_to_yojson x.root_storage);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Owner", option_to_yojson bundle_owner_to_yojson x.owner);
      ("Name", option_to_yojson non_empty_string_to_yojson x.name);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
    ]

let bundle_list_to_yojson tree = list_to_yojson workspace_bundle_to_yojson tree

let describe_workspace_bundles_result_to_yojson (x : describe_workspace_bundles_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Bundles", option_to_yojson bundle_list_to_yojson x.bundles);
    ]

let bundle_id_list_to_yojson tree = list_to_yojson bundle_id_to_yojson tree

let describe_workspace_bundles_request_to_yojson (x : describe_workspace_bundles_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Owner", option_to_yojson bundle_owner_to_yojson x.owner);
      ("BundleIds", option_to_yojson bundle_id_list_to_yojson x.bundle_ids);
    ]

let workspace_resource_association_list_to_yojson tree =
  list_to_yojson workspace_resource_association_to_yojson tree

let describe_workspace_associations_result_to_yojson (x : describe_workspace_associations_result) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson workspace_resource_association_list_to_yojson x.associations);
    ]

let work_space_associated_resource_type_list_to_yojson tree =
  list_to_yojson work_space_associated_resource_type_to_yojson tree

let describe_workspace_associations_request_to_yojson (x : describe_workspace_associations_request)
    =
  assoc_to_yojson
    [
      ( "AssociatedResourceTypes",
        Some (work_space_associated_resource_type_list_to_yojson x.associated_resource_types) );
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
    ]

let describe_tags_result_to_yojson (x : describe_tags_result) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let describe_tags_request_to_yojson (x : describe_tags_request) =
  assoc_to_yojson [ ("ResourceId", Some (non_empty_string_to_yojson x.resource_id)) ]

let ip_group_name_to_yojson = string_to_yojson
let ip_group_desc_to_yojson = string_to_yojson

let workspaces_ip_group_to_yojson (x : workspaces_ip_group) =
  assoc_to_yojson
    [
      ("userRules", option_to_yojson ip_rule_list_to_yojson x.user_rules);
      ("groupDesc", option_to_yojson ip_group_desc_to_yojson x.group_desc);
      ("groupName", option_to_yojson ip_group_name_to_yojson x.group_name);
      ("groupId", option_to_yojson ip_group_id_to_yojson x.group_id);
    ]

let workspaces_ip_groups_list_to_yojson tree = list_to_yojson workspaces_ip_group_to_yojson tree

let describe_ip_groups_result_to_yojson (x : describe_ip_groups_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Result", option_to_yojson workspaces_ip_groups_list_to_yojson x.result_);
    ]

let describe_ip_groups_request_to_yojson (x : describe_ip_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("GroupIds", option_to_yojson ip_group_id_list_to_yojson x.group_ids);
    ]

let image_associated_resource_type_to_yojson (x : image_associated_resource_type) =
  match x with APPLICATION -> `String "APPLICATION"

let image_resource_association_to_yojson (x : image_resource_association) =
  assoc_to_yojson
    [
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ( "AssociatedResourceType",
        option_to_yojson image_associated_resource_type_to_yojson x.associated_resource_type );
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
    ]

let image_resource_association_list_to_yojson tree =
  list_to_yojson image_resource_association_to_yojson tree

let describe_image_associations_result_to_yojson (x : describe_image_associations_result) =
  assoc_to_yojson
    [ ("Associations", option_to_yojson image_resource_association_list_to_yojson x.associations) ]

let image_associated_resource_type_list_to_yojson tree =
  list_to_yojson image_associated_resource_type_to_yojson tree

let describe_image_associations_request_to_yojson (x : describe_image_associations_request) =
  assoc_to_yojson
    [
      ( "AssociatedResourceTypes",
        Some (image_associated_resource_type_list_to_yojson x.associated_resource_types) );
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
    ]

let workflow_state_message_to_yojson = string_to_yojson
let percentage_to_yojson = int_to_yojson
let error_code_to_yojson = string_to_yojson
let image_error_message_to_yojson = string_to_yojson

let custom_workspace_image_import_error_details_to_yojson
    (x : custom_workspace_image_import_error_details) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson image_error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let custom_workspace_image_import_error_details_list_to_yojson tree =
  list_to_yojson custom_workspace_image_import_error_details_to_yojson tree

let describe_custom_workspace_image_import_result_to_yojson
    (x : describe_custom_workspace_image_import_result) =
  assoc_to_yojson
    [
      ( "ErrorDetails",
        option_to_yojson custom_workspace_image_import_error_details_list_to_yojson x.error_details
      );
      ( "ImageBuilderInstanceId",
        option_to_yojson non_empty_string_to_yojson x.image_builder_instance_id );
      ("ImageSource", option_to_yojson image_source_identifier_to_yojson x.image_source);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("ProgressPercentage", option_to_yojson percentage_to_yojson x.progress_percentage);
      ("StateMessage", option_to_yojson workflow_state_message_to_yojson x.state_message);
      ("State", option_to_yojson custom_workspace_image_import_state_to_yojson x.state);
      ( "InfrastructureConfigurationArn",
        option_to_yojson infrastructure_configuration_arn_to_yojson
          x.infrastructure_configuration_arn );
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
    ]

let describe_custom_workspace_image_import_request_to_yojson
    (x : describe_custom_workspace_image_import_request) =
  assoc_to_yojson [ ("ImageId", Some (workspace_image_id_to_yojson x.image_id)) ]

let connection_alias_permissions_to_yojson tree =
  list_to_yojson connection_alias_permission_to_yojson tree

let describe_connection_alias_permissions_result_to_yojson
    (x : describe_connection_alias_permissions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ConnectionAliasPermissions",
        option_to_yojson connection_alias_permissions_to_yojson x.connection_alias_permissions );
      ("AliasId", option_to_yojson connection_alias_id_to_yojson x.alias_id);
    ]

let describe_connection_alias_permissions_request_to_yojson
    (x : describe_connection_alias_permissions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AliasId", Some (connection_alias_id_to_yojson x.alias_id));
    ]

let connection_string_to_yojson = string_to_yojson

let connection_alias_state_to_yojson (x : connection_alias_state) =
  match x with
  | DELETING -> `String "DELETING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let association_status_to_yojson (x : association_status) =
  match x with
  | PENDING_DISASSOCIATION -> `String "PENDING_DISASSOCIATION"
  | PENDING_ASSOCIATION -> `String "PENDING_ASSOCIATION"
  | ASSOCIATED_WITH_SHARED_ACCOUNT -> `String "ASSOCIATED_WITH_SHARED_ACCOUNT"
  | ASSOCIATED_WITH_OWNER_ACCOUNT -> `String "ASSOCIATED_WITH_OWNER_ACCOUNT"
  | NOT_ASSOCIATED -> `String "NOT_ASSOCIATED"

let connection_identifier_to_yojson = string_to_yojson

let connection_alias_association_to_yojson (x : connection_alias_association) =
  assoc_to_yojson
    [
      ( "ConnectionIdentifier",
        option_to_yojson connection_identifier_to_yojson x.connection_identifier );
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("AssociatedAccountId", option_to_yojson aws_account_to_yojson x.associated_account_id);
      ("AssociationStatus", option_to_yojson association_status_to_yojson x.association_status);
    ]

let connection_alias_association_list_to_yojson tree =
  list_to_yojson connection_alias_association_to_yojson tree

let connection_alias_to_yojson (x : connection_alias) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson connection_alias_association_list_to_yojson x.associations);
      ("OwnerAccountId", option_to_yojson aws_account_to_yojson x.owner_account_id);
      ("State", option_to_yojson connection_alias_state_to_yojson x.state);
      ("AliasId", option_to_yojson connection_alias_id_to_yojson x.alias_id);
      ("ConnectionString", option_to_yojson connection_string_to_yojson x.connection_string);
    ]

let connection_alias_list_to_yojson tree = list_to_yojson connection_alias_to_yojson tree

let describe_connection_aliases_result_to_yojson (x : describe_connection_aliases_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ConnectionAliases", option_to_yojson connection_alias_list_to_yojson x.connection_aliases);
    ]

let connection_alias_id_list_to_yojson tree = list_to_yojson connection_alias_id_to_yojson tree

let describe_connection_aliases_request_to_yojson (x : describe_connection_aliases_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("AliasIds", option_to_yojson connection_alias_id_list_to_yojson x.alias_ids);
    ]

let connect_client_add_in_to_yojson (x : connect_client_add_in) =
  assoc_to_yojson
    [
      ("URL", option_to_yojson add_in_url_to_yojson x.ur_l);
      ("Name", option_to_yojson add_in_name_to_yojson x.name);
      ("ResourceId", option_to_yojson directory_id_to_yojson x.resource_id);
      ("AddInId", option_to_yojson amazon_uuid_to_yojson x.add_in_id);
    ]

let connect_client_add_in_list_to_yojson tree = list_to_yojson connect_client_add_in_to_yojson tree

let describe_connect_client_add_ins_result_to_yojson (x : describe_connect_client_add_ins_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AddIns", option_to_yojson connect_client_add_in_list_to_yojson x.add_ins);
    ]

let describe_connect_client_add_ins_request_to_yojson (x : describe_connect_client_add_ins_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let client_properties_result_to_yojson (x : client_properties_result) =
  assoc_to_yojson
    [
      ("ClientProperties", option_to_yojson client_properties_to_yojson x.client_properties);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
    ]

let client_properties_list_to_yojson tree = list_to_yojson client_properties_result_to_yojson tree

let describe_client_properties_result_to_yojson (x : describe_client_properties_result) =
  assoc_to_yojson
    [
      ( "ClientPropertiesList",
        option_to_yojson client_properties_list_to_yojson x.client_properties_list );
    ]

let resource_id_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let describe_client_properties_request_to_yojson (x : describe_client_properties_request) =
  assoc_to_yojson [ ("ResourceIds", Some (resource_id_list_to_yojson x.resource_ids)) ]

let describe_client_branding_result_to_yojson (x : describe_client_branding_result) =
  assoc_to_yojson
    [
      ( "DeviceTypeWeb",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_web );
      ( "DeviceTypeLinux",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_linux );
      ("DeviceTypeIos", option_to_yojson ios_client_branding_attributes_to_yojson x.device_type_ios);
      ( "DeviceTypeAndroid",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_android );
      ( "DeviceTypeOsx",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_osx );
      ( "DeviceTypeWindows",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_windows );
    ]

let describe_client_branding_request_to_yojson (x : describe_client_branding_request) =
  assoc_to_yojson [ ("ResourceId", Some (directory_id_to_yojson x.resource_id)) ]

let bundle_associated_resource_type_to_yojson (x : bundle_associated_resource_type) =
  match x with APPLICATION -> `String "APPLICATION"

let bundle_resource_association_to_yojson (x : bundle_resource_association) =
  assoc_to_yojson
    [
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ( "AssociatedResourceType",
        option_to_yojson bundle_associated_resource_type_to_yojson x.associated_resource_type );
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
    ]

let bundle_resource_association_list_to_yojson tree =
  list_to_yojson bundle_resource_association_to_yojson tree

let describe_bundle_associations_result_to_yojson (x : describe_bundle_associations_result) =
  assoc_to_yojson
    [ ("Associations", option_to_yojson bundle_resource_association_list_to_yojson x.associations) ]

let bundle_associated_resource_type_list_to_yojson tree =
  list_to_yojson bundle_associated_resource_type_to_yojson tree

let describe_bundle_associations_request_to_yojson (x : describe_bundle_associations_request) =
  assoc_to_yojson
    [
      ( "AssociatedResourceTypes",
        Some (bundle_associated_resource_type_list_to_yojson x.associated_resource_types) );
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
    ]

let work_space_application_license_type_to_yojson (x : work_space_application_license_type) =
  match x with UNLICENSED -> `String "UNLICENSED" | LICENSED -> `String "LICENSED"

let work_space_application_owner_to_yojson = string_to_yojson

let work_space_application_state_to_yojson (x : work_space_application_state) =
  match x with
  | UNINSTALL_ONLY -> `String "UNINSTALL_ONLY"
  | AVAILABLE -> `String "AVAILABLE"
  | ERROR -> `String "ERROR"
  | PENDING -> `String "PENDING"

let compute_list_to_yojson tree = list_to_yojson compute_to_yojson tree
let operating_system_name_list_to_yojson tree = list_to_yojson operating_system_name_to_yojson tree

let work_space_application_to_yojson (x : work_space_application) =
  assoc_to_yojson
    [
      ( "SupportedOperatingSystemNames",
        option_to_yojson operating_system_name_list_to_yojson x.supported_operating_system_names );
      ( "SupportedComputeTypeNames",
        option_to_yojson compute_list_to_yojson x.supported_compute_type_names );
      ("State", option_to_yojson work_space_application_state_to_yojson x.state);
      ("Owner", option_to_yojson work_space_application_owner_to_yojson x.owner);
      ("Name", option_to_yojson non_empty_string_to_yojson x.name);
      ("LicenseType", option_to_yojson work_space_application_license_type_to_yojson x.license_type);
      ("Description", option_to_yojson string2048_to_yojson x.description);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("ApplicationId", option_to_yojson work_space_application_id_to_yojson x.application_id);
    ]

let work_space_application_list_to_yojson tree =
  list_to_yojson work_space_application_to_yojson tree

let describe_applications_result_to_yojson (x : describe_applications_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Applications", option_to_yojson work_space_application_list_to_yojson x.applications);
    ]

let work_space_application_id_list_to_yojson tree =
  list_to_yojson work_space_application_id_to_yojson tree

let describe_applications_request_to_yojson (x : describe_applications_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("Owner", option_to_yojson work_space_application_owner_to_yojson x.owner);
      ( "OperatingSystemNames",
        option_to_yojson operating_system_name_list_to_yojson x.operating_system_names );
      ("LicenseType", option_to_yojson work_space_application_license_type_to_yojson x.license_type);
      ("ComputeTypeNames", option_to_yojson compute_list_to_yojson x.compute_type_names);
      ("ApplicationIds", option_to_yojson work_space_application_id_list_to_yojson x.application_ids);
    ]

let application_associated_resource_type_to_yojson (x : application_associated_resource_type) =
  match x with
  | IMAGE -> `String "IMAGE"
  | BUNDLE -> `String "BUNDLE"
  | WORKSPACE -> `String "WORKSPACE"

let application_resource_association_to_yojson (x : application_resource_association) =
  assoc_to_yojson
    [
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ( "AssociatedResourceType",
        option_to_yojson application_associated_resource_type_to_yojson x.associated_resource_type
      );
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
      ("ApplicationId", option_to_yojson work_space_application_id_to_yojson x.application_id);
    ]

let application_resource_association_list_to_yojson tree =
  list_to_yojson application_resource_association_to_yojson tree

let describe_application_associations_result_to_yojson
    (x : describe_application_associations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "Associations",
        option_to_yojson application_resource_association_list_to_yojson x.associations );
    ]

let application_associated_resource_type_list_to_yojson tree =
  list_to_yojson application_associated_resource_type_to_yojson tree

let describe_application_associations_request_to_yojson
    (x : describe_application_associations_request) =
  assoc_to_yojson
    [
      ( "AssociatedResourceTypes",
        Some (application_associated_resource_type_list_to_yojson x.associated_resource_types) );
      ("ApplicationId", Some (work_space_application_id_to_yojson x.application_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let dedicated_tenancy_modification_state_enum_to_yojson
    (x : dedicated_tenancy_modification_state_enum) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | PENDING -> `String "PENDING"

let dedicated_tenancy_support_result_enum_to_yojson (x : dedicated_tenancy_support_result_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let account_modification_to_yojson (x : account_modification) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson workspace_error_code_to_yojson x.error_code);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "DedicatedTenancyManagementCidrRange",
        option_to_yojson dedicated_tenancy_management_cidr_range_to_yojson
          x.dedicated_tenancy_management_cidr_range );
      ( "DedicatedTenancySupport",
        option_to_yojson dedicated_tenancy_support_result_enum_to_yojson x.dedicated_tenancy_support
      );
      ( "ModificationState",
        option_to_yojson dedicated_tenancy_modification_state_enum_to_yojson x.modification_state );
    ]

let account_modification_list_to_yojson tree = list_to_yojson account_modification_to_yojson tree

let describe_account_modifications_result_to_yojson (x : describe_account_modifications_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "AccountModifications",
        option_to_yojson account_modification_list_to_yojson x.account_modifications );
    ]

let describe_account_modifications_request_to_yojson (x : describe_account_modifications_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let dedicated_tenancy_account_type_to_yojson (x : dedicated_tenancy_account_type) =
  match x with
  | TARGET_ACCOUNT -> `String "TARGET_ACCOUNT"
  | SOURCE_ACCOUNT -> `String "SOURCE_ACCOUNT"

let describe_account_result_to_yojson (x : describe_account_result) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_to_yojson x.message);
      ( "DedicatedTenancyAccountType",
        option_to_yojson dedicated_tenancy_account_type_to_yojson x.dedicated_tenancy_account_type
      );
      ( "DedicatedTenancyManagementCidrRange",
        option_to_yojson dedicated_tenancy_management_cidr_range_to_yojson
          x.dedicated_tenancy_management_cidr_range );
      ( "DedicatedTenancySupport",
        option_to_yojson dedicated_tenancy_support_result_enum_to_yojson x.dedicated_tenancy_support
      );
    ]

let describe_account_request_to_yojson = unit_to_yojson
let deregister_workspace_directory_result_to_yojson = unit_to_yojson

let deregister_workspace_directory_request_to_yojson (x : deregister_workspace_directory_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let incompatible_applications_exception_to_yojson = unit_to_yojson

let work_space_application_deployment_to_yojson (x : work_space_application_deployment) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson workspace_resource_association_list_to_yojson x.associations);
    ]

let deploy_workspace_applications_result_to_yojson (x : deploy_workspace_applications_result) =
  assoc_to_yojson
    [ ("Deployment", option_to_yojson work_space_application_deployment_to_yojson x.deployment) ]

let deploy_workspace_applications_request_to_yojson (x : deploy_workspace_applications_request) =
  assoc_to_yojson
    [
      ("Force", option_to_yojson boolean_object_to_yojson x.force);
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
    ]

let delete_workspace_image_result_to_yojson = unit_to_yojson

let delete_workspace_image_request_to_yojson (x : delete_workspace_image_request) =
  assoc_to_yojson [ ("ImageId", Some (workspace_image_id_to_yojson x.image_id)) ]

let delete_workspace_bundle_result_to_yojson = unit_to_yojson

let delete_workspace_bundle_request_to_yojson (x : delete_workspace_bundle_request) =
  assoc_to_yojson [ ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id) ]

let delete_tags_result_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let delete_tags_request_to_yojson (x : delete_tags_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
    ]

let delete_ip_group_result_to_yojson = unit_to_yojson

let delete_ip_group_request_to_yojson (x : delete_ip_group_request) =
  assoc_to_yojson [ ("GroupId", Some (ip_group_id_to_yojson x.group_id)) ]

let delete_connection_alias_result_to_yojson = unit_to_yojson

let delete_connection_alias_request_to_yojson (x : delete_connection_alias_request) =
  assoc_to_yojson [ ("AliasId", Some (connection_alias_id_to_yojson x.alias_id)) ]

let delete_connect_client_add_in_result_to_yojson = unit_to_yojson

let delete_connect_client_add_in_request_to_yojson (x : delete_connect_client_add_in_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("AddInId", Some (amazon_uuid_to_yojson x.add_in_id));
    ]

let delete_client_branding_result_to_yojson = unit_to_yojson

let client_device_type_to_yojson (x : client_device_type) =
  match x with
  | DEVICE_TYPE_WEB -> `String "DeviceTypeWeb"
  | DEVICE_TYPE_LINUX -> `String "DeviceTypeLinux"
  | DEVICE_TYPE_IOS -> `String "DeviceTypeIos"
  | DEVICE_TYPE_ANDROID -> `String "DeviceTypeAndroid"
  | DEVICE_TYPE_OSX -> `String "DeviceTypeOsx"
  | DEVICE_TYPE_WINDOWS -> `String "DeviceTypeWindows"

let client_device_type_list_to_yojson tree = list_to_yojson client_device_type_to_yojson tree

let delete_client_branding_request_to_yojson (x : delete_client_branding_request) =
  assoc_to_yojson
    [
      ("Platforms", Some (client_device_type_list_to_yojson x.platforms));
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let delete_account_link_invitation_result_to_yojson (x : delete_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let delete_account_link_invitation_request_to_yojson (x : delete_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("LinkId", Some (link_id_to_yojson x.link_id));
    ]

let create_workspaces_pool_result_to_yojson (x : create_workspaces_pool_result) =
  assoc_to_yojson
    [ ("WorkspacesPool", option_to_yojson workspaces_pool_to_yojson x.workspaces_pool) ]

let create_workspaces_pool_request_to_yojson (x : create_workspaces_pool_request) =
  assoc_to_yojson
    [
      ("RunningMode", option_to_yojson pools_running_mode_to_yojson x.running_mode);
      ("TimeoutSettings", option_to_yojson timeout_settings_to_yojson x.timeout_settings);
      ( "ApplicationSettings",
        option_to_yojson application_settings_request_to_yojson x.application_settings );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Capacity", Some (capacity_to_yojson x.capacity));
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ("Description", Some (update_description_to_yojson x.description));
      ("PoolName", Some (workspaces_pool_name_to_yojson x.pool_name));
    ]

let workspace_request_to_yojson (x : workspace_request) =
  assoc_to_yojson
    [
      ("Ipv6Address", option_to_yojson ipv6_address_to_yojson x.ipv6_address);
      ("WorkspaceName", option_to_yojson workspace_name_to_yojson x.workspace_name);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("WorkspaceProperties", option_to_yojson workspace_properties_to_yojson x.workspace_properties);
      ( "RootVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.root_volume_encryption_enabled );
      ( "UserVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.user_volume_encryption_enabled );
      ( "VolumeEncryptionKey",
        option_to_yojson volume_encryption_key_to_yojson x.volume_encryption_key );
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
    ]

let failed_create_workspace_request_to_yojson (x : failed_create_workspace_request) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_type_to_yojson x.error_code);
      ("WorkspaceRequest", option_to_yojson workspace_request_to_yojson x.workspace_request);
    ]

let failed_create_workspace_requests_to_yojson tree =
  list_to_yojson failed_create_workspace_request_to_yojson tree

let create_workspaces_result_to_yojson (x : create_workspaces_result) =
  assoc_to_yojson
    [
      ("PendingRequests", option_to_yojson workspace_list_to_yojson x.pending_requests);
      ( "FailedRequests",
        option_to_yojson failed_create_workspace_requests_to_yojson x.failed_requests );
    ]

let workspace_request_list_to_yojson tree = list_to_yojson workspace_request_to_yojson tree

let create_workspaces_request_to_yojson (x : create_workspaces_request) =
  assoc_to_yojson [ ("Workspaces", Some (workspace_request_list_to_yojson x.workspaces)) ]

let create_workspace_image_result_to_yojson (x : create_workspace_image_result) =
  assoc_to_yojson
    [
      ("OwnerAccountId", option_to_yojson aws_account_to_yojson x.owner_account_id);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ( "RequiredTenancy",
        option_to_yojson workspace_image_required_tenancy_to_yojson x.required_tenancy );
      ("State", option_to_yojson workspace_image_state_to_yojson x.state);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("Description", option_to_yojson workspace_image_description_to_yojson x.description);
      ("Name", option_to_yojson workspace_image_name_to_yojson x.name);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
    ]

let create_workspace_image_request_to_yojson (x : create_workspace_image_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("Description", Some (workspace_image_description_to_yojson x.description));
      ("Name", Some (workspace_image_name_to_yojson x.name));
    ]

let create_workspace_bundle_result_to_yojson (x : create_workspace_bundle_result) =
  assoc_to_yojson
    [ ("WorkspaceBundle", option_to_yojson workspace_bundle_to_yojson x.workspace_bundle) ]

let workspace_bundle_name_to_yojson = string_to_yojson
let workspace_bundle_description_to_yojson = string_to_yojson

let create_workspace_bundle_request_to_yojson (x : create_workspace_bundle_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RootStorage", option_to_yojson root_storage_to_yojson x.root_storage);
      ("UserStorage", Some (user_storage_to_yojson x.user_storage));
      ("ComputeType", Some (compute_type_to_yojson x.compute_type));
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
      ("BundleDescription", Some (workspace_bundle_description_to_yojson x.bundle_description));
      ("BundleName", Some (workspace_bundle_name_to_yojson x.bundle_name));
    ]

let create_updated_workspace_image_result_to_yojson (x : create_updated_workspace_image_result) =
  assoc_to_yojson [ ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id) ]

let create_updated_workspace_image_request_to_yojson (x : create_updated_workspace_image_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SourceImageId", Some (workspace_image_id_to_yojson x.source_image_id));
      ("Description", Some (workspace_image_description_to_yojson x.description));
      ("Name", Some (workspace_image_name_to_yojson x.name));
    ]

let create_tags_result_to_yojson = unit_to_yojson

let create_tags_request_to_yojson (x : create_tags_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
    ]

let standby_workspace_to_yojson (x : standby_workspace) =
  assoc_to_yojson
    [
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ( "VolumeEncryptionKey",
        option_to_yojson volume_encryption_key_to_yojson x.volume_encryption_key );
      ("PrimaryWorkspaceId", Some (workspace_id_to_yojson x.primary_workspace_id));
    ]

let failed_create_standby_workspaces_request_to_yojson
    (x : failed_create_standby_workspaces_request) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson workspace_error_code_to_yojson x.error_code);
      ( "StandbyWorkspaceRequest",
        option_to_yojson standby_workspace_to_yojson x.standby_workspace_request );
    ]

let failed_create_standby_workspaces_request_list_to_yojson tree =
  list_to_yojson failed_create_standby_workspaces_request_to_yojson tree

let pending_create_standby_workspaces_request_to_yojson
    (x : pending_create_standby_workspaces_request) =
  assoc_to_yojson
    [
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
      ("State", option_to_yojson workspace_state_to_yojson x.state);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
    ]

let pending_create_standby_workspaces_request_list_to_yojson tree =
  list_to_yojson pending_create_standby_workspaces_request_to_yojson tree

let create_standby_workspaces_result_to_yojson (x : create_standby_workspaces_result) =
  assoc_to_yojson
    [
      ( "PendingStandbyRequests",
        option_to_yojson pending_create_standby_workspaces_request_list_to_yojson
          x.pending_standby_requests );
      ( "FailedStandbyRequests",
        option_to_yojson failed_create_standby_workspaces_request_list_to_yojson
          x.failed_standby_requests );
    ]

let standby_workspaces_list_to_yojson tree = list_to_yojson standby_workspace_to_yojson tree

let create_standby_workspaces_request_to_yojson (x : create_standby_workspaces_request) =
  assoc_to_yojson
    [
      ("StandbyWorkspaces", Some (standby_workspaces_list_to_yojson x.standby_workspaces));
      ("PrimaryRegion", Some (region_to_yojson x.primary_region));
    ]

let resource_creation_failed_exception_to_yojson (x : resource_creation_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_ip_group_result_to_yojson (x : create_ip_group_result) =
  assoc_to_yojson [ ("GroupId", option_to_yojson ip_group_id_to_yojson x.group_id) ]

let create_ip_group_request_to_yojson (x : create_ip_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UserRules", option_to_yojson ip_rule_list_to_yojson x.user_rules);
      ("GroupDesc", option_to_yojson ip_group_desc_to_yojson x.group_desc);
      ("GroupName", Some (ip_group_name_to_yojson x.group_name));
    ]

let create_connection_alias_result_to_yojson (x : create_connection_alias_result) =
  assoc_to_yojson [ ("AliasId", option_to_yojson connection_alias_id_to_yojson x.alias_id) ]

let create_connection_alias_request_to_yojson (x : create_connection_alias_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ConnectionString", Some (connection_string_to_yojson x.connection_string));
    ]

let create_connect_client_add_in_result_to_yojson (x : create_connect_client_add_in_result) =
  assoc_to_yojson [ ("AddInId", option_to_yojson amazon_uuid_to_yojson x.add_in_id) ]

let create_connect_client_add_in_request_to_yojson (x : create_connect_client_add_in_request) =
  assoc_to_yojson
    [
      ("URL", Some (add_in_url_to_yojson x.ur_l));
      ("Name", Some (add_in_name_to_yojson x.name));
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let create_account_link_invitation_result_to_yojson (x : create_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let create_account_link_invitation_request_to_yojson (x : create_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("TargetAccountId", Some (aws_account_to_yojson x.target_account_id));
    ]

let copy_workspace_image_result_to_yojson (x : copy_workspace_image_result) =
  assoc_to_yojson [ ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id) ]

let copy_workspace_image_request_to_yojson (x : copy_workspace_image_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SourceRegion", Some (region_to_yojson x.source_region));
      ("SourceImageId", Some (workspace_image_id_to_yojson x.source_image_id));
      ("Description", option_to_yojson workspace_image_description_to_yojson x.description);
      ("Name", Some (workspace_image_name_to_yojson x.name));
    ]

let authorize_ip_rules_result_to_yojson = unit_to_yojson

let authorize_ip_rules_request_to_yojson (x : authorize_ip_rules_request) =
  assoc_to_yojson
    [
      ("UserRules", Some (ip_rule_list_to_yojson x.user_rules));
      ("GroupId", Some (ip_group_id_to_yojson x.group_id));
    ]

let operating_system_not_compatible_exception_to_yojson = unit_to_yojson
let compute_not_compatible_exception_to_yojson = unit_to_yojson
let application_not_supported_exception_to_yojson = unit_to_yojson

let associate_workspace_application_result_to_yojson (x : associate_workspace_application_result) =
  assoc_to_yojson
    [ ("Association", option_to_yojson workspace_resource_association_to_yojson x.association) ]

let associate_workspace_application_request_to_yojson (x : associate_workspace_application_request)
    =
  assoc_to_yojson
    [
      ("ApplicationId", Some (work_space_application_id_to_yojson x.application_id));
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
    ]

let associate_ip_groups_result_to_yojson = unit_to_yojson

let associate_ip_groups_request_to_yojson (x : associate_ip_groups_request) =
  assoc_to_yojson
    [
      ("GroupIds", Some (ip_group_id_list_to_yojson x.group_ids));
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
    ]

let associate_connection_alias_result_to_yojson (x : associate_connection_alias_result) =
  assoc_to_yojson
    [
      ( "ConnectionIdentifier",
        option_to_yojson connection_identifier_to_yojson x.connection_identifier );
    ]

let associate_connection_alias_request_to_yojson (x : associate_connection_alias_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
      ("AliasId", Some (connection_alias_id_to_yojson x.alias_id));
    ]

let accept_account_link_invitation_result_to_yojson (x : accept_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let accept_account_link_invitation_request_to_yojson (x : accept_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("LinkId", Some (link_id_to_yojson x.link_id));
    ]
