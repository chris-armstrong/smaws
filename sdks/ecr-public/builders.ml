open Types

let make_authorization_data ?authorization_token:(authorization_token_ : base64 option)
    ?expires_at:(expires_at_ : expiration_timestamp option) () =
  ({ authorization_token = authorization_token_; expires_at = expires_at_ } : authorization_data)

let make_layer_failure ?layer_digest:(layer_digest_ : batched_operation_layer_digest option)
    ?failure_code:(failure_code_ : layer_failure_code option)
    ?failure_reason:(failure_reason_ : layer_failure_reason option) () =
  ({ layer_digest = layer_digest_; failure_code = failure_code_; failure_reason = failure_reason_ }
    : layer_failure)

let make_layer ?layer_digest:(layer_digest_ : layer_digest option)
    ?layer_availability:(layer_availability_ : layer_availability option)
    ?layer_size:(layer_size_ : layer_size_in_bytes option)
    ?media_type:(media_type_ : media_type option) () =
  ({
     layer_digest = layer_digest_;
     layer_availability = layer_availability_;
     layer_size = layer_size_;
     media_type = media_type_;
   }
    : layer)

let make_batch_check_layer_availability_response ?layers:(layers_ : layer_list option)
    ?failures:(failures_ : layer_failure_list option) () =
  ({ layers = layers_; failures = failures_ } : batch_check_layer_availability_response)

let make_batch_check_layer_availability_request
    ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~repository_name:(repository_name_ : repository_name)
    ~layer_digests:(layer_digests_ : batched_operation_layer_digest_list) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     layer_digests = layer_digests_;
   }
    : batch_check_layer_availability_request)

let make_image_identifier ?image_digest:(image_digest_ : image_digest option)
    ?image_tag:(image_tag_ : image_tag option) () =
  ({ image_digest = image_digest_; image_tag = image_tag_ } : image_identifier)

let make_image_failure ?image_id:(image_id_ : image_identifier option)
    ?failure_code:(failure_code_ : image_failure_code option)
    ?failure_reason:(failure_reason_ : image_failure_reason option) () =
  ({ image_id = image_id_; failure_code = failure_code_; failure_reason = failure_reason_ }
    : image_failure)

let make_batch_delete_image_response ?image_ids:(image_ids_ : image_identifier_list option)
    ?failures:(failures_ : image_failure_list option) () =
  ({ image_ids = image_ids_; failures = failures_ } : batch_delete_image_response)

let make_batch_delete_image_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~repository_name:(repository_name_ : repository_name)
    ~image_ids:(image_ids_ : image_identifier_list) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; image_ids = image_ids_ }
    : batch_delete_image_request)

let make_complete_layer_upload_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?upload_id:(upload_id_ : upload_id option) ?layer_digest:(layer_digest_ : layer_digest option)
    () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     upload_id = upload_id_;
     layer_digest = layer_digest_;
   }
    : complete_layer_upload_response)

let make_complete_layer_upload_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~repository_name:(repository_name_ : repository_name) ~upload_id:(upload_id_ : upload_id)
    ~layer_digests:(layer_digests_ : layer_digest_list) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     upload_id = upload_id_;
     layer_digests = layer_digests_;
   }
    : complete_layer_upload_request)

let make_repository_catalog_data ?description:(description_ : repository_description option)
    ?architectures:(architectures_ : architecture_list option)
    ?operating_systems:(operating_systems_ : operating_system_list option)
    ?logo_url:(logo_url_ : resource_url option) ?about_text:(about_text_ : about_text option)
    ?usage_text:(usage_text_ : usage_text option)
    ?marketplace_certified:(marketplace_certified_ : marketplace_certified option) () =
  ({
     description = description_;
     architectures = architectures_;
     operating_systems = operating_systems_;
     logo_url = logo_url_;
     about_text = about_text_;
     usage_text = usage_text_;
     marketplace_certified = marketplace_certified_;
   }
    : repository_catalog_data)

let make_repository ?repository_arn:(repository_arn_ : arn option)
    ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?repository_uri:(repository_uri_ : url option)
    ?created_at:(created_at_ : creation_timestamp option) () =
  ({
     repository_arn = repository_arn_;
     registry_id = registry_id_;
     repository_name = repository_name_;
     repository_uri = repository_uri_;
     created_at = created_at_;
   }
    : repository)

