open Types

val make_validate_pull_through_cache_rule_response :
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?registry_id:registry_id ->
  ?upstream_registry_url:url ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?is_valid:is_ptc_rule_valid ->
  ?failure:ptc_validate_failure ->
  unit ->
  validate_pull_through_cache_rule_response

val make_validate_pull_through_cache_rule_request :
  ?registry_id:registry_id ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  validate_pull_through_cache_rule_request

val make_upload_layer_part_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?upload_id:upload_id ->
  ?last_byte_received:part_size ->
  unit ->
  upload_layer_part_response

val make_upload_layer_part_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  upload_id:upload_id ->
  part_first_byte:part_size ->
  part_last_byte:part_size ->
  layer_part_blob:layer_part_blob ->
  unit ->
  upload_layer_part_request

val make_image_tag_mutability_exclusion_filter :
  filter_type:image_tag_mutability_exclusion_filter_type ->
  filter:image_tag_mutability_exclusion_filter_value ->
  unit ->
  image_tag_mutability_exclusion_filter

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_encryption_configuration_for_repository_creation_template :
  ?kms_key:kms_key_for_repository_creation_template ->
  encryption_type:encryption_type ->
  unit ->
  encryption_configuration_for_repository_creation_template

val make_repository_creation_template :
  ?prefix:prefix ->
  ?description:repository_template_description ->
  ?encryption_configuration:encryption_configuration_for_repository_creation_template ->
  ?resource_tags:tag_list ->
  ?image_tag_mutability:image_tag_mutability ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?repository_policy:repository_policy_text ->
  ?lifecycle_policy:lifecycle_policy_text_for_repository_creation_template ->
  ?applied_for:rct_applied_for_list ->
  ?custom_role_arn:custom_role_arn ->
  ?created_at:date ->
  ?updated_at:date ->
  unit ->
  repository_creation_template

val make_update_repository_creation_template_response :
  ?registry_id:registry_id ->
  ?repository_creation_template:repository_creation_template ->
  unit ->
  update_repository_creation_template_response

val make_update_repository_creation_template_request :
  ?description:repository_template_description ->
  ?encryption_configuration:encryption_configuration_for_repository_creation_template ->
  ?resource_tags:tag_list ->
  ?image_tag_mutability:image_tag_mutability ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?repository_policy:repository_policy_text ->
  ?lifecycle_policy:lifecycle_policy_text_for_repository_creation_template ->
  ?applied_for:rct_applied_for_list ->
  ?custom_role_arn:custom_role_arn ->
  prefix:prefix ->
  unit ->
  update_repository_creation_template_request

val make_update_pull_through_cache_rule_response :
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?registry_id:registry_id ->
  ?updated_at:updated_timestamp ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  update_pull_through_cache_rule_response

val make_update_pull_through_cache_rule_request :
  ?registry_id:registry_id ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  update_pull_through_cache_rule_request

val make_image_identifier :
  ?image_digest:image_digest -> ?image_tag:image_tag -> unit -> image_identifier

val make_update_image_storage_class_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?image_status:image_status ->
  unit ->
  update_image_storage_class_response

val make_update_image_storage_class_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  image_id:image_identifier ->
  target_storage_class:target_storage_class ->
  unit ->
  update_image_storage_class_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_request

val make_start_lifecycle_policy_preview_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?status:lifecycle_policy_preview_status ->
  unit ->
  start_lifecycle_policy_preview_response

val make_start_lifecycle_policy_preview_request :
  ?registry_id:registry_id ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  repository_name:repository_name ->
  unit ->
  start_lifecycle_policy_preview_request

val make_image_scan_status :
  ?status:scan_status -> ?description:scan_status_description -> unit -> image_scan_status

val make_start_image_scan_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?image_scan_status:image_scan_status ->
  unit ->
  start_image_scan_response

val make_start_image_scan_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  image_id:image_identifier ->
  unit ->
  start_image_scan_request

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

val make_register_pull_time_update_exclusion_response :
  ?principal_arn:principal_arn ->
  ?created_at:creation_timestamp ->
  unit ->
  register_pull_time_update_exclusion_response

