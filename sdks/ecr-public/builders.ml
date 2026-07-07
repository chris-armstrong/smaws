open Types

let make_upload_layer_part_response ?last_byte_received:(last_byte_received_ : part_size option)
    ?upload_id:(upload_id_ : upload_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     last_byte_received = last_byte_received_;
     upload_id = upload_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : upload_layer_part_response)

let make_upload_layer_part_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~layer_part_blob:(layer_part_blob_ : layer_part_blob)
    ~part_last_byte:(part_last_byte_ : part_size) ~part_first_byte:(part_first_byte_ : part_size)
    ~upload_id:(upload_id_ : upload_id) ~repository_name:(repository_name_ : repository_name) () =
  ({
     layer_part_blob = layer_part_blob_;
     part_last_byte = part_last_byte_;
     part_first_byte = part_first_byte_;
     upload_id = upload_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : upload_layer_part_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_set_repository_policy_response ?policy_text:(policy_text_ : repository_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; repository_name = repository_name_; registry_id = registry_id_ }
    : set_repository_policy_response)

let make_set_repository_policy_request ?force:(force_ : force_flag option)
    ?registry_id:(registry_id_ : registry_id option)
    ~policy_text:(policy_text_ : repository_policy_text)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     force = force_;
     policy_text = policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : set_repository_policy_request)

let make_repository_catalog_data
    ?marketplace_certified:(marketplace_certified_ : marketplace_certified option)
    ?usage_text:(usage_text_ : usage_text option) ?about_text:(about_text_ : about_text option)
    ?logo_url:(logo_url_ : resource_url option)
    ?operating_systems:(operating_systems_ : operating_system_list option)
    ?architectures:(architectures_ : architecture_list option)
    ?description:(description_ : repository_description option) () =
  ({
     marketplace_certified = marketplace_certified_;
     usage_text = usage_text_;
     about_text = about_text_;
     logo_url = logo_url_;
     operating_systems = operating_systems_;
     architectures = architectures_;
     description = description_;
   }
    : repository_catalog_data)

let make_put_repository_catalog_data_response
    ?catalog_data:(catalog_data_ : repository_catalog_data option) () =
  ({ catalog_data = catalog_data_ } : put_repository_catalog_data_response)

let make_repository_catalog_data_input ?usage_text:(usage_text_ : usage_text option)
    ?about_text:(about_text_ : about_text option)
    ?logo_image_blob:(logo_image_blob_ : logo_image_blob option)
    ?operating_systems:(operating_systems_ : operating_system_list option)
    ?architectures:(architectures_ : architecture_list option)
    ?description:(description_ : repository_description option) () =
  ({
     usage_text = usage_text_;
     about_text = about_text_;
     logo_image_blob = logo_image_blob_;
     operating_systems = operating_systems_;
     architectures = architectures_;
     description = description_;
   }
    : repository_catalog_data_input)

let make_put_repository_catalog_data_request ?registry_id:(registry_id_ : registry_id option)
    ~catalog_data:(catalog_data_ : repository_catalog_data_input)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ catalog_data = catalog_data_; repository_name = repository_name_; registry_id = registry_id_ }
    : put_repository_catalog_data_request)

let make_registry_catalog_data ?display_name:(display_name_ : registry_display_name option) () =
  ({ display_name = display_name_ } : registry_catalog_data)

let make_put_registry_catalog_data_response
    ~registry_catalog_data:(registry_catalog_data_ : registry_catalog_data) () =
  ({ registry_catalog_data = registry_catalog_data_ } : put_registry_catalog_data_response)

let make_put_registry_catalog_data_request
    ?display_name:(display_name_ : registry_display_name option) () =
  ({ display_name = display_name_ } : put_registry_catalog_data_request)

let make_image_identifier ?image_tag:(image_tag_ : image_tag option)
    ?image_digest:(image_digest_ : image_digest option) () =
  ({ image_tag = image_tag_; image_digest = image_digest_ } : image_identifier)

let make_image ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?image_manifest:(image_manifest_ : image_manifest option)
    ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id_or_alias option) () =
  ({
     image_manifest_media_type = image_manifest_media_type_;
     image_manifest = image_manifest_;
     image_id = image_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : image)

let make_put_image_response ?image:(image_ : image option) () =
  ({ image = image_ } : put_image_response)

let make_put_image_request ?image_digest:(image_digest_ : image_digest option)
    ?image_tag:(image_tag_ : image_tag option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~image_manifest:(image_manifest_ : image_manifest)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     image_digest = image_digest_;
     image_tag = image_tag_;
     image_manifest_media_type = image_manifest_media_type_;
     image_manifest = image_manifest_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_image_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_initiate_layer_upload_response ?part_size:(part_size_ : part_size option)
    ?upload_id:(upload_id_ : upload_id option) () =
  ({ part_size = part_size_; upload_id = upload_id_ } : initiate_layer_upload_response)

let make_initiate_layer_upload_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : initiate_layer_upload_request)

let make_get_repository_policy_response ?policy_text:(policy_text_ : repository_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; repository_name = repository_name_; registry_id = registry_id_ }
    : get_repository_policy_response)

