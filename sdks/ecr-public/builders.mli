open Types

val make_authorization_data :
  ?authorization_token:base64 -> ?expires_at:expiration_timestamp -> unit -> authorization_data

val make_layer_failure :
  ?layer_digest:batched_operation_layer_digest ->
  ?failure_code:layer_failure_code ->
  ?failure_reason:layer_failure_reason ->
  unit ->
  layer_failure

val make_layer :
  ?layer_digest:layer_digest ->
  ?layer_availability:layer_availability ->
  ?layer_size:layer_size_in_bytes ->
  ?media_type:media_type ->
  unit ->
  layer

val make_batch_check_layer_availability_response :
  ?layers:layer_list ->
  ?failures:layer_failure_list ->
  unit ->
  batch_check_layer_availability_response

val make_batch_check_layer_availability_request :
  ?registry_id:registry_id_or_alias ->
  repository_name:repository_name ->
  layer_digests:batched_operation_layer_digest_list ->
  unit ->
  batch_check_layer_availability_request

val make_image_identifier :
  ?image_digest:image_digest -> ?image_tag:image_tag -> unit -> image_identifier

val make_image_failure :
  ?image_id:image_identifier ->
  ?failure_code:image_failure_code ->
  ?failure_reason:image_failure_reason ->
  unit ->
  image_failure

val make_batch_delete_image_response :
  ?image_ids:image_identifier_list ->
  ?failures:image_failure_list ->
  unit ->
  batch_delete_image_response

val make_batch_delete_image_request :
  ?registry_id:registry_id_or_alias ->
  repository_name:repository_name ->
  image_ids:image_identifier_list ->
  unit ->
  batch_delete_image_request

val make_complete_layer_upload_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?upload_id:upload_id ->
  ?layer_digest:layer_digest ->
  unit ->
  complete_layer_upload_response

val make_complete_layer_upload_request :
  ?registry_id:registry_id_or_alias ->
  repository_name:repository_name ->
  upload_id:upload_id ->
  layer_digests:layer_digest_list ->
  unit ->
  complete_layer_upload_request

val make_repository_catalog_data :
  ?description:repository_description ->
  ?architectures:architecture_list ->
  ?operating_systems:operating_system_list ->
  ?logo_url:resource_url ->
  ?about_text:about_text ->
  ?usage_text:usage_text ->
  ?marketplace_certified:marketplace_certified ->
  unit ->
  repository_catalog_data

val make_repository :
  ?repository_arn:arn ->
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?repository_uri:url ->
  ?created_at:creation_timestamp ->
  unit ->
  repository

val make_create_repository_response :
  ?repository:repository ->
  ?catalog_data:repository_catalog_data ->
  unit ->
  create_repository_response

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_repository_catalog_data_input :
  ?description:repository_description ->
  ?architectures:architecture_list ->
  ?operating_systems:operating_system_list ->
  ?logo_image_blob:logo_image_blob ->
  ?about_text:about_text ->
  ?usage_text:usage_text ->
  unit ->
  repository_catalog_data_input

val make_create_repository_request :
  ?catalog_data:repository_catalog_data_input ->
  ?tags:tag_list ->
  repository_name:repository_name ->
  unit ->
  create_repository_request

val make_delete_repository_response : ?repository:repository -> unit -> delete_repository_response

val make_delete_repository_request :
  ?registry_id:registry_id ->
  ?force:force_flag ->
  repository_name:repository_name ->
  unit ->
  delete_repository_request

val make_delete_repository_policy_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?policy_text:repository_policy_text ->
  unit ->
  delete_repository_policy_response

val make_delete_repository_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  delete_repository_policy_request

val make_referenced_image_detail :
  ?image_digest:image_digest ->
  ?image_size_in_bytes:image_size_in_bytes ->
  ?image_pushed_at:push_timestamp ->
  ?image_manifest_media_type:media_type ->
  ?artifact_media_type:media_type ->
  unit ->
  referenced_image_detail

val make_image_tag_detail :
  ?image_tag:image_tag ->
  ?created_at:creation_timestamp ->
  ?image_detail:referenced_image_detail ->
  unit ->
  image_tag_detail

val make_describe_image_tags_response :
  ?image_tag_details:image_tag_detail_list ->
  ?next_token:next_token ->
  unit ->
  describe_image_tags_response

val make_describe_image_tags_request :
  ?registry_id:registry_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  repository_name:repository_name ->
  unit ->
  describe_image_tags_request

