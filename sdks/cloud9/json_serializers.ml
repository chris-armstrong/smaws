open Smaws_Lib.Json.SerializeHelpers
open Types

let user_arn_to_yojson = string_to_yojson
let update_environment_result_to_yojson = unit_to_yojson
let environment_id_to_yojson = string_to_yojson
let environment_name_to_yojson = string_to_yojson
let environment_description_to_yojson = string_to_yojson

let managed_credentials_action_to_yojson (x : managed_credentials_action) =
  match x with DISABLE -> `String "DISABLE" | ENABLE -> `String "ENABLE"

let update_environment_request_to_yojson (x : update_environment_request) =
  assoc_to_yojson
    [
      ( "managedCredentialsAction",
        option_to_yojson managed_credentials_action_to_yojson x.managed_credentials_action );
      ("description", option_to_yojson environment_description_to_yojson x.description);
      ("name", option_to_yojson environment_name_to_yojson x.name);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let permissions_to_yojson (x : permissions) =
  match x with
  | READ_ONLY -> `String "read-only"
  | READ_WRITE -> `String "read-write"
  | OWNER -> `String "owner"

let string__to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let environment_member_to_yojson (x : environment_member) =
  assoc_to_yojson
    [
      ("lastAccess", option_to_yojson timestamp_to_yojson x.last_access);
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("userId", Some (string__to_yojson x.user_id));
      ("permissions", Some (permissions_to_yojson x.permissions));
    ]

let update_environment_membership_result_to_yojson (x : update_environment_membership_result) =
  assoc_to_yojson [ ("membership", option_to_yojson environment_member_to_yojson x.membership) ]

let member_permissions_to_yojson (x : member_permissions) =
  match x with READ_ONLY -> `String "read-only" | READ_WRITE -> `String "read-write"

let update_environment_membership_request_to_yojson (x : update_environment_membership_request) =
  assoc_to_yojson
    [
      ("permissions", Some (member_permissions_to_yojson x.permissions));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let integer_to_yojson = int_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let internal_server_error_exception_to_yojson (x : internal_server_error_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let forbidden_exception_to_yojson (x : forbidden_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let bad_request_exception_to_yojson (x : bad_request_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let environment_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (environment_arn_to_yojson x.resource_ar_n));
    ]

let concurrent_access_exception_to_yojson (x : concurrent_access_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson integer_to_yojson x.code);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (environment_arn_to_yojson x.resource_ar_n));
    ]

let subnet_id_to_yojson = string_to_yojson
let permissions_list_to_yojson tree = list_to_yojson permissions_to_yojson tree
let nullable_boolean_to_yojson = bool_to_yojson
let max_results_to_yojson = int_to_yojson

let managed_credentials_status_to_yojson (x : managed_credentials_status) =
  match x with
  | FAILED_REMOVAL_BY_OWNER -> `String "FAILED_REMOVAL_BY_OWNER"
  | FAILED_REMOVAL_BY_COLLABORATOR -> `String "FAILED_REMOVAL_BY_COLLABORATOR"
  | PENDING_START_REMOVAL_BY_OWNER -> `String "PENDING_START_REMOVAL_BY_OWNER"
  | PENDING_REMOVAL_BY_OWNER -> `String "PENDING_REMOVAL_BY_OWNER"
  | PENDING_START_REMOVAL_BY_COLLABORATOR -> `String "PENDING_START_REMOVAL_BY_COLLABORATOR"
  | PENDING_REMOVAL_BY_COLLABORATOR -> `String "PENDING_REMOVAL_BY_COLLABORATOR"
  | DISABLED_BY_COLLABORATOR -> `String "DISABLED_BY_COLLABORATOR"
  | DISABLED_BY_OWNER -> `String "DISABLED_BY_OWNER"
  | DISABLED_BY_DEFAULT -> `String "DISABLED_BY_DEFAULT"
  | ENABLED_BY_OWNER -> `String "ENABLED_BY_OWNER"
  | ENABLED_ON_CREATE -> `String "ENABLED_ON_CREATE"

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (environment_arn_to_yojson x.resource_ar_n)) ]

let environment_id_list_to_yojson tree = list_to_yojson environment_id_to_yojson tree

