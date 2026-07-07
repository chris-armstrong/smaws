open Types

let make_vulnerable_package ?fixed_in_version:(fixed_in_version_ : fixed_in_version option)
    ?version:(version_ : version option)
    ?source_layer_hash:(source_layer_hash_ : source_layer_hash option)
    ?release:(release_ : release option)
    ?package_manager:(package_manager_ : package_manager option)
    ?name:(name_ : vulnerable_package_name option) ?file_path:(file_path_ : file_path option)
    ?epoch:(epoch_ : epoch option) ?arch:(arch_ : arch option) () =
  ({
     fixed_in_version = fixed_in_version_;
     version = version_;
     source_layer_hash = source_layer_hash_;
     release = release_;
     package_manager = package_manager_;
     name = name_;
     file_path = file_path_;
     epoch = epoch_;
     arch = arch_;
   }
    : vulnerable_package)

let make_validate_pull_through_cache_rule_response ?failure:(failure_ : ptc_validate_failure option)
    ?is_valid:(is_valid_ : is_ptc_rule_valid option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?registry_id:(registry_id_ : registry_id option)
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     failure = failure_;
     is_valid = is_valid_;
     upstream_repository_prefix = upstream_repository_prefix_;
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     upstream_registry_url = upstream_registry_url_;
     registry_id = registry_id_;
     ecr_repository_prefix = ecr_repository_prefix_;
   }
    : validate_pull_through_cache_rule_response)

let make_validate_pull_through_cache_rule_request ?registry_id:(registry_id_ : registry_id option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({ registry_id = registry_id_; ecr_repository_prefix = ecr_repository_prefix_ }
    : validate_pull_through_cache_rule_request)

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

let make_upload_layer_part_request ?registry_id:(registry_id_ : registry_id option)
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

let make_encryption_configuration_for_repository_creation_template
    ?kms_key:(kms_key_ : kms_key_for_repository_creation_template option)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({ kms_key = kms_key_; encryption_type = encryption_type_ }
    : encryption_configuration_for_repository_creation_template)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_image_tag_mutability_exclusion_filter
    ~filter:(filter_ : image_tag_mutability_exclusion_filter_value)
    ~filter_type:(filter_type_ : image_tag_mutability_exclusion_filter_type) () =
  ({ filter = filter_; filter_type = filter_type_ } : image_tag_mutability_exclusion_filter)

let make_repository_creation_template ?updated_at:(updated_at_ : date option)
    ?created_at:(created_at_ : date option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?applied_for:(applied_for_ : rct_applied_for_list option)
    ?lifecycle_policy:
      (lifecycle_policy_ : lifecycle_policy_text_for_repository_creation_template option)
    ?repository_policy:(repository_policy_ : repository_policy_text option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?resource_tags:(resource_tags_ : tag_list option)
    ?encryption_configuration:
      (encryption_configuration_ : encryption_configuration_for_repository_creation_template option)
    ?description:(description_ : repository_template_description option)
    ?prefix:(prefix_ : prefix option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     custom_role_arn = custom_role_arn_;
     applied_for = applied_for_;
     lifecycle_policy = lifecycle_policy_;
     repository_policy = repository_policy_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     resource_tags = resource_tags_;
     encryption_configuration = encryption_configuration_;
     description = description_;
     prefix = prefix_;
   }
    : repository_creation_template)

let make_update_repository_creation_template_response
    ?repository_creation_template:
      (repository_creation_template_ : repository_creation_template option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ repository_creation_template = repository_creation_template_; registry_id = registry_id_ }
    : update_repository_creation_template_response)

let make_update_repository_creation_template_request
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?applied_for:(applied_for_ : rct_applied_for_list option)
    ?lifecycle_policy:
      (lifecycle_policy_ : lifecycle_policy_text_for_repository_creation_template option)
    ?repository_policy:(repository_policy_ : repository_policy_text option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?resource_tags:(resource_tags_ : tag_list option)
    ?encryption_configuration:
      (encryption_configuration_ : encryption_configuration_for_repository_creation_template option)
    ?description:(description_ : repository_template_description option) ~prefix:(prefix_ : prefix)
    () =
  ({
     custom_role_arn = custom_role_arn_;
     applied_for = applied_for_;
     lifecycle_policy = lifecycle_policy_;
     repository_policy = repository_policy_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     resource_tags = resource_tags_;
     encryption_configuration = encryption_configuration_;
     description = description_;
     prefix = prefix_;
   }
    : update_repository_creation_template_request)

let make_update_pull_through_cache_rule_response
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?updated_at:(updated_at_ : updated_timestamp option)
    ?registry_id:(registry_id_ : registry_id option)
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     upstream_repository_prefix = upstream_repository_prefix_;
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     updated_at = updated_at_;
     registry_id = registry_id_;
     ecr_repository_prefix = ecr_repository_prefix_;
   }
    : update_pull_through_cache_rule_response)

let make_update_pull_through_cache_rule_request
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?registry_id:(registry_id_ : registry_id option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     ecr_repository_prefix = ecr_repository_prefix_;
     registry_id = registry_id_;
   }
    : update_pull_through_cache_rule_request)

let make_image_identifier ?image_tag:(image_tag_ : image_tag option)
    ?image_digest:(image_digest_ : image_digest option) () =
  ({ image_tag = image_tag_; image_digest = image_digest_ } : image_identifier)

let make_update_image_storage_class_response ?image_status:(image_status_ : image_status option)
    ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     image_status = image_status_;
     image_id = image_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : update_image_storage_class_response)

