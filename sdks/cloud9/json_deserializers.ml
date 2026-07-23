open Smaws_Lib.Json.DeserializeHelpers
open Types

let integer_of_yojson = int_of_yojson
let string__of_yojson = string_of_yojson

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : too_many_requests_exception)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : limit_exceeded_exception)

let internal_server_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : internal_server_error_exception)

let forbidden_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : forbidden_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : conflict_exception)

let bad_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : bad_request_exception)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let environment_id_of_yojson = string_of_yojson
let user_arn_of_yojson = string_of_yojson

let permissions_of_yojson (tree : t) path =
  ((match tree with
    | `String "owner" -> OWNER
    | `String "read-write" -> READ_WRITE
    | `String "read-only" -> READ_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Permissions" value)
    | _ -> raise (deserialize_wrong_type_error path "Permissions")
     : permissions)
    : permissions)

let environment_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permissions = value_for_key permissions_of_yojson "permissions" _list path;
     user_id = value_for_key string__of_yojson "userId" _list path;
     user_arn = value_for_key user_arn_of_yojson "userArn" _list path;
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     last_access = option_of_yojson (value_for_key timestamp_of_yojson "lastAccess") _list path;
   }
    : environment_member)

let update_environment_membership_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     membership =
       option_of_yojson (value_for_key environment_member_of_yojson "membership") _list path;
   }
    : update_environment_membership_result)

let member_permissions_of_yojson (tree : t) path =
  ((match tree with
    | `String "read-write" -> READ_WRITE
    | `String "read-only" -> READ_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "MemberPermissions" value)
    | _ -> raise (deserialize_wrong_type_error path "MemberPermissions")
     : member_permissions)
    : member_permissions)

let update_environment_membership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     user_arn = value_for_key user_arn_of_yojson "userArn" _list path;
     permissions = value_for_key member_permissions_of_yojson "permissions" _list path;
   }
    : update_environment_membership_request)

let update_environment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let managed_credentials_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLE" -> ENABLE
    | `String "DISABLE" -> DISABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedCredentialsAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedCredentialsAction")
     : managed_credentials_action)
    : managed_credentials_action)

let environment_description_of_yojson = string_of_yojson
let environment_name_of_yojson = string_of_yojson

let update_environment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     name = option_of_yojson (value_for_key environment_name_of_yojson "name") _list path;
     description =
       option_of_yojson (value_for_key environment_description_of_yojson "description") _list path;
     managed_credentials_action =
       option_of_yojson
         (value_for_key managed_credentials_action_of_yojson "managedCredentialsAction")
         _list path;
   }
    : update_environment_request)

let concurrent_access_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     class_name = option_of_yojson (value_for_key string__of_yojson "className") _list path;
     code = option_of_yojson (value_for_key integer_of_yojson "code") _list path;
   }
    : concurrent_access_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let environment_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key environment_arn_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
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

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key environment_arn_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key environment_arn_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let environment_id_list_of_yojson tree path = list_of_yojson environment_id_of_yojson tree path

let list_environments_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     environment_ids =
       option_of_yojson (value_for_key environment_id_list_of_yojson "environmentIds") _list path;
   }
    : list_environments_result)

let max_results_of_yojson = int_of_yojson

let list_environments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_environments_request)

let environment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "error" -> ERROR
    | `String "creating" -> CREATING
    | `String "connecting" -> CONNECTING
    | `String "ready" -> READY
    | `String "stopping" -> STOPPING
    | `String "stopped" -> STOPPED
    | `String "deleting" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentStatus")
     : environment_status)
    : environment_status)

let describe_environment_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key environment_status_of_yojson "status" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : describe_environment_status_result)

let describe_environment_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment_id = value_for_key environment_id_of_yojson "environmentId" _list path }
    : describe_environment_status_request)

let managed_credentials_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED_ON_CREATE" -> ENABLED_ON_CREATE
    | `String "ENABLED_BY_OWNER" -> ENABLED_BY_OWNER
    | `String "DISABLED_BY_DEFAULT" -> DISABLED_BY_DEFAULT
    | `String "DISABLED_BY_OWNER" -> DISABLED_BY_OWNER
    | `String "DISABLED_BY_COLLABORATOR" -> DISABLED_BY_COLLABORATOR
    | `String "PENDING_REMOVAL_BY_COLLABORATOR" -> PENDING_REMOVAL_BY_COLLABORATOR
    | `String "PENDING_START_REMOVAL_BY_COLLABORATOR" -> PENDING_START_REMOVAL_BY_COLLABORATOR
    | `String "PENDING_REMOVAL_BY_OWNER" -> PENDING_REMOVAL_BY_OWNER
    | `String "PENDING_START_REMOVAL_BY_OWNER" -> PENDING_START_REMOVAL_BY_OWNER
    | `String "FAILED_REMOVAL_BY_COLLABORATOR" -> FAILED_REMOVAL_BY_COLLABORATOR
    | `String "FAILED_REMOVAL_BY_OWNER" -> FAILED_REMOVAL_BY_OWNER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ManagedCredentialsStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ManagedCredentialsStatus")
     : managed_credentials_status)
    : managed_credentials_status)