let make_get_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : get_repository_policy_request)

let make_get_repository_catalog_data_response
    ?catalog_data:(catalog_data_ : repository_catalog_data option) () =
  ({ catalog_data = catalog_data_ } : get_repository_catalog_data_response)

let make_get_repository_catalog_data_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : get_repository_catalog_data_request)

let make_get_registry_catalog_data_response
    ~registry_catalog_data:(registry_catalog_data_ : registry_catalog_data) () =
  ({ registry_catalog_data = registry_catalog_data_ } : get_registry_catalog_data_response)

let make_get_registry_catalog_data_request () = (() : unit)

let make_authorization_data ?expires_at:(expires_at_ : expiration_timestamp option)
    ?authorization_token:(authorization_token_ : base64 option) () =
  ({ expires_at = expires_at_; authorization_token = authorization_token_ } : authorization_data)

let make_get_authorization_token_response
    ?authorization_data:(authorization_data_ : authorization_data option) () =
  ({ authorization_data = authorization_data_ } : get_authorization_token_response)

let make_get_authorization_token_request () = (() : unit)

let make_repository ?created_at:(created_at_ : creation_timestamp option)
    ?repository_uri:(repository_uri_ : url option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) ?repository_arn:(repository_arn_ : arn option)
    () =
  ({
     created_at = created_at_;
     repository_uri = repository_uri_;
     repository_name = repository_name_;
     registry_id = registry_id_;
     repository_arn = repository_arn_;
   }
    : repository)

let make_describe_repositories_response ?next_token:(next_token_ : next_token option)
    ?repositories:(repositories_ : repository_list option) () =
  ({ next_token = next_token_; repositories = repositories_ } : describe_repositories_response)

let make_describe_repositories_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?repository_names:(repository_names_ : repository_name_list option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     repository_names = repository_names_;
     registry_id = registry_id_;
   }
    : describe_repositories_request)

let make_registry_alias
    ~default_registry_alias:(default_registry_alias_ : default_registry_alias_flag)
    ~primary_registry_alias:(primary_registry_alias_ : primary_registry_alias_flag)
    ~status:(status_ : registry_alias_status) ~name:(name_ : registry_alias_name) () =
  ({
     default_registry_alias = default_registry_alias_;
     primary_registry_alias = primary_registry_alias_;
     status = status_;
     name = name_;
   }
    : registry_alias)

let make_registry ~aliases:(aliases_ : registry_alias_list)
    ~verified:(verified_ : registry_verified) ~registry_uri:(registry_uri_ : url)
    ~registry_arn:(registry_arn_ : arn) ~registry_id:(registry_id_ : registry_id) () =
  ({
     aliases = aliases_;
     verified = verified_;
     registry_uri = registry_uri_;
     registry_arn = registry_arn_;
     registry_id = registry_id_;
   }
    : registry)

let make_describe_registries_response ?next_token:(next_token_ : next_token option)
    ~registries:(registries_ : registry_list) () =
  ({ next_token = next_token_; registries = registries_ } : describe_registries_response)

let make_describe_registries_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_registries_request)

let make_referenced_image_detail ?artifact_media_type:(artifact_media_type_ : media_type option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?image_pushed_at:(image_pushed_at_ : push_timestamp option)
    ?image_size_in_bytes:(image_size_in_bytes_ : image_size_in_bytes option)
    ?image_digest:(image_digest_ : image_digest option) () =
  ({
     artifact_media_type = artifact_media_type_;
     image_manifest_media_type = image_manifest_media_type_;
     image_pushed_at = image_pushed_at_;
     image_size_in_bytes = image_size_in_bytes_;
     image_digest = image_digest_;
   }
    : referenced_image_detail)

let make_image_tag_detail ?image_detail:(image_detail_ : referenced_image_detail option)
    ?created_at:(created_at_ : creation_timestamp option) ?image_tag:(image_tag_ : image_tag option)
    () =
  ({ image_detail = image_detail_; created_at = created_at_; image_tag = image_tag_ }
    : image_tag_detail)

let make_describe_image_tags_response ?next_token:(next_token_ : next_token option)
    ?image_tag_details:(image_tag_details_ : image_tag_detail_list option) () =
  ({ next_token = next_token_; image_tag_details = image_tag_details_ }
    : describe_image_tags_response)

let make_describe_image_tags_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : describe_image_tags_request)