val make_register_pull_time_update_exclusion_request :
  principal_arn:principal_arn -> unit -> register_pull_time_update_exclusion_request

val make_signing_repository_filter :
  filter:signing_repository_filter_value ->
  filter_type:signing_repository_filter_type ->
  unit ->
  signing_repository_filter

val make_signing_rule :
  ?repository_filters:signing_repository_filter_list ->
  signing_profile_arn:signing_profile_arn ->
  unit ->
  signing_rule

val make_signing_configuration : rules:signing_rule_list -> unit -> signing_configuration

val make_put_signing_configuration_response :
  ?signing_configuration:signing_configuration -> unit -> put_signing_configuration_response

val make_put_signing_configuration_request :
  signing_configuration:signing_configuration -> unit -> put_signing_configuration_request

val make_repository_filter :
  filter:repository_filter_value -> filter_type:repository_filter_type -> unit -> repository_filter

val make_replication_destination :
  region:region -> registry_id:registry_id -> unit -> replication_destination

val make_replication_rule :
  ?repository_filters:repository_filter_list ->
  destinations:replication_destination_list ->
  unit ->
  replication_rule

val make_replication_configuration :
  rules:replication_rule_list -> unit -> replication_configuration

val make_put_replication_configuration_response :
  ?replication_configuration:replication_configuration ->
  unit ->
  put_replication_configuration_response

val make_put_replication_configuration_request :
  replication_configuration:replication_configuration ->
  unit ->
  put_replication_configuration_request

val make_scanning_repository_filter :
  filter:scanning_repository_filter_value ->
  filter_type:scanning_repository_filter_type ->
  unit ->
  scanning_repository_filter

val make_registry_scanning_rule :
  scan_frequency:scan_frequency ->
  repository_filters:scanning_repository_filter_list ->
  unit ->
  registry_scanning_rule

val make_registry_scanning_configuration :
  ?scan_type:scan_type ->
  ?rules:registry_scanning_rule_list ->
  unit ->
  registry_scanning_configuration

val make_put_registry_scanning_configuration_response :
  ?registry_scanning_configuration:registry_scanning_configuration ->
  unit ->
  put_registry_scanning_configuration_response

val make_put_registry_scanning_configuration_request :
  ?scan_type:scan_type ->
  ?rules:registry_scanning_rule_list ->
  unit ->
  put_registry_scanning_configuration_request

val make_put_registry_policy_response :
  ?registry_id:registry_id ->
  ?policy_text:registry_policy_text ->
  unit ->
  put_registry_policy_response

val make_put_registry_policy_request :
  policy_text:registry_policy_text -> unit -> put_registry_policy_request

val make_put_lifecycle_policy_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  unit ->
  put_lifecycle_policy_response

val make_put_lifecycle_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  lifecycle_policy_text:lifecycle_policy_text ->
  unit ->
  put_lifecycle_policy_request

val make_put_image_tag_mutability_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_tag_mutability:image_tag_mutability ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  unit ->
  put_image_tag_mutability_response

val make_put_image_tag_mutability_request :
  ?registry_id:registry_id ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  repository_name:repository_name ->
  image_tag_mutability:image_tag_mutability ->
  unit ->
  put_image_tag_mutability_request

val make_image_scanning_configuration :
  ?scan_on_push:scan_on_push_flag -> unit -> image_scanning_configuration

val make_put_image_scanning_configuration_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_scanning_configuration:image_scanning_configuration ->
  unit ->
  put_image_scanning_configuration_response

val make_put_image_scanning_configuration_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  image_scanning_configuration:image_scanning_configuration ->
  unit ->
  put_image_scanning_configuration_request

val make_image :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?image_manifest:image_manifest ->
  ?image_manifest_media_type:media_type ->
  unit ->
  image

val make_put_image_response : ?image:image -> unit -> put_image_response