let make_update_image_storage_class_request ?registry_id:(registry_id_ : registry_id option)
    ~target_storage_class:(target_storage_class_ : target_storage_class)
    ~image_id:(image_id_ : image_identifier) ~repository_name:(repository_name_ : repository_name)
    () =
  ({
     target_storage_class = target_storage_class_;
     image_id = image_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : update_image_storage_class_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_transitioning_image_total_count
    ?image_total_count:(image_total_count_ : image_count option)
    ?target_storage_class:(target_storage_class_ : lifecycle_policy_target_storage_class option) ()
    =
  ({ image_total_count = image_total_count_; target_storage_class = target_storage_class_ }
    : transitioning_image_total_count)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_subject_identifier ~image_digest:(image_digest_ : image_digest) () =
  ({ image_digest = image_digest_ } : subject_identifier)

let make_start_lifecycle_policy_preview_response
    ?status:(status_ : lifecycle_policy_preview_status option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     status = status_;
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : start_lifecycle_policy_preview_response)

let make_start_lifecycle_policy_preview_request
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : start_lifecycle_policy_preview_request)

let make_image_scan_status ?description:(description_ : scan_status_description option)
    ?status:(status_ : scan_status option) () =
  ({ description = description_; status = status_ } : image_scan_status)

let make_start_image_scan_response
    ?image_scan_status:(image_scan_status_ : image_scan_status option)
    ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     image_scan_status = image_scan_status_;
     image_id = image_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : start_image_scan_response)

let make_start_image_scan_request ?registry_id:(registry_id_ : registry_id option)
    ~image_id:(image_id_ : image_identifier) ~repository_name:(repository_name_ : repository_name)
    () =
  ({ image_id = image_id_; repository_name = repository_name_; registry_id = registry_id_ }
    : start_image_scan_request)

let make_signing_repository_filter ~filter_type:(filter_type_ : signing_repository_filter_type)
    ~filter:(filter_ : signing_repository_filter_value) () =
  ({ filter_type = filter_type_; filter = filter_ } : signing_repository_filter)

let make_signing_rule
    ?repository_filters:(repository_filters_ : signing_repository_filter_list option)
    ~signing_profile_arn:(signing_profile_arn_ : signing_profile_arn) () =
  ({ repository_filters = repository_filters_; signing_profile_arn = signing_profile_arn_ }
    : signing_rule)

let make_signing_configuration ~rules:(rules_ : signing_rule_list) () =
  ({ rules = rules_ } : signing_configuration)

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

let make_cvss_score_adjustment ?reason:(reason_ : reason option) ?metric:(metric_ : metric option)
    () =
  ({ reason = reason_; metric = metric_ } : cvss_score_adjustment)

let make_cvss_score_details ?version:(version_ : version option)
    ?scoring_vector:(scoring_vector_ : scoring_vector option)
    ?score_source:(score_source_ : source option) ?score:(score_ : score option)
    ?adjustments:(adjustments_ : cvss_score_adjustment_list option) () =
  ({
     version = version_;
     scoring_vector = scoring_vector_;
     score_source = score_source_;
     score = score_;
     adjustments = adjustments_;
   }
    : cvss_score_details)

let make_score_details ?cvss:(cvss_ : cvss_score_details option) () =
  ({ cvss = cvss_ } : score_details)

let make_scanning_repository_filter ~filter_type:(filter_type_ : scanning_repository_filter_type)
    ~filter:(filter_ : scanning_repository_filter_value) () =
  ({ filter_type = filter_type_; filter = filter_ } : scanning_repository_filter)

let make_aws_ecr_container_image_details
    ?repository_name:(repository_name_ : repository_name option)
    ?registry:(registry_ : registry_id option) ?in_use_count:(in_use_count_ : in_use_count option)
    ?last_in_use_at:(last_in_use_at_ : date option) ?pushed_at:(pushed_at_ : date option)
    ?platform:(platform_ : platform option) ?image_tags:(image_tags_ : image_tags_list option)
    ?image_hash:(image_hash_ : image_digest option) ?author:(author_ : author option)
    ?architecture:(architecture_ : arch option) () =
  ({
     repository_name = repository_name_;
     registry = registry_;
     in_use_count = in_use_count_;
     last_in_use_at = last_in_use_at_;
     pushed_at = pushed_at_;
     platform = platform_;
     image_tags = image_tags_;
     image_hash = image_hash_;
     author = author_;
     architecture = architecture_;
   }
    : aws_ecr_container_image_details)

let make_resource_details
    ?aws_ecr_container_image:(aws_ecr_container_image_ : aws_ecr_container_image_details option) ()
    =
  ({ aws_ecr_container_image = aws_ecr_container_image_ } : resource_details)

let make_resource ?type_:(type__ : type_ option) ?tags:(tags_ : tags option)
    ?id:(id_ : resource_id option) ?details:(details_ : resource_details option) () =
  ({ type_ = type__; tags = tags_; id = id_; details = details_ } : resource)

let make_repository_scanning_configuration
    ?applied_scan_filters:(applied_scan_filters_ : scanning_repository_filter_list option)
    ?scan_frequency:(scan_frequency_ : scan_frequency option)
    ?scan_on_push:(scan_on_push_ : scan_on_push_flag option)
    ?repository_name:(repository_name_ : repository_name option)
    ?repository_arn:(repository_arn_ : arn option) () =
  ({
     applied_scan_filters = applied_scan_filters_;
     scan_frequency = scan_frequency_;
     scan_on_push = scan_on_push_;
     repository_name = repository_name_;
     repository_arn = repository_arn_;
   }
    : repository_scanning_configuration)

let make_repository_scanning_configuration_failure
    ?failure_reason:(failure_reason_ : scanning_configuration_failure_reason option)
    ?failure_code:(failure_code_ : scanning_configuration_failure_code option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     failure_reason = failure_reason_;
     failure_code = failure_code_;
     repository_name = repository_name_;
   }
    : repository_scanning_configuration_failure)

let make_image_scanning_configuration ?scan_on_push:(scan_on_push_ : scan_on_push_flag option) () =
  ({ scan_on_push = scan_on_push_ } : image_scanning_configuration)

