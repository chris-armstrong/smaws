open Smaws_Lib.Json.DeserializeHelpers
open Types

let exception_message_of_yojson = string_of_yojson
let non_empty_string_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ResourceId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : resource_not_found_exception)

let resource_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : resource_limit_exceeded_exception)

let exception_error_code_of_yojson = string_of_yojson

let operation_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key exception_error_code_of_yojson "reason") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : operation_not_supported_exception)

let operation_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : operation_in_progress_exception)

let invalid_resource_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_resource_state_exception)

let invalid_parameter_values_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_parameter_values_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : access_denied_exception)

let workspaces_pool_id_of_yojson = string_of_yojson
let ar_n_of_yojson = string_of_yojson
let available_user_sessions_of_yojson = int_of_yojson
let desired_user_sessions_of_yojson = int_of_yojson
let actual_user_sessions_of_yojson = int_of_yojson
let active_user_sessions_of_yojson = int_of_yojson

let capacity_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_user_sessions =
       value_for_key active_user_sessions_of_yojson "ActiveUserSessions" _list path;
     actual_user_sessions =
       value_for_key actual_user_sessions_of_yojson "ActualUserSessions" _list path;
     desired_user_sessions =
       value_for_key desired_user_sessions_of_yojson "DesiredUserSessions" _list path;
     available_user_sessions =
       value_for_key available_user_sessions_of_yojson "AvailableUserSessions" _list path;
   }
    : capacity_status)

let workspaces_pool_name_of_yojson = string_of_yojson
let update_description_of_yojson = string_of_yojson

let workspaces_pool_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "STOPPING" -> STOPPING
    | `String "STOPPED" -> STOPPED
    | `String "STARTING" -> STARTING
    | `String "RUNNING" -> RUNNING
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkspacesPoolState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspacesPoolState")
     : workspaces_pool_state)
    : workspaces_pool_state)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let bundle_id_of_yojson = string_of_yojson
let directory_id_of_yojson = string_of_yojson

let workspaces_pool_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT_OU_IS_MISSING" -> DEFAULT_OU_IS_MISSING
    | `String "INSUFFICIENT_PERMISSIONS_ERROR" -> INSUFFICIENT_PERMISSIONS_ERROR
    | `String "DIRECTORY_NOT_FOUND" -> DIRECTORY_NOT_FOUND
    | `String "BUNDLE_NOT_FOUND" -> BUNDLE_NOT_FOUND
    | `String "DOMAIN_JOIN_ERROR_SECRET_INVALID" -> DOMAIN_JOIN_ERROR_SECRET_INVALID
    | `String "DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND" ->
        DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND
    | `String "DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND" -> DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND
    | `String "DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID" -> DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID
    | `String "DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE" ->
        DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE
    | `String "DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING" ->
        DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING
    | `String "DOMAIN_JOIN_INTERNAL_SERVICE_ERROR" -> DOMAIN_JOIN_INTERNAL_SERVICE_ERROR
    | `String "DOMAIN_JOIN_NERR_PASSWORD_EXPIRED" -> DOMAIN_JOIN_NERR_PASSWORD_EXPIRED
    | `String "DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED" ->
        DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
    | `String "DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED" -> DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED
    | `String "DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME" -> DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME
    | `String "DOMAIN_JOIN_ERROR_NOT_SUPPORTED" -> DOMAIN_JOIN_ERROR_NOT_SUPPORTED
    | `String "DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN" -> DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN
    | `String "DOMAIN_JOIN_ERROR_MORE_DATA" -> DOMAIN_JOIN_ERROR_MORE_DATA
    | `String "DOMAIN_JOIN_ERROR_INVALID_PARAMETER" -> DOMAIN_JOIN_ERROR_INVALID_PARAMETER
    | `String "DOMAIN_JOIN_ERROR_LOGON_FAILURE" -> DOMAIN_JOIN_ERROR_LOGON_FAILURE
    | `String "DOMAIN_JOIN_ERROR_ACCESS_DENIED" -> DOMAIN_JOIN_ERROR_ACCESS_DENIED
    | `String "DOMAIN_JOIN_ERROR_FILE_NOT_FOUND" -> DOMAIN_JOIN_ERROR_FILE_NOT_FOUND
    | `String "WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE" ->
        WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE
    | `String "WORKSPACES_POOL_STOPPED" -> WORKSPACES_POOL_STOPPED
    | `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION
    | `String "IGW_NOT_ATTACHED" -> IGW_NOT_ATTACHED
    | `String "SECURITY_GROUPS_NOT_FOUND" -> SECURITY_GROUPS_NOT_FOUND
    | `String "INVALID_SUBNET_CONFIGURATION" -> INVALID_SUBNET_CONFIGURATION
    | `String "IMAGE_NOT_FOUND" -> IMAGE_NOT_FOUND
    | `String "SUBNET_NOT_FOUND" -> SUBNET_NOT_FOUND
    | `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION
    | `String "SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES" -> SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES
    | `String "STS_DISABLED_IN_REGION" -> STS_DISABLED_IN_REGION
    | `String "MACHINE_ROLE_IS_MISSING" -> MACHINE_ROLE_IS_MISSING
    | `String "INTERNAL_SERVICE_ERROR" -> INTERNAL_SERVICE_ERROR
    | `String "NETWORK_INTERFACE_LIMIT_EXCEEDED" -> NETWORK_INTERFACE_LIMIT_EXCEEDED
    | `String "IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION
    | `String "IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION
    | `String "IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION
    | `String "IAM_SERVICE_ROLE_IS_MISSING" -> IAM_SERVICE_ROLE_IS_MISSING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspacesPoolErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspacesPoolErrorCode")
     : workspaces_pool_error_code)
    : workspaces_pool_error_code)

let error_message_of_yojson = string_of_yojson

let workspaces_pool_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key workspaces_pool_error_code_of_yojson "ErrorCode") _list path;
   }
    : workspaces_pool_error)

let workspaces_pool_errors_of_yojson tree path =
  list_of_yojson workspaces_pool_error_of_yojson tree path

let application_settings_status_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApplicationSettingsStatusEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationSettingsStatusEnum")
     : application_settings_status_enum)
    : application_settings_status_enum)

let settings_group_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson

let application_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "S3BucketName") _list path;
     settings_group =
       option_of_yojson (value_for_key settings_group_of_yojson "SettingsGroup") _list path;
     status = value_for_key application_settings_status_enum_of_yojson "Status" _list path;
   }
    : application_settings_response)

let disconnect_timeout_in_seconds_of_yojson = int_of_yojson
let idle_disconnect_timeout_in_seconds_of_yojson = int_of_yojson
let max_user_duration_in_seconds_of_yojson = int_of_yojson

let timeout_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_user_duration_in_seconds =
       option_of_yojson
         (value_for_key max_user_duration_in_seconds_of_yojson "MaxUserDurationInSeconds")
         _list path;
     idle_disconnect_timeout_in_seconds =
       option_of_yojson
         (value_for_key idle_disconnect_timeout_in_seconds_of_yojson
            "IdleDisconnectTimeoutInSeconds")
         _list path;
     disconnect_timeout_in_seconds =
       option_of_yojson
         (value_for_key disconnect_timeout_in_seconds_of_yojson "DisconnectTimeoutInSeconds")
         _list path;
   }
    : timeout_settings)

let pools_running_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALWAYS_ON" -> ALWAYS_ON
    | `String "AUTO_STOP" -> AUTO_STOP
    | `String value -> raise (deserialize_unknown_enum_value_error path "PoolsRunningMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PoolsRunningMode")
     : pools_running_mode)
    : pools_running_mode)

let workspaces_pool_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     running_mode = value_for_key pools_running_mode_of_yojson "RunningMode" _list path;
     timeout_settings =
       option_of_yojson (value_for_key timeout_settings_of_yojson "TimeoutSettings") _list path;
     application_settings =
       option_of_yojson
         (value_for_key application_settings_response_of_yojson "ApplicationSettings")
         _list path;
     errors = option_of_yojson (value_for_key workspaces_pool_errors_of_yojson "Errors") _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     bundle_id = value_for_key bundle_id_of_yojson "BundleId" _list path;
     created_at = value_for_key timestamp_of_yojson "CreatedAt" _list path;
     state = value_for_key workspaces_pool_state_of_yojson "State" _list path;
     description =
       option_of_yojson (value_for_key update_description_of_yojson "Description") _list path;
     pool_name = value_for_key workspaces_pool_name_of_yojson "PoolName" _list path;
     capacity_status = value_for_key capacity_status_of_yojson "CapacityStatus" _list path;
     pool_arn = value_for_key ar_n_of_yojson "PoolArn" _list path;
     pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path;
   }
    : workspaces_pool)

let update_workspaces_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspaces_pool =
       option_of_yojson (value_for_key workspaces_pool_of_yojson "WorkspacesPool") _list path;
   }
    : update_workspaces_pool_result)

let capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_user_sessions =
       value_for_key desired_user_sessions_of_yojson "DesiredUserSessions" _list path;
   }
    : capacity)

let application_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings_group =
       option_of_yojson (value_for_key settings_group_of_yojson "SettingsGroup") _list path;
     status = value_for_key application_settings_status_enum_of_yojson "Status" _list path;
   }
    : application_settings_request)

let update_workspaces_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     running_mode =
       option_of_yojson (value_for_key pools_running_mode_of_yojson "RunningMode") _list path;
     timeout_settings =
       option_of_yojson (value_for_key timeout_settings_of_yojson "TimeoutSettings") _list path;
     application_settings =
       option_of_yojson
         (value_for_key application_settings_request_of_yojson "ApplicationSettings")
         _list path;
     capacity = option_of_yojson (value_for_key capacity_of_yojson "Capacity") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path;
     description =
       option_of_yojson (value_for_key update_description_of_yojson "Description") _list path;
     pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path;
   }
    : update_workspaces_pool_request)

let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ResourceId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : resource_unavailable_exception)

let update_workspace_image_permission_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let workspace_image_id_of_yojson = string_of_yojson
let boolean_object_of_yojson = bool_of_yojson
let aws_account_of_yojson = string_of_yojson

let update_workspace_image_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_account_id = value_for_key aws_account_of_yojson "SharedAccountId" _list path;
     allow_copy_image = value_for_key boolean_object_of_yojson "AllowCopyImage" _list path;
     image_id = value_for_key workspace_image_id_of_yojson "ImageId" _list path;
   }
    : update_workspace_image_permission_request)

let update_workspace_bundle_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_workspace_bundle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
     bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path;
   }
    : update_workspace_bundle_request)

let update_rules_of_ip_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let ip_group_id_of_yojson = string_of_yojson
let ip_rule_of_yojson = string_of_yojson
let ip_rule_desc_of_yojson = string_of_yojson

let ip_rule_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_desc = option_of_yojson (value_for_key ip_rule_desc_of_yojson "ruleDesc") _list path;
     ip_rule = option_of_yojson (value_for_key ip_rule_of_yojson "ipRule") _list path;
   }
    : ip_rule_item)

let ip_rule_list_of_yojson tree path = list_of_yojson ip_rule_item_of_yojson tree path

let update_rules_of_ip_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_rules = value_for_key ip_rule_list_of_yojson "UserRules" _list path;
     group_id = value_for_key ip_group_id_of_yojson "GroupId" _list path;
   }
    : update_rules_of_ip_group_request)

let resource_associated_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : resource_associated_exception)

let update_connection_alias_permission_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let connection_alias_id_of_yojson = string_of_yojson

let connection_alias_permission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allow_association = value_for_key boolean_object_of_yojson "AllowAssociation" _list path;
     shared_account_id = value_for_key aws_account_of_yojson "SharedAccountId" _list path;
   }
    : connection_alias_permission)

let update_connection_alias_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_alias_permission =
       value_for_key connection_alias_permission_of_yojson "ConnectionAliasPermission" _list path;
     alias_id = value_for_key connection_alias_id_of_yojson "AliasId" _list path;
   }
    : update_connection_alias_permission_request)

let update_connect_client_add_in_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_uuid_of_yojson = string_of_yojson
let add_in_name_of_yojson = string_of_yojson
let add_in_url_of_yojson = string_of_yojson

let update_connect_client_add_in_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ur_l = option_of_yojson (value_for_key add_in_url_of_yojson "URL") _list path;
     name = option_of_yojson (value_for_key add_in_name_of_yojson "Name") _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
     add_in_id = value_for_key amazon_uuid_of_yojson "AddInId" _list path;
   }
    : update_connect_client_add_in_request)

let terminate_workspaces_pool_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let terminate_workspaces_pool_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key amazon_uuid_of_yojson "SessionId" _list path }
    : terminate_workspaces_pool_session_request)

let terminate_workspaces_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let terminate_workspaces_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path }
    : terminate_workspaces_pool_request)

let workspace_id_of_yojson = string_of_yojson
let error_type_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let failed_workspace_change_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_type_of_yojson "ErrorCode") _list path;
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
   }
    : failed_workspace_change_request)

let failed_terminate_workspace_requests_of_yojson tree path =
  list_of_yojson failed_workspace_change_request_of_yojson tree path

let terminate_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_requests =
       option_of_yojson
         (value_for_key failed_terminate_workspace_requests_of_yojson "FailedRequests")
         _list path;
   }
    : terminate_workspaces_result)

let terminate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path }
    : terminate_request)

let terminate_workspace_requests_of_yojson tree path =
  list_of_yojson terminate_request_of_yojson tree path

let terminate_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terminate_workspace_requests =
       value_for_key terminate_workspace_requests_of_yojson "TerminateWorkspaceRequests" _list path;
   }
    : terminate_workspaces_request)

let stop_workspaces_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_workspaces_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path }
    : stop_workspaces_pool_request)

let failed_stop_workspace_requests_of_yojson tree path =
  list_of_yojson failed_workspace_change_request_of_yojson tree path

let stop_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_requests =
       option_of_yojson
         (value_for_key failed_stop_workspace_requests_of_yojson "FailedRequests")
         _list path;
   }
    : stop_workspaces_result)

let stop_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
   }
    : stop_request)

let stop_workspace_requests_of_yojson tree path = list_of_yojson stop_request_of_yojson tree path

let stop_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_workspace_requests =
       value_for_key stop_workspace_requests_of_yojson "StopWorkspaceRequests" _list path;
   }
    : stop_workspaces_request)

let start_workspaces_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_workspaces_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path }
    : start_workspaces_pool_request)

let failed_start_workspace_requests_of_yojson tree path =
  list_of_yojson failed_workspace_change_request_of_yojson tree path

let start_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_requests =
       option_of_yojson
         (value_for_key failed_start_workspace_requests_of_yojson "FailedRequests")
         _list path;
   }
    : start_workspaces_result)

let start_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
   }
    : start_request)

let start_workspace_requests_of_yojson tree path = list_of_yojson start_request_of_yojson tree path

