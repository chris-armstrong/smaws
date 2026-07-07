open Smaws_Lib.Json.SerializeHelpers
open Types

let arch_to_yojson = string_to_yojson
let epoch_to_yojson = int_to_yojson
let file_path_to_yojson = string_to_yojson
let vulnerable_package_name_to_yojson = string_to_yojson
let package_manager_to_yojson = string_to_yojson
let release_to_yojson = string_to_yojson
let source_layer_hash_to_yojson = string_to_yojson
let version_to_yojson = string_to_yojson
let fixed_in_version_to_yojson = string_to_yojson

let vulnerable_package_to_yojson (x : vulnerable_package) =
  assoc_to_yojson
    [
      ("fixedInVersion", option_to_yojson fixed_in_version_to_yojson x.fixed_in_version);
      ("version", option_to_yojson version_to_yojson x.version);
      ("sourceLayerHash", option_to_yojson source_layer_hash_to_yojson x.source_layer_hash);
      ("release", option_to_yojson release_to_yojson x.release);
      ("packageManager", option_to_yojson package_manager_to_yojson x.package_manager);
      ("name", option_to_yojson vulnerable_package_name_to_yojson x.name);
      ("filePath", option_to_yojson file_path_to_yojson x.file_path);
      ("epoch", option_to_yojson epoch_to_yojson x.epoch);
      ("arch", option_to_yojson arch_to_yojson x.arch);
    ]

let vulnerable_packages_list_to_yojson tree = list_to_yojson vulnerable_package_to_yojson tree
let vulnerability_source_update_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let vulnerability_id_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let pull_through_cache_rule_repository_prefix_to_yojson = string_to_yojson
let registry_id_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson
let credential_arn_to_yojson = string_to_yojson
let custom_role_arn_to_yojson = string_to_yojson
let is_ptc_rule_valid_to_yojson = bool_to_yojson
let ptc_validate_failure_to_yojson = string_to_yojson

let validate_pull_through_cache_rule_response_to_yojson
    (x : validate_pull_through_cache_rule_response) =
  assoc_to_yojson
    [
      ("failure", option_to_yojson ptc_validate_failure_to_yojson x.failure);
      ("isValid", option_to_yojson is_ptc_rule_valid_to_yojson x.is_valid);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
    ]

let validate_pull_through_cache_rule_request_to_yojson
    (x : validate_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
    ]

let server_exception_to_yojson (x : server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let pull_through_cache_rule_not_found_exception_to_yojson
    (x : pull_through_cache_rule_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let upstream_registry_to_yojson (x : upstream_registry) =
  match x with
  | Chainguard -> `String "chainguard"
  | GitLabContainerRegistry -> `String "gitlab-container-registry"
  | AzureContainerRegistry -> `String "azure-container-registry"
  | GitHubContainerRegistry -> `String "github-container-registry"
  | DockerHub -> `String "docker-hub"
  | K8s -> `String "k8s"
  | Quay -> `String "quay"
  | EcrPublic -> `String "ecr-public"
  | Ecr -> `String "ecr"

let upload_not_found_exception_to_yojson (x : upload_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let repository_name_to_yojson = string_to_yojson
let upload_id_to_yojson = string_to_yojson
let part_size_to_yojson = long_to_yojson

let upload_layer_part_response_to_yojson (x : upload_layer_part_response) =
  assoc_to_yojson
    [
      ("lastByteReceived", option_to_yojson part_size_to_yojson x.last_byte_received);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let layer_part_blob_to_yojson = blob_to_yojson

let upload_layer_part_request_to_yojson (x : upload_layer_part_request) =
  assoc_to_yojson
    [
      ("layerPartBlob", Some (layer_part_blob_to_yojson x.layer_part_blob));
      ("partLastByte", Some (part_size_to_yojson x.part_last_byte));
      ("partFirstByte", Some (part_size_to_yojson x.part_first_byte));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let repository_not_found_exception_to_yojson (x : repository_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_error_to_yojson = string_to_yojson

let kms_exception_to_yojson (x : kms_exception) =
  assoc_to_yojson
    [
      ("kmsError", option_to_yojson kms_error_to_yojson x.kms_error);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let invalid_layer_part_exception_to_yojson (x : invalid_layer_part_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("lastValidByteReceived", option_to_yojson part_size_to_yojson x.last_valid_byte_received);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let updated_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let prefix_to_yojson = string_to_yojson
let repository_template_description_to_yojson = string_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with KMS_DSSE -> `String "KMS_DSSE" | KMS -> `String "KMS" | AES256 -> `String "AES256"

let kms_key_for_repository_creation_template_to_yojson = string_to_yojson

let encryption_configuration_for_repository_creation_template_to_yojson
    (x : encryption_configuration_for_repository_creation_template) =
  assoc_to_yojson
    [
      ("kmsKey", option_to_yojson kms_key_for_repository_creation_template_to_yojson x.kms_key);
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
    ]

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let image_tag_mutability_to_yojson (x : image_tag_mutability) =
  match x with
  | MUTABLE_WITH_EXCLUSION -> `String "MUTABLE_WITH_EXCLUSION"
  | IMMUTABLE_WITH_EXCLUSION -> `String "IMMUTABLE_WITH_EXCLUSION"
  | IMMUTABLE -> `String "IMMUTABLE"
  | MUTABLE -> `String "MUTABLE"

let image_tag_mutability_exclusion_filter_type_to_yojson
    (x : image_tag_mutability_exclusion_filter_type) =
  match x with WILDCARD -> `String "WILDCARD"

let image_tag_mutability_exclusion_filter_value_to_yojson = string_to_yojson

let image_tag_mutability_exclusion_filter_to_yojson (x : image_tag_mutability_exclusion_filter) =
  assoc_to_yojson
    [
      ("filter", Some (image_tag_mutability_exclusion_filter_value_to_yojson x.filter));
      ("filterType", Some (image_tag_mutability_exclusion_filter_type_to_yojson x.filter_type));
    ]

let image_tag_mutability_exclusion_filters_to_yojson tree =
  list_to_yojson image_tag_mutability_exclusion_filter_to_yojson tree

let repository_policy_text_to_yojson = string_to_yojson
let lifecycle_policy_text_for_repository_creation_template_to_yojson = string_to_yojson

let rct_applied_for_to_yojson (x : rct_applied_for) =
  match x with
  | CREATE_ON_PUSH -> `String "CREATE_ON_PUSH"
  | PULL_THROUGH_CACHE -> `String "PULL_THROUGH_CACHE"
  | REPLICATION -> `String "REPLICATION"

let rct_applied_for_list_to_yojson tree = list_to_yojson rct_applied_for_to_yojson tree
let date_to_yojson = timestamp_epoch_seconds_to_yojson

let repository_creation_template_to_yojson (x : repository_creation_template) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson date_to_yojson x.updated_at);
      ("createdAt", option_to_yojson date_to_yojson x.created_at);
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("appliedFor", option_to_yojson rct_applied_for_list_to_yojson x.applied_for);
      ( "lifecyclePolicy",
        option_to_yojson lifecycle_policy_text_for_repository_creation_template_to_yojson
          x.lifecycle_policy );
      ("repositoryPolicy", option_to_yojson repository_policy_text_to_yojson x.repository_policy);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_for_repository_creation_template_to_yojson
          x.encryption_configuration );
      ("description", option_to_yojson repository_template_description_to_yojson x.description);
      ("prefix", option_to_yojson prefix_to_yojson x.prefix);
    ]