let make_encryption_configuration ?kms_key:(kms_key_ : kms_key option)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({ kms_key = kms_key_; encryption_type = encryption_type_ } : encryption_configuration)

let make_repository
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?image_scanning_configuration:
      (image_scanning_configuration_ : image_scanning_configuration option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?repository_uri:(repository_uri_ : url option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) ?repository_arn:(repository_arn_ : arn option)
    () =
  ({
     encryption_configuration = encryption_configuration_;
     image_scanning_configuration = image_scanning_configuration_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     created_at = created_at_;
     repository_uri = repository_uri_;
     repository_name = repository_name_;
     registry_id = registry_id_;
     repository_arn = repository_arn_;
   }
    : repository)

let make_repository_filter ~filter_type:(filter_type_ : repository_filter_type)
    ~filter:(filter_ : repository_filter_value) () =
  ({ filter_type = filter_type_; filter = filter_ } : repository_filter)

let make_replication_destination ~registry_id:(registry_id_ : registry_id)
    ~region:(region_ : region) () =
  ({ registry_id = registry_id_; region = region_ } : replication_destination)

let make_replication_rule ?repository_filters:(repository_filters_ : repository_filter_list option)
    ~destinations:(destinations_ : replication_destination_list) () =
  ({ repository_filters = repository_filters_; destinations = destinations_ } : replication_rule)

let make_replication_configuration ~rules:(rules_ : replication_rule_list) () =
  ({ rules = rules_ } : replication_configuration)

let make_recommendation ?text:(text_ : recommendation_text option) ?url:(url_ : url option) () =
  ({ text = text_; url = url_ } : recommendation)

let make_remediation ?recommendation:(recommendation_ : recommendation option) () =
  ({ recommendation = recommendation_ } : remediation)

let make_registry_scanning_rule
    ~repository_filters:(repository_filters_ : scanning_repository_filter_list)
    ~scan_frequency:(scan_frequency_ : scan_frequency) () =
  ({ repository_filters = repository_filters_; scan_frequency = scan_frequency_ }
    : registry_scanning_rule)

let make_registry_scanning_configuration ?rules:(rules_ : registry_scanning_rule_list option)
    ?scan_type:(scan_type_ : scan_type option) () =
  ({ rules = rules_; scan_type = scan_type_ } : registry_scanning_configuration)

let make_register_pull_time_update_exclusion_response
    ?created_at:(created_at_ : creation_timestamp option)
    ?principal_arn:(principal_arn_ : principal_arn option) () =
  ({ created_at = created_at_; principal_arn = principal_arn_ }
    : register_pull_time_update_exclusion_response)

let make_register_pull_time_update_exclusion_request ~principal_arn:(principal_arn_ : principal_arn)
    () =
  ({ principal_arn = principal_arn_ } : register_pull_time_update_exclusion_request)

let make_put_signing_configuration_response
    ?signing_configuration:(signing_configuration_ : signing_configuration option) () =
  ({ signing_configuration = signing_configuration_ } : put_signing_configuration_response)

let make_put_signing_configuration_request
    ~signing_configuration:(signing_configuration_ : signing_configuration) () =
  ({ signing_configuration = signing_configuration_ } : put_signing_configuration_request)

let make_put_replication_configuration_response
    ?replication_configuration:(replication_configuration_ : replication_configuration option) () =
  ({ replication_configuration = replication_configuration_ }
    : put_replication_configuration_response)

let make_put_replication_configuration_request
    ~replication_configuration:(replication_configuration_ : replication_configuration) () =
  ({ replication_configuration = replication_configuration_ }
    : put_replication_configuration_request)

let make_put_registry_scanning_configuration_response
    ?registry_scanning_configuration:
      (registry_scanning_configuration_ : registry_scanning_configuration option) () =
  ({ registry_scanning_configuration = registry_scanning_configuration_ }
    : put_registry_scanning_configuration_response)

let make_put_registry_scanning_configuration_request
    ?rules:(rules_ : registry_scanning_rule_list option) ?scan_type:(scan_type_ : scan_type option)
    () =
  ({ rules = rules_; scan_type = scan_type_ } : put_registry_scanning_configuration_request)

let make_put_registry_policy_response ?policy_text:(policy_text_ : registry_policy_text option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; registry_id = registry_id_ } : put_registry_policy_response)

let make_put_registry_policy_request ~policy_text:(policy_text_ : registry_policy_text) () =
  ({ policy_text = policy_text_ } : put_registry_policy_request)

let make_put_lifecycle_policy_response
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_lifecycle_policy_response)

let make_put_lifecycle_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_lifecycle_policy_request)

let make_put_image_tag_mutability_response
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_image_tag_mutability_response)

let make_put_image_tag_mutability_request
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?registry_id:(registry_id_ : registry_id option)
    ~image_tag_mutability:(image_tag_mutability_ : image_tag_mutability)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_image_tag_mutability_request)

let make_put_image_scanning_configuration_response
    ?image_scanning_configuration:
      (image_scanning_configuration_ : image_scanning_configuration option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     image_scanning_configuration = image_scanning_configuration_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_image_scanning_configuration_response)

let make_put_image_scanning_configuration_request ?registry_id:(registry_id_ : registry_id option)
    ~image_scanning_configuration:(image_scanning_configuration_ : image_scanning_configuration)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     image_scanning_configuration = image_scanning_configuration_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : put_image_scanning_configuration_request)

let make_image ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?image_manifest:(image_manifest_ : image_manifest option)
    ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
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
    ?registry_id:(registry_id_ : registry_id option)
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

let make_put_account_setting_response ?value:(value_ : account_setting_value option)
    ?name:(name_ : account_setting_name option) () =
  ({ value = value_; name = name_ } : put_account_setting_response)