let start_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_workspace_requests =
       value_for_key start_workspace_requests_of_yojson "StartWorkspaceRequests" _list path;
   }
    : start_workspaces_request)

let revoke_ip_rules_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let ip_revoked_rule_list_of_yojson tree path = list_of_yojson ip_rule_of_yojson tree path

let revoke_ip_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_rules = value_for_key ip_revoked_rule_list_of_yojson "UserRules" _list path;
     group_id = value_for_key ip_group_id_of_yojson "GroupId" _list path;
   }
    : revoke_ip_rules_request)

let restore_workspace_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let restore_workspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path }
    : restore_workspace_request)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : validation_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : conflict_exception)

let link_id_of_yojson = string_of_yojson

let account_link_status_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "REJECTED" -> REJECTED
    | `String "PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT" -> PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT
    | `String "LINK_NOT_FOUND" -> LINK_NOT_FOUND
    | `String "LINKING_FAILED" -> LINKING_FAILED
    | `String "LINKED" -> LINKED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccountLinkStatusEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountLinkStatusEnum")
     : account_link_status_enum)
    : account_link_status_enum)

let account_link_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "TargetAccountId") _list path;
     source_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "SourceAccountId") _list path;
     account_link_status =
       option_of_yojson
         (value_for_key account_link_status_enum_of_yojson "AccountLinkStatus")
         _list path;
     account_link_id = option_of_yojson (value_for_key link_id_of_yojson "AccountLinkId") _list path;
   }
    : account_link)

let reject_account_link_invitation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_link = option_of_yojson (value_for_key account_link_of_yojson "AccountLink") _list path;
   }
    : reject_account_link_invitation_result)

let client_token_of_yojson = string_of_yojson

let reject_account_link_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     link_id = value_for_key link_id_of_yojson "LinkId" _list path;
   }
    : reject_account_link_invitation_request)

let workspaces_default_role_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : workspaces_default_role_not_found_exception)

let unsupported_network_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unsupported_network_configuration_exception)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : resource_already_exists_exception)

let workspace_directory_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "DEREGISTERED" -> DEREGISTERED
    | `String "DEREGISTERING" -> DEREGISTERING
    | `String "REGISTERED" -> REGISTERED
    | `String "REGISTERING" -> REGISTERING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspaceDirectoryState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceDirectoryState")
     : workspace_directory_state)
    : workspace_directory_state)

let register_workspace_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key workspace_directory_state_of_yojson "State") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : register_workspace_directory_result)

let subnet_id_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path

let tenancy_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHARED" -> SHARED
    | `String "DEDICATED" -> DEDICATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Tenancy" value)
    | _ -> raise (deserialize_wrong_type_error path "Tenancy")
     : tenancy)
    : tenancy)

let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let workspace_directory_name_of_yojson = string_of_yojson
let workspace_directory_description_of_yojson = string_of_yojson

let user_identity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_IAM_IDENTITY_CENTER" -> AWS_IAM_IDENTITY_CENTER
    | `String "AWS_DIRECTORY_SERVICE" -> AWS_DIRECTORY_SERVICE
    | `String "CUSTOMER_MANAGED" -> CUSTOMER_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserIdentityType" value)
    | _ -> raise (deserialize_wrong_type_error path "UserIdentityType")
     : user_identity_type)
    : user_identity_type)

let microsoft_entra_config_tenant_id_of_yojson = string_of_yojson
let secrets_manager_arn_of_yojson = string_of_yojson

let microsoft_entra_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_config_secret_arn =
       option_of_yojson
         (value_for_key secrets_manager_arn_of_yojson "ApplicationConfigSecretArn")
         _list path;
     tenant_id =
       option_of_yojson
         (value_for_key microsoft_entra_config_tenant_id_of_yojson "TenantId")
         _list path;
   }
    : microsoft_entra_config)

let workspace_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "POOLS" -> POOLS
    | `String "PERSONAL" -> PERSONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkspaceType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceType")
     : workspace_type)
    : workspace_type)

let domain_name_of_yojson = string_of_yojson

let active_directory_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_account_secret_arn =
       value_for_key secrets_manager_arn_of_yojson "ServiceAccountSecretArn" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : active_directory_config)

let register_workspace_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_config =
       option_of_yojson
         (value_for_key active_directory_config_of_yojson "ActiveDirectoryConfig")
         _list path;
     workspace_type =
       option_of_yojson (value_for_key workspace_type_of_yojson "WorkspaceType") _list path;
     microsoft_entra_config =
       option_of_yojson
         (value_for_key microsoft_entra_config_of_yojson "MicrosoftEntraConfig")
         _list path;
     idc_instance_arn = option_of_yojson (value_for_key ar_n_of_yojson "IdcInstanceArn") _list path;
     user_identity_type =
       option_of_yojson (value_for_key user_identity_type_of_yojson "UserIdentityType") _list path;
     workspace_directory_description =
       option_of_yojson
         (value_for_key workspace_directory_description_of_yojson "WorkspaceDirectoryDescription")
         _list path;
     workspace_directory_name =
       option_of_yojson
         (value_for_key workspace_directory_name_of_yojson "WorkspaceDirectoryName")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     tenancy = option_of_yojson (value_for_key tenancy_of_yojson "Tenancy") _list path;
     enable_self_service =
       option_of_yojson (value_for_key boolean_object_of_yojson "EnableSelfService") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : register_workspace_directory_request)

let failed_rebuild_workspace_requests_of_yojson tree path =
  list_of_yojson failed_workspace_change_request_of_yojson tree path

let rebuild_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_requests =
       option_of_yojson
         (value_for_key failed_rebuild_workspace_requests_of_yojson "FailedRequests")
         _list path;
   }
    : rebuild_workspaces_result)

let rebuild_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path }
    : rebuild_request)

let rebuild_workspace_requests_of_yojson tree path =
  list_of_yojson rebuild_request_of_yojson tree path

let rebuild_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rebuild_workspace_requests =
       value_for_key rebuild_workspace_requests_of_yojson "RebuildWorkspaceRequests" _list path;
   }
    : rebuild_workspaces_request)

let failed_reboot_workspace_requests_of_yojson tree path =
  list_of_yojson failed_workspace_change_request_of_yojson tree path

let reboot_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_requests =
       option_of_yojson
         (value_for_key failed_reboot_workspace_requests_of_yojson "FailedRequests")
         _list path;
   }
    : reboot_workspaces_result)

let reboot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path }
    : reboot_request)

let reboot_workspace_requests_of_yojson tree path =
  list_of_yojson reboot_request_of_yojson tree path

let reboot_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reboot_workspace_requests =
       value_for_key reboot_workspace_requests_of_yojson "RebootWorkspaceRequests" _list path;
   }
    : reboot_workspaces_request)

let modify_workspace_state_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let target_workspace_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADMIN_MAINTENANCE" -> ADMIN_MAINTENANCE
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TargetWorkspaceState" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetWorkspaceState")
     : target_workspace_state)
    : target_workspace_state)

let modify_workspace_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_state = value_for_key target_workspace_state_of_yojson "WorkspaceState" _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
   }
    : modify_workspace_state_request)

let unsupported_workspace_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unsupported_workspace_configuration_exception)

let modify_workspace_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let running_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "MANUAL" -> MANUAL
    | `String "ALWAYS_ON" -> ALWAYS_ON
    | `String "AUTO_STOP" -> AUTO_STOP
    | `String value -> raise (deserialize_unknown_enum_value_error path "RunningMode" value)
    | _ -> raise (deserialize_wrong_type_error path "RunningMode")
     : running_mode)
    : running_mode)

let running_mode_auto_stop_timeout_in_minutes_of_yojson = int_of_yojson
let root_volume_size_gib_of_yojson = int_of_yojson
let user_volume_size_gib_of_yojson = int_of_yojson

let compute_of_yojson (tree : t) path =
  ((match tree with
    | `String "GRAPHICS_GR6F_4XLARGE" -> GRAPHICS_GR6F_4XLARGE
    | `String "GRAPHICS_G6F_4XLARGE" -> GRAPHICS_G6F_4XLARGE
    | `String "GRAPHICS_G6F_2XLARGE" -> GRAPHICS_G6F_2XLARGE
    | `String "GRAPHICS_G6F_XLARGE" -> GRAPHICS_G6F_XLARGE
    | `String "GRAPHICS_G6F_LARGE" -> GRAPHICS_G6F_LARGE
    | `String "GRAPHICS_GR6_8XLARGE" -> GRAPHICS_GR6_8XLARGE
    | `String "GRAPHICS_GR6_4XLARGE" -> GRAPHICS_GR6_4XLARGE
    | `String "GRAPHICS_G6_16XLARGE" -> GRAPHICS_G6_16XLARGE
    | `String "GRAPHICS_G6_8XLARGE" -> GRAPHICS_G6_8XLARGE
    | `String "GRAPHICS_G6_4XLARGE" -> GRAPHICS_G6_4XLARGE
    | `String "GRAPHICS_G6_2XLARGE" -> GRAPHICS_G6_2XLARGE
    | `String "GRAPHICS_G6_XLARGE" -> GRAPHICS_G6_XLARGE
    | `String "GRAPHICSPRO_G4DN" -> GRAPHICSPRO_G4DN
    | `String "GRAPHICS_G4DN" -> GRAPHICS_G4DN
    | `String "GRAPHICSPRO" -> GRAPHICSPRO
    | `String "GENERALPURPOSE_8XLARGE" -> GENERALPURPOSE_8XLARGE
    | `String "GENERALPURPOSE_4XLARGE" -> GENERALPURPOSE_4XLARGE
    | `String "POWERPRO" -> POWERPRO
    | `String "GRAPHICS" -> GRAPHICS
    | `String "POWER" -> POWER
    | `String "PERFORMANCE" -> PERFORMANCE
    | `String "STANDARD" -> STANDARD
    | `String "VALUE" -> VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Compute" value)
    | _ -> raise (deserialize_wrong_type_error path "Compute")
     : compute)
    : compute)

let protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "WSP" -> WSP
    | `String "PCOIP" -> PCOIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "Protocol" value)
    | _ -> raise (deserialize_wrong_type_error path "Protocol")
     : protocol)
    : protocol)

let protocol_list_of_yojson tree path = list_of_yojson protocol_of_yojson tree path

let operating_system_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROCKY_8" -> ROCKY_8
    | `String "RHEL_8" -> RHEL_8
    | `String "WINDOWS_SERVER_2025" -> WINDOWS_SERVER_2025
    | `String "WINDOWS_SERVER_2022" -> WINDOWS_SERVER_2022
    | `String "WINDOWS_SERVER_2019" -> WINDOWS_SERVER_2019
    | `String "WINDOWS_SERVER_2016" -> WINDOWS_SERVER_2016
    | `String "WINDOWS_7" -> WINDOWS_7
    | `String "WINDOWS_11" -> WINDOWS_11
    | `String "WINDOWS_10" -> WINDOWS_10
    | `String "UNKNOWN" -> UNKNOWN
    | `String "UBUNTU_22_04" -> UBUNTU_22_04
    | `String "UBUNTU_20_04" -> UBUNTU_20_04
    | `String "UBUNTU_18_04" -> UBUNTU_18_04
    | `String "AMAZON_LINUX_2" -> AMAZON_LINUX_2
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperatingSystemName" value)
    | _ -> raise (deserialize_wrong_type_error path "OperatingSystemName")
     : operating_system_name)
    : operating_system_name)

let aga_mode_for_work_space_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "INHERITED" -> INHERITED
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED_AUTO" -> ENABLED_AUTO
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AGAModeForWorkSpaceEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AGAModeForWorkSpaceEnum")
     : aga_mode_for_work_space_enum)
    : aga_mode_for_work_space_enum)

let aga_preferred_protocol_for_work_space_of_yojson (tree : t) path =
  ((match tree with
    | `String "INHERITED" -> INHERITED
    | `String "NONE" -> NONE
    | `String "TCP" -> TCP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AGAPreferredProtocolForWorkSpace" value)
    | _ -> raise (deserialize_wrong_type_error path "AGAPreferredProtocolForWorkSpace")
     : aga_preferred_protocol_for_work_space)
    : aga_preferred_protocol_for_work_space)

let global_accelerator_for_work_space_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_protocol =
       option_of_yojson
         (value_for_key aga_preferred_protocol_for_work_space_of_yojson "PreferredProtocol")
         _list path;
     mode = value_for_key aga_mode_for_work_space_enum_of_yojson "Mode" _list path;
   }
    : global_accelerator_for_work_space)

let workspace_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_accelerator =
       option_of_yojson
         (value_for_key global_accelerator_for_work_space_of_yojson "GlobalAccelerator")
         _list path;
     operating_system_name =
       option_of_yojson
         (value_for_key operating_system_name_of_yojson "OperatingSystemName")
         _list path;
     protocols = option_of_yojson (value_for_key protocol_list_of_yojson "Protocols") _list path;
     compute_type_name =
       option_of_yojson (value_for_key compute_of_yojson "ComputeTypeName") _list path;
     user_volume_size_gib =
       option_of_yojson
         (value_for_key user_volume_size_gib_of_yojson "UserVolumeSizeGib")
         _list path;
     root_volume_size_gib =
       option_of_yojson
         (value_for_key root_volume_size_gib_of_yojson "RootVolumeSizeGib")
         _list path;
     running_mode_auto_stop_timeout_in_minutes =
       option_of_yojson
         (value_for_key running_mode_auto_stop_timeout_in_minutes_of_yojson
            "RunningModeAutoStopTimeoutInMinutes")
         _list path;
     running_mode = option_of_yojson (value_for_key running_mode_of_yojson "RunningMode") _list path;
   }
    : workspace_properties)