let make_create_repository_response ?repository:(repository_ : repository option)
    ?catalog_data:(catalog_data_ : repository_catalog_data option) () =
  ({ repository = repository_; catalog_data = catalog_data_ } : create_repository_response)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_repository_catalog_data_input ?description:(description_ : repository_description option)
    ?architectures:(architectures_ : architecture_list option)
    ?operating_systems:(operating_systems_ : operating_system_list option)
    ?logo_image_blob:(logo_image_blob_ : logo_image_blob option)
    ?about_text:(about_text_ : about_text option) ?usage_text:(usage_text_ : usage_text option) () =
  ({
     description = description_;
     architectures = architectures_;
     operating_systems = operating_systems_;
     logo_image_blob = logo_image_blob_;
     about_text = about_text_;
     usage_text = usage_text_;
   }
    : repository_catalog_data_input)

let make_create_repository_request
    ?catalog_data:(catalog_data_ : repository_catalog_data_input option)
    ?tags:(tags_ : tag_list option) ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; catalog_data = catalog_data_; tags = tags_ }
    : create_repository_request)

let make_delete_repository_response ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : delete_repository_response)

let make_delete_repository_request ?registry_id:(registry_id_ : registry_id option)
    ?force:(force_ : force_flag option) ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; force = force_ }
    : delete_repository_request)

let make_delete_repository_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?policy_text:(policy_text_ : repository_policy_text option) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; policy_text = policy_text_ }
    : delete_repository_policy_response)

let make_delete_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : delete_repository_policy_request)

let make_referenced_image_detail ?image_digest:(image_digest_ : image_digest option)
    ?image_size_in_bytes:(image_size_in_bytes_ : image_size_in_bytes option)
    ?image_pushed_at:(image_pushed_at_ : push_timestamp option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?artifact_media_type:(artifact_media_type_ : media_type option) () =
  ({
     image_digest = image_digest_;
     image_size_in_bytes = image_size_in_bytes_;
     image_pushed_at = image_pushed_at_;
     image_manifest_media_type = image_manifest_media_type_;
     artifact_media_type = artifact_media_type_;
   }
    : referenced_image_detail)

let make_image_tag_detail ?image_tag:(image_tag_ : image_tag option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?image_detail:(image_detail_ : referenced_image_detail option) () =
  ({ image_tag = image_tag_; created_at = created_at_; image_detail = image_detail_ }
    : image_tag_detail)

let make_describe_image_tags_response
    ?image_tag_details:(image_tag_details_ : image_tag_detail_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ image_tag_details = image_tag_details_; next_token = next_token_ }
    : describe_image_tags_response)

let make_describe_image_tags_request ?registry_id:(registry_id_ : registry_id option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_image_tags_request)

let make_image_detail ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_digest:(image_digest_ : image_digest option)
    ?image_tags:(image_tags_ : image_tag_list option)
    ?image_size_in_bytes:(image_size_in_bytes_ : image_size_in_bytes option)
    ?image_pushed_at:(image_pushed_at_ : push_timestamp option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?artifact_media_type:(artifact_media_type_ : media_type option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_digest = image_digest_;
     image_tags = image_tags_;
     image_size_in_bytes = image_size_in_bytes_;
     image_pushed_at = image_pushed_at_;
     image_manifest_media_type = image_manifest_media_type_;
     artifact_media_type = artifact_media_type_;
   }
    : image_detail)

let make_describe_images_response ?image_details:(image_details_ : image_detail_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ image_details = image_details_; next_token = next_token_ } : describe_images_response)

let make_describe_images_request ?registry_id:(registry_id_ : registry_id option)
    ?image_ids:(image_ids_ : image_identifier_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_ids = image_ids_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_images_request)

let make_registry_alias ~name:(name_ : registry_alias_name)
    ~status:(status_ : registry_alias_status)
    ~primary_registry_alias:(primary_registry_alias_ : primary_registry_alias_flag)
    ~default_registry_alias:(default_registry_alias_ : default_registry_alias_flag) () =
  ({
     name = name_;
     status = status_;
     primary_registry_alias = primary_registry_alias_;
     default_registry_alias = default_registry_alias_;
   }
    : registry_alias)

let make_registry ~registry_id:(registry_id_ : registry_id) ~registry_arn:(registry_arn_ : arn)
    ~registry_uri:(registry_uri_ : url) ~verified:(verified_ : registry_verified)
    ~aliases:(aliases_ : registry_alias_list) () =
  ({
     registry_id = registry_id_;
     registry_arn = registry_arn_;
     registry_uri = registry_uri_;
     verified = verified_;
     aliases = aliases_;
   }
    : registry)

let make_describe_registries_response ?next_token:(next_token_ : next_token option)
    ~registries:(registries_ : registry_list) () =
  ({ registries = registries_; next_token = next_token_ } : describe_registries_response)

let make_describe_registries_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_registries_request)