let make_put_account_setting_request ~value:(value_ : account_setting_value)
    ~name:(name_ : account_setting_name) () =
  ({ value = value_; name = name_ } : put_account_setting_request)

let make_pull_through_cache_rule ?updated_at:(updated_at_ : updated_timestamp option)
    ?upstream_registry:(upstream_registry_ : upstream_registry option)
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?registry_id:(registry_id_ : registry_id option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     updated_at = updated_at_;
     upstream_registry = upstream_registry_;
     upstream_repository_prefix = upstream_repository_prefix_;
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     registry_id = registry_id_;
     created_at = created_at_;
     upstream_registry_url = upstream_registry_url_;
     ecr_repository_prefix = ecr_repository_prefix_;
   }
    : pull_through_cache_rule)

let make_cvss_score ?version:(version_ : version option) ?source:(source_ : source option)
    ?scoring_vector:(scoring_vector_ : scoring_vector option)
    ?base_score:(base_score_ : base_score option) () =
  ({
     version = version_;
     source = source_;
     scoring_vector = scoring_vector_;
     base_score = base_score_;
   }
    : cvss_score)

let make_package_vulnerability_details
    ?vulnerable_packages:(vulnerable_packages_ : vulnerable_packages_list option)
    ?vulnerability_id:(vulnerability_id_ : vulnerability_id option)
    ?vendor_updated_at:(vendor_updated_at_ : date option)
    ?vendor_severity:(vendor_severity_ : severity option)
    ?vendor_created_at:(vendor_created_at_ : date option) ?source_url:(source_url_ : url option)
    ?source:(source_ : source option)
    ?related_vulnerabilities:(related_vulnerabilities_ : related_vulnerabilities_list option)
    ?reference_urls:(reference_urls_ : reference_urls_list option)
    ?cvss:(cvss_ : cvss_score_list option) () =
  ({
     vulnerable_packages = vulnerable_packages_;
     vulnerability_id = vulnerability_id_;
     vendor_updated_at = vendor_updated_at_;
     vendor_severity = vendor_severity_;
     vendor_created_at = vendor_created_at_;
     source_url = source_url_;
     source = source_;
     related_vulnerabilities = related_vulnerabilities_;
     reference_urls = reference_urls_;
     cvss = cvss_;
   }
    : package_vulnerability_details)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_pull_time_update_exclusions_response ?next_token:(next_token_ : next_token option)
    ?pull_time_update_exclusions:
      (pull_time_update_exclusions_ : pull_time_update_exclusion_list option) () =
  ({ next_token = next_token_; pull_time_update_exclusions = pull_time_update_exclusions_ }
    : list_pull_time_update_exclusions_response)

let make_list_pull_time_update_exclusions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_pull_time_update_exclusions_request)

let make_list_images_response ?next_token:(next_token_ : next_token option)
    ?image_ids:(image_ids_ : image_identifier_list option) () =
  ({ next_token = next_token_; image_ids = image_ids_ } : list_images_response)

let make_list_images_filter ?image_status:(image_status_ : image_status_filter option)
    ?tag_status:(tag_status_ : tag_status option) () =
  ({ image_status = image_status_; tag_status = tag_status_ } : list_images_filter)

let make_list_images_request ?filter:(filter_ : list_images_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : list_images_request)

let make_image_referrer ?artifact_status:(artifact_status_ : artifact_status option)
    ?annotations:(annotations_ : annotations option)
    ?artifact_type:(artifact_type_ : artifact_type option) ~size:(size_ : image_size_in_bytes)
    ~media_type:(media_type_ : media_type) ~digest:(digest_ : image_digest) () =
  ({
     artifact_status = artifact_status_;
     annotations = annotations_;
     size = size_;
     artifact_type = artifact_type_;
     media_type = media_type_;
     digest = digest_;
   }
    : image_referrer)

let make_list_image_referrers_response ?next_token:(next_token_ : next_token option)
    ?referrers:(referrers_ : image_referrer_list option) () =
  ({ next_token = next_token_; referrers = referrers_ } : list_image_referrers_response)

let make_list_image_referrers_filter
    ?artifact_status:(artifact_status_ : artifact_status_filter option)
    ?artifact_types:(artifact_types_ : artifact_type_list option) () =
  ({ artifact_status = artifact_status_; artifact_types = artifact_types_ }
    : list_image_referrers_filter)

let make_list_image_referrers_request ?max_results:(max_results_ : fifty_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filter:(filter_ : list_image_referrers_filter option)
    ?registry_id:(registry_id_ : registry_id option) ~subject_id:(subject_id_ : subject_identifier)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     subject_id = subject_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : list_image_referrers_request)

let make_lifecycle_policy_rule_action
    ?target_storage_class:(target_storage_class_ : lifecycle_policy_target_storage_class option)
    ?type_:(type__ : image_action_type option) () =
  ({ target_storage_class = target_storage_class_; type_ = type__ } : lifecycle_policy_rule_action)

let make_lifecycle_policy_preview_summary
    ?transitioning_image_total_counts:
      (transitioning_image_total_counts_ : transitioning_image_total_counts option)
    ?expiring_image_total_count:(expiring_image_total_count_ : image_count option) () =
  ({
     transitioning_image_total_counts = transitioning_image_total_counts_;
     expiring_image_total_count = expiring_image_total_count_;
   }
    : lifecycle_policy_preview_summary)

let make_lifecycle_policy_preview_filter ?tag_status:(tag_status_ : tag_status option) () =
  ({ tag_status = tag_status_ } : lifecycle_policy_preview_filter)

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

let make_initiate_layer_upload_response ?part_size:(part_size_ : part_size option)
    ?upload_id:(upload_id_ : upload_id option) () =
  ({ part_size = part_size_; upload_id = upload_id_ } : initiate_layer_upload_response)