val make_put_image_request :
  ?registry_id:registry_id ->
  ?image_manifest_media_type:media_type ->
  ?image_tag:image_tag ->
  ?image_digest:image_digest ->
  repository_name:repository_name ->
  image_manifest:image_manifest ->
  unit ->
  put_image_request

val make_put_account_setting_response :
  ?name:account_setting_name -> ?value:account_setting_value -> unit -> put_account_setting_response

val make_put_account_setting_request :
  name:account_setting_name -> value:account_setting_value -> unit -> put_account_setting_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_pull_time_update_exclusions_response :
  ?pull_time_update_exclusions:pull_time_update_exclusion_list ->
  ?next_token:next_token ->
  unit ->
  list_pull_time_update_exclusions_response

val make_list_pull_time_update_exclusions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_pull_time_update_exclusions_request

val make_list_images_response :
  ?image_ids:image_identifier_list -> ?next_token:next_token -> unit -> list_images_response

val make_list_images_filter :
  ?tag_status:tag_status -> ?image_status:image_status_filter -> unit -> list_images_filter

val make_list_images_request :
  ?registry_id:registry_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:list_images_filter ->
  repository_name:repository_name ->
  unit ->
  list_images_request

val make_image_referrer :
  ?artifact_type:artifact_type ->
  ?annotations:annotations ->
  ?artifact_status:artifact_status ->
  digest:image_digest ->
  media_type:media_type ->
  size:image_size_in_bytes ->
  unit ->
  image_referrer

val make_list_image_referrers_response :
  ?referrers:image_referrer_list -> ?next_token:next_token -> unit -> list_image_referrers_response

val make_list_image_referrers_filter :
  ?artifact_types:artifact_type_list ->
  ?artifact_status:artifact_status_filter ->
  unit ->
  list_image_referrers_filter

val make_subject_identifier : image_digest:image_digest -> unit -> subject_identifier

val make_list_image_referrers_request :
  ?registry_id:registry_id ->
  ?filter:list_image_referrers_filter ->
  ?next_token:next_token ->
  ?max_results:fifty_max_results ->
  repository_name:repository_name ->
  subject_id:subject_identifier ->
  unit ->
  list_image_referrers_request

val make_initiate_layer_upload_response :
  ?upload_id:upload_id -> ?part_size:part_size -> unit -> initiate_layer_upload_response

val make_initiate_layer_upload_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  initiate_layer_upload_request

val make_get_signing_configuration_response :
  ?registry_id:registry_id ->
  ?signing_configuration:signing_configuration ->
  unit ->
  get_signing_configuration_response

val make_get_signing_configuration_request : unit -> unit

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

val make_get_registry_scanning_configuration_response :
  ?registry_id:registry_id ->
  ?scanning_configuration:registry_scanning_configuration ->
  unit ->
  get_registry_scanning_configuration_response

val make_get_registry_scanning_configuration_request : unit -> unit

val make_get_registry_policy_response :
  ?registry_id:registry_id ->
  ?policy_text:registry_policy_text ->
  unit ->
  get_registry_policy_response

val make_get_registry_policy_request : unit -> unit

val make_transitioning_image_total_count :
  ?target_storage_class:lifecycle_policy_target_storage_class ->
  ?image_total_count:image_count ->
  unit ->
  transitioning_image_total_count

val make_lifecycle_policy_preview_summary :
  ?expiring_image_total_count:image_count ->
  ?transitioning_image_total_counts:transitioning_image_total_counts ->
  unit ->
  lifecycle_policy_preview_summary

val make_lifecycle_policy_rule_action :
  ?type_:image_action_type ->
  ?target_storage_class:lifecycle_policy_target_storage_class ->
  unit ->
  lifecycle_policy_rule_action

val make_get_lifecycle_policy_preview_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?status:lifecycle_policy_preview_status ->
  ?next_token:next_token ->
  ?preview_results:lifecycle_policy_preview_result_list ->
  ?summary:lifecycle_policy_preview_summary ->
  unit ->
  get_lifecycle_policy_preview_response

val make_lifecycle_policy_preview_filter :
  ?tag_status:tag_status -> unit -> lifecycle_policy_preview_filter