let list_environments_result_to_yojson (x : list_environments_result) =
  assoc_to_yojson
    [
      ("environmentIds", option_to_yojson environment_id_list_to_yojson x.environment_ids);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_environments_request_to_yojson (x : list_environments_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let instance_type_to_yojson = string_to_yojson
let image_id_to_yojson = string_to_yojson

let environment_type_to_yojson (x : environment_type) =
  match x with EC2 -> `String "ec2" | SSH -> `String "ssh"

let environment_status_to_yojson (x : environment_status) =
  match x with
  | DELETING -> `String "deleting"
  | STOPPED -> `String "stopped"
  | STOPPING -> `String "stopping"
  | READY -> `String "ready"
  | CONNECTING -> `String "connecting"
  | CREATING -> `String "creating"
  | ERROR -> `String "error"

let environment_members_list_to_yojson tree = list_to_yojson environment_member_to_yojson tree

let connection_type_to_yojson (x : connection_type) =
  match x with CONNECT_SSM -> `String "CONNECT_SSM" | CONNECT_SSH -> `String "CONNECT_SSH"

let environment_lifecycle_status_to_yojson (x : environment_lifecycle_status) =
  match x with
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETING -> `String "DELETING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let environment_lifecycle_to_yojson (x : environment_lifecycle) =
  assoc_to_yojson
    [
      ("failureResource", option_to_yojson string__to_yojson x.failure_resource);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("status", option_to_yojson environment_lifecycle_status_to_yojson x.status);
    ]

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ( "managedCredentialsStatus",
        option_to_yojson managed_credentials_status_to_yojson x.managed_credentials_status );
      ("lifecycle", option_to_yojson environment_lifecycle_to_yojson x.lifecycle);
      ("ownerArn", Some (string__to_yojson x.owner_arn));
      ("arn", Some (string__to_yojson x.arn));
      ("connectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("type", Some (environment_type_to_yojson x.type_));
      ("description", option_to_yojson environment_description_to_yojson x.description);
      ("name", option_to_yojson environment_name_to_yojson x.name);
      ("id", option_to_yojson environment_id_to_yojson x.id);
    ]

let environment_list_to_yojson tree = list_to_yojson environment_to_yojson tree

let describe_environments_result_to_yojson (x : describe_environments_result) =
  assoc_to_yojson [ ("environments", option_to_yojson environment_list_to_yojson x.environments) ]

let bounded_environment_id_list_to_yojson tree = list_to_yojson environment_id_to_yojson tree

let describe_environments_request_to_yojson (x : describe_environments_request) =
  assoc_to_yojson
    [ ("environmentIds", Some (bounded_environment_id_list_to_yojson x.environment_ids)) ]

let describe_environment_status_result_to_yojson (x : describe_environment_status_result) =
  assoc_to_yojson
    [
      ("message", Some (string__to_yojson x.message));
      ("status", Some (environment_status_to_yojson x.status));
    ]

let describe_environment_status_request_to_yojson (x : describe_environment_status_request) =
  assoc_to_yojson [ ("environmentId", Some (environment_id_to_yojson x.environment_id)) ]

let describe_environment_memberships_result_to_yojson (x : describe_environment_memberships_result)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("memberships", option_to_yojson environment_members_list_to_yojson x.memberships);
    ]

let describe_environment_memberships_request_to_yojson
    (x : describe_environment_memberships_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("permissions", option_to_yojson permissions_list_to_yojson x.permissions);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("userArn", option_to_yojson user_arn_to_yojson x.user_arn);
    ]

let delete_environment_result_to_yojson = unit_to_yojson

let delete_environment_request_to_yojson (x : delete_environment_request) =
  assoc_to_yojson [ ("environmentId", Some (environment_id_to_yojson x.environment_id)) ]

let delete_environment_membership_result_to_yojson = unit_to_yojson

let delete_environment_membership_request_to_yojson (x : delete_environment_membership_request) =
  assoc_to_yojson
    [
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let create_environment_membership_result_to_yojson (x : create_environment_membership_result) =
  assoc_to_yojson [ ("membership", Some (environment_member_to_yojson x.membership)) ]

let create_environment_membership_request_to_yojson (x : create_environment_membership_request) =
  assoc_to_yojson
    [
      ("permissions", Some (member_permissions_to_yojson x.permissions));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
    ]

let create_environment_ec2_result_to_yojson (x : create_environment_ec2_result) =
  assoc_to_yojson [ ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id) ]

let client_request_token_to_yojson = string_to_yojson
let automatic_stop_time_minutes_to_yojson = int_to_yojson

let create_environment_ec2_request_to_yojson (x : create_environment_ec2_request) =
  assoc_to_yojson
    [
      ("dryRun", option_to_yojson nullable_boolean_to_yojson x.dry_run);
      ("connectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ownerArn", option_to_yojson user_arn_to_yojson x.owner_arn);
      ( "automaticStopTimeMinutes",
        option_to_yojson automatic_stop_time_minutes_to_yojson x.automatic_stop_time_minutes );
      ("imageId", Some (image_id_to_yojson x.image_id));
      ("subnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("instanceType", Some (instance_type_to_yojson x.instance_type));
      ("clientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("description", option_to_yojson environment_description_to_yojson x.description);
      ("name", Some (environment_name_to_yojson x.name));
    ]
