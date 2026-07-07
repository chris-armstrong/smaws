open Smaws_Lib.Json.DeserializeHelpers
open Types

let usage_text_of_yojson = string_of_yojson
let url_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let upload_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : upload_not_found_exception)

let registry_id_of_yojson = string_of_yojson
let repository_name_of_yojson = string_of_yojson
let upload_id_of_yojson = string_of_yojson
let part_size_of_yojson = long_of_yojson

let upload_layer_part_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_byte_received =
       option_of_yojson (value_for_key part_size_of_yojson "lastByteReceived") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : upload_layer_part_response)

let registry_id_or_alias_of_yojson = string_of_yojson
let layer_part_blob_of_yojson = blob_of_yojson

let upload_layer_part_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layer_part_blob = value_for_key layer_part_blob_of_yojson "layerPartBlob" _list path;
     part_last_byte = value_for_key part_size_of_yojson "partLastByte" _list path;
     part_first_byte = value_for_key part_size_of_yojson "partFirstByte" _list path;
     upload_id = value_for_key upload_id_of_yojson "uploadId" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : upload_layer_part_request)

let unsupported_command_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : unsupported_command_exception)

let server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : server_exception)

let repository_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_not_found_exception)

let registry_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : registry_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_parameter_exception)

let invalid_layer_part_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     last_valid_byte_received =
       option_of_yojson (value_for_key part_size_of_yojson "lastValidByteReceived") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : invalid_layer_part_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : too_many_tags_exception)

let invalid_tag_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : invalid_tag_parameter_exception)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let repository_policy_text_of_yojson = string_of_yojson

let set_repository_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_text =
       option_of_yojson (value_for_key repository_policy_text_of_yojson "policyText") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : set_repository_policy_response)

let force_flag_of_yojson = bool_of_yojson

let set_repository_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force = option_of_yojson (value_for_key force_flag_of_yojson "force") _list path;
     policy_text = value_for_key repository_policy_text_of_yojson "policyText" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : set_repository_policy_request)

let repository_description_of_yojson = string_of_yojson
let architecture_of_yojson = string_of_yojson
let architecture_list_of_yojson tree path = list_of_yojson architecture_of_yojson tree path
let operating_system_of_yojson = string_of_yojson
let operating_system_list_of_yojson tree path = list_of_yojson operating_system_of_yojson tree path
let resource_url_of_yojson = string_of_yojson
let about_text_of_yojson = string_of_yojson
let marketplace_certified_of_yojson = bool_of_yojson

let repository_catalog_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marketplace_certified =
       option_of_yojson
         (value_for_key marketplace_certified_of_yojson "marketplaceCertified")
         _list path;
     usage_text = option_of_yojson (value_for_key usage_text_of_yojson "usageText") _list path;
     about_text = option_of_yojson (value_for_key about_text_of_yojson "aboutText") _list path;
     logo_url = option_of_yojson (value_for_key resource_url_of_yojson "logoUrl") _list path;
     operating_systems =
       option_of_yojson
         (value_for_key operating_system_list_of_yojson "operatingSystems")
         _list path;
     architectures =
       option_of_yojson (value_for_key architecture_list_of_yojson "architectures") _list path;
     description =
       option_of_yojson (value_for_key repository_description_of_yojson "description") _list path;
   }
    : repository_catalog_data)

let put_repository_catalog_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_data =
       option_of_yojson (value_for_key repository_catalog_data_of_yojson "catalogData") _list path;
   }
    : put_repository_catalog_data_response)

let logo_image_blob_of_yojson = blob_of_yojson

let repository_catalog_data_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_text = option_of_yojson (value_for_key usage_text_of_yojson "usageText") _list path;
     about_text = option_of_yojson (value_for_key about_text_of_yojson "aboutText") _list path;
     logo_image_blob =
       option_of_yojson (value_for_key logo_image_blob_of_yojson "logoImageBlob") _list path;
     operating_systems =
       option_of_yojson
         (value_for_key operating_system_list_of_yojson "operatingSystems")
         _list path;
     architectures =
       option_of_yojson (value_for_key architecture_list_of_yojson "architectures") _list path;
     description =
       option_of_yojson (value_for_key repository_description_of_yojson "description") _list path;
   }
    : repository_catalog_data_input)

let put_repository_catalog_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_data = value_for_key repository_catalog_data_input_of_yojson "catalogData" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : put_repository_catalog_data_request)

let registry_display_name_of_yojson = string_of_yojson

