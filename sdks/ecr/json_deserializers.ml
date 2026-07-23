open Smaws_Lib.Json.DeserializeHelpers
open Types

let account_setting_name_of_yojson = string_of_yojson
let account_setting_value_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : validation_exception)

let server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : server_exception)

let pull_through_cache_rule_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : pull_through_cache_rule_not_found_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_parameter_exception)

let ptc_validate_failure_of_yojson = string_of_yojson
let is_ptc_rule_valid_of_yojson = bool_of_yojson
let pull_through_cache_rule_repository_prefix_of_yojson = string_of_yojson
let custom_role_arn_of_yojson = string_of_yojson
let credential_arn_of_yojson = string_of_yojson
let url_of_yojson = string_of_yojson
let registry_id_of_yojson = string_of_yojson

let validate_pull_through_cache_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix")
         _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     upstream_registry_url =
       option_of_yojson (value_for_key url_of_yojson "upstreamRegistryUrl") _list path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     upstream_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson
            "upstreamRepositoryPrefix")
         _list path;
     is_valid = option_of_yojson (value_for_key is_ptc_rule_valid_of_yojson "isValid") _list path;
     failure = option_of_yojson (value_for_key ptc_validate_failure_of_yojson "failure") _list path;
   }
    : validate_pull_through_cache_rule_response)

let validate_pull_through_cache_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix" _list
         path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : validate_pull_through_cache_rule_request)

let upload_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : upload_not_found_exception)

let repository_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let kms_error_of_yojson = string_of_yojson

let kms_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     kms_error = option_of_yojson (value_for_key kms_error_of_yojson "kmsError") _list path;
   }
    : kms_exception)

let part_size_of_yojson = long_of_yojson
let upload_id_of_yojson = string_of_yojson
let repository_name_of_yojson = string_of_yojson

let invalid_layer_part_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     last_valid_byte_received =
       option_of_yojson (value_for_key part_size_of_yojson "lastValidByteReceived") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : invalid_layer_part_exception)

let upload_layer_part_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     last_byte_received =
       option_of_yojson (value_for_key part_size_of_yojson "lastByteReceived") _list path;
   }
    : upload_layer_part_response)

let layer_part_blob_of_yojson = blob_of_yojson

let upload_layer_part_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     upload_id = value_for_key upload_id_of_yojson "uploadId" _list path;
     part_first_byte = value_for_key part_size_of_yojson "partFirstByte" _list path;
     part_last_byte = value_for_key part_size_of_yojson "partLastByte" _list path;
     layer_part_blob = value_for_key layer_part_blob_of_yojson "layerPartBlob" _list path;
   }
    : upload_layer_part_request)

let template_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : template_not_found_exception)

let date_of_yojson = timestamp_epoch_seconds_of_yojson

let rct_applied_for_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLICATION" -> REPLICATION
    | `String "PULL_THROUGH_CACHE" -> PULL_THROUGH_CACHE
    | `String "CREATE_ON_PUSH" -> CREATE_ON_PUSH
    | `String value -> raise (deserialize_unknown_enum_value_error path "RCTAppliedFor" value)
    | _ -> raise (deserialize_wrong_type_error path "RCTAppliedFor")
     : rct_applied_for)
    : rct_applied_for)

let rct_applied_for_list_of_yojson tree path = list_of_yojson rct_applied_for_of_yojson tree path
let lifecycle_policy_text_for_repository_creation_template_of_yojson = string_of_yojson
let repository_policy_text_of_yojson = string_of_yojson
let image_tag_mutability_exclusion_filter_value_of_yojson = string_of_yojson

let image_tag_mutability_exclusion_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WILDCARD" -> WILDCARD
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ImageTagMutabilityExclusionFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageTagMutabilityExclusionFilterType")
     : image_tag_mutability_exclusion_filter_type)
    : image_tag_mutability_exclusion_filter_type)

let image_tag_mutability_exclusion_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_type =
       value_for_key image_tag_mutability_exclusion_filter_type_of_yojson "filterType" _list path;
     filter =
       value_for_key image_tag_mutability_exclusion_filter_value_of_yojson "filter" _list path;
   }
    : image_tag_mutability_exclusion_filter)

let image_tag_mutability_exclusion_filters_of_yojson tree path =
  list_of_yojson image_tag_mutability_exclusion_filter_of_yojson tree path

let image_tag_mutability_of_yojson (tree : t) path =
  ((match tree with
    | `String "MUTABLE" -> MUTABLE
    | `String "IMMUTABLE" -> IMMUTABLE
    | `String "IMMUTABLE_WITH_EXCLUSION" -> IMMUTABLE_WITH_EXCLUSION
    | `String "MUTABLE_WITH_EXCLUSION" -> MUTABLE_WITH_EXCLUSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageTagMutability" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageTagMutability")
     : image_tag_mutability)
    : image_tag_mutability)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let kms_key_for_repository_creation_template_of_yojson = string_of_yojson

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AES256" -> AES256
    | `String "KMS" -> KMS
    | `String "KMS_DSSE" -> KMS_DSSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let encryption_configuration_for_repository_creation_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
     kms_key =
       option_of_yojson
         (value_for_key kms_key_for_repository_creation_template_of_yojson "kmsKey")
         _list path;
   }
    : encryption_configuration_for_repository_creation_template)

let repository_template_description_of_yojson = string_of_yojson
let prefix_of_yojson = string_of_yojson

let repository_creation_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = option_of_yojson (value_for_key prefix_of_yojson "prefix") _list path;
     description =
       option_of_yojson
         (value_for_key repository_template_description_of_yojson "description")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_for_repository_creation_template_of_yojson
            "encryptionConfiguration")
         _list path;
     resource_tags = option_of_yojson (value_for_key tag_list_of_yojson "resourceTags") _list path;
     image_tag_mutability =
       option_of_yojson
         (value_for_key image_tag_mutability_of_yojson "imageTagMutability")
         _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
     repository_policy =
       option_of_yojson
         (value_for_key repository_policy_text_of_yojson "repositoryPolicy")
         _list path;
     lifecycle_policy =
       option_of_yojson
         (value_for_key lifecycle_policy_text_for_repository_creation_template_of_yojson
            "lifecyclePolicy")
         _list path;
     applied_for =
       option_of_yojson (value_for_key rct_applied_for_list_of_yojson "appliedFor") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     created_at = option_of_yojson (value_for_key date_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key date_of_yojson "updatedAt") _list path;
   }
    : repository_creation_template)

let update_repository_creation_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_creation_template =
       option_of_yojson
         (value_for_key repository_creation_template_of_yojson "repositoryCreationTemplate")
         _list path;
   }
    : update_repository_creation_template_response)

let update_repository_creation_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = value_for_key prefix_of_yojson "prefix" _list path;
     description =
       option_of_yojson
         (value_for_key repository_template_description_of_yojson "description")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_for_repository_creation_template_of_yojson
            "encryptionConfiguration")
         _list path;
     resource_tags = option_of_yojson (value_for_key tag_list_of_yojson "resourceTags") _list path;
     image_tag_mutability =
       option_of_yojson
         (value_for_key image_tag_mutability_of_yojson "imageTagMutability")
         _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
     repository_policy =
       option_of_yojson
         (value_for_key repository_policy_text_of_yojson "repositoryPolicy")
         _list path;
     lifecycle_policy =
       option_of_yojson
         (value_for_key lifecycle_policy_text_for_repository_creation_template_of_yojson
            "lifecyclePolicy")
         _list path;
     applied_for =
       option_of_yojson (value_for_key rct_applied_for_list_of_yojson "appliedFor") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
   }
    : update_repository_creation_template_request)

let unable_to_decrypt_secret_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unable_to_decrypt_secret_value_exception)

let unable_to_access_secret_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unable_to_access_secret_exception)

let secret_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : secret_not_found_exception)

let updated_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let update_pull_through_cache_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix")
         _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     updated_at =
       option_of_yojson (value_for_key updated_timestamp_of_yojson "updatedAt") _list path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     upstream_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson
            "upstreamRepositoryPrefix")
         _list path;
   }
    : update_pull_through_cache_rule_response)

let update_pull_through_cache_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     ecr_repository_prefix =
       value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix" _list
         path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
   }
    : update_pull_through_cache_rule_request)

let image_storage_class_update_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_storage_class_update_not_supported_exception)

let image_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_not_found_exception)

let image_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ACTIVATING" -> ACTIVATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageStatus")
     : image_status)
    : image_status)

let image_tag_of_yojson = string_of_yojson
let image_digest_of_yojson = string_of_yojson

let image_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
     image_tag = option_of_yojson (value_for_key image_tag_of_yojson "imageTag") _list path;
   }
    : image_identifier)

let update_image_storage_class_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     image_status = option_of_yojson (value_for_key image_status_of_yojson "imageStatus") _list path;
   }
    : update_image_storage_class_response)

let target_storage_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "ARCHIVE" -> ARCHIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetStorageClass" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetStorageClass")
     : target_storage_class)
    : target_storage_class)

let update_image_storage_class_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_id = value_for_key image_identifier_of_yojson "imageId" _list path;
     target_storage_class =
       value_for_key target_storage_class_of_yojson "targetStorageClass" _list path;
   }
    : update_image_storage_class_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : too_many_tags_exception)

let invalid_tag_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_tag_parameter_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let lifecycle_policy_preview_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : lifecycle_policy_preview_in_progress_exception)

let lifecycle_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : lifecycle_policy_not_found_exception)

let lifecycle_policy_preview_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETE" -> COMPLETE
    | `String "EXPIRED" -> EXPIRED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LifecyclePolicyPreviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecyclePolicyPreviewStatus")
     : lifecycle_policy_preview_status)
    : lifecycle_policy_preview_status)