val make_image_detail :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_digest:image_digest ->
  ?image_tags:image_tag_list ->
  ?image_size_in_bytes:image_size_in_bytes ->
  ?image_pushed_at:push_timestamp ->
  ?image_manifest_media_type:media_type ->
  ?artifact_media_type:media_type ->
  unit ->
  image_detail

val make_describe_images_response :
  ?image_details:image_detail_list -> ?next_token:next_token -> unit -> describe_images_response

val make_describe_images_request :
  ?registry_id:registry_id ->
  ?image_ids:image_identifier_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  repository_name:repository_name ->
  unit ->
  describe_images_request

val make_registry_alias :
  name:registry_alias_name ->
  status:registry_alias_status ->
  primary_registry_alias:primary_registry_alias_flag ->
  default_registry_alias:default_registry_alias_flag ->
  unit ->
  registry_alias

val make_registry :
  registry_id:registry_id ->
  registry_arn:arn ->
  registry_uri:url ->
  verified:registry_verified ->
  aliases:registry_alias_list ->
  unit ->
  registry

val make_describe_registries_response :
  ?next_token:next_token -> registries:registry_list -> unit -> describe_registries_response

val make_describe_registries_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> describe_registries_request

val make_describe_repositories_response :
  ?repositories:repository_list -> ?next_token:next_token -> unit -> describe_repositories_response

val make_describe_repositories_request :
  ?registry_id:registry_id ->
  ?repository_names:repository_name_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_repositories_request

val make_get_authorization_token_response :
  ?authorization_data:authorization_data -> unit -> get_authorization_token_response

val make_get_authorization_token_request : unit -> unit

val make_registry_catalog_data :
  ?display_name:registry_display_name -> unit -> registry_catalog_data

val make_get_registry_catalog_data_response :
  registry_catalog_data:registry_catalog_data -> unit -> get_registry_catalog_data_response

val make_get_registry_catalog_data_request : unit -> unit

val make_get_repository_catalog_data_response :
  ?catalog_data:repository_catalog_data -> unit -> get_repository_catalog_data_response

val make_get_repository_catalog_data_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_repository_catalog_data_request

val make_get_repository_policy_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?policy_text:repository_policy_text ->
  unit ->
  get_repository_policy_response

val make_get_repository_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_repository_policy_request

val make_image :
  ?registry_id:registry_id_or_alias ->
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?image_manifest:image_manifest ->
  ?image_manifest_media_type:media_type ->
  unit ->
  image

val make_initiate_layer_upload_response :
  ?upload_id:upload_id -> ?part_size:part_size -> unit -> initiate_layer_upload_response

val make_initiate_layer_upload_request :
  ?registry_id:registry_id_or_alias ->
  repository_name:repository_name ->
  unit ->
  initiate_layer_upload_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request
val make_put_image_response : ?image:image -> unit -> put_image_response

val make_put_image_request :
  ?registry_id:registry_id_or_alias ->
  ?image_manifest_media_type:media_type ->
  ?image_tag:image_tag ->
  ?image_digest:image_digest ->
  repository_name:repository_name ->
  image_manifest:image_manifest ->
  unit ->
  put_image_request

val make_put_registry_catalog_data_response :
  registry_catalog_data:registry_catalog_data -> unit -> put_registry_catalog_data_response

val make_put_registry_catalog_data_request :
  ?display_name:registry_display_name -> unit -> put_registry_catalog_data_request

val make_put_repository_catalog_data_response :
  ?catalog_data:repository_catalog_data -> unit -> put_repository_catalog_data_response

val make_put_repository_catalog_data_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  catalog_data:repository_catalog_data_input ->
  unit ->
  put_repository_catalog_data_request

val make_set_repository_policy_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?policy_text:repository_policy_text ->
  unit ->
  set_repository_policy_response

val make_set_repository_policy_request :
  ?registry_id:registry_id ->
  ?force:force_flag ->
  repository_name:repository_name ->
  policy_text:repository_policy_text ->
  unit ->
  set_repository_policy_request

val make_upload_layer_part_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?upload_id:upload_id ->
  ?last_byte_received:part_size ->
  unit ->
  upload_layer_part_response

val make_upload_layer_part_request :
  ?registry_id:registry_id_or_alias ->
  repository_name:repository_name ->
  upload_id:upload_id ->
  part_first_byte:part_size ->
  part_last_byte:part_size ->
  layer_part_blob:layer_part_blob ->
  unit ->
  upload_layer_part_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_request