let registry_catalog_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_name =
       option_of_yojson (value_for_key registry_display_name_of_yojson "displayName") _list path;
   }
    : registry_catalog_data)

let put_registry_catalog_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_catalog_data =
       value_for_key registry_catalog_data_of_yojson "registryCatalogData" _list path;
   }
    : put_registry_catalog_data_response)

let put_registry_catalog_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_name =
       option_of_yojson (value_for_key registry_display_name_of_yojson "displayName") _list path;
   }
    : put_registry_catalog_data_request)

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

let image_digest_of_yojson = string_of_yojson
let image_tag_of_yojson = string_of_yojson

let image_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_tag = option_of_yojson (value_for_key image_tag_of_yojson "imageTag") _list path;
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
   }
    : image_identifier)

let image_manifest_of_yojson = string_of_yojson
let media_type_of_yojson = string_of_yojson

let image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
     image_manifest =
       option_of_yojson (value_for_key image_manifest_of_yojson "imageManifest") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : image)

let put_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image = option_of_yojson (value_for_key image_of_yojson "image") _list path }
    : put_image_response)

let put_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
     image_tag = option_of_yojson (value_for_key image_tag_of_yojson "imageTag") _list path;
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
     image_manifest = value_for_key image_manifest_of_yojson "imageManifest" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : put_image_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let initiate_layer_upload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     part_size = option_of_yojson (value_for_key part_size_of_yojson "partSize") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
   }
    : initiate_layer_upload_response)

let initiate_layer_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : initiate_layer_upload_request)

let repository_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_policy_not_found_exception)

let get_repository_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_text =
       option_of_yojson (value_for_key repository_policy_text_of_yojson "policyText") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : get_repository_policy_response)

let get_repository_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : get_repository_policy_request)

let repository_catalog_data_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_catalog_data_not_found_exception)

let get_repository_catalog_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_data =
       option_of_yojson (value_for_key repository_catalog_data_of_yojson "catalogData") _list path;
   }
    : get_repository_catalog_data_response)

let get_repository_catalog_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : get_repository_catalog_data_request)

let get_registry_catalog_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registry_catalog_data =
       value_for_key registry_catalog_data_of_yojson "registryCatalogData" _list path;
   }
    : get_registry_catalog_data_response)

let get_registry_catalog_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let base64_of_yojson = string_of_yojson
let expiration_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let authorization_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires_at =
       option_of_yojson (value_for_key expiration_timestamp_of_yojson "expiresAt") _list path;
     authorization_token =
       option_of_yojson (value_for_key base64_of_yojson "authorizationToken") _list path;
   }
    : authorization_data)

let get_authorization_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorization_data =
       option_of_yojson (value_for_key authorization_data_of_yojson "authorizationData") _list path;
   }
    : get_authorization_token_response)

let get_authorization_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let creation_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let repository_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
     repository_uri = option_of_yojson (value_for_key url_of_yojson "repositoryUri") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
     repository_arn = option_of_yojson (value_for_key arn_of_yojson "repositoryArn") _list path;
   }
    : repository)

let repository_list_of_yojson tree path = list_of_yojson repository_of_yojson tree path
let next_token_of_yojson = string_of_yojson

let describe_repositories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     repositories =
       option_of_yojson (value_for_key repository_list_of_yojson "repositories") _list path;
   }
    : describe_repositories_response)

let repository_name_list_of_yojson tree path = list_of_yojson repository_name_of_yojson tree path
let max_results_of_yojson = int_of_yojson

let describe_repositories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     repository_names =
       option_of_yojson (value_for_key repository_name_list_of_yojson "repositoryNames") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : describe_repositories_request)

let registry_verified_of_yojson = bool_of_yojson
let registry_alias_name_of_yojson = string_of_yojson

let registry_alias_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REJECTED" -> REJECTED
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistryAliasStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistryAliasStatus")
     : registry_alias_status)
    : registry_alias_status)

let primary_registry_alias_flag_of_yojson = bool_of_yojson
let default_registry_alias_flag_of_yojson = bool_of_yojson

let registry_alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_registry_alias =
       value_for_key default_registry_alias_flag_of_yojson "defaultRegistryAlias" _list path;
     primary_registry_alias =
       value_for_key primary_registry_alias_flag_of_yojson "primaryRegistryAlias" _list path;
     status = value_for_key registry_alias_status_of_yojson "status" _list path;
     name = value_for_key registry_alias_name_of_yojson "name" _list path;
   }
    : registry_alias)