let lifecycle_policy_text_of_yojson = string_of_yojson

let start_lifecycle_policy_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     lifecycle_policy_text =
       option_of_yojson
         (value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText")
         _list path;
     status =
       option_of_yojson
         (value_for_key lifecycle_policy_preview_status_of_yojson "status")
         _list path;
   }
    : start_lifecycle_policy_preview_response)

let start_lifecycle_policy_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     lifecycle_policy_text =
       option_of_yojson
         (value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText")
         _list path;
   }
    : start_lifecycle_policy_preview_request)

let unsupported_image_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unsupported_image_type_exception)

let image_archived_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_archived_exception)

let scan_status_description_of_yojson = string_of_yojson

let scan_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETE" -> COMPLETE
    | `String "FAILED" -> FAILED
    | `String "UNSUPPORTED_IMAGE" -> UNSUPPORTED_IMAGE
    | `String "ACTIVE" -> ACTIVE
    | `String "PENDING" -> PENDING
    | `String "SCAN_ELIGIBILITY_EXPIRED" -> SCAN_ELIGIBILITY_EXPIRED
    | `String "FINDINGS_UNAVAILABLE" -> FINDINGS_UNAVAILABLE
    | `String "LIMIT_EXCEEDED" -> LIMIT_EXCEEDED
    | `String "IMAGE_ARCHIVED" -> IMAGE_ARCHIVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScanStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ScanStatus")
     : scan_status)
    : scan_status)

let image_scan_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key scan_status_of_yojson "status") _list path;
     description =
       option_of_yojson (value_for_key scan_status_description_of_yojson "description") _list path;
   }
    : image_scan_status)

let start_image_scan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     image_scan_status =
       option_of_yojson (value_for_key image_scan_status_of_yojson "imageScanStatus") _list path;
   }
    : start_image_scan_response)

let start_image_scan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_id = value_for_key image_identifier_of_yojson "imageId" _list path;
   }
    : start_image_scan_request)

let set_repository_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     policy_text =
       option_of_yojson (value_for_key repository_policy_text_of_yojson "policyText") _list path;
   }
    : set_repository_policy_response)

let force_flag_of_yojson = bool_of_yojson

let set_repository_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     policy_text = value_for_key repository_policy_text_of_yojson "policyText" _list path;
     force = option_of_yojson (value_for_key force_flag_of_yojson "force") _list path;
   }
    : set_repository_policy_request)

let exclusion_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : exclusion_already_exists_exception)

let creation_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let principal_arn_of_yojson = string_of_yojson

let register_pull_time_update_exclusion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_arn =
       option_of_yojson (value_for_key principal_arn_of_yojson "principalArn") _list path;
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
   }
    : register_pull_time_update_exclusion_response)

let register_pull_time_update_exclusion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ principal_arn = value_for_key principal_arn_of_yojson "principalArn" _list path }
    : register_pull_time_update_exclusion_request)

let signing_repository_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WILDCARD_MATCH" -> WILDCARD_MATCH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SigningRepositoryFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningRepositoryFilterType")
     : signing_repository_filter_type)
    : signing_repository_filter_type)

let signing_repository_filter_value_of_yojson = string_of_yojson

let signing_repository_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = value_for_key signing_repository_filter_value_of_yojson "filter" _list path;
     filter_type = value_for_key signing_repository_filter_type_of_yojson "filterType" _list path;
   }
    : signing_repository_filter)

let signing_repository_filter_list_of_yojson tree path =
  list_of_yojson signing_repository_filter_of_yojson tree path

let signing_profile_arn_of_yojson = string_of_yojson

let signing_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signing_profile_arn =
       value_for_key signing_profile_arn_of_yojson "signingProfileArn" _list path;
     repository_filters =
       option_of_yojson
         (value_for_key signing_repository_filter_list_of_yojson "repositoryFilters")
         _list path;
   }
    : signing_rule)

let signing_rule_list_of_yojson tree path = list_of_yojson signing_rule_of_yojson tree path

let signing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rules = value_for_key signing_rule_list_of_yojson "rules" _list path } : signing_configuration)

let put_signing_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signing_configuration =
       option_of_yojson
         (value_for_key signing_configuration_of_yojson "signingConfiguration")
         _list path;
   }
    : put_signing_configuration_response)

let put_signing_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signing_configuration =
       value_for_key signing_configuration_of_yojson "signingConfiguration" _list path;
   }
    : put_signing_configuration_request)

let repository_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PREFIX_MATCH" -> PREFIX_MATCH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RepositoryFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositoryFilterType")
     : repository_filter_type)
    : repository_filter_type)

let repository_filter_value_of_yojson = string_of_yojson

let repository_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = value_for_key repository_filter_value_of_yojson "filter" _list path;
     filter_type = value_for_key repository_filter_type_of_yojson "filterType" _list path;
   }
    : repository_filter)

let repository_filter_list_of_yojson tree path =
  list_of_yojson repository_filter_of_yojson tree path

let region_of_yojson = string_of_yojson

let replication_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = value_for_key region_of_yojson "region" _list path;
     registry_id = value_for_key registry_id_of_yojson "registryId" _list path;
   }
    : replication_destination)

let replication_destination_list_of_yojson tree path =
  list_of_yojson replication_destination_of_yojson tree path

let replication_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destinations = value_for_key replication_destination_list_of_yojson "destinations" _list path;
     repository_filters =
       option_of_yojson
         (value_for_key repository_filter_list_of_yojson "repositoryFilters")
         _list path;
   }
    : replication_rule)

let replication_rule_list_of_yojson tree path = list_of_yojson replication_rule_of_yojson tree path

let replication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rules = value_for_key replication_rule_list_of_yojson "rules" _list path }
    : replication_configuration)

let put_replication_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_configuration =
       option_of_yojson
         (value_for_key replication_configuration_of_yojson "replicationConfiguration")
         _list path;
   }
    : put_replication_configuration_response)

let put_replication_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_configuration =
       value_for_key replication_configuration_of_yojson "replicationConfiguration" _list path;
   }
    : put_replication_configuration_request)

let blocked_by_organization_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : blocked_by_organization_policy_exception)

let scanning_repository_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WILDCARD" -> WILDCARD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScanningRepositoryFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScanningRepositoryFilterType")
     : scanning_repository_filter_type)
    : scanning_repository_filter_type)

let scanning_repository_filter_value_of_yojson = string_of_yojson

let scanning_repository_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = value_for_key scanning_repository_filter_value_of_yojson "filter" _list path;
     filter_type = value_for_key scanning_repository_filter_type_of_yojson "filterType" _list path;
   }
    : scanning_repository_filter)

let scanning_repository_filter_list_of_yojson tree path =
  list_of_yojson scanning_repository_filter_of_yojson tree path

