open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson
let error_code_of_yojson = string_of_yojson
let secret_id_type_of_yojson = string_of_yojson

let api_error_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = option_of_yojson (value_for_key secret_id_type_of_yojson "SecretId") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : api_error_type)

let api_error_list_type_of_yojson tree path = list_of_yojson api_error_type_of_yojson tree path
let kms_key_id_type_of_yojson = string_of_yojson
let region_type_of_yojson = string_of_yojson

let replica_region_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key region_type_of_yojson "Region") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_type_of_yojson "KmsKeyId") _list path;
   }
    : replica_region_type)

let add_replica_region_list_type_of_yojson tree path =
  list_of_yojson replica_region_type_of_yojson tree path

let automatically_rotate_after_days_type_of_yojson = long_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_request_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameter_exception)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let internal_service_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_service_error)

let decryption_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : decryption_failure)

let next_token_type_of_yojson = string_of_yojson
let created_date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let secret_version_stage_type_of_yojson = string_of_yojson

let secret_version_stages_type_of_yojson tree path =
  list_of_yojson secret_version_stage_type_of_yojson tree path

let secret_string_type_of_yojson = string_of_yojson
let secret_binary_type_of_yojson = blob_of_yojson
let secret_version_id_type_of_yojson = string_of_yojson
let secret_name_type_of_yojson = string_of_yojson
let secret_arn_type_of_yojson = string_of_yojson

let secret_value_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
     secret_binary =
       option_of_yojson (value_for_key secret_binary_type_of_yojson "SecretBinary") _list path;
     secret_string =
       option_of_yojson (value_for_key secret_string_type_of_yojson "SecretString") _list path;
     version_stages =
       option_of_yojson
         (value_for_key secret_version_stages_type_of_yojson "VersionStages")
         _list path;
     created_date =
       option_of_yojson (value_for_key created_date_type_of_yojson "CreatedDate") _list path;
   }
    : secret_value_entry)

let secret_values_type_of_yojson tree path = list_of_yojson secret_value_entry_of_yojson tree path

let batch_get_secret_value_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_values =
       option_of_yojson (value_for_key secret_values_type_of_yojson "SecretValues") _list path;
     next_token = option_of_yojson (value_for_key next_token_type_of_yojson "NextToken") _list path;
     errors = option_of_yojson (value_for_key api_error_list_type_of_yojson "Errors") _list path;
   }
    : batch_get_secret_value_response)

let max_results_batch_type_of_yojson = int_of_yojson
let filter_value_string_type_of_yojson = string_of_yojson

let filter_values_string_list_of_yojson tree path =
  list_of_yojson filter_value_string_type_of_yojson tree path

let filter_name_string_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "description" -> Description
    | `String "name" -> Name
    | `String "tag-key" -> Tag_key
    | `String "tag-value" -> Tag_value
    | `String "primary-region" -> Primary_region
    | `String "owning-service" -> Owning_service
    | `String "all" -> All
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FilterNameStringType" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterNameStringType")
     : filter_name_string_type)
    : filter_name_string_type)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key filter_name_string_type_of_yojson "Key") _list path;
     values =
       option_of_yojson (value_for_key filter_values_string_list_of_yojson "Values") _list path;
   }
    : filter)

let filters_list_type_of_yojson tree path = list_of_yojson filter_of_yojson tree path
let secret_id_list_type_of_yojson tree path = list_of_yojson secret_id_type_of_yojson tree path

let batch_get_secret_value_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id_list =
       option_of_yojson (value_for_key secret_id_list_type_of_yojson "SecretIdList") _list path;
     filters = option_of_yojson (value_for_key filters_list_type_of_yojson "Filters") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_batch_type_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_type_of_yojson "NextToken") _list path;
   }
    : batch_get_secret_value_request)

let boolean_type_of_yojson = bool_of_yojson

let cancel_rotate_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
   }
    : cancel_rotate_secret_response)

let cancel_rotate_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path }
    : cancel_rotate_secret_request)

let client_request_token_type_of_yojson = string_of_yojson

let resource_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_exists_exception)

let precondition_not_met_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : precondition_not_met_exception)

