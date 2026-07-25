open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson
let secret_id_type_to_yojson = string_to_yojson

let api_error_type_to_yojson (x : api_error_type) =
  assoc_to_yojson
    [
      ("SecretId", option_to_yojson secret_id_type_to_yojson x.secret_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let api_error_list_type_to_yojson tree = list_to_yojson api_error_type_to_yojson tree
let kms_key_id_type_to_yojson = string_to_yojson
let region_type_to_yojson = string_to_yojson

let replica_region_type_to_yojson (x : replica_region_type) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson region_type_to_yojson x.region);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
    ]

let add_replica_region_list_type_to_yojson tree = list_to_yojson replica_region_type_to_yojson tree
let automatically_rotate_after_days_type_to_yojson = long_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let decryption_failure_to_yojson (x : decryption_failure) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let next_token_type_to_yojson = string_to_yojson
let created_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let secret_version_stage_type_to_yojson = string_to_yojson

let secret_version_stages_type_to_yojson tree =
  list_to_yojson secret_version_stage_type_to_yojson tree

let secret_string_type_to_yojson = string_to_yojson
let secret_binary_type_to_yojson = blob_to_yojson
let secret_version_id_type_to_yojson = string_to_yojson
let secret_name_type_to_yojson = string_to_yojson
let secret_arn_type_to_yojson = string_to_yojson

let secret_value_entry_to_yojson (x : secret_value_entry) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("CreatedDate", option_to_yojson created_date_type_to_yojson x.created_date);
    ]

let secret_values_type_to_yojson tree = list_to_yojson secret_value_entry_to_yojson tree

let batch_get_secret_value_response_to_yojson (x : batch_get_secret_value_response) =
  assoc_to_yojson
    [
      ("SecretValues", option_to_yojson secret_values_type_to_yojson x.secret_values);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("Errors", option_to_yojson api_error_list_type_to_yojson x.errors);
    ]

let max_results_batch_type_to_yojson = int_to_yojson
let filter_value_string_type_to_yojson = string_to_yojson

let filter_values_string_list_to_yojson tree =
  list_to_yojson filter_value_string_type_to_yojson tree

let filter_name_string_type_to_yojson (x : filter_name_string_type) =
  match x with
  | Description -> `String "description"
  | Name -> `String "name"
  | Tag_key -> `String "tag-key"
  | Tag_value -> `String "tag-value"
  | Primary_region -> `String "primary-region"
  | Owning_service -> `String "owning-service"
  | All -> `String "all"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson filter_name_string_type_to_yojson x.key);
      ("Values", option_to_yojson filter_values_string_list_to_yojson x.values);
    ]

let filters_list_type_to_yojson tree = list_to_yojson filter_to_yojson tree
let secret_id_list_type_to_yojson tree = list_to_yojson secret_id_type_to_yojson tree

let batch_get_secret_value_request_to_yojson (x : batch_get_secret_value_request) =
  assoc_to_yojson
    [
      ("SecretIdList", option_to_yojson secret_id_list_type_to_yojson x.secret_id_list);
      ("Filters", option_to_yojson filters_list_type_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_batch_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
    ]

let boolean_type_to_yojson = bool_to_yojson

let cancel_rotate_secret_response_to_yojson (x : cancel_rotate_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
    ]

let cancel_rotate_secret_request_to_yojson (x : cancel_rotate_secret_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let client_request_token_type_to_yojson = string_to_yojson

let resource_exists_exception_to_yojson (x : resource_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let precondition_not_met_exception_to_yojson (x : precondition_not_met_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let malformed_policy_document_exception_to_yojson (x : malformed_policy_document_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let encryption_failure_to_yojson (x : encryption_failure) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let last_accessed_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let status_message_type_to_yojson = string_to_yojson

let status_type_to_yojson (x : status_type) =
  match x with
  | InSync -> `String "InSync"
  | Failed -> `String "Failed"
  | InProgress -> `String "InProgress"

let replication_status_type_to_yojson (x : replication_status_type) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson region_type_to_yojson x.region);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("Status", option_to_yojson status_type_to_yojson x.status);
      ("StatusMessage", option_to_yojson status_message_type_to_yojson x.status_message);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
    ]

let replication_status_list_type_to_yojson tree =
  list_to_yojson replication_status_type_to_yojson tree