let scan_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "SCAN_ON_PUSH" -> SCAN_ON_PUSH
    | `String "CONTINUOUS_SCAN" -> CONTINUOUS_SCAN
    | `String "MANUAL" -> MANUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScanFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "ScanFrequency")
     : scan_frequency)
    : scan_frequency)

let registry_scanning_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_frequency = value_for_key scan_frequency_of_yojson "scanFrequency" _list path;
     repository_filters =
       value_for_key scanning_repository_filter_list_of_yojson "repositoryFilters" _list path;
   }
    : registry_scanning_rule)

let registry_scanning_rule_list_of_yojson tree path =
  list_of_yojson registry_scanning_rule_of_yojson tree path

let scan_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BASIC" -> BASIC
    | `String "ENHANCED" -> ENHANCED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScanType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScanType")
     : scan_type)
    : scan_type)

let registry_scanning_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_type = option_of_yojson (value_for_key scan_type_of_yojson "scanType") _list path;
     rules =
       option_of_yojson (value_for_key registry_scanning_rule_list_of_yojson "rules") _list path;
   }
    : registry_scanning_configuration)

let put_registry_scanning_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_scanning_configuration =
       option_of_yojson
         (value_for_key registry_scanning_configuration_of_yojson "registryScanningConfiguration")
         _list path;
   }
    : put_registry_scanning_configuration_response)

let put_registry_scanning_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_type = option_of_yojson (value_for_key scan_type_of_yojson "scanType") _list path;
     rules =
       option_of_yojson (value_for_key registry_scanning_rule_list_of_yojson "rules") _list path;
   }
    : put_registry_scanning_configuration_request)

let registry_policy_text_of_yojson = string_of_yojson

let put_registry_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     policy_text =
       option_of_yojson (value_for_key registry_policy_text_of_yojson "policyText") _list path;
   }
    : put_registry_policy_response)

let put_registry_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy_text = value_for_key registry_policy_text_of_yojson "policyText" _list path }
    : put_registry_policy_request)

let put_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     lifecycle_policy_text =
       option_of_yojson
         (value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText")
         _list path;
   }
    : put_lifecycle_policy_response)

let put_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     lifecycle_policy_text =
       value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText" _list path;
   }
    : put_lifecycle_policy_request)

let put_image_tag_mutability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_tag_mutability =
       option_of_yojson
         (value_for_key image_tag_mutability_of_yojson "imageTagMutability")
         _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
   }
    : put_image_tag_mutability_response)

let put_image_tag_mutability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_tag_mutability =
       value_for_key image_tag_mutability_of_yojson "imageTagMutability" _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
   }
    : put_image_tag_mutability_request)

let scan_on_push_flag_of_yojson = bool_of_yojson

let image_scanning_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scan_on_push =
       option_of_yojson (value_for_key scan_on_push_flag_of_yojson "scanOnPush") _list path;
   }
    : image_scanning_configuration)

let put_image_scanning_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_scanning_configuration =
       option_of_yojson
         (value_for_key image_scanning_configuration_of_yojson "imageScanningConfiguration")
         _list path;
   }
    : put_image_scanning_configuration_response)

let put_image_scanning_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_scanning_configuration =
       value_for_key image_scanning_configuration_of_yojson "imageScanningConfiguration" _list path;
   }
    : put_image_scanning_configuration_request)

let referenced_images_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : referenced_images_not_found_exception)

let layers_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : layers_not_found_exception)

let image_tag_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_tag_already_exists_exception)

let image_digest_does_not_match_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_digest_does_not_match_exception)

let image_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_already_exists_exception)

let media_type_of_yojson = string_of_yojson
let image_manifest_of_yojson = string_of_yojson

let image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     image_manifest =
       option_of_yojson (value_for_key image_manifest_of_yojson "imageManifest") _list path;
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
   }
    : image)

let put_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image = option_of_yojson (value_for_key image_of_yojson "image") _list path }
    : put_image_response)

let put_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_manifest = value_for_key image_manifest_of_yojson "imageManifest" _list path;
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
     image_tag = option_of_yojson (value_for_key image_tag_of_yojson "imageTag") _list path;
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
   }
    : put_image_request)

let put_account_setting_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key account_setting_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key account_setting_value_of_yojson "value") _list path;
   }
    : put_account_setting_response)

let put_account_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key account_setting_name_of_yojson "name" _list path;
     value = value_for_key account_setting_value_of_yojson "value" _list path;
   }
    : put_account_setting_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let next_token_of_yojson = string_of_yojson

let pull_time_update_exclusion_list_of_yojson tree path =
  list_of_yojson principal_arn_of_yojson tree path

let list_pull_time_update_exclusions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_time_update_exclusions =
       option_of_yojson
         (value_for_key pull_time_update_exclusion_list_of_yojson "pullTimeUpdateExclusions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_pull_time_update_exclusions_response)

let max_results_of_yojson = int_of_yojson

let list_pull_time_update_exclusions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_pull_time_update_exclusions_request)

let image_identifier_list_of_yojson tree path = list_of_yojson image_identifier_of_yojson tree path

let list_images_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_ids =
       option_of_yojson (value_for_key image_identifier_list_of_yojson "imageIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_images_response)

let image_status_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ANY" -> ANY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageStatusFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageStatusFilter")
     : image_status_filter)
    : image_status_filter)

let tag_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAGGED" -> TAGGED
    | `String "UNTAGGED" -> UNTAGGED
    | `String "ANY" -> ANY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TagStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TagStatus")
     : tag_status)
    : tag_status)

let list_images_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_status = option_of_yojson (value_for_key tag_status_of_yojson "tagStatus") _list path;
     image_status =
       option_of_yojson (value_for_key image_status_filter_of_yojson "imageStatus") _list path;
   }
    : list_images_filter)

let list_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filter = option_of_yojson (value_for_key list_images_filter_of_yojson "filter") _list path;
   }
    : list_images_request)

let unable_to_list_upstream_image_referrers_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unable_to_list_upstream_image_referrers_exception)

let artifact_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ACTIVATING" -> ACTIVATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactStatus")
     : artifact_status)
    : artifact_status)

let string__of_yojson = string_of_yojson
let annotations_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path
let image_size_in_bytes_of_yojson = long_of_yojson
let artifact_type_of_yojson = string_of_yojson

let image_referrer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     digest = value_for_key image_digest_of_yojson "digest" _list path;
     media_type = value_for_key media_type_of_yojson "mediaType" _list path;
     artifact_type =
       option_of_yojson (value_for_key artifact_type_of_yojson "artifactType") _list path;
     size = value_for_key image_size_in_bytes_of_yojson "size" _list path;
     annotations = option_of_yojson (value_for_key annotations_of_yojson "annotations") _list path;
     artifact_status =
       option_of_yojson (value_for_key artifact_status_of_yojson "artifactStatus") _list path;
   }
    : image_referrer)

let image_referrer_list_of_yojson tree path = list_of_yojson image_referrer_of_yojson tree path

let list_image_referrers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     referrers =
       option_of_yojson (value_for_key image_referrer_list_of_yojson "referrers") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_image_referrers_response)

let fifty_max_results_of_yojson = int_of_yojson

let artifact_status_filter_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ACTIVATING" -> ACTIVATING
    | `String "ANY" -> ANY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ArtifactStatusFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactStatusFilter")
     : artifact_status_filter)
    : artifact_status_filter)

let artifact_type_list_of_yojson tree path = list_of_yojson artifact_type_of_yojson tree path

let list_image_referrers_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     artifact_types =
       option_of_yojson (value_for_key artifact_type_list_of_yojson "artifactTypes") _list path;
     artifact_status =
       option_of_yojson (value_for_key artifact_status_filter_of_yojson "artifactStatus") _list path;
   }
    : list_image_referrers_filter)

let subject_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image_digest = value_for_key image_digest_of_yojson "imageDigest" _list path }
    : subject_identifier)

let list_image_referrers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     subject_id = value_for_key subject_identifier_of_yojson "subjectId" _list path;
     filter =
       option_of_yojson (value_for_key list_image_referrers_filter_of_yojson "filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key fifty_max_results_of_yojson "maxResults") _list path;
   }
    : list_image_referrers_request)

let initiate_layer_upload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     part_size = option_of_yojson (value_for_key part_size_of_yojson "partSize") _list path;
   }
    : initiate_layer_upload_response)

let initiate_layer_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : initiate_layer_upload_request)

let signing_configuration_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : signing_configuration_not_found_exception)