let make_describe_repositories_response ?repositories:(repositories_ : repository_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ repositories = repositories_; next_token = next_token_ } : describe_repositories_response)

let make_describe_repositories_request ?registry_id:(registry_id_ : registry_id option)
    ?repository_names:(repository_names_ : repository_name_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     registry_id = registry_id_;
     repository_names = repository_names_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_repositories_request)

let make_get_authorization_token_response
    ?authorization_data:(authorization_data_ : authorization_data option) () =
  ({ authorization_data = authorization_data_ } : get_authorization_token_response)

let make_get_authorization_token_request () = (() : unit)

let make_registry_catalog_data ?display_name:(display_name_ : registry_display_name option) () =
  ({ display_name = display_name_ } : registry_catalog_data)

let make_get_registry_catalog_data_response
    ~registry_catalog_data:(registry_catalog_data_ : registry_catalog_data) () =
  ({ registry_catalog_data = registry_catalog_data_ } : get_registry_catalog_data_response)

let make_get_registry_catalog_data_request () = (() : unit)

let make_get_repository_catalog_data_response
    ?catalog_data:(catalog_data_ : repository_catalog_data option) () =
  ({ catalog_data = catalog_data_ } : get_repository_catalog_data_response)

let make_get_repository_catalog_data_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : get_repository_catalog_data_request)

let make_get_repository_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?policy_text:(policy_text_ : repository_policy_text option) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; policy_text = policy_text_ }
    : get_repository_policy_response)

let make_get_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : get_repository_policy_request)

let make_image ?registry_id:(registry_id_ : registry_id_or_alias option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_id:(image_id_ : image_identifier option)
    ?image_manifest:(image_manifest_ : image_manifest option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_id = image_id_;
     image_manifest = image_manifest_;
     image_manifest_media_type = image_manifest_media_type_;
   }
    : image)

let make_initiate_layer_upload_response ?upload_id:(upload_id_ : upload_id option)
    ?part_size:(part_size_ : part_size option) () =
  ({ upload_id = upload_id_; part_size = part_size_ } : initiate_layer_upload_response)

let make_initiate_layer_upload_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : initiate_layer_upload_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_put_image_response ?image:(image_ : image option) () =
  ({ image = image_ } : put_image_response)

let make_put_image_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?image_tag:(image_tag_ : image_tag option) ?image_digest:(image_digest_ : image_digest option)
    ~repository_name:(repository_name_ : repository_name)
    ~image_manifest:(image_manifest_ : image_manifest) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_manifest = image_manifest_;
     image_manifest_media_type = image_manifest_media_type_;
     image_tag = image_tag_;
     image_digest = image_digest_;
   }
    : put_image_request)

let make_put_registry_catalog_data_response
    ~registry_catalog_data:(registry_catalog_data_ : registry_catalog_data) () =
  ({ registry_catalog_data = registry_catalog_data_ } : put_registry_catalog_data_response)

let make_put_registry_catalog_data_request
    ?display_name:(display_name_ : registry_display_name option) () =
  ({ display_name = display_name_ } : put_registry_catalog_data_request)

let make_put_repository_catalog_data_response
    ?catalog_data:(catalog_data_ : repository_catalog_data option) () =
  ({ catalog_data = catalog_data_ } : put_repository_catalog_data_response)

let make_put_repository_catalog_data_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~catalog_data:(catalog_data_ : repository_catalog_data_input) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; catalog_data = catalog_data_ }
    : put_repository_catalog_data_request)

let make_set_repository_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?policy_text:(policy_text_ : repository_policy_text option) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; policy_text = policy_text_ }
    : set_repository_policy_response)

let make_set_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ?force:(force_ : force_flag option) ~repository_name:(repository_name_ : repository_name)
    ~policy_text:(policy_text_ : repository_policy_text) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     policy_text = policy_text_;
     force = force_;
   }
    : set_repository_policy_request)

let make_upload_layer_part_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?upload_id:(upload_id_ : upload_id option)
    ?last_byte_received:(last_byte_received_ : part_size option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     upload_id = upload_id_;
     last_byte_received = last_byte_received_;
   }
    : upload_layer_part_response)

let make_upload_layer_part_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~repository_name:(repository_name_ : repository_name) ~upload_id:(upload_id_ : upload_id)
    ~part_first_byte:(part_first_byte_ : part_size) ~part_last_byte:(part_last_byte_ : part_size)
    ~layer_part_blob:(layer_part_blob_ : layer_part_blob) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     upload_id = upload_id_;
     part_first_byte = part_first_byte_;
     part_last_byte = part_last_byte_;
     layer_part_blob = layer_part_blob_;
   }
    : upload_layer_part_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)