let data_replication_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIMARY_AS_SOURCE" -> PRIMARY_AS_SOURCE
    | `String "NO_REPLICATION" -> NO_REPLICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataReplication" value)
    | _ -> raise (deserialize_wrong_type_error path "DataReplication")
     : data_replication)
    : data_replication)

let modify_workspace_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_replication =
       option_of_yojson (value_for_key data_replication_of_yojson "DataReplication") _list path;
     workspace_properties =
       option_of_yojson
         (value_for_key workspace_properties_of_yojson "WorkspaceProperties")
         _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
   }
    : modify_workspace_properties_request)

let modify_workspace_creation_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let default_ou_of_yojson = string_of_yojson
let security_group_id_of_yojson = string_of_yojson

let workspace_creation_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_iam_role_arn =
       option_of_yojson (value_for_key ar_n_of_yojson "InstanceIamRoleArn") _list path;
     enable_maintenance_mode =
       option_of_yojson (value_for_key boolean_object_of_yojson "EnableMaintenanceMode") _list path;
     user_enabled_as_local_administrator =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UserEnabledAsLocalAdministrator")
         _list path;
     custom_security_group_id =
       option_of_yojson
         (value_for_key security_group_id_of_yojson "CustomSecurityGroupId")
         _list path;
     default_ou = option_of_yojson (value_for_key default_ou_of_yojson "DefaultOu") _list path;
     enable_internet_access =
       option_of_yojson (value_for_key boolean_object_of_yojson "EnableInternetAccess") _list path;
   }
    : workspace_creation_properties)

let modify_workspace_creation_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_creation_properties =
       value_for_key workspace_creation_properties_of_yojson "WorkspaceCreationProperties" _list
         path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : modify_workspace_creation_properties_request)

let invalid_parameter_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_parameter_combination_exception)

let modify_workspace_access_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let access_property_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessPropertyValue" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessPropertyValue")
     : access_property_value)
    : access_property_value)

let access_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STREAMING_WSP" -> STREAMING_WSP
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessEndpointType")
     : access_endpoint_type)
    : access_endpoint_type)

let alphanumeric_dash_underscore_non_empty_string_of_yojson = string_of_yojson

let access_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id =
       option_of_yojson
         (value_for_key alphanumeric_dash_underscore_non_empty_string_of_yojson "VpcEndpointId")
         _list path;
     access_endpoint_type =
       option_of_yojson
         (value_for_key access_endpoint_type_of_yojson "AccessEndpointType")
         _list path;
   }
    : access_endpoint)

let access_endpoint_list_of_yojson tree path = list_of_yojson access_endpoint_of_yojson tree path

let internet_fallback_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "PCOIP" -> PCOIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InternetFallbackProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "InternetFallbackProtocol")
     : internet_fallback_protocol)
    : internet_fallback_protocol)

let internet_fallback_protocol_list_of_yojson tree path =
  list_of_yojson internet_fallback_protocol_of_yojson tree path

let access_endpoint_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     internet_fallback_protocols =
       option_of_yojson
         (value_for_key internet_fallback_protocol_list_of_yojson "InternetFallbackProtocols")
         _list path;
     access_endpoints = value_for_key access_endpoint_list_of_yojson "AccessEndpoints" _list path;
   }
    : access_endpoint_config)

let workspace_access_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_endpoint_config =
       option_of_yojson
         (value_for_key access_endpoint_config_of_yojson "AccessEndpointConfig")
         _list path;
     device_type_work_spaces_thin_client =
       option_of_yojson
         (value_for_key access_property_value_of_yojson "DeviceTypeWorkSpacesThinClient")
         _list path;
     device_type_linux =
       option_of_yojson (value_for_key access_property_value_of_yojson "DeviceTypeLinux") _list path;
     device_type_zero_client =
       option_of_yojson
         (value_for_key access_property_value_of_yojson "DeviceTypeZeroClient")
         _list path;
     device_type_chrome_os =
       option_of_yojson
         (value_for_key access_property_value_of_yojson "DeviceTypeChromeOs")
         _list path;
     device_type_android =
       option_of_yojson
         (value_for_key access_property_value_of_yojson "DeviceTypeAndroid")
         _list path;
     device_type_ios =
       option_of_yojson (value_for_key access_property_value_of_yojson "DeviceTypeIos") _list path;
     device_type_web =
       option_of_yojson (value_for_key access_property_value_of_yojson "DeviceTypeWeb") _list path;
     device_type_osx =
       option_of_yojson (value_for_key access_property_value_of_yojson "DeviceTypeOsx") _list path;
     device_type_windows =
       option_of_yojson
         (value_for_key access_property_value_of_yojson "DeviceTypeWindows")
         _list path;
   }
    : workspace_access_properties)

let modify_workspace_access_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_access_properties =
       value_for_key workspace_access_properties_of_yojson "WorkspaceAccessProperties" _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : modify_workspace_access_properties_request)

let modify_streaming_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let streaming_experience_preferred_protocol_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "UDP" -> UDP
    | `String "TCP" -> TCP
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "StreamingExperiencePreferredProtocolEnum"
             value)
    | _ -> raise (deserialize_wrong_type_error path "StreamingExperiencePreferredProtocolEnum")
     : streaming_experience_preferred_protocol_enum)
    : streaming_experience_preferred_protocol_enum)

let user_setting_action_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "SMART_CARD" -> SMART_CARD
    | `String "PRINTING_TO_LOCAL_DEVICE" -> PRINTING_TO_LOCAL_DEVICE
    | `String "CLIPBOARD_COPY_TO_LOCAL_DEVICE" -> CLIPBOARD_COPY_TO_LOCAL_DEVICE
    | `String "CLIPBOARD_COPY_FROM_LOCAL_DEVICE" -> CLIPBOARD_COPY_FROM_LOCAL_DEVICE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UserSettingActionEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "UserSettingActionEnum")
     : user_setting_action_enum)
    : user_setting_action_enum)

let user_setting_permission_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UserSettingPermissionEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "UserSettingPermissionEnum")
     : user_setting_permission_enum)
    : user_setting_permission_enum)

let maximum_length_of_yojson = int_of_yojson

let user_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_length =
       option_of_yojson (value_for_key maximum_length_of_yojson "MaximumLength") _list path;
     permission = value_for_key user_setting_permission_enum_of_yojson "Permission" _list path;
     action = value_for_key user_setting_action_enum_of_yojson "Action" _list path;
   }
    : user_setting)

let user_settings_of_yojson tree path = list_of_yojson user_setting_of_yojson tree path

let storage_connector_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOME_FOLDER" -> HOME_FOLDER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageConnectorTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageConnectorTypeEnum")
     : storage_connector_type_enum)
    : storage_connector_type_enum)

let storage_connector_status_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageConnectorStatusEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageConnectorStatusEnum")
     : storage_connector_status_enum)
    : storage_connector_status_enum)

let storage_connector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key storage_connector_status_enum_of_yojson "Status" _list path;
     connector_type = value_for_key storage_connector_type_enum_of_yojson "ConnectorType" _list path;
   }
    : storage_connector)

let storage_connectors_of_yojson tree path = list_of_yojson storage_connector_of_yojson tree path

let aga_mode_for_directory_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED_AUTO" -> ENABLED_AUTO
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AGAModeForDirectoryEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AGAModeForDirectoryEnum")
     : aga_mode_for_directory_enum)
    : aga_mode_for_directory_enum)

let aga_preferred_protocol_for_directory_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "TCP" -> TCP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AGAPreferredProtocolForDirectory" value)
    | _ -> raise (deserialize_wrong_type_error path "AGAPreferredProtocolForDirectory")
     : aga_preferred_protocol_for_directory)
    : aga_preferred_protocol_for_directory)

let global_accelerator_for_directory_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_protocol =
       option_of_yojson
         (value_for_key aga_preferred_protocol_for_directory_of_yojson "PreferredProtocol")
         _list path;
     mode = value_for_key aga_mode_for_directory_enum_of_yojson "Mode" _list path;
   }
    : global_accelerator_for_directory)

let streaming_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_accelerator =
       option_of_yojson
         (value_for_key global_accelerator_for_directory_of_yojson "GlobalAccelerator")
         _list path;
     storage_connectors =
       option_of_yojson (value_for_key storage_connectors_of_yojson "StorageConnectors") _list path;
     user_settings =
       option_of_yojson (value_for_key user_settings_of_yojson "UserSettings") _list path;
     streaming_experience_preferred_protocol =
       option_of_yojson
         (value_for_key streaming_experience_preferred_protocol_enum_of_yojson
            "StreamingExperiencePreferredProtocol")
         _list path;
   }
    : streaming_properties)

let modify_streaming_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     streaming_properties =
       option_of_yojson
         (value_for_key streaming_properties_of_yojson "StreamingProperties")
         _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : modify_streaming_properties_request)

let modify_selfservice_permissions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let reconnect_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReconnectEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ReconnectEnum")
     : reconnect_enum)
    : reconnect_enum)

let selfservice_permissions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rebuild_workspace =
       option_of_yojson (value_for_key reconnect_enum_of_yojson "RebuildWorkspace") _list path;
     switch_running_mode =
       option_of_yojson (value_for_key reconnect_enum_of_yojson "SwitchRunningMode") _list path;
     change_compute_type =
       option_of_yojson (value_for_key reconnect_enum_of_yojson "ChangeComputeType") _list path;
     increase_volume_size =
       option_of_yojson (value_for_key reconnect_enum_of_yojson "IncreaseVolumeSize") _list path;
     restart_workspace =
       option_of_yojson (value_for_key reconnect_enum_of_yojson "RestartWorkspace") _list path;
   }
    : selfservice_permissions)

let modify_selfservice_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selfservice_permissions =
       value_for_key selfservice_permissions_of_yojson "SelfservicePermissions" _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : modify_selfservice_permissions_request)

let modify_saml_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let saml_status_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK" -> ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SamlStatusEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "SamlStatusEnum")
     : saml_status_enum)
    : saml_status_enum)

let saml_user_access_url_of_yojson = string_of_yojson

let saml_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relay_state_parameter_name =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "RelayStateParameterName")
         _list path;
     user_access_url =
       option_of_yojson (value_for_key saml_user_access_url_of_yojson "UserAccessUrl") _list path;
     status = option_of_yojson (value_for_key saml_status_enum_of_yojson "Status") _list path;
   }
    : saml_properties)

let deletable_saml_property_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME" ->
        SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME
    | `String "SAML_PROPERTIES_USER_ACCESS_URL" -> SAML_PROPERTIES_USER_ACCESS_URL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeletableSamlProperty" value)
    | _ -> raise (deserialize_wrong_type_error path "DeletableSamlProperty")
     : deletable_saml_property)
    : deletable_saml_property)

let deletable_saml_properties_list_of_yojson tree path =
  list_of_yojson deletable_saml_property_of_yojson tree path

let modify_saml_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties_to_delete =
       option_of_yojson
         (value_for_key deletable_saml_properties_list_of_yojson "PropertiesToDelete")
         _list path;
     saml_properties =
       option_of_yojson (value_for_key saml_properties_of_yojson "SamlProperties") _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : modify_saml_properties_request)

let modify_endpoint_encryption_mode_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let endpoint_encryption_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIPS_VALIDATED" -> FIPS_VALIDATED
    | `String "STANDARD_TLS" -> STANDARD_TLS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EndpointEncryptionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointEncryptionMode")
     : endpoint_encryption_mode)
    : endpoint_encryption_mode)

let modify_endpoint_encryption_mode_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_encryption_mode =
       value_for_key endpoint_encryption_mode_of_yojson "EndpointEncryptionMode" _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
   }
    : modify_endpoint_encryption_mode_request)

let modify_client_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let log_upload_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogUploadEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "LogUploadEnum")
     : log_upload_enum)
    : log_upload_enum)

let client_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_upload_enabled =
       option_of_yojson (value_for_key log_upload_enum_of_yojson "LogUploadEnabled") _list path;
     reconnect_enabled =
       option_of_yojson (value_for_key reconnect_enum_of_yojson "ReconnectEnabled") _list path;
   }
    : client_properties)

let modify_client_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_properties = value_for_key client_properties_of_yojson "ClientProperties" _list path;
     resource_id = value_for_key non_empty_string_of_yojson "ResourceId" _list path;
   }
    : modify_client_properties_request)

let modify_certificate_based_auth_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let certificate_based_auth_status_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateBasedAuthStatusEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateBasedAuthStatusEnum")
     : certificate_based_auth_status_enum)
    : certificate_based_auth_status_enum)

let certificate_authority_arn_of_yojson = string_of_yojson

let certificate_based_auth_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority_arn =
       option_of_yojson
         (value_for_key certificate_authority_arn_of_yojson "CertificateAuthorityArn")
         _list path;
     status =
       option_of_yojson
         (value_for_key certificate_based_auth_status_enum_of_yojson "Status")
         _list path;
   }
    : certificate_based_auth_properties)

let deletable_certificate_based_auth_property_of_yojson (tree : t) path =
  ((match tree with
    | `String "CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN" ->
        CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DeletableCertificateBasedAuthProperty" value)
    | _ -> raise (deserialize_wrong_type_error path "DeletableCertificateBasedAuthProperty")
     : deletable_certificate_based_auth_property)
    : deletable_certificate_based_auth_property)

let deletable_certificate_based_auth_properties_list_of_yojson tree path =
  list_of_yojson deletable_certificate_based_auth_property_of_yojson tree path

let modify_certificate_based_auth_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties_to_delete =
       option_of_yojson
         (value_for_key deletable_certificate_based_auth_properties_list_of_yojson
            "PropertiesToDelete")
         _list path;
     certificate_based_auth_properties =
       option_of_yojson
         (value_for_key certificate_based_auth_properties_of_yojson "CertificateBasedAuthProperties")
         _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : modify_certificate_based_auth_properties_request)

let message_of_yojson = string_of_yojson

let modify_account_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "Message") _list path }
    : modify_account_result)

let dedicated_tenancy_support_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DedicatedTenancySupportEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "DedicatedTenancySupportEnum")
     : dedicated_tenancy_support_enum)
    : dedicated_tenancy_support_enum)

let dedicated_tenancy_management_cidr_range_of_yojson = string_of_yojson

let modify_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dedicated_tenancy_management_cidr_range =
       option_of_yojson
         (value_for_key dedicated_tenancy_management_cidr_range_of_yojson
            "DedicatedTenancyManagementCidrRange")
         _list path;
     dedicated_tenancy_support =
       option_of_yojson
         (value_for_key dedicated_tenancy_support_enum_of_yojson "DedicatedTenancySupport")
         _list path;
   }
    : modify_account_request)

let migrate_workspace_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_workspace_id =
       option_of_yojson (value_for_key workspace_id_of_yojson "TargetWorkspaceId") _list path;
     source_workspace_id =
       option_of_yojson (value_for_key workspace_id_of_yojson "SourceWorkspaceId") _list path;
   }
    : migrate_workspace_result)

let migrate_workspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundle_id = value_for_key bundle_id_of_yojson "BundleId" _list path;
     source_workspace_id = value_for_key workspace_id_of_yojson "SourceWorkspaceId" _list path;
   }
    : migrate_workspace_request)

let dedicated_tenancy_cidr_range_list_of_yojson tree path =
  list_of_yojson dedicated_tenancy_management_cidr_range_of_yojson tree path

let pagination_token_of_yojson = string_of_yojson

let list_available_management_cidr_ranges_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     management_cidr_ranges =
       option_of_yojson
         (value_for_key dedicated_tenancy_cidr_range_list_of_yojson "ManagementCidrRanges")
         _list path;
   }
    : list_available_management_cidr_ranges_result)

let management_cidr_range_constraint_of_yojson = string_of_yojson
let management_cidr_range_max_results_of_yojson = int_of_yojson

let list_available_management_cidr_ranges_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key management_cidr_range_max_results_of_yojson "MaxResults")
         _list path;
     management_cidr_range_constraint =
       value_for_key management_cidr_range_constraint_of_yojson "ManagementCidrRangeConstraint"
         _list path;
   }
    : list_available_management_cidr_ranges_request)

let account_link_list_of_yojson tree path = list_of_yojson account_link_of_yojson tree path

