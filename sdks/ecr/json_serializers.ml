open Smaws_Lib.Json.SerializeHelpers
open Types

let account_setting_name_to_yojson = string_to_yojson
let account_setting_value_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let server_exception_to_yojson (x : server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let pull_through_cache_rule_not_found_exception_to_yojson
    (x : pull_through_cache_rule_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let ptc_validate_failure_to_yojson = string_to_yojson
let is_ptc_rule_valid_to_yojson = bool_to_yojson
let pull_through_cache_rule_repository_prefix_to_yojson = string_to_yojson
let custom_role_arn_to_yojson = string_to_yojson
let credential_arn_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson
let registry_id_to_yojson = string_to_yojson

let validate_pull_through_cache_rule_response_to_yojson
    (x : validate_pull_through_cache_rule_response) =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("isValid", option_to_yojson is_ptc_rule_valid_to_yojson x.is_valid);
      ("failure", option_to_yojson ptc_validate_failure_to_yojson x.failure);
    ]

let validate_pull_through_cache_rule_request_to_yojson
    (x : validate_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let upload_not_found_exception_to_yojson (x : upload_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let repository_not_found_exception_to_yojson (x : repository_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_error_to_yojson = string_to_yojson

let kms_exception_to_yojson (x : kms_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("kmsError", option_to_yojson kms_error_to_yojson x.kms_error);
    ]

let part_size_to_yojson = long_to_yojson
let upload_id_to_yojson = string_to_yojson
let repository_name_to_yojson = string_to_yojson

let invalid_layer_part_exception_to_yojson (x : invalid_layer_part_exception) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("lastValidByteReceived", option_to_yojson part_size_to_yojson x.last_valid_byte_received);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let upload_layer_part_response_to_yojson (x : upload_layer_part_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("lastByteReceived", option_to_yojson part_size_to_yojson x.last_byte_received);
    ]

let layer_part_blob_to_yojson = blob_to_yojson

let upload_layer_part_request_to_yojson (x : upload_layer_part_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("partFirstByte", Some (part_size_to_yojson x.part_first_byte));
      ("partLastByte", Some (part_size_to_yojson x.part_last_byte));
      ("layerPartBlob", Some (layer_part_blob_to_yojson x.layer_part_blob));
    ]

let template_not_found_exception_to_yojson (x : template_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let date_to_yojson = timestamp_epoch_seconds_to_yojson

let rct_applied_for_to_yojson (x : rct_applied_for) =
  match x with
  | REPLICATION -> `String "REPLICATION"
  | PULL_THROUGH_CACHE -> `String "PULL_THROUGH_CACHE"
  | CREATE_ON_PUSH -> `String "CREATE_ON_PUSH"

let rct_applied_for_list_to_yojson tree = list_to_yojson rct_applied_for_to_yojson tree
let lifecycle_policy_text_for_repository_creation_template_to_yojson = string_to_yojson
let repository_policy_text_to_yojson = string_to_yojson
let image_tag_mutability_exclusion_filter_value_to_yojson = string_to_yojson

let image_tag_mutability_exclusion_filter_type_to_yojson
    (x : image_tag_mutability_exclusion_filter_type) =
  match x with WILDCARD -> `String "WILDCARD"

let image_tag_mutability_exclusion_filter_to_yojson (x : image_tag_mutability_exclusion_filter) =
  assoc_to_yojson
    [
      ("filterType", Some (image_tag_mutability_exclusion_filter_type_to_yojson x.filter_type));
      ("filter", Some (image_tag_mutability_exclusion_filter_value_to_yojson x.filter));
    ]

let image_tag_mutability_exclusion_filters_to_yojson tree =
  list_to_yojson image_tag_mutability_exclusion_filter_to_yojson tree

let image_tag_mutability_to_yojson (x : image_tag_mutability) =
  match x with
  | MUTABLE -> `String "MUTABLE"
  | IMMUTABLE -> `String "IMMUTABLE"
  | IMMUTABLE_WITH_EXCLUSION -> `String "IMMUTABLE_WITH_EXCLUSION"
  | MUTABLE_WITH_EXCLUSION -> `String "MUTABLE_WITH_EXCLUSION"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let kms_key_for_repository_creation_template_to_yojson = string_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with AES256 -> `String "AES256" | KMS -> `String "KMS" | KMS_DSSE -> `String "KMS_DSSE"

let encryption_configuration_for_repository_creation_template_to_yojson
    (x : encryption_configuration_for_repository_creation_template) =
  assoc_to_yojson
    [
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("kmsKey", option_to_yojson kms_key_for_repository_creation_template_to_yojson x.kms_key);
    ]

let repository_template_description_to_yojson = string_to_yojson
let prefix_to_yojson = string_to_yojson

let repository_creation_template_to_yojson (x : repository_creation_template) =
  assoc_to_yojson
    [
      ("prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("description", option_to_yojson repository_template_description_to_yojson x.description);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_for_repository_creation_template_to_yojson
          x.encryption_configuration );
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("repositoryPolicy", option_to_yojson repository_policy_text_to_yojson x.repository_policy);
      ( "lifecyclePolicy",
        option_to_yojson lifecycle_policy_text_for_repository_creation_template_to_yojson
          x.lifecycle_policy );
      ("appliedFor", option_to_yojson rct_applied_for_list_to_yojson x.applied_for);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("createdAt", option_to_yojson date_to_yojson x.created_at);
      ("updatedAt", option_to_yojson date_to_yojson x.updated_at);
    ]

let update_repository_creation_template_response_to_yojson
    (x : update_repository_creation_template_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "repositoryCreationTemplate",
        option_to_yojson repository_creation_template_to_yojson x.repository_creation_template );
    ]

let update_repository_creation_template_request_to_yojson
    (x : update_repository_creation_template_request) =
  assoc_to_yojson
    [
      ("prefix", Some (prefix_to_yojson x.prefix));
      ("description", option_to_yojson repository_template_description_to_yojson x.description);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_for_repository_creation_template_to_yojson
          x.encryption_configuration );
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("repositoryPolicy", option_to_yojson repository_policy_text_to_yojson x.repository_policy);
      ( "lifecyclePolicy",
        option_to_yojson lifecycle_policy_text_for_repository_creation_template_to_yojson
          x.lifecycle_policy );
      ("appliedFor", option_to_yojson rct_applied_for_list_to_yojson x.applied_for);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
    ]

let unable_to_decrypt_secret_value_exception_to_yojson
    (x : unable_to_decrypt_secret_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unable_to_access_secret_exception_to_yojson (x : unable_to_access_secret_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let secret_not_found_exception_to_yojson (x : secret_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let updated_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let update_pull_through_cache_rule_response_to_yojson (x : update_pull_through_cache_rule_response)
    =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("updatedAt", option_to_yojson updated_timestamp_to_yojson x.updated_at);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
    ]

let update_pull_through_cache_rule_request_to_yojson (x : update_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
    ]

let image_storage_class_update_not_supported_exception_to_yojson
    (x : image_storage_class_update_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_not_found_exception_to_yojson (x : image_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_status_to_yojson (x : image_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVATING -> `String "ACTIVATING"

let image_tag_to_yojson = string_to_yojson
let image_digest_to_yojson = string_to_yojson

let image_identifier_to_yojson (x : image_identifier) =
  assoc_to_yojson
    [
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("imageTag", option_to_yojson image_tag_to_yojson x.image_tag);
    ]

let update_image_storage_class_response_to_yojson (x : update_image_storage_class_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("imageStatus", option_to_yojson image_status_to_yojson x.image_status);
    ]

let target_storage_class_to_yojson (x : target_storage_class) =
  match x with STANDARD -> `String "STANDARD" | ARCHIVE -> `String "ARCHIVE"

let update_image_storage_class_request_to_yojson (x : update_image_storage_class_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("targetStorageClass", Some (target_storage_class_to_yojson x.target_storage_class));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_tag_parameter_exception_to_yojson (x : invalid_tag_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let lifecycle_policy_preview_in_progress_exception_to_yojson
    (x : lifecycle_policy_preview_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let lifecycle_policy_not_found_exception_to_yojson (x : lifecycle_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let lifecycle_policy_preview_status_to_yojson (x : lifecycle_policy_preview_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | EXPIRED -> `String "EXPIRED"
  | FAILED -> `String "FAILED"

let lifecycle_policy_text_to_yojson = string_to_yojson

let start_lifecycle_policy_preview_response_to_yojson (x : start_lifecycle_policy_preview_response)
    =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("status", option_to_yojson lifecycle_policy_preview_status_to_yojson x.status);
    ]

let start_lifecycle_policy_preview_request_to_yojson (x : start_lifecycle_policy_preview_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
    ]

let unsupported_image_type_exception_to_yojson (x : unsupported_image_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_archived_exception_to_yojson (x : image_archived_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let scan_status_description_to_yojson = string_to_yojson

let scan_status_to_yojson (x : scan_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"
  | UNSUPPORTED_IMAGE -> `String "UNSUPPORTED_IMAGE"
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"
  | SCAN_ELIGIBILITY_EXPIRED -> `String "SCAN_ELIGIBILITY_EXPIRED"
  | FINDINGS_UNAVAILABLE -> `String "FINDINGS_UNAVAILABLE"
  | LIMIT_EXCEEDED -> `String "LIMIT_EXCEEDED"
  | IMAGE_ARCHIVED -> `String "IMAGE_ARCHIVED"

let image_scan_status_to_yojson (x : image_scan_status) =
  assoc_to_yojson
    [
      ("status", option_to_yojson scan_status_to_yojson x.status);
      ("description", option_to_yojson scan_status_description_to_yojson x.description);
    ]

let start_image_scan_response_to_yojson (x : start_image_scan_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("imageScanStatus", option_to_yojson image_scan_status_to_yojson x.image_scan_status);
    ]

let start_image_scan_request_to_yojson (x : start_image_scan_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageId", Some (image_identifier_to_yojson x.image_id));
    ]

let set_repository_policy_response_to_yojson (x : set_repository_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("policyText", option_to_yojson repository_policy_text_to_yojson x.policy_text);
    ]

let force_flag_to_yojson = bool_to_yojson

let set_repository_policy_request_to_yojson (x : set_repository_policy_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("policyText", Some (repository_policy_text_to_yojson x.policy_text));
      ("force", option_to_yojson force_flag_to_yojson x.force);
    ]

let exclusion_already_exists_exception_to_yojson (x : exclusion_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let creation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let principal_arn_to_yojson = string_to_yojson

let register_pull_time_update_exclusion_response_to_yojson
    (x : register_pull_time_update_exclusion_response) =
  assoc_to_yojson
    [
      ("principalArn", option_to_yojson principal_arn_to_yojson x.principal_arn);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
    ]

let register_pull_time_update_exclusion_request_to_yojson
    (x : register_pull_time_update_exclusion_request) =
  assoc_to_yojson [ ("principalArn", Some (principal_arn_to_yojson x.principal_arn)) ]

let signing_repository_filter_type_to_yojson (x : signing_repository_filter_type) =
  match x with WILDCARD_MATCH -> `String "WILDCARD_MATCH"

let signing_repository_filter_value_to_yojson = string_to_yojson

let signing_repository_filter_to_yojson (x : signing_repository_filter) =
  assoc_to_yojson
    [
      ("filter", Some (signing_repository_filter_value_to_yojson x.filter));
      ("filterType", Some (signing_repository_filter_type_to_yojson x.filter_type));
    ]

let signing_repository_filter_list_to_yojson tree =
  list_to_yojson signing_repository_filter_to_yojson tree

let signing_profile_arn_to_yojson = string_to_yojson

let signing_rule_to_yojson (x : signing_rule) =
  assoc_to_yojson
    [
      ("signingProfileArn", Some (signing_profile_arn_to_yojson x.signing_profile_arn));
      ( "repositoryFilters",
        option_to_yojson signing_repository_filter_list_to_yojson x.repository_filters );
    ]

let signing_rule_list_to_yojson tree = list_to_yojson signing_rule_to_yojson tree

let signing_configuration_to_yojson (x : signing_configuration) =
  assoc_to_yojson [ ("rules", Some (signing_rule_list_to_yojson x.rules)) ]

let put_signing_configuration_response_to_yojson (x : put_signing_configuration_response) =
  assoc_to_yojson
    [
      ( "signingConfiguration",
        option_to_yojson signing_configuration_to_yojson x.signing_configuration );
    ]

let put_signing_configuration_request_to_yojson (x : put_signing_configuration_request) =
  assoc_to_yojson
    [ ("signingConfiguration", Some (signing_configuration_to_yojson x.signing_configuration)) ]

let repository_filter_type_to_yojson (x : repository_filter_type) =
  match x with PREFIX_MATCH -> `String "PREFIX_MATCH"

let repository_filter_value_to_yojson = string_to_yojson

let repository_filter_to_yojson (x : repository_filter) =
  assoc_to_yojson
    [
      ("filter", Some (repository_filter_value_to_yojson x.filter));
      ("filterType", Some (repository_filter_type_to_yojson x.filter_type));
    ]

let repository_filter_list_to_yojson tree = list_to_yojson repository_filter_to_yojson tree
let region_to_yojson = string_to_yojson

let replication_destination_to_yojson (x : replication_destination) =
  assoc_to_yojson
    [
      ("region", Some (region_to_yojson x.region));
      ("registryId", Some (registry_id_to_yojson x.registry_id));
    ]

let replication_destination_list_to_yojson tree =
  list_to_yojson replication_destination_to_yojson tree

let replication_rule_to_yojson (x : replication_rule) =
  assoc_to_yojson
    [
      ("destinations", Some (replication_destination_list_to_yojson x.destinations));
      ("repositoryFilters", option_to_yojson repository_filter_list_to_yojson x.repository_filters);
    ]

let replication_rule_list_to_yojson tree = list_to_yojson replication_rule_to_yojson tree

let replication_configuration_to_yojson (x : replication_configuration) =
  assoc_to_yojson [ ("rules", Some (replication_rule_list_to_yojson x.rules)) ]

let put_replication_configuration_response_to_yojson (x : put_replication_configuration_response) =
  assoc_to_yojson
    [
      ( "replicationConfiguration",
        option_to_yojson replication_configuration_to_yojson x.replication_configuration );
    ]

let put_replication_configuration_request_to_yojson (x : put_replication_configuration_request) =
  assoc_to_yojson
    [
      ( "replicationConfiguration",
        Some (replication_configuration_to_yojson x.replication_configuration) );
    ]

let blocked_by_organization_policy_exception_to_yojson
    (x : blocked_by_organization_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let scanning_repository_filter_type_to_yojson (x : scanning_repository_filter_type) =
  match x with WILDCARD -> `String "WILDCARD"

let scanning_repository_filter_value_to_yojson = string_to_yojson

let scanning_repository_filter_to_yojson (x : scanning_repository_filter) =
  assoc_to_yojson
    [
      ("filter", Some (scanning_repository_filter_value_to_yojson x.filter));
      ("filterType", Some (scanning_repository_filter_type_to_yojson x.filter_type));
    ]

let scanning_repository_filter_list_to_yojson tree =
  list_to_yojson scanning_repository_filter_to_yojson tree

let scan_frequency_to_yojson (x : scan_frequency) =
  match x with
  | SCAN_ON_PUSH -> `String "SCAN_ON_PUSH"
  | CONTINUOUS_SCAN -> `String "CONTINUOUS_SCAN"
  | MANUAL -> `String "MANUAL"

let registry_scanning_rule_to_yojson (x : registry_scanning_rule) =
  assoc_to_yojson
    [
      ("scanFrequency", Some (scan_frequency_to_yojson x.scan_frequency));
      ("repositoryFilters", Some (scanning_repository_filter_list_to_yojson x.repository_filters));
    ]

let registry_scanning_rule_list_to_yojson tree =
  list_to_yojson registry_scanning_rule_to_yojson tree

let scan_type_to_yojson (x : scan_type) =
  match x with BASIC -> `String "BASIC" | ENHANCED -> `String "ENHANCED"

let registry_scanning_configuration_to_yojson (x : registry_scanning_configuration) =
  assoc_to_yojson
    [
      ("scanType", option_to_yojson scan_type_to_yojson x.scan_type);
      ("rules", option_to_yojson registry_scanning_rule_list_to_yojson x.rules);
    ]

let put_registry_scanning_configuration_response_to_yojson
    (x : put_registry_scanning_configuration_response) =
  assoc_to_yojson
    [
      ( "registryScanningConfiguration",
        option_to_yojson registry_scanning_configuration_to_yojson x.registry_scanning_configuration
      );
    ]

let put_registry_scanning_configuration_request_to_yojson
    (x : put_registry_scanning_configuration_request) =
  assoc_to_yojson
    [
      ("scanType", option_to_yojson scan_type_to_yojson x.scan_type);
      ("rules", option_to_yojson registry_scanning_rule_list_to_yojson x.rules);
    ]

let registry_policy_text_to_yojson = string_to_yojson

let put_registry_policy_response_to_yojson (x : put_registry_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("policyText", option_to_yojson registry_policy_text_to_yojson x.policy_text);
    ]

let put_registry_policy_request_to_yojson (x : put_registry_policy_request) =
  assoc_to_yojson [ ("policyText", Some (registry_policy_text_to_yojson x.policy_text)) ]

let put_lifecycle_policy_response_to_yojson (x : put_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
    ]

let put_lifecycle_policy_request_to_yojson (x : put_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("lifecyclePolicyText", Some (lifecycle_policy_text_to_yojson x.lifecycle_policy_text));
    ]

let put_image_tag_mutability_response_to_yojson (x : put_image_tag_mutability_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
    ]

let put_image_tag_mutability_request_to_yojson (x : put_image_tag_mutability_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageTagMutability", Some (image_tag_mutability_to_yojson x.image_tag_mutability));
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
    ]

let scan_on_push_flag_to_yojson = bool_to_yojson

let image_scanning_configuration_to_yojson (x : image_scanning_configuration) =
  assoc_to_yojson [ ("scanOnPush", option_to_yojson scan_on_push_flag_to_yojson x.scan_on_push) ]

let put_image_scanning_configuration_response_to_yojson
    (x : put_image_scanning_configuration_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ( "imageScanningConfiguration",
        option_to_yojson image_scanning_configuration_to_yojson x.image_scanning_configuration );
    ]

let put_image_scanning_configuration_request_to_yojson
    (x : put_image_scanning_configuration_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ( "imageScanningConfiguration",
        Some (image_scanning_configuration_to_yojson x.image_scanning_configuration) );
    ]

let referenced_images_not_found_exception_to_yojson (x : referenced_images_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layers_not_found_exception_to_yojson (x : layers_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_tag_already_exists_exception_to_yojson (x : image_tag_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_digest_does_not_match_exception_to_yojson (x : image_digest_does_not_match_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_already_exists_exception_to_yojson (x : image_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let media_type_to_yojson = string_to_yojson
let image_manifest_to_yojson = string_to_yojson

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("imageManifest", option_to_yojson image_manifest_to_yojson x.image_manifest);
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
    ]

let put_image_response_to_yojson (x : put_image_response) =
  assoc_to_yojson [ ("image", option_to_yojson image_to_yojson x.image) ]

let put_image_request_to_yojson (x : put_image_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageManifest", Some (image_manifest_to_yojson x.image_manifest));
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ("imageTag", option_to_yojson image_tag_to_yojson x.image_tag);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
    ]

let put_account_setting_response_to_yojson (x : put_account_setting_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson account_setting_name_to_yojson x.name);
      ("value", option_to_yojson account_setting_value_to_yojson x.value);
    ]

let put_account_setting_request_to_yojson (x : put_account_setting_request) =
  assoc_to_yojson
    [
      ("name", Some (account_setting_name_to_yojson x.name));
      ("value", Some (account_setting_value_to_yojson x.value));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let next_token_to_yojson = string_to_yojson
let pull_time_update_exclusion_list_to_yojson tree = list_to_yojson principal_arn_to_yojson tree

let list_pull_time_update_exclusions_response_to_yojson
    (x : list_pull_time_update_exclusions_response) =
  assoc_to_yojson
    [
      ( "pullTimeUpdateExclusions",
        option_to_yojson pull_time_update_exclusion_list_to_yojson x.pull_time_update_exclusions );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_pull_time_update_exclusions_request_to_yojson
    (x : list_pull_time_update_exclusions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let image_identifier_list_to_yojson tree = list_to_yojson image_identifier_to_yojson tree

let list_images_response_to_yojson (x : list_images_response) =
  assoc_to_yojson
    [
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let image_status_filter_to_yojson (x : image_status_filter) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVATING -> `String "ACTIVATING"
  | ANY -> `String "ANY"

let tag_status_to_yojson (x : tag_status) =
  match x with TAGGED -> `String "TAGGED" | UNTAGGED -> `String "UNTAGGED" | ANY -> `String "ANY"

let list_images_filter_to_yojson (x : list_images_filter) =
  assoc_to_yojson
    [
      ("tagStatus", option_to_yojson tag_status_to_yojson x.tag_status);
      ("imageStatus", option_to_yojson image_status_filter_to_yojson x.image_status);
    ]

let list_images_request_to_yojson (x : list_images_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson list_images_filter_to_yojson x.filter);
    ]

let unable_to_list_upstream_image_referrers_exception_to_yojson
    (x : unable_to_list_upstream_image_referrers_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let artifact_status_to_yojson (x : artifact_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVATING -> `String "ACTIVATING"

let string__to_yojson = string_to_yojson
let annotations_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let image_size_in_bytes_to_yojson = long_to_yojson
let artifact_type_to_yojson = string_to_yojson

let image_referrer_to_yojson (x : image_referrer) =
  assoc_to_yojson
    [
      ("digest", Some (image_digest_to_yojson x.digest));
      ("mediaType", Some (media_type_to_yojson x.media_type));
      ("artifactType", option_to_yojson artifact_type_to_yojson x.artifact_type);
      ("size", Some (image_size_in_bytes_to_yojson x.size));
      ("annotations", option_to_yojson annotations_to_yojson x.annotations);
      ("artifactStatus", option_to_yojson artifact_status_to_yojson x.artifact_status);
    ]

let image_referrer_list_to_yojson tree = list_to_yojson image_referrer_to_yojson tree

let list_image_referrers_response_to_yojson (x : list_image_referrers_response) =
  assoc_to_yojson
    [
      ("referrers", option_to_yojson image_referrer_list_to_yojson x.referrers);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let fifty_max_results_to_yojson = int_to_yojson

let artifact_status_filter_to_yojson (x : artifact_status_filter) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVATING -> `String "ACTIVATING"
  | ANY -> `String "ANY"

let artifact_type_list_to_yojson tree = list_to_yojson artifact_type_to_yojson tree

let list_image_referrers_filter_to_yojson (x : list_image_referrers_filter) =
  assoc_to_yojson
    [
      ("artifactTypes", option_to_yojson artifact_type_list_to_yojson x.artifact_types);
      ("artifactStatus", option_to_yojson artifact_status_filter_to_yojson x.artifact_status);
    ]

let subject_identifier_to_yojson (x : subject_identifier) =
  assoc_to_yojson [ ("imageDigest", Some (image_digest_to_yojson x.image_digest)) ]

let list_image_referrers_request_to_yojson (x : list_image_referrers_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("subjectId", Some (subject_identifier_to_yojson x.subject_id));
      ("filter", option_to_yojson list_image_referrers_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson fifty_max_results_to_yojson x.max_results);
    ]

let initiate_layer_upload_response_to_yojson (x : initiate_layer_upload_response) =
  assoc_to_yojson
    [
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("partSize", option_to_yojson part_size_to_yojson x.part_size);
    ]

let initiate_layer_upload_request_to_yojson (x : initiate_layer_upload_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let signing_configuration_not_found_exception_to_yojson
    (x : signing_configuration_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let get_signing_configuration_response_to_yojson (x : get_signing_configuration_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "signingConfiguration",
        option_to_yojson signing_configuration_to_yojson x.signing_configuration );
    ]

let get_signing_configuration_request_to_yojson = unit_to_yojson

let repository_policy_not_found_exception_to_yojson (x : repository_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let get_repository_policy_response_to_yojson (x : get_repository_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("policyText", option_to_yojson repository_policy_text_to_yojson x.policy_text);
    ]

let get_repository_policy_request_to_yojson (x : get_repository_policy_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let get_registry_scanning_configuration_response_to_yojson
    (x : get_registry_scanning_configuration_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "scanningConfiguration",
        option_to_yojson registry_scanning_configuration_to_yojson x.scanning_configuration );
    ]

let get_registry_scanning_configuration_request_to_yojson = unit_to_yojson

let registry_policy_not_found_exception_to_yojson (x : registry_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let get_registry_policy_response_to_yojson (x : get_registry_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("policyText", option_to_yojson registry_policy_text_to_yojson x.policy_text);
    ]

let get_registry_policy_request_to_yojson = unit_to_yojson

let lifecycle_policy_preview_not_found_exception_to_yojson
    (x : lifecycle_policy_preview_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_count_to_yojson = int_to_yojson

let lifecycle_policy_target_storage_class_to_yojson (x : lifecycle_policy_target_storage_class) =
  match x with ARCHIVE -> `String "ARCHIVE"

let transitioning_image_total_count_to_yojson (x : transitioning_image_total_count) =
  assoc_to_yojson
    [
      ( "targetStorageClass",
        option_to_yojson lifecycle_policy_target_storage_class_to_yojson x.target_storage_class );
      ("imageTotalCount", option_to_yojson image_count_to_yojson x.image_total_count);
    ]

let transitioning_image_total_counts_to_yojson tree =
  list_to_yojson transitioning_image_total_count_to_yojson tree

let lifecycle_policy_preview_summary_to_yojson (x : lifecycle_policy_preview_summary) =
  assoc_to_yojson
    [
      ( "expiringImageTotalCount",
        option_to_yojson image_count_to_yojson x.expiring_image_total_count );
      ( "transitioningImageTotalCounts",
        option_to_yojson transitioning_image_total_counts_to_yojson
          x.transitioning_image_total_counts );
    ]

let lifecycle_policy_storage_class_to_yojson (x : lifecycle_policy_storage_class) =
  match x with ARCHIVE -> `String "ARCHIVE" | STANDARD -> `String "STANDARD"

let lifecycle_policy_rule_priority_to_yojson = int_to_yojson

let image_action_type_to_yojson (x : image_action_type) =
  match x with EXPIRE -> `String "EXPIRE" | TRANSITION -> `String "TRANSITION"

let lifecycle_policy_rule_action_to_yojson (x : lifecycle_policy_rule_action) =
  assoc_to_yojson
    [
      ("type", option_to_yojson image_action_type_to_yojson x.type_);
      ( "targetStorageClass",
        option_to_yojson lifecycle_policy_target_storage_class_to_yojson x.target_storage_class );
    ]

let push_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let image_tag_list_to_yojson tree = list_to_yojson image_tag_to_yojson tree

let lifecycle_policy_preview_result_to_yojson (x : lifecycle_policy_preview_result) =
  assoc_to_yojson
    [
      ("imageTags", option_to_yojson image_tag_list_to_yojson x.image_tags);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("imagePushedAt", option_to_yojson push_timestamp_to_yojson x.image_pushed_at);
      ("action", option_to_yojson lifecycle_policy_rule_action_to_yojson x.action);
      ( "appliedRulePriority",
        option_to_yojson lifecycle_policy_rule_priority_to_yojson x.applied_rule_priority );
      ("storageClass", option_to_yojson lifecycle_policy_storage_class_to_yojson x.storage_class);
    ]

let lifecycle_policy_preview_result_list_to_yojson tree =
  list_to_yojson lifecycle_policy_preview_result_to_yojson tree

let get_lifecycle_policy_preview_response_to_yojson (x : get_lifecycle_policy_preview_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("status", option_to_yojson lifecycle_policy_preview_status_to_yojson x.status);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "previewResults",
        option_to_yojson lifecycle_policy_preview_result_list_to_yojson x.preview_results );
      ("summary", option_to_yojson lifecycle_policy_preview_summary_to_yojson x.summary);
    ]

let lifecycle_policy_preview_filter_to_yojson (x : lifecycle_policy_preview_filter) =
  assoc_to_yojson [ ("tagStatus", option_to_yojson tag_status_to_yojson x.tag_status) ]

let lifecycle_preview_max_results_to_yojson = int_to_yojson

let get_lifecycle_policy_preview_request_to_yojson (x : get_lifecycle_policy_preview_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson lifecycle_preview_max_results_to_yojson x.max_results);
      ("filter", option_to_yojson lifecycle_policy_preview_filter_to_yojson x.filter);
    ]

let evaluation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let get_lifecycle_policy_response_to_yojson (x : get_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("lastEvaluatedAt", option_to_yojson evaluation_timestamp_to_yojson x.last_evaluated_at);
    ]

let get_lifecycle_policy_request_to_yojson (x : get_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let unable_to_get_upstream_layer_exception_to_yojson (x : unable_to_get_upstream_layer_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_inaccessible_exception_to_yojson (x : layer_inaccessible_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_digest_to_yojson = string_to_yojson

let get_download_url_for_layer_response_to_yojson (x : get_download_url_for_layer_response) =
  assoc_to_yojson
    [
      ("downloadUrl", option_to_yojson url_to_yojson x.download_url);
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
    ]

let get_download_url_for_layer_request_to_yojson (x : get_download_url_for_layer_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("layerDigest", Some (layer_digest_to_yojson x.layer_digest));
    ]

let proxy_endpoint_to_yojson = string_to_yojson
let expiration_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let base64_to_yojson = string_to_yojson

let authorization_data_to_yojson (x : authorization_data) =
  assoc_to_yojson
    [
      ("authorizationToken", option_to_yojson base64_to_yojson x.authorization_token);
      ("expiresAt", option_to_yojson expiration_timestamp_to_yojson x.expires_at);
      ("proxyEndpoint", option_to_yojson proxy_endpoint_to_yojson x.proxy_endpoint);
    ]

let authorization_data_list_to_yojson tree = list_to_yojson authorization_data_to_yojson tree

let get_authorization_token_response_to_yojson (x : get_authorization_token_response) =
  assoc_to_yojson
    [
      ("authorizationData", option_to_yojson authorization_data_list_to_yojson x.authorization_data);
    ]

let get_authorization_token_registry_id_list_to_yojson tree =
  list_to_yojson registry_id_to_yojson tree

let get_authorization_token_request_to_yojson (x : get_authorization_token_request) =
  assoc_to_yojson
    [
      ( "registryIds",
        option_to_yojson get_authorization_token_registry_id_list_to_yojson x.registry_ids );
    ]

let get_account_setting_response_to_yojson (x : get_account_setting_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson account_setting_name_to_yojson x.name);
      ("value", option_to_yojson account_setting_name_to_yojson x.value);
    ]

let get_account_setting_request_to_yojson (x : get_account_setting_request) =
  assoc_to_yojson [ ("name", Some (account_setting_name_to_yojson x.name)) ]

let repository_creation_template_list_to_yojson tree =
  list_to_yojson repository_creation_template_to_yojson tree

let describe_repository_creation_templates_response_to_yojson
    (x : describe_repository_creation_templates_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "repositoryCreationTemplates",
        option_to_yojson repository_creation_template_list_to_yojson x.repository_creation_templates
      );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let prefix_list_to_yojson tree = list_to_yojson prefix_to_yojson tree

let describe_repository_creation_templates_request_to_yojson
    (x : describe_repository_creation_templates_request) =
  assoc_to_yojson
    [
      ("prefixes", option_to_yojson prefix_list_to_yojson x.prefixes);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let kms_key_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("kmsKey", option_to_yojson kms_key_to_yojson x.kms_key);
    ]

let repository_to_yojson (x : repository) =
  assoc_to_yojson
    [
      ("repositoryArn", option_to_yojson arn_to_yojson x.repository_arn);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("repositoryUri", option_to_yojson url_to_yojson x.repository_uri);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ( "imageScanningConfiguration",
        option_to_yojson image_scanning_configuration_to_yojson x.image_scanning_configuration );
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let repository_list_to_yojson tree = list_to_yojson repository_to_yojson tree

let describe_repositories_response_to_yojson (x : describe_repositories_response) =
  assoc_to_yojson
    [
      ("repositories", option_to_yojson repository_list_to_yojson x.repositories);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let repository_name_list_to_yojson tree = list_to_yojson repository_name_to_yojson tree

let describe_repositories_request_to_yojson (x : describe_repositories_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryNames", option_to_yojson repository_name_list_to_yojson x.repository_names);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let describe_registry_response_to_yojson (x : describe_registry_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "replicationConfiguration",
        option_to_yojson replication_configuration_to_yojson x.replication_configuration );
    ]

let describe_registry_request_to_yojson = unit_to_yojson

let upstream_registry_to_yojson (x : upstream_registry) =
  match x with
  | Ecr -> `String "ecr"
  | EcrPublic -> `String "ecr-public"
  | Quay -> `String "quay"
  | K8s -> `String "k8s"
  | DockerHub -> `String "docker-hub"
  | GitHubContainerRegistry -> `String "github-container-registry"
  | AzureContainerRegistry -> `String "azure-container-registry"
  | GitLabContainerRegistry -> `String "gitlab-container-registry"
  | Chainguard -> `String "chainguard"

let pull_through_cache_rule_to_yojson (x : pull_through_cache_rule) =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("upstreamRegistry", option_to_yojson upstream_registry_to_yojson x.upstream_registry);
      ("updatedAt", option_to_yojson updated_timestamp_to_yojson x.updated_at);
    ]

let pull_through_cache_rule_list_to_yojson tree =
  list_to_yojson pull_through_cache_rule_to_yojson tree

let describe_pull_through_cache_rules_response_to_yojson
    (x : describe_pull_through_cache_rules_response) =
  assoc_to_yojson
    [
      ( "pullThroughCacheRules",
        option_to_yojson pull_through_cache_rule_list_to_yojson x.pull_through_cache_rules );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let pull_through_cache_rule_repository_prefix_list_to_yojson tree =
  list_to_yojson pull_through_cache_rule_repository_prefix_to_yojson tree

let describe_pull_through_cache_rules_request_to_yojson
    (x : describe_pull_through_cache_rules_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "ecrRepositoryPrefixes",
        option_to_yojson pull_through_cache_rule_repository_prefix_list_to_yojson
          x.ecr_repository_prefixes );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let signing_status_to_yojson (x : signing_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"

let signing_status_failure_reason_to_yojson = string_to_yojson
let signing_status_failure_code_to_yojson = string_to_yojson

let image_signing_status_to_yojson (x : image_signing_status) =
  assoc_to_yojson
    [
      ("signingProfileArn", option_to_yojson signing_profile_arn_to_yojson x.signing_profile_arn);
      ("failureCode", option_to_yojson signing_status_failure_code_to_yojson x.failure_code);
      ("failureReason", option_to_yojson signing_status_failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson signing_status_to_yojson x.status);
    ]

let image_signing_status_list_to_yojson tree = list_to_yojson image_signing_status_to_yojson tree

let describe_image_signing_status_response_to_yojson (x : describe_image_signing_status_response) =
  assoc_to_yojson
    [
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("signingStatuses", option_to_yojson image_signing_status_list_to_yojson x.signing_statuses);
    ]

let describe_image_signing_status_request_to_yojson (x : describe_image_signing_status_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let scan_not_found_exception_to_yojson (x : scan_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let exploit_available_to_yojson = string_to_yojson
let fix_available_to_yojson = string_to_yojson
let type__to_yojson = string_to_yojson
let title_to_yojson = string_to_yojson
let status_to_yojson = string_to_yojson
let severity_to_yojson = string_to_yojson
let version_to_yojson = string_to_yojson
let scoring_vector_to_yojson = string_to_yojson
let source_to_yojson = string_to_yojson
let score_to_yojson = double_to_yojson
let reason_to_yojson = string_to_yojson
let metric_to_yojson = string_to_yojson

let cvss_score_adjustment_to_yojson (x : cvss_score_adjustment) =
  assoc_to_yojson
    [
      ("metric", option_to_yojson metric_to_yojson x.metric);
      ("reason", option_to_yojson reason_to_yojson x.reason);
    ]

let cvss_score_adjustment_list_to_yojson tree = list_to_yojson cvss_score_adjustment_to_yojson tree

let cvss_score_details_to_yojson (x : cvss_score_details) =
  assoc_to_yojson
    [
      ("adjustments", option_to_yojson cvss_score_adjustment_list_to_yojson x.adjustments);
      ("score", option_to_yojson score_to_yojson x.score);
      ("scoreSource", option_to_yojson source_to_yojson x.score_source);
      ("scoringVector", option_to_yojson scoring_vector_to_yojson x.scoring_vector);
      ("version", option_to_yojson version_to_yojson x.version);
    ]

let score_details_to_yojson (x : score_details) =
  assoc_to_yojson [ ("cvss", option_to_yojson cvss_score_details_to_yojson x.cvss) ]

let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let resource_id_to_yojson = string_to_yojson
let in_use_count_to_yojson = long_to_yojson
let platform_to_yojson = string_to_yojson
let image_tags_list_to_yojson tree = list_to_yojson image_tag_to_yojson tree
let author_to_yojson = string_to_yojson
let arch_to_yojson = string_to_yojson

let aws_ecr_container_image_details_to_yojson (x : aws_ecr_container_image_details) =
  assoc_to_yojson
    [
      ("architecture", option_to_yojson arch_to_yojson x.architecture);
      ("author", option_to_yojson author_to_yojson x.author);
      ("imageHash", option_to_yojson image_digest_to_yojson x.image_hash);
      ("imageTags", option_to_yojson image_tags_list_to_yojson x.image_tags);
      ("platform", option_to_yojson platform_to_yojson x.platform);
      ("pushedAt", option_to_yojson date_to_yojson x.pushed_at);
      ("lastInUseAt", option_to_yojson date_to_yojson x.last_in_use_at);
      ("inUseCount", option_to_yojson in_use_count_to_yojson x.in_use_count);
      ("registry", option_to_yojson registry_id_to_yojson x.registry);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let resource_details_to_yojson (x : resource_details) =
  assoc_to_yojson
    [
      ( "awsEcrContainerImage",
        option_to_yojson aws_ecr_container_image_details_to_yojson x.aws_ecr_container_image );
    ]

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("details", option_to_yojson resource_details_to_yojson x.details);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("type", option_to_yojson type__to_yojson x.type_);
    ]

let resource_list_to_yojson tree = list_to_yojson resource_to_yojson tree
let recommendation_text_to_yojson = string_to_yojson

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("url", option_to_yojson url_to_yojson x.url);
      ("text", option_to_yojson recommendation_text_to_yojson x.text);
    ]

let remediation_to_yojson (x : remediation) =
  assoc_to_yojson [ ("recommendation", option_to_yojson recommendation_to_yojson x.recommendation) ]

let fixed_in_version_to_yojson = string_to_yojson
let source_layer_hash_to_yojson = string_to_yojson
let release_to_yojson = string_to_yojson
let package_manager_to_yojson = string_to_yojson
let vulnerable_package_name_to_yojson = string_to_yojson
let file_path_to_yojson = string_to_yojson
let epoch_to_yojson = int_to_yojson

let vulnerable_package_to_yojson (x : vulnerable_package) =
  assoc_to_yojson
    [
      ("arch", option_to_yojson arch_to_yojson x.arch);
      ("epoch", option_to_yojson epoch_to_yojson x.epoch);
      ("filePath", option_to_yojson file_path_to_yojson x.file_path);
      ("name", option_to_yojson vulnerable_package_name_to_yojson x.name);
      ("packageManager", option_to_yojson package_manager_to_yojson x.package_manager);
      ("release", option_to_yojson release_to_yojson x.release);
      ("sourceLayerHash", option_to_yojson source_layer_hash_to_yojson x.source_layer_hash);
      ("version", option_to_yojson version_to_yojson x.version);
      ("fixedInVersion", option_to_yojson fixed_in_version_to_yojson x.fixed_in_version);
    ]

let vulnerable_packages_list_to_yojson tree = list_to_yojson vulnerable_package_to_yojson tree
let vulnerability_id_to_yojson = string_to_yojson
let related_vulnerability_to_yojson = string_to_yojson

let related_vulnerabilities_list_to_yojson tree =
  list_to_yojson related_vulnerability_to_yojson tree

let reference_urls_list_to_yojson tree = list_to_yojson url_to_yojson tree
let base_score_to_yojson = double_to_yojson

let cvss_score_to_yojson (x : cvss_score) =
  assoc_to_yojson
    [
      ("baseScore", option_to_yojson base_score_to_yojson x.base_score);
      ("scoringVector", option_to_yojson scoring_vector_to_yojson x.scoring_vector);
      ("source", option_to_yojson source_to_yojson x.source);
      ("version", option_to_yojson version_to_yojson x.version);
    ]

let cvss_score_list_to_yojson tree = list_to_yojson cvss_score_to_yojson tree

let package_vulnerability_details_to_yojson (x : package_vulnerability_details) =
  assoc_to_yojson
    [
      ("cvss", option_to_yojson cvss_score_list_to_yojson x.cvss);
      ("referenceUrls", option_to_yojson reference_urls_list_to_yojson x.reference_urls);
      ( "relatedVulnerabilities",
        option_to_yojson related_vulnerabilities_list_to_yojson x.related_vulnerabilities );
      ("source", option_to_yojson source_to_yojson x.source);
      ("sourceUrl", option_to_yojson url_to_yojson x.source_url);
      ("vendorCreatedAt", option_to_yojson date_to_yojson x.vendor_created_at);
      ("vendorSeverity", option_to_yojson severity_to_yojson x.vendor_severity);
      ("vendorUpdatedAt", option_to_yojson date_to_yojson x.vendor_updated_at);
      ("vulnerabilityId", option_to_yojson vulnerability_id_to_yojson x.vulnerability_id);
      ( "vulnerablePackages",
        option_to_yojson vulnerable_packages_list_to_yojson x.vulnerable_packages );
    ]

let finding_arn_to_yojson = string_to_yojson
let finding_description_to_yojson = string_to_yojson

let enhanced_image_scan_finding_to_yojson (x : enhanced_image_scan_finding) =
  assoc_to_yojson
    [
      ("awsAccountId", option_to_yojson registry_id_to_yojson x.aws_account_id);
      ("description", option_to_yojson finding_description_to_yojson x.description);
      ("findingArn", option_to_yojson finding_arn_to_yojson x.finding_arn);
      ("firstObservedAt", option_to_yojson date_to_yojson x.first_observed_at);
      ("lastObservedAt", option_to_yojson date_to_yojson x.last_observed_at);
      ( "packageVulnerabilityDetails",
        option_to_yojson package_vulnerability_details_to_yojson x.package_vulnerability_details );
      ("remediation", option_to_yojson remediation_to_yojson x.remediation);
      ("resources", option_to_yojson resource_list_to_yojson x.resources);
      ("score", option_to_yojson score_to_yojson x.score);
      ("scoreDetails", option_to_yojson score_details_to_yojson x.score_details);
      ("severity", option_to_yojson severity_to_yojson x.severity);
      ("status", option_to_yojson status_to_yojson x.status);
      ("title", option_to_yojson title_to_yojson x.title);
      ("type", option_to_yojson type__to_yojson x.type_);
      ("updatedAt", option_to_yojson date_to_yojson x.updated_at);
      ("fixAvailable", option_to_yojson fix_available_to_yojson x.fix_available);
      ("exploitAvailable", option_to_yojson exploit_available_to_yojson x.exploit_available);
    ]

let enhanced_image_scan_finding_list_to_yojson tree =
  list_to_yojson enhanced_image_scan_finding_to_yojson tree

let attribute_value_to_yojson = string_to_yojson
let attribute_key_to_yojson = string_to_yojson

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("key", Some (attribute_key_to_yojson x.key));
      ("value", option_to_yojson attribute_value_to_yojson x.value);
    ]

let attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree

let finding_severity_to_yojson (x : finding_severity) =
  match x with
  | INFORMATIONAL -> `String "INFORMATIONAL"
  | LOW -> `String "LOW"
  | MEDIUM -> `String "MEDIUM"
  | HIGH -> `String "HIGH"
  | CRITICAL -> `String "CRITICAL"
  | UNDEFINED -> `String "UNDEFINED"

let finding_name_to_yojson = string_to_yojson

let image_scan_finding_to_yojson (x : image_scan_finding) =
  assoc_to_yojson
    [
      ("name", option_to_yojson finding_name_to_yojson x.name);
      ("description", option_to_yojson finding_description_to_yojson x.description);
      ("uri", option_to_yojson url_to_yojson x.uri);
      ("severity", option_to_yojson finding_severity_to_yojson x.severity);
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
    ]

let image_scan_finding_list_to_yojson tree = list_to_yojson image_scan_finding_to_yojson tree
let severity_count_to_yojson = int_to_yojson

let finding_severity_counts_to_yojson tree =
  map_to_yojson finding_severity_to_yojson severity_count_to_yojson tree

let vulnerability_source_update_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let scan_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let image_scan_findings_to_yojson (x : image_scan_findings) =
  assoc_to_yojson
    [
      ("imageScanCompletedAt", option_to_yojson scan_timestamp_to_yojson x.image_scan_completed_at);
      ( "vulnerabilitySourceUpdatedAt",
        option_to_yojson vulnerability_source_update_timestamp_to_yojson
          x.vulnerability_source_updated_at );
      ( "findingSeverityCounts",
        option_to_yojson finding_severity_counts_to_yojson x.finding_severity_counts );
      ("findings", option_to_yojson image_scan_finding_list_to_yojson x.findings);
      ( "enhancedFindings",
        option_to_yojson enhanced_image_scan_finding_list_to_yojson x.enhanced_findings );
    ]

let describe_image_scan_findings_response_to_yojson (x : describe_image_scan_findings_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("imageScanStatus", option_to_yojson image_scan_status_to_yojson x.image_scan_status);
      ("imageScanFindings", option_to_yojson image_scan_findings_to_yojson x.image_scan_findings);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_image_scan_findings_request_to_yojson (x : describe_image_scan_findings_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let last_activated_at_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let last_archived_at_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let recorded_pull_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let image_scan_findings_summary_to_yojson (x : image_scan_findings_summary) =
  assoc_to_yojson
    [
      ("imageScanCompletedAt", option_to_yojson scan_timestamp_to_yojson x.image_scan_completed_at);
      ( "vulnerabilitySourceUpdatedAt",
        option_to_yojson vulnerability_source_update_timestamp_to_yojson
          x.vulnerability_source_updated_at );
      ( "findingSeverityCounts",
        option_to_yojson finding_severity_counts_to_yojson x.finding_severity_counts );
    ]

let image_detail_to_yojson (x : image_detail) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("imageTags", option_to_yojson image_tag_list_to_yojson x.image_tags);
      ("imageSizeInBytes", option_to_yojson image_size_in_bytes_to_yojson x.image_size_in_bytes);
      ("imagePushedAt", option_to_yojson push_timestamp_to_yojson x.image_pushed_at);
      ("imageScanStatus", option_to_yojson image_scan_status_to_yojson x.image_scan_status);
      ( "imageScanFindingsSummary",
        option_to_yojson image_scan_findings_summary_to_yojson x.image_scan_findings_summary );
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ("artifactMediaType", option_to_yojson media_type_to_yojson x.artifact_media_type);
      ( "lastRecordedPullTime",
        option_to_yojson recorded_pull_timestamp_to_yojson x.last_recorded_pull_time );
      ("subjectManifestDigest", option_to_yojson image_digest_to_yojson x.subject_manifest_digest);
      ("imageStatus", option_to_yojson image_status_to_yojson x.image_status);
      ("lastArchivedAt", option_to_yojson last_archived_at_timestamp_to_yojson x.last_archived_at);
      ("lastActivatedAt", option_to_yojson last_activated_at_timestamp_to_yojson x.last_activated_at);
    ]

let image_detail_list_to_yojson tree = list_to_yojson image_detail_to_yojson tree

let describe_images_response_to_yojson (x : describe_images_response) =
  assoc_to_yojson
    [
      ("imageDetails", option_to_yojson image_detail_list_to_yojson x.image_details);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_images_filter_to_yojson (x : describe_images_filter) =
  assoc_to_yojson
    [
      ("tagStatus", option_to_yojson tag_status_to_yojson x.tag_status);
      ("imageStatus", option_to_yojson image_status_filter_to_yojson x.image_status);
    ]

let describe_images_request_to_yojson (x : describe_images_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson describe_images_filter_to_yojson x.filter);
    ]

let replication_error_to_yojson = string_to_yojson

let replication_status_to_yojson (x : replication_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"

let image_replication_status_to_yojson (x : image_replication_status) =
  assoc_to_yojson
    [
      ("region", option_to_yojson region_to_yojson x.region);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("status", option_to_yojson replication_status_to_yojson x.status);
      ("failureCode", option_to_yojson replication_error_to_yojson x.failure_code);
    ]

let image_replication_status_list_to_yojson tree =
  list_to_yojson image_replication_status_to_yojson tree

let describe_image_replication_status_response_to_yojson
    (x : describe_image_replication_status_response) =
  assoc_to_yojson
    [
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ( "replicationStatuses",
        option_to_yojson image_replication_status_list_to_yojson x.replication_statuses );
    ]

let describe_image_replication_status_request_to_yojson
    (x : describe_image_replication_status_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let exclusion_not_found_exception_to_yojson (x : exclusion_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let deregister_pull_time_update_exclusion_response_to_yojson
    (x : deregister_pull_time_update_exclusion_response) =
  assoc_to_yojson [ ("principalArn", option_to_yojson principal_arn_to_yojson x.principal_arn) ]

let deregister_pull_time_update_exclusion_request_to_yojson
    (x : deregister_pull_time_update_exclusion_request) =
  assoc_to_yojson [ ("principalArn", Some (principal_arn_to_yojson x.principal_arn)) ]

let delete_signing_configuration_response_to_yojson (x : delete_signing_configuration_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "signingConfiguration",
        option_to_yojson signing_configuration_to_yojson x.signing_configuration );
    ]

let delete_signing_configuration_request_to_yojson = unit_to_yojson

let delete_repository_policy_response_to_yojson (x : delete_repository_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("policyText", option_to_yojson repository_policy_text_to_yojson x.policy_text);
    ]

let delete_repository_policy_request_to_yojson (x : delete_repository_policy_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let delete_repository_creation_template_response_to_yojson
    (x : delete_repository_creation_template_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "repositoryCreationTemplate",
        option_to_yojson repository_creation_template_to_yojson x.repository_creation_template );
    ]

let delete_repository_creation_template_request_to_yojson
    (x : delete_repository_creation_template_request) =
  assoc_to_yojson [ ("prefix", Some (prefix_to_yojson x.prefix)) ]

let repository_not_empty_exception_to_yojson (x : repository_not_empty_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_repository_response_to_yojson (x : delete_repository_response) =
  assoc_to_yojson [ ("repository", option_to_yojson repository_to_yojson x.repository) ]

let delete_repository_request_to_yojson (x : delete_repository_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("force", option_to_yojson force_flag_to_yojson x.force);
    ]

let delete_registry_policy_response_to_yojson (x : delete_registry_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("policyText", option_to_yojson registry_policy_text_to_yojson x.policy_text);
    ]

let delete_registry_policy_request_to_yojson = unit_to_yojson

let delete_pull_through_cache_rule_response_to_yojson (x : delete_pull_through_cache_rule_response)
    =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
    ]

let delete_pull_through_cache_rule_request_to_yojson (x : delete_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_lifecycle_policy_response_to_yojson (x : delete_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("lastEvaluatedAt", option_to_yojson evaluation_timestamp_to_yojson x.last_evaluated_at);
    ]

let delete_lifecycle_policy_request_to_yojson (x : delete_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let template_already_exists_exception_to_yojson (x : template_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_repository_creation_template_response_to_yojson
    (x : create_repository_creation_template_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "repositoryCreationTemplate",
        option_to_yojson repository_creation_template_to_yojson x.repository_creation_template );
    ]

let create_repository_creation_template_request_to_yojson
    (x : create_repository_creation_template_request) =
  assoc_to_yojson
    [
      ("prefix", Some (prefix_to_yojson x.prefix));
      ("description", option_to_yojson repository_template_description_to_yojson x.description);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_for_repository_creation_template_to_yojson
          x.encryption_configuration );
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("repositoryPolicy", option_to_yojson repository_policy_text_to_yojson x.repository_policy);
      ( "lifecyclePolicy",
        option_to_yojson lifecycle_policy_text_for_repository_creation_template_to_yojson
          x.lifecycle_policy );
      ("appliedFor", Some (rct_applied_for_list_to_yojson x.applied_for));
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
    ]

let repository_already_exists_exception_to_yojson (x : repository_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_repository_response_to_yojson (x : create_repository_response) =
  assoc_to_yojson [ ("repository", option_to_yojson repository_to_yojson x.repository) ]

let create_repository_request_to_yojson (x : create_repository_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ( "imageScanningConfiguration",
        option_to_yojson image_scanning_configuration_to_yojson x.image_scanning_configuration );
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let unsupported_upstream_registry_exception_to_yojson (x : unsupported_upstream_registry_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let pull_through_cache_rule_already_exists_exception_to_yojson
    (x : pull_through_cache_rule_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_pull_through_cache_rule_response_to_yojson (x : create_pull_through_cache_rule_response)
    =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("upstreamRegistry", option_to_yojson upstream_registry_to_yojson x.upstream_registry);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
    ]

let create_pull_through_cache_rule_request_to_yojson (x : create_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
      ("upstreamRegistryUrl", Some (url_to_yojson x.upstream_registry_url));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("upstreamRegistry", option_to_yojson upstream_registry_to_yojson x.upstream_registry);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
    ]

let layer_part_too_small_exception_to_yojson (x : layer_part_too_small_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_already_exists_exception_to_yojson (x : layer_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_layer_exception_to_yojson (x : invalid_layer_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let empty_upload_exception_to_yojson (x : empty_upload_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let complete_layer_upload_response_to_yojson (x : complete_layer_upload_response) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
    ]

let layer_digest_list_to_yojson tree = list_to_yojson layer_digest_to_yojson tree

let complete_layer_upload_request_to_yojson (x : complete_layer_upload_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("layerDigests", Some (layer_digest_list_to_yojson x.layer_digests));
    ]

let scanning_configuration_failure_reason_to_yojson = string_to_yojson

let scanning_configuration_failure_code_to_yojson (x : scanning_configuration_failure_code) =
  match x with REPOSITORY_NOT_FOUND -> `String "REPOSITORY_NOT_FOUND"

let repository_scanning_configuration_failure_to_yojson
    (x : repository_scanning_configuration_failure) =
  assoc_to_yojson
    [
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("failureCode", option_to_yojson scanning_configuration_failure_code_to_yojson x.failure_code);
      ( "failureReason",
        option_to_yojson scanning_configuration_failure_reason_to_yojson x.failure_reason );
    ]

let repository_scanning_configuration_failure_list_to_yojson tree =
  list_to_yojson repository_scanning_configuration_failure_to_yojson tree

let repository_scanning_configuration_to_yojson (x : repository_scanning_configuration) =
  assoc_to_yojson
    [
      ("repositoryArn", option_to_yojson arn_to_yojson x.repository_arn);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("scanOnPush", option_to_yojson scan_on_push_flag_to_yojson x.scan_on_push);
      ("scanFrequency", option_to_yojson scan_frequency_to_yojson x.scan_frequency);
      ( "appliedScanFilters",
        option_to_yojson scanning_repository_filter_list_to_yojson x.applied_scan_filters );
    ]

let repository_scanning_configuration_list_to_yojson tree =
  list_to_yojson repository_scanning_configuration_to_yojson tree

let batch_get_repository_scanning_configuration_response_to_yojson
    (x : batch_get_repository_scanning_configuration_response) =
  assoc_to_yojson
    [
      ( "scanningConfigurations",
        option_to_yojson repository_scanning_configuration_list_to_yojson x.scanning_configurations
      );
      ( "failures",
        option_to_yojson repository_scanning_configuration_failure_list_to_yojson x.failures );
    ]

let scanning_configuration_repository_name_list_to_yojson tree =
  list_to_yojson repository_name_to_yojson tree

let batch_get_repository_scanning_configuration_request_to_yojson
    (x : batch_get_repository_scanning_configuration_request) =
  assoc_to_yojson
    [
      ( "repositoryNames",
        Some (scanning_configuration_repository_name_list_to_yojson x.repository_names) );
    ]

let unable_to_get_upstream_image_exception_to_yojson (x : unable_to_get_upstream_image_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_failure_reason_to_yojson = string_to_yojson

let image_failure_code_to_yojson (x : image_failure_code) =
  match x with
  | InvalidImageDigest -> `String "InvalidImageDigest"
  | InvalidImageTag -> `String "InvalidImageTag"
  | ImageTagDoesNotMatchDigest -> `String "ImageTagDoesNotMatchDigest"
  | ImageNotFound -> `String "ImageNotFound"
  | MissingDigestAndTag -> `String "MissingDigestAndTag"
  | ImageReferencedByManifestList -> `String "ImageReferencedByManifestList"
  | KmsError -> `String "KmsError"
  | UpstreamAccessDenied -> `String "UpstreamAccessDenied"
  | UpstreamTooManyRequests -> `String "UpstreamTooManyRequests"
  | UpstreamUnavailable -> `String "UpstreamUnavailable"
  | ImageInaccessible -> `String "ImageInaccessible"

let image_failure_to_yojson (x : image_failure) =
  assoc_to_yojson
    [
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("failureCode", option_to_yojson image_failure_code_to_yojson x.failure_code);
      ("failureReason", option_to_yojson image_failure_reason_to_yojson x.failure_reason);
    ]

let image_failure_list_to_yojson tree = list_to_yojson image_failure_to_yojson tree
let image_list_to_yojson tree = list_to_yojson image_to_yojson tree

let batch_get_image_response_to_yojson (x : batch_get_image_response) =
  assoc_to_yojson
    [
      ("images", option_to_yojson image_list_to_yojson x.images);
      ("failures", option_to_yojson image_failure_list_to_yojson x.failures);
    ]

let media_type_list_to_yojson tree = list_to_yojson media_type_to_yojson tree

let batch_get_image_request_to_yojson (x : batch_get_image_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageIds", Some (image_identifier_list_to_yojson x.image_ids));
      ("acceptedMediaTypes", option_to_yojson media_type_list_to_yojson x.accepted_media_types);
    ]

let batch_delete_image_response_to_yojson (x : batch_delete_image_response) =
  assoc_to_yojson
    [
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
      ("failures", option_to_yojson image_failure_list_to_yojson x.failures);
    ]

let batch_delete_image_request_to_yojson (x : batch_delete_image_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("imageIds", Some (image_identifier_list_to_yojson x.image_ids));
    ]

let layer_failure_reason_to_yojson = string_to_yojson

let layer_failure_code_to_yojson (x : layer_failure_code) =
  match x with
  | InvalidLayerDigest -> `String "InvalidLayerDigest"
  | MissingLayerDigest -> `String "MissingLayerDigest"

let batched_operation_layer_digest_to_yojson = string_to_yojson

let layer_failure_to_yojson (x : layer_failure) =
  assoc_to_yojson
    [
      ("layerDigest", option_to_yojson batched_operation_layer_digest_to_yojson x.layer_digest);
      ("failureCode", option_to_yojson layer_failure_code_to_yojson x.failure_code);
      ("failureReason", option_to_yojson layer_failure_reason_to_yojson x.failure_reason);
    ]

let layer_failure_list_to_yojson tree = list_to_yojson layer_failure_to_yojson tree
let layer_size_in_bytes_to_yojson = long_to_yojson

let layer_availability_to_yojson (x : layer_availability) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | ARCHIVED -> `String "ARCHIVED"

let layer_to_yojson (x : layer) =
  assoc_to_yojson
    [
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
      ("layerAvailability", option_to_yojson layer_availability_to_yojson x.layer_availability);
      ("layerSize", option_to_yojson layer_size_in_bytes_to_yojson x.layer_size);
      ("mediaType", option_to_yojson media_type_to_yojson x.media_type);
    ]

let layer_list_to_yojson tree = list_to_yojson layer_to_yojson tree

let batch_check_layer_availability_response_to_yojson (x : batch_check_layer_availability_response)
    =
  assoc_to_yojson
    [
      ("layers", option_to_yojson layer_list_to_yojson x.layers);
      ("failures", option_to_yojson layer_failure_list_to_yojson x.failures);
    ]

let batched_operation_layer_digest_list_to_yojson tree =
  list_to_yojson batched_operation_layer_digest_to_yojson tree

let batch_check_layer_availability_request_to_yojson (x : batch_check_layer_availability_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("layerDigests", Some (batched_operation_layer_digest_list_to_yojson x.layer_digests));
    ]