let make_image_detail ?artifact_media_type:(artifact_media_type_ : media_type option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?image_pushed_at:(image_pushed_at_ : push_timestamp option)
    ?image_size_in_bytes:(image_size_in_bytes_ : image_size_in_bytes option)
    ?image_tags:(image_tags_ : image_tag_list option)
    ?image_digest:(image_digest_ : image_digest option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     artifact_media_type = artifact_media_type_;
     image_manifest_media_type = image_manifest_media_type_;
     image_pushed_at = image_pushed_at_;
     image_size_in_bytes = image_size_in_bytes_;
     image_tags = image_tags_;
     image_digest = image_digest_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : image_detail)

let make_describe_images_response ?next_token:(next_token_ : next_token option)
    ?image_details:(image_details_ : image_detail_list option) () =
  ({ next_token = next_token_; image_details = image_details_ } : describe_images_response)

let make_describe_images_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?image_ids:(image_ids_ : image_identifier_list option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     image_ids = image_ids_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : describe_images_request)

let make_delete_repository_policy_response
    ?policy_text:(policy_text_ : repository_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; repository_name = repository_name_; registry_id = registry_id_ }
    : delete_repository_policy_response)

let make_delete_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : delete_repository_policy_request)

let make_delete_repository_response ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : delete_repository_response)

let make_delete_repository_request ?force:(force_ : force_flag option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ force = force_; repository_name = repository_name_; registry_id = registry_id_ }
    : delete_repository_request)

let make_create_repository_response ?catalog_data:(catalog_data_ : repository_catalog_data option)
    ?repository:(repository_ : repository option) () =
  ({ catalog_data = catalog_data_; repository = repository_ } : create_repository_response)

let make_create_repository_request ?tags:(tags_ : tag_list option)
    ?catalog_data:(catalog_data_ : repository_catalog_data_input option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ tags = tags_; catalog_data = catalog_data_; repository_name = repository_name_ }
    : create_repository_request)

let make_complete_layer_upload_response ?layer_digest:(layer_digest_ : layer_digest option)
    ?upload_id:(upload_id_ : upload_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     layer_digest = layer_digest_;
     upload_id = upload_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : complete_layer_upload_response)

let make_complete_layer_upload_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~layer_digests:(layer_digests_ : layer_digest_list) ~upload_id:(upload_id_ : upload_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     layer_digests = layer_digests_;
     upload_id = upload_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : complete_layer_upload_request)

let make_image_failure ?failure_reason:(failure_reason_ : image_failure_reason option)
    ?failure_code:(failure_code_ : image_failure_code option)
    ?image_id:(image_id_ : image_identifier option) () =
  ({ failure_reason = failure_reason_; failure_code = failure_code_; image_id = image_id_ }
    : image_failure)

let make_batch_delete_image_response ?failures:(failures_ : image_failure_list option)
    ?image_ids:(image_ids_ : image_identifier_list option) () =
  ({ failures = failures_; image_ids = image_ids_ } : batch_delete_image_response)

let make_batch_delete_image_request ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~image_ids:(image_ids_ : image_identifier_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ image_ids = image_ids_; repository_name = repository_name_; registry_id = registry_id_ }
    : batch_delete_image_request)

let make_layer ?media_type:(media_type_ : media_type option)
    ?layer_size:(layer_size_ : layer_size_in_bytes option)
    ?layer_availability:(layer_availability_ : layer_availability option)
    ?layer_digest:(layer_digest_ : layer_digest option) () =
  ({
     media_type = media_type_;
     layer_size = layer_size_;
     layer_availability = layer_availability_;
     layer_digest = layer_digest_;
   }
    : layer)

let make_layer_failure ?failure_reason:(failure_reason_ : layer_failure_reason option)
    ?failure_code:(failure_code_ : layer_failure_code option)
    ?layer_digest:(layer_digest_ : batched_operation_layer_digest option) () =
  ({ failure_reason = failure_reason_; failure_code = failure_code_; layer_digest = layer_digest_ }
    : layer_failure)

let make_batch_check_layer_availability_response ?failures:(failures_ : layer_failure_list option)
    ?layers:(layers_ : layer_list option) () =
  ({ failures = failures_; layers = layers_ } : batch_check_layer_availability_response)

let make_batch_check_layer_availability_request
    ?registry_id:(registry_id_ : registry_id_or_alias option)
    ~layer_digests:(layer_digests_ : batched_operation_layer_digest_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     layer_digests = layer_digests_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : batch_check_layer_availability_request)