let list_account_links_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     account_links =
       option_of_yojson (value_for_key account_link_list_of_yojson "AccountLinks") _list path;
   }
    : list_account_links_result)

let link_status_filter_list_of_yojson tree path =
  list_of_yojson account_link_status_enum_of_yojson tree path

let limit_of_yojson = int_of_yojson

let list_account_links_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     link_status_filter =
       option_of_yojson
         (value_for_key link_status_filter_list_of_yojson "LinkStatusFilter")
         _list path;
   }
    : list_account_links_request)

let import_workspace_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path }
    : import_workspace_image_result)

let ec2_image_id_of_yojson = string_of_yojson

let workspace_image_ingestion_process_of_yojson (tree : t) path =
  ((match tree with
    | `String "BYOL_GRAPHICS_G4DN_BYOP" -> BYOL_GRAPHICS_G4DN_BYOP
    | `String "BYOL_REGULAR_BYOP" -> BYOL_REGULAR_BYOP
    | `String "BYOL_GRAPHICS_G4DN_WSP" -> BYOL_GRAPHICS_G4DN_WSP
    | `String "BYOL_REGULAR_WSP" -> BYOL_REGULAR_WSP
    | `String "BYOL_GRAPHICS_G4DN" -> BYOL_GRAPHICS_G4DN
    | `String "BYOL_GRAPHICSPRO" -> BYOL_GRAPHICSPRO
    | `String "BYOL_GRAPHICS" -> BYOL_GRAPHICS
    | `String "BYOL_REGULAR" -> BYOL_REGULAR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspaceImageIngestionProcess" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceImageIngestionProcess")
     : workspace_image_ingestion_process)
    : workspace_image_ingestion_process)

let workspace_image_name_of_yojson = string_of_yojson
let workspace_image_description_of_yojson = string_of_yojson

let application_of_yojson (tree : t) path =
  ((match tree with
    | `String "Microsoft_Office_2019" -> Microsoft_Office_2019
    | `String "Microsoft_Office_2016" -> Microsoft_Office_2016
    | `String value -> raise (deserialize_unknown_enum_value_error path "Application" value)
    | _ -> raise (deserialize_wrong_type_error path "Application")
     : application)
    : application)

let application_list_of_yojson tree path = list_of_yojson application_of_yojson tree path

let import_workspace_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     applications =
       option_of_yojson (value_for_key application_list_of_yojson "Applications") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     image_description =
       value_for_key workspace_image_description_of_yojson "ImageDescription" _list path;
     image_name = value_for_key workspace_image_name_of_yojson "ImageName" _list path;
     ingestion_process =
       value_for_key workspace_image_ingestion_process_of_yojson "IngestionProcess" _list path;
     ec2_image_id = value_for_key ec2_image_id_of_yojson "Ec2ImageId" _list path;
   }
    : import_workspace_image_request)

let custom_workspace_image_import_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "COMPLETED" -> COMPLETED
    | `String "PUBLISHING" -> PUBLISHING
    | `String "VALIDATING" -> VALIDATING
    | `String "GENERALIZING" -> GENERALIZING
    | `String "INSTALLING_COMPONENTS" -> INSTALLING_COMPONENTS
    | `String "CREATING_TEST_INSTANCE" -> CREATING_TEST_INSTANCE
    | `String "IMAGE_TESTING_GENERALIZATION" -> IMAGE_TESTING_GENERALIZATION
    | `String "IMAGE_COMPATIBILITY_CHECKING" -> IMAGE_COMPATIBILITY_CHECKING
    | `String "UPDATING_OPERATING_SYSTEM" -> UPDATING_OPERATING_SYSTEM
    | `String "IMAGE_TESTING_START" -> IMAGE_TESTING_START
    | `String "PROCESSING_SOURCE_IMAGE" -> PROCESSING_SOURCE_IMAGE
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomWorkspaceImageImportState" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomWorkspaceImageImportState")
     : custom_workspace_image_import_state)
    : custom_workspace_image_import_state)

let import_custom_workspace_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       option_of_yojson
         (value_for_key custom_workspace_image_import_state_of_yojson "State")
         _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
   }
    : import_custom_workspace_image_result)

let image_compute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GRAPHICS_G6" -> GRAPHICS_G6
    | `String "GRAPHICS_G4DN" -> GRAPHICS_G4DN
    | `String "BASE" -> BASE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageComputeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageComputeType")
     : image_compute_type)
    : image_compute_type)

let custom_image_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "BYOP" -> BYOP
    | `String "DCV" -> DCV
    | `String "PCOIP" -> PCOIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomImageProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomImageProtocol")
     : custom_image_protocol)
    : custom_image_protocol)

let ec2_import_task_id_of_yojson = string_of_yojson
let image_build_version_arn_of_yojson = string_of_yojson

let image_source_identifier_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Ec2ImageId" -> Ec2ImageId (ec2_image_id_of_yojson value_ path)
   | "ImageBuildVersionArn" -> ImageBuildVersionArn (image_build_version_arn_of_yojson value_ path)
   | "Ec2ImportTaskId" -> Ec2ImportTaskId (ec2_import_task_id_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ImageSourceIdentifier" unknown)
    : image_source_identifier)

let infrastructure_configuration_arn_of_yojson = string_of_yojson

let platform_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS" -> WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Platform" value)
    | _ -> raise (deserialize_wrong_type_error path "Platform")
     : platform)
    : platform)

let os_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "Windows_11" -> Windows_11
    | `String "Windows_10" -> Windows_10
    | `String value -> raise (deserialize_unknown_enum_value_error path "OSVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "OSVersion")
     : os_version)
    : os_version)

let import_custom_workspace_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     os_version = value_for_key os_version_of_yojson "OsVersion" _list path;
     platform = value_for_key platform_of_yojson "Platform" _list path;
     infrastructure_configuration_arn =
       value_for_key infrastructure_configuration_arn_of_yojson "InfrastructureConfigurationArn"
         _list path;
     image_source = value_for_key image_source_identifier_of_yojson "ImageSource" _list path;
     protocol = value_for_key custom_image_protocol_of_yojson "Protocol" _list path;
     compute_type = value_for_key image_compute_type_of_yojson "ComputeType" _list path;
     image_description =
       value_for_key workspace_image_description_of_yojson "ImageDescription" _list path;
     image_name = value_for_key workspace_image_name_of_yojson "ImageName" _list path;
   }
    : import_custom_workspace_image_request)

let client_url_of_yojson = string_of_yojson
let client_email_of_yojson = string_of_yojson
let client_login_message_of_yojson = string_of_yojson
let client_locale_of_yojson = string_of_yojson

let login_message_of_yojson tree path =
  map_of_yojson client_locale_of_yojson client_login_message_of_yojson tree path

let default_client_branding_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     login_message =
       option_of_yojson (value_for_key login_message_of_yojson "LoginMessage") _list path;
     forgot_password_link =
       option_of_yojson (value_for_key client_url_of_yojson "ForgotPasswordLink") _list path;
     support_link = option_of_yojson (value_for_key client_url_of_yojson "SupportLink") _list path;
     support_email =
       option_of_yojson (value_for_key client_email_of_yojson "SupportEmail") _list path;
     logo_url = option_of_yojson (value_for_key client_url_of_yojson "LogoUrl") _list path;
   }
    : default_client_branding_attributes)

let ios_client_branding_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     login_message =
       option_of_yojson (value_for_key login_message_of_yojson "LoginMessage") _list path;
     forgot_password_link =
       option_of_yojson (value_for_key client_url_of_yojson "ForgotPasswordLink") _list path;
     support_link = option_of_yojson (value_for_key client_url_of_yojson "SupportLink") _list path;
     support_email =
       option_of_yojson (value_for_key client_email_of_yojson "SupportEmail") _list path;
     logo3x_url = option_of_yojson (value_for_key client_url_of_yojson "Logo3xUrl") _list path;
     logo2x_url = option_of_yojson (value_for_key client_url_of_yojson "Logo2xUrl") _list path;
     logo_url = option_of_yojson (value_for_key client_url_of_yojson "LogoUrl") _list path;
   }
    : ios_client_branding_attributes)

let import_client_branding_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_type_web =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeWeb")
         _list path;
     device_type_linux =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeLinux")
         _list path;
     device_type_ios =
       option_of_yojson
         (value_for_key ios_client_branding_attributes_of_yojson "DeviceTypeIos")
         _list path;
     device_type_android =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeAndroid")
         _list path;
     device_type_osx =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeOsx")
         _list path;
     device_type_windows =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeWindows")
         _list path;
   }
    : import_client_branding_result)

let default_logo_of_yojson = blob_of_yojson

let default_import_client_branding_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     login_message =
       option_of_yojson (value_for_key login_message_of_yojson "LoginMessage") _list path;
     forgot_password_link =
       option_of_yojson (value_for_key client_url_of_yojson "ForgotPasswordLink") _list path;
     support_link = option_of_yojson (value_for_key client_url_of_yojson "SupportLink") _list path;
     support_email =
       option_of_yojson (value_for_key client_email_of_yojson "SupportEmail") _list path;
     logo = option_of_yojson (value_for_key default_logo_of_yojson "Logo") _list path;
   }
    : default_import_client_branding_attributes)

let ios_logo_of_yojson = blob_of_yojson
let ios2_x_logo_of_yojson = blob_of_yojson
let ios3_x_logo_of_yojson = blob_of_yojson

let ios_import_client_branding_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     login_message =
       option_of_yojson (value_for_key login_message_of_yojson "LoginMessage") _list path;
     forgot_password_link =
       option_of_yojson (value_for_key client_url_of_yojson "ForgotPasswordLink") _list path;
     support_link = option_of_yojson (value_for_key client_url_of_yojson "SupportLink") _list path;
     support_email =
       option_of_yojson (value_for_key client_email_of_yojson "SupportEmail") _list path;
     logo3x = option_of_yojson (value_for_key ios3_x_logo_of_yojson "Logo3x") _list path;
     logo2x = option_of_yojson (value_for_key ios2_x_logo_of_yojson "Logo2x") _list path;
     logo = option_of_yojson (value_for_key ios_logo_of_yojson "Logo") _list path;
   }
    : ios_import_client_branding_attributes)

let import_client_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_type_web =
       option_of_yojson
         (value_for_key default_import_client_branding_attributes_of_yojson "DeviceTypeWeb")
         _list path;
     device_type_linux =
       option_of_yojson
         (value_for_key default_import_client_branding_attributes_of_yojson "DeviceTypeLinux")
         _list path;
     device_type_ios =
       option_of_yojson
         (value_for_key ios_import_client_branding_attributes_of_yojson "DeviceTypeIos")
         _list path;
     device_type_android =
       option_of_yojson
         (value_for_key default_import_client_branding_attributes_of_yojson "DeviceTypeAndroid")
         _list path;
     device_type_osx =
       option_of_yojson
         (value_for_key default_import_client_branding_attributes_of_yojson "DeviceTypeOsx")
         _list path;
     device_type_windows =
       option_of_yojson
         (value_for_key default_import_client_branding_attributes_of_yojson "DeviceTypeWindows")
         _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : import_client_branding_request)

let get_account_link_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_link = option_of_yojson (value_for_key account_link_of_yojson "AccountLink") _list path;
   }
    : get_account_link_result)

let get_account_link_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     linked_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "LinkedAccountId") _list path;
     link_id = option_of_yojson (value_for_key link_id_of_yojson "LinkId") _list path;
   }
    : get_account_link_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ResourceId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : resource_in_use_exception)

let work_space_associated_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION" -> APPLICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkSpaceAssociatedResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkSpaceAssociatedResourceType")
     : work_space_associated_resource_type)
    : work_space_associated_resource_type)

let association_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "REMOVED" -> REMOVED
    | `String "COMPLETED" -> COMPLETED
    | `String "ERROR" -> ERROR
    | `String "UNINSTALLING" -> UNINSTALLING
    | `String "INSTALLING" -> INSTALLING
    | `String "PENDING_UNINSTALL_DEPLOYMENT" -> PENDING_UNINSTALL_DEPLOYMENT
    | `String "PENDING_UNINSTALL" -> PENDING_UNINSTALL
    | `String "PENDING_INSTALL_DEPLOYMENT" -> PENDING_INSTALL_DEPLOYMENT
    | `String "PENDING_INSTALL" -> PENDING_INSTALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationState" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationState")
     : association_state)
    : association_state)

let association_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ValidationError.ApplicationOldVersionExists" -> APPLICATION_OLDVERSIONEXIST_FAILURE
    | `String "DeploymentError.WorkspaceUnreachable" -> WORKSPACE_UNREACHABLE
    | `String "DeploymentError.InternalServerError" -> INTERNAL_SERVER_ERROR
    | `String "ValidationError.UnsupportedOperatingSystem" -> UNSUPPORTED_OPERATING_SYSTEM
    | `String "ValidationError.InsufficientMemory" -> INSUFFICIENT_MEMORY
    | `String "ValidationError.InsufficientDiskSpace" -> INSUFFICIENT_DISKSPACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociationErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationErrorCode")
     : association_error_code)
    : association_error_code)

let string2048_of_yojson = string_of_yojson

let association_state_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string2048_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key association_error_code_of_yojson "ErrorCode") _list path;
   }
    : association_state_reason)

let workspace_resource_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
     state_reason =
       option_of_yojson (value_for_key association_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key association_state_of_yojson "State") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     associated_resource_type =
       option_of_yojson
         (value_for_key work_space_associated_resource_type_of_yojson "AssociatedResourceType")
         _list path;
     associated_resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "AssociatedResourceId") _list path;
   }
    : workspace_resource_association)

let disassociate_workspace_application_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association =
       option_of_yojson
         (value_for_key workspace_resource_association_of_yojson "Association")
         _list path;
   }
    : disassociate_workspace_application_result)

let work_space_application_id_of_yojson = string_of_yojson

let disassociate_workspace_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_id = value_for_key work_space_application_id_of_yojson "ApplicationId" _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
   }
    : disassociate_workspace_application_request)

let disassociate_ip_groups_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let ip_group_id_list_of_yojson tree path = list_of_yojson ip_group_id_of_yojson tree path

let disassociate_ip_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_ids = value_for_key ip_group_id_list_of_yojson "GroupIds" _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
   }
    : disassociate_ip_groups_request)

let disassociate_connection_alias_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_connection_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_id = value_for_key connection_alias_id_of_yojson "AliasId" _list path }
    : disassociate_connection_alias_request)

let authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAML" -> SAML
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationType")
     : authentication_type)
    : authentication_type)