let get_signing_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     signing_configuration =
       option_of_yojson
         (value_for_key signing_configuration_of_yojson "signingConfiguration")
         _list path;
   }
    : get_signing_configuration_response)

let get_signing_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let repository_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_policy_not_found_exception)

let get_repository_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     policy_text =
       option_of_yojson (value_for_key repository_policy_text_of_yojson "policyText") _list path;
   }
    : get_repository_policy_response)

let get_repository_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : get_repository_policy_request)

let get_registry_scanning_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     scanning_configuration =
       option_of_yojson
         (value_for_key registry_scanning_configuration_of_yojson "scanningConfiguration")
         _list path;
   }
    : get_registry_scanning_configuration_response)

let get_registry_scanning_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let registry_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : registry_policy_not_found_exception)

let get_registry_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     policy_text =
       option_of_yojson (value_for_key registry_policy_text_of_yojson "policyText") _list path;
   }
    : get_registry_policy_response)

let get_registry_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let lifecycle_policy_preview_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : lifecycle_policy_preview_not_found_exception)

let image_count_of_yojson = int_of_yojson

let lifecycle_policy_target_storage_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARCHIVE" -> ARCHIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LifecyclePolicyTargetStorageClass" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecyclePolicyTargetStorageClass")
     : lifecycle_policy_target_storage_class)
    : lifecycle_policy_target_storage_class)

let transitioning_image_total_count_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_storage_class =
       option_of_yojson
         (value_for_key lifecycle_policy_target_storage_class_of_yojson "targetStorageClass")
         _list path;
     image_total_count =
       option_of_yojson (value_for_key image_count_of_yojson "imageTotalCount") _list path;
   }
    : transitioning_image_total_count)

let transitioning_image_total_counts_of_yojson tree path =
  list_of_yojson transitioning_image_total_count_of_yojson tree path

let lifecycle_policy_preview_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiring_image_total_count =
       option_of_yojson (value_for_key image_count_of_yojson "expiringImageTotalCount") _list path;
     transitioning_image_total_counts =
       option_of_yojson
         (value_for_key transitioning_image_total_counts_of_yojson "transitioningImageTotalCounts")
         _list path;
   }
    : lifecycle_policy_preview_summary)

let lifecycle_policy_storage_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARCHIVE" -> ARCHIVE
    | `String "STANDARD" -> STANDARD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LifecyclePolicyStorageClass" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecyclePolicyStorageClass")
     : lifecycle_policy_storage_class)
    : lifecycle_policy_storage_class)

let lifecycle_policy_rule_priority_of_yojson = int_of_yojson

let image_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPIRE" -> EXPIRE
    | `String "TRANSITION" -> TRANSITION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageActionType")
     : image_action_type)
    : image_action_type)

let lifecycle_policy_rule_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key image_action_type_of_yojson "type") _list path;
     target_storage_class =
       option_of_yojson
         (value_for_key lifecycle_policy_target_storage_class_of_yojson "targetStorageClass")
         _list path;
   }
    : lifecycle_policy_rule_action)

let push_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let image_tag_list_of_yojson tree path = list_of_yojson image_tag_of_yojson tree path

let lifecycle_policy_preview_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_tags = option_of_yojson (value_for_key image_tag_list_of_yojson "imageTags") _list path;
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
     image_pushed_at =
       option_of_yojson (value_for_key push_timestamp_of_yojson "imagePushedAt") _list path;
     action =
       option_of_yojson (value_for_key lifecycle_policy_rule_action_of_yojson "action") _list path;
     applied_rule_priority =
       option_of_yojson
         (value_for_key lifecycle_policy_rule_priority_of_yojson "appliedRulePriority")
         _list path;
     storage_class =
       option_of_yojson
         (value_for_key lifecycle_policy_storage_class_of_yojson "storageClass")
         _list path;
   }
    : lifecycle_policy_preview_result)

let lifecycle_policy_preview_result_list_of_yojson tree path =
  list_of_yojson lifecycle_policy_preview_result_of_yojson tree path

let get_lifecycle_policy_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     lifecycle_policy_text =
       option_of_yojson
         (value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText")
         _list path;
     status =
       option_of_yojson
         (value_for_key lifecycle_policy_preview_status_of_yojson "status")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     preview_results =
       option_of_yojson
         (value_for_key lifecycle_policy_preview_result_list_of_yojson "previewResults")
         _list path;
     summary =
       option_of_yojson
         (value_for_key lifecycle_policy_preview_summary_of_yojson "summary")
         _list path;
   }
    : get_lifecycle_policy_preview_response)

let lifecycle_policy_preview_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tag_status = option_of_yojson (value_for_key tag_status_of_yojson "tagStatus") _list path }
    : lifecycle_policy_preview_filter)

let lifecycle_preview_max_results_of_yojson = int_of_yojson

let get_lifecycle_policy_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_ids =
       option_of_yojson (value_for_key image_identifier_list_of_yojson "imageIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key lifecycle_preview_max_results_of_yojson "maxResults")
         _list path;
     filter =
       option_of_yojson
         (value_for_key lifecycle_policy_preview_filter_of_yojson "filter")
         _list path;
   }
    : get_lifecycle_policy_preview_request)

let evaluation_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let get_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     lifecycle_policy_text =
       option_of_yojson
         (value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText")
         _list path;
     last_evaluated_at =
       option_of_yojson (value_for_key evaluation_timestamp_of_yojson "lastEvaluatedAt") _list path;
   }
    : get_lifecycle_policy_response)

let get_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : get_lifecycle_policy_request)

let unable_to_get_upstream_layer_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unable_to_get_upstream_layer_exception)

let layer_inaccessible_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : layer_inaccessible_exception)

let layer_digest_of_yojson = string_of_yojson

let get_download_url_for_layer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     download_url = option_of_yojson (value_for_key url_of_yojson "downloadUrl") _list path;
     layer_digest = option_of_yojson (value_for_key layer_digest_of_yojson "layerDigest") _list path;
   }
    : get_download_url_for_layer_response)

let get_download_url_for_layer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     layer_digest = value_for_key layer_digest_of_yojson "layerDigest" _list path;
   }
    : get_download_url_for_layer_request)

let proxy_endpoint_of_yojson = string_of_yojson
let expiration_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base64_of_yojson = string_of_yojson

let authorization_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorization_token =
       option_of_yojson (value_for_key base64_of_yojson "authorizationToken") _list path;
     expires_at =
       option_of_yojson (value_for_key expiration_timestamp_of_yojson "expiresAt") _list path;
     proxy_endpoint =
       option_of_yojson (value_for_key proxy_endpoint_of_yojson "proxyEndpoint") _list path;
   }
    : authorization_data)

let authorization_data_list_of_yojson tree path =
  list_of_yojson authorization_data_of_yojson tree path

let get_authorization_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorization_data =
       option_of_yojson
         (value_for_key authorization_data_list_of_yojson "authorizationData")
         _list path;
   }
    : get_authorization_token_response)

let get_authorization_token_registry_id_list_of_yojson tree path =
  list_of_yojson registry_id_of_yojson tree path

let get_authorization_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_ids =
       option_of_yojson
         (value_for_key get_authorization_token_registry_id_list_of_yojson "registryIds")
         _list path;
   }
    : get_authorization_token_request)

let get_account_setting_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key account_setting_name_of_yojson "name") _list path;
     value = option_of_yojson (value_for_key account_setting_name_of_yojson "value") _list path;
   }
    : get_account_setting_response)

let get_account_setting_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key account_setting_name_of_yojson "name" _list path }
    : get_account_setting_request)

let repository_creation_template_list_of_yojson tree path =
  list_of_yojson repository_creation_template_of_yojson tree path

let describe_repository_creation_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_creation_templates =
       option_of_yojson
         (value_for_key repository_creation_template_list_of_yojson "repositoryCreationTemplates")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_repository_creation_templates_response)

let prefix_list_of_yojson tree path = list_of_yojson prefix_of_yojson tree path

let describe_repository_creation_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefixes = option_of_yojson (value_for_key prefix_list_of_yojson "prefixes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_repository_creation_templates_request)

let kms_key_of_yojson = string_of_yojson

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_type = value_for_key encryption_type_of_yojson "encryptionType" _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "kmsKey") _list path;
   }
    : encryption_configuration)