let create_secret_response_to_yojson (x : create_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
    ]

let medea_type_type_to_yojson = string_to_yojson
let tag_value_type_to_yojson = string_to_yojson
let tag_key_type_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_type_to_yojson x.key);
      ("Value", option_to_yojson tag_value_type_to_yojson x.value);
    ]

let tag_list_type_to_yojson tree = list_to_yojson tag_to_yojson tree
let description_type_to_yojson = string_to_yojson
let name_type_to_yojson = string_to_yojson

let create_secret_request_to_yojson (x : create_secret_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_type_to_yojson x.name));
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("Tags", option_to_yojson tag_list_type_to_yojson x.tags);
      ( "AddReplicaRegions",
        option_to_yojson add_replica_region_list_type_to_yojson x.add_replica_regions );
      ( "ForceOverwriteReplicaSecret",
        option_to_yojson boolean_type_to_yojson x.force_overwrite_replica_secret );
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
    ]

let delete_resource_policy_response_to_yojson (x : delete_resource_policy_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson name_type_to_yojson x.name);
    ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let deletion_date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let delete_secret_response_to_yojson (x : delete_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("DeletionDate", option_to_yojson deletion_date_type_to_yojson x.deletion_date);
    ]

let recovery_window_in_days_type_to_yojson = long_to_yojson

let delete_secret_request_to_yojson (x : delete_secret_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ( "RecoveryWindowInDays",
        option_to_yojson recovery_window_in_days_type_to_yojson x.recovery_window_in_days );
      ( "ForceDeleteWithoutRecovery",
        option_to_yojson boolean_type_to_yojson x.force_delete_without_recovery );
    ]

let deleted_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let timestamp_type_to_yojson = timestamp_epoch_seconds_to_yojson
let owning_service_type_to_yojson = string_to_yojson

let secret_versions_to_stages_map_type_to_yojson tree =
  map_to_yojson secret_version_id_type_to_yojson secret_version_stages_type_to_yojson tree

let next_rotation_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let last_changed_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let last_rotated_date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let role_arn_type_to_yojson = string_to_yojson
let external_secret_rotation_metadata_item_value_type_to_yojson = string_to_yojson
let external_secret_rotation_metadata_item_key_type_to_yojson = string_to_yojson

let external_secret_rotation_metadata_item_to_yojson (x : external_secret_rotation_metadata_item) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson external_secret_rotation_metadata_item_key_type_to_yojson x.key);
      ("Value", option_to_yojson external_secret_rotation_metadata_item_value_type_to_yojson x.value);
    ]

let external_secret_rotation_metadata_type_to_yojson tree =
  list_to_yojson external_secret_rotation_metadata_item_to_yojson tree

let schedule_expression_type_to_yojson = string_to_yojson
let duration_type_to_yojson = string_to_yojson

let rotation_rules_type_to_yojson (x : rotation_rules_type) =
  assoc_to_yojson
    [
      ( "AutomaticallyAfterDays",
        option_to_yojson automatically_rotate_after_days_type_to_yojson x.automatically_after_days
      );
      ("Duration", option_to_yojson duration_type_to_yojson x.duration);
      ( "ScheduleExpression",
        option_to_yojson schedule_expression_type_to_yojson x.schedule_expression );
    ]

let rotation_lambda_arn_type_to_yojson = string_to_yojson
let rotation_enabled_type_to_yojson = bool_to_yojson