let session_connection_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_CONNECTED" -> NOT_CONNECTED
    | `String "CONNECTED" -> CONNECTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SessionConnectionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionConnectionState")
     : session_connection_state)
    : session_connection_state)

let session_instance_id_of_yojson = string_of_yojson

let network_access_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     eni_id = option_of_yojson (value_for_key non_empty_string_of_yojson "EniId") _list path;
     eni_private_ip_address =
       option_of_yojson (value_for_key non_empty_string_of_yojson "EniPrivateIpAddress") _list path;
   }
    : network_access_configuration)

let workspaces_pool_user_id_of_yojson = string_of_yojson

let workspaces_pool_session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id = value_for_key workspaces_pool_user_id_of_yojson "UserId" _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     network_access_configuration =
       option_of_yojson
         (value_for_key network_access_configuration_of_yojson "NetworkAccessConfiguration")
         _list path;
     expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTime") _list path;
     pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path;
     instance_id =
       option_of_yojson (value_for_key session_instance_id_of_yojson "InstanceId") _list path;
     session_id = value_for_key amazon_uuid_of_yojson "SessionId" _list path;
     connection_state =
       option_of_yojson
         (value_for_key session_connection_state_of_yojson "ConnectionState")
         _list path;
     authentication_type =
       option_of_yojson
         (value_for_key authentication_type_of_yojson "AuthenticationType")
         _list path;
   }
    : workspaces_pool_session)

let workspaces_pool_sessions_of_yojson tree path =
  list_of_yojson workspaces_pool_session_of_yojson tree path

let describe_workspaces_pool_sessions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     sessions =
       option_of_yojson (value_for_key workspaces_pool_sessions_of_yojson "Sessions") _list path;
   }
    : describe_workspaces_pool_sessions_result)

let limit50_of_yojson = int_of_yojson

let describe_workspaces_pool_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit50_of_yojson "Limit") _list path;
     user_id =
       option_of_yojson (value_for_key workspaces_pool_user_id_of_yojson "UserId") _list path;
     pool_id = value_for_key workspaces_pool_id_of_yojson "PoolId" _list path;
   }
    : describe_workspaces_pool_sessions_request)

let workspaces_pools_of_yojson tree path = list_of_yojson workspaces_pool_of_yojson tree path

let describe_workspaces_pools_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     workspaces_pools =
       option_of_yojson (value_for_key workspaces_pools_of_yojson "WorkspacesPools") _list path;
   }
    : describe_workspaces_pools_result)

let workspaces_pool_ids_of_yojson tree path = list_of_yojson workspaces_pool_id_of_yojson tree path

let describe_workspaces_pools_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "PoolName" -> POOLNAME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DescribeWorkspacesPoolsFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "DescribeWorkspacesPoolsFilterName")
     : describe_workspaces_pools_filter_name)
    : describe_workspaces_pools_filter_name)

let describe_workspaces_pools_filter_value_of_yojson = string_of_yojson

let describe_workspaces_pools_filter_values_of_yojson tree path =
  list_of_yojson describe_workspaces_pools_filter_value_of_yojson tree path

let describe_workspaces_pools_filter_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOTCONTAINS" -> NOTCONTAINS
    | `String "CONTAINS" -> CONTAINS
    | `String "NOTEQUALS" -> NOTEQUALS
    | `String "EQUALS" -> EQUALS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DescribeWorkspacesPoolsFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "DescribeWorkspacesPoolsFilterOperator")
     : describe_workspaces_pools_filter_operator)
    : describe_workspaces_pools_filter_operator)

let describe_workspaces_pools_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operator =
       value_for_key describe_workspaces_pools_filter_operator_of_yojson "Operator" _list path;
     values = value_for_key describe_workspaces_pools_filter_values_of_yojson "Values" _list path;
     name = value_for_key describe_workspaces_pools_filter_name_of_yojson "Name" _list path;
   }
    : describe_workspaces_pools_filter)

let describe_workspaces_pools_filters_of_yojson tree path =
  list_of_yojson describe_workspaces_pools_filter_of_yojson tree path

let describe_workspaces_pools_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     filters =
       option_of_yojson
         (value_for_key describe_workspaces_pools_filters_of_yojson "Filters")
         _list path;
     pool_ids = option_of_yojson (value_for_key workspaces_pool_ids_of_yojson "PoolIds") _list path;
   }
    : describe_workspaces_pools_request)

let snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_time = option_of_yojson (value_for_key timestamp_of_yojson "SnapshotTime") _list path;
   }
    : snapshot)

let snapshot_list_of_yojson tree path = list_of_yojson snapshot_of_yojson tree path

let describe_workspace_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     restore_snapshots =
       option_of_yojson (value_for_key snapshot_list_of_yojson "RestoreSnapshots") _list path;
     rebuild_snapshots =
       option_of_yojson (value_for_key snapshot_list_of_yojson "RebuildSnapshots") _list path;
   }
    : describe_workspace_snapshots_result)

let describe_workspace_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path }
    : describe_workspace_snapshots_request)

let connection_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "DISCONNECTED" -> DISCONNECTED
    | `String "CONNECTED" -> CONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionState")
     : connection_state)
    : connection_state)

let workspace_connection_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_known_user_connection_timestamp =
       option_of_yojson
         (value_for_key timestamp_of_yojson "LastKnownUserConnectionTimestamp")
         _list path;
     connection_state_check_timestamp =
       option_of_yojson
         (value_for_key timestamp_of_yojson "ConnectionStateCheckTimestamp")
         _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_of_yojson "ConnectionState") _list path;
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
   }
    : workspace_connection_status)

let workspace_connection_status_list_of_yojson tree path =
  list_of_yojson workspace_connection_status_of_yojson tree path

let describe_workspaces_connection_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     workspaces_connection_status =
       option_of_yojson
         (value_for_key workspace_connection_status_list_of_yojson "WorkspacesConnectionStatus")
         _list path;
   }
    : describe_workspaces_connection_status_result)

let workspace_id_list_of_yojson tree path = list_of_yojson workspace_id_of_yojson tree path

let describe_workspaces_connection_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     workspace_ids =
       option_of_yojson (value_for_key workspace_id_list_of_yojson "WorkspaceIds") _list path;
   }
    : describe_workspaces_connection_status_request)

let user_name_of_yojson = string_of_yojson
let ip_address_of_yojson = string_of_yojson
let ipv6_address_of_yojson = string_of_yojson

let workspace_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "UPDATING" -> UPDATING
    | `String "SUSPENDED" -> SUSPENDED
    | `String "TERMINATED" -> TERMINATED
    | `String "TERMINATING" -> TERMINATING
    | `String "ADMIN_MAINTENANCE" -> ADMIN_MAINTENANCE
    | `String "MAINTENANCE" -> MAINTENANCE
    | `String "RESTORING" -> RESTORING
    | `String "REBUILDING" -> REBUILDING
    | `String "STARTING" -> STARTING
    | `String "REBOOTING" -> REBOOTING
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "IMPAIRED" -> IMPAIRED
    | `String "AVAILABLE" -> AVAILABLE
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkspaceState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceState")
     : workspace_state)
    : workspace_state)

let workspace_error_code_of_yojson = string_of_yojson
let computer_name_of_yojson = string_of_yojson
let volume_encryption_key_of_yojson = string_of_yojson
let workspace_name_of_yojson = string_of_yojson

let modification_resource_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROTOCOL" -> PROTOCOL
    | `String "COMPUTE_TYPE" -> COMPUTE_TYPE
    | `String "USER_VOLUME" -> USER_VOLUME
    | `String "ROOT_VOLUME" -> ROOT_VOLUME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ModificationResourceEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ModificationResourceEnum")
     : modification_resource_enum)
    : modification_resource_enum)

let modification_state_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_INITIATED" -> UPDATE_INITIATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ModificationStateEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ModificationStateEnum")
     : modification_state_enum)
    : modification_state_enum)

let modification_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key modification_state_enum_of_yojson "State") _list path;
     resource =
       option_of_yojson (value_for_key modification_resource_enum_of_yojson "Resource") _list path;
   }
    : modification_state)

let modification_state_list_of_yojson tree path =
  list_of_yojson modification_state_of_yojson tree path

let region_of_yojson = string_of_yojson

let standby_workspace_relationship_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDBY" -> STANDBY
    | `String "PRIMARY" -> PRIMARY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StandbyWorkspaceRelationshipType" value)
    | _ -> raise (deserialize_wrong_type_error path "StandbyWorkspaceRelationshipType")
     : standby_workspace_relationship_type)
    : standby_workspace_relationship_type)

let related_workspace_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key standby_workspace_relationship_type_of_yojson "Type")
         _list path;
     state = option_of_yojson (value_for_key workspace_state_of_yojson "State") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "Region") _list path;
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
   }
    : related_workspace_properties)

let related_workspaces_of_yojson tree path =
  list_of_yojson related_workspace_properties_of_yojson tree path

let data_replication_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recovery_snapshot_time =
       option_of_yojson (value_for_key timestamp_of_yojson "RecoverySnapshotTime") _list path;
     data_replication =
       option_of_yojson (value_for_key data_replication_of_yojson "DataReplication") _list path;
   }
    : data_replication_settings)

let standby_workspaces_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recovery_snapshot_time =
       option_of_yojson (value_for_key timestamp_of_yojson "RecoverySnapshotTime") _list path;
     data_replication =
       option_of_yojson (value_for_key data_replication_of_yojson "DataReplication") _list path;
     standby_workspace_id =
       option_of_yojson (value_for_key workspace_id_of_yojson "StandbyWorkspaceId") _list path;
   }
    : standby_workspaces_properties)

let standby_workspaces_properties_list_of_yojson tree path =
  list_of_yojson standby_workspaces_properties_of_yojson tree path

let workspace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     standby_workspaces_properties =
       option_of_yojson
         (value_for_key standby_workspaces_properties_list_of_yojson "StandbyWorkspacesProperties")
         _list path;
     data_replication_settings =
       option_of_yojson
         (value_for_key data_replication_settings_of_yojson "DataReplicationSettings")
         _list path;
     related_workspaces =
       option_of_yojson (value_for_key related_workspaces_of_yojson "RelatedWorkspaces") _list path;
     modification_states =
       option_of_yojson
         (value_for_key modification_state_list_of_yojson "ModificationStates")
         _list path;
     workspace_properties =
       option_of_yojson
         (value_for_key workspace_properties_of_yojson "WorkspaceProperties")
         _list path;
     workspace_name =
       option_of_yojson (value_for_key workspace_name_of_yojson "WorkspaceName") _list path;
     root_volume_encryption_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "RootVolumeEncryptionEnabled")
         _list path;
     user_volume_encryption_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UserVolumeEncryptionEnabled")
         _list path;
     volume_encryption_key =
       option_of_yojson
         (value_for_key volume_encryption_key_of_yojson "VolumeEncryptionKey")
         _list path;
     computer_name =
       option_of_yojson (value_for_key computer_name_of_yojson "ComputerName") _list path;
     error_code =
       option_of_yojson (value_for_key workspace_error_code_of_yojson "ErrorCode") _list path;
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path;
     state = option_of_yojson (value_for_key workspace_state_of_yojson "State") _list path;
     ipv6_address = option_of_yojson (value_for_key ipv6_address_of_yojson "Ipv6Address") _list path;
     ip_address = option_of_yojson (value_for_key ip_address_of_yojson "IpAddress") _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
   }
    : workspace)

let workspace_list_of_yojson tree path = list_of_yojson workspace_of_yojson tree path

let describe_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     workspaces = option_of_yojson (value_for_key workspace_list_of_yojson "Workspaces") _list path;
   }
    : describe_workspaces_result)

let describe_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_name =
       option_of_yojson (value_for_key workspace_name_of_yojson "WorkspaceName") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     workspace_ids =
       option_of_yojson (value_for_key workspace_id_list_of_yojson "WorkspaceIds") _list path;
   }
    : describe_workspaces_request)

let operating_system_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINUX" -> LINUX
    | `String "WINDOWS" -> WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperatingSystemType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperatingSystemType")
     : operating_system_type)
    : operating_system_type)

let operating_system_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = option_of_yojson (value_for_key operating_system_type_of_yojson "Type") _list path }
    : operating_system)

let workspace_image_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "PENDING" -> PENDING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkspaceImageState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceImageState")
     : workspace_image_state)
    : workspace_image_state)

let workspace_image_required_tenancy_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEDICATED" -> DEDICATED
    | `String "DEFAULT" -> DEFAULT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspaceImageRequiredTenancy" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceImageRequiredTenancy")
     : workspace_image_required_tenancy)
    : workspace_image_required_tenancy)

let workspace_image_error_code_of_yojson = string_of_yojson

let update_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key update_description_of_yojson "Description") _list path;
     update_available =
       option_of_yojson (value_for_key boolean_object_of_yojson "UpdateAvailable") _list path;
   }
    : update_result)

let workspace_image_error_detail_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "RestrictedDriveLetterInUse" -> RESTRICTED_DRIVE_LETTER
    | `String "MemoryIntegrityIncompatibility" -> INCOMPATIBLE_MEMORY_INTEGRITY
    | `String "ProtocolOSIncompatibility" -> INCOMPATIBLE_PROTOCOL
    | `String "InsufficientRearmCount" -> INSUFFICIENT_REARM_COUNT
    | `String "UnsupportedOsUpgrade" -> UNSUPPORTED_OS_UPGRADE
    | `String "StagedAppxPackage" -> STAGED_APPX_PACKAGE
    | `String "MultipleUserProfiles" -> MULTIPLE_USER_PROFILES
    | `String "UnsupportedSecurityProtocol" -> UNSUPPORTED_SECURITY_PROTOCOL
    | `String "AmazonSsmAgentEnabled" -> AMAZON_SSM_AGENT_ENABLED
    | `String "WindowsModulesInstallerDisabled" -> WINDOWS_MODULES_INSTALLER_DISABLED
    | `String "RemoteDesktopServicesDisabled" -> REMOTE_DESKTOP_SERVICES_DISABLED
    | `String "InvalidIp" -> INVALID_IP
    | `String "DomainAccountServicesFound" -> DOMAIN_ACCOUNT_SERVICES_FOUND
    | `String "EnvironmentVariablesPathMissingEntries" -> ENVIRONMENT_VARIABLES_PATH_MISSING_ENTRIES
    | `String "InsufficientDiskSpace" -> INSUFFICIENT_DISK_SPACE
    | `String "UserProfileMissing" -> USER_PROFILE_MISSING
    | `String "SysPrepFileMissing" -> SYSPREP_FILE_MISSING
    | `String "WindowsUpdatesRequired" -> WINDOWS_UPDATES_REQUIRED
    | `String "AdditionalDrivesPresent" -> ADDITIONAL_DRIVES_PRESENT
    | `String "ReservedStorageInUse" -> RESERVED_STORAGE_IN_USE
    | `String "AppXPackagesInstalled" -> APPX_PACKAGES_INSTALLED
    | `String "UnknownError" -> UNKNOWN_ERROR
    | `String "UEFINotSupported" -> UEFI_NOT_SUPPORTED
    | `String "AntiVirusInstalled" -> ANTI_VIRUS_INSTALLED
    | `String "InPlaceUpgrade" -> IN_PLACE_UPGRADE
    | `String "ZeroRearmCount" -> ZERO_REARM_COUNT
    | `String "Requires64BitOS" -> SIXTY_FOUR_BIT_OS
    | `String "MultipleBootPartition" -> MULTIPLE_BOOT_PARTITION
    | `String "RealTimeUniversalDisabled" -> REALTIME_UNIVERSAL_DISABLED
    | `String "AutoLogonEnabled" -> AUTO_LOGON_ENABLED
    | `String "PendingReboot" -> PENDING_REBOOT
    | `String "IncompatiblePartitioning" -> INCOMPATIBLE_PARTITIONING
    | `String "DiskSizeExceeded" -> DISK_SIZE_EXCEEDED
    | `String "VMWareToolsInstalled" -> VMWARE_TOOLS_INSTALLED
    | `String "FirewallEnabled" -> FIREWALL_ENABLED
    | `String "AzureDomainJoined" -> AZURE_DOMAIN_JOINED
    | `String "DomainJoined" -> DOMAIN_JOINED
    | `String "OSNotSupported" -> OS_NOT_SUPPORTED
    | `String "AdditionalDrivesAttached" -> ADDITIONAL_DRIVES_ATTACHED
    | `String "DiskFreeSpace" -> DISK_FREE_SPACE
    | `String "DHCPDisabled" -> DHCP_DISABLED
    | `String "WorkspacesBYOLAccountDisabled" -> WORKSPACES_BYOL_ACCOUNT_DISABLED
    | `String "WorkspacesBYOLAccountNotFound" -> WORKSPACES_BYOL_ACCOUNT_NOT_FOUND
    | `String "AutoMountDisabled" -> AUTO_MOUNT_DISABLED
    | `String "WindowsUpdatesEnabled" -> WINDOWS_UPDATES_ENABLED
    | `String "PCoIPAgentInstalled" -> PCOIP_AGENT_INSTALLED
    | `String "OfficeInstalled" -> OFFICE_INSTALLED
    | `String "OutdatedPowershellVersion" -> OUTDATED_POWERSHELL_VERSION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspaceImageErrorDetailCode" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceImageErrorDetailCode")
     : workspace_image_error_detail_code)
    : workspace_image_error_detail_code)

