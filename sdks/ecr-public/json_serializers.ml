open Smaws_Lib.Json.SerializeHelpers
open Types

let usage_text_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let upload_not_found_exception_to_yojson (x : upload_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let registry_id_to_yojson = string_to_yojson
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

let registry_id_or_alias_to_yojson = string_to_yojson
let layer_part_blob_to_yojson = blob_to_yojson

let upload_layer_part_request_to_yojson (x : upload_layer_part_request) =
  assoc_to_yojson
    [
      ("layerPartBlob", Some (layer_part_blob_to_yojson x.layer_part_blob));
      ("partLastByte", Some (part_size_to_yojson x.part_last_byte));
      ("partFirstByte", Some (part_size_to_yojson x.part_first_byte));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
    ]

let unsupported_command_exception_to_yojson (x : unsupported_command_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let server_exception_to_yojson (x : server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let repository_not_found_exception_to_yojson (x : repository_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let registry_not_found_exception_to_yojson (x : registry_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_layer_part_exception_to_yojson (x : invalid_layer_part_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("lastValidByteReceived", option_to_yojson part_size_to_yojson x.last_valid_byte_received);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
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

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let repository_policy_text_to_yojson = string_to_yojson

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

let repository_description_to_yojson = string_to_yojson
let architecture_to_yojson = string_to_yojson
let architecture_list_to_yojson tree = list_to_yojson architecture_to_yojson tree
let operating_system_to_yojson = string_to_yojson
let operating_system_list_to_yojson tree = list_to_yojson operating_system_to_yojson tree
let resource_url_to_yojson = string_to_yojson
let about_text_to_yojson = string_to_yojson
let marketplace_certified_to_yojson = bool_to_yojson

let repository_catalog_data_to_yojson (x : repository_catalog_data) =
  assoc_to_yojson
    [
      ( "marketplaceCertified",
        option_to_yojson marketplace_certified_to_yojson x.marketplace_certified );
      ("usageText", option_to_yojson usage_text_to_yojson x.usage_text);
      ("aboutText", option_to_yojson about_text_to_yojson x.about_text);
      ("logoUrl", option_to_yojson resource_url_to_yojson x.logo_url);
      ("operatingSystems", option_to_yojson operating_system_list_to_yojson x.operating_systems);
      ("architectures", option_to_yojson architecture_list_to_yojson x.architectures);
      ("description", option_to_yojson repository_description_to_yojson x.description);
    ]

let put_repository_catalog_data_response_to_yojson (x : put_repository_catalog_data_response) =
  assoc_to_yojson
    [ ("catalogData", option_to_yojson repository_catalog_data_to_yojson x.catalog_data) ]

let logo_image_blob_to_yojson = blob_to_yojson

let repository_catalog_data_input_to_yojson (x : repository_catalog_data_input) =
  assoc_to_yojson
    [
      ("usageText", option_to_yojson usage_text_to_yojson x.usage_text);
      ("aboutText", option_to_yojson about_text_to_yojson x.about_text);
      ("logoImageBlob", option_to_yojson logo_image_blob_to_yojson x.logo_image_blob);
      ("operatingSystems", option_to_yojson operating_system_list_to_yojson x.operating_systems);
      ("architectures", option_to_yojson architecture_list_to_yojson x.architectures);
      ("description", option_to_yojson repository_description_to_yojson x.description);
    ]

let put_repository_catalog_data_request_to_yojson (x : put_repository_catalog_data_request) =
  assoc_to_yojson
    [
      ("catalogData", Some (repository_catalog_data_input_to_yojson x.catalog_data));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let registry_display_name_to_yojson = string_to_yojson

let registry_catalog_data_to_yojson (x : registry_catalog_data) =
  assoc_to_yojson
    [ ("displayName", option_to_yojson registry_display_name_to_yojson x.display_name) ]

let put_registry_catalog_data_response_to_yojson (x : put_registry_catalog_data_response) =
  assoc_to_yojson
    [ ("registryCatalogData", Some (registry_catalog_data_to_yojson x.registry_catalog_data)) ]

let put_registry_catalog_data_request_to_yojson (x : put_registry_catalog_data_request) =
  assoc_to_yojson
    [ ("displayName", option_to_yojson registry_display_name_to_yojson x.display_name) ]

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

let image_digest_to_yojson = string_to_yojson
let image_tag_to_yojson = string_to_yojson

let image_identifier_to_yojson (x : image_identifier) =
  assoc_to_yojson
    [
      ("imageTag", option_to_yojson image_tag_to_yojson x.image_tag);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
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
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
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
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

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
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
    ]

let repository_policy_not_found_exception_to_yojson (x : repository_policy_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

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

let repository_catalog_data_not_found_exception_to_yojson
    (x : repository_catalog_data_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let get_repository_catalog_data_response_to_yojson (x : get_repository_catalog_data_response) =
  assoc_to_yojson
    [ ("catalogData", option_to_yojson repository_catalog_data_to_yojson x.catalog_data) ]

let get_repository_catalog_data_request_to_yojson (x : get_repository_catalog_data_request) =
  assoc_to_yojson
    [
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let get_registry_catalog_data_response_to_yojson (x : get_registry_catalog_data_response) =
  assoc_to_yojson
    [ ("registryCatalogData", Some (registry_catalog_data_to_yojson x.registry_catalog_data)) ]

let get_registry_catalog_data_request_to_yojson = unit_to_yojson
let base64_to_yojson = string_to_yojson
let expiration_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let authorization_data_to_yojson (x : authorization_data) =
  assoc_to_yojson
    [
      ("expiresAt", option_to_yojson expiration_timestamp_to_yojson x.expires_at);
      ("authorizationToken", option_to_yojson base64_to_yojson x.authorization_token);
    ]

let get_authorization_token_response_to_yojson (x : get_authorization_token_response) =
  assoc_to_yojson
    [ ("authorizationData", option_to_yojson authorization_data_to_yojson x.authorization_data) ]

let get_authorization_token_request_to_yojson = unit_to_yojson
let creation_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let repository_to_yojson (x : repository) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("repositoryUri", option_to_yojson url_to_yojson x.repository_uri);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
      ("repositoryArn", option_to_yojson arn_to_yojson x.repository_arn);
    ]

let repository_list_to_yojson tree = list_to_yojson repository_to_yojson tree
let next_token_to_yojson = string_to_yojson

let describe_repositories_response_to_yojson (x : describe_repositories_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositories", option_to_yojson repository_list_to_yojson x.repositories);
    ]

let repository_name_list_to_yojson tree = list_to_yojson repository_name_to_yojson tree
let max_results_to_yojson = int_to_yojson

let describe_repositories_request_to_yojson (x : describe_repositories_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryNames", option_to_yojson repository_name_list_to_yojson x.repository_names);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let registry_verified_to_yojson = bool_to_yojson
let registry_alias_name_to_yojson = string_to_yojson

let registry_alias_status_to_yojson (x : registry_alias_status) =
  match x with
  | REJECTED -> `String "REJECTED"
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"

let primary_registry_alias_flag_to_yojson = bool_to_yojson
let default_registry_alias_flag_to_yojson = bool_to_yojson

let registry_alias_to_yojson (x : registry_alias) =
  assoc_to_yojson
    [
      ("defaultRegistryAlias", Some (default_registry_alias_flag_to_yojson x.default_registry_alias));
      ("primaryRegistryAlias", Some (primary_registry_alias_flag_to_yojson x.primary_registry_alias));
      ("status", Some (registry_alias_status_to_yojson x.status));
      ("name", Some (registry_alias_name_to_yojson x.name));
    ]

let registry_alias_list_to_yojson tree = list_to_yojson registry_alias_to_yojson tree

let registry_to_yojson (x : registry) =
  assoc_to_yojson
    [
      ("aliases", Some (registry_alias_list_to_yojson x.aliases));
      ("verified", Some (registry_verified_to_yojson x.verified));
      ("registryUri", Some (url_to_yojson x.registry_uri));
      ("registryArn", Some (arn_to_yojson x.registry_arn));
      ("registryId", Some (registry_id_to_yojson x.registry_id));
    ]

let registry_list_to_yojson tree = list_to_yojson registry_to_yojson tree

let describe_registries_response_to_yojson (x : describe_registries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("registries", Some (registry_list_to_yojson x.registries));
    ]

let describe_registries_request_to_yojson (x : describe_registries_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let image_size_in_bytes_to_yojson = long_to_yojson
let push_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let referenced_image_detail_to_yojson (x : referenced_image_detail) =
  assoc_to_yojson
    [
      ("artifactMediaType", option_to_yojson media_type_to_yojson x.artifact_media_type);
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ("imagePushedAt", option_to_yojson push_timestamp_to_yojson x.image_pushed_at);
      ("imageSizeInBytes", option_to_yojson image_size_in_bytes_to_yojson x.image_size_in_bytes);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
    ]

let image_tag_detail_to_yojson (x : image_tag_detail) =
  assoc_to_yojson
    [
      ("imageDetail", option_to_yojson referenced_image_detail_to_yojson x.image_detail);
      ("createdAt", option_to_yojson creation_timestamp_to_yojson x.created_at);
      ("imageTag", option_to_yojson image_tag_to_yojson x.image_tag);
    ]

let image_tag_detail_list_to_yojson tree = list_to_yojson image_tag_detail_to_yojson tree

let describe_image_tags_response_to_yojson (x : describe_image_tags_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageTagDetails", option_to_yojson image_tag_detail_list_to_yojson x.image_tag_details);
    ]

let describe_image_tags_request_to_yojson (x : describe_image_tags_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_not_found_exception_to_yojson (x : image_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let image_tag_list_to_yojson tree = list_to_yojson image_tag_to_yojson tree

let image_detail_to_yojson (x : image_detail) =
  assoc_to_yojson
    [
      ("artifactMediaType", option_to_yojson media_type_to_yojson x.artifact_media_type);
      ("imageManifestMediaType", option_to_yojson media_type_to_yojson x.image_manifest_media_type);
      ("imagePushedAt", option_to_yojson push_timestamp_to_yojson x.image_pushed_at);
      ("imageSizeInBytes", option_to_yojson image_size_in_bytes_to_yojson x.image_size_in_bytes);
      ("imageTags", option_to_yojson image_tag_list_to_yojson x.image_tags);
      ("imageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let image_detail_list_to_yojson tree = list_to_yojson image_detail_to_yojson tree

let describe_images_response_to_yojson (x : describe_images_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageDetails", option_to_yojson image_detail_list_to_yojson x.image_details);
    ]

let image_identifier_list_to_yojson tree = list_to_yojson image_identifier_to_yojson tree

let describe_images_request_to_yojson (x : describe_images_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imageIds", option_to_yojson image_identifier_list_to_yojson x.image_ids);
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

let repository_not_empty_exception_to_yojson (x : repository_not_empty_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let delete_repository_response_to_yojson (x : delete_repository_response) =
  assoc_to_yojson [ ("repository", option_to_yojson repository_to_yojson x.repository) ]

let delete_repository_request_to_yojson (x : delete_repository_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson force_flag_to_yojson x.force);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let repository_already_exists_exception_to_yojson (x : repository_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_repository_response_to_yojson (x : create_repository_response) =
  assoc_to_yojson
    [
      ("catalogData", option_to_yojson repository_catalog_data_to_yojson x.catalog_data);
      ("repository", option_to_yojson repository_to_yojson x.repository);
    ]

let create_repository_request_to_yojson (x : create_repository_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("catalogData", option_to_yojson repository_catalog_data_input_to_yojson x.catalog_data);
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
    ]

let layer_part_too_small_exception_to_yojson (x : layer_part_too_small_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_already_exists_exception_to_yojson (x : layer_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_layer_exception_to_yojson (x : invalid_layer_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let empty_upload_exception_to_yojson (x : empty_upload_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let layer_digest_to_yojson = string_to_yojson

let complete_layer_upload_response_to_yojson (x : complete_layer_upload_response) =
  assoc_to_yojson
    [
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
      ("uploadId", option_to_yojson upload_id_to_yojson x.upload_id);
      ("repositoryName", option_to_yojson repository_name_to_yojson x.repository_name);
      ("registryId", option_to_yojson registry_id_to_yojson x.registry_id);
    ]

let layer_digest_list_to_yojson tree = list_to_yojson layer_digest_to_yojson tree

let complete_layer_upload_request_to_yojson (x : complete_layer_upload_request) =
  assoc_to_yojson
    [
      ("layerDigests", Some (layer_digest_list_to_yojson x.layer_digests));
      ("uploadId", Some (upload_id_to_yojson x.upload_id));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
    ]

let image_failure_code_to_yojson (x : image_failure_code) =
  match x with
  | KmsError -> `String "KmsError"
  | ImageReferencedByManifestList -> `String "ImageReferencedByManifestList"
  | MissingDigestAndTag -> `String "MissingDigestAndTag"
  | ImageNotFound -> `String "ImageNotFound"
  | ImageTagDoesNotMatchDigest -> `String "ImageTagDoesNotMatchDigest"
  | InvalidImageTag -> `String "InvalidImageTag"
  | InvalidImageDigest -> `String "InvalidImageDigest"

let image_failure_reason_to_yojson = string_to_yojson

let image_failure_to_yojson (x : image_failure) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson image_failure_reason_to_yojson x.failure_reason);
      ("failureCode", option_to_yojson image_failure_code_to_yojson x.failure_code);
      ("imageId", option_to_yojson image_identifier_to_yojson x.image_id);
    ]

let image_failure_list_to_yojson tree = list_to_yojson image_failure_to_yojson tree

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
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
    ]

let layer_availability_to_yojson (x : layer_availability) =
  match x with UNAVAILABLE -> `String "UNAVAILABLE" | AVAILABLE -> `String "AVAILABLE"

let layer_size_in_bytes_to_yojson = long_to_yojson

let layer_to_yojson (x : layer) =
  assoc_to_yojson
    [
      ("mediaType", option_to_yojson media_type_to_yojson x.media_type);
      ("layerSize", option_to_yojson layer_size_in_bytes_to_yojson x.layer_size);
      ("layerAvailability", option_to_yojson layer_availability_to_yojson x.layer_availability);
      ("layerDigest", option_to_yojson layer_digest_to_yojson x.layer_digest);
    ]

let layer_list_to_yojson tree = list_to_yojson layer_to_yojson tree
let batched_operation_layer_digest_to_yojson = string_to_yojson

let layer_failure_code_to_yojson (x : layer_failure_code) =
  match x with
  | MissingLayerDigest -> `String "MissingLayerDigest"
  | InvalidLayerDigest -> `String "InvalidLayerDigest"

let layer_failure_reason_to_yojson = string_to_yojson

let layer_failure_to_yojson (x : layer_failure) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson layer_failure_reason_to_yojson x.failure_reason);
      ("failureCode", option_to_yojson layer_failure_code_to_yojson x.failure_code);
      ("layerDigest", option_to_yojson batched_operation_layer_digest_to_yojson x.layer_digest);
    ]

let layer_failure_list_to_yojson tree = list_to_yojson layer_failure_to_yojson tree

let batch_check_layer_availability_response_to_yojson (x : batch_check_layer_availability_response)
    =
  assoc_to_yojson
    [
      ("failures", option_to_yojson layer_failure_list_to_yojson x.failures);
      ("layers", option_to_yojson layer_list_to_yojson x.layers);
    ]

let batched_operation_layer_digest_list_to_yojson tree =
  list_to_yojson batched_operation_layer_digest_to_yojson tree

let batch_check_layer_availability_request_to_yojson (x : batch_check_layer_availability_request) =
  assoc_to_yojson
    [
      ("layerDigests", Some (batched_operation_layer_digest_list_to_yojson x.layer_digests));
      ("repositoryName", Some (repository_name_to_yojson x.repository_name));
      ("registryId", option_to_yojson registry_id_or_alias_to_yojson x.registry_id);
    ]