let malformed_policy_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : malformed_policy_document_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let encryption_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : encryption_failure)

let last_accessed_date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let status_message_type_of_yojson = string_of_yojson

let status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "InSync" -> InSync
    | `String "Failed" -> Failed
    | `String "InProgress" -> InProgress
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusType")
     : status_type)
    : status_type)

let replication_status_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key region_type_of_yojson "Region") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_type_of_yojson "KmsKeyId") _list path;
     status = option_of_yojson (value_for_key status_type_of_yojson "Status") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_type_of_yojson "StatusMessage") _list path;
     last_accessed_date =
       option_of_yojson
         (value_for_key last_accessed_date_type_of_yojson "LastAccessedDate")
         _list path;
   }
    : replication_status_type)

let replication_status_list_type_of_yojson tree path =
  list_of_yojson replication_status_type_of_yojson tree path

let create_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
     replication_status =
       option_of_yojson
         (value_for_key replication_status_list_type_of_yojson "ReplicationStatus")
         _list path;
   }
    : create_secret_response)

let medea_type_type_of_yojson = string_of_yojson
let tag_value_type_of_yojson = string_of_yojson
let tag_key_type_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_type_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key tag_value_type_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_type_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let description_type_of_yojson = string_of_yojson
let name_type_of_yojson = string_of_yojson

let create_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_type_of_yojson "Name" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_type_of_yojson "ClientRequestToken")
         _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_type_of_yojson "KmsKeyId") _list path;
     secret_binary =
       option_of_yojson (value_for_key secret_binary_type_of_yojson "SecretBinary") _list path;
     secret_string =
       option_of_yojson (value_for_key secret_string_type_of_yojson "SecretString") _list path;
     tags = option_of_yojson (value_for_key tag_list_type_of_yojson "Tags") _list path;
     add_replica_regions =
       option_of_yojson
         (value_for_key add_replica_region_list_type_of_yojson "AddReplicaRegions")
         _list path;
     force_overwrite_replica_secret =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "ForceOverwriteReplicaSecret")
         _list path;
     type_ = option_of_yojson (value_for_key medea_type_type_of_yojson "Type") _list path;
   }
    : create_secret_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
   }
    : delete_resource_policy_response)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path }
    : delete_resource_policy_request)

let deletion_date_type_of_yojson = timestamp_epoch_seconds_of_yojson

let delete_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     deletion_date =
       option_of_yojson (value_for_key deletion_date_type_of_yojson "DeletionDate") _list path;
   }
    : delete_secret_response)

let recovery_window_in_days_type_of_yojson = long_of_yojson

let delete_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     recovery_window_in_days =
       option_of_yojson
         (value_for_key recovery_window_in_days_type_of_yojson "RecoveryWindowInDays")
         _list path;
     force_delete_without_recovery =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "ForceDeleteWithoutRecovery")
         _list path;
   }
    : delete_secret_request)

let deleted_date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let timestamp_type_of_yojson = timestamp_epoch_seconds_of_yojson
let owning_service_type_of_yojson = string_of_yojson

let secret_versions_to_stages_map_type_of_yojson tree path =
  map_of_yojson secret_version_id_type_of_yojson secret_version_stages_type_of_yojson tree path

let next_rotation_date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let last_changed_date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let last_rotated_date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let role_arn_type_of_yojson = string_of_yojson
let external_secret_rotation_metadata_item_value_type_of_yojson = string_of_yojson
let external_secret_rotation_metadata_item_key_type_of_yojson = string_of_yojson

let external_secret_rotation_metadata_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key =
       option_of_yojson
         (value_for_key external_secret_rotation_metadata_item_key_type_of_yojson "Key")
         _list path;
     value =
       option_of_yojson
         (value_for_key external_secret_rotation_metadata_item_value_type_of_yojson "Value")
         _list path;
   }
    : external_secret_rotation_metadata_item)

let external_secret_rotation_metadata_type_of_yojson tree path =
  list_of_yojson external_secret_rotation_metadata_item_of_yojson tree path

let schedule_expression_type_of_yojson = string_of_yojson
let duration_type_of_yojson = string_of_yojson