let make_initiate_layer_upload_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : initiate_layer_upload_request)

let make_image_signing_status ?status:(status_ : signing_status option)
    ?failure_reason:(failure_reason_ : signing_status_failure_reason option)
    ?failure_code:(failure_code_ : signing_status_failure_code option)
    ?signing_profile_arn:(signing_profile_arn_ : signing_profile_arn option) () =
  ({
     status = status_;
     failure_reason = failure_reason_;
     failure_code = failure_code_;
     signing_profile_arn = signing_profile_arn_;
   }
    : image_signing_status)

let make_image_scan_findings_summary
    ?finding_severity_counts:(finding_severity_counts_ : finding_severity_counts option)
    ?vulnerability_source_updated_at:
      (vulnerability_source_updated_at_ : vulnerability_source_update_timestamp option)
    ?image_scan_completed_at:(image_scan_completed_at_ : scan_timestamp option) () =
  ({
     finding_severity_counts = finding_severity_counts_;
     vulnerability_source_updated_at = vulnerability_source_updated_at_;
     image_scan_completed_at = image_scan_completed_at_;
   }
    : image_scan_findings_summary)

let make_attribute ?value:(value_ : attribute_value option) ~key:(key_ : attribute_key) () =
  ({ value = value_; key = key_ } : attribute)

let make_image_scan_finding ?attributes:(attributes_ : attribute_list option)
    ?severity:(severity_ : finding_severity option) ?uri:(uri_ : url option)
    ?description:(description_ : finding_description option) ?name:(name_ : finding_name option) ()
    =
  ({
     attributes = attributes_;
     severity = severity_;
     uri = uri_;
     description = description_;
     name = name_;
   }
    : image_scan_finding)

let make_enhanced_image_scan_finding
    ?exploit_available:(exploit_available_ : exploit_available option)
    ?fix_available:(fix_available_ : fix_available option) ?updated_at:(updated_at_ : date option)
    ?type_:(type__ : type_ option) ?title:(title_ : title option) ?status:(status_ : status option)
    ?severity:(severity_ : severity option) ?score_details:(score_details_ : score_details option)
    ?score:(score_ : score option) ?resources:(resources_ : resource_list option)
    ?remediation:(remediation_ : remediation option)
    ?package_vulnerability_details:
      (package_vulnerability_details_ : package_vulnerability_details option)
    ?last_observed_at:(last_observed_at_ : date option)
    ?first_observed_at:(first_observed_at_ : date option)
    ?finding_arn:(finding_arn_ : finding_arn option)
    ?description:(description_ : finding_description option)
    ?aws_account_id:(aws_account_id_ : registry_id option) () =
  ({
     exploit_available = exploit_available_;
     fix_available = fix_available_;
     updated_at = updated_at_;
     type_ = type__;
     title = title_;
     status = status_;
     severity = severity_;
     score_details = score_details_;
     score = score_;
     resources = resources_;
     remediation = remediation_;
     package_vulnerability_details = package_vulnerability_details_;
     last_observed_at = last_observed_at_;
     first_observed_at = first_observed_at_;
     finding_arn = finding_arn_;
     description = description_;
     aws_account_id = aws_account_id_;
   }
    : enhanced_image_scan_finding)

let make_image_scan_findings
    ?enhanced_findings:(enhanced_findings_ : enhanced_image_scan_finding_list option)
    ?findings:(findings_ : image_scan_finding_list option)
    ?finding_severity_counts:(finding_severity_counts_ : finding_severity_counts option)
    ?vulnerability_source_updated_at:
      (vulnerability_source_updated_at_ : vulnerability_source_update_timestamp option)
    ?image_scan_completed_at:(image_scan_completed_at_ : scan_timestamp option) () =
  ({
     enhanced_findings = enhanced_findings_;
     findings = findings_;
     finding_severity_counts = finding_severity_counts_;
     vulnerability_source_updated_at = vulnerability_source_updated_at_;
     image_scan_completed_at = image_scan_completed_at_;
   }
    : image_scan_findings)

let make_image_replication_status ?failure_code:(failure_code_ : replication_error option)
    ?status:(status_ : replication_status option) ?registry_id:(registry_id_ : registry_id option)
    ?region:(region_ : region option) () =
  ({ failure_code = failure_code_; status = status_; registry_id = registry_id_; region = region_ }
    : image_replication_status)

let make_image_failure ?failure_reason:(failure_reason_ : image_failure_reason option)
    ?failure_code:(failure_code_ : image_failure_code option)
    ?image_id:(image_id_ : image_identifier option) () =
  ({ failure_reason = failure_reason_; failure_code = failure_code_; image_id = image_id_ }
    : image_failure)

let make_image_detail ?last_activated_at:(last_activated_at_ : last_activated_at_timestamp option)
    ?last_archived_at:(last_archived_at_ : last_archived_at_timestamp option)
    ?image_status:(image_status_ : image_status option)
    ?subject_manifest_digest:(subject_manifest_digest_ : image_digest option)
    ?last_recorded_pull_time:(last_recorded_pull_time_ : recorded_pull_timestamp option)
    ?artifact_media_type:(artifact_media_type_ : media_type option)
    ?image_manifest_media_type:(image_manifest_media_type_ : media_type option)
    ?image_scan_findings_summary:(image_scan_findings_summary_ : image_scan_findings_summary option)
    ?image_scan_status:(image_scan_status_ : image_scan_status option)
    ?image_pushed_at:(image_pushed_at_ : push_timestamp option)
    ?image_size_in_bytes:(image_size_in_bytes_ : image_size_in_bytes option)
    ?image_tags:(image_tags_ : image_tag_list option)
    ?image_digest:(image_digest_ : image_digest option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     last_activated_at = last_activated_at_;
     last_archived_at = last_archived_at_;
     image_status = image_status_;
     subject_manifest_digest = subject_manifest_digest_;
     last_recorded_pull_time = last_recorded_pull_time_;
     artifact_media_type = artifact_media_type_;
     image_manifest_media_type = image_manifest_media_type_;
     image_scan_findings_summary = image_scan_findings_summary_;
     image_scan_status = image_scan_status_;
     image_pushed_at = image_pushed_at_;
     image_size_in_bytes = image_size_in_bytes_;
     image_tags = image_tags_;
     image_digest = image_digest_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : image_detail)

