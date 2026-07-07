open Types

val make_upload_layer_part_response :
  ?last_byte_received:part_size ->
  ?upload_id:upload_id ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  upload_layer_part_response

val make_upload_layer_part_request :
  ?registry_id:registry_id_or_alias ->
  layer_part_blob:layer_part_blob ->
  part_last_byte:part_size ->
  part_first_byte:part_size ->
  upload_id:upload_id ->
  repository_name:repository_name ->
  unit ->
  upload_layer_part_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag
val make_tag_resource_request : tags:tag_list -> resource_arn:arn -> unit -> tag_resource_request

val make_set_repository_policy_response :
  ?policy_text:repository_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  set_repository_policy_response

val make_set_repository_policy_request :
  ?force:force_flag ->
  ?registry_id:registry_id ->
  policy_text:repository_policy_text ->
  repository_name:repository_name ->
  unit ->
  set_repository_policy_request

val make_repository_catalog_data :
  ?marketplace_certified:marketplace_certified ->
  ?usage_text:usage_text ->
  ?about_text:about_text ->
  ?logo_url:resource_url ->
  ?operating_systems:operating_system_list ->
  ?architectures:architecture_list ->
  ?description:repository_description ->
  unit ->
  repository_catalog_data

val make_put_repository_catalog_data_response :
  ?catalog_data:repository_catalog_data -> unit -> put_repository_catalog_data_response

val make_repository_catalog_data_input :
  ?usage_text:usage_text ->
  ?about_text:about_text ->
  ?logo_image_blob:logo_image_blob ->
  ?operating_systems:operating_system_list ->
  ?architectures:architecture_list ->
  ?description:repository_description ->
  unit ->
  repository_catalog_data_input

val make_put_repository_catalog_data_request :
  ?registry_id:registry_id ->
  catalog_data:repository_catalog_data_input ->
  repository_name:repository_name ->
  unit ->
  put_repository_catalog_data_request

val make_registry_catalog_data :
  ?display_name:registry_display_name -> unit -> registry_catalog_data

val make_put_registry_catalog_data_response :
  registry_catalog_data:registry_catalog_data -> unit -> put_registry_catalog_data_response

val make_put_registry_catalog_data_request :
  ?display_name:registry_display_name -> unit -> put_registry_catalog_data_request

val make_image_identifier :
  ?image_tag:image_tag -> ?image_digest:image_digest -> unit -> image_identifier

val make_image :
  ?image_manifest_media_type:media_type ->
  ?image_manifest:image_manifest ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id_or_alias ->
  unit ->
  image

val make_put_image_response : ?image:image -> unit -> put_image_response

val make_put_image_request :
  ?image_digest:image_digest ->
  ?image_tag:image_tag ->
  ?image_manifest_media_type:media_type ->
  ?registry_id:registry_id_or_alias ->
  image_manifest:image_manifest ->
  repository_name:repository_name ->
  unit ->
  put_image_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_initiate_layer_upload_response :
  ?part_size:part_size -> ?upload_id:upload_id -> unit -> initiate_layer_upload_response

val make_initiate_layer_upload_request :
  ?registry_id:registry_id_or_alias ->
  repository_name:repository_name ->
  unit ->
  initiate_layer_upload_request

val make_get_repository_policy_response :
  ?policy_text:repository_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  get_repository_policy_response

val make_get_repository_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_repository_policy_request

val make_get_repository_catalog_data_response :
  ?catalog_data:repository_catalog_data -> unit -> get_repository_catalog_data_response

val make_get_repository_catalog_data_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_repository_catalog_data_request

val make_get_registry_catalog_data_response :
  registry_catalog_data:registry_catalog_data -> unit -> get_registry_catalog_data_response

val make_get_registry_catalog_data_request : unit -> unit

val make_authorization_data :
  ?expires_at:expiration_timestamp -> ?authorization_token:base64 -> unit -> authorization_data

val make_get_authorization_token_response :
  ?authorization_data:authorization_data -> unit -> get_authorization_token_response

val make_get_authorization_token_request : unit -> unit

val make_repository :
  ?created_at:creation_timestamp ->
  ?repository_uri:url ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  ?repository_arn:arn ->
  unit ->
  repository

val make_describe_repositories_response :
  ?next_token:next_token -> ?repositories:repository_list -> unit -> describe_repositories_response