let rotation_rules_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatically_after_days =
       option_of_yojson
         (value_for_key automatically_rotate_after_days_type_of_yojson "AutomaticallyAfterDays")
         _list path;
     duration = option_of_yojson (value_for_key duration_type_of_yojson "Duration") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_type_of_yojson "ScheduleExpression")
         _list path;
   }
    : rotation_rules_type)

let rotation_lambda_arn_type_of_yojson = string_of_yojson
let rotation_enabled_type_of_yojson = bool_of_yojson

let describe_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key medea_type_type_of_yojson "Type") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_type_of_yojson "KmsKeyId") _list path;
     rotation_enabled =
       option_of_yojson (value_for_key rotation_enabled_type_of_yojson "RotationEnabled") _list path;
     rotation_lambda_ar_n =
       option_of_yojson
         (value_for_key rotation_lambda_arn_type_of_yojson "RotationLambdaARN")
         _list path;
     rotation_rules =
       option_of_yojson (value_for_key rotation_rules_type_of_yojson "RotationRules") _list path;
     external_secret_rotation_metadata =
       option_of_yojson
         (value_for_key external_secret_rotation_metadata_type_of_yojson
            "ExternalSecretRotationMetadata")
         _list path;
     external_secret_rotation_role_arn =
       option_of_yojson
         (value_for_key role_arn_type_of_yojson "ExternalSecretRotationRoleArn")
         _list path;
     last_rotated_date =
       option_of_yojson
         (value_for_key last_rotated_date_type_of_yojson "LastRotatedDate")
         _list path;
     last_changed_date =
       option_of_yojson
         (value_for_key last_changed_date_type_of_yojson "LastChangedDate")
         _list path;
     last_accessed_date =
       option_of_yojson
         (value_for_key last_accessed_date_type_of_yojson "LastAccessedDate")
         _list path;
     deleted_date =
       option_of_yojson (value_for_key deleted_date_type_of_yojson "DeletedDate") _list path;
     next_rotation_date =
       option_of_yojson
         (value_for_key next_rotation_date_type_of_yojson "NextRotationDate")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_type_of_yojson "Tags") _list path;
     version_ids_to_stages =
       option_of_yojson
         (value_for_key secret_versions_to_stages_map_type_of_yojson "VersionIdsToStages")
         _list path;
     owning_service =
       option_of_yojson (value_for_key owning_service_type_of_yojson "OwningService") _list path;
     created_date =
       option_of_yojson (value_for_key timestamp_type_of_yojson "CreatedDate") _list path;
     primary_region =
       option_of_yojson (value_for_key region_type_of_yojson "PrimaryRegion") _list path;
     replication_status =
       option_of_yojson
         (value_for_key replication_status_list_type_of_yojson "ReplicationStatus")
         _list path;
   }
    : describe_secret_response)

let describe_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path }
    : describe_secret_request)

let exclude_characters_type_of_yojson = string_of_yojson
let exclude_lowercase_type_of_yojson = bool_of_yojson
let exclude_numbers_type_of_yojson = bool_of_yojson
let exclude_punctuation_type_of_yojson = bool_of_yojson
let exclude_uppercase_type_of_yojson = bool_of_yojson
let random_password_type_of_yojson = string_of_yojson

let get_random_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     random_password =
       option_of_yojson (value_for_key random_password_type_of_yojson "RandomPassword") _list path;
   }
    : get_random_password_response)

let require_each_included_type_type_of_yojson = bool_of_yojson
let include_space_type_of_yojson = bool_of_yojson
let password_length_type_of_yojson = long_of_yojson

