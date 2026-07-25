open Types

let make_validate_pull_through_cache_rule_response
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?registry_id:(registry_id_ : registry_id option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?is_valid:(is_valid_ : is_ptc_rule_valid option)
    ?failure:(failure_ : ptc_validate_failure option) () =
  ({
     ecr_repository_prefix = ecr_repository_prefix_;
     registry_id = registry_id_;
     upstream_registry_url = upstream_registry_url_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
     upstream_repository_prefix = upstream_repository_prefix_;
     is_valid = is_valid_;
     failure = failure_;
   }
    : validate_pull_through_cache_rule_response)

let make_validate_pull_through_cache_rule_request ?registry_id:(registry_id_ : registry_id option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({ ecr_repository_prefix = ecr_repository_prefix_; registry_id = registry_id_ }
    : validate_pull_through_cache_rule_request)

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

let make_upload_layer_part_request ?registry_id:(registry_id_ : registry_id option)
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

let make_image_tag_mutability_exclusion_filter
    ~filter_type:(filter_type_ : image_tag_mutability_exclusion_filter_type)
    ~filter:(filter_ : image_tag_mutability_exclusion_filter_value) () =
  ({ filter_type = filter_type_; filter = filter_ } : image_tag_mutability_exclusion_filter)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_encryption_configuration_for_repository_creation_template
    ?kms_key:(kms_key_ : kms_key_for_repository_creation_template option)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({ encryption_type = encryption_type_; kms_key = kms_key_ }
    : encryption_configuration_for_repository_creation_template)

let make_repository_creation_template ?prefix:(prefix_ : prefix option)
    ?description:(description_ : repository_template_description option)
    ?encryption_configuration:
      (encryption_configuration_ : encryption_configuration_for_repository_creation_template option)
    ?resource_tags:(resource_tags_ : tag_list option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?repository_policy:(repository_policy_ : repository_policy_text option)
    ?lifecycle_policy:
      (lifecycle_policy_ : lifecycle_policy_text_for_repository_creation_template option)
    ?applied_for:(applied_for_ : rct_applied_for_list option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?created_at:(created_at_ : date option) ?updated_at:(updated_at_ : date option) () =
  ({
     prefix = prefix_;
     description = description_;
     encryption_configuration = encryption_configuration_;
     resource_tags = resource_tags_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     repository_policy = repository_policy_;
     lifecycle_policy = lifecycle_policy_;
     applied_for = applied_for_;
     custom_role_arn = custom_role_arn_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : repository_creation_template)

let make_update_repository_creation_template_response
    ?registry_id:(registry_id_ : registry_id option)
    ?repository_creation_template:
      (repository_creation_template_ : repository_creation_template option) () =
  ({ registry_id = registry_id_; repository_creation_template = repository_creation_template_ }
    : update_repository_creation_template_response)

let make_update_repository_creation_template_request
    ?description:(description_ : repository_template_description option)
    ?encryption_configuration:
      (encryption_configuration_ : encryption_configuration_for_repository_creation_template option)
    ?resource_tags:(resource_tags_ : tag_list option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?repository_policy:(repository_policy_ : repository_policy_text option)
    ?lifecycle_policy:
      (lifecycle_policy_ : lifecycle_policy_text_for_repository_creation_template option)
    ?applied_for:(applied_for_ : rct_applied_for_list option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option) ~prefix:(prefix_ : prefix) () =
  ({
     prefix = prefix_;
     description = description_;
     encryption_configuration = encryption_configuration_;
     resource_tags = resource_tags_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     repository_policy = repository_policy_;
     lifecycle_policy = lifecycle_policy_;
     applied_for = applied_for_;
     custom_role_arn = custom_role_arn_;
   }
    : update_repository_creation_template_request)

let make_update_pull_through_cache_rule_response
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?registry_id:(registry_id_ : registry_id option)
    ?updated_at:(updated_at_ : updated_timestamp option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     ecr_repository_prefix = ecr_repository_prefix_;
     registry_id = registry_id_;
     updated_at = updated_at_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
     upstream_repository_prefix = upstream_repository_prefix_;
   }
    : update_pull_through_cache_rule_response)

let make_update_pull_through_cache_rule_request ?registry_id:(registry_id_ : registry_id option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({
     registry_id = registry_id_;
     ecr_repository_prefix = ecr_repository_prefix_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
   }
    : update_pull_through_cache_rule_request)

let make_image_identifier ?image_digest:(image_digest_ : image_digest option)
    ?image_tag:(image_tag_ : image_tag option) () =
  ({ image_digest = image_digest_; image_tag = image_tag_ } : image_identifier)

let make_update_image_storage_class_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_id:(image_id_ : image_identifier option)
    ?image_status:(image_status_ : image_status option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_id = image_id_;
     image_status = image_status_;
   }
    : update_image_storage_class_response)

let make_update_image_storage_class_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) ~image_id:(image_id_ : image_identifier)
    ~target_storage_class:(target_storage_class_ : target_storage_class) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_id = image_id_;
     target_storage_class = target_storage_class_;
   }
    : update_image_storage_class_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_start_lifecycle_policy_preview_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?status:(status_ : lifecycle_policy_preview_status option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
     status = status_;
   }
    : start_lifecycle_policy_preview_response)

let make_start_lifecycle_policy_preview_request ?registry_id:(registry_id_ : registry_id option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
   }
    : start_lifecycle_policy_preview_request)

let make_image_scan_status ?status:(status_ : scan_status option)
    ?description:(description_ : scan_status_description option) () =
  ({ status = status_; description = description_ } : image_scan_status)

let make_start_image_scan_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_id:(image_id_ : image_identifier option)
    ?image_scan_status:(image_scan_status_ : image_scan_status option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_id = image_id_;
     image_scan_status = image_scan_status_;
   }
    : start_image_scan_response)