let error_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson
         (value_for_key workspace_image_error_detail_code_of_yojson "ErrorCode")
         _list path;
   }
    : error_details)

let error_details_list_of_yojson tree path = list_of_yojson error_details_of_yojson tree path

let workspace_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_details =
       option_of_yojson (value_for_key error_details_list_of_yojson "ErrorDetails") _list path;
     updates = option_of_yojson (value_for_key update_result_of_yojson "Updates") _list path;
     owner_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "OwnerAccountId") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key workspace_image_error_code_of_yojson "ErrorCode") _list path;
     required_tenancy =
       option_of_yojson
         (value_for_key workspace_image_required_tenancy_of_yojson "RequiredTenancy")
         _list path;
     state = option_of_yojson (value_for_key workspace_image_state_of_yojson "State") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     description =
       option_of_yojson
         (value_for_key workspace_image_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key workspace_image_name_of_yojson "Name") _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
   }
    : workspace_image)

let workspace_image_list_of_yojson tree path = list_of_yojson workspace_image_of_yojson tree path

let describe_workspace_images_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     images = option_of_yojson (value_for_key workspace_image_list_of_yojson "Images") _list path;
   }
    : describe_workspace_images_result)

let workspace_image_id_list_of_yojson tree path =
  list_of_yojson workspace_image_id_of_yojson tree path

let image_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHARED" -> SHARED
    | `String "OWNED" -> OWNED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageType")
     : image_type)
    : image_type)

let describe_workspace_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     image_type = option_of_yojson (value_for_key image_type_of_yojson "ImageType") _list path;
     image_ids =
       option_of_yojson (value_for_key workspace_image_id_list_of_yojson "ImageIds") _list path;
   }
    : describe_workspace_images_request)

let image_permission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "SharedAccountId") _list path;
   }
    : image_permission)

let image_permissions_of_yojson tree path = list_of_yojson image_permission_of_yojson tree path

let describe_workspace_image_permissions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     image_permissions =
       option_of_yojson (value_for_key image_permissions_of_yojson "ImagePermissions") _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
   }
    : describe_workspace_image_permissions_result)

let describe_workspace_image_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     image_id = value_for_key workspace_image_id_of_yojson "ImageId" _list path;
   }
    : describe_workspace_image_permissions_request)

let alias_of_yojson = string_of_yojson
let directory_name_of_yojson = string_of_yojson
let registration_code_of_yojson = string_of_yojson
let dns_ip_addresses_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path
let dns_ipv6_addresses_of_yojson tree path = list_of_yojson ipv6_address_of_yojson tree path

let workspace_directory_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_IAM_IDENTITY_CENTER" -> AWS_IAM_IDENTITY_CENTER
    | `String "CUSTOMER_MANAGED" -> CUSTOMER_MANAGED
    | `String "AD_CONNECTOR" -> AD_CONNECTOR
    | `String "SIMPLE_AD" -> SIMPLE_AD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspaceDirectoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceDirectoryType")
     : workspace_directory_type)
    : workspace_directory_type)

let default_workspace_creation_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_iam_role_arn =
       option_of_yojson (value_for_key ar_n_of_yojson "InstanceIamRoleArn") _list path;
     enable_maintenance_mode =
       option_of_yojson (value_for_key boolean_object_of_yojson "EnableMaintenanceMode") _list path;
     user_enabled_as_local_administrator =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UserEnabledAsLocalAdministrator")
         _list path;
     custom_security_group_id =
       option_of_yojson
         (value_for_key security_group_id_of_yojson "CustomSecurityGroupId")
         _list path;
     default_ou = option_of_yojson (value_for_key default_ou_of_yojson "DefaultOu") _list path;
     enable_internet_access =
       option_of_yojson (value_for_key boolean_object_of_yojson "EnableInternetAccess") _list path;
   }
    : default_workspace_creation_properties)

let idc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn = option_of_yojson (value_for_key ar_n_of_yojson "ApplicationArn") _list path;
     instance_arn = option_of_yojson (value_for_key ar_n_of_yojson "InstanceArn") _list path;
   }
    : idc_config)

let workspace_directory_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     streaming_properties =
       option_of_yojson
         (value_for_key streaming_properties_of_yojson "StreamingProperties")
         _list path;
     active_directory_config =
       option_of_yojson
         (value_for_key active_directory_config_of_yojson "ActiveDirectoryConfig")
         _list path;
     idc_config = option_of_yojson (value_for_key idc_config_of_yojson "IDCConfig") _list path;
     workspace_type =
       option_of_yojson (value_for_key workspace_type_of_yojson "WorkspaceType") _list path;
     user_identity_type =
       option_of_yojson (value_for_key user_identity_type_of_yojson "UserIdentityType") _list path;
     workspace_directory_description =
       option_of_yojson
         (value_for_key workspace_directory_description_of_yojson "WorkspaceDirectoryDescription")
         _list path;
     workspace_directory_name =
       option_of_yojson
         (value_for_key workspace_directory_name_of_yojson "WorkspaceDirectoryName")
         _list path;
     microsoft_entra_config =
       option_of_yojson
         (value_for_key microsoft_entra_config_of_yojson "MicrosoftEntraConfig")
         _list path;
     endpoint_encryption_mode =
       option_of_yojson
         (value_for_key endpoint_encryption_mode_of_yojson "EndpointEncryptionMode")
         _list path;
     certificate_based_auth_properties =
       option_of_yojson
         (value_for_key certificate_based_auth_properties_of_yojson "CertificateBasedAuthProperties")
         _list path;
     saml_properties =
       option_of_yojson (value_for_key saml_properties_of_yojson "SamlProperties") _list path;
     selfservice_permissions =
       option_of_yojson
         (value_for_key selfservice_permissions_of_yojson "SelfservicePermissions")
         _list path;
     tenancy = option_of_yojson (value_for_key tenancy_of_yojson "Tenancy") _list path;
     workspace_access_properties =
       option_of_yojson
         (value_for_key workspace_access_properties_of_yojson "WorkspaceAccessProperties")
         _list path;
     ip_group_ids =
       option_of_yojson (value_for_key ip_group_id_list_of_yojson "ipGroupIds") _list path;
     workspace_creation_properties =
       option_of_yojson
         (value_for_key default_workspace_creation_properties_of_yojson
            "WorkspaceCreationProperties")
         _list path;
     state = option_of_yojson (value_for_key workspace_directory_state_of_yojson "State") _list path;
     workspace_security_group_id =
       option_of_yojson
         (value_for_key security_group_id_of_yojson "WorkspaceSecurityGroupId")
         _list path;
     directory_type =
       option_of_yojson
         (value_for_key workspace_directory_type_of_yojson "DirectoryType")
         _list path;
     iam_role_id = option_of_yojson (value_for_key ar_n_of_yojson "IamRoleId") _list path;
     customer_user_name =
       option_of_yojson (value_for_key user_name_of_yojson "CustomerUserName") _list path;
     dns_ipv6_addresses =
       option_of_yojson (value_for_key dns_ipv6_addresses_of_yojson "DnsIpv6Addresses") _list path;
     dns_ip_addresses =
       option_of_yojson (value_for_key dns_ip_addresses_of_yojson "DnsIpAddresses") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     registration_code =
       option_of_yojson (value_for_key registration_code_of_yojson "RegistrationCode") _list path;
     directory_name =
       option_of_yojson (value_for_key directory_name_of_yojson "DirectoryName") _list path;
     alias = option_of_yojson (value_for_key alias_of_yojson "Alias") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : workspace_directory)

let directory_list_of_yojson tree path = list_of_yojson workspace_directory_of_yojson tree path

let describe_workspace_directories_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     directories =
       option_of_yojson (value_for_key directory_list_of_yojson "Directories") _list path;
   }
    : describe_workspace_directories_result)

let directory_id_list_of_yojson tree path = list_of_yojson directory_id_of_yojson tree path

let workspace_directory_name_list_of_yojson tree path =
  list_of_yojson workspace_directory_name_of_yojson tree path

let describe_workspace_directories_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "WORKSPACE_TYPE" -> WORKSPACE_TYPE
    | `String "USER_IDENTITY_TYPE" -> USER_IDENTITY_TYPE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DescribeWorkspaceDirectoriesFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "DescribeWorkspaceDirectoriesFilterName")
     : describe_workspace_directories_filter_name)
    : describe_workspace_directories_filter_name)

let describe_workspace_directories_filter_value_of_yojson = string_of_yojson

let describe_workspace_directories_filter_values_of_yojson tree path =
  list_of_yojson describe_workspace_directories_filter_value_of_yojson tree path

let describe_workspace_directories_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       value_for_key describe_workspace_directories_filter_values_of_yojson "Values" _list path;
     name = value_for_key describe_workspace_directories_filter_name_of_yojson "Name" _list path;
   }
    : describe_workspace_directories_filter)

let describe_workspace_directories_filter_list_of_yojson tree path =
  list_of_yojson describe_workspace_directories_filter_of_yojson tree path

let describe_workspace_directories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key describe_workspace_directories_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     workspace_directory_names =
       option_of_yojson
         (value_for_key workspace_directory_name_list_of_yojson "WorkspaceDirectoryNames")
         _list path;
     directory_ids =
       option_of_yojson (value_for_key directory_id_list_of_yojson "DirectoryIds") _list path;
   }
    : describe_workspace_directories_request)

let bundle_owner_of_yojson = string_of_yojson

let root_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ capacity = value_for_key non_empty_string_of_yojson "Capacity" _list path } : root_storage)

let user_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ capacity = value_for_key non_empty_string_of_yojson "Capacity" _list path } : user_storage)

let compute_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key compute_of_yojson "Name") _list path } : compute_type)

let workspace_bundle_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "PENDING" -> PENDING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkspaceBundleState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkspaceBundleState")
     : workspace_bundle_state)
    : workspace_bundle_state)

let bundle_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDBY" -> STANDBY
    | `String "REGULAR" -> REGULAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "BundleType" value)
    | _ -> raise (deserialize_wrong_type_error path "BundleType")
     : bundle_type)
    : bundle_type)

let workspace_bundle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bundle_type = option_of_yojson (value_for_key bundle_type_of_yojson "BundleType") _list path;
     state = option_of_yojson (value_for_key workspace_bundle_state_of_yojson "State") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     compute_type = option_of_yojson (value_for_key compute_type_of_yojson "ComputeType") _list path;
     user_storage = option_of_yojson (value_for_key user_storage_of_yojson "UserStorage") _list path;
     root_storage = option_of_yojson (value_for_key root_storage_of_yojson "RootStorage") _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     owner = option_of_yojson (value_for_key bundle_owner_of_yojson "Owner") _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "Name") _list path;
     bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path;
   }
    : workspace_bundle)

let bundle_list_of_yojson tree path = list_of_yojson workspace_bundle_of_yojson tree path

let describe_workspace_bundles_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     bundles = option_of_yojson (value_for_key bundle_list_of_yojson "Bundles") _list path;
   }
    : describe_workspace_bundles_result)

let bundle_id_list_of_yojson tree path = list_of_yojson bundle_id_of_yojson tree path

let describe_workspace_bundles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     owner = option_of_yojson (value_for_key bundle_owner_of_yojson "Owner") _list path;
     bundle_ids = option_of_yojson (value_for_key bundle_id_list_of_yojson "BundleIds") _list path;
   }
    : describe_workspace_bundles_request)

let workspace_resource_association_list_of_yojson tree path =
  list_of_yojson workspace_resource_association_of_yojson tree path

let describe_workspace_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key workspace_resource_association_list_of_yojson "Associations")
         _list path;
   }
    : describe_workspace_associations_result)

let work_space_associated_resource_type_list_of_yojson tree path =
  list_of_yojson work_space_associated_resource_type_of_yojson tree path

let describe_workspace_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_resource_types =
       value_for_key work_space_associated_resource_type_list_of_yojson "AssociatedResourceTypes"
         _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
   }
    : describe_workspace_associations_request)

let describe_tags_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path }
    : describe_tags_result)

let describe_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_id = value_for_key non_empty_string_of_yojson "ResourceId" _list path }
    : describe_tags_request)

let ip_group_name_of_yojson = string_of_yojson
let ip_group_desc_of_yojson = string_of_yojson

let workspaces_ip_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_rules = option_of_yojson (value_for_key ip_rule_list_of_yojson "userRules") _list path;
     group_desc = option_of_yojson (value_for_key ip_group_desc_of_yojson "groupDesc") _list path;
     group_name = option_of_yojson (value_for_key ip_group_name_of_yojson "groupName") _list path;
     group_id = option_of_yojson (value_for_key ip_group_id_of_yojson "groupId") _list path;
   }
    : workspaces_ip_group)

let workspaces_ip_groups_list_of_yojson tree path =
  list_of_yojson workspaces_ip_group_of_yojson tree path