let get_random_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password_length =
       option_of_yojson (value_for_key password_length_type_of_yojson "PasswordLength") _list path;
     exclude_characters =
       option_of_yojson
         (value_for_key exclude_characters_type_of_yojson "ExcludeCharacters")
         _list path;
     exclude_numbers =
       option_of_yojson (value_for_key exclude_numbers_type_of_yojson "ExcludeNumbers") _list path;
     exclude_punctuation =
       option_of_yojson
         (value_for_key exclude_punctuation_type_of_yojson "ExcludePunctuation")
         _list path;
     exclude_uppercase =
       option_of_yojson
         (value_for_key exclude_uppercase_type_of_yojson "ExcludeUppercase")
         _list path;
     exclude_lowercase =
       option_of_yojson
         (value_for_key exclude_lowercase_type_of_yojson "ExcludeLowercase")
         _list path;
     include_space =
       option_of_yojson (value_for_key include_space_type_of_yojson "IncludeSpace") _list path;
     require_each_included_type =
       option_of_yojson
         (value_for_key require_each_included_type_type_of_yojson "RequireEachIncludedType")
         _list path;
   }
    : get_random_password_request)

let non_empty_resource_policy_type_of_yojson = string_of_yojson

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
     resource_policy =
       option_of_yojson
         (value_for_key non_empty_resource_policy_type_of_yojson "ResourcePolicy")
         _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path }
    : get_resource_policy_request)

let get_secret_value_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
     secret_binary =
       option_of_yojson (value_for_key secret_binary_type_of_yojson "SecretBinary") _list path;
     secret_string =
       option_of_yojson (value_for_key secret_string_type_of_yojson "SecretString") _list path;
     version_stages =
       option_of_yojson
         (value_for_key secret_version_stages_type_of_yojson "VersionStages")
         _list path;
     created_date =
       option_of_yojson (value_for_key created_date_type_of_yojson "CreatedDate") _list path;
   }
    : get_secret_value_response)

let get_secret_value_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
     version_stage =
       option_of_yojson
         (value_for_key secret_version_stage_type_of_yojson "VersionStage")
         _list path;
   }
    : get_secret_value_request)

let kms_key_id_list_type_of_yojson tree path = list_of_yojson kms_key_id_type_of_yojson tree path

let secret_versions_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
     version_stages =
       option_of_yojson
         (value_for_key secret_version_stages_type_of_yojson "VersionStages")
         _list path;
     last_accessed_date =
       option_of_yojson
         (value_for_key last_accessed_date_type_of_yojson "LastAccessedDate")
         _list path;
     created_date =
       option_of_yojson (value_for_key created_date_type_of_yojson "CreatedDate") _list path;
     kms_key_ids =
       option_of_yojson (value_for_key kms_key_id_list_type_of_yojson "KmsKeyIds") _list path;
   }
    : secret_versions_list_entry)

let secret_versions_list_type_of_yojson tree path =
  list_of_yojson secret_versions_list_entry_of_yojson tree path

let list_secret_version_ids_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     versions =
       option_of_yojson (value_for_key secret_versions_list_type_of_yojson "Versions") _list path;
     next_token = option_of_yojson (value_for_key next_token_type_of_yojson "NextToken") _list path;
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
   }
    : list_secret_version_ids_response)

let max_results_type_of_yojson = int_of_yojson

let list_secret_version_ids_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     max_results =
       option_of_yojson (value_for_key max_results_type_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_type_of_yojson "NextToken") _list path;
     include_deprecated =
       option_of_yojson (value_for_key boolean_type_of_yojson "IncludeDeprecated") _list path;
   }
    : list_secret_version_ids_request)