let make_get_signing_configuration_response
    ?signing_configuration:(signing_configuration_ : signing_configuration option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ signing_configuration = signing_configuration_; registry_id = registry_id_ }
    : get_signing_configuration_response)

let make_get_signing_configuration_request () = (() : unit)

let make_get_repository_policy_response ?policy_text:(policy_text_ : repository_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; repository_name = repository_name_; registry_id = registry_id_ }
    : get_repository_policy_response)

let make_get_repository_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : get_repository_policy_request)

let make_get_registry_scanning_configuration_response
    ?scanning_configuration:(scanning_configuration_ : registry_scanning_configuration option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ scanning_configuration = scanning_configuration_; registry_id = registry_id_ }
    : get_registry_scanning_configuration_response)

let make_get_registry_scanning_configuration_request () = (() : unit)

let make_get_registry_policy_response ?policy_text:(policy_text_ : registry_policy_text option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; registry_id = registry_id_ } : get_registry_policy_response)

let make_get_registry_policy_request () = (() : unit)

let make_get_lifecycle_policy_response
    ?last_evaluated_at:(last_evaluated_at_ : evaluation_timestamp option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     last_evaluated_at = last_evaluated_at_;
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : get_lifecycle_policy_response)

let make_get_lifecycle_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : get_lifecycle_policy_request)

let make_get_lifecycle_policy_preview_response
    ?summary:(summary_ : lifecycle_policy_preview_summary option)
    ?preview_results:(preview_results_ : lifecycle_policy_preview_result_list option)
    ?next_token:(next_token_ : next_token option)
    ?status:(status_ : lifecycle_policy_preview_status option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     summary = summary_;
     preview_results = preview_results_;
     next_token = next_token_;
     status = status_;
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : get_lifecycle_policy_preview_response)

let make_get_lifecycle_policy_preview_request
    ?filter:(filter_ : lifecycle_policy_preview_filter option)
    ?max_results:(max_results_ : lifecycle_preview_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?image_ids:(image_ids_ : image_identifier_list option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     image_ids = image_ids_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : get_lifecycle_policy_preview_request)

let make_get_download_url_for_layer_response ?layer_digest:(layer_digest_ : layer_digest option)
    ?download_url:(download_url_ : url option) () =
  ({ layer_digest = layer_digest_; download_url = download_url_ }
    : get_download_url_for_layer_response)

let make_get_download_url_for_layer_request ?registry_id:(registry_id_ : registry_id option)
    ~layer_digest:(layer_digest_ : layer_digest)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ layer_digest = layer_digest_; repository_name = repository_name_; registry_id = registry_id_ }
    : get_download_url_for_layer_request)

let make_authorization_data ?proxy_endpoint:(proxy_endpoint_ : proxy_endpoint option)
    ?expires_at:(expires_at_ : expiration_timestamp option)
    ?authorization_token:(authorization_token_ : base64 option) () =
  ({
     proxy_endpoint = proxy_endpoint_;
     expires_at = expires_at_;
     authorization_token = authorization_token_;
   }
    : authorization_data)

let make_get_authorization_token_response
    ?authorization_data:(authorization_data_ : authorization_data_list option) () =
  ({ authorization_data = authorization_data_ } : get_authorization_token_response)

let make_get_authorization_token_request
    ?registry_ids:(registry_ids_ : get_authorization_token_registry_id_list option) () =
  ({ registry_ids = registry_ids_ } : get_authorization_token_request)

let make_get_account_setting_response ?value:(value_ : account_setting_name option)
    ?name:(name_ : account_setting_name option) () =
  ({ value = value_; name = name_ } : get_account_setting_response)

let make_get_account_setting_request ~name:(name_ : account_setting_name) () =
  ({ name = name_ } : get_account_setting_request)

let make_describe_repository_creation_templates_response
    ?next_token:(next_token_ : next_token option)
    ?repository_creation_templates:
      (repository_creation_templates_ : repository_creation_template_list option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     next_token = next_token_;
     repository_creation_templates = repository_creation_templates_;
     registry_id = registry_id_;
   }
    : describe_repository_creation_templates_response)

let make_describe_repository_creation_templates_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?prefixes:(prefixes_ : prefix_list option) () =
  ({ max_results = max_results_; next_token = next_token_; prefixes = prefixes_ }
    : describe_repository_creation_templates_request)

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

let make_describe_registry_response
    ?replication_configuration:(replication_configuration_ : replication_configuration option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ replication_configuration = replication_configuration_; registry_id = registry_id_ }
    : describe_registry_response)

let make_describe_registry_request () = (() : unit)

let make_describe_pull_through_cache_rules_response ?next_token:(next_token_ : next_token option)
    ?pull_through_cache_rules:(pull_through_cache_rules_ : pull_through_cache_rule_list option) () =
  ({ next_token = next_token_; pull_through_cache_rules = pull_through_cache_rules_ }
    : describe_pull_through_cache_rules_response)

let make_describe_pull_through_cache_rules_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?ecr_repository_prefixes:
      (ecr_repository_prefixes_ : pull_through_cache_rule_repository_prefix_list option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     ecr_repository_prefixes = ecr_repository_prefixes_;
     registry_id = registry_id_;
   }
    : describe_pull_through_cache_rules_request)