val make_get_lifecycle_policy_preview_request :
  ?registry_id:registry_id ->
  ?image_ids:image_identifier_list ->
  ?next_token:next_token ->
  ?max_results:lifecycle_preview_max_results ->
  ?filter:lifecycle_policy_preview_filter ->
  repository_name:repository_name ->
  unit ->
  get_lifecycle_policy_preview_request

val make_get_lifecycle_policy_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?last_evaluated_at:evaluation_timestamp ->
  unit ->
  get_lifecycle_policy_response

val make_get_lifecycle_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_lifecycle_policy_request

val make_get_download_url_for_layer_response :
  ?download_url:url -> ?layer_digest:layer_digest -> unit -> get_download_url_for_layer_response

val make_get_download_url_for_layer_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  layer_digest:layer_digest ->
  unit ->
  get_download_url_for_layer_request

val make_authorization_data :
  ?authorization_token:base64 ->
  ?expires_at:expiration_timestamp ->
  ?proxy_endpoint:proxy_endpoint ->
  unit ->
  authorization_data

val make_get_authorization_token_response :
  ?authorization_data:authorization_data_list -> unit -> get_authorization_token_response

val make_get_authorization_token_request :
  ?registry_ids:get_authorization_token_registry_id_list -> unit -> get_authorization_token_request

val make_get_account_setting_response :
  ?name:account_setting_name -> ?value:account_setting_name -> unit -> get_account_setting_response

val make_get_account_setting_request :
  name:account_setting_name -> unit -> get_account_setting_request

val make_describe_repository_creation_templates_response :
  ?registry_id:registry_id ->
  ?repository_creation_templates:repository_creation_template_list ->
  ?next_token:next_token ->
  unit ->
  describe_repository_creation_templates_response

val make_describe_repository_creation_templates_request :
  ?prefixes:prefix_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_repository_creation_templates_request

val make_encryption_configuration :
  ?kms_key:kms_key -> encryption_type:encryption_type -> unit -> encryption_configuration

val make_repository :
  ?repository_arn:arn ->
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?repository_uri:url ->
  ?created_at:creation_timestamp ->
  ?image_tag_mutability:image_tag_mutability ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_scanning_configuration:image_scanning_configuration ->
  ?encryption_configuration:encryption_configuration ->
  unit ->
  repository

val make_describe_repositories_response :
  ?repositories:repository_list -> ?next_token:next_token -> unit -> describe_repositories_response

val make_describe_repositories_request :
  ?registry_id:registry_id ->
  ?repository_names:repository_name_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_repositories_request

val make_describe_registry_response :
  ?registry_id:registry_id ->
  ?replication_configuration:replication_configuration ->
  unit ->
  describe_registry_response

val make_describe_registry_request : unit -> unit

val make_pull_through_cache_rule :
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?upstream_registry_url:url ->
  ?created_at:creation_timestamp ->
  ?registry_id:registry_id ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?upstream_registry:upstream_registry ->
  ?updated_at:updated_timestamp ->
  unit ->
  pull_through_cache_rule

val make_describe_pull_through_cache_rules_response :
  ?pull_through_cache_rules:pull_through_cache_rule_list ->
  ?next_token:next_token ->
  unit ->
  describe_pull_through_cache_rules_response

val make_describe_pull_through_cache_rules_request :
  ?registry_id:registry_id ->
  ?ecr_repository_prefixes:pull_through_cache_rule_repository_prefix_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_pull_through_cache_rules_request

val make_image_signing_status :
  ?signing_profile_arn:signing_profile_arn ->
  ?failure_code:signing_status_failure_code ->
  ?failure_reason:signing_status_failure_reason ->
  ?status:signing_status ->
  unit ->
  image_signing_status

val make_describe_image_signing_status_response :
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?registry_id:registry_id ->
  ?signing_statuses:image_signing_status_list ->
  unit ->
  describe_image_signing_status_response

val make_describe_image_signing_status_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  image_id:image_identifier ->
  unit ->
  describe_image_signing_status_request