let describe_secret_response_to_yojson (x : describe_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("RotationEnabled", option_to_yojson rotation_enabled_type_to_yojson x.rotation_enabled);
      ( "RotationLambdaARN",
        option_to_yojson rotation_lambda_arn_type_to_yojson x.rotation_lambda_ar_n );
      ("RotationRules", option_to_yojson rotation_rules_type_to_yojson x.rotation_rules);
      ( "ExternalSecretRotationMetadata",
        option_to_yojson external_secret_rotation_metadata_type_to_yojson
          x.external_secret_rotation_metadata );
      ( "ExternalSecretRotationRoleArn",
        option_to_yojson role_arn_type_to_yojson x.external_secret_rotation_role_arn );
      ("LastRotatedDate", option_to_yojson last_rotated_date_type_to_yojson x.last_rotated_date);
      ("LastChangedDate", option_to_yojson last_changed_date_type_to_yojson x.last_changed_date);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("DeletedDate", option_to_yojson deleted_date_type_to_yojson x.deleted_date);
      ("NextRotationDate", option_to_yojson next_rotation_date_type_to_yojson x.next_rotation_date);
      ("Tags", option_to_yojson tag_list_type_to_yojson x.tags);
      ( "VersionIdsToStages",
        option_to_yojson secret_versions_to_stages_map_type_to_yojson x.version_ids_to_stages );
      ("OwningService", option_to_yojson owning_service_type_to_yojson x.owning_service);
      ("CreatedDate", option_to_yojson timestamp_type_to_yojson x.created_date);
      ("PrimaryRegion", option_to_yojson region_type_to_yojson x.primary_region);
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
    ]

let describe_secret_request_to_yojson (x : describe_secret_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let exclude_characters_type_to_yojson = string_to_yojson
let exclude_lowercase_type_to_yojson = bool_to_yojson
let exclude_numbers_type_to_yojson = bool_to_yojson
let exclude_punctuation_type_to_yojson = bool_to_yojson
let exclude_uppercase_type_to_yojson = bool_to_yojson
let random_password_type_to_yojson = string_to_yojson

let get_random_password_response_to_yojson (x : get_random_password_response) =
  assoc_to_yojson
    [ ("RandomPassword", option_to_yojson random_password_type_to_yojson x.random_password) ]

let require_each_included_type_type_to_yojson = bool_to_yojson
let include_space_type_to_yojson = bool_to_yojson
let password_length_type_to_yojson = long_to_yojson

let get_random_password_request_to_yojson (x : get_random_password_request) =
  assoc_to_yojson
    [
      ("PasswordLength", option_to_yojson password_length_type_to_yojson x.password_length);
      ("ExcludeCharacters", option_to_yojson exclude_characters_type_to_yojson x.exclude_characters);
      ("ExcludeNumbers", option_to_yojson exclude_numbers_type_to_yojson x.exclude_numbers);
      ( "ExcludePunctuation",
        option_to_yojson exclude_punctuation_type_to_yojson x.exclude_punctuation );
      ("ExcludeUppercase", option_to_yojson exclude_uppercase_type_to_yojson x.exclude_uppercase);
      ("ExcludeLowercase", option_to_yojson exclude_lowercase_type_to_yojson x.exclude_lowercase);
      ("IncludeSpace", option_to_yojson include_space_type_to_yojson x.include_space);
      ( "RequireEachIncludedType",
        option_to_yojson require_each_included_type_type_to_yojson x.require_each_included_type );
    ]

let non_empty_resource_policy_type_to_yojson = string_to_yojson

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson name_type_to_yojson x.name);
      ("ResourcePolicy", option_to_yojson non_empty_resource_policy_type_to_yojson x.resource_policy);
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let get_secret_value_response_to_yojson (x : get_secret_value_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("CreatedDate", option_to_yojson created_date_type_to_yojson x.created_date);
    ]

let get_secret_value_request_to_yojson (x : get_secret_value_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("VersionStage", option_to_yojson secret_version_stage_type_to_yojson x.version_stage);
    ]

let kms_key_id_list_type_to_yojson tree = list_to_yojson kms_key_id_type_to_yojson tree

let secret_versions_list_entry_to_yojson (x : secret_versions_list_entry) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("CreatedDate", option_to_yojson created_date_type_to_yojson x.created_date);
      ("KmsKeyIds", option_to_yojson kms_key_id_list_type_to_yojson x.kms_key_ids);
    ]

let secret_versions_list_type_to_yojson tree =
  list_to_yojson secret_versions_list_entry_to_yojson tree

let list_secret_version_ids_response_to_yojson (x : list_secret_version_ids_response) =
  assoc_to_yojson
    [
      ("Versions", option_to_yojson secret_versions_list_type_to_yojson x.versions);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
    ]

let max_results_type_to_yojson = int_to_yojson

