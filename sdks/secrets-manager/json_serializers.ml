open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let malformed_policy_document_exception_to_yojson (x : malformed_policy_document_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let boolean_type_to_yojson = bool_to_yojson
let name_type_to_yojson = string_to_yojson

let validation_errors_entry_to_yojson (x : validation_errors_entry) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("CheckName", option_to_yojson name_type_to_yojson x.check_name);
    ]

let validation_errors_type_to_yojson tree = list_to_yojson validation_errors_entry_to_yojson tree

let validate_resource_policy_response_to_yojson (x : validate_resource_policy_response) =
  assoc_to_yojson
    [
      ("ValidationErrors", option_to_yojson validation_errors_type_to_yojson x.validation_errors);
      ("PolicyValidationPassed", option_to_yojson boolean_type_to_yojson x.policy_validation_passed);
    ]

let secret_id_type_to_yojson = string_to_yojson
let non_empty_resource_policy_type_to_yojson = string_to_yojson

let validate_resource_policy_request_to_yojson (x : validate_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourcePolicy", Some (non_empty_resource_policy_type_to_yojson x.resource_policy));
      ("SecretId", option_to_yojson secret_id_type_to_yojson x.secret_id);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let secret_arn_type_to_yojson = string_to_yojson
let secret_name_type_to_yojson = string_to_yojson

let update_secret_version_stage_response_to_yojson (x : update_secret_version_stage_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let secret_version_stage_type_to_yojson = string_to_yojson
let secret_version_id_type_to_yojson = string_to_yojson

let update_secret_version_stage_request_to_yojson (x : update_secret_version_stage_request) =
  assoc_to_yojson
    [
      ("MoveToVersionId", option_to_yojson secret_version_id_type_to_yojson x.move_to_version_id);
      ( "RemoveFromVersionId",
        option_to_yojson secret_version_id_type_to_yojson x.remove_from_version_id );
      ("VersionStage", Some (secret_version_stage_type_to_yojson x.version_stage));
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let resource_exists_exception_to_yojson (x : resource_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let precondition_not_met_exception_to_yojson (x : precondition_not_met_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let encryption_failure_to_yojson (x : encryption_failure) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let decryption_failure_to_yojson (x : decryption_failure) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_secret_response_to_yojson (x : update_secret_response) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let client_request_token_type_to_yojson = string_to_yojson
let description_type_to_yojson = string_to_yojson
let kms_key_id_type_to_yojson = string_to_yojson
let secret_binary_type_to_yojson = blob_to_yojson
let secret_string_type_to_yojson = string_to_yojson
let medea_type_type_to_yojson = string_to_yojson

let update_secret_request_to_yojson (x : update_secret_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let tag_key_type_to_yojson = string_to_yojson
let tag_key_list_type_to_yojson tree = list_to_yojson tag_key_type_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_type_to_yojson x.tag_keys));
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let tag_value_type_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_type_to_yojson x.value);
      ("Key", option_to_yojson tag_key_type_to_yojson x.key);
    ]

let tag_list_type_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_type_to_yojson x.tags));
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let stop_replication_to_replica_response_to_yojson (x : stop_replication_to_replica_response) =
  assoc_to_yojson [ ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n) ]

let stop_replication_to_replica_request_to_yojson (x : stop_replication_to_replica_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let rotate_secret_response_to_yojson (x : rotate_secret_response) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let rotation_lambda_arn_type_to_yojson = string_to_yojson
let automatically_rotate_after_days_type_to_yojson = long_to_yojson
let duration_type_to_yojson = string_to_yojson
let schedule_expression_type_to_yojson = string_to_yojson

let rotation_rules_type_to_yojson (x : rotation_rules_type) =
  assoc_to_yojson
    [
      ( "ScheduleExpression",
        option_to_yojson schedule_expression_type_to_yojson x.schedule_expression );
      ("Duration", option_to_yojson duration_type_to_yojson x.duration);
      ( "AutomaticallyAfterDays",
        option_to_yojson automatically_rotate_after_days_type_to_yojson x.automatically_after_days
      );
    ]

let external_secret_rotation_metadata_item_key_type_to_yojson = string_to_yojson
let external_secret_rotation_metadata_item_value_type_to_yojson = string_to_yojson

let external_secret_rotation_metadata_item_to_yojson (x : external_secret_rotation_metadata_item) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson external_secret_rotation_metadata_item_value_type_to_yojson x.value);
      ("Key", option_to_yojson external_secret_rotation_metadata_item_key_type_to_yojson x.key);
    ]

