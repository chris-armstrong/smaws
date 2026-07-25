open Smaws_Lib.Json.SerializeHelpers
open Types

let integer_to_yojson = int_to_yojson
let string__to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let internal_server_error_exception_to_yojson (x : internal_server_error_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let forbidden_exception_to_yojson (x : forbidden_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let bad_request_exception_to_yojson (x : bad_request_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let environment_id_to_yojson = string_to_yojson
let user_arn_to_yojson = string_to_yojson

let permissions_to_yojson (x : permissions) =
  match x with
  | OWNER -> `String "owner"
  | READ_WRITE -> `String "read-write"
  | READ_ONLY -> `String "read-only"

let environment_member_to_yojson (x : environment_member) =
  assoc_to_yojson
    [
      ("permissions", Some (permissions_to_yojson x.permissions));
      ("userId", Some (string__to_yojson x.user_id));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("lastAccess", option_to_yojson timestamp_to_yojson x.last_access);
    ]

let update_environment_membership_result_to_yojson (x : update_environment_membership_result) =
  assoc_to_yojson [ ("membership", option_to_yojson environment_member_to_yojson x.membership) ]

let member_permissions_to_yojson (x : member_permissions) =
  match x with READ_WRITE -> `String "read-write" | READ_ONLY -> `String "read-only"

let update_environment_membership_request_to_yojson (x : update_environment_membership_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("permissions", Some (member_permissions_to_yojson x.permissions));
    ]

let update_environment_result_to_yojson = unit_to_yojson

let managed_credentials_action_to_yojson (x : managed_credentials_action) =
  match x with ENABLE -> `String "ENABLE" | DISABLE -> `String "DISABLE"

let environment_description_to_yojson = string_to_yojson
let environment_name_to_yojson = string_to_yojson

let update_environment_request_to_yojson (x : update_environment_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("name", option_to_yojson environment_name_to_yojson x.name);
      ("description", option_to_yojson environment_description_to_yojson x.description);
      ( "managedCredentialsAction",
        option_to_yojson managed_credentials_action_to_yojson x.managed_credentials_action );
    ]

let concurrent_access_exception_to_yojson (x : concurrent_access_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("className", option_to_yojson string__to_yojson x.class_name);
      ("code", option_to_yojson integer_to_yojson x.code);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let environment_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (environment_arn_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (environment_arn_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (environment_arn_to_yojson x.resource_ar_n)) ]

let environment_id_list_to_yojson tree = list_to_yojson environment_id_to_yojson tree

let list_environments_result_to_yojson (x : list_environments_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("environmentIds", option_to_yojson environment_id_list_to_yojson x.environment_ids);
    ]

let max_results_to_yojson = int_to_yojson

let list_environments_request_to_yojson (x : list_environments_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let environment_status_to_yojson (x : environment_status) =
  match x with
  | ERROR -> `String "error"
  | CREATING -> `String "creating"
  | CONNECTING -> `String "connecting"
  | READY -> `String "ready"
  | STOPPING -> `String "stopping"
  | STOPPED -> `String "stopped"
  | DELETING -> `String "deleting"

let describe_environment_status_result_to_yojson (x : describe_environment_status_result) =
  assoc_to_yojson
    [
      ("status", Some (environment_status_to_yojson x.status));
      ("message", Some (string__to_yojson x.message));
    ]

let describe_environment_status_request_to_yojson (x : describe_environment_status_request) =
  assoc_to_yojson [ ("environmentId", Some (environment_id_to_yojson x.environment_id)) ]

let managed_credentials_status_to_yojson (x : managed_credentials_status) =
  match x with
  | ENABLED_ON_CREATE -> `String "ENABLED_ON_CREATE"
  | ENABLED_BY_OWNER -> `String "ENABLED_BY_OWNER"
  | DISABLED_BY_DEFAULT -> `String "DISABLED_BY_DEFAULT"
  | DISABLED_BY_OWNER -> `String "DISABLED_BY_OWNER"
  | DISABLED_BY_COLLABORATOR -> `String "DISABLED_BY_COLLABORATOR"
  | PENDING_REMOVAL_BY_COLLABORATOR -> `String "PENDING_REMOVAL_BY_COLLABORATOR"
  | PENDING_START_REMOVAL_BY_COLLABORATOR -> `String "PENDING_START_REMOVAL_BY_COLLABORATOR"
  | PENDING_REMOVAL_BY_OWNER -> `String "PENDING_REMOVAL_BY_OWNER"
  | PENDING_START_REMOVAL_BY_OWNER -> `String "PENDING_START_REMOVAL_BY_OWNER"
  | FAILED_REMOVAL_BY_COLLABORATOR -> `String "FAILED_REMOVAL_BY_COLLABORATOR"
  | FAILED_REMOVAL_BY_OWNER -> `String "FAILED_REMOVAL_BY_OWNER"

let environment_lifecycle_status_to_yojson (x : environment_lifecycle_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | DELETE_FAILED -> `String "DELETE_FAILED"

let environment_lifecycle_to_yojson (x : environment_lifecycle) =
  assoc_to_yojson
    [
      ("status", option_to_yojson environment_lifecycle_status_to_yojson x.status);
      ("reason", option_to_yojson string__to_yojson x.reason);
      ("failureResource", option_to_yojson string__to_yojson x.failure_resource);
    ]

let connection_type_to_yojson (x : connection_type) =
  match x with CONNECT_SSH -> `String "CONNECT_SSH" | CONNECT_SSM -> `String "CONNECT_SSM"

let environment_type_to_yojson (x : environment_type) =
  match x with SSH -> `String "ssh" | EC2 -> `String "ec2"

let environment_to_yojson (x : environment) =
  assoc_to_yojson
    [
      ("id", option_to_yojson environment_id_to_yojson x.id);
      ("name", option_to_yojson environment_name_to_yojson x.name);
      ("description", option_to_yojson environment_description_to_yojson x.description);
      ("type", Some (environment_type_to_yojson x.type_));
      ("connectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("arn", Some (string__to_yojson x.arn));
      ("ownerArn", Some (string__to_yojson x.owner_arn));
      ("lifecycle", option_to_yojson environment_lifecycle_to_yojson x.lifecycle);
      ( "managedCredentialsStatus",
        option_to_yojson managed_credentials_status_to_yojson x.managed_credentials_status );
    ]

let environment_list_to_yojson tree = list_to_yojson environment_to_yojson tree

let describe_environments_result_to_yojson (x : describe_environments_result) =
  assoc_to_yojson [ ("environments", option_to_yojson environment_list_to_yojson x.environments) ]

let bounded_environment_id_list_to_yojson tree = list_to_yojson environment_id_to_yojson tree

let describe_environments_request_to_yojson (x : describe_environments_request) =
  assoc_to_yojson
    [ ("environmentIds", Some (bounded_environment_id_list_to_yojson x.environment_ids)) ]

let environment_members_list_to_yojson tree = list_to_yojson environment_member_to_yojson tree

let describe_environment_memberships_result_to_yojson (x : describe_environment_memberships_result)
    =
  assoc_to_yojson
    [
      ("memberships", option_to_yojson environment_members_list_to_yojson x.memberships);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let permissions_list_to_yojson tree = list_to_yojson permissions_to_yojson tree

let describe_environment_memberships_request_to_yojson
    (x : describe_environment_memberships_request) =
  assoc_to_yojson
    [
      ("userArn", option_to_yojson user_arn_to_yojson x.user_arn);
      ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id);
      ("permissions", option_to_yojson permissions_list_to_yojson x.permissions);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let delete_environment_membership_result_to_yojson = unit_to_yojson

let delete_environment_membership_request_to_yojson (x : delete_environment_membership_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
    ]

let delete_environment_result_to_yojson = unit_to_yojson

let delete_environment_request_to_yojson (x : delete_environment_request) =
  assoc_to_yojson [ ("environmentId", Some (environment_id_to_yojson x.environment_id)) ]

let create_environment_membership_result_to_yojson (x : create_environment_membership_result) =
  assoc_to_yojson [ ("membership", Some (environment_member_to_yojson x.membership)) ]

let create_environment_membership_request_to_yojson (x : create_environment_membership_request) =
  assoc_to_yojson
    [
      ("environmentId", Some (environment_id_to_yojson x.environment_id));
      ("userArn", Some (user_arn_to_yojson x.user_arn));
      ("permissions", Some (member_permissions_to_yojson x.permissions));
    ]

let create_environment_ec2_result_to_yojson (x : create_environment_ec2_result) =
  assoc_to_yojson [ ("environmentId", option_to_yojson environment_id_to_yojson x.environment_id) ]

let nullable_boolean_to_yojson = bool_to_yojson
let automatic_stop_time_minutes_to_yojson = int_to_yojson
let image_id_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let instance_type_to_yojson = string_to_yojson
let client_request_token_to_yojson = string_to_yojson

let create_environment_ec2_request_to_yojson (x : create_environment_ec2_request) =
  assoc_to_yojson
    [
      ("name", Some (environment_name_to_yojson x.name));
      ("description", option_to_yojson environment_description_to_yojson x.description);
      ("clientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("instanceType", Some (instance_type_to_yojson x.instance_type));
      ("subnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("imageId", Some (image_id_to_yojson x.image_id));
      ( "automaticStopTimeMinutes",
        option_to_yojson automatic_stop_time_minutes_to_yojson x.automatic_stop_time_minutes );
      ("ownerArn", option_to_yojson user_arn_to_yojson x.owner_arn);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("connectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("dryRun", option_to_yojson nullable_boolean_to_yojson x.dry_run);
    ]