let make_describe_images_response ?next_token:(next_token_ : next_token option)
    ?image_details:(image_details_ : image_detail_list option) () =
  ({ next_token = next_token_; image_details = image_details_ } : describe_images_response)

let make_describe_images_filter ?image_status:(image_status_ : image_status_filter option)
    ?tag_status:(tag_status_ : tag_status option) () =
  ({ image_status = image_status_; tag_status = tag_status_ } : describe_images_filter)

let make_describe_images_request ?filter:(filter_ : describe_images_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?image_ids:(image_ids_ : image_identifier_list option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     image_ids = image_ids_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : describe_images_request)

let make_describe_image_signing_status_response
    ?signing_statuses:(signing_statuses_ : image_signing_status_list option)
    ?registry_id:(registry_id_ : registry_id option) ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     signing_statuses = signing_statuses_;
     registry_id = registry_id_;
     image_id = image_id_;
     repository_name = repository_name_;
   }
    : describe_image_signing_status_response)

let make_describe_image_signing_status_request ?registry_id:(registry_id_ : registry_id option)
    ~image_id:(image_id_ : image_identifier) ~repository_name:(repository_name_ : repository_name)
    () =
  ({ registry_id = registry_id_; image_id = image_id_; repository_name = repository_name_ }
    : describe_image_signing_status_request)

let make_describe_image_scan_findings_response ?next_token:(next_token_ : next_token option)
    ?image_scan_findings:(image_scan_findings_ : image_scan_findings option)
    ?image_scan_status:(image_scan_status_ : image_scan_status option)
    ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     next_token = next_token_;
     image_scan_findings = image_scan_findings_;
     image_scan_status = image_scan_status_;
     image_id = image_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : describe_image_scan_findings_response)

let make_describe_image_scan_findings_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?registry_id:(registry_id_ : registry_id option)
    ~image_id:(image_id_ : image_identifier) ~repository_name:(repository_name_ : repository_name)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     image_id = image_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : describe_image_scan_findings_request)

let make_describe_image_replication_status_response
    ?replication_statuses:(replication_statuses_ : image_replication_status_list option)
    ?image_id:(image_id_ : image_identifier option)
    ?repository_name:(repository_name_ : repository_name option) () =
  ({
     replication_statuses = replication_statuses_;
     image_id = image_id_;
     repository_name = repository_name_;
   }
    : describe_image_replication_status_response)

let make_describe_image_replication_status_request ?registry_id:(registry_id_ : registry_id option)
    ~image_id:(image_id_ : image_identifier) ~repository_name:(repository_name_ : repository_name)
    () =
  ({ registry_id = registry_id_; image_id = image_id_; repository_name = repository_name_ }
    : describe_image_replication_status_request)

let make_deregister_pull_time_update_exclusion_response
    ?principal_arn:(principal_arn_ : principal_arn option) () =
  ({ principal_arn = principal_arn_ } : deregister_pull_time_update_exclusion_response)

let make_deregister_pull_time_update_exclusion_request
    ~principal_arn:(principal_arn_ : principal_arn) () =
  ({ principal_arn = principal_arn_ } : deregister_pull_time_update_exclusion_request)

let make_delete_signing_configuration_response
    ?signing_configuration:(signing_configuration_ : signing_configuration option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ signing_configuration = signing_configuration_; registry_id = registry_id_ }
    : delete_signing_configuration_response)

let make_delete_signing_configuration_request () = (() : unit)

let make_delete_repository_response ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : delete_repository_response)

let make_delete_repository_request ?force:(force_ : force_flag option)
    ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ force = force_; repository_name = repository_name_; registry_id = registry_id_ }
    : delete_repository_request)

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

let make_delete_repository_creation_template_response
    ?repository_creation_template:
      (repository_creation_template_ : repository_creation_template option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ repository_creation_template = repository_creation_template_; registry_id = registry_id_ }
    : delete_repository_creation_template_response)

let make_delete_repository_creation_template_request ~prefix:(prefix_ : prefix) () =
  ({ prefix = prefix_ } : delete_repository_creation_template_request)

let make_delete_registry_policy_response ?policy_text:(policy_text_ : registry_policy_text option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ policy_text = policy_text_; registry_id = registry_id_ } : delete_registry_policy_response)

let make_delete_registry_policy_request () = (() : unit)

let make_delete_pull_through_cache_rule_response
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?registry_id:(registry_id_ : registry_id option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     upstream_repository_prefix = upstream_repository_prefix_;
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     registry_id = registry_id_;
     created_at = created_at_;
     upstream_registry_url = upstream_registry_url_;
     ecr_repository_prefix = ecr_repository_prefix_;
   }
    : delete_pull_through_cache_rule_response)

let make_delete_pull_through_cache_rule_request ?registry_id:(registry_id_ : registry_id option)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({ registry_id = registry_id_; ecr_repository_prefix = ecr_repository_prefix_ }
    : delete_pull_through_cache_rule_request)

let make_delete_lifecycle_policy_response
    ?last_evaluated_at:(last_evaluated_at_ : evaluation_timestamp option)
    ?lifecycle_policy_text:(lifecycle_policy_text_ : lifecycle_policy_text option)
    ?repository_name:(repository_name_ : repository_name option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({
     last_evaluated_at = last_evaluated_at_;
     lifecycle_policy_text = lifecycle_policy_text_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : delete_lifecycle_policy_response)

let make_delete_lifecycle_policy_request ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ repository_name = repository_name_; registry_id = registry_id_ }
    : delete_lifecycle_policy_request)

let make_create_repository_response ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : create_repository_response)

let make_create_repository_request
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?image_scanning_configuration:
      (image_scanning_configuration_ : image_scanning_configuration option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?tags:(tags_ : tag_list option) ?registry_id:(registry_id_ : registry_id option)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     encryption_configuration = encryption_configuration_;
     image_scanning_configuration = image_scanning_configuration_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     tags = tags_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : create_repository_request)