let environment_lifecycle_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "CREATED" -> CREATED
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETING" -> DELETING
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnvironmentLifecycleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentLifecycleStatus")
     : environment_lifecycle_status)
    : environment_lifecycle_status)

let environment_lifecycle_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key environment_lifecycle_status_of_yojson "status") _list path;
     reason = option_of_yojson (value_for_key string__of_yojson "reason") _list path;
     failure_resource =
       option_of_yojson (value_for_key string__of_yojson "failureResource") _list path;
   }
    : environment_lifecycle)

let connection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONNECT_SSH" -> CONNECT_SSH
    | `String "CONNECT_SSM" -> CONNECT_SSM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionType")
     : connection_type)
    : connection_type)

let environment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ssh" -> SSH
    | `String "ec2" -> EC2
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnvironmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "EnvironmentType")
     : environment_type)
    : environment_type)

let environment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key environment_id_of_yojson "id") _list path;
     name = option_of_yojson (value_for_key environment_name_of_yojson "name") _list path;
     description =
       option_of_yojson (value_for_key environment_description_of_yojson "description") _list path;
     type_ = value_for_key environment_type_of_yojson "type" _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "connectionType") _list path;
     arn = value_for_key string__of_yojson "arn" _list path;
     owner_arn = value_for_key string__of_yojson "ownerArn" _list path;
     lifecycle =
       option_of_yojson (value_for_key environment_lifecycle_of_yojson "lifecycle") _list path;
     managed_credentials_status =
       option_of_yojson
         (value_for_key managed_credentials_status_of_yojson "managedCredentialsStatus")
         _list path;
   }
    : environment)

let environment_list_of_yojson tree path = list_of_yojson environment_of_yojson tree path

let describe_environments_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environments =
       option_of_yojson (value_for_key environment_list_of_yojson "environments") _list path;
   }
    : describe_environments_result)

let bounded_environment_id_list_of_yojson tree path =
  list_of_yojson environment_id_of_yojson tree path

let describe_environments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_ids =
       value_for_key bounded_environment_id_list_of_yojson "environmentIds" _list path;
   }
    : describe_environments_request)

let environment_members_list_of_yojson tree path =
  list_of_yojson environment_member_of_yojson tree path

let describe_environment_memberships_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     memberships =
       option_of_yojson (value_for_key environment_members_list_of_yojson "memberships") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : describe_environment_memberships_result)

let permissions_list_of_yojson tree path = list_of_yojson permissions_of_yojson tree path

let describe_environment_memberships_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_arn = option_of_yojson (value_for_key user_arn_of_yojson "userArn") _list path;
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
     permissions =
       option_of_yojson (value_for_key permissions_list_of_yojson "permissions") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_environment_memberships_request)

let delete_environment_membership_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_environment_membership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     user_arn = value_for_key user_arn_of_yojson "userArn" _list path;
   }
    : delete_environment_membership_request)

let delete_environment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_environment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ environment_id = value_for_key environment_id_of_yojson "environmentId" _list path }
    : delete_environment_request)

let create_environment_membership_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ membership = value_for_key environment_member_of_yojson "membership" _list path }
    : create_environment_membership_result)

let create_environment_membership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id = value_for_key environment_id_of_yojson "environmentId" _list path;
     user_arn = value_for_key user_arn_of_yojson "userArn" _list path;
     permissions = value_for_key member_permissions_of_yojson "permissions" _list path;
   }
    : create_environment_membership_request)

let create_environment_ec2_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     environment_id =
       option_of_yojson (value_for_key environment_id_of_yojson "environmentId") _list path;
   }
    : create_environment_ec2_result)

let nullable_boolean_of_yojson = bool_of_yojson
let automatic_stop_time_minutes_of_yojson = int_of_yojson
let image_id_of_yojson = string_of_yojson
let subnet_id_of_yojson = string_of_yojson
let instance_type_of_yojson = string_of_yojson
let client_request_token_of_yojson = string_of_yojson

let create_environment_ec2_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key environment_name_of_yojson "name" _list path;
     description =
       option_of_yojson (value_for_key environment_description_of_yojson "description") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "clientRequestToken")
         _list path;
     instance_type = value_for_key instance_type_of_yojson "instanceType" _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "subnetId") _list path;
     image_id = value_for_key image_id_of_yojson "imageId" _list path;
     automatic_stop_time_minutes =
       option_of_yojson
         (value_for_key automatic_stop_time_minutes_of_yojson "automaticStopTimeMinutes")
         _list path;
     owner_arn = option_of_yojson (value_for_key user_arn_of_yojson "ownerArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "connectionType") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_of_yojson "dryRun") _list path;
   }
    : create_environment_ec2_request)