let secret_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key medea_type_type_of_yojson "Type") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_type_of_yojson "KmsKeyId") _list path;
     rotation_enabled =
       option_of_yojson (value_for_key rotation_enabled_type_of_yojson "RotationEnabled") _list path;
     rotation_lambda_ar_n =
       option_of_yojson
         (value_for_key rotation_lambda_arn_type_of_yojson "RotationLambdaARN")
         _list path;
     rotation_rules =
       option_of_yojson (value_for_key rotation_rules_type_of_yojson "RotationRules") _list path;
     external_secret_rotation_metadata =
       option_of_yojson
         (value_for_key external_secret_rotation_metadata_type_of_yojson
            "ExternalSecretRotationMetadata")
         _list path;
     external_secret_rotation_role_arn =
       option_of_yojson
         (value_for_key role_arn_type_of_yojson "ExternalSecretRotationRoleArn")
         _list path;
     last_rotated_date =
       option_of_yojson
         (value_for_key last_rotated_date_type_of_yojson "LastRotatedDate")
         _list path;
     last_changed_date =
       option_of_yojson
         (value_for_key last_changed_date_type_of_yojson "LastChangedDate")
         _list path;
     last_accessed_date =
       option_of_yojson
         (value_for_key last_accessed_date_type_of_yojson "LastAccessedDate")
         _list path;
     deleted_date =
       option_of_yojson (value_for_key deleted_date_type_of_yojson "DeletedDate") _list path;
     next_rotation_date =
       option_of_yojson
         (value_for_key next_rotation_date_type_of_yojson "NextRotationDate")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_type_of_yojson "Tags") _list path;
     secret_versions_to_stages =
       option_of_yojson
         (value_for_key secret_versions_to_stages_map_type_of_yojson "SecretVersionsToStages")
         _list path;
     owning_service =
       option_of_yojson (value_for_key owning_service_type_of_yojson "OwningService") _list path;
     created_date =
       option_of_yojson (value_for_key timestamp_type_of_yojson "CreatedDate") _list path;
     primary_region =
       option_of_yojson (value_for_key region_type_of_yojson "PrimaryRegion") _list path;
   }
    : secret_list_entry)

let secret_list_type_of_yojson tree path = list_of_yojson secret_list_entry_of_yojson tree path

let list_secrets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_list =
       option_of_yojson (value_for_key secret_list_type_of_yojson "SecretList") _list path;
     next_token = option_of_yojson (value_for_key next_token_type_of_yojson "NextToken") _list path;
   }
    : list_secrets_response)

let sort_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "created-date" -> Created_date
    | `String "last-accessed-date" -> Last_accessed_date
    | `String "last-changed-date" -> Last_changed_date
    | `String "name" -> Name
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortByType" value)
    | _ -> raise (deserialize_wrong_type_error path "SortByType")
     : sort_by_type)
    : sort_by_type)

let sort_order_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "asc" -> Asc
    | `String "desc" -> Desc
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrderType" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrderType")
     : sort_order_type)
    : sort_order_type)

let list_secrets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_planned_deletion =
       option_of_yojson (value_for_key boolean_type_of_yojson "IncludePlannedDeletion") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_type_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_type_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_list_type_of_yojson "Filters") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_type_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_type_of_yojson "SortBy") _list path;
   }
    : list_secrets_request)

let public_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : public_policy_exception)

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
   }
    : put_resource_policy_response)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     resource_policy =
       value_for_key non_empty_resource_policy_type_of_yojson "ResourcePolicy" _list path;
     block_public_policy =
       option_of_yojson (value_for_key boolean_type_of_yojson "BlockPublicPolicy") _list path;
   }
    : put_resource_policy_request)

let put_secret_value_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
     version_stages =
       option_of_yojson
         (value_for_key secret_version_stages_type_of_yojson "VersionStages")
         _list path;
   }
    : put_secret_value_response)

let rotation_token_type_of_yojson = string_of_yojson

let put_secret_value_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_type_of_yojson "ClientRequestToken")
         _list path;
     secret_binary =
       option_of_yojson (value_for_key secret_binary_type_of_yojson "SecretBinary") _list path;
     secret_string =
       option_of_yojson (value_for_key secret_string_type_of_yojson "SecretString") _list path;
     version_stages =
       option_of_yojson
         (value_for_key secret_version_stages_type_of_yojson "VersionStages")
         _list path;
     rotation_token =
       option_of_yojson (value_for_key rotation_token_type_of_yojson "RotationToken") _list path;
   }
    : put_secret_value_request)

let remove_regions_from_replication_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     replication_status =
       option_of_yojson
         (value_for_key replication_status_list_type_of_yojson "ReplicationStatus")
         _list path;
   }
    : remove_regions_from_replication_response)

let remove_replica_region_list_type_of_yojson tree path =
  list_of_yojson region_type_of_yojson tree path

let remove_regions_from_replication_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     remove_replica_regions =
       value_for_key remove_replica_region_list_type_of_yojson "RemoveReplicaRegions" _list path;
   }
    : remove_regions_from_replication_request)