let registry_alias_list_of_yojson tree path = list_of_yojson registry_alias_of_yojson tree path

let registry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aliases = value_for_key registry_alias_list_of_yojson "aliases" _list path;
     verified = value_for_key registry_verified_of_yojson "verified" _list path;
     registry_uri = value_for_key url_of_yojson "registryUri" _list path;
     registry_arn = value_for_key arn_of_yojson "registryArn" _list path;
     registry_id = value_for_key registry_id_of_yojson "registryId" _list path;
   }
    : registry)

let registry_list_of_yojson tree path = list_of_yojson registry_of_yojson tree path

let describe_registries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     registries = value_for_key registry_list_of_yojson "registries" _list path;
   }
    : describe_registries_response)

let describe_registries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_registries_request)

let image_size_in_bytes_of_yojson = long_of_yojson
let push_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let referenced_image_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     artifact_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "artifactMediaType") _list path;
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
     image_pushed_at =
       option_of_yojson (value_for_key push_timestamp_of_yojson "imagePushedAt") _list path;
     image_size_in_bytes =
       option_of_yojson (value_for_key image_size_in_bytes_of_yojson "imageSizeInBytes") _list path;
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
   }
    : referenced_image_detail)

let image_tag_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_detail =
       option_of_yojson (value_for_key referenced_image_detail_of_yojson "imageDetail") _list path;
     created_at =
       option_of_yojson (value_for_key creation_timestamp_of_yojson "createdAt") _list path;
     image_tag = option_of_yojson (value_for_key image_tag_of_yojson "imageTag") _list path;
   }
    : image_tag_detail)

let image_tag_detail_list_of_yojson tree path = list_of_yojson image_tag_detail_of_yojson tree path

let describe_image_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     image_tag_details =
       option_of_yojson (value_for_key image_tag_detail_list_of_yojson "imageTagDetails") _list path;
   }
    : describe_image_tags_response)

let describe_image_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : describe_image_tags_request)

let image_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : image_not_found_exception)

let image_tag_list_of_yojson tree path = list_of_yojson image_tag_of_yojson tree path

let image_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     artifact_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "artifactMediaType") _list path;
     image_manifest_media_type =
       option_of_yojson (value_for_key media_type_of_yojson "imageManifestMediaType") _list path;
     image_pushed_at =
       option_of_yojson (value_for_key push_timestamp_of_yojson "imagePushedAt") _list path;
     image_size_in_bytes =
       option_of_yojson (value_for_key image_size_in_bytes_of_yojson "imageSizeInBytes") _list path;
     image_tags = option_of_yojson (value_for_key image_tag_list_of_yojson "imageTags") _list path;
     image_digest = option_of_yojson (value_for_key image_digest_of_yojson "imageDigest") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : image_detail)

let image_detail_list_of_yojson tree path = list_of_yojson image_detail_of_yojson tree path

let describe_images_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     image_details =
       option_of_yojson (value_for_key image_detail_list_of_yojson "imageDetails") _list path;
   }
    : describe_images_response)

let image_identifier_list_of_yojson tree path = list_of_yojson image_identifier_of_yojson tree path

let describe_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     image_ids =
       option_of_yojson (value_for_key image_identifier_list_of_yojson "imageIds") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : describe_images_request)

let delete_repository_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_text =
       option_of_yojson (value_for_key repository_policy_text_of_yojson "policyText") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : delete_repository_policy_response)

let delete_repository_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : delete_repository_policy_request)

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
     force = option_of_yojson (value_for_key force_flag_of_yojson "force") _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : delete_repository_request)

let repository_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : repository_already_exists_exception)

let create_repository_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog_data =
       option_of_yojson (value_for_key repository_catalog_data_of_yojson "catalogData") _list path;
     repository = option_of_yojson (value_for_key repository_of_yojson "repository") _list path;
   }
    : create_repository_response)

let create_repository_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     catalog_data =
       option_of_yojson
         (value_for_key repository_catalog_data_input_of_yojson "catalogData")
         _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
   }
    : create_repository_request)

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

let layer_digest_of_yojson = string_of_yojson

let complete_layer_upload_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layer_digest = option_of_yojson (value_for_key layer_digest_of_yojson "layerDigest") _list path;
     upload_id = option_of_yojson (value_for_key upload_id_of_yojson "uploadId") _list path;
     repository_name =
       option_of_yojson (value_for_key repository_name_of_yojson "repositoryName") _list path;
     registry_id = option_of_yojson (value_for_key registry_id_of_yojson "registryId") _list path;
   }
    : complete_layer_upload_response)