let describe_ip_groups_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     result_ =
       option_of_yojson (value_for_key workspaces_ip_groups_list_of_yojson "Result") _list path;
   }
    : describe_ip_groups_result)

let describe_ip_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     group_ids = option_of_yojson (value_for_key ip_group_id_list_of_yojson "GroupIds") _list path;
   }
    : describe_ip_groups_request)

let image_associated_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION" -> APPLICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImageAssociatedResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageAssociatedResourceType")
     : image_associated_resource_type)
    : image_associated_resource_type)

let image_resource_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_reason =
       option_of_yojson (value_for_key association_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key association_state_of_yojson "State") _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     associated_resource_type =
       option_of_yojson
         (value_for_key image_associated_resource_type_of_yojson "AssociatedResourceType")
         _list path;
     associated_resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "AssociatedResourceId") _list path;
   }
    : image_resource_association)

let image_resource_association_list_of_yojson tree path =
  list_of_yojson image_resource_association_of_yojson tree path

let describe_image_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key image_resource_association_list_of_yojson "Associations")
         _list path;
   }
    : describe_image_associations_result)

let image_associated_resource_type_list_of_yojson tree path =
  list_of_yojson image_associated_resource_type_of_yojson tree path

let describe_image_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_resource_types =
       value_for_key image_associated_resource_type_list_of_yojson "AssociatedResourceTypes" _list
         path;
     image_id = value_for_key workspace_image_id_of_yojson "ImageId" _list path;
   }
    : describe_image_associations_request)

let workflow_state_message_of_yojson = string_of_yojson
let percentage_of_yojson = int_of_yojson
let error_code_of_yojson = string_of_yojson
let image_error_message_of_yojson = string_of_yojson

let custom_workspace_image_import_error_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key image_error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
   }
    : custom_workspace_image_import_error_details)

let custom_workspace_image_import_error_details_list_of_yojson tree path =
  list_of_yojson custom_workspace_image_import_error_details_of_yojson tree path

let describe_custom_workspace_image_import_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_details =
       option_of_yojson
         (value_for_key custom_workspace_image_import_error_details_list_of_yojson "ErrorDetails")
         _list path;
     image_builder_instance_id =
       option_of_yojson
         (value_for_key non_empty_string_of_yojson "ImageBuilderInstanceId")
         _list path;
     image_source =
       option_of_yojson (value_for_key image_source_identifier_of_yojson "ImageSource") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     progress_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "ProgressPercentage") _list path;
     state_message =
       option_of_yojson (value_for_key workflow_state_message_of_yojson "StateMessage") _list path;
     state =
       option_of_yojson
         (value_for_key custom_workspace_image_import_state_of_yojson "State")
         _list path;
     infrastructure_configuration_arn =
       option_of_yojson
         (value_for_key infrastructure_configuration_arn_of_yojson "InfrastructureConfigurationArn")
         _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
   }
    : describe_custom_workspace_image_import_result)

let describe_custom_workspace_image_import_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image_id = value_for_key workspace_image_id_of_yojson "ImageId" _list path }
    : describe_custom_workspace_image_import_request)

let connection_alias_permissions_of_yojson tree path =
  list_of_yojson connection_alias_permission_of_yojson tree path

let describe_connection_alias_permissions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     connection_alias_permissions =
       option_of_yojson
         (value_for_key connection_alias_permissions_of_yojson "ConnectionAliasPermissions")
         _list path;
     alias_id = option_of_yojson (value_for_key connection_alias_id_of_yojson "AliasId") _list path;
   }
    : describe_connection_alias_permissions_result)

let describe_connection_alias_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     alias_id = value_for_key connection_alias_id_of_yojson "AliasId" _list path;
   }
    : describe_connection_alias_permissions_request)

let connection_string_of_yojson = string_of_yojson

let connection_alias_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionAliasState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionAliasState")
     : connection_alias_state)
    : connection_alias_state)

let association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_DISASSOCIATION" -> PENDING_DISASSOCIATION
    | `String "PENDING_ASSOCIATION" -> PENDING_ASSOCIATION
    | `String "ASSOCIATED_WITH_SHARED_ACCOUNT" -> ASSOCIATED_WITH_SHARED_ACCOUNT
    | `String "ASSOCIATED_WITH_OWNER_ACCOUNT" -> ASSOCIATED_WITH_OWNER_ACCOUNT
    | `String "NOT_ASSOCIATED" -> NOT_ASSOCIATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationStatus")
     : association_status)
    : association_status)

let connection_identifier_of_yojson = string_of_yojson

let connection_alias_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_identifier =
       option_of_yojson
         (value_for_key connection_identifier_of_yojson "ConnectionIdentifier")
         _list path;
     resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ResourceId") _list path;
     associated_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "AssociatedAccountId") _list path;
     association_status =
       option_of_yojson (value_for_key association_status_of_yojson "AssociationStatus") _list path;
   }
    : connection_alias_association)

let connection_alias_association_list_of_yojson tree path =
  list_of_yojson connection_alias_association_of_yojson tree path

let connection_alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key connection_alias_association_list_of_yojson "Associations")
         _list path;
     owner_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "OwnerAccountId") _list path;
     state = option_of_yojson (value_for_key connection_alias_state_of_yojson "State") _list path;
     alias_id = option_of_yojson (value_for_key connection_alias_id_of_yojson "AliasId") _list path;
     connection_string =
       option_of_yojson (value_for_key connection_string_of_yojson "ConnectionString") _list path;
   }
    : connection_alias)

let connection_alias_list_of_yojson tree path = list_of_yojson connection_alias_of_yojson tree path

let describe_connection_aliases_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     connection_aliases =
       option_of_yojson
         (value_for_key connection_alias_list_of_yojson "ConnectionAliases")
         _list path;
   }
    : describe_connection_aliases_result)

let connection_alias_id_list_of_yojson tree path =
  list_of_yojson connection_alias_id_of_yojson tree path

let describe_connection_aliases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
     resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ResourceId") _list path;
     alias_ids =
       option_of_yojson (value_for_key connection_alias_id_list_of_yojson "AliasIds") _list path;
   }
    : describe_connection_aliases_request)

let connect_client_add_in_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ur_l = option_of_yojson (value_for_key add_in_url_of_yojson "URL") _list path;
     name = option_of_yojson (value_for_key add_in_name_of_yojson "Name") _list path;
     resource_id = option_of_yojson (value_for_key directory_id_of_yojson "ResourceId") _list path;
     add_in_id = option_of_yojson (value_for_key amazon_uuid_of_yojson "AddInId") _list path;
   }
    : connect_client_add_in)

let connect_client_add_in_list_of_yojson tree path =
  list_of_yojson connect_client_add_in_of_yojson tree path

let describe_connect_client_add_ins_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     add_ins =
       option_of_yojson (value_for_key connect_client_add_in_list_of_yojson "AddIns") _list path;
   }
    : describe_connect_client_add_ins_result)

let describe_connect_client_add_ins_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : describe_connect_client_add_ins_request)

let client_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_properties =
       option_of_yojson (value_for_key client_properties_of_yojson "ClientProperties") _list path;
     resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "ResourceId") _list path;
   }
    : client_properties_result)

let client_properties_list_of_yojson tree path =
  list_of_yojson client_properties_result_of_yojson tree path

let describe_client_properties_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_properties_list =
       option_of_yojson
         (value_for_key client_properties_list_of_yojson "ClientPropertiesList")
         _list path;
   }
    : describe_client_properties_result)

let resource_id_list_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let describe_client_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ids = value_for_key resource_id_list_of_yojson "ResourceIds" _list path }
    : describe_client_properties_request)

let describe_client_branding_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_type_web =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeWeb")
         _list path;
     device_type_linux =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeLinux")
         _list path;
     device_type_ios =
       option_of_yojson
         (value_for_key ios_client_branding_attributes_of_yojson "DeviceTypeIos")
         _list path;
     device_type_android =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeAndroid")
         _list path;
     device_type_osx =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeOsx")
         _list path;
     device_type_windows =
       option_of_yojson
         (value_for_key default_client_branding_attributes_of_yojson "DeviceTypeWindows")
         _list path;
   }
    : describe_client_branding_result)

let describe_client_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path }
    : describe_client_branding_request)

let bundle_associated_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION" -> APPLICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BundleAssociatedResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "BundleAssociatedResourceType")
     : bundle_associated_resource_type)
    : bundle_associated_resource_type)

let bundle_resource_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_reason =
       option_of_yojson (value_for_key association_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key association_state_of_yojson "State") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path;
     associated_resource_type =
       option_of_yojson
         (value_for_key bundle_associated_resource_type_of_yojson "AssociatedResourceType")
         _list path;
     associated_resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "AssociatedResourceId") _list path;
   }
    : bundle_resource_association)

let bundle_resource_association_list_of_yojson tree path =
  list_of_yojson bundle_resource_association_of_yojson tree path

let describe_bundle_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key bundle_resource_association_list_of_yojson "Associations")
         _list path;
   }
    : describe_bundle_associations_result)

let bundle_associated_resource_type_list_of_yojson tree path =
  list_of_yojson bundle_associated_resource_type_of_yojson tree path

let describe_bundle_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_resource_types =
       value_for_key bundle_associated_resource_type_list_of_yojson "AssociatedResourceTypes" _list
         path;
     bundle_id = value_for_key bundle_id_of_yojson "BundleId" _list path;
   }
    : describe_bundle_associations_request)

let work_space_application_license_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNLICENSED" -> UNLICENSED
    | `String "LICENSED" -> LICENSED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkSpaceApplicationLicenseType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkSpaceApplicationLicenseType")
     : work_space_application_license_type)
    : work_space_application_license_type)

let work_space_application_owner_of_yojson = string_of_yojson

let work_space_application_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNINSTALL_ONLY" -> UNINSTALL_ONLY
    | `String "AVAILABLE" -> AVAILABLE
    | `String "ERROR" -> ERROR
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkSpaceApplicationState" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkSpaceApplicationState")
     : work_space_application_state)
    : work_space_application_state)

let compute_list_of_yojson tree path = list_of_yojson compute_of_yojson tree path

let operating_system_name_list_of_yojson tree path =
  list_of_yojson operating_system_name_of_yojson tree path

let work_space_application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_operating_system_names =
       option_of_yojson
         (value_for_key operating_system_name_list_of_yojson "SupportedOperatingSystemNames")
         _list path;
     supported_compute_type_names =
       option_of_yojson
         (value_for_key compute_list_of_yojson "SupportedComputeTypeNames")
         _list path;
     state =
       option_of_yojson (value_for_key work_space_application_state_of_yojson "State") _list path;
     owner =
       option_of_yojson (value_for_key work_space_application_owner_of_yojson "Owner") _list path;
     name = option_of_yojson (value_for_key non_empty_string_of_yojson "Name") _list path;
     license_type =
       option_of_yojson
         (value_for_key work_space_application_license_type_of_yojson "LicenseType")
         _list path;
     description = option_of_yojson (value_for_key string2048_of_yojson "Description") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     application_id =
       option_of_yojson
         (value_for_key work_space_application_id_of_yojson "ApplicationId")
         _list path;
   }
    : work_space_application)

let work_space_application_list_of_yojson tree path =
  list_of_yojson work_space_application_of_yojson tree path

let describe_applications_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     applications =
       option_of_yojson
         (value_for_key work_space_application_list_of_yojson "Applications")
         _list path;
   }
    : describe_applications_result)

let work_space_application_id_list_of_yojson tree path =
  list_of_yojson work_space_application_id_of_yojson tree path

let describe_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
     owner =
       option_of_yojson (value_for_key work_space_application_owner_of_yojson "Owner") _list path;
     operating_system_names =
       option_of_yojson
         (value_for_key operating_system_name_list_of_yojson "OperatingSystemNames")
         _list path;
     license_type =
       option_of_yojson
         (value_for_key work_space_application_license_type_of_yojson "LicenseType")
         _list path;
     compute_type_names =
       option_of_yojson (value_for_key compute_list_of_yojson "ComputeTypeNames") _list path;
     application_ids =
       option_of_yojson
         (value_for_key work_space_application_id_list_of_yojson "ApplicationIds")
         _list path;
   }
    : describe_applications_request)

let application_associated_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMAGE" -> IMAGE
    | `String "BUNDLE" -> BUNDLE
    | `String "WORKSPACE" -> WORKSPACE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApplicationAssociatedResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationAssociatedResourceType")
     : application_associated_resource_type)
    : application_associated_resource_type)

let application_resource_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_reason =
       option_of_yojson (value_for_key association_state_reason_of_yojson "StateReason") _list path;
     state = option_of_yojson (value_for_key association_state_of_yojson "State") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     associated_resource_type =
       option_of_yojson
         (value_for_key application_associated_resource_type_of_yojson "AssociatedResourceType")
         _list path;
     associated_resource_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "AssociatedResourceId") _list path;
     application_id =
       option_of_yojson
         (value_for_key work_space_application_id_of_yojson "ApplicationId")
         _list path;
   }
    : application_resource_association)

let application_resource_association_list_of_yojson tree path =
  list_of_yojson application_resource_association_of_yojson tree path

let describe_application_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     associations =
       option_of_yojson
         (value_for_key application_resource_association_list_of_yojson "Associations")
         _list path;
   }
    : describe_application_associations_result)

let application_associated_resource_type_list_of_yojson tree path =
  list_of_yojson application_associated_resource_type_of_yojson tree path

let describe_application_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_resource_types =
       value_for_key application_associated_resource_type_list_of_yojson "AssociatedResourceTypes"
         _list path;
     application_id = value_for_key work_space_application_id_of_yojson "ApplicationId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key limit_of_yojson "MaxResults") _list path;
   }
    : describe_application_associations_request)

let dedicated_tenancy_modification_state_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "PENDING" -> PENDING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DedicatedTenancyModificationStateEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "DedicatedTenancyModificationStateEnum")
     : dedicated_tenancy_modification_state_enum)
    : dedicated_tenancy_modification_state_enum)

let dedicated_tenancy_support_result_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DedicatedTenancySupportResultEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "DedicatedTenancySupportResultEnum")
     : dedicated_tenancy_support_result_enum)
    : dedicated_tenancy_support_result_enum)

let account_modification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key workspace_error_code_of_yojson "ErrorCode") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     dedicated_tenancy_management_cidr_range =
       option_of_yojson
         (value_for_key dedicated_tenancy_management_cidr_range_of_yojson
            "DedicatedTenancyManagementCidrRange")
         _list path;
     dedicated_tenancy_support =
       option_of_yojson
         (value_for_key dedicated_tenancy_support_result_enum_of_yojson "DedicatedTenancySupport")
         _list path;
     modification_state =
       option_of_yojson
         (value_for_key dedicated_tenancy_modification_state_enum_of_yojson "ModificationState")
         _list path;
   }
    : account_modification)

let account_modification_list_of_yojson tree path =
  list_of_yojson account_modification_of_yojson tree path

let describe_account_modifications_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     account_modifications =
       option_of_yojson
         (value_for_key account_modification_list_of_yojson "AccountModifications")
         _list path;
   }
    : describe_account_modifications_result)

let describe_account_modifications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : describe_account_modifications_request)

let dedicated_tenancy_account_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TARGET_ACCOUNT" -> TARGET_ACCOUNT
    | `String "SOURCE_ACCOUNT" -> SOURCE_ACCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DedicatedTenancyAccountType" value)
    | _ -> raise (deserialize_wrong_type_error path "DedicatedTenancyAccountType")
     : dedicated_tenancy_account_type)
    : dedicated_tenancy_account_type)