let make_start_image_scan_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) ~image_id:(image_id_ : image_identifier)
    () =
  ({ registry_id = registry_id_; repository_name = repository_name_; image_id = image_id_ }
    : start_image_scan_request)

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

let make_register_pull_time_update_exclusion_response
    ?principal_arn:(principal_arn_ : principal_arn option)
    ?created_at:(created_at_ : creation_timestamp option) () =
  ({ principal_arn = principal_arn_; created_at = created_at_ }
    : register_pull_time_update_exclusion_response)

let make_register_pull_time_update_exclusion_request ~principal_arn:(principal_arn_ : principal_arn)
    () =
  ({ principal_arn = principal_arn_ } : register_pull_time_update_exclusion_request)

let make_signing_repository_filter ~filter:(filter_ : signing_repository_filter_value)
    ~filter_type:(filter_type_ : signing_repository_filter_type) () =
  ({ filter = filter_; filter_type = filter_type_ } : signing_repository_filter)

let make_signing_rule
    ?repository_filters:(repository_filters_ : signing_repository_filter_list option)
    ~signing_profile_arn:(signing_profile_arn_ : signing_profile_arn) () =
  ({ signing_profile_arn = signing_profile_arn_; repository_filters = repository_filters_ }
    : signing_rule)

let make_signing_configuration ~rules:(rules_ : signing_rule_list) () =
  ({ rules = rules_ } : signing_configuration)

let make_put_signing_configuration_response
    ?signing_configuration:(signing_configuration_ : signing_configuration option) () =
  ({ signing_configuration = signing_configuration_ } : put_signing_configuration_response)

let make_put_signing_configuration_request
    ~signing_configuration:(signing_configuration_ : signing_configuration) () =
  ({ signing_configuration = signing_configuration_ } : put_signing_configuration_request)

let make_repository_filter ~filter:(filter_ : repository_filter_value)
    ~filter_type:(filter_type_ : repository_filter_type) () =
  ({ filter = filter_; filter_type = filter_type_ } : repository_filter)

let make_replication_destination ~region:(region_ : region)
    ~registry_id:(registry_id_ : registry_id) () =
  ({ region = region_; registry_id = registry_id_ } : replication_destination)

let make_replication_rule ?repository_filters:(repository_filters_ : repository_filter_list option)
    ~destinations:(destinations_ : replication_destination_list) () =
  ({ destinations = destinations_; repository_filters = repository_filters_ } : replication_rule)

let make_replication_configuration ~rules:(rules_ : replication_rule_list) () =
  ({ rules = rules_ } : replication_configuration)

let make_put_replication_configuration_response
    ?replication_configuration:(replication_configuration_ : replication_configuration option) () =
  ({ replication_configuration = replication_configuration_ }
    : put_replication_configuration_response)

let make_put_replication_configuration_request
    ~replication_configuration:(replication_configuration_ : replication_configuration) () =
  ({ replication_configuration = replication_configuration_ }
    : put_replication_configuration_request)

let make_scanning_repository_filter ~filter:(filter_ : scanning_repository_filter_value)
    ~filter_type:(filter_type_ : scanning_repository_filter_type) () =
  ({ filter = filter_; filter_type = filter_type_ } : scanning_repository_filter)

let make_registry_scanning_rule ~scan_frequency:(scan_frequency_ : scan_frequency)
    ~repository_filters:(repository_filters_ : scanning_repository_filter_list) () =
  ({ scan_frequency = scan_frequency_; repository_filters = repository_filters_ }
    : registry_scanning_rule)

let make_registry_scanning_configuration ?scan_type:(scan_type_ : scan_type option)
    ?rules:(rules_ : registry_scanning_rule_list option) () =
  ({ scan_type = scan_type_; rules = rules_ } : registry_scanning_configuration)

let make_put_registry_scanning_configuration_response
    ?registry_scanning_configuration:
      (registry_scanning_configuration_ : registry_scanning_configuration option) () =
  ({ registry_scanning_configuration = registry_scanning_configuration_ }
    : put_registry_scanning_configuration_response)

let make_put_registry_scanning_configuration_request ?scan_type:(scan_type_ : scan_type option)
    ?rules:(rules_ : registry_scanning_rule_list option) () =
  ({ scan_type = scan_type_; rules = rules_ } : put_registry_scanning_configuration_request)

let make_put_registry_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?policy_text:(policy_text_ : registry_policy_text option) () =
  ({ registry_id = registry_id_; policy_text = policy_text_ } : put_registry_policy_response)

let make_put_registry_policy_request ~policy_text:(policy_text_ : registry_policy_text) () =
  ({ policy_text = policy_text_ } : put_registry_policy_request)

let make_put_lifecycle_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
   }
    : put_lifecycle_policy_response)

let make_put_lifecycle_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
   }
    : put_lifecycle_policy_request)

let make_put_image_tag_mutability_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
   }
    : put_image_tag_mutability_response)

let make_put_image_tag_mutability_request ?registry_id:(registry_id_ : registry_id option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ~repository_name:(repository_name_ : repository_name)
    ~image_tag_mutability:(image_tag_mutability_ : image_tag_mutability) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
   }
    : put_image_tag_mutability_request)

let make_image_scanning_configuration ?scan_on_push:(scan_on_push_ : scan_on_push_flag option) () =
  ({ scan_on_push = scan_on_push_ } : image_scanning_configuration)

let make_put_image_scanning_configuration_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_scanning_configuration:
      (image_scanning_configuration_ : image_scanning_configuration option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_scanning_configuration = image_scanning_configuration_;
   }
    : put_image_scanning_configuration_response)