let layer_digest_list_of_yojson tree path = list_of_yojson layer_digest_of_yojson tree path

let complete_layer_upload_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layer_digests = value_for_key layer_digest_list_of_yojson "layerDigests" _list path;
     upload_id = value_for_key upload_id_of_yojson "uploadId" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : complete_layer_upload_request)

let image_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "KmsError" -> KmsError
    | `String "ImageReferencedByManifestList" -> ImageReferencedByManifestList
    | `String "MissingDigestAndTag" -> MissingDigestAndTag
    | `String "ImageNotFound" -> ImageNotFound
    | `String "ImageTagDoesNotMatchDigest" -> ImageTagDoesNotMatchDigest
    | `String "InvalidImageTag" -> InvalidImageTag
    | `String "InvalidImageDigest" -> InvalidImageDigest
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageFailureCode")
     : image_failure_code)
    : image_failure_code)

let image_failure_reason_of_yojson = string_of_yojson

let image_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       option_of_yojson (value_for_key image_failure_reason_of_yojson "failureReason") _list path;
     failure_code =
       option_of_yojson (value_for_key image_failure_code_of_yojson "failureCode") _list path;
     image_id = option_of_yojson (value_for_key image_identifier_of_yojson "imageId") _list path;
   }
    : image_failure)

let image_failure_list_of_yojson tree path = list_of_yojson image_failure_of_yojson tree path

let batch_delete_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failures = option_of_yojson (value_for_key image_failure_list_of_yojson "failures") _list path;
     image_ids =
       option_of_yojson (value_for_key image_identifier_list_of_yojson "imageIds") _list path;
   }
    : batch_delete_image_response)

let batch_delete_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_ids = value_for_key image_identifier_list_of_yojson "imageIds" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : batch_delete_image_request)

let layer_availability_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "LayerAvailability" value)
    | _ -> raise (deserialize_wrong_type_error path "LayerAvailability")
     : layer_availability)
    : layer_availability)

let layer_size_in_bytes_of_yojson = long_of_yojson

let layer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     media_type = option_of_yojson (value_for_key media_type_of_yojson "mediaType") _list path;
     layer_size =
       option_of_yojson (value_for_key layer_size_in_bytes_of_yojson "layerSize") _list path;
     layer_availability =
       option_of_yojson (value_for_key layer_availability_of_yojson "layerAvailability") _list path;
     layer_digest = option_of_yojson (value_for_key layer_digest_of_yojson "layerDigest") _list path;
   }
    : layer)

let layer_list_of_yojson tree path = list_of_yojson layer_of_yojson tree path
let batched_operation_layer_digest_of_yojson = string_of_yojson

let layer_failure_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "MissingLayerDigest" -> MissingLayerDigest
    | `String "InvalidLayerDigest" -> InvalidLayerDigest
    | `String value -> raise (deserialize_unknown_enum_value_error path "LayerFailureCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LayerFailureCode")
     : layer_failure_code)
    : layer_failure_code)

let layer_failure_reason_of_yojson = string_of_yojson

let layer_failure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       option_of_yojson (value_for_key layer_failure_reason_of_yojson "failureReason") _list path;
     failure_code =
       option_of_yojson (value_for_key layer_failure_code_of_yojson "failureCode") _list path;
     layer_digest =
       option_of_yojson
         (value_for_key batched_operation_layer_digest_of_yojson "layerDigest")
         _list path;
   }
    : layer_failure)

let layer_failure_list_of_yojson tree path = list_of_yojson layer_failure_of_yojson tree path

let batch_check_layer_availability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failures = option_of_yojson (value_for_key layer_failure_list_of_yojson "failures") _list path;
     layers = option_of_yojson (value_for_key layer_list_of_yojson "layers") _list path;
   }
    : batch_check_layer_availability_response)

let batched_operation_layer_digest_list_of_yojson tree path =
  list_of_yojson batched_operation_layer_digest_of_yojson tree path

let batch_check_layer_availability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     layer_digests =
       value_for_key batched_operation_layer_digest_list_of_yojson "layerDigests" _list path;
     repository_name = value_for_key repository_name_of_yojson "repositoryName" _list path;
     registry_id =
       option_of_yojson (value_for_key registry_id_or_alias_of_yojson "registryId") _list path;
   }
    : batch_check_layer_availability_request)