val make_cvss_score_adjustment : ?metric:metric -> ?reason:reason -> unit -> cvss_score_adjustment

val make_cvss_score_details :
  ?adjustments:cvss_score_adjustment_list ->
  ?score:score ->
  ?score_source:source ->
  ?scoring_vector:scoring_vector ->
  ?version:version ->
  unit ->
  cvss_score_details

val make_score_details : ?cvss:cvss_score_details -> unit -> score_details

val make_aws_ecr_container_image_details :
  ?architecture:arch ->
  ?author:author ->
  ?image_hash:image_digest ->
  ?image_tags:image_tags_list ->
  ?platform:platform ->
  ?pushed_at:date ->
  ?last_in_use_at:date ->
  ?in_use_count:in_use_count ->
  ?registry:registry_id ->
  ?repository_name:repository_name ->
  unit ->
  aws_ecr_container_image_details

val make_resource_details :
  ?aws_ecr_container_image:aws_ecr_container_image_details -> unit -> resource_details

val make_resource :
  ?details:resource_details -> ?id:resource_id -> ?tags:tags -> ?type_:type_ -> unit -> resource

val make_recommendation : ?url:url -> ?text:recommendation_text -> unit -> recommendation
val make_remediation : ?recommendation:recommendation -> unit -> remediation

val make_vulnerable_package :
  ?arch:arch ->
  ?epoch:epoch ->
  ?file_path:file_path ->
  ?name:vulnerable_package_name ->
  ?package_manager:package_manager ->
  ?release:release ->
  ?source_layer_hash:source_layer_hash ->
  ?version:version ->
  ?fixed_in_version:fixed_in_version ->
  unit ->
  vulnerable_package

val make_cvss_score :
  ?base_score:base_score ->
  ?scoring_vector:scoring_vector ->
  ?source:source ->
  ?version:version ->
  unit ->
  cvss_score

val make_package_vulnerability_details :
  ?cvss:cvss_score_list ->
  ?reference_urls:reference_urls_list ->
  ?related_vulnerabilities:related_vulnerabilities_list ->
  ?source:source ->
  ?source_url:url ->
  ?vendor_created_at:date ->
  ?vendor_severity:severity ->
  ?vendor_updated_at:date ->
  ?vulnerability_id:vulnerability_id ->
  ?vulnerable_packages:vulnerable_packages_list ->
  unit ->
  package_vulnerability_details

val make_enhanced_image_scan_finding :
  ?aws_account_id:registry_id ->
  ?description:finding_description ->
  ?finding_arn:finding_arn ->
  ?first_observed_at:date ->
  ?last_observed_at:date ->
  ?package_vulnerability_details:package_vulnerability_details ->
  ?remediation:remediation ->
  ?resources:resource_list ->
  ?score:score ->
  ?score_details:score_details ->
  ?severity:severity ->
  ?status:status ->
  ?title:title ->
  ?type_:type_ ->
  ?updated_at:date ->
  ?fix_available:fix_available ->
  ?exploit_available:exploit_available ->
  unit ->
  enhanced_image_scan_finding

val make_attribute : ?value:attribute_value -> key:attribute_key -> unit -> attribute

val make_image_scan_finding :
  ?name:finding_name ->
  ?description:finding_description ->
  ?uri:url ->
  ?severity:finding_severity ->
  ?attributes:attribute_list ->
  unit ->
  image_scan_finding

val make_image_scan_findings :
  ?image_scan_completed_at:scan_timestamp ->
  ?vulnerability_source_updated_at:vulnerability_source_update_timestamp ->
  ?finding_severity_counts:finding_severity_counts ->
  ?findings:image_scan_finding_list ->
  ?enhanced_findings:enhanced_image_scan_finding_list ->
  unit ->
  image_scan_findings

val make_describe_image_scan_findings_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?image_scan_status:image_scan_status ->
  ?image_scan_findings:image_scan_findings ->
  ?next_token:next_token ->
  unit ->
  describe_image_scan_findings_response