let make_put_image_scanning_configuration_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~image_scanning_configuration:(image_scanning_configuration_ : image_scanning_configuration) ()
    =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_scanning_configuration = image_scanning_configuration_;
   }
    : put_image_scanning_configuration_request)

let make_image ?registry_id:(registry_id_ : registry_id option)
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

let make_put_image_response ?image:(image_ : image option) () =
  ({ image = image_ } : put_image_response)

let make_put_image_request ?registry_id:(registry_id_ : registry_id option)
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

let make_put_account_setting_response ?name:(name_ : account_setting_name option)
    ?value:(value_ : account_setting_value option) () =
  ({ name = name_; value = value_ } : put_account_setting_response)

let make_put_account_setting_request ~name:(name_ : account_setting_name)
    ~value:(value_ : account_setting_value) () =
  ({ name = name_; value = value_ } : put_account_setting_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_pull_time_update_exclusions_response
    ?pull_time_update_exclusions:
      (pull_time_update_exclusions_ : pull_time_update_exclusion_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pull_time_update_exclusions = pull_time_update_exclusions_; next_token = next_token_ }
    : list_pull_time_update_exclusions_response)

let make_list_pull_time_update_exclusions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_pull_time_update_exclusions_request)

let make_list_images_response ?image_ids:(image_ids_ : image_identifier_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ image_ids = image_ids_; next_token = next_token_ } : list_images_response)

let make_list_images_filter ?tag_status:(tag_status_ : tag_status option)
    ?image_status:(image_status_ : image_status_filter option) () =
  ({ tag_status = tag_status_; image_status = image_status_ } : list_images_filter)

let make_list_images_request ?registry_id:(registry_id_ : registry_id option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filter:(filter_ : list_images_filter option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
   }
    : list_images_request)

let make_image_referrer ?artifact_type:(artifact_type_ : artifact_type option)
    ?annotations:(annotations_ : annotations option)
    ?artifact_status:(artifact_status_ : artifact_status option) ~digest:(digest_ : image_digest)
    ~media_type:(media_type_ : media_type) ~size:(size_ : image_size_in_bytes) () =
  ({
     digest = digest_;
     media_type = media_type_;
     artifact_type = artifact_type_;
     size = size_;
     annotations = annotations_;
     artifact_status = artifact_status_;
   }
    : image_referrer)

let make_list_image_referrers_response ?referrers:(referrers_ : image_referrer_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ referrers = referrers_; next_token = next_token_ } : list_image_referrers_response)

let make_list_image_referrers_filter ?artifact_types:(artifact_types_ : artifact_type_list option)
    ?artifact_status:(artifact_status_ : artifact_status_filter option) () =
  ({ artifact_types = artifact_types_; artifact_status = artifact_status_ }
    : list_image_referrers_filter)

let make_subject_identifier ~image_digest:(image_digest_ : image_digest) () =
  ({ image_digest = image_digest_ } : subject_identifier)

let make_list_image_referrers_request ?registry_id:(registry_id_ : registry_id option)
    ?filter:(filter_ : list_image_referrers_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : fifty_max_results option)
    ~repository_name:(repository_name_ : repository_name)
    ~subject_id:(subject_id_ : subject_identifier) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     subject_id = subject_id_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_image_referrers_request)

let make_initiate_layer_upload_response ?upload_id:(upload_id_ : upload_id option)
    ?part_size:(part_size_ : part_size option) () =
  ({ upload_id = upload_id_; part_size = part_size_ } : initiate_layer_upload_response)

let make_initiate_layer_upload_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : initiate_layer_upload_request)

let make_get_signing_configuration_response ?registry_id:(registry_id_ : registry_id option)
    ?signing_configuration:(signing_configuration_ : signing_configuration option) () =
  ({ registry_id = registry_id_; signing_configuration = signing_configuration_ }
    : get_signing_configuration_response)

let make_get_signing_configuration_request () = (() : unit)

let make_get_repository_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?policy_text:(policy_text_ : repository_policy_text option) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; policy_text = policy_text_ }
    : get_repository_policy_response)

let make_get_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : get_repository_policy_request)

let make_get_registry_scanning_configuration_response
    ?registry_id:(registry_id_ : registry_id option)
    ?scanning_configuration:(scanning_configuration_ : registry_scanning_configuration option) () =
  ({ registry_id = registry_id_; scanning_configuration = scanning_configuration_ }
    : get_registry_scanning_configuration_response)

let make_get_registry_scanning_configuration_request () = (() : unit)

let make_get_registry_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?policy_text:(policy_text_ : registry_policy_text option) () =
  ({ registry_id = registry_id_; policy_text = policy_text_ } : get_registry_policy_response)

let make_get_registry_policy_request () = (() : unit)

let make_transitioning_image_total_count
    ?target_storage_class:(target_storage_class_ : lifecycle_policy_target_storage_class option)
    ?image_total_count:(image_total_count_ : image_count option) () =
  ({ target_storage_class = target_storage_class_; image_total_count = image_total_count_ }
    : transitioning_image_total_count)

let make_lifecycle_policy_preview_summary
    ?expiring_image_total_count:(expiring_image_total_count_ : image_count option)
    ?transitioning_image_total_counts:
      (transitioning_image_total_counts_ : transitioning_image_total_counts option) () =
  ({
     expiring_image_total_count = expiring_image_total_count_;
     transitioning_image_total_counts = transitioning_image_total_counts_;
   }
    : lifecycle_policy_preview_summary)

let make_lifecycle_policy_rule_action ?type_:(type__ : image_action_type option)
    ?target_storage_class:(target_storage_class_ : lifecycle_policy_target_storage_class option) ()
    =
  ({ type_ = type__; target_storage_class = target_storage_class_ } : lifecycle_policy_rule_action)