let repository_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_arn = option_of_yojson (value_for_key arn_of_yojson "repositoryArn") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     repository_uri = option_of_yojson (value_for_key url_of_yojson "repositoryUri") _list path;
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
     image_tag_mutability =
       option_of_yojson
         (value_for_key image_tag_mutability_of_yojson "imageTagMutability")
         _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
     image_scanning_configuration =
       option_of_yojson
         (value_for_key image_scanning_configuration_of_yojson "imageScanningConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "encryptionConfiguration")
         _list path;
   }
    : repository)

let repository_list_of_yojson tree path = list_of_yojson repository_of_yojson tree path

let describe_repositories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repositories =
       option_of_yojson (value_for_key repository_list_of_yojson "repositories") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_repositories_response)

let repository_name_list_of_yojson tree path = list_of_yojson repository_name_of_yojson tree path

let describe_repositories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_names =
       option_of_yojson (value_for_key repository_name_list_of_yojson "repositoryNames") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_repositories_request)

let describe_registry_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     replication_configuration =
       option_of_yojson
         (value_for_key replication_configuration_of_yojson "replicationConfiguration")
         _list path;
   }
    : describe_registry_response)

let describe_registry_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let upstream_registry_of_yojson (tree : t) path =
  ((match tree with
    | `String "ecr" -> Ecr
    | `String "ecr-public" -> EcrPublic
    | `String "quay" -> Quay
    | `String "k8s" -> K8s
    | `String "docker-hub" -> DockerHub
    | `String "github-container-registry" -> GitHubContainerRegistry
    | `String "azure-container-registry" -> AzureContainerRegistry
    | `String "gitlab-container-registry" -> GitLabContainerRegistry
    | `String "chainguard" -> Chainguard
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpstreamRegistry" value)
    | _ -> raise (deserialize_wrong_type_error path "UpstreamRegistry")
     : upstream_registry)
    : upstream_registry)

let pull_through_cache_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix")
         _list path;
     upstream_registry_url =
       option_of_yojson (value_for_key url_of_yojson "upstreamRegistryUrl") _list path;
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     upstream_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson
            "upstreamRepositoryPrefix")
         _list path;
     upstream_registry =
       option_of_yojson (value_for_key upstream_registry_of_yojson "upstreamRegistry") _list path;
     updated_at =
       option_of_yojson (value_for_key updated_timestamp_of_yojson "updatedAt") _list path;
   }
    : pull_through_cache_rule)

let pull_through_cache_rule_list_of_yojson tree path =
  list_of_yojson pull_through_cache_rule_of_yojson tree path

let describe_pull_through_cache_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pull_through_cache_rules =
       option_of_yojson
         (value_for_key pull_through_cache_rule_list_of_yojson "pullThroughCacheRules")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_pull_through_cache_rules_response)

let pull_through_cache_rule_repository_prefix_list_of_yojson tree path =
  list_of_yojson pull_through_cache_rule_repository_prefix_of_yojson tree path

let describe_pull_through_cache_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     ecr_repository_prefixes =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_list_of_yojson
            "ecrRepositoryPrefixes")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_pull_through_cache_rules_request)

let signing_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETE" -> COMPLETE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SigningStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningStatus")
     : signing_status)
    : signing_status)

let signing_status_failure_reason_of_yojson = string_of_yojson
let signing_status_failure_code_of_yojson = string_of_yojson

let image_signing_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signing_profile_arn =
       option_of_yojson (value_for_key signing_profile_arn_of_yojson "signingProfileArn") _list path;
     failure_code =
       option_of_yojson
         (value_for_key signing_status_failure_code_of_yojson "failureCode")
         _list path;
     failure_reason =
       option_of_yojson
         (value_for_key signing_status_failure_reason_of_yojson "failureReason")
         _list path;
     status = option_of_yojson (value_for_key signing_status_of_yojson "status") _list path;
   }
    : image_signing_status)

let image_signing_status_list_of_yojson tree path =
  list_of_yojson image_signing_status_of_yojson tree path

let describe_image_signing_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     signing_statuses =
       option_of_yojson
         (value_for_key image_signing_status_list_of_yojson "signingStatuses")
         _list path;
   }
    : describe_image_signing_status_response)

let describe_image_signing_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_id = value_for_key image_identifier_of_yojson "imageId" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : describe_image_signing_status_request)

let scan_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : scan_not_found_exception)

let exploit_available_of_yojson = string_of_yojson
let fix_available_of_yojson = string_of_yojson
let type__of_yojson = string_of_yojson
let title_of_yojson = string_of_yojson
let status_of_yojson = string_of_yojson
let severity_of_yojson = string_of_yojson
let version_of_yojson = string_of_yojson
let scoring_vector_of_yojson = string_of_yojson
let source_of_yojson = string_of_yojson
let score_of_yojson = double_of_yojson
let reason_of_yojson = string_of_yojson
let metric_of_yojson = string_of_yojson

let cvss_score_adjustment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric = option_of_yojson (value_for_key metric_of_yojson "metric") _list path;
     reason = option_of_yojson (value_for_key reason_of_yojson "reason") _list path;
   }
    : cvss_score_adjustment)

let cvss_score_adjustment_list_of_yojson tree path =
  list_of_yojson cvss_score_adjustment_of_yojson tree path

let cvss_score_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adjustments =
       option_of_yojson
         (value_for_key cvss_score_adjustment_list_of_yojson "adjustments")
         _list path;
     score = option_of_yojson (value_for_key score_of_yojson "score") _list path;
     score_source = option_of_yojson (value_for_key source_of_yojson "scoreSource") _list path;
     scoring_vector =
       option_of_yojson (value_for_key scoring_vector_of_yojson "scoringVector") _list path;
     version = option_of_yojson (value_for_key version_of_yojson "version") _list path;
   }
    : cvss_score_details)

let score_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cvss = option_of_yojson (value_for_key cvss_score_details_of_yojson "cvss") _list path }
    : score_details)

let tags_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path
let resource_id_of_yojson = string_of_yojson
let in_use_count_of_yojson = long_of_yojson
let platform_of_yojson = string_of_yojson
let image_tags_list_of_yojson tree path = list_of_yojson image_tag_of_yojson tree path
let author_of_yojson = string_of_yojson
let arch_of_yojson = string_of_yojson

let aws_ecr_container_image_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     architecture = option_of_yojson (value_for_key arch_of_yojson "architecture") _list path;
     author = option_of_yojson (value_for_key author_of_yojson "author") _list path;
     image_hash = option_of_yojson (value_for_key image_digest_of_yojson "imageHash") _list path;
     image_tags = option_of_yojson (value_for_key image_tags_list_of_yojson "imageTags") _list path;
     platform = option_of_yojson (value_for_key platform_of_yojson "platform") _list path;
     pushed_at = option_of_yojson (value_for_key date_of_yojson "pushedAt") _list path;
     last_in_use_at = option_of_yojson (value_for_key date_of_yojson "lastInUseAt") _list path;
     in_use_count = option_of_yojson (value_for_key in_use_count_of_yojson "inUseCount") _list path;
     registry = option_of_yojson (value_for_key registry_id_of_yojson "registry") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
   }
    : aws_ecr_container_image_details)

let resource_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_ecr_container_image =
       option_of_yojson
         (value_for_key aws_ecr_container_image_details_of_yojson "awsEcrContainerImage")
         _list path;
   }
    : resource_details)

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     details = option_of_yojson (value_for_key resource_details_of_yojson "details") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     type_ = option_of_yojson (value_for_key type__of_yojson "type") _list path;
   }
    : resource)

let resource_list_of_yojson tree path = list_of_yojson resource_of_yojson tree path
let recommendation_text_of_yojson = string_of_yojson

let recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key url_of_yojson "url") _list path;
     text = option_of_yojson (value_for_key recommendation_text_of_yojson "text") _list path;
   }
    : recommendation)

let remediation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation =
       option_of_yojson (value_for_key recommendation_of_yojson "recommendation") _list path;
   }
    : remediation)

let fixed_in_version_of_yojson = string_of_yojson
let source_layer_hash_of_yojson = string_of_yojson
let release_of_yojson = string_of_yojson
let package_manager_of_yojson = string_of_yojson
let vulnerable_package_name_of_yojson = string_of_yojson
let file_path_of_yojson = string_of_yojson
let epoch_of_yojson = int_of_yojson

let vulnerable_package_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arch = option_of_yojson (value_for_key arch_of_yojson "arch") _list path;
     epoch = option_of_yojson (value_for_key epoch_of_yojson "epoch") _list path;
     file_path = option_of_yojson (value_for_key file_path_of_yojson "filePath") _list path;
     name = option_of_yojson (value_for_key vulnerable_package_name_of_yojson "name") _list path;
     package_manager =
       option_of_yojson (value_for_key package_manager_of_yojson "packageManager") _list path;
     release = option_of_yojson (value_for_key release_of_yojson "release") _list path;
     source_layer_hash =
       option_of_yojson (value_for_key source_layer_hash_of_yojson "sourceLayerHash") _list path;
     version = option_of_yojson (value_for_key version_of_yojson "version") _list path;
     fixed_in_version =
       option_of_yojson (value_for_key fixed_in_version_of_yojson "fixedInVersion") _list path;
   }
    : vulnerable_package)

let vulnerable_packages_list_of_yojson tree path =
  list_of_yojson vulnerable_package_of_yojson tree path

let vulnerability_id_of_yojson = string_of_yojson
let related_vulnerability_of_yojson = string_of_yojson

let related_vulnerabilities_list_of_yojson tree path =
  list_of_yojson related_vulnerability_of_yojson tree path

let reference_urls_list_of_yojson tree path = list_of_yojson url_of_yojson tree path
let base_score_of_yojson = double_of_yojson

let cvss_score_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     base_score = option_of_yojson (value_for_key base_score_of_yojson "baseScore") _list path;
     scoring_vector =
       option_of_yojson (value_for_key scoring_vector_of_yojson "scoringVector") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
     version = option_of_yojson (value_for_key version_of_yojson "version") _list path;
   }
    : cvss_score)

let cvss_score_list_of_yojson tree path = list_of_yojson cvss_score_of_yojson tree path

let package_vulnerability_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cvss = option_of_yojson (value_for_key cvss_score_list_of_yojson "cvss") _list path;
     reference_urls =
       option_of_yojson (value_for_key reference_urls_list_of_yojson "referenceUrls") _list path;
     related_vulnerabilities =
       option_of_yojson
         (value_for_key related_vulnerabilities_list_of_yojson "relatedVulnerabilities")
         _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
     source_url = option_of_yojson (value_for_key url_of_yojson "sourceUrl") _list path;
     vendor_created_at =
       option_of_yojson (value_for_key date_of_yojson "vendorCreatedAt") _list path;
     vendor_severity =
       option_of_yojson (value_for_key severity_of_yojson "vendorSeverity") _list path;
     vendor_updated_at =
       option_of_yojson (value_for_key date_of_yojson "vendorUpdatedAt") _list path;
     vulnerability_id =
       option_of_yojson (value_for_key vulnerability_id_of_yojson "vulnerabilityId") _list path;
     vulnerable_packages =
       option_of_yojson
         (value_for_key vulnerable_packages_list_of_yojson "vulnerablePackages")
         _list path;
   }
    : package_vulnerability_details)

let finding_arn_of_yojson = string_of_yojson
let finding_description_of_yojson = string_of_yojson

let enhanced_image_scan_finding_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id =
       option_of_yojson (value_for_key registry_id_of_yojson "awsAccountId") _list path;
     description =
       option_of_yojson (value_for_key finding_description_of_yojson "description") _list path;
     finding_arn = option_of_yojson (value_for_key finding_arn_of_yojson "findingArn") _list path;
     first_observed_at =
       option_of_yojson (value_for_key date_of_yojson "firstObservedAt") _list path;
     last_observed_at = option_of_yojson (value_for_key date_of_yojson "lastObservedAt") _list path;
     package_vulnerability_details =
       option_of_yojson
         (value_for_key package_vulnerability_details_of_yojson "packageVulnerabilityDetails")
         _list path;
     remediation = option_of_yojson (value_for_key remediation_of_yojson "remediation") _list path;
     resources = option_of_yojson (value_for_key resource_list_of_yojson "resources") _list path;
     score = option_of_yojson (value_for_key score_of_yojson "score") _list path;
     score_details =
       option_of_yojson (value_for_key score_details_of_yojson "scoreDetails") _list path;
     severity = option_of_yojson (value_for_key severity_of_yojson "severity") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     title = option_of_yojson (value_for_key title_of_yojson "title") _list path;
     type_ = option_of_yojson (value_for_key type__of_yojson "type") _list path;
     updated_at = option_of_yojson (value_for_key date_of_yojson "updatedAt") _list path;
     fix_available =
       option_of_yojson (value_for_key fix_available_of_yojson "fixAvailable") _list path;
     exploit_available =
       option_of_yojson (value_for_key exploit_available_of_yojson "exploitAvailable") _list path;
   }
    : enhanced_image_scan_finding)

let enhanced_image_scan_finding_list_of_yojson tree path =
  list_of_yojson enhanced_image_scan_finding_of_yojson tree path

let attribute_value_of_yojson = string_of_yojson
let attribute_key_of_yojson = string_of_yojson

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key attribute_key_of_yojson "key" _list path;
     value = option_of_yojson (value_for_key attribute_value_of_yojson "value") _list path;
   }
    : attribute)

let attribute_list_of_yojson tree path = list_of_yojson attribute_of_yojson tree path

let finding_severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFORMATIONAL" -> INFORMATIONAL
    | `String "LOW" -> LOW
    | `String "MEDIUM" -> MEDIUM
    | `String "HIGH" -> HIGH
    | `String "CRITICAL" -> CRITICAL
    | `String "UNDEFINED" -> UNDEFINED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FindingSeverity" value)
    | _ -> raise (deserialize_wrong_type_error path "FindingSeverity")
     : finding_severity)
    : finding_severity)