val make_describe_image_scan_findings_request :
  ?registry_id:registry_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  repository_name:repository_name ->
  image_id:image_identifier ->
  unit ->
  describe_image_scan_findings_request

val make_image_scan_findings_summary :
  ?image_scan_completed_at:scan_timestamp ->
  ?vulnerability_source_updated_at:vulnerability_source_update_timestamp ->
  ?finding_severity_counts:finding_severity_counts ->
  unit ->
  image_scan_findings_summary

val make_image_detail :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?image_digest:image_digest ->
  ?image_tags:image_tag_list ->
  ?image_size_in_bytes:image_size_in_bytes ->
  ?image_pushed_at:push_timestamp ->
  ?image_scan_status:image_scan_status ->
  ?image_scan_findings_summary:image_scan_findings_summary ->
  ?image_manifest_media_type:media_type ->
  ?artifact_media_type:media_type ->
  ?last_recorded_pull_time:recorded_pull_timestamp ->
  ?subject_manifest_digest:image_digest ->
  ?image_status:image_status ->
  ?last_archived_at:last_archived_at_timestamp ->
  ?last_activated_at:last_activated_at_timestamp ->
  unit ->
  image_detail

val make_describe_images_response :
  ?image_details:image_detail_list -> ?next_token:next_token -> unit -> describe_images_response

val make_describe_images_filter :
  ?tag_status:tag_status -> ?image_status:image_status_filter -> unit -> describe_images_filter

val make_describe_images_request :
  ?registry_id:registry_id ->
  ?image_ids:image_identifier_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:describe_images_filter ->
  repository_name:repository_name ->
  unit ->
  describe_images_request

val make_image_replication_status :
  ?region:region ->
  ?registry_id:registry_id ->
  ?status:replication_status ->
  ?failure_code:replication_error ->
  unit ->
  image_replication_status

val make_describe_image_replication_status_response :
  ?repository_name:repository_name ->
  ?image_id:image_identifier ->
  ?replication_statuses:image_replication_status_list ->
  unit ->
  describe_image_replication_status_response

val make_describe_image_replication_status_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  image_id:image_identifier ->
  unit ->
  describe_image_replication_status_request

val make_deregister_pull_time_update_exclusion_response :
  ?principal_arn:principal_arn -> unit -> deregister_pull_time_update_exclusion_response

val make_deregister_pull_time_update_exclusion_request :
  principal_arn:principal_arn -> unit -> deregister_pull_time_update_exclusion_request

val make_delete_signing_configuration_response :
  ?registry_id:registry_id ->
  ?signing_configuration:signing_configuration ->
  unit ->
  delete_signing_configuration_response

val make_delete_signing_configuration_request : unit -> unit

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

val make_delete_repository_creation_template_response :
  ?registry_id:registry_id ->
  ?repository_creation_template:repository_creation_template ->
  unit ->
  delete_repository_creation_template_response

val make_delete_repository_creation_template_request :
  prefix:prefix -> unit -> delete_repository_creation_template_request

val make_delete_repository_response : ?repository:repository -> unit -> delete_repository_response

val make_delete_repository_request :
  ?registry_id:registry_id ->
  ?force:force_flag ->
  repository_name:repository_name ->
  unit ->
  delete_repository_request

val make_delete_registry_policy_response :
  ?registry_id:registry_id ->
  ?policy_text:registry_policy_text ->
  unit ->
  delete_registry_policy_response

val make_delete_registry_policy_request : unit -> unit

val make_delete_pull_through_cache_rule_response :
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?upstream_registry_url:url ->
  ?created_at:creation_timestamp ->
  ?registry_id:registry_id ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  delete_pull_through_cache_rule_response

val make_delete_pull_through_cache_rule_request :
  ?registry_id:registry_id ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  delete_pull_through_cache_rule_request

val make_delete_lifecycle_policy_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?last_evaluated_at:evaluation_timestamp ->
  unit ->
  delete_lifecycle_policy_response

val make_delete_lifecycle_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  delete_lifecycle_policy_request