let make_get_lifecycle_policy_preview_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?status:(status_ : lifecycle_policy_preview_status option)
    ?next_token:(next_token_ : next_token option)
    ?preview_results:(preview_results_ : lifecycle_policy_preview_result_list option)
    ?summary:(summary_ : lifecycle_policy_preview_summary option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
     status = status_;
     next_token = next_token_;
     preview_results = preview_results_;
     summary = summary_;
   }
    : get_lifecycle_policy_preview_response)

let make_lifecycle_policy_preview_filter ?tag_status:(tag_status_ : tag_status option) () =
  ({ tag_status = tag_status_ } : lifecycle_policy_preview_filter)

let make_get_lifecycle_policy_preview_request ?registry_id:(registry_id_ : registry_id option)
    ?image_ids:(image_ids_ : image_identifier_list option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : lifecycle_preview_max_results option)
    ?filter:(filter_ : lifecycle_policy_preview_filter option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_ids = image_ids_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
   }
    : get_lifecycle_policy_preview_request)

let make_get_lifecycle_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?last_evaluated_at:(last_evaluated_at_ : evaluation_timestamp option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
     last_evaluated_at = last_evaluated_at_;
   }
    : get_lifecycle_policy_response)

let make_get_lifecycle_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : get_lifecycle_policy_request)

let make_get_download_url_for_layer_response ?download_url:(download_url_ : url option)
    ?layer_digest:(layer_digest_ : layer_digest option) () =
  ({ download_url = download_url_; layer_digest = layer_digest_ }
    : get_download_url_for_layer_response)

let make_get_download_url_for_layer_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~layer_digest:(layer_digest_ : layer_digest) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; layer_digest = layer_digest_ }
    : get_download_url_for_layer_request)

let make_authorization_data ?authorization_token:(authorization_token_ : base64 option)
    ?expires_at:(expires_at_ : expiration_timestamp option)
    ?proxy_endpoint:(proxy_endpoint_ : proxy_endpoint option) () =
  ({
     authorization_token = authorization_token_;
     expires_at = expires_at_;
     proxy_endpoint = proxy_endpoint_;
   }
    : authorization_data)

let make_get_authorization_token_response
    ?authorization_data:(authorization_data_ : authorization_data_list option) () =
  ({ authorization_data = authorization_data_ } : get_authorization_token_response)

let make_get_authorization_token_request
    ?registry_ids:(registry_ids_ : get_authorization_token_registry_id_list option) () =
  ({ registry_ids = registry_ids_ } : get_authorization_token_request)

let make_get_account_setting_response ?name:(name_ : account_setting_name option)
    ?value:(value_ : account_setting_name option) () =
  ({ name = name_; value = value_ } : get_account_setting_response)

let make_get_account_setting_request ~name:(name_ : account_setting_name) () =
  ({ name = name_ } : get_account_setting_request)

let make_describe_repository_creation_templates_response
    ?registry_id:(registry_id_ : registry_id option)
    ?repository_creation_templates:
      (repository_creation_templates_ : repository_creation_template_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     registry_id = registry_id_;
     repository_creation_templates = repository_creation_templates_;
     next_token = next_token_;
   }
    : describe_repository_creation_templates_response)

let make_describe_repository_creation_templates_request ?prefixes:(prefixes_ : prefix_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ prefixes = prefixes_; next_token = next_token_; max_results = max_results_ }
    : describe_repository_creation_templates_request)

let make_encryption_configuration ?kms_key:(kms_key_ : kms_key option)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({ encryption_type = encryption_type_; kms_key = kms_key_ } : encryption_configuration)

let make_repository ?repository_arn:(repository_arn_ : arn option)
    ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?repository_uri:(repository_uri_ : url option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_scanning_configuration:
      (image_scanning_configuration_ : image_scanning_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option) () =
  ({
     repository_arn = repository_arn_;
     registry_id = registry_id_;
     repository_name = repository_name_;
     repository_uri = repository_uri_;
     created_at = created_at_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_scanning_configuration = image_scanning_configuration_;
     encryption_configuration = encryption_configuration_;
   }
    : repository)

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

let make_describe_registry_response ?registry_id:(registry_id_ : registry_id option)
    ?replication_configuration:(replication_configuration_ : replication_configuration option) () =
  ({ registry_id = registry_id_; replication_configuration = replication_configuration_ }
    : describe_registry_response)

let make_describe_registry_request () = (() : unit)

let make_pull_through_cache_rule
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?registry_id:(registry_id_ : registry_id option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?upstream_registry:(upstream_registry_ : upstream_registry option)
    ?updated_at:(updated_at_ : updated_timestamp option) () =
  ({
     ecr_repository_prefix = ecr_repository_prefix_;
     upstream_registry_url = upstream_registry_url_;
     created_at = created_at_;
     registry_id = registry_id_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
     upstream_repository_prefix = upstream_repository_prefix_;
     upstream_registry = upstream_registry_;
     updated_at = updated_at_;
   }
    : pull_through_cache_rule)

let make_describe_pull_through_cache_rules_response
    ?pull_through_cache_rules:(pull_through_cache_rules_ : pull_through_cache_rule_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pull_through_cache_rules = pull_through_cache_rules_; next_token = next_token_ }
    : describe_pull_through_cache_rules_response)

let make_describe_pull_through_cache_rules_request ?registry_id:(registry_id_ : registry_id option)
    ?ecr_repository_prefixes:
      (ecr_repository_prefixes_ : pull_through_cache_rule_repository_prefix_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     registry_id = registry_id_;
     ecr_repository_prefixes = ecr_repository_prefixes_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_pull_through_cache_rules_request)

let make_image_signing_status
    ?signing_profile_arn:(signing_profile_arn_ : signing_profile_arn option)
    ?failure_code:(failure_code_ : signing_status_failure_code option)
    ?failure_reason:(failure_reason_ : signing_status_failure_reason option)
    ?status:(status_ : signing_status option) () =
  ({
     signing_profile_arn = signing_profile_arn_;
     failure_code = failure_code_;
     failure_reason = failure_reason_;
     status = status_;
   }
    : image_signing_status)

let make_describe_image_signing_status_response
    ?repository_name:(repository_name_ : repository_name option)
    ?image_id:(image_id_ : image_identifier option) ?registry_id:(registry_id_ : registry_id option)
    ?signing_statuses:(signing_statuses_ : image_signing_status_list option) () =
  ({
     repository_name = repository_name_;
     image_id = image_id_;
     registry_id = registry_id_;
     signing_statuses = signing_statuses_;
   }
    : describe_image_signing_status_response)

let make_describe_image_signing_status_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) ~image_id:(image_id_ : image_identifier)
    () =
  ({ repository_name = repository_name_; image_id = image_id_; registry_id = registry_id_ }
    : describe_image_signing_status_request)