let list_secret_version_ids_request_to_yojson (x : list_secret_version_ids_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("MaxResults", option_to_yojson max_results_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("IncludeDeprecated", option_to_yojson boolean_type_to_yojson x.include_deprecated);
    ]

let secret_list_entry_to_yojson (x : secret_list_entry) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("RotationEnabled", option_to_yojson rotation_enabled_type_to_yojson x.rotation_enabled);
      ( "RotationLambdaARN",
        option_to_yojson rotation_lambda_arn_type_to_yojson x.rotation_lambda_ar_n );
      ("RotationRules", option_to_yojson rotation_rules_type_to_yojson x.rotation_rules);
      ( "ExternalSecretRotationMetadata",
        option_to_yojson external_secret_rotation_metadata_type_to_yojson
          x.external_secret_rotation_metadata );
      ( "ExternalSecretRotationRoleArn",
        option_to_yojson role_arn_type_to_yojson x.external_secret_rotation_role_arn );
      ("LastRotatedDate", option_to_yojson last_rotated_date_type_to_yojson x.last_rotated_date);
      ("LastChangedDate", option_to_yojson last_changed_date_type_to_yojson x.last_changed_date);
      ("LastAccessedDate", option_to_yojson last_accessed_date_type_to_yojson x.last_accessed_date);
      ("DeletedDate", option_to_yojson deleted_date_type_to_yojson x.deleted_date);
      ("NextRotationDate", option_to_yojson next_rotation_date_type_to_yojson x.next_rotation_date);
      ("Tags", option_to_yojson tag_list_type_to_yojson x.tags);
      ( "SecretVersionsToStages",
        option_to_yojson secret_versions_to_stages_map_type_to_yojson x.secret_versions_to_stages );
      ("OwningService", option_to_yojson owning_service_type_to_yojson x.owning_service);
      ("CreatedDate", option_to_yojson timestamp_type_to_yojson x.created_date);
      ("PrimaryRegion", option_to_yojson region_type_to_yojson x.primary_region);
    ]

let secret_list_type_to_yojson tree = list_to_yojson secret_list_entry_to_yojson tree

let list_secrets_response_to_yojson (x : list_secrets_response) =
  assoc_to_yojson
    [
      ("SecretList", option_to_yojson secret_list_type_to_yojson x.secret_list);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
    ]

let sort_by_type_to_yojson (x : sort_by_type) =
  match x with
  | Created_date -> `String "created-date"
  | Last_accessed_date -> `String "last-accessed-date"
  | Last_changed_date -> `String "last-changed-date"
  | Name -> `String "name"

let sort_order_type_to_yojson (x : sort_order_type) =
  match x with Asc -> `String "asc" | Desc -> `String "desc"

let list_secrets_request_to_yojson (x : list_secrets_request) =
  assoc_to_yojson
    [
      ("IncludePlannedDeletion", option_to_yojson boolean_type_to_yojson x.include_planned_deletion);
      ("MaxResults", option_to_yojson max_results_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_type_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_list_type_to_yojson x.filters);
      ("SortOrder", option_to_yojson sort_order_type_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_type_to_yojson x.sort_by);
    ]

let public_policy_exception_to_yojson (x : public_policy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson name_type_to_yojson x.name);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("ResourcePolicy", Some (non_empty_resource_policy_type_to_yojson x.resource_policy));
      ("BlockPublicPolicy", option_to_yojson boolean_type_to_yojson x.block_public_policy);
    ]

let put_secret_value_response_to_yojson (x : put_secret_value_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
    ]

let rotation_token_type_to_yojson = string_to_yojson

let put_secret_value_request_to_yojson (x : put_secret_value_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("VersionStages", option_to_yojson secret_version_stages_type_to_yojson x.version_stages);
      ("RotationToken", option_to_yojson rotation_token_type_to_yojson x.rotation_token);
    ]

let remove_regions_from_replication_response_to_yojson
    (x : remove_regions_from_replication_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
    ]

let remove_replica_region_list_type_to_yojson tree = list_to_yojson region_type_to_yojson tree

let remove_regions_from_replication_request_to_yojson (x : remove_regions_from_replication_request)
    =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ( "RemoveReplicaRegions",
        Some (remove_replica_region_list_type_to_yojson x.remove_replica_regions) );
    ]

let replicate_secret_to_regions_response_to_yojson (x : replicate_secret_to_regions_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ( "ReplicationStatus",
        option_to_yojson replication_status_list_type_to_yojson x.replication_status );
    ]