let make_create_repository_creation_template_response
    ?repository_creation_template:
      (repository_creation_template_ : repository_creation_template option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ repository_creation_template = repository_creation_template_; registry_id = registry_id_ }
    : create_repository_creation_template_response)

let make_create_repository_creation_template_request
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?lifecycle_policy:
      (lifecycle_policy_ : lifecycle_policy_text_for_repository_creation_template option)
    ?repository_policy:(repository_policy_ : repository_policy_text option)
    ?image_tag_mutability_exclusion_filters:
      (image_tag_mutability_exclusion_filters_ : image_tag_mutability_exclusion_filters option)
    ?image_tag_mutability:(image_tag_mutability_ : image_tag_mutability option)
    ?resource_tags:(resource_tags_ : tag_list option)
    ?encryption_configuration:
      (encryption_configuration_ : encryption_configuration_for_repository_creation_template option)
    ?description:(description_ : repository_template_description option)
    ~applied_for:(applied_for_ : rct_applied_for_list) ~prefix:(prefix_ : prefix) () =
  ({
     custom_role_arn = custom_role_arn_;
     applied_for = applied_for_;
     lifecycle_policy = lifecycle_policy_;
     repository_policy = repository_policy_;
     image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filters_;
     image_tag_mutability = image_tag_mutability_;
     resource_tags = resource_tags_;
     encryption_configuration = encryption_configuration_;
     description = description_;
     prefix = prefix_;
   }
    : create_repository_creation_template_request)

let make_create_pull_through_cache_rule_response
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?upstream_registry:(upstream_registry_ : upstream_registry option)
    ?registry_id:(registry_id_ : registry_id option)
    ?created_at:(created_at_ : creation_timestamp option)
    ?upstream_registry_url:(upstream_registry_url_ : url option)
    ?ecr_repository_prefix:
      (ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix option) () =
  ({
     upstream_repository_prefix = upstream_repository_prefix_;
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     upstream_registry = upstream_registry_;
     registry_id = registry_id_;
     created_at = created_at_;
     upstream_registry_url = upstream_registry_url_;
     ecr_repository_prefix = ecr_repository_prefix_;
   }
    : create_pull_through_cache_rule_response)

let make_create_pull_through_cache_rule_request
    ?upstream_repository_prefix:
      (upstream_repository_prefix_ : pull_through_cache_rule_repository_prefix option)
    ?custom_role_arn:(custom_role_arn_ : custom_role_arn option)
    ?credential_arn:(credential_arn_ : credential_arn option)
    ?upstream_registry:(upstream_registry_ : upstream_registry option)
    ?registry_id:(registry_id_ : registry_id option)
    ~upstream_registry_url:(upstream_registry_url_ : url)
    ~ecr_repository_prefix:(ecr_repository_prefix_ : pull_through_cache_rule_repository_prefix) () =
  ({
     upstream_repository_prefix = upstream_repository_prefix_;
     custom_role_arn = custom_role_arn_;
     credential_arn = credential_arn_;
     upstream_registry = upstream_registry_;
     registry_id = registry_id_;
     upstream_registry_url = upstream_registry_url_;
     ecr_repository_prefix = ecr_repository_prefix_;
   }
    : create_pull_through_cache_rule_request)

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

let make_complete_layer_upload_request ?registry_id:(registry_id_ : registry_id option)
    ~layer_digests:(layer_digests_ : layer_digest_list) ~upload_id:(upload_id_ : upload_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     layer_digests = layer_digests_;
     upload_id = upload_id_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : complete_layer_upload_request)

let make_batch_get_repository_scanning_configuration_response
    ?failures:(failures_ : repository_scanning_configuration_failure_list option)
    ?scanning_configurations:
      (scanning_configurations_ : repository_scanning_configuration_list option) () =
  ({ failures = failures_; scanning_configurations = scanning_configurations_ }
    : batch_get_repository_scanning_configuration_response)

let make_batch_get_repository_scanning_configuration_request
    ~repository_names:(repository_names_ : scanning_configuration_repository_name_list) () =
  ({ repository_names = repository_names_ } : batch_get_repository_scanning_configuration_request)

let make_batch_get_image_response ?failures:(failures_ : image_failure_list option)
    ?images:(images_ : image_list option) () =
  ({ failures = failures_; images = images_ } : batch_get_image_response)

let make_batch_get_image_request
    ?accepted_media_types:(accepted_media_types_ : media_type_list option)
    ?registry_id:(registry_id_ : registry_id option) ~image_ids:(image_ids_ : image_identifier_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     accepted_media_types = accepted_media_types_;
     image_ids = image_ids_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : batch_get_image_request)

let make_batch_delete_image_response ?failures:(failures_ : image_failure_list option)
    ?image_ids:(image_ids_ : image_identifier_list option) () =
  ({ failures = failures_; image_ids = image_ids_ } : batch_delete_image_response)

let make_batch_delete_image_request ?registry_id:(registry_id_ : registry_id option)
    ~image_ids:(image_ids_ : image_identifier_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({ image_ids = image_ids_; repository_name = repository_name_; registry_id = registry_id_ }
    : batch_delete_image_request)

let make_batch_check_layer_availability_response ?failures:(failures_ : layer_failure_list option)
    ?layers:(layers_ : layer_list option) () =
  ({ failures = failures_; layers = layers_ } : batch_check_layer_availability_response)

let make_batch_check_layer_availability_request ?registry_id:(registry_id_ : registry_id option)
    ~layer_digests:(layer_digests_ : batched_operation_layer_digest_list)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     layer_digests = layer_digests_;
     repository_name = repository_name_;
     registry_id = registry_id_;
   }
    : batch_check_layer_availability_request)