let make_cvss_score_adjustment ?metric:(metric_ : metric option) ?reason:(reason_ : reason option)
    () =
  ({ metric = metric_; reason = reason_ } : cvss_score_adjustment)

let make_cvss_score_details ?adjustments:(adjustments_ : cvss_score_adjustment_list option)
    ?score:(score_ : score option) ?score_source:(score_source_ : source option)
    ?scoring_vector:(scoring_vector_ : scoring_vector option) ?version:(version_ : version option)
    () =
  ({
     adjustments = adjustments_;
     score = score_;
     score_source = score_source_;
     scoring_vector = scoring_vector_;
     version = version_;
   }
    : cvss_score_details)

let make_score_details ?cvss:(cvss_ : cvss_score_details option) () =
  ({ cvss = cvss_ } : score_details)

let make_aws_ecr_container_image_details ?architecture:(architecture_ : arch option)
    ?author:(author_ : author option) ?image_hash:(image_hash_ : image_digest option)
    ?image_tags:(image_tags_ : image_tags_list option) ?platform:(platform_ : platform option)
    ?pushed_at:(pushed_at_ : date option) ?last_in_use_at:(last_in_use_at_ : date option)
    ?in_use_count:(in_use_count_ : in_use_count option) ?registry:(registry_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     architecture = architecture_;
     author = author_;
     image_hash = image_hash_;
     image_tags = image_tags_;
     platform = platform_;
     pushed_at = pushed_at_;
     last_in_use_at = last_in_use_at_;
     in_use_count = in_use_count_;
     registry = registry_;
     repository_name = repository_name_;
   }
    : aws_ecr_container_image_details)

let make_resource_details
    ?aws_ecr_container_image:(aws_ecr_container_image_ : aws_ecr_container_image_details option) ()
    =
  ({ aws_ecr_container_image = aws_ecr_container_image_ } : resource_details)

let make_resource ?details:(details_ : resource_details option) ?id:(id_ : resource_id option)
    ?tags:(tags_ : tags option) ?type_:(type__ : type_ option) () =
  ({ details = details_; id = id_; tags = tags_; type_ = type__ } : resource)

let make_recommendation ?url:(url_ : url option) ?text:(text_ : recommendation_text option) () =
  ({ url = url_; text = text_ } : recommendation)

let make_remediation ?recommendation:(recommendation_ : recommendation option) () =
  ({ recommendation = recommendation_ } : remediation)

let make_vulnerable_package ?arch:(arch_ : arch option) ?epoch:(epoch_ : epoch option)
    ?file_path:(file_path_ : file_path option) ?name:(name_ : vulnerable_package_name option)
    ?package_manager:(package_manager_ : package_manager option)
    ?release:(release_ : release option)
    ?source_layer_hash:(source_layer_hash_ : source_layer_hash option)
    ?version:(version_ : version option)
    ?fixed_in_version:(fixed_in_version_ : fixed_in_version option) () =
  ({
     arch = arch_;
     epoch = epoch_;
     file_path = file_path_;
     name = name_;
     package_manager = package_manager_;
     release = release_;
     source_layer_hash = source_layer_hash_;
     version = version_;
     fixed_in_version = fixed_in_version_;
   }
    : vulnerable_package)

let make_cvss_score ?base_score:(base_score_ : base_score option)
    ?scoring_vector:(scoring_vector_ : scoring_vector option) ?source:(source_ : source option)
    ?version:(version_ : version option) () =
  ({
     base_score = base_score_;
     scoring_vector = scoring_vector_;
     source = source_;
     version = version_;
   }
    : cvss_score)

let make_package_vulnerability_details ?cvss:(cvss_ : cvss_score_list option)
    ?reference_urls:(reference_urls_ : reference_urls_list option)
    ?related_vulnerabilities:(related_vulnerabilities_ : related_vulnerabilities_list option)
    ?source:(source_ : source option) ?source_url:(source_url_ : url option)
    ?vendor_created_at:(vendor_created_at_ : date option)
    ?vendor_severity:(vendor_severity_ : severity option)
    ?vendor_updated_at:(vendor_updated_at_ : date option)
    ?vulnerability_id:(vulnerability_id_ : vulnerability_id option)
    ?vulnerable_packages:(vulnerable_packages_ : vulnerable_packages_list option) () =
  ({
     cvss = cvss_;
     reference_urls = reference_urls_;
     related_vulnerabilities = related_vulnerabilities_;
     source = source_;
     source_url = source_url_;
     vendor_created_at = vendor_created_at_;
     vendor_severity = vendor_severity_;
     vendor_updated_at = vendor_updated_at_;
     vulnerability_id = vulnerability_id_;
     vulnerable_packages = vulnerable_packages_;
   }
    : package_vulnerability_details)