let describe_account_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     dedicated_tenancy_account_type =
       option_of_yojson
         (value_for_key dedicated_tenancy_account_type_of_yojson "DedicatedTenancyAccountType")
         _list path;
     dedicated_tenancy_management_cidr_range =
       option_of_yojson
         (value_for_key dedicated_tenancy_management_cidr_range_of_yojson
            "DedicatedTenancyManagementCidrRange")
         _list path;
     dedicated_tenancy_support =
       option_of_yojson
         (value_for_key dedicated_tenancy_support_result_enum_of_yojson "DedicatedTenancySupport")
         _list path;
   }
    : describe_account_result)

let describe_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_workspace_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_workspace_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : deregister_workspace_directory_request)

let incompatible_applications_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let work_space_application_deployment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key workspace_resource_association_list_of_yojson "Associations")
         _list path;
   }
    : work_space_application_deployment)

let deploy_workspace_applications_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment =
       option_of_yojson
         (value_for_key work_space_application_deployment_of_yojson "Deployment")
         _list path;
   }
    : deploy_workspace_applications_result)

let deploy_workspace_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force = option_of_yojson (value_for_key boolean_object_of_yojson "Force") _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
   }
    : deploy_workspace_applications_request)

let delete_workspace_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_workspace_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image_id = value_for_key workspace_image_id_of_yojson "ImageId" _list path }
    : delete_workspace_image_request)

let delete_workspace_bundle_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_workspace_bundle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ bundle_id = option_of_yojson (value_for_key bundle_id_of_yojson "BundleId") _list path }
    : delete_workspace_bundle_request)

let delete_tags_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let delete_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_id = value_for_key non_empty_string_of_yojson "ResourceId" _list path;
   }
    : delete_tags_request)

let delete_ip_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_ip_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group_id = value_for_key ip_group_id_of_yojson "GroupId" _list path }
    : delete_ip_group_request)

let delete_connection_alias_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_connection_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_id = value_for_key connection_alias_id_of_yojson "AliasId" _list path }
    : delete_connection_alias_request)

let delete_connect_client_add_in_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_connect_client_add_in_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
     add_in_id = value_for_key amazon_uuid_of_yojson "AddInId" _list path;
   }
    : delete_connect_client_add_in_request)

let delete_client_branding_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let client_device_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DeviceTypeWeb" -> DEVICE_TYPE_WEB
    | `String "DeviceTypeLinux" -> DEVICE_TYPE_LINUX
    | `String "DeviceTypeIos" -> DEVICE_TYPE_IOS
    | `String "DeviceTypeAndroid" -> DEVICE_TYPE_ANDROID
    | `String "DeviceTypeOsx" -> DEVICE_TYPE_OSX
    | `String "DeviceTypeWindows" -> DEVICE_TYPE_WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClientDeviceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientDeviceType")
     : client_device_type)
    : client_device_type)

let client_device_type_list_of_yojson tree path =
  list_of_yojson client_device_type_of_yojson tree path

let delete_client_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     platforms = value_for_key client_device_type_list_of_yojson "Platforms" _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : delete_client_branding_request)

let delete_account_link_invitation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_link = option_of_yojson (value_for_key account_link_of_yojson "AccountLink") _list path;
   }
    : delete_account_link_invitation_result)

let delete_account_link_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     link_id = value_for_key link_id_of_yojson "LinkId" _list path;
   }
    : delete_account_link_invitation_request)

let create_workspaces_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspaces_pool =
       option_of_yojson (value_for_key workspaces_pool_of_yojson "WorkspacesPool") _list path;
   }
    : create_workspaces_pool_result)

let create_workspaces_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     running_mode =
       option_of_yojson (value_for_key pools_running_mode_of_yojson "RunningMode") _list path;
     timeout_settings =
       option_of_yojson (value_for_key timeout_settings_of_yojson "TimeoutSettings") _list path;
     application_settings =
       option_of_yojson
         (value_for_key application_settings_request_of_yojson "ApplicationSettings")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     capacity = value_for_key capacity_of_yojson "Capacity" _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     bundle_id = value_for_key bundle_id_of_yojson "BundleId" _list path;
     description = value_for_key update_description_of_yojson "Description" _list path;
     pool_name = value_for_key workspaces_pool_name_of_yojson "PoolName" _list path;
   }
    : create_workspaces_pool_request)

let workspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ipv6_address = option_of_yojson (value_for_key ipv6_address_of_yojson "Ipv6Address") _list path;
     workspace_name =
       option_of_yojson (value_for_key workspace_name_of_yojson "WorkspaceName") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     workspace_properties =
       option_of_yojson
         (value_for_key workspace_properties_of_yojson "WorkspaceProperties")
         _list path;
     root_volume_encryption_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "RootVolumeEncryptionEnabled")
         _list path;
     user_volume_encryption_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "UserVolumeEncryptionEnabled")
         _list path;
     volume_encryption_key =
       option_of_yojson
         (value_for_key volume_encryption_key_of_yojson "VolumeEncryptionKey")
         _list path;
     bundle_id = value_for_key bundle_id_of_yojson "BundleId" _list path;
     user_name = value_for_key user_name_of_yojson "UserName" _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
   }
    : workspace_request)

let failed_create_workspace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_type_of_yojson "ErrorCode") _list path;
     workspace_request =
       option_of_yojson (value_for_key workspace_request_of_yojson "WorkspaceRequest") _list path;
   }
    : failed_create_workspace_request)

let failed_create_workspace_requests_of_yojson tree path =
  list_of_yojson failed_create_workspace_request_of_yojson tree path

let create_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending_requests =
       option_of_yojson (value_for_key workspace_list_of_yojson "PendingRequests") _list path;
     failed_requests =
       option_of_yojson
         (value_for_key failed_create_workspace_requests_of_yojson "FailedRequests")
         _list path;
   }
    : create_workspaces_result)

let workspace_request_list_of_yojson tree path =
  list_of_yojson workspace_request_of_yojson tree path

let create_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ workspaces = value_for_key workspace_request_list_of_yojson "Workspaces" _list path }
    : create_workspaces_request)

let create_workspace_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account_id =
       option_of_yojson (value_for_key aws_account_of_yojson "OwnerAccountId") _list path;
     created = option_of_yojson (value_for_key timestamp_of_yojson "Created") _list path;
     required_tenancy =
       option_of_yojson
         (value_for_key workspace_image_required_tenancy_of_yojson "RequiredTenancy")
         _list path;
     state = option_of_yojson (value_for_key workspace_image_state_of_yojson "State") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "OperatingSystem") _list path;
     description =
       option_of_yojson
         (value_for_key workspace_image_description_of_yojson "Description")
         _list path;
     name = option_of_yojson (value_for_key workspace_image_name_of_yojson "Name") _list path;
     image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path;
   }
    : create_workspace_image_result)

let create_workspace_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
     description = value_for_key workspace_image_description_of_yojson "Description" _list path;
     name = value_for_key workspace_image_name_of_yojson "Name" _list path;
   }
    : create_workspace_image_request)

let create_workspace_bundle_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_bundle =
       option_of_yojson (value_for_key workspace_bundle_of_yojson "WorkspaceBundle") _list path;
   }
    : create_workspace_bundle_result)

let workspace_bundle_name_of_yojson = string_of_yojson
let workspace_bundle_description_of_yojson = string_of_yojson

let create_workspace_bundle_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     root_storage = option_of_yojson (value_for_key root_storage_of_yojson "RootStorage") _list path;
     user_storage = value_for_key user_storage_of_yojson "UserStorage" _list path;
     compute_type = value_for_key compute_type_of_yojson "ComputeType" _list path;
     image_id = value_for_key workspace_image_id_of_yojson "ImageId" _list path;
     bundle_description =
       value_for_key workspace_bundle_description_of_yojson "BundleDescription" _list path;
     bundle_name = value_for_key workspace_bundle_name_of_yojson "BundleName" _list path;
   }
    : create_workspace_bundle_request)

let create_updated_workspace_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path }
    : create_updated_workspace_image_result)

let create_updated_workspace_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     source_image_id = value_for_key workspace_image_id_of_yojson "SourceImageId" _list path;
     description = value_for_key workspace_image_description_of_yojson "Description" _list path;
     name = value_for_key workspace_image_name_of_yojson "Name" _list path;
   }
    : create_updated_workspace_image_request)

let create_tags_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_id = value_for_key non_empty_string_of_yojson "ResourceId" _list path;
   }
    : create_tags_request)

let standby_workspace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_replication =
       option_of_yojson (value_for_key data_replication_of_yojson "DataReplication") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     volume_encryption_key =
       option_of_yojson
         (value_for_key volume_encryption_key_of_yojson "VolumeEncryptionKey")
         _list path;
     primary_workspace_id = value_for_key workspace_id_of_yojson "PrimaryWorkspaceId" _list path;
   }
    : standby_workspace)

let failed_create_standby_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key description_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key workspace_error_code_of_yojson "ErrorCode") _list path;
     standby_workspace_request =
       option_of_yojson
         (value_for_key standby_workspace_of_yojson "StandbyWorkspaceRequest")
         _list path;
   }
    : failed_create_standby_workspaces_request)

let failed_create_standby_workspaces_request_list_of_yojson tree path =
  list_of_yojson failed_create_standby_workspaces_request_of_yojson tree path

let pending_create_standby_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_id = option_of_yojson (value_for_key workspace_id_of_yojson "WorkspaceId") _list path;
     state = option_of_yojson (value_for_key workspace_state_of_yojson "State") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
   }
    : pending_create_standby_workspaces_request)

let pending_create_standby_workspaces_request_list_of_yojson tree path =
  list_of_yojson pending_create_standby_workspaces_request_of_yojson tree path

let create_standby_workspaces_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending_standby_requests =
       option_of_yojson
         (value_for_key pending_create_standby_workspaces_request_list_of_yojson
            "PendingStandbyRequests")
         _list path;
     failed_standby_requests =
       option_of_yojson
         (value_for_key failed_create_standby_workspaces_request_list_of_yojson
            "FailedStandbyRequests")
         _list path;
   }
    : create_standby_workspaces_result)

let standby_workspaces_list_of_yojson tree path =
  list_of_yojson standby_workspace_of_yojson tree path

let create_standby_workspaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     standby_workspaces =
       value_for_key standby_workspaces_list_of_yojson "StandbyWorkspaces" _list path;
     primary_region = value_for_key region_of_yojson "PrimaryRegion" _list path;
   }
    : create_standby_workspaces_request)

let resource_creation_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : resource_creation_failed_exception)

let create_ip_group_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group_id = option_of_yojson (value_for_key ip_group_id_of_yojson "GroupId") _list path }
    : create_ip_group_result)

let create_ip_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     user_rules = option_of_yojson (value_for_key ip_rule_list_of_yojson "UserRules") _list path;
     group_desc = option_of_yojson (value_for_key ip_group_desc_of_yojson "GroupDesc") _list path;
     group_name = value_for_key ip_group_name_of_yojson "GroupName" _list path;
   }
    : create_ip_group_request)

let create_connection_alias_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias_id = option_of_yojson (value_for_key connection_alias_id_of_yojson "AliasId") _list path;
   }
    : create_connection_alias_result)

let create_connection_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     connection_string = value_for_key connection_string_of_yojson "ConnectionString" _list path;
   }
    : create_connection_alias_request)

let create_connect_client_add_in_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ add_in_id = option_of_yojson (value_for_key amazon_uuid_of_yojson "AddInId") _list path }
    : create_connect_client_add_in_result)

let create_connect_client_add_in_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ur_l = value_for_key add_in_url_of_yojson "URL" _list path;
     name = value_for_key add_in_name_of_yojson "Name" _list path;
     resource_id = value_for_key directory_id_of_yojson "ResourceId" _list path;
   }
    : create_connect_client_add_in_request)

let create_account_link_invitation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_link = option_of_yojson (value_for_key account_link_of_yojson "AccountLink") _list path;
   }
    : create_account_link_invitation_result)

let create_account_link_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     target_account_id = value_for_key aws_account_of_yojson "TargetAccountId" _list path;
   }
    : create_account_link_invitation_request)

let copy_workspace_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image_id = option_of_yojson (value_for_key workspace_image_id_of_yojson "ImageId") _list path }
    : copy_workspace_image_result)

let copy_workspace_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     source_region = value_for_key region_of_yojson "SourceRegion" _list path;
     source_image_id = value_for_key workspace_image_id_of_yojson "SourceImageId" _list path;
     description =
       option_of_yojson
         (value_for_key workspace_image_description_of_yojson "Description")
         _list path;
     name = value_for_key workspace_image_name_of_yojson "Name" _list path;
   }
    : copy_workspace_image_request)

let authorize_ip_rules_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let authorize_ip_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_rules = value_for_key ip_rule_list_of_yojson "UserRules" _list path;
     group_id = value_for_key ip_group_id_of_yojson "GroupId" _list path;
   }
    : authorize_ip_rules_request)

let operating_system_not_compatible_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let compute_not_compatible_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let application_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_workspace_application_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association =
       option_of_yojson
         (value_for_key workspace_resource_association_of_yojson "Association")
         _list path;
   }
    : associate_workspace_application_result)

let associate_workspace_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_id = value_for_key work_space_application_id_of_yojson "ApplicationId" _list path;
     workspace_id = value_for_key workspace_id_of_yojson "WorkspaceId" _list path;
   }
    : associate_workspace_application_request)

let associate_ip_groups_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_ip_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_ids = value_for_key ip_group_id_list_of_yojson "GroupIds" _list path;
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
   }
    : associate_ip_groups_request)

let associate_connection_alias_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_identifier =
       option_of_yojson
         (value_for_key connection_identifier_of_yojson "ConnectionIdentifier")
         _list path;
   }
    : associate_connection_alias_result)

let associate_connection_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key non_empty_string_of_yojson "ResourceId" _list path;
     alias_id = value_for_key connection_alias_id_of_yojson "AliasId" _list path;
   }
    : associate_connection_alias_request)

let accept_account_link_invitation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_link = option_of_yojson (value_for_key account_link_of_yojson "AccountLink") _list path;
   }
    : accept_account_link_invitation_result)

let accept_account_link_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     link_id = value_for_key link_id_of_yojson "LinkId" _list path;
   }
    : accept_account_link_invitation_request)