let finding_name_of_yojson = string_of_yojson

let image_scan_finding_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key finding_name_of_yojson "name") _list path;
     description =
       option_of_yojson (value_for_key finding_description_of_yojson "description") _list path;
     uri = option_of_yojson (value_for_key url_of_yojson "uri") _list path;
     severity = option_of_yojson (value_for_key finding_severity_of_yojson "severity") _list path;
     attributes = option_of_yojson (value_for_key attribute_list_of_yojson "attributes") _list path;
   }
    : image_scan_finding)

let image_scan_finding_list_of_yojson tree path =
  list_of_yojson image_scan_finding_of_yojson tree path

let severity_count_of_yojson = int_of_yojson

let finding_severity_counts_of_yojson tree path =
  map_of_yojson finding_severity_of_yojson severity_count_of_yojson tree path

let vulnerability_source_update_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let scan_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let image_scan_findings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_scan_completed_at =
       option_of_yojson (value_for_key scan_timestamp_of_yojson "imageScanCompletedAt") _list path;
     vulnerability_source_updated_at =
       option_of_yojson
         (value_for_key vulnerability_source_update_timestamp_of_yojson
            "vulnerabilitySourceUpdatedAt")
         _list path;
     finding_severity_counts =
       option_of_yojson
         (value_for_key finding_severity_counts_of_yojson "findingSeverityCounts")
         _list path;
     findings =
       option_of_yojson (value_for_key image_scan_finding_list_of_yojson "findings") _list path;
     enhanced_findings =
       option_of_yojson
         (value_for_key enhanced_image_scan_finding_list_of_yojson "enhancedFindings")
         _list path;
   }
    : image_scan_findings)

let describe_image_scan_findings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     image_scan_status =
       option_of_yojson (value_for_key image_scan_status_of_yojson "imageScanStatus") _list path;
     image_scan_findings =
       option_of_yojson (value_for_key image_scan_findings_of_yojson "imageScanFindings") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_image_scan_findings_response)

let describe_image_scan_findings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_id = value_for_key image_identifier_of_yojson "imageId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_image_scan_findings_request)

let last_activated_at_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let last_archived_at_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let recorded_pull_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let image_scan_findings_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_scan_completed_at =
       option_of_yojson (value_for_key scan_timestamp_of_yojson "imageScanCompletedAt") _list path;
     vulnerability_source_updated_at =
       option_of_yojson
         (value_for_key vulnerability_source_update_timestamp_of_yojson
            "vulnerabilitySourceUpdatedAt")
         _list path;
     finding_severity_counts =
       option_of_yojson
         (value_for_key finding_severity_counts_of_yojson "findingSeverityCounts")
         _list path;
   }
    : image_scan_findings_summary)