let make_enhanced_image_scan_finding ?aws_account_id:(aws_account_id_ : registry_id option)
    ?description:(description_ : finding_description option)
    ?finding_arn:(finding_arn_ : finding_arn option)
    ?first_observed_at:(first_observed_at_ : date option)
    ?last_observed_at:(last_observed_at_ : date option)
    ?package_vulnerability_details:
      (package_vulnerability_details_ : package_vulnerability_details option)
    ?remediation:(remediation_ : remediation option) ?resources:(resources_ : resource_list option)
    ?score:(score_ : score option) ?score_details:(score_details_ : score_details option)
    ?severity:(severity_ : severity option) ?status:(status_ : status option)
    ?title:(title_ : title option) ?type_:(type__ : type_ option)
    ?updated_at:(updated_at_ : date option) ?fix_available:(fix_available_ : fix_available option)
    ?exploit_available:(exploit_available_ : exploit_available option) () =
  ({
     aws_account_id = aws_account_id_;
     description = description_;
     finding_arn = finding_arn_;
     first_observed_at = first_observed_at_;
     last_observed_at = last_observed_at_;
     package_vulnerability_details = package_vulnerability_details_;
     remediation = remediation_;
     resources = resources_;
     score = score_;
     score_details = score_details_;
     severity = severity_;
     status = status_;
     title = title_;
     type_ = type__;
     updated_at = updated_at_;
     fix_available = fix_available_;
     exploit_available = exploit_available_;
   }
    : enhanced_image_scan_finding)

let make_attribute ?value:(value_ : attribute_value option) ~key:(key_ : attribute_key) () =
  ({ key = key_; value = value_ } : attribute)

let make_image_scan_finding ?name:(name_ : finding_name option)
    ?description:(description_ : finding_description option) ?uri:(uri_ : url option)
    ?severity:(severity_ : finding_severity option)
    ?attributes:(attributes_ : attribute_list option) () =
  ({
     name = name_;
     description = description_;
     uri = uri_;
     severity = severity_;
     attributes = attributes_;
   }
    : image_scan_finding)

let make_image_scan_findings
    ?image_scan_completed_at:(image_scan_completed_at_ : scan_timestamp option)
    ?vulnerability_source_updated_at:
      (vulnerability_source_updated_at_ : vulnerability_source_update_timestamp option)
    ?finding_severity_counts:(finding_severity_counts_ : finding_severity_counts option)
    ?findings:(findings_ : image_scan_finding_list option)
    ?enhanced_findings:(enhanced_findings_ : enhanced_image_scan_finding_list option) () =
  ({
     image_scan_completed_at = image_scan_completed_at_;
     vulnerability_source_updated_at = vulnerability_source_updated_at_;
     finding_severity_counts = finding_severity_counts_;
     findings = findings_;
     enhanced_findings = enhanced_findings_;
   }
    : image_scan_findings)

let make_describe_image_scan_findings_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_id:(image_id_ : image_identifier option)
    ?image_scan_status:(image_scan_status_ : image_scan_status option)
    ?image_scan_findings:(image_scan_findings_ : image_scan_findings option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_id = image_id_;
     image_scan_status = image_scan_status_;
     image_scan_findings = image_scan_findings_;
     next_token = next_token_;
   }
    : describe_image_scan_findings_response)

let make_describe_image_scan_findings_request ?registry_id:(registry_id_ : registry_id option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~repository_name:(repository_name_ : repository_name) ~image_id:(image_id_ : image_identifier)
    () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_id = image_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_image_scan_findings_request)

let make_image_scan_findings_summary
    ?image_scan_completed_at:(image_scan_completed_at_ : scan_timestamp option)
    ?vulnerability_source_updated_at:
      (vulnerability_source_updated_at_ : vulnerability_source_update_timestamp option)
    ?finding_severity_counts:(finding_severity_counts_ : finding_severity_counts option) () =
  ({
     image_scan_completed_at = image_scan_completed_at_;
     vulnerability_source_updated_at = vulnerability_source_updated_at_;
     finding_severity_counts = finding_severity_counts_;
   }
    : image_scan_findings_summary)

let make_image_detail ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?image_digest:(image_digest_ : image_digest option)
    ?image_tags:(image_tags_ : image_tag_list option)
    ?image_size_in_bytes:(image_size_in_bytes_ : image_size_in_bytes option)
    ?image_pushed_at:(image_pushed_at_ : push_timestamp option)
    ?image_scan_status:(image_scan_status_ : image_scan_status option)
    ?image_scan_findings_summary:(image_scan_findings_summary_ : image_scan_findings_summary option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?artifact_media_type:(artifact_media_type_ : media_type option)
    ?last_recorded_pull_time:(last_recorded_pull_time_ : recorded_pull_timestamp option)
    ?subject_manifest_digest:(subject_manifest_digest_ : image_digest option)
    ?image_status:(image_status_ : image_status option)
    ?last_archived_at:(last_archived_at_ : last_archived_at_timestamp option)
    ?last_activated_at:(last_activated_at_ : last_activated_at_timestamp option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_digest = image_digest_;
     image_tags = image_tags_;
     image_size_in_bytes = image_size_in_bytes_;
     image_pushed_at = image_pushed_at_;
     image_scan_status = image_scan_status_;
     image_scan_findings_summary = image_scan_findings_summary_;
     image_manifest_media_type = image_manifest_media_type_;
     artifact_media_type = artifact_media_type_;
     last_recorded_pull_time = last_recorded_pull_time_;
     subject_manifest_digest = subject_manifest_digest_;
     image_status = image_status_;
     last_archived_at = last_archived_at_;
     last_activated_at = last_activated_at_;
   }
    : image_detail)