let external_secret_rotation_metadata_type_to_yojson tree =
  list_to_yojson external_secret_rotation_metadata_item_to_yojson tree

let role_arn_type_to_yojson = string_to_yojson

let rotate_secret_request_to_yojson (x : rotate_secret_request) =
  assoc_to_yojson
    [
      ("RotateImmediately", option_to_yojson boolean_type_to_yojson x.rotate_immediately);
      ( "ExternalSecretRotationRoleArn",
        option_to_yojson role_arn_type_to_yojson x.external_secret_rotation_role_arn );
      ( "ExternalSecretRotationMetadata",
        option_to_yojson external_secret_rotation_metadata_type_to_yojson
          x.external_secret_rotation_metadata );
      ("RotationRules", option_to_yojson rotation_rules_type_to_yojson x.rotation_rules);
      ( "RotationLambdaARN",
        option_to_yojson rotation_lambda_arn_type_to_yojson x.rotation_lambda_ar_n );
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let restore_secret_response_to_yojson (x : restore_secret_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let restore_secret_request_to_yojson (x : restore_secret_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let region_type_to_yojson = string_to_yojson

let status_type_to_yojson (x : status_type) =
  match x with
  | InProgress -> `String "InProgress"
  | Failed -> `String "Failed"
  | InSync -> `String "InSync"

let status_message_type_to_yojson = string_to_yojson
let last_accessed_date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let replication_status_type_to_yojson (x : replication_status_type) =
  assoc_to_yojson
    [
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("StatusMessage", option_to_yojson status_message_type_to_yojson x.status_message);
      ("Status", option_to_yojson status_type_to_yojson x.status);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Region", option_to_yojson region_type_to_yojson x.region);
    ]

let replication_status_list_type_to_yojson tree =
  list_to_yojson replication_status_type_to_yojson tree

let replicate_secret_to_regions_response_to_yojson (x : replicate_secret_to_regions_response) =
  assoc_to_yojson
    [
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let replica_region_type_to_yojson (x : replica_region_type) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Region", option_to_yojson region_type_to_yojson x.region);
    ]

let add_replica_region_list_type_to_yojson tree = list_to_yojson replica_region_type_to_yojson tree

let replicate_secret_to_regions_request_to_yojson (x : replicate_secret_to_regions_request) =
  assoc_to_yojson
    [
      ( "ForceOverwriteReplicaSecret",
        option_to_yojson boolean_type_to_yojson x.force_overwrite_replica_secret );
      ("AddReplicaRegions", Some (add_replica_region_list_type_to_yojson x.add_replica_regions));
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let remove_regions_from_replication_response_to_yojson
    (x : remove_regions_from_replication_response) =
  assoc_to_yojson
    [
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let remove_replica_region_list_type_to_yojson tree = list_to_yojson region_type_to_yojson tree

let remove_regions_from_replication_request_to_yojson (x : remove_regions_from_replication_request)
    =
  assoc_to_yojson
    [
      ( "RemoveReplicaRegions",
        Some (remove_replica_region_list_type_to_yojson x.remove_replica_regions) );
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let secret_version_stages_type_to_yojson tree =
  list_to_yojson secret_version_stage_type_to_yojson tree

let put_secret_value_response_to_yojson (x : put_secret_value_response) =
  assoc_to_yojson
    [
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let rotation_token_type_to_yojson = string_to_yojson

let put_secret_value_request_to_yojson (x : put_secret_value_request) =
  assoc_to_yojson
    [
      ("RotationToken", option_to_yojson rotation_token_type_to_yojson x.rotation_token);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let public_policy_exception_to_yojson (x : public_policy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("BlockPublicPolicy", option_to_yojson boolean_type_to_yojson x.block_public_policy);
      ("ResourcePolicy", Some (non_empty_resource_policy_type_to_yojson x.resource_policy));
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let created_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let kms_key_id_list_type_to_yojson tree = list_to_yojson kms_key_id_type_to_yojson tree

let secret_versions_list_entry_to_yojson (x : secret_versions_list_entry) =
  assoc_to_yojson
    [
      ("KmsKeyIds", option_to_yojson kms_key_id_list_type_to_yojson x.kms_key_ids);
      ("CreatedDate", option_to_yojson created_date_type_to_yojson x.created_date);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
    ]

let secret_versions_list_type_to_yojson tree =
  list_to_yojson secret_versions_list_entry_to_yojson tree

let next_token_type_to_yojson = string_to_yojson

let list_secret_version_ids_response_to_yojson (x : list_secret_version_ids_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("Versions", option_to_yojson secret_versions_list_type_to_yojson x.versions);
    ]

let max_results_type_to_yojson = int_to_yojson

let list_secret_version_ids_request_to_yojson (x : list_secret_version_ids_request) =
  assoc_to_yojson
    [
      ("IncludeDeprecated", option_to_yojson boolean_type_to_yojson x.include_deprecated);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_type_to_yojson x.max_results);
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let rotation_enabled_type_to_yojson = bool_to_yojson
let last_rotated_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let last_changed_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let deleted_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let next_rotation_date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let secret_versions_to_stages_map_type_to_yojson tree =
  map_to_yojson secret_version_id_type_to_yojson secret_version_stages_type_to_yojson tree

let owning_service_type_to_yojson = string_to_yojson
let timestamp_type_to_yojson = timestamp_epoch_seconds_to_yojson

let secret_list_entry_to_yojson (x : secret_list_entry) =
  assoc_to_yojson
    [
      ("PrimaryRegion", option_to_yojson region_type_to_yojson x.primary_region);
      ("CreatedDate", option_to_yojson timestamp_type_to_yojson x.created_date);
      ("OwningService", option_to_yojson owning_service_type_to_yojson x.owning_service);
      ( "SecretVersionsToStages",
        option_to_yojson secret_versions_to_stages_map_type_to_yojson x.secret_versions_to_stages );
      ("Tags", option_to_yojson tag_list_type_to_yojson x.tags);
      ("NextRotationDate", option_to_yojson next_rotation_date_type_to_yojson x.next_rotation_date);
      ("DeletedDate", option_to_yojson deleted_date_type_to_yojson x.deleted_date);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("LastChangedDate", option_to_yojson last_changed_date_type_to_yojson x.last_changed_date);
      ("LastRotatedDate", option_to_yojson last_rotated_date_type_to_yojson x.last_rotated_date);
      ( "ExternalSecretRotationRoleArn",
        option_to_yojson role_arn_type_to_yojson x.external_secret_rotation_role_arn );
      ( "ExternalSecretRotationMetadata",
        option_to_yojson external_secret_rotation_metadata_type_to_yojson
          x.external_secret_rotation_metadata );
      ("RotationRules", option_to_yojson rotation_rules_type_to_yojson x.rotation_rules);
      ( "RotationLambdaARN",
        option_to_yojson rotation_lambda_arn_type_to_yojson x.rotation_lambda_ar_n );
      ("RotationEnabled", option_to_yojson rotation_enabled_type_to_yojson x.rotation_enabled);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let secret_list_type_to_yojson tree = list_to_yojson secret_list_entry_to_yojson tree

let list_secrets_response_to_yojson (x : list_secrets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("SecretList", option_to_yojson secret_list_type_to_yojson x.secret_list);
    ]

let filter_name_string_type_to_yojson (x : filter_name_string_type) =
  match x with
  | All -> `String "all"
  | Owning_service -> `String "owning-service"
  | Primary_region -> `String "primary-region"
  | Tag_value -> `String "tag-value"
  | Tag_key -> `String "tag-key"
  | Name -> `String "name"
  | Description -> `String "description"

let filter_value_string_type_to_yojson = string_to_yojson

let filter_values_string_list_to_yojson tree =
  list_to_yojson filter_value_string_type_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson filter_values_string_list_to_yojson x.values);
      ("Key", option_to_yojson filter_name_string_type_to_yojson x.key);
    ]

let filters_list_type_to_yojson tree = list_to_yojson filter_to_yojson tree

let sort_order_type_to_yojson (x : sort_order_type) =
  match x with Desc -> `String "desc" | Asc -> `String "asc"

let sort_by_type_to_yojson (x : sort_by_type) =
  match x with
  | Name -> `String "name"
  | Last_changed_date -> `String "last-changed-date"
  | Last_accessed_date -> `String "last-accessed-date"
  | Created_date -> `String "created-date"

let list_secrets_request_to_yojson (x : list_secrets_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson sort_by_type_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("Filters", option_to_yojson filters_list_type_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_type_to_yojson x.max_results);
      ("IncludePlannedDeletion", option_to_yojson boolean_type_to_yojson x.include_planned_deletion);
    ]

let get_secret_value_response_to_yojson (x : get_secret_value_response) =
  assoc_to_yojson
    [
      ("CreatedDate", option_to_yojson created_date_type_to_yojson x.created_date);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let get_secret_value_request_to_yojson (x : get_secret_value_request) =
  assoc_to_yojson
    [
      ("VersionStage", option_to_yojson secret_version_stage_type_to_yojson x.version_stage);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("ResourcePolicy", option_to_yojson non_empty_resource_policy_type_to_yojson x.resource_policy);
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let random_password_type_to_yojson = string_to_yojson

let get_random_password_response_to_yojson (x : get_random_password_response) =
  assoc_to_yojson
    [ ("RandomPassword", option_to_yojson random_password_type_to_yojson x.random_password) ]

let password_length_type_to_yojson = long_to_yojson
let exclude_characters_type_to_yojson = string_to_yojson
let exclude_numbers_type_to_yojson = bool_to_yojson
let exclude_punctuation_type_to_yojson = bool_to_yojson
let exclude_uppercase_type_to_yojson = bool_to_yojson
let exclude_lowercase_type_to_yojson = bool_to_yojson
let include_space_type_to_yojson = bool_to_yojson
let require_each_included_type_type_to_yojson = bool_to_yojson

let get_random_password_request_to_yojson (x : get_random_password_request) =
  assoc_to_yojson
    [
      ( "RequireEachIncludedType",
        option_to_yojson require_each_included_type_type_to_yojson x.require_each_included_type );
      ("IncludeSpace", option_to_yojson include_space_type_to_yojson x.include_space);
      ("ExcludeLowercase", option_to_yojson exclude_lowercase_type_to_yojson x.exclude_lowercase);
      ("ExcludeUppercase", option_to_yojson exclude_uppercase_type_to_yojson x.exclude_uppercase);
      ( "ExcludePunctuation",
        option_to_yojson exclude_punctuation_type_to_yojson x.exclude_punctuation );
      ("ExcludeNumbers", option_to_yojson exclude_numbers_type_to_yojson x.exclude_numbers);
      ("ExcludeCharacters", option_to_yojson exclude_characters_type_to_yojson x.exclude_characters);
      ("PasswordLength", option_to_yojson password_length_type_to_yojson x.password_length);
    ]

let describe_secret_response_to_yojson (x : describe_secret_response) =
  assoc_to_yojson
    [
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
      ("PrimaryRegion", option_to_yojson region_type_to_yojson x.primary_region);
      ("CreatedDate", option_to_yojson timestamp_type_to_yojson x.created_date);
      ("OwningService", option_to_yojson owning_service_type_to_yojson x.owning_service);
      ( "VersionIdsToStages",
        option_to_yojson secret_versions_to_stages_map_type_to_yojson x.version_ids_to_stages );
      ("Tags", option_to_yojson tag_list_type_to_yojson x.tags);
      ("NextRotationDate", option_to_yojson next_rotation_date_type_to_yojson x.next_rotation_date);
      ("DeletedDate", option_to_yojson deleted_date_type_to_yojson x.deleted_date);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("LastChangedDate", option_to_yojson last_changed_date_type_to_yojson x.last_changed_date);
      ("LastRotatedDate", option_to_yojson last_rotated_date_type_to_yojson x.last_rotated_date);
      ( "ExternalSecretRotationRoleArn",
        option_to_yojson role_arn_type_to_yojson x.external_secret_rotation_role_arn );
      ( "ExternalSecretRotationMetadata",
        option_to_yojson external_secret_rotation_metadata_type_to_yojson
          x.external_secret_rotation_metadata );
      ("RotationRules", option_to_yojson rotation_rules_type_to_yojson x.rotation_rules);
      ( "RotationLambdaARN",
        option_to_yojson rotation_lambda_arn_type_to_yojson x.rotation_lambda_ar_n );
      ("RotationEnabled", option_to_yojson rotation_enabled_type_to_yojson x.rotation_enabled);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let describe_secret_request_to_yojson (x : describe_secret_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let deletion_date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let delete_secret_response_to_yojson (x : delete_secret_response) =
  assoc_to_yojson
    [
      ("DeletionDate", option_to_yojson deletion_date_type_to_yojson x.deletion_date);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let recovery_window_in_days_type_to_yojson = long_to_yojson

let delete_secret_request_to_yojson (x : delete_secret_request) =
  assoc_to_yojson
    [
      ( "ForceDeleteWithoutRecovery",
        option_to_yojson boolean_type_to_yojson x.force_delete_without_recovery );
      ( "RecoveryWindowInDays",
        option_to_yojson recovery_window_in_days_type_to_yojson x.recovery_window_in_days );
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
    ]

let delete_resource_policy_response_to_yojson (x : delete_resource_policy_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let create_secret_response_to_yojson (x : create_secret_response) =
  assoc_to_yojson
    [
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let create_secret_request_to_yojson (x : create_secret_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
      ( "ForceOverwriteReplicaSecret",
        option_to_yojson boolean_type_to_yojson x.force_overwrite_replica_secret );
      ( "AddReplicaRegions",
        option_to_yojson add_replica_region_list_type_to_yojson x.add_replica_regions );
      ("Tags", option_to_yojson tag_list_type_to_yojson x.tags);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Name", Some (name_type_to_yojson x.name));
    ]

let cancel_rotate_secret_response_to_yojson (x : cancel_rotate_secret_response) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let cancel_rotate_secret_request_to_yojson (x : cancel_rotate_secret_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let secret_value_entry_to_yojson (x : secret_value_entry) =
  assoc_to_yojson
    [
      ("CreatedDate", option_to_yojson created_date_type_to_yojson x.created_date);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
    ]

let secret_values_type_to_yojson tree = list_to_yojson secret_value_entry_to_yojson tree
let error_code_to_yojson = string_to_yojson

let api_error_type_to_yojson (x : api_error_type) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("SecretId", option_to_yojson secret_id_type_to_yojson x.secret_id);
    ]

let api_error_list_type_to_yojson tree = list_to_yojson api_error_type_to_yojson tree

let batch_get_secret_value_response_to_yojson (x : batch_get_secret_value_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson api_error_list_type_to_yojson x.errors);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("SecretValues", option_to_yojson secret_values_type_to_yojson x.secret_values);
    ]

let secret_id_list_type_to_yojson tree = list_to_yojson secret_id_type_to_yojson tree
let max_results_batch_type_to_yojson = int_to_yojson

let batch_get_secret_value_request_to_yojson (x : batch_get_secret_value_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_batch_type_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_list_type_to_yojson x.filters);
      ("SecretIdList", option_to_yojson secret_id_list_type_to_yojson x.secret_id_list);
    ]