let replicate_secret_to_regions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     replication_status =
       option_of_yojson
         (value_for_key replication_status_list_type_of_yojson "ReplicationStatus")
         _list path;
   }
    : replicate_secret_to_regions_response)

let replicate_secret_to_regions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     add_replica_regions =
       value_for_key add_replica_region_list_type_of_yojson "AddReplicaRegions" _list path;
     force_overwrite_replica_secret =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "ForceOverwriteReplicaSecret")
         _list path;
   }
    : replicate_secret_to_regions_request)

let restore_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
   }
    : restore_secret_response)

let restore_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path }
    : restore_secret_request)

let rotate_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
   }
    : rotate_secret_response)

let rotate_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_type_of_yojson "ClientRequestToken")
         _list path;
     rotation_lambda_ar_n =
       option_of_yojson
         (value_for_key rotation_lambda_arn_type_of_yojson "RotationLambdaARN")
         _list path;
     rotation_rules =
       option_of_yojson (value_for_key rotation_rules_type_of_yojson "RotationRules") _list path;
     external_secret_rotation_metadata =
       option_of_yojson
         (value_for_key external_secret_rotation_metadata_type_of_yojson
            "ExternalSecretRotationMetadata")
         _list path;
     external_secret_rotation_role_arn =
       option_of_yojson
         (value_for_key role_arn_type_of_yojson "ExternalSecretRotationRoleArn")
         _list path;
     rotate_immediately =
       option_of_yojson (value_for_key boolean_type_of_yojson "RotateImmediately") _list path;
   }
    : rotate_secret_request)

let stop_replication_to_replica_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path }
    : stop_replication_to_replica_response)

let stop_replication_to_replica_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path }
    : stop_replication_to_replica_request)

let tag_key_list_type_of_yojson tree path = list_of_yojson tag_key_type_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     tags = value_for_key tag_list_type_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     tag_keys = value_for_key tag_key_list_type_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let update_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
     version_id =
       option_of_yojson (value_for_key secret_version_id_type_of_yojson "VersionId") _list path;
   }
    : update_secret_response)

let update_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_type_of_yojson "ClientRequestToken")
         _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_type_of_yojson "KmsKeyId") _list path;
     secret_binary =
       option_of_yojson (value_for_key secret_binary_type_of_yojson "SecretBinary") _list path;
     secret_string =
       option_of_yojson (value_for_key secret_string_type_of_yojson "SecretString") _list path;
     type_ = option_of_yojson (value_for_key medea_type_type_of_yojson "Type") _list path;
   }
    : update_secret_request)

let update_secret_version_stage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key secret_arn_type_of_yojson "ARN") _list path;
     name = option_of_yojson (value_for_key secret_name_type_of_yojson "Name") _list path;
   }
    : update_secret_version_stage_response)

let update_secret_version_stage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = value_for_key secret_id_type_of_yojson "SecretId" _list path;
     version_stage = value_for_key secret_version_stage_type_of_yojson "VersionStage" _list path;
     remove_from_version_id =
       option_of_yojson
         (value_for_key secret_version_id_type_of_yojson "RemoveFromVersionId")
         _list path;
     move_to_version_id =
       option_of_yojson
         (value_for_key secret_version_id_type_of_yojson "MoveToVersionId")
         _list path;
   }
    : update_secret_version_stage_request)

let validation_errors_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     check_name = option_of_yojson (value_for_key name_type_of_yojson "CheckName") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
   }
    : validation_errors_entry)

let validation_errors_type_of_yojson tree path =
  list_of_yojson validation_errors_entry_of_yojson tree path

let validate_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_validation_passed =
       option_of_yojson (value_for_key boolean_type_of_yojson "PolicyValidationPassed") _list path;
     validation_errors =
       option_of_yojson
         (value_for_key validation_errors_type_of_yojson "ValidationErrors")
         _list path;
   }
    : validate_resource_policy_response)

let validate_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_id = option_of_yojson (value_for_key secret_id_type_of_yojson "SecretId") _list path;
     resource_policy =
       value_for_key non_empty_resource_policy_type_of_yojson "ResourcePolicy" _list path;
   }
    : validate_resource_policy_request)