let make_describe_images_response ?image_details:(image_details_ : image_detail_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ image_details = image_details_; next_token = next_token_ } : describe_images_response)

let make_describe_images_filter ?tag_status:(tag_status_ : tag_status option)
    ?image_status:(image_status_ : image_status_filter option) () =
  ({ tag_status = tag_status_; image_status = image_status_ } : describe_images_filter)

let make_describe_images_request ?registry_id:(registry_id_ : registry_id option)
    ?image_ids:(image_ids_ : image_identifier_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filter:(filter_ : describe_images_filter option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_ids = image_ids_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
   }
    : describe_images_request)

let make_image_replication_status ?region:(region_ : region option)
    ?registry_id:(registry_id_ : registry_id option) ?status:(status_ : replication_status option)
    ?failure_code:(failure_code_ : replication_error option) () =
  ({ region = region_; registry_id = registry_id_; status = status_; failure_code = failure_code_ }
    : image_replication_status)

let make_describe_image_replication_status_response
    ?repository_name:(repository_name_ : repository_name option)
    ?image_id:(image_id_ : image_identifier option)
    ?replication_statuses:(replication_statuses_ : image_replication_status_list option) () =
  ({
     repository_name = repository_name_;
     image_id = image_id_;
     replication_statuses = replication_statuses_;
   }
    : describe_image_replication_status_response)

let make_describe_image_replication_status_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) ~image_id:(image_id_ : image_identifier)
    () =
  ({ repository_name = repository_name_; image_id = image_id_; registry_id = registry_id_ }
    : describe_image_replication_status_request)

let make_deregister_pull_time_update_exclusion_response
    ?principal_arn:(principal_arn_ : principal_arn option) () =
  ({ principal_arn = principal_arn_ } : deregister_pull_time_update_exclusion_response)

let make_deregister_pull_time_update_exclusion_request
    ~principal_arn:(principal_arn_ : principal_arn) () =
  ({ principal_arn = principal_arn_ } : deregister_pull_time_update_exclusion_request)

let make_delete_signing_configuration_response ?registry_id:(registry_id_ : registry_id option)
    ?signing_configuration:(signing_configuration_ : signing_configuration option) () =
  ({ registry_id = registry_id_; signing_configuration = signing_configuration_ }
    : delete_signing_configuration_response)

let make_delete_signing_configuration_request () = (() : unit)

let make_delete_repository_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?policy_text:(policy_text_ : repository_policy_text option) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; policy_text = policy_text_ }
    : delete_repository_policy_response)

let make_delete_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : delete_repository_policy_request)

let make_delete_repository_creation_template_response
    ?registry_id:(registry_id_ : registry_id option)
    ?repository_creation_template:
      (repository_creation_template_ : repository_creation_template option) () =
  ({ registry_id = registry_id_; repository_creation_template = repository_creation_template_ }
    : delete_repository_creation_template_response)

let make_delete_repository_creation_template_request ~prefix:(prefix_ : prefix) () =
  ({ prefix = prefix_ } : delete_repository_creation_template_request)

let make_delete_repository_response ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : delete_repository_response)

let make_delete_repository_request ?registry_id:(registry_id_ : registry_id option)
    ?force:(force_ : force_flag option) ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; force = force_ }
    : delete_repository_request)

let make_delete_registry_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?policy_text:(policy_text_ : registry_policy_text option) () =
  ({ registry_id = registry_id_; policy_text = policy_text_ } : delete_registry_policy_response)

let make_delete_registry_policy_request () = (() : unit)

let make_delete_pull_through_cache_rule_response
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?registry_id:(registry_id_ : registry_id option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     ecr_repository_prefix = ecr_repository_prefix_;
     upstream_registry_url = upstream_registry_url_;
     created_at = created_at_;
     registry_id = registry_id_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
     upstream_repository_prefix = upstream_repository_prefix_;
   }
    : delete_pull_through_cache_rule_response)

let make_delete_pull_through_cache_rule_request ?registry_id:(registry_id_ : registry_id option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({ ecr_repository_prefix = ecr_repository_prefix_; registry_id = registry_id_ }
    : delete_pull_through_cache_rule_request)

let make_delete_lifecycle_policy_response ?registry_id:(registry_id_ : registry_id option)
    ?repository_name:(repository_name_ : repository_name option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?last_evaluated_at:(last_evaluated_at_ : evaluation_timestamp option) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     lifecycle_policy_text = lifecycle_policy_text_;
     last_evaluated_at = last_evaluated_at_;
   }
    : delete_lifecycle_policy_response)

let make_delete_lifecycle_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ registry_id = registry_id_; repository_name = repository_name_ }
    : delete_lifecycle_policy_request)

let make_create_repository_creation_template_response
    ?registry_id:(registry_id_ : registry_id option)
    ?repository_creation_template:
      (repository_creation_template_ : repository_creation_template option) () =
  ({ registry_id = registry_id_; repository_creation_template = repository_creation_template_ }
    : create_repository_creation_template_response)