val make_describe_repositories_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?repository_names:repository_name_list ->
  ?registry_id:registry_id ->
  unit ->
  describe_repositories_request

val make_registry_alias :
  default_registry_alias:default_registry_alias_flag ->
  primary_registry_alias:primary_registry_alias_flag ->
  status:registry_alias_status ->
  name:registry_alias_name ->
  unit ->
  registry_alias

val make_registry :
  aliases:registry_alias_list ->
  verified:registry_verified ->
  registry_uri:url ->
  registry_arn:arn ->
  registry_id:registry_id ->
  unit ->
  registry

val make_describe_registries_response :
  ?next_token:next_token -> registries:registry_list -> unit -> describe_registries_response

val make_describe_registries_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_registries_request

val make_referenced_image_detail :
  ?artifact_media_type:media_type ->
  ?image_manifest_media_type:media_type ->
  ?image_pushed_at:push_timestamp ->
  ?image_size_in_bytes:image_size_in_bytes ->
  ?image_digest:image_digest ->
  unit ->
  referenced_image_detail

val make_image_tag_detail :
  ?image_detail:referenced_image_detail ->
  ?created_at:creation_timestamp ->
  ?image_tag:image_tag ->
  unit ->
  image_tag_detail

val make_describe_image_tags_response :
  ?next_token:next_token ->
  ?image_tag_details:image_tag_detail_list ->
  unit ->
  describe_image_tags_response

val make_describe_image_tags_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  describe_image_tags_request

val make_image_detail :
  ?artifact_media_type:media_type ->
  ?image_manifest_media_type:media_type ->
  ?image_pushed_at:push_timestamp ->
  ?image_size_in_bytes:image_size_in_bytes ->
  ?image_tags:image_tag_list ->
  ?image_digest:image_digest ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  image_detail

val make_describe_images_response :
  ?next_token:next_token -> ?image_details:image_detail_list -> unit -> describe_images_response

val make_describe_images_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?image_ids:image_identifier_list ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  describe_images_request

val make_delete_repository_policy_response :
  ?policy_text:repository_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  delete_repository_policy_response

val make_delete_repository_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  delete_repository_policy_request

val make_delete_repository_response : ?repository:repository -> unit -> delete_repository_response

val make_delete_repository_request :
  ?force:force_flag ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  delete_repository_request

val make_create_repository_response :
  ?catalog_data:repository_catalog_data ->
  ?repository:repository ->
  unit ->
  create_repository_response

val make_create_repository_request :
  ?tags:tag_list ->
  ?catalog_data:repository_catalog_data_input ->
  repository_name:repository_name ->
  unit ->
  create_repository_request

val make_complete_layer_upload_response :
  ?layer_digest:layer_digest ->
  ?upload_id:upload_id ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  complete_layer_upload_response

val make_complete_layer_upload_request :
  ?registry_id:registry_id_or_alias ->
  layer_digests:layer_digest_list ->
  upload_id:upload_id ->
  repository_name:repository_name ->
  unit ->
  complete_layer_upload_request

val make_image_failure :
  ?failure_reason:image_failure_reason ->
  ?failure_code:image_failure_code ->
  ?image_id:image_identifier ->
  unit ->
  image_failure

val make_batch_delete_image_response :
  ?failures:image_failure_list ->
  ?image_ids:image_identifier_list ->
  unit ->
  batch_delete_image_response

val make_batch_delete_image_request :
  ?registry_id:registry_id_or_alias ->
  image_ids:image_identifier_list ->
  repository_name:repository_name ->
  unit ->
  batch_delete_image_request

val make_layer :
  ?media_type:media_type ->
  ?layer_size:layer_size_in_bytes ->
  ?layer_availability:layer_availability ->
  ?layer_digest:layer_digest ->
  unit ->
  layer

val make_layer_failure :
  ?failure_reason:layer_failure_reason ->
  ?failure_code:layer_failure_code ->
  ?layer_digest:batched_operation_layer_digest ->
  unit ->
  layer_failure

val make_batch_check_layer_availability_response :
  ?failures:layer_failure_list ->
  ?layers:layer_list ->
  unit ->
  batch_check_layer_availability_response

val make_batch_check_layer_availability_request :
  ?registry_id:registry_id_or_alias ->
  layer_digests:batched_operation_layer_digest_list ->
  repository_name:repository_name ->
  unit ->
  batch_check_layer_availability_request