let image_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
     image_tags = option_of_yojson (value_for_key image_tag_list_of_yojson "imageTags") _list path;
     image_size_in_bytes =
       option_of_yojson (value_for_key image_size_in_bytes_of_yojson "imageSizeInBytes") _list path;
     image_pushed_at =
       option_of_yojson (value_for_key push_timestamp_of_yojson "imagePushedAt") _list path;
     image_scan_status =
       option_of_yojson (value_for_key image_scan_status_of_yojson "imageScanStatus") _list path;
     image_scan_findings_summary =
       option_of_yojson
         (value_for_key image_scan_findings_summary_of_yojson "imageScanFindingsSummary")
         _list path;
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
     artifact_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "artifactMediaType") _list path;
     last_recorded_pull_time =
       option_of_yojson
         (value_for_key recorded_pull_timestamp_of_yojson "lastRecordedPullTime")
         _list path;
     subject_manifest_digest =
       option_of_yojson (value_for_key image_digest_of_yojson "subjectManifestDigest") _list path;
     image_status = option_of_yojson (value_for_key image_status_of_yojson "imageStatus") _list path;
     last_archived_at =
       option_of_yojson
         (value_for_key last_archived_at_timestamp_of_yojson "lastArchivedAt")
         _list path;
     last_activated_at =
       option_of_yojson
         (value_for_key last_activated_at_timestamp_of_yojson "lastActivatedAt")
         _list path;
   }
    : image_detail)

let image_detail_list_of_yojson tree path = list_of_yojson image_detail_of_yojson tree path

let describe_images_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_details =
       option_of_yojson (value_for_key image_detail_list_of_yojson "imageDetails") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_images_response)

let describe_images_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_status = option_of_yojson (value_for_key tag_status_of_yojson "tagStatus") _list path;
     image_status =
       option_of_yojson (value_for_key image_status_filter_of_yojson "imageStatus") _list path;
   }
    : describe_images_filter)

let describe_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_ids =
       option_of_yojson (value_for_key image_identifier_list_of_yojson "imageIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filter = option_of_yojson (value_for_key describe_images_filter_of_yojson "filter") _list path;
   }
    : describe_images_request)

let replication_error_of_yojson = string_of_yojson

let replication_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETE" -> COMPLETE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicationStatus")
     : replication_status)
    : replication_status)

let image_replication_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     status = option_of_yojson (value_for_key replication_status_of_yojson "status") _list path;
     failure_code =
       option_of_yojson (value_for_key replication_error_of_yojson "failureCode") _list path;
   }
    : image_replication_status)

let image_replication_status_list_of_yojson tree path =
  list_of_yojson image_replication_status_of_yojson tree path

let describe_image_replication_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     replication_statuses =
       option_of_yojson
         (value_for_key image_replication_status_list_of_yojson "replicationStatuses")
         _list path;
   }
    : describe_image_replication_status_response)

let describe_image_replication_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_id = value_for_key image_identifier_of_yojson "imageId" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : describe_image_replication_status_request)

let exclusion_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : exclusion_not_found_exception)

let deregister_pull_time_update_exclusion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_arn =
       option_of_yojson (value_for_key principal_arn_of_yojson "principalArn") _list path;
   }
    : deregister_pull_time_update_exclusion_response)

let deregister_pull_time_update_exclusion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ principal_arn = value_for_key principal_arn_of_yojson "principalArn" _list path }
    : deregister_pull_time_update_exclusion_request)

let delete_signing_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     signing_configuration =
       option_of_yojson
         (value_for_key signing_configuration_of_yojson "signingConfiguration")
         _list path;
   }
    : delete_signing_configuration_response)

let delete_signing_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_repository_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     policy_text =
       option_of_yojson (value_for_key repository_policy_text_of_yojson "policyText") _list path;
   }
    : delete_repository_policy_response)

let delete_repository_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : delete_repository_policy_request)

let delete_repository_creation_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_creation_template =
       option_of_yojson
         (value_for_key repository_creation_template_of_yojson "repositoryCreationTemplate")
         _list path;
   }
    : delete_repository_creation_template_response)

let delete_repository_creation_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ prefix = value_for_key prefix_of_yojson "prefix" _list path }
    : delete_repository_creation_template_request)

let repository_not_empty_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_not_empty_exception)

let delete_repository_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository = option_of_yojson (value_for_key repository_of_yojson "repository") _list path }
    : delete_repository_response)

let delete_repository_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     force = option_of_yojson (value_for_key force_flag_of_yojson "force") _list path;
   }
    : delete_repository_request)

let delete_registry_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     policy_text =
       option_of_yojson (value_for_key registry_policy_text_of_yojson "policyText") _list path;
   }
    : delete_registry_policy_response)

let delete_registry_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_pull_through_cache_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix")
         _list path;
     upstream_registry_url =
       option_of_yojson (value_for_key url_of_yojson "upstreamRegistryUrl") _list path;
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     upstream_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson
            "upstreamRepositoryPrefix")
         _list path;
   }
    : delete_pull_through_cache_rule_response)

let delete_pull_through_cache_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix" _list
         path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : delete_pull_through_cache_rule_request)

let delete_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     lifecycle_policy_text =
       option_of_yojson
         (value_for_key lifecycle_policy_text_of_yojson "lifecyclePolicyText")
         _list path;
     last_evaluated_at =
       option_of_yojson (value_for_key evaluation_timestamp_of_yojson "lastEvaluatedAt") _list path;
   }
    : delete_lifecycle_policy_response)

let delete_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : delete_lifecycle_policy_request)

let template_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : template_already_exists_exception)

let create_repository_creation_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_creation_template =
       option_of_yojson
         (value_for_key repository_creation_template_of_yojson "repositoryCreationTemplate")
         _list path;
   }
    : create_repository_creation_template_response)

let create_repository_creation_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = value_for_key prefix_of_yojson "prefix" _list path;
     description =
       option_of_yojson
         (value_for_key repository_template_description_of_yojson "description")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_for_repository_creation_template_of_yojson
            "encryptionConfiguration")
         _list path;
     resource_tags = option_of_yojson (value_for_key tag_list_of_yojson "resourceTags") _list path;
     image_tag_mutability =
       option_of_yojson
         (value_for_key image_tag_mutability_of_yojson "imageTagMutability")
         _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
     repository_policy =
       option_of_yojson
         (value_for_key repository_policy_text_of_yojson "repositoryPolicy")
         _list path;
     lifecycle_policy =
       option_of_yojson
         (value_for_key lifecycle_policy_text_for_repository_creation_template_of_yojson
            "lifecyclePolicy")
         _list path;
     applied_for = value_for_key rct_applied_for_list_of_yojson "appliedFor" _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
   }
    : create_repository_creation_template_request)

let repository_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_already_exists_exception)

let create_repository_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ repository = option_of_yojson (value_for_key repository_of_yojson "repository") _list path }
    : create_repository_response)

let create_repository_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     image_tag_mutability =
       option_of_yojson
         (value_for_key image_tag_mutability_of_yojson "imageTagMutability")
         _list path;
     image_tag_mutability_exclusion_filters =
       option_of_yojson
         (value_for_key image_tag_mutability_exclusion_filters_of_yojson
            "imageTagMutabilityExclusionFilters")
         _list path;
     image_scanning_configuration =
       option_of_yojson
         (value_for_key image_scanning_configuration_of_yojson "imageScanningConfiguration")
         _list path;
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "encryptionConfiguration")
         _list path;
   }
    : create_repository_request)

let unsupported_upstream_registry_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unsupported_upstream_registry_exception)

let pull_through_cache_rule_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : pull_through_cache_rule_already_exists_exception)

let create_pull_through_cache_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix")
         _list path;
     upstream_registry_url =
       option_of_yojson (value_for_key url_of_yojson "upstreamRegistryUrl") _list path;
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     upstream_registry =
       option_of_yojson (value_for_key upstream_registry_of_yojson "upstreamRegistry") _list path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     upstream_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson
            "upstreamRepositoryPrefix")
         _list path;
   }
    : create_pull_through_cache_rule_response)