let make_create_repository_creation_template_request
    ?description:(description_ : repository_template_description option)
    ?encryption_configuration:
      (encryption_configuration_ : encryption_configuration_for_repository_creation_template option)
    ?resource_tags:(resource_tags_ : tag_list option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?repository_policy:(repository_policy_ : repository_policy_text option)
    ?lifecycle_policy:
      (lifecycle_policy_ : lifecycle_policy_text_for_repository_creation_template option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option) ~prefix:(prefix_ : prefix)
    ~applied_for:(applied_for_ : rct_applied_for_list) () =
  ({
     prefix = prefix_;
     description = description_;
     encryption_configuration = encryption_configuration_;
     resource_tags = resource_tags_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     repository_policy = repository_policy_;
     lifecycle_policy = lifecycle_policy_;
     applied_for = applied_for_;
     custom_role_arn = custom_role_arn_;
   }
    : create_repository_creation_template_request)

let make_create_repository_response ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : create_repository_response)

let make_create_repository_request ?registry_id:(registry_id_ : registry_id option)
    ?tags:(tags_ : tag_list option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_scanning_configuration:
      (image_scanning_configuration_ : image_scanning_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     tags = tags_;
     image_tag_mutability = image_tag_mutability_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_scanning_configuration = image_scanning_configuration_;
     encryption_configuration = encryption_configuration_;
   }
    : create_repository_request)

let make_create_pull_through_cache_rule_response
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?registry_id:(registry_id_ : registry_id option)
    ?upstream_registry:(upstream_registry_ : upstream_registry option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     ecr_repository_prefix = ecr_repository_prefix_;
     upstream_registry_url = upstream_registry_url_;
     created_at = created_at_;
     registry_id = registry_id_;
     upstream_registry = upstream_registry_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
     upstream_repository_prefix = upstream_repository_prefix_;
   }
    : create_pull_through_cache_rule_response)

let make_create_pull_through_cache_rule_request ?registry_id:(registry_id_ : registry_id option)
    ?upstream_registry:(upstream_registry_ : upstream_registry option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix)
    ~upstream_registry_url:(upstream_registry_url_ : url) () =
  ({
     ecr_repository_prefix = ecr_repository_prefix_;
     upstream_registry_url = upstream_registry_url_;
     registry_id = registry_id_;
     upstream_registry = upstream_registry_;
     credential_arn = credential_arn_;
     custom_role_arn = custom_role_arn_;
     upstream_repository_prefix = upstream_repository_prefix_;
   }
    : create_pull_through_cache_rule_request)

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

let make_complete_layer_upload_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) ~upload_id:(upload_id_ : upload_id)
    ~layer_digests:(layer_digests_ : layer_digest_list) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     upload_id = upload_id_;
     layer_digests = layer_digests_;
   }
    : complete_layer_upload_request)

let make_repository_scanning_configuration_failure
    ?repository_name:(repository_name_ : repository_name option)
    ?failure_code:(failure_code_ : scanning_configuration_failure_code option)
    ?failure_reason:(failure_reason_ : scanning_configuration_failure_reason option) () =
  ({
     repository_name = repository_name_;
     failure_code = failure_code_;
     failure_reason = failure_reason_;
   }
    : repository_scanning_configuration_failure)

let make_repository_scanning_configuration ?repository_arn:(repository_arn_ : arn option)
    ?repository_name:(repository_name_ : repository_name option)
    ?scan_on_push:(scan_on_push_ : scan_on_push_flag option)
    ?scan_frequency:(scan_frequency_ : scan_frequency option)
    ?applied_scan_filters:(applied_scan_filters_ : scanning_repository_filter_list option) () =
  ({
     repository_arn = repository_arn_;
     repository_name = repository_name_;
     scan_on_push = scan_on_push_;
     scan_frequency = scan_frequency_;
     applied_scan_filters = applied_scan_filters_;
   }
    : repository_scanning_configuration)

let make_batch_get_repository_scanning_configuration_response
    ?scanning_configurations:
      (scanning_configurations_ : repository_scanning_configuration_list option)
    ?failures:(failures_ : repository_scanning_configuration_failure_list option) () =
  ({ scanning_configurations = scanning_configurations_; failures = failures_ }
    : batch_get_repository_scanning_configuration_response)

let make_batch_get_repository_scanning_configuration_request
    ~repository_names:(repository_names_ : scanning_configuration_repository_name_list) () =
  ({ repository_names = repository_names_ } : batch_get_repository_scanning_configuration_request)

let make_image_failure ?image_id:(image_id_ : image_identifier option)
    ?failure_code:(failure_code_ : image_failure_code option)
    ?failure_reason:(failure_reason_ : image_failure_reason option) () =
  ({ image_id = image_id_; failure_code = failure_code_; failure_reason = failure_reason_ }
    : image_failure)

let make_batch_get_image_response ?images:(images_ : image_list option)
    ?failures:(failures_ : image_failure_list option) () =
  ({ images = images_; failures = failures_ } : batch_get_image_response)

let make_batch_get_image_request ?registry_id:(registry_id_ : registry_id option)
    ?accepted_media_types:(accepted_media_types_ : media_type_list option)
    ~repository_name:(repository_name_ : repository_name)
    ~image_ids:(image_ids_ : image_identifier_list) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     image_ids = image_ids_;
     accepted_media_types = accepted_media_types_;
   }
    : batch_get_image_request)

let make_batch_delete_image_response ?image_ids:(image_ids_ : image_identifier_list option)
    ?failures:(failures_ : image_failure_list option) () =
  ({ image_ids = image_ids_; failures = failures_ } : batch_delete_image_response)

let make_batch_delete_image_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~image_ids:(image_ids_ : image_identifier_list) () =
  ({ registry_id = registry_id_; repository_name = repository_name_; image_ids = image_ids_ }
    : batch_delete_image_request)

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

let make_batch_check_layer_availability_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name)
    ~layer_digests:(layer_digests_ : batched_operation_layer_digest_list) () =
  ({
     registry_id = registry_id_;
     repository_name = repository_name_;
     layer_digests = layer_digests_;
   }
    : batch_check_layer_availability_request)