val make_create_repository_creation_template_response :
  ?registry_id:registry_id ->
  ?repository_creation_template:repository_creation_template ->
  unit ->
  create_repository_creation_template_response

val make_create_repository_creation_template_request :
  ?description:repository_template_description ->
  ?encryption_configuration:encryption_configuration_for_repository_creation_template ->
  ?resource_tags:tag_list ->
  ?image_tag_mutability:image_tag_mutability ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?repository_policy:repository_policy_text ->
  ?lifecycle_policy:lifecycle_policy_text_for_repository_creation_template ->
  ?custom_role_arn:custom_role_arn ->
  prefix:prefix ->
  applied_for:rct_applied_for_list ->
  unit ->
  create_repository_creation_template_request

val make_create_repository_response : ?repository:repository -> unit -> create_repository_response

val make_create_repository_request :
  ?registry_id:registry_id ->
  ?tags:tag_list ->
  ?image_tag_mutability:image_tag_mutability ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_scanning_configuration:image_scanning_configuration ->
  ?encryption_configuration:encryption_configuration ->
  repository_name:repository_name ->
  unit ->
  create_repository_request

val make_create_pull_through_cache_rule_response :
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?upstream_registry_url:url ->
  ?created_at:creation_timestamp ->
  ?registry_id:registry_id ->
  ?upstream_registry:upstream_registry ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  create_pull_through_cache_rule_response

val make_create_pull_through_cache_rule_request :
  ?registry_id:registry_id ->
  ?upstream_registry:upstream_registry ->
  ?credential_arn:credential_arn ->
  ?custom_role_arn:custom_role_arn ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  upstream_registry_url:url ->
  unit ->
  create_pull_through_cache_rule_request

val make_complete_layer_upload_response :
  ?registry_id:registry_id ->
  ?repository_name:repository_name ->
  ?upload_id:upload_id ->
  ?layer_digest:layer_digest ->
  unit ->
  complete_layer_upload_response

val make_complete_layer_upload_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  upload_id:upload_id ->
  layer_digests:layer_digest_list ->
  unit ->
  complete_layer_upload_request

val make_repository_scanning_configuration_failure :
  ?repository_name:repository_name ->
  ?failure_code:scanning_configuration_failure_code ->
  ?failure_reason:scanning_configuration_failure_reason ->
  unit ->
  repository_scanning_configuration_failure

val make_repository_scanning_configuration :
  ?repository_arn:arn ->
  ?repository_name:repository_name ->
  ?scan_on_push:scan_on_push_flag ->
  ?scan_frequency:scan_frequency ->
  ?applied_scan_filters:scanning_repository_filter_list ->
  unit ->
  repository_scanning_configuration

val make_batch_get_repository_scanning_configuration_response :
  ?scanning_configurations:repository_scanning_configuration_list ->
  ?failures:repository_scanning_configuration_failure_list ->
  unit ->
  batch_get_repository_scanning_configuration_response

val make_batch_get_repository_scanning_configuration_request :
  repository_names:scanning_configuration_repository_name_list ->
  unit ->
  batch_get_repository_scanning_configuration_request

val make_image_failure :
  ?image_id:image_identifier ->
  ?failure_code:image_failure_code ->
  ?failure_reason:image_failure_reason ->
  unit ->
  image_failure

val make_batch_get_image_response :
  ?images:image_list -> ?failures:image_failure_list -> unit -> batch_get_image_response

val make_batch_get_image_request :
  ?registry_id:registry_id ->
  ?accepted_media_types:media_type_list ->
  repository_name:repository_name ->
  image_ids:image_identifier_list ->
  unit ->
  batch_get_image_request

val make_batch_delete_image_response :
  ?image_ids:image_identifier_list ->
  ?failures:image_failure_list ->
  unit ->
  batch_delete_image_response

val make_batch_delete_image_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  image_ids:image_identifier_list ->
  unit ->
  batch_delete_image_request

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
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  layer_digests:batched_operation_layer_digest_list ->
  unit ->
  batch_check_layer_availability_request