let replicate_secret_to_regions_request_to_yojson (x : replicate_secret_to_regions_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("AddReplicaRegions", Some (add_replica_region_list_type_to_yojson x.add_replica_regions));
      ( "ForceOverwriteReplicaSecret",
        option_to_yojson boolean_type_to_yojson x.force_overwrite_replica_secret );
    ]

let restore_secret_response_to_yojson (x : restore_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
    ]

let restore_secret_request_to_yojson (x : restore_secret_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let rotate_secret_response_to_yojson (x : rotate_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
    ]

let rotate_secret_request_to_yojson (x : rotate_secret_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "RotationLambdaARN",
        option_to_yojson rotation_lambda_arn_type_to_yojson x.rotation_lambda_ar_n );
      ("RotationRules", option_to_yojson rotation_rules_type_to_yojson x.rotation_rules);
      ( "ExternalSecretRotationMetadata",
        option_to_yojson external_secret_rotation_metadata_type_to_yojson
          x.external_secret_rotation_metadata );
      ( "ExternalSecretRotationRoleArn",
        option_to_yojson role_arn_type_to_yojson x.external_secret_rotation_role_arn );
      ("RotateImmediately", option_to_yojson boolean_type_to_yojson x.rotate_immediately);
    ]

let stop_replication_to_replica_response_to_yojson (x : stop_replication_to_replica_response) =
  assoc_to_yojson [ ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n) ]

let stop_replication_to_replica_request_to_yojson (x : stop_replication_to_replica_request) =
  assoc_to_yojson [ ("SecretId", Some (secret_id_type_to_yojson x.secret_id)) ]

let tag_key_list_type_to_yojson tree = list_to_yojson tag_key_type_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("Tags", Some (tag_list_type_to_yojson x.tags));
    ]

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("TagKeys", Some (tag_key_list_type_to_yojson x.tag_keys));
    ]

let update_secret_response_to_yojson (x : update_secret_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
      ("VersionId", option_to_yojson secret_version_id_type_to_yojson x.version_id);
    ]

let update_secret_request_to_yojson (x : update_secret_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_type_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("KmsKeyId", option_to_yojson kms_key_id_type_to_yojson x.kms_key_id);
      ("SecretBinary", option_to_yojson secret_binary_type_to_yojson x.secret_binary);
      ("SecretString", option_to_yojson secret_string_type_to_yojson x.secret_string);
      ("Type", option_to_yojson medea_type_type_to_yojson x.type_);
    ]

let update_secret_version_stage_response_to_yojson (x : update_secret_version_stage_response) =
  assoc_to_yojson
    [
      ("ARN", option_to_yojson secret_arn_type_to_yojson x.ar_n);
      ("Name", option_to_yojson secret_name_type_to_yojson x.name);
    ]

let update_secret_version_stage_request_to_yojson (x : update_secret_version_stage_request) =
  assoc_to_yojson
    [
      ("SecretId", Some (secret_id_type_to_yojson x.secret_id));
      ("VersionStage", Some (secret_version_stage_type_to_yojson x.version_stage));
      ( "RemoveFromVersionId",
        option_to_yojson secret_version_id_type_to_yojson x.remove_from_version_id );
      ("MoveToVersionId", option_to_yojson secret_version_id_type_to_yojson x.move_to_version_id);
    ]

let validation_errors_entry_to_yojson (x : validation_errors_entry) =
  assoc_to_yojson
    [
      ("CheckName", option_to_yojson name_type_to_yojson x.check_name);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let validation_errors_type_to_yojson tree = list_to_yojson validation_errors_entry_to_yojson tree

let validate_resource_policy_response_to_yojson (x : validate_resource_policy_response) =
  assoc_to_yojson
    [
      ("PolicyValidationPassed", option_to_yojson boolean_type_to_yojson x.policy_validation_passed);
      ("ValidationErrors", option_to_yojson validation_errors_type_to_yojson x.validation_errors);
    ]

let validate_resource_policy_request_to_yojson (x : validate_resource_policy_request) =
  assoc_to_yojson
    [
      ("SecretId", option_to_yojson secret_id_type_to_yojson x.secret_id);
      ("ResourcePolicy", Some (non_empty_resource_policy_type_to_yojson x.resource_policy));
    ]