let update_repository_creation_template_response_to_yojson
    (x : update_repository_creation_template_response) =
  assoc_to_yojson
    [
      ( "repositoryCreationTemplate",
        option_to_yojson repository_creation_template_to_yojson x.repository_creation_template );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let update_repository_creation_template_request_to_yojson
    (x : update_repository_creation_template_request) =
  assoc_to_yojson
    [
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("appliedFor", option_to_yojson rct_applied_for_list_to_yojson x.applied_for);
      ( "lifecyclePolicy",
        option_to_yojson lifecycle_policy_text_for_repository_creation_template_to_yojson
          x.lifecycle_policy );
      ("repositoryPolicy", option_to_yojson repository_policy_text_to_yojson x.repository_policy);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_for_repository_creation_template_to_yojson
          x.encryption_configuration );
      ("description", option_to_yojson repository_template_description_to_yojson x.description);
      ("prefix", Some (prefix_to_yojson x.prefix));
    ]

let template_not_found_exception_to_yojson (x : template_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let update_pull_through_cache_rule_response_to_yojson (x : update_pull_through_cache_rule_response)
    =
  assoc_to_yojson
    [
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("updatedAt", option_to_yojson updated_timestamp_to_yojson x.updated_at);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
    ]

let update_pull_through_cache_rule_request_to_yojson (x : update_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let unable_to_decrypt_secret_value_exception_to_yojson
    (x : unable_to_decrypt_secret_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unable_to_access_secret_exception_to_yojson (x : unable_to_access_secret_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let secret_not_found_exception_to_yojson (x : secret_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_digest_to_yojson = string_to_yojson
let image_tag_to_yojson = string_to_yojson

let image_identifier_to_yojson (x : image_identifier) =
  assoc_to_yojson
    [
      ("imageTag", option_to_yojson image_tag_to_yojson x.image_tag);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
    ]

let image_status_to_yojson (x : image_status) =
  match x with
  | ACTIVATING -> `String "ACTIVATING"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVE -> `String "ACTIVE"

let update_image_storage_class_response_to_yojson (x : update_image_storage_class_response) =
  assoc_to_yojson
    [
      ("imageStatus", option_to_yojson image_status_to_yojson x.image_status);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let target_storage_class_to_yojson (x : target_storage_class) =
  match x with ARCHIVE -> `String "ARCHIVE" | STANDARD -> `String "STANDARD"

let update_image_storage_class_request_to_yojson (x : update_image_storage_class_request) =
  assoc_to_yojson
    [
      ("targetStorageClass", Some (target_storage_class_to_yojson x.target_storage_class));
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_storage_class_update_not_supported_exception_to_yojson
    (x : image_storage_class_update_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_not_found_exception_to_yojson (x : image_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let arn_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_tag_parameter_exception_to_yojson (x : invalid_tag_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unsupported_upstream_registry_exception_to_yojson (x : unsupported_upstream_registry_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unsupported_image_type_exception_to_yojson (x : unsupported_image_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unable_to_list_upstream_image_referrers_exception_to_yojson
    (x : unable_to_list_upstream_image_referrers_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unable_to_get_upstream_layer_exception_to_yojson (x : unable_to_get_upstream_layer_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unable_to_get_upstream_image_exception_to_yojson (x : unable_to_get_upstream_image_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let type__to_yojson = string_to_yojson

let lifecycle_policy_target_storage_class_to_yojson (x : lifecycle_policy_target_storage_class) =
  match x with ARCHIVE -> `String "ARCHIVE"

let image_count_to_yojson = int_to_yojson

let transitioning_image_total_count_to_yojson (x : transitioning_image_total_count) =
  assoc_to_yojson
    [
      ("imageTotalCount", option_to_yojson image_count_to_yojson x.image_total_count);
      ( "targetStorageClass",
        option_to_yojson lifecycle_policy_target_storage_class_to_yojson x.target_storage_class );
    ]

let transitioning_image_total_counts_to_yojson tree =
  list_to_yojson transitioning_image_total_count_to_yojson tree

let title_to_yojson = string_to_yojson

let template_already_exists_exception_to_yojson (x : template_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_status_to_yojson (x : tag_status) =
  match x with ANY -> `String "ANY" | UNTAGGED -> `String "UNTAGGED" | TAGGED -> `String "TAGGED"

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let subject_identifier_to_yojson (x : subject_identifier) =
  assoc_to_yojson [ ("imageDigest", Some (image_digest_to_yojson x.image_digest)) ]

let string__to_yojson = string_to_yojson
let status_to_yojson = string_to_yojson
let lifecycle_policy_text_to_yojson = string_to_yojson

let lifecycle_policy_preview_status_to_yojson (x : lifecycle_policy_preview_status) =
  match x with
  | FAILED -> `String "FAILED"
  | EXPIRED -> `String "EXPIRED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let start_lifecycle_policy_preview_response_to_yojson (x : start_lifecycle_policy_preview_response)
    =
  assoc_to_yojson
    [
      ("status", option_to_yojson lifecycle_policy_preview_status_to_yojson x.status);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let start_lifecycle_policy_preview_request_to_yojson (x : start_lifecycle_policy_preview_request) =
  assoc_to_yojson
    [
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let lifecycle_policy_preview_in_progress_exception_to_yojson
    (x : lifecycle_policy_preview_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let lifecycle_policy_not_found_exception_to_yojson (x : lifecycle_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let scan_status_to_yojson (x : scan_status) =
  match x with
  | IMAGE_ARCHIVED -> `String "IMAGE_ARCHIVED"
  | LIMIT_EXCEEDED -> `String "LIMIT_EXCEEDED"
  | FINDINGS_UNAVAILABLE -> `String "FINDINGS_UNAVAILABLE"
  | SCAN_ELIGIBILITY_EXPIRED -> `String "SCAN_ELIGIBILITY_EXPIRED"
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | UNSUPPORTED_IMAGE -> `String "UNSUPPORTED_IMAGE"
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let scan_status_description_to_yojson = string_to_yojson

let image_scan_status_to_yojson (x : image_scan_status) =
  assoc_to_yojson
    [
      ("description", option_to_yojson scan_status_description_to_yojson x.description);
      ("status", option_to_yojson scan_status_to_yojson x.status);
    ]

let start_image_scan_response_to_yojson (x : start_image_scan_response) =
  assoc_to_yojson
    [
      ("imageScanStatus", option_to_yojson image_scan_status_to_yojson x.image_scan_status);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let start_image_scan_request_to_yojson (x : start_image_scan_request) =
  assoc_to_yojson
    [
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_archived_exception_to_yojson (x : image_archived_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let source_to_yojson = string_to_yojson
let signing_status_failure_reason_to_yojson = string_to_yojson
let signing_status_failure_code_to_yojson = string_to_yojson

let signing_status_to_yojson (x : signing_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let signing_profile_arn_to_yojson = string_to_yojson
let signing_repository_filter_value_to_yojson = string_to_yojson

let signing_repository_filter_type_to_yojson (x : signing_repository_filter_type) =
  match x with WILDCARD_MATCH -> `String "WILDCARD_MATCH"

let signing_repository_filter_to_yojson (x : signing_repository_filter) =
  assoc_to_yojson
    [
      ("filterType", Some (signing_repository_filter_type_to_yojson x.filter_type));
      ("filter", Some (signing_repository_filter_value_to_yojson x.filter));
    ]

let signing_repository_filter_list_to_yojson tree =
  list_to_yojson signing_repository_filter_to_yojson tree

let signing_rule_to_yojson (x : signing_rule) =
  assoc_to_yojson
    [
      ( "repositoryFilters",
        option_to_yojson signing_repository_filter_list_to_yojson x.repository_filters );
      ("signingProfileArn", Some (signing_profile_arn_to_yojson x.signing_profile_arn));
    ]

let signing_rule_list_to_yojson tree = list_to_yojson signing_rule_to_yojson tree

let signing_configuration_not_found_exception_to_yojson
    (x : signing_configuration_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let signing_configuration_to_yojson (x : signing_configuration) =
  assoc_to_yojson [ ("rules", Some (signing_rule_list_to_yojson x.rules)) ]

let severity_count_to_yojson = int_to_yojson
let severity_to_yojson = string_to_yojson

let set_repository_policy_response_to_yojson (x : set_repository_policy_response) =
  assoc_to_yojson
    [
      ("policyText", option_to_yojson repository_policy_text_to_yojson x.policy_text);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let force_flag_to_yojson = bool_to_yojson

let set_repository_policy_request_to_yojson (x : set_repository_policy_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson force_flag_to_yojson x.force);
      ("policyText", Some (repository_policy_text_to_yojson x.policy_text));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let scoring_vector_to_yojson = string_to_yojson
let metric_to_yojson = string_to_yojson
let reason_to_yojson = string_to_yojson

let cvss_score_adjustment_to_yojson (x : cvss_score_adjustment) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson reason_to_yojson x.reason);
      ("metric", option_to_yojson metric_to_yojson x.metric);
    ]

let cvss_score_adjustment_list_to_yojson tree = list_to_yojson cvss_score_adjustment_to_yojson tree
let score_to_yojson = double_to_yojson

let cvss_score_details_to_yojson (x : cvss_score_details) =
  assoc_to_yojson
    [
      ("version", option_to_yojson version_to_yojson x.version);
      ("scoringVector", option_to_yojson scoring_vector_to_yojson x.scoring_vector);
      ("scoreSource", option_to_yojson source_to_yojson x.score_source);
      ("score", option_to_yojson score_to_yojson x.score);
      ("adjustments", option_to_yojson cvss_score_adjustment_list_to_yojson x.adjustments);
    ]

let score_details_to_yojson (x : score_details) =
  assoc_to_yojson [ ("cvss", option_to_yojson cvss_score_details_to_yojson x.cvss) ]

let scanning_repository_filter_value_to_yojson = string_to_yojson

let scanning_repository_filter_type_to_yojson (x : scanning_repository_filter_type) =
  match x with WILDCARD -> `String "WILDCARD"

let scanning_repository_filter_to_yojson (x : scanning_repository_filter) =
  assoc_to_yojson
    [
      ("filterType", Some (scanning_repository_filter_type_to_yojson x.filter_type));
      ("filter", Some (scanning_repository_filter_value_to_yojson x.filter));
    ]

let scanning_repository_filter_list_to_yojson tree =
  list_to_yojson scanning_repository_filter_to_yojson tree

let scanning_configuration_repository_name_list_to_yojson tree =
  list_to_yojson repository_name_to_yojson tree

let scanning_configuration_failure_reason_to_yojson = string_to_yojson

let scanning_configuration_failure_code_to_yojson (x : scanning_configuration_failure_code) =
  match x with REPOSITORY_NOT_FOUND -> `String "REPOSITORY_NOT_FOUND"

let scan_type_to_yojson (x : scan_type) =
  match x with ENHANCED -> `String "ENHANCED" | BASIC -> `String "BASIC"

let scan_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let scan_on_push_flag_to_yojson = bool_to_yojson

let scan_not_found_exception_to_yojson (x : scan_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let scan_frequency_to_yojson (x : scan_frequency) =
  match x with
  | MANUAL -> `String "MANUAL"
  | CONTINUOUS_SCAN -> `String "CONTINUOUS_SCAN"
  | SCAN_ON_PUSH -> `String "SCAN_ON_PUSH"

let author_to_yojson = string_to_yojson
let image_tags_list_to_yojson tree = list_to_yojson image_tag_to_yojson tree
let platform_to_yojson = string_to_yojson
let in_use_count_to_yojson = long_to_yojson

let aws_ecr_container_image_details_to_yojson (x : aws_ecr_container_image_details) =
  assoc_to_yojson
    [
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registry", option_to_yojson registry_id_to_yojson x.registry);
      ("inUseCount", option_to_yojson in_use_count_to_yojson x.in_use_count);
      ("lastInUseAt", option_to_yojson date_to_yojson x.last_in_use_at);
      ("pushedAt", option_to_yojson date_to_yojson x.pushed_at);
      ("platform", option_to_yojson platform_to_yojson x.platform);
      ("imageTags", option_to_yojson image_tags_list_to_yojson x.image_tags);
      ("imageHash", option_to_yojson image_digest_to_yojson x.image_hash);
      ("author", option_to_yojson author_to_yojson x.author);
      ("architecture", option_to_yojson arch_to_yojson x.architecture);
    ]

let resource_details_to_yojson (x : resource_details) =
  assoc_to_yojson
    [
      ( "awsEcrContainerImage",
        option_to_yojson aws_ecr_container_image_details_to_yojson x.aws_ecr_container_image );
    ]

let resource_id_to_yojson = string_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("type", option_to_yojson type__to_yojson x.type_);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("details", option_to_yojson resource_details_to_yojson x.details);
    ]

let resource_list_to_yojson tree = list_to_yojson resource_to_yojson tree

let repository_scanning_configuration_to_yojson (x : repository_scanning_configuration) =
  assoc_to_yojson
    [
      ( "appliedScanFilters",
        option_to_yojson scanning_repository_filter_list_to_yojson x.applied_scan_filters );
      ("scanFrequency", option_to_yojson scan_frequency_to_yojson x.scan_frequency);
      ("scanOnPush", option_to_yojson scan_on_push_flag_to_yojson x.scan_on_push);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("repositoryArn", option_to_yojson arn_to_yojson x.repository_arn);
    ]

let repository_scanning_configuration_list_to_yojson tree =
  list_to_yojson repository_scanning_configuration_to_yojson tree

let repository_scanning_configuration_failure_to_yojson
    (x : repository_scanning_configuration_failure) =
  assoc_to_yojson
    [
      ( "failureReason",
        option_to_yojson scanning_configuration_failure_reason_to_yojson x.failure_reason );
      ("failureCode", option_to_yojson scanning_configuration_failure_code_to_yojson x.failure_code);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let repository_scanning_configuration_failure_list_to_yojson tree =
  list_to_yojson repository_scanning_configuration_failure_to_yojson tree

let repository_policy_not_found_exception_to_yojson (x : repository_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let repository_not_empty_exception_to_yojson (x : repository_not_empty_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let repository_name_list_to_yojson tree = list_to_yojson repository_name_to_yojson tree
let creation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let image_scanning_configuration_to_yojson (x : image_scanning_configuration) =
  assoc_to_yojson [ ("scanOnPush", option_to_yojson scan_on_push_flag_to_yojson x.scan_on_push) ]

let kms_key_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("kmsKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("encryptionType", Some (encryption_type_to_yojson x.encryption_type));
    ]

let repository_to_yojson (x : repository) =
  assoc_to_yojson
    [
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "imageScanningConfiguration",
        option_to_yojson image_scanning_configuration_to_yojson x.image_scanning_configuration );
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("repositoryUri", option_to_yojson url_to_yojson x.repository_uri);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryArn", option_to_yojson arn_to_yojson x.repository_arn);
    ]

let repository_list_to_yojson tree = list_to_yojson repository_to_yojson tree
let repository_filter_value_to_yojson = string_to_yojson

let repository_filter_type_to_yojson (x : repository_filter_type) =
  match x with PREFIX_MATCH -> `String "PREFIX_MATCH"

let repository_filter_to_yojson (x : repository_filter) =
  assoc_to_yojson
    [
      ("filterType", Some (repository_filter_type_to_yojson x.filter_type));
      ("filter", Some (repository_filter_value_to_yojson x.filter));
    ]

let repository_filter_list_to_yojson tree = list_to_yojson repository_filter_to_yojson tree

let repository_creation_template_list_to_yojson tree =
  list_to_yojson repository_creation_template_to_yojson tree

let repository_already_exists_exception_to_yojson (x : repository_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let replication_status_to_yojson (x : replication_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let region_to_yojson = string_to_yojson

let replication_destination_to_yojson (x : replication_destination) =
  assoc_to_yojson
    [
      ("registryId", Some (registry_id_to_yojson x.registry_id));
      ("region", Some (region_to_yojson x.region));
    ]

let replication_destination_list_to_yojson tree =
  list_to_yojson replication_destination_to_yojson tree

let replication_rule_to_yojson (x : replication_rule) =
  assoc_to_yojson
    [
      ("repositoryFilters", option_to_yojson repository_filter_list_to_yojson x.repository_filters);
      ("destinations", Some (replication_destination_list_to_yojson x.destinations));
    ]

let replication_rule_list_to_yojson tree = list_to_yojson replication_rule_to_yojson tree
let replication_error_to_yojson = string_to_yojson

let replication_configuration_to_yojson (x : replication_configuration) =
  assoc_to_yojson [ ("rules", Some (replication_rule_list_to_yojson x.rules)) ]

let recommendation_text_to_yojson = string_to_yojson

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("text", option_to_yojson recommendation_text_to_yojson x.text);
      ("url", option_to_yojson url_to_yojson x.url);
    ]

let remediation_to_yojson (x : remediation) =
  assoc_to_yojson [ ("recommendation", option_to_yojson recommendation_to_yojson x.recommendation) ]

let related_vulnerability_to_yojson = string_to_yojson

let related_vulnerabilities_list_to_yojson tree =
  list_to_yojson related_vulnerability_to_yojson tree

let registry_scanning_rule_to_yojson (x : registry_scanning_rule) =
  assoc_to_yojson
    [
      ("repositoryFilters", Some (scanning_repository_filter_list_to_yojson x.repository_filters));
      ("scanFrequency", Some (scan_frequency_to_yojson x.scan_frequency));
    ]

let registry_scanning_rule_list_to_yojson tree =
  list_to_yojson registry_scanning_rule_to_yojson tree

let registry_scanning_configuration_to_yojson (x : registry_scanning_configuration) =
  assoc_to_yojson
    [
      ("rules", option_to_yojson registry_scanning_rule_list_to_yojson x.rules);
      ("scanType", option_to_yojson scan_type_to_yojson x.scan_type);
    ]

let registry_policy_text_to_yojson = string_to_yojson

let registry_policy_not_found_exception_to_yojson (x : registry_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let principal_arn_to_yojson = string_to_yojson

let register_pull_time_update_exclusion_response_to_yojson
    (x : register_pull_time_update_exclusion_response) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("principalArn", option_to_yojson principal_arn_to_yojson x.principal_arn);
    ]

let register_pull_time_update_exclusion_request_to_yojson
    (x : register_pull_time_update_exclusion_request) =
  assoc_to_yojson [ ("principalArn", Some (principal_arn_to_yojson x.principal_arn)) ]

let exclusion_already_exists_exception_to_yojson (x : exclusion_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let referenced_images_not_found_exception_to_yojson (x : referenced_images_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let reference_urls_list_to_yojson tree = list_to_yojson url_to_yojson tree
let recorded_pull_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let put_signing_configuration_response_to_yojson (x : put_signing_configuration_response) =
  assoc_to_yojson
    [
      ( "signingConfiguration",
        option_to_yojson signing_configuration_to_yojson x.signing_configuration );
    ]

let put_signing_configuration_request_to_yojson (x : put_signing_configuration_request) =
  assoc_to_yojson
    [ ("signingConfiguration", Some (signing_configuration_to_yojson x.signing_configuration)) ]

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
      ("rules", option_to_yojson registry_scanning_rule_list_to_yojson x.rules);
      ("scanType", option_to_yojson scan_type_to_yojson x.scan_type);
    ]

let blocked_by_organization_policy_exception_to_yojson
    (x : blocked_by_organization_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let put_registry_policy_response_to_yojson (x : put_registry_policy_response) =
  assoc_to_yojson
    [
      ("policyText", option_to_yojson registry_policy_text_to_yojson x.policy_text);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_registry_policy_request_to_yojson (x : put_registry_policy_request) =
  assoc_to_yojson [ ("policyText", Some (registry_policy_text_to_yojson x.policy_text)) ]

let put_lifecycle_policy_response_to_yojson (x : put_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_lifecycle_policy_request_to_yojson (x : put_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("lifecyclePolicyText", Some (lifecycle_policy_text_to_yojson x.lifecycle_policy_text));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_image_tag_mutability_response_to_yojson (x : put_image_tag_mutability_response) =
  assoc_to_yojson
    [
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_image_tag_mutability_request_to_yojson (x : put_image_tag_mutability_request) =
  assoc_to_yojson
    [
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", Some (image_tag_mutability_to_yojson x.image_tag_mutability));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_image_scanning_configuration_response_to_yojson
    (x : put_image_scanning_configuration_response) =
  assoc_to_yojson
    [
      ( "imageScanningConfiguration",
        option_to_yojson image_scanning_configuration_to_yojson x.image_scanning_configuration );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_image_scanning_configuration_request_to_yojson
    (x : put_image_scanning_configuration_request) =
  assoc_to_yojson
    [
      ( "imageScanningConfiguration",
        Some (image_scanning_configuration_to_yojson x.image_scanning_configuration) );
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_manifest_to_yojson = string_to_yojson
let media_type_to_yojson = string_to_yojson

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ("imageManifest", option_to_yojson image_manifest_to_yojson x.image_manifest);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let put_image_response_to_yojson (x : put_image_response) =
  assoc_to_yojson [ ("image", option_to_yojson image_to_yojson x.image) ]

let put_image_request_to_yojson (x : put_image_request) =
  assoc_to_yojson
    [
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("imageTag", option_to_yojson image_tag_to_yojson x.image_tag);
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ("imageManifest", Some (image_manifest_to_yojson x.image_manifest));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let layers_not_found_exception_to_yojson (x : layers_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_tag_already_exists_exception_to_yojson (x : image_tag_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_digest_does_not_match_exception_to_yojson (x : image_digest_does_not_match_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_already_exists_exception_to_yojson (x : image_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let account_setting_name_to_yojson = string_to_yojson
let account_setting_value_to_yojson = string_to_yojson

let put_account_setting_response_to_yojson (x : put_account_setting_response) =
  assoc_to_yojson
    [
      ("value", option_to_yojson account_setting_value_to_yojson x.value);
      ("name", option_to_yojson account_setting_name_to_yojson x.name);
    ]

let put_account_setting_request_to_yojson (x : put_account_setting_request) =
  assoc_to_yojson
    [
      ("value", Some (account_setting_value_to_yojson x.value));
      ("name", Some (account_setting_name_to_yojson x.name));
    ]

let push_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let pull_time_update_exclusion_list_to_yojson tree = list_to_yojson principal_arn_to_yojson tree

let pull_through_cache_rule_repository_prefix_list_to_yojson tree =
  list_to_yojson pull_through_cache_rule_repository_prefix_to_yojson tree

let pull_through_cache_rule_to_yojson (x : pull_through_cache_rule) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson updated_timestamp_to_yojson x.updated_at);
      ("upstreamRegistry", option_to_yojson upstream_registry_to_yojson x.upstream_registry);
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
    ]

let pull_through_cache_rule_list_to_yojson tree =
  list_to_yojson pull_through_cache_rule_to_yojson tree

let pull_through_cache_rule_already_exists_exception_to_yojson
    (x : pull_through_cache_rule_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let proxy_endpoint_to_yojson = string_to_yojson
let prefix_list_to_yojson tree = list_to_yojson prefix_to_yojson tree
let base_score_to_yojson = double_to_yojson

let cvss_score_to_yojson (x : cvss_score) =
  assoc_to_yojson
    [
      ("version", option_to_yojson version_to_yojson x.version);
      ("source", option_to_yojson source_to_yojson x.source);
      ("scoringVector", option_to_yojson scoring_vector_to_yojson x.scoring_vector);
      ("baseScore", option_to_yojson base_score_to_yojson x.base_score);
    ]

let cvss_score_list_to_yojson tree = list_to_yojson cvss_score_to_yojson tree

let package_vulnerability_details_to_yojson (x : package_vulnerability_details) =
  assoc_to_yojson
    [
      ( "vulnerablePackages",
        option_to_yojson vulnerable_packages_list_to_yojson x.vulnerable_packages );
      ("vulnerabilityId", option_to_yojson vulnerability_id_to_yojson x.vulnerability_id);
      ("vendorUpdatedAt", option_to_yojson date_to_yojson x.vendor_updated_at);
      ("vendorSeverity", option_to_yojson severity_to_yojson x.vendor_severity);
      ("vendorCreatedAt", option_to_yojson date_to_yojson x.vendor_created_at);
      ("sourceUrl", option_to_yojson url_to_yojson x.source_url);
      ("source", option_to_yojson source_to_yojson x.source);
      ( "relatedVulnerabilities",
        option_to_yojson related_vulnerabilities_list_to_yojson x.related_vulnerabilities );
      ("referenceUrls", option_to_yojson reference_urls_list_to_yojson x.reference_urls);
      ("cvss", option_to_yojson cvss_score_list_to_yojson x.cvss);
    ]

let next_token_to_yojson = string_to_yojson
let media_type_list_to_yojson tree = list_to_yojson media_type_to_yojson tree
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_pull_time_update_exclusions_response_to_yojson
    (x : list_pull_time_update_exclusions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "pullTimeUpdateExclusions",
        option_to_yojson pull_time_update_exclusion_list_to_yojson x.pull_time_update_exclusions );
    ]

let list_pull_time_update_exclusions_request_to_yojson
    (x : list_pull_time_update_exclusions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let image_identifier_list_to_yojson tree = list_to_yojson image_identifier_to_yojson tree

let list_images_response_to_yojson (x : list_images_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
    ]

let image_status_filter_to_yojson (x : image_status_filter) =
  match x with
  | ANY -> `String "ANY"
  | ACTIVATING -> `String "ACTIVATING"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVE -> `String "ACTIVE"

let list_images_filter_to_yojson (x : list_images_filter) =
  assoc_to_yojson
    [
      ("imageStatus", option_to_yojson image_status_filter_to_yojson x.image_status);
      ("tagStatus", option_to_yojson tag_status_to_yojson x.tag_status);
    ]

let list_images_request_to_yojson (x : list_images_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson list_images_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let artifact_type_to_yojson = string_to_yojson
let image_size_in_bytes_to_yojson = long_to_yojson
let annotations_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let artifact_status_to_yojson (x : artifact_status) =
  match x with
  | ACTIVATING -> `String "ACTIVATING"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVE -> `String "ACTIVE"

let image_referrer_to_yojson (x : image_referrer) =
  assoc_to_yojson
    [
      ("artifactStatus", option_to_yojson artifact_status_to_yojson x.artifact_status);
      ("annotations", option_to_yojson annotations_to_yojson x.annotations);
      ("size", Some (image_size_in_bytes_to_yojson x.size));
      ("artifactType", option_to_yojson artifact_type_to_yojson x.artifact_type);
      ("mediaType", Some (media_type_to_yojson x.media_type));
      ("digest", Some (image_digest_to_yojson x.digest));
    ]

let image_referrer_list_to_yojson tree = list_to_yojson image_referrer_to_yojson tree

let list_image_referrers_response_to_yojson (x : list_image_referrers_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("referrers", option_to_yojson image_referrer_list_to_yojson x.referrers);
    ]

let artifact_type_list_to_yojson tree = list_to_yojson artifact_type_to_yojson tree

let artifact_status_filter_to_yojson (x : artifact_status_filter) =
  match x with
  | ANY -> `String "ANY"
  | ACTIVATING -> `String "ACTIVATING"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVE -> `String "ACTIVE"

let list_image_referrers_filter_to_yojson (x : list_image_referrers_filter) =
  assoc_to_yojson
    [
      ("artifactStatus", option_to_yojson artifact_status_filter_to_yojson x.artifact_status);
      ("artifactTypes", option_to_yojson artifact_type_list_to_yojson x.artifact_types);
    ]

let fifty_max_results_to_yojson = int_to_yojson

let list_image_referrers_request_to_yojson (x : list_image_referrers_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson fifty_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filter", option_to_yojson list_image_referrers_filter_to_yojson x.filter);
      ("subjectId", Some (subject_identifier_to_yojson x.subject_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let lifecycle_preview_max_results_to_yojson = int_to_yojson

let lifecycle_policy_storage_class_to_yojson (x : lifecycle_policy_storage_class) =
  match x with STANDARD -> `String "STANDARD" | ARCHIVE -> `String "ARCHIVE"

let lifecycle_policy_rule_priority_to_yojson = int_to_yojson

let image_action_type_to_yojson (x : image_action_type) =
  match x with TRANSITION -> `String "TRANSITION" | EXPIRE -> `String "EXPIRE"

let lifecycle_policy_rule_action_to_yojson (x : lifecycle_policy_rule_action) =
  assoc_to_yojson
    [
      ( "targetStorageClass",
        option_to_yojson lifecycle_policy_target_storage_class_to_yojson x.target_storage_class );
      ("type", option_to_yojson image_action_type_to_yojson x.type_);
    ]

let lifecycle_policy_preview_summary_to_yojson (x : lifecycle_policy_preview_summary) =
  assoc_to_yojson
    [
      ( "transitioningImageTotalCounts",
        option_to_yojson transitioning_image_total_counts_to_yojson
          x.transitioning_image_total_counts );
      ( "expiringImageTotalCount",
        option_to_yojson image_count_to_yojson x.expiring_image_total_count );
    ]

let image_tag_list_to_yojson tree = list_to_yojson image_tag_to_yojson tree

let lifecycle_policy_preview_result_to_yojson (x : lifecycle_policy_preview_result) =
  assoc_to_yojson
    [
      ("storageClass", option_to_yojson lifecycle_policy_storage_class_to_yojson x.storage_class);
      ( "appliedRulePriority",
        option_to_yojson lifecycle_policy_rule_priority_to_yojson x.applied_rule_priority );
      ("action", option_to_yojson lifecycle_policy_rule_action_to_yojson x.action);
      ("imagePushedAt", option_to_yojson push_timestamp_to_yojson x.image_pushed_at);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("imageTags", option_to_yojson image_tag_list_to_yojson x.image_tags);
    ]

let lifecycle_policy_preview_result_list_to_yojson tree =
  list_to_yojson lifecycle_policy_preview_result_to_yojson tree

let lifecycle_policy_preview_not_found_exception_to_yojson
    (x : lifecycle_policy_preview_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let lifecycle_policy_preview_filter_to_yojson (x : lifecycle_policy_preview_filter) =
  assoc_to_yojson [ ("tagStatus", option_to_yojson tag_status_to_yojson x.tag_status) ]

let layer_size_in_bytes_to_yojson = long_to_yojson

let layer_part_too_small_exception_to_yojson (x : layer_part_too_small_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_digest_to_yojson = string_to_yojson

let layer_availability_to_yojson (x : layer_availability) =
  match x with
  | ARCHIVED -> `String "ARCHIVED"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | AVAILABLE -> `String "AVAILABLE"

let layer_to_yojson (x : layer) =
  assoc_to_yojson
    [
      ("mediaType", option_to_yojson media_type_to_yojson x.media_type);
      ("layerSize", option_to_yojson layer_size_in_bytes_to_yojson x.layer_size);
      ("layerAvailability", option_to_yojson layer_availability_to_yojson x.layer_availability);
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
    ]

let layer_list_to_yojson tree = list_to_yojson layer_to_yojson tree

let layer_inaccessible_exception_to_yojson (x : layer_inaccessible_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_failure_reason_to_yojson = string_to_yojson
let batched_operation_layer_digest_to_yojson = string_to_yojson

let layer_failure_code_to_yojson (x : layer_failure_code) =
  match x with
  | MissingLayerDigest -> `String "MissingLayerDigest"
  | InvalidLayerDigest -> `String "InvalidLayerDigest"

let layer_failure_to_yojson (x : layer_failure) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson layer_failure_reason_to_yojson x.failure_reason);
      ("failureCode", option_to_yojson layer_failure_code_to_yojson x.failure_code);
      ("layerDigest", option_to_yojson batched_operation_layer_digest_to_yojson x.layer_digest);
    ]

let layer_failure_list_to_yojson tree = list_to_yojson layer_failure_to_yojson tree
let layer_digest_list_to_yojson tree = list_to_yojson layer_digest_to_yojson tree

let layer_already_exists_exception_to_yojson (x : layer_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let last_archived_at_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let last_activated_at_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let invalid_layer_exception_to_yojson (x : invalid_layer_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let initiate_layer_upload_response_to_yojson (x : initiate_layer_upload_response) =
  assoc_to_yojson
    [
      ("partSize", option_to_yojson part_size_to_yojson x.part_size);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
    ]

let initiate_layer_upload_request_to_yojson (x : initiate_layer_upload_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_signing_status_to_yojson (x : image_signing_status) =
  assoc_to_yojson
    [
      ("status", option_to_yojson signing_status_to_yojson x.status);
      ("failureReason", option_to_yojson signing_status_failure_reason_to_yojson x.failure_reason);
      ("failureCode", option_to_yojson signing_status_failure_code_to_yojson x.failure_code);
      ("signingProfileArn", option_to_yojson signing_profile_arn_to_yojson x.signing_profile_arn);
    ]

let image_signing_status_list_to_yojson tree = list_to_yojson image_signing_status_to_yojson tree

let finding_severity_to_yojson (x : finding_severity) =
  match x with
  | UNDEFINED -> `String "UNDEFINED"
  | CRITICAL -> `String "CRITICAL"
  | HIGH -> `String "HIGH"
  | MEDIUM -> `String "MEDIUM"
  | LOW -> `String "LOW"
  | INFORMATIONAL -> `String "INFORMATIONAL"

let finding_severity_counts_to_yojson tree =
  map_to_yojson finding_severity_to_yojson severity_count_to_yojson tree

let image_scan_findings_summary_to_yojson (x : image_scan_findings_summary) =
  assoc_to_yojson
    [
      ( "findingSeverityCounts",
        option_to_yojson finding_severity_counts_to_yojson x.finding_severity_counts );
      ( "vulnerabilitySourceUpdatedAt",
        option_to_yojson vulnerability_source_update_timestamp_to_yojson
          x.vulnerability_source_updated_at );
      ("imageScanCompletedAt", option_to_yojson scan_timestamp_to_yojson x.image_scan_completed_at);
    ]

let finding_name_to_yojson = string_to_yojson
let finding_description_to_yojson = string_to_yojson
let attribute_key_to_yojson = string_to_yojson
let attribute_value_to_yojson = string_to_yojson

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("value", option_to_yojson attribute_value_to_yojson x.value);
      ("key", Some (attribute_key_to_yojson x.key));
    ]

let attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree

let image_scan_finding_to_yojson (x : image_scan_finding) =
  assoc_to_yojson
    [
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
      ("severity", option_to_yojson finding_severity_to_yojson x.severity);
      ("uri", option_to_yojson url_to_yojson x.uri);
      ("description", option_to_yojson finding_description_to_yojson x.description);
      ("name", option_to_yojson finding_name_to_yojson x.name);
    ]

let image_scan_finding_list_to_yojson tree = list_to_yojson image_scan_finding_to_yojson tree
let finding_arn_to_yojson = string_to_yojson
let fix_available_to_yojson = string_to_yojson
let exploit_available_to_yojson = string_to_yojson

let enhanced_image_scan_finding_to_yojson (x : enhanced_image_scan_finding) =
  assoc_to_yojson
    [
      ("exploitAvailable", option_to_yojson exploit_available_to_yojson x.exploit_available);
      ("fixAvailable", option_to_yojson fix_available_to_yojson x.fix_available);
      ("updatedAt", option_to_yojson date_to_yojson x.updated_at);
      ("type", option_to_yojson type__to_yojson x.type_);
      ("title", option_to_yojson title_to_yojson x.title);
      ("status", option_to_yojson status_to_yojson x.status);
      ("severity", option_to_yojson severity_to_yojson x.severity);
      ("scoreDetails", option_to_yojson score_details_to_yojson x.score_details);
      ("score", option_to_yojson score_to_yojson x.score);
      ("resources", option_to_yojson resource_list_to_yojson x.resources);
      ("remediation", option_to_yojson remediation_to_yojson x.remediation);
      ( "packageVulnerabilityDetails",
        option_to_yojson package_vulnerability_details_to_yojson x.package_vulnerability_details );
      ("lastObservedAt", option_to_yojson date_to_yojson x.last_observed_at);
      ("firstObservedAt", option_to_yojson date_to_yojson x.first_observed_at);
      ("findingArn", option_to_yojson finding_arn_to_yojson x.finding_arn);
      ("description", option_to_yojson finding_description_to_yojson x.description);
      ("awsAccountId", option_to_yojson registry_id_to_yojson x.aws_account_id);
    ]

let enhanced_image_scan_finding_list_to_yojson tree =
  list_to_yojson enhanced_image_scan_finding_to_yojson tree

let image_scan_findings_to_yojson (x : image_scan_findings) =
  assoc_to_yojson
    [
      ( "enhancedFindings",
        option_to_yojson enhanced_image_scan_finding_list_to_yojson x.enhanced_findings );
      ("findings", option_to_yojson image_scan_finding_list_to_yojson x.findings);
      ( "findingSeverityCounts",
        option_to_yojson finding_severity_counts_to_yojson x.finding_severity_counts );
      ( "vulnerabilitySourceUpdatedAt",
        option_to_yojson vulnerability_source_update_timestamp_to_yojson
          x.vulnerability_source_updated_at );
      ("imageScanCompletedAt", option_to_yojson scan_timestamp_to_yojson x.image_scan_completed_at);
    ]

let image_replication_status_to_yojson (x : image_replication_status) =
  assoc_to_yojson
    [
      ("failureCode", option_to_yojson replication_error_to_yojson x.failure_code);
      ("status", option_to_yojson replication_status_to_yojson x.status);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("region", option_to_yojson region_to_yojson x.region);
    ]

let image_replication_status_list_to_yojson tree =
  list_to_yojson image_replication_status_to_yojson tree

let image_list_to_yojson tree = list_to_yojson image_to_yojson tree
let image_failure_reason_to_yojson = string_to_yojson

let image_failure_code_to_yojson (x : image_failure_code) =
  match x with
  | ImageInaccessible -> `String "ImageInaccessible"
  | UpstreamUnavailable -> `String "UpstreamUnavailable"
  | UpstreamTooManyRequests -> `String "UpstreamTooManyRequests"
  | UpstreamAccessDenied -> `String "UpstreamAccessDenied"
  | KmsError -> `String "KmsError"
  | ImageReferencedByManifestList -> `String "ImageReferencedByManifestList"
  | MissingDigestAndTag -> `String "MissingDigestAndTag"
  | ImageNotFound -> `String "ImageNotFound"
  | ImageTagDoesNotMatchDigest -> `String "ImageTagDoesNotMatchDigest"
  | InvalidImageTag -> `String "InvalidImageTag"
  | InvalidImageDigest -> `String "InvalidImageDigest"

let image_failure_to_yojson (x : image_failure) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson image_failure_reason_to_yojson x.failure_reason);
      ("failureCode", option_to_yojson image_failure_code_to_yojson x.failure_code);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
    ]

let image_failure_list_to_yojson tree = list_to_yojson image_failure_to_yojson tree

let image_detail_to_yojson (x : image_detail) =
  assoc_to_yojson
    [
      ("lastActivatedAt", option_to_yojson last_activated_at_timestamp_to_yojson x.last_activated_at);
      ("lastArchivedAt", option_to_yojson last_archived_at_timestamp_to_yojson x.last_archived_at);
      ("imageStatus", option_to_yojson image_status_to_yojson x.image_status);
      ("subjectManifestDigest", option_to_yojson image_digest_to_yojson x.subject_manifest_digest);
      ( "lastRecordedPullTime",
        option_to_yojson recorded_pull_timestamp_to_yojson x.last_recorded_pull_time );
      ("artifactMediaType", option_to_yojson media_type_to_yojson x.artifact_media_type);
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ( "imageScanFindingsSummary",
        option_to_yojson image_scan_findings_summary_to_yojson x.image_scan_findings_summary );
      ("imageScanStatus", option_to_yojson image_scan_status_to_yojson x.image_scan_status);
      ("imagePushedAt", option_to_yojson push_timestamp_to_yojson x.image_pushed_at);
      ("imageSizeInBytes", option_to_yojson image_size_in_bytes_to_yojson x.image_size_in_bytes);
      ("imageTags", option_to_yojson image_tag_list_to_yojson x.image_tags);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_detail_list_to_yojson tree = list_to_yojson image_detail_to_yojson tree

let get_signing_configuration_response_to_yojson (x : get_signing_configuration_response) =
  assoc_to_yojson
    [
      ( "signingConfiguration",
        option_to_yojson signing_configuration_to_yojson x.signing_configuration );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_signing_configuration_request_to_yojson = unit_to_yojson

let get_repository_policy_response_to_yojson (x : get_repository_policy_response) =
  assoc_to_yojson
    [
      ("policyText", option_to_yojson repository_policy_text_to_yojson x.policy_text);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_repository_policy_request_to_yojson (x : get_repository_policy_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_registry_scanning_configuration_response_to_yojson
    (x : get_registry_scanning_configuration_response) =
  assoc_to_yojson
    [
      ( "scanningConfiguration",
        option_to_yojson registry_scanning_configuration_to_yojson x.scanning_configuration );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_registry_scanning_configuration_request_to_yojson = unit_to_yojson

let get_registry_policy_response_to_yojson (x : get_registry_policy_response) =
  assoc_to_yojson
    [
      ("policyText", option_to_yojson registry_policy_text_to_yojson x.policy_text);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_registry_policy_request_to_yojson = unit_to_yojson
let evaluation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let get_lifecycle_policy_response_to_yojson (x : get_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ("lastEvaluatedAt", option_to_yojson evaluation_timestamp_to_yojson x.last_evaluated_at);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_lifecycle_policy_request_to_yojson (x : get_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_lifecycle_policy_preview_response_to_yojson (x : get_lifecycle_policy_preview_response) =
  assoc_to_yojson
    [
      ("summary", option_to_yojson lifecycle_policy_preview_summary_to_yojson x.summary);
      ( "previewResults",
        option_to_yojson lifecycle_policy_preview_result_list_to_yojson x.preview_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("status", option_to_yojson lifecycle_policy_preview_status_to_yojson x.status);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_lifecycle_policy_preview_request_to_yojson (x : get_lifecycle_policy_preview_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson lifecycle_policy_preview_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson lifecycle_preview_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_download_url_for_layer_response_to_yojson (x : get_download_url_for_layer_response) =
  assoc_to_yojson
    [
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
      ("downloadUrl", option_to_yojson url_to_yojson x.download_url);
    ]

let get_download_url_for_layer_request_to_yojson (x : get_download_url_for_layer_request) =
  assoc_to_yojson
    [
      ("layerDigest", Some (layer_digest_to_yojson x.layer_digest));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let base64_to_yojson = string_to_yojson
let expiration_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let authorization_data_to_yojson (x : authorization_data) =
  assoc_to_yojson
    [
      ("proxyEndpoint", option_to_yojson proxy_endpoint_to_yojson x.proxy_endpoint);
      ("expiresAt", option_to_yojson expiration_timestamp_to_yojson x.expires_at);
      ("authorizationToken", option_to_yojson base64_to_yojson x.authorization_token);
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
      ("value", option_to_yojson account_setting_name_to_yojson x.value);
      ("name", option_to_yojson account_setting_name_to_yojson x.name);
    ]

let get_account_setting_request_to_yojson (x : get_account_setting_request) =
  assoc_to_yojson [ ("name", Some (account_setting_name_to_yojson x.name)) ]

let exclusion_not_found_exception_to_yojson (x : exclusion_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let empty_upload_exception_to_yojson (x : empty_upload_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let describe_repository_creation_templates_response_to_yojson
    (x : describe_repository_creation_templates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "repositoryCreationTemplates",
        option_to_yojson repository_creation_template_list_to_yojson x.repository_creation_templates
      );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_repository_creation_templates_request_to_yojson
    (x : describe_repository_creation_templates_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("prefixes", option_to_yojson prefix_list_to_yojson x.prefixes);
    ]

let describe_repositories_response_to_yojson (x : describe_repositories_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositories", option_to_yojson repository_list_to_yojson x.repositories);
    ]

let describe_repositories_request_to_yojson (x : describe_repositories_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryNames", option_to_yojson repository_name_list_to_yojson x.repository_names);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_registry_response_to_yojson (x : describe_registry_response) =
  assoc_to_yojson
    [
      ( "replicationConfiguration",
        option_to_yojson replication_configuration_to_yojson x.replication_configuration );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_registry_request_to_yojson = unit_to_yojson

let describe_pull_through_cache_rules_response_to_yojson
    (x : describe_pull_through_cache_rules_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "pullThroughCacheRules",
        option_to_yojson pull_through_cache_rule_list_to_yojson x.pull_through_cache_rules );
    ]

let describe_pull_through_cache_rules_request_to_yojson
    (x : describe_pull_through_cache_rules_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ecrRepositoryPrefixes",
        option_to_yojson pull_through_cache_rule_repository_prefix_list_to_yojson
          x.ecr_repository_prefixes );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_images_response_to_yojson (x : describe_images_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageDetails", option_to_yojson image_detail_list_to_yojson x.image_details);
    ]

let describe_images_filter_to_yojson (x : describe_images_filter) =
  assoc_to_yojson
    [
      ("imageStatus", option_to_yojson image_status_filter_to_yojson x.image_status);
      ("tagStatus", option_to_yojson tag_status_to_yojson x.tag_status);
    ]

let describe_images_request_to_yojson (x : describe_images_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson describe_images_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_image_signing_status_response_to_yojson (x : describe_image_signing_status_response) =
  assoc_to_yojson
    [
      ("signingStatuses", option_to_yojson image_signing_status_list_to_yojson x.signing_statuses);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let describe_image_signing_status_request_to_yojson (x : describe_image_signing_status_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let describe_image_scan_findings_response_to_yojson (x : describe_image_scan_findings_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageScanFindings", option_to_yojson image_scan_findings_to_yojson x.image_scan_findings);
      ("imageScanStatus", option_to_yojson image_scan_status_to_yojson x.image_scan_status);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_image_scan_findings_request_to_yojson (x : describe_image_scan_findings_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let describe_image_replication_status_response_to_yojson
    (x : describe_image_replication_status_response) =
  assoc_to_yojson
    [
      ( "replicationStatuses",
        option_to_yojson image_replication_status_list_to_yojson x.replication_statuses );
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
    ]

let describe_image_replication_status_request_to_yojson
    (x : describe_image_replication_status_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("imageId", Some (image_identifier_to_yojson x.image_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let deregister_pull_time_update_exclusion_response_to_yojson
    (x : deregister_pull_time_update_exclusion_response) =
  assoc_to_yojson [ ("principalArn", option_to_yojson principal_arn_to_yojson x.principal_arn) ]

let deregister_pull_time_update_exclusion_request_to_yojson
    (x : deregister_pull_time_update_exclusion_request) =
  assoc_to_yojson [ ("principalArn", Some (principal_arn_to_yojson x.principal_arn)) ]

let delete_signing_configuration_response_to_yojson (x : delete_signing_configuration_response) =
  assoc_to_yojson
    [
      ( "signingConfiguration",
        option_to_yojson signing_configuration_to_yojson x.signing_configuration );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_signing_configuration_request_to_yojson = unit_to_yojson

let delete_repository_response_to_yojson (x : delete_repository_response) =
  assoc_to_yojson [ ("repository", option_to_yojson repository_to_yojson x.repository) ]

let delete_repository_request_to_yojson (x : delete_repository_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson force_flag_to_yojson x.force);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_repository_policy_response_to_yojson (x : delete_repository_policy_response) =
  assoc_to_yojson
    [
      ("policyText", option_to_yojson repository_policy_text_to_yojson x.policy_text);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_repository_policy_request_to_yojson (x : delete_repository_policy_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_repository_creation_template_response_to_yojson
    (x : delete_repository_creation_template_response) =
  assoc_to_yojson
    [
      ( "repositoryCreationTemplate",
        option_to_yojson repository_creation_template_to_yojson x.repository_creation_template );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_repository_creation_template_request_to_yojson
    (x : delete_repository_creation_template_request) =
  assoc_to_yojson [ ("prefix", Some (prefix_to_yojson x.prefix)) ]

let delete_registry_policy_response_to_yojson (x : delete_registry_policy_response) =
  assoc_to_yojson
    [
      ("policyText", option_to_yojson registry_policy_text_to_yojson x.policy_text);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_registry_policy_request_to_yojson = unit_to_yojson

let delete_pull_through_cache_rule_response_to_yojson (x : delete_pull_through_cache_rule_response)
    =
  assoc_to_yojson
    [
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
    ]

let delete_pull_through_cache_rule_request_to_yojson (x : delete_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
    ]

let delete_lifecycle_policy_response_to_yojson (x : delete_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ("lastEvaluatedAt", option_to_yojson evaluation_timestamp_to_yojson x.last_evaluated_at);
      ( "lifecyclePolicyText",
        option_to_yojson lifecycle_policy_text_to_yojson x.lifecycle_policy_text );
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let delete_lifecycle_policy_request_to_yojson (x : delete_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let create_repository_response_to_yojson (x : create_repository_response) =
  assoc_to_yojson [ ("repository", option_to_yojson repository_to_yojson x.repository) ]

let create_repository_request_to_yojson (x : create_repository_request) =
  assoc_to_yojson
    [
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "imageScanningConfiguration",
        option_to_yojson image_scanning_configuration_to_yojson x.image_scanning_configuration );
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let create_repository_creation_template_response_to_yojson
    (x : create_repository_creation_template_response) =
  assoc_to_yojson
    [
      ( "repositoryCreationTemplate",
        option_to_yojson repository_creation_template_to_yojson x.repository_creation_template );
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let create_repository_creation_template_request_to_yojson
    (x : create_repository_creation_template_request) =
  assoc_to_yojson
    [
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("appliedFor", Some (rct_applied_for_list_to_yojson x.applied_for));
      ( "lifecyclePolicy",
        option_to_yojson lifecycle_policy_text_for_repository_creation_template_to_yojson
          x.lifecycle_policy );
      ("repositoryPolicy", option_to_yojson repository_policy_text_to_yojson x.repository_policy);
      ( "imageTagMutabilityExclusionFilters",
        option_to_yojson image_tag_mutability_exclusion_filters_to_yojson
          x.image_tag_mutability_exclusion_filters );
      ("imageTagMutability", option_to_yojson image_tag_mutability_to_yojson x.image_tag_mutability);
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_for_repository_creation_template_to_yojson
          x.encryption_configuration );
      ("description", option_to_yojson repository_template_description_to_yojson x.description);
      ("prefix", Some (prefix_to_yojson x.prefix));
    ]

let create_pull_through_cache_rule_response_to_yojson (x : create_pull_through_cache_rule_response)
    =
  assoc_to_yojson
    [
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("upstreamRegistry", option_to_yojson upstream_registry_to_yojson x.upstream_registry);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("upstreamRegistryUrl", option_to_yojson url_to_yojson x.upstream_registry_url);
      ( "ecrRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix
      );
    ]

let create_pull_through_cache_rule_request_to_yojson (x : create_pull_through_cache_rule_request) =
  assoc_to_yojson
    [
      ( "upstreamRepositoryPrefix",
        option_to_yojson pull_through_cache_rule_repository_prefix_to_yojson
          x.upstream_repository_prefix );
      ("customRoleArn", option_to_yojson custom_role_arn_to_yojson x.custom_role_arn);
      ("credentialArn", option_to_yojson credential_arn_to_yojson x.credential_arn);
      ("upstreamRegistry", option_to_yojson upstream_registry_to_yojson x.upstream_registry);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("upstreamRegistryUrl", Some (url_to_yojson x.upstream_registry_url));
      ( "ecrRepositoryPrefix",
        Some (pull_through_cache_rule_repository_prefix_to_yojson x.ecr_repository_prefix) );
    ]

let complete_layer_upload_response_to_yojson (x : complete_layer_upload_response) =
  assoc_to_yojson
    [
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let complete_layer_upload_request_to_yojson (x : complete_layer_upload_request) =
  assoc_to_yojson
    [
      ("layerDigests", Some (layer_digest_list_to_yojson x.layer_digests));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let batched_operation_layer_digest_list_to_yojson tree =
  list_to_yojson batched_operation_layer_digest_to_yojson tree

let batch_get_repository_scanning_configuration_response_to_yojson
    (x : batch_get_repository_scanning_configuration_response) =
  assoc_to_yojson
    [
      ( "failures",
        option_to_yojson repository_scanning_configuration_failure_list_to_yojson x.failures );
      ( "scanningConfigurations",
        option_to_yojson repository_scanning_configuration_list_to_yojson x.scanning_configurations
      );
    ]

let batch_get_repository_scanning_configuration_request_to_yojson
    (x : batch_get_repository_scanning_configuration_request) =
  assoc_to_yojson
    [
      ( "repositoryNames",
        Some (scanning_configuration_repository_name_list_to_yojson x.repository_names) );
    ]

let batch_get_image_response_to_yojson (x : batch_get_image_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson image_failure_list_to_yojson x.failures);
      ("images", option_to_yojson image_list_to_yojson x.images);
    ]

let batch_get_image_request_to_yojson (x : batch_get_image_request) =
  assoc_to_yojson
    [
      ("acceptedMediaTypes", option_to_yojson media_type_list_to_yojson x.accepted_media_types);
      ("imageIds", Some (image_identifier_list_to_yojson x.image_ids));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let batch_delete_image_response_to_yojson (x : batch_delete_image_response) =
  assoc_to_yojson
    [
      ("failures", option_to_yojson image_failure_list_to_yojson x.failures);
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
    ]

let batch_delete_image_request_to_yojson (x : batch_delete_image_request) =
  assoc_to_yojson
    [
      ("imageIds", Some (image_identifier_list_to_yojson x.image_ids));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let batch_check_layer_availability_response_to_yojson (x : batch_check_layer_availability_response)
    =
  assoc_to_yojson
    [
      ("failures", option_to_yojson layer_failure_list_to_yojson x.failures);
      ("layers", option_to_yojson layer_list_to_yojson x.layers);
    ]

let batch_check_layer_availability_request_to_yojson (x : batch_check_layer_availability_request) =
  assoc_to_yojson
    [
      ("layerDigests", Some (batched_operation_layer_digest_list_to_yojson x.layer_digests));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]