let create_pull_through_cache_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ecr_repository_prefix =
       value_for_key pull_through_cache_rule_repository_prefix_of_yojson "ecrRepositoryPrefix" _list
         path;
     upstream_registry_url = value_for_key url_of_yojson "upstreamRegistryUrl" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     upstream_registry =
       option_of_yojson (value_for_key upstream_registry_of_yojson "upstreamRegistry") _list path;
     credential_arn =
       option_of_yojson (value_for_key credential_arn_of_yojson "credentialArn") _list path;
     custom_role_arn =
       option_of_yojson (value_for_key custom_role_arn_of_yojson "customRoleArn") _list path;
     upstream_repository_prefix =
       option_of_yojson
         (value_for_key pull_through_cache_rule_repository_prefix_of_yojson
            "upstreamRepositoryPrefix")
         _list path;
   }
    : create_pull_through_cache_rule_request)

let layer_part_too_small_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : layer_part_too_small_exception)

let layer_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : layer_already_exists_exception)

let invalid_layer_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_layer_exception)

let empty_upload_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : empty_upload_exception)

let complete_layer_upload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     layer_digest = option_of_yojson (value_for_key layer_digest_of_yojson "layerDigest") _list path;
   }
    : complete_layer_upload_response)

let layer_digest_list_of_yojson tree path = list_of_yojson layer_digest_of_yojson tree path

let complete_layer_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     upload_id = value_for_key upload_id_of_yojson "uploadId" _list path;
     layer_digests = value_for_key layer_digest_list_of_yojson "layerDigests" _list path;
   }
    : complete_layer_upload_request)

let scanning_configuration_failure_reason_of_yojson = string_of_yojson

let scanning_configuration_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPOSITORY_NOT_FOUND" -> REPOSITORY_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScanningConfigurationFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ScanningConfigurationFailureCode")
     : scanning_configuration_failure_code)
    : scanning_configuration_failure_code)

let repository_scanning_configuration_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     failure_code =
       option_of_yojson
         (value_for_key scanning_configuration_failure_code_of_yojson "failureCode")
         _list path;
     failure_reason =
       option_of_yojson
         (value_for_key scanning_configuration_failure_reason_of_yojson "failureReason")
         _list path;
   }
    : repository_scanning_configuration_failure)

let repository_scanning_configuration_failure_list_of_yojson tree path =
  list_of_yojson repository_scanning_configuration_failure_of_yojson tree path

let repository_scanning_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_arn = option_of_yojson (value_for_key arn_of_yojson "repositoryArn") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     scan_on_push =
       option_of_yojson (value_for_key scan_on_push_flag_of_yojson "scanOnPush") _list path;
     scan_frequency =
       option_of_yojson (value_for_key scan_frequency_of_yojson "scanFrequency") _list path;
     applied_scan_filters =
       option_of_yojson
         (value_for_key scanning_repository_filter_list_of_yojson "appliedScanFilters")
         _list path;
   }
    : repository_scanning_configuration)

let repository_scanning_configuration_list_of_yojson tree path =
  list_of_yojson repository_scanning_configuration_of_yojson tree path

let batch_get_repository_scanning_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scanning_configurations =
       option_of_yojson
         (value_for_key repository_scanning_configuration_list_of_yojson "scanningConfigurations")
         _list path;
     failures =
       option_of_yojson
         (value_for_key repository_scanning_configuration_failure_list_of_yojson "failures")
         _list path;
   }
    : batch_get_repository_scanning_configuration_response)

let scanning_configuration_repository_name_list_of_yojson tree path =
  list_of_yojson repository_name_of_yojson tree path

let batch_get_repository_scanning_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_names =
       value_for_key scanning_configuration_repository_name_list_of_yojson "repositoryNames" _list
         path;
   }
    : batch_get_repository_scanning_configuration_request)

let unable_to_get_upstream_image_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unable_to_get_upstream_image_exception)

let image_failure_reason_of_yojson = string_of_yojson

let image_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvalidImageDigest" -> InvalidImageDigest
    | `String "InvalidImageTag" -> InvalidImageTag
    | `String "ImageTagDoesNotMatchDigest" -> ImageTagDoesNotMatchDigest
    | `String "ImageNotFound" -> ImageNotFound
    | `String "MissingDigestAndTag" -> MissingDigestAndTag
    | `String "ImageReferencedByManifestList" -> ImageReferencedByManifestList
    | `String "KmsError" -> KmsError
    | `String "UpstreamAccessDenied" -> UpstreamAccessDenied
    | `String "UpstreamTooManyRequests" -> UpstreamTooManyRequests
    | `String "UpstreamUnavailable" -> UpstreamUnavailable
    | `String "ImageInaccessible" -> ImageInaccessible
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageFailureCode")
     : image_failure_code)
    : image_failure_code)

let image_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     failure_code =
       option_of_yojson (value_for_key image_failure_code_of_yojson "failureCode") _list path;
     failure_reason =
       option_of_yojson (value_for_key image_failure_reason_of_yojson "failureReason") _list path;
   }
    : image_failure)

let image_failure_list_of_yojson tree path = list_of_yojson image_failure_of_yojson tree path
let image_list_of_yojson tree path = list_of_yojson image_of_yojson tree path

let batch_get_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     images = option_of_yojson (value_for_key image_list_of_yojson "images") _list path;
     failures = option_of_yojson (value_for_key image_failure_list_of_yojson "failures") _list path;
   }
    : batch_get_image_response)

let media_type_list_of_yojson tree path = list_of_yojson media_type_of_yojson tree path

let batch_get_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_ids = value_for_key image_identifier_list_of_yojson "imageIds" _list path;
     accepted_media_types =
       option_of_yojson (value_for_key media_type_list_of_yojson "acceptedMediaTypes") _list path;
   }
    : batch_get_image_request)

let batch_delete_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_ids =
       option_of_yojson (value_for_key image_identifier_list_of_yojson "imageIds") _list path;
     failures = option_of_yojson (value_for_key image_failure_list_of_yojson "failures") _list path;
   }
    : batch_delete_image_response)

let batch_delete_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     image_ids = value_for_key image_identifier_list_of_yojson "imageIds" _list path;
   }
    : batch_delete_image_request)

let layer_failure_reason_of_yojson = string_of_yojson

let layer_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "InvalidLayerDigest" -> InvalidLayerDigest
    | `String "MissingLayerDigest" -> MissingLayerDigest
    | `String value -> raise (deserialize_unknown_enum_value_error path "LayerFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LayerFailureCode")
     : layer_failure_code)
    : layer_failure_code)

let batched_operation_layer_digest_of_yojson = string_of_yojson

let layer_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layer_digest =
       option_of_yojson
         (value_for_key batched_operation_layer_digest_of_yojson "layerDigest")
         _list path;
     failure_code =
       option_of_yojson (value_for_key layer_failure_code_of_yojson "failureCode") _list path;
     failure_reason =
       option_of_yojson (value_for_key layer_failure_reason_of_yojson "failureReason") _list path;
   }
    : layer_failure)

let layer_failure_list_of_yojson tree path = list_of_yojson layer_failure_of_yojson tree path
let layer_size_in_bytes_of_yojson = long_of_yojson

let layer_availability_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "ARCHIVED" -> ARCHIVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LayerAvailability" value)
    | _ -> raise (deserialize_wrong_type_error path "LayerAvailability")
     : layer_availability)
    : layer_availability)

let layer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layer_digest = option_of_yojson (value_for_key layer_digest_of_yojson "layerDigest") _list path;
     layer_availability =
       option_of_yojson (value_for_key layer_availability_of_yojson "layerAvailability") _list path;
     layer_size =
       option_of_yojson (value_for_key layer_size_in_bytes_of_yojson "layerSize") _list path;
     media_type = option_of_yojson (value_for_key media_type_of_yojson "mediaType") _list path;
   }
    : layer)

let layer_list_of_yojson tree path = list_of_yojson layer_of_yojson tree path

let batch_check_layer_availability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layers = option_of_yojson (value_for_key layer_list_of_yojson "layers") _list path;
     failures = option_of_yojson (value_for_key layer_failure_list_of_yojson "failures") _list path;
   }
    : batch_check_layer_availability_response)

let batched_operation_layer_digest_list_of_yojson tree path =
  list_of_yojson batched_operation_layer_digest_of_yojson tree path

let batch_check_layer_availability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     layer_digests =
       value_for_key batched_operation_layer_digest_list_of_yojson "layerDigests" _list path;
   }
    : batch_check_layer_availability_request)
