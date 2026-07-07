open Types

val make_vulnerable_package :
  ?fixed_in_version:fixed_in_version ->
  ?version:version ->
  ?source_layer_hash:source_layer_hash ->
  ?release:release ->
  ?package_manager:package_manager ->
  ?name:vulnerable_package_name ->
  ?file_path:file_path ->
  ?epoch:epoch ->
  ?arch:arch ->
  unit ->
  vulnerable_package

val make_validate_pull_through_cache_rule_response :
  ?failure:ptc_validate_failure ->
  ?is_valid:is_ptc_rule_valid ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?upstream_registry_url:url ->
  ?registry_id:registry_id ->
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  validate_pull_through_cache_rule_response

val make_validate_pull_through_cache_rule_request :
  ?registry_id:registry_id ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  validate_pull_through_cache_rule_request

val make_upload_layer_part_response :
  ?last_byte_received:part_size ->
  ?upload_id:upload_id ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  upload_layer_part_response

val make_upload_layer_part_request :
  ?registry_id:registry_id ->
  layer_part_blob:layer_part_blob ->
  part_last_byte:part_size ->
  part_first_byte:part_size ->
  upload_id:upload_id ->
  repository_name:repository_name ->
  unit ->
  upload_layer_part_request

val make_encryption_configuration_for_repository_creation_template :
  ?kms_key:kms_key_for_repository_creation_template ->
  encryption_type:encryption_type ->
  unit ->
  encryption_configuration_for_repository_creation_template

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_image_tag_mutability_exclusion_filter :
  filter:image_tag_mutability_exclusion_filter_value ->
  filter_type:image_tag_mutability_exclusion_filter_type ->
  unit ->
  image_tag_mutability_exclusion_filter

val make_repository_creation_template :
  ?updated_at:date ->
  ?created_at:date ->
  ?custom_role_arn:custom_role_arn ->
  ?applied_for:rct_applied_for_list ->
  ?lifecycle_policy:lifecycle_policy_text_for_repository_creation_template ->
  ?repository_policy:repository_policy_text ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_tag_mutability:image_tag_mutability ->
  ?resource_tags:tag_list ->
  ?encryption_configuration:encryption_configuration_for_repository_creation_template ->
  ?description:repository_template_description ->
  ?prefix:prefix ->
  unit ->
  repository_creation_template

val make_update_repository_creation_template_response :
  ?repository_creation_template:repository_creation_template ->
  ?registry_id:registry_id ->
  unit ->
  update_repository_creation_template_response

val make_update_repository_creation_template_request :
  ?custom_role_arn:custom_role_arn ->
  ?applied_for:rct_applied_for_list ->
  ?lifecycle_policy:lifecycle_policy_text_for_repository_creation_template ->
  ?repository_policy:repository_policy_text ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_tag_mutability:image_tag_mutability ->
  ?resource_tags:tag_list ->
  ?encryption_configuration:encryption_configuration_for_repository_creation_template ->
  ?description:repository_template_description ->
  prefix:prefix ->
  unit ->
  update_repository_creation_template_request

val make_update_pull_through_cache_rule_response :
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?updated_at:updated_timestamp ->
  ?registry_id:registry_id ->
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  update_pull_through_cache_rule_response

val make_update_pull_through_cache_rule_request :
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?registry_id:registry_id ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  update_pull_through_cache_rule_request

val make_image_identifier :
  ?image_tag:image_tag -> ?image_digest:image_digest -> unit -> image_identifier

val make_update_image_storage_class_response :
  ?image_status:image_status ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  update_image_storage_class_response

val make_update_image_storage_class_request :
  ?registry_id:registry_id ->
  target_storage_class:target_storage_class ->
  image_id:image_identifier ->
  repository_name:repository_name ->
  unit ->
  update_image_storage_class_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_transitioning_image_total_count :
  ?image_total_count:image_count ->
  ?target_storage_class:lifecycle_policy_target_storage_class ->
  unit ->
  transitioning_image_total_count

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tag_list -> resource_arn:arn -> unit -> tag_resource_request
val make_subject_identifier : image_digest:image_digest -> unit -> subject_identifier

val make_start_lifecycle_policy_preview_response :
  ?status:lifecycle_policy_preview_status ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  start_lifecycle_policy_preview_response

val make_start_lifecycle_policy_preview_request :
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  start_lifecycle_policy_preview_request

val make_image_scan_status :
  ?description:scan_status_description -> ?status:scan_status -> unit -> image_scan_status

val make_start_image_scan_response :
  ?image_scan_status:image_scan_status ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  start_image_scan_response

val make_start_image_scan_request :
  ?registry_id:registry_id ->
  image_id:image_identifier ->
  repository_name:repository_name ->
  unit ->
  start_image_scan_request

val make_signing_repository_filter :
  filter_type:signing_repository_filter_type ->
  filter:signing_repository_filter_value ->
  unit ->
  signing_repository_filter

val make_signing_rule :
  ?repository_filters:signing_repository_filter_list ->
  signing_profile_arn:signing_profile_arn ->
  unit ->
  signing_rule

val make_signing_configuration : rules:signing_rule_list -> unit -> signing_configuration

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

val make_cvss_score_adjustment : ?reason:reason -> ?metric:metric -> unit -> cvss_score_adjustment

val make_cvss_score_details :
  ?version:version ->
  ?scoring_vector:scoring_vector ->
  ?score_source:source ->
  ?score:score ->
  ?adjustments:cvss_score_adjustment_list ->
  unit ->
  cvss_score_details

val make_score_details : ?cvss:cvss_score_details -> unit -> score_details

val make_scanning_repository_filter :
  filter_type:scanning_repository_filter_type ->
  filter:scanning_repository_filter_value ->
  unit ->
  scanning_repository_filter

val make_aws_ecr_container_image_details :
  ?repository_name:repository_name ->
  ?registry:registry_id ->
  ?in_use_count:in_use_count ->
  ?last_in_use_at:date ->
  ?pushed_at:date ->
  ?platform:platform ->
  ?image_tags:image_tags_list ->
  ?image_hash:image_digest ->
  ?author:author ->
  ?architecture:arch ->
  unit ->
  aws_ecr_container_image_details

val make_resource_details :
  ?aws_ecr_container_image:aws_ecr_container_image_details -> unit -> resource_details

val make_resource :
  ?type_:type_ -> ?tags:tags -> ?id:resource_id -> ?details:resource_details -> unit -> resource

val make_repository_scanning_configuration :
  ?applied_scan_filters:scanning_repository_filter_list ->
  ?scan_frequency:scan_frequency ->
  ?scan_on_push:scan_on_push_flag ->
  ?repository_name:repository_name ->
  ?repository_arn:arn ->
  unit ->
  repository_scanning_configuration

val make_repository_scanning_configuration_failure :
  ?failure_reason:scanning_configuration_failure_reason ->
  ?failure_code:scanning_configuration_failure_code ->
  ?repository_name:repository_name ->
  unit ->
  repository_scanning_configuration_failure

val make_image_scanning_configuration :
  ?scan_on_push:scan_on_push_flag -> unit -> image_scanning_configuration

val make_encryption_configuration :
  ?kms_key:kms_key -> encryption_type:encryption_type -> unit -> encryption_configuration

val make_repository :
  ?encryption_configuration:encryption_configuration ->
  ?image_scanning_configuration:image_scanning_configuration ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_tag_mutability:image_tag_mutability ->
  ?created_at:creation_timestamp ->
  ?repository_uri:url ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  ?repository_arn:arn ->
  unit ->
  repository

val make_repository_filter :
  filter_type:repository_filter_type -> filter:repository_filter_value -> unit -> repository_filter

val make_replication_destination :
  registry_id:registry_id -> region:region -> unit -> replication_destination

val make_replication_rule :
  ?repository_filters:repository_filter_list ->
  destinations:replication_destination_list ->
  unit ->
  replication_rule

val make_replication_configuration :
  rules:replication_rule_list -> unit -> replication_configuration

val make_recommendation : ?text:recommendation_text -> ?url:url -> unit -> recommendation
val make_remediation : ?recommendation:recommendation -> unit -> remediation

val make_registry_scanning_rule :
  repository_filters:scanning_repository_filter_list ->
  scan_frequency:scan_frequency ->
  unit ->
  registry_scanning_rule

val make_registry_scanning_configuration :
  ?rules:registry_scanning_rule_list ->
  ?scan_type:scan_type ->
  unit ->
  registry_scanning_configuration

val make_register_pull_time_update_exclusion_response :
  ?created_at:creation_timestamp ->
  ?principal_arn:principal_arn ->
  unit ->
  register_pull_time_update_exclusion_response

val make_register_pull_time_update_exclusion_request :
  principal_arn:principal_arn -> unit -> register_pull_time_update_exclusion_request

val make_put_signing_configuration_response :
  ?signing_configuration:signing_configuration -> unit -> put_signing_configuration_response

val make_put_signing_configuration_request :
  signing_configuration:signing_configuration -> unit -> put_signing_configuration_request

val make_put_replication_configuration_response :
  ?replication_configuration:replication_configuration ->
  unit ->
  put_replication_configuration_response

val make_put_replication_configuration_request :
  replication_configuration:replication_configuration ->
  unit ->
  put_replication_configuration_request

val make_put_registry_scanning_configuration_response :
  ?registry_scanning_configuration:registry_scanning_configuration ->
  unit ->
  put_registry_scanning_configuration_response

val make_put_registry_scanning_configuration_request :
  ?rules:registry_scanning_rule_list ->
  ?scan_type:scan_type ->
  unit ->
  put_registry_scanning_configuration_request

val make_put_registry_policy_response :
  ?policy_text:registry_policy_text ->
  ?registry_id:registry_id ->
  unit ->
  put_registry_policy_response

val make_put_registry_policy_request :
  policy_text:registry_policy_text -> unit -> put_registry_policy_request

val make_put_lifecycle_policy_response :
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  put_lifecycle_policy_response

val make_put_lifecycle_policy_request :
  ?registry_id:registry_id ->
  lifecycle_policy_text:lifecycle_policy_text ->
  repository_name:repository_name ->
  unit ->
  put_lifecycle_policy_request

val make_put_image_tag_mutability_response :
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_tag_mutability:image_tag_mutability ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  put_image_tag_mutability_response

val make_put_image_tag_mutability_request :
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?registry_id:registry_id ->
  image_tag_mutability:image_tag_mutability ->
  repository_name:repository_name ->
  unit ->
  put_image_tag_mutability_request

val make_put_image_scanning_configuration_response :
  ?image_scanning_configuration:image_scanning_configuration ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  put_image_scanning_configuration_response

val make_put_image_scanning_configuration_request :
  ?registry_id:registry_id ->
  image_scanning_configuration:image_scanning_configuration ->
  repository_name:repository_name ->
  unit ->
  put_image_scanning_configuration_request

val make_image :
  ?image_manifest_media_type:media_type ->
  ?image_manifest:image_manifest ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  image

val make_put_image_response : ?image:image -> unit -> put_image_response

val make_put_image_request :
  ?image_digest:image_digest ->
  ?image_tag:image_tag ->
  ?image_manifest_media_type:media_type ->
  ?registry_id:registry_id ->
  image_manifest:image_manifest ->
  repository_name:repository_name ->
  unit ->
  put_image_request

val make_put_account_setting_response :
  ?value:account_setting_value -> ?name:account_setting_name -> unit -> put_account_setting_response

val make_put_account_setting_request :
  value:account_setting_value -> name:account_setting_name -> unit -> put_account_setting_request

val make_pull_through_cache_rule :
  ?updated_at:updated_timestamp ->
  ?upstream_registry:upstream_registry ->
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?registry_id:registry_id ->
  ?created_at:creation_timestamp ->
  ?upstream_registry_url:url ->
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  pull_through_cache_rule

val make_cvss_score :
  ?version:version ->
  ?source:source ->
  ?scoring_vector:scoring_vector ->
  ?base_score:base_score ->
  unit ->
  cvss_score

val make_package_vulnerability_details :
  ?vulnerable_packages:vulnerable_packages_list ->
  ?vulnerability_id:vulnerability_id ->
  ?vendor_updated_at:date ->
  ?vendor_severity:severity ->
  ?vendor_created_at:date ->
  ?source_url:url ->
  ?source:source ->
  ?related_vulnerabilities:related_vulnerabilities_list ->
  ?reference_urls:reference_urls_list ->
  ?cvss:cvss_score_list ->
  unit ->
  package_vulnerability_details

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_pull_time_update_exclusions_response :
  ?next_token:next_token ->
  ?pull_time_update_exclusions:pull_time_update_exclusion_list ->
  unit ->
  list_pull_time_update_exclusions_response

val make_list_pull_time_update_exclusions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_pull_time_update_exclusions_request

val make_list_images_response :
  ?next_token:next_token -> ?image_ids:image_identifier_list -> unit -> list_images_response

val make_list_images_filter :
  ?image_status:image_status_filter -> ?tag_status:tag_status -> unit -> list_images_filter

val make_list_images_request :
  ?filter:list_images_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  list_images_request

val make_image_referrer :
  ?artifact_status:artifact_status ->
  ?annotations:annotations ->
  ?artifact_type:artifact_type ->
  size:image_size_in_bytes ->
  media_type:media_type ->
  digest:image_digest ->
  unit ->
  image_referrer

val make_list_image_referrers_response :
  ?next_token:next_token -> ?referrers:image_referrer_list -> unit -> list_image_referrers_response

val make_list_image_referrers_filter :
  ?artifact_status:artifact_status_filter ->
  ?artifact_types:artifact_type_list ->
  unit ->
  list_image_referrers_filter

val make_list_image_referrers_request :
  ?max_results:fifty_max_results ->
  ?next_token:next_token ->
  ?filter:list_image_referrers_filter ->
  ?registry_id:registry_id ->
  subject_id:subject_identifier ->
  repository_name:repository_name ->
  unit ->
  list_image_referrers_request

val make_lifecycle_policy_rule_action :
  ?target_storage_class:lifecycle_policy_target_storage_class ->
  ?type_:image_action_type ->
  unit ->
  lifecycle_policy_rule_action

val make_lifecycle_policy_preview_summary :
  ?transitioning_image_total_counts:transitioning_image_total_counts ->
  ?expiring_image_total_count:image_count ->
  unit ->
  lifecycle_policy_preview_summary

val make_lifecycle_policy_preview_filter :
  ?tag_status:tag_status -> unit -> lifecycle_policy_preview_filter

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

val make_initiate_layer_upload_response :
  ?part_size:part_size -> ?upload_id:upload_id -> unit -> initiate_layer_upload_response

val make_initiate_layer_upload_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  initiate_layer_upload_request

val make_image_signing_status :
  ?status:signing_status ->
  ?failure_reason:signing_status_failure_reason ->
  ?failure_code:signing_status_failure_code ->
  ?signing_profile_arn:signing_profile_arn ->
  unit ->
  image_signing_status

val make_image_scan_findings_summary :
  ?finding_severity_counts:finding_severity_counts ->
  ?vulnerability_source_updated_at:vulnerability_source_update_timestamp ->
  ?image_scan_completed_at:scan_timestamp ->
  unit ->
  image_scan_findings_summary

val make_attribute : ?value:attribute_value -> key:attribute_key -> unit -> attribute

val make_image_scan_finding :
  ?attributes:attribute_list ->
  ?severity:finding_severity ->
  ?uri:url ->
  ?description:finding_description ->
  ?name:finding_name ->
  unit ->
  image_scan_finding

val make_enhanced_image_scan_finding :
  ?exploit_available:exploit_available ->
  ?fix_available:fix_available ->
  ?updated_at:date ->
  ?type_:type_ ->
  ?title:title ->
  ?status:status ->
  ?severity:severity ->
  ?score_details:score_details ->
  ?score:score ->
  ?resources:resource_list ->
  ?remediation:remediation ->
  ?package_vulnerability_details:package_vulnerability_details ->
  ?last_observed_at:date ->
  ?first_observed_at:date ->
  ?finding_arn:finding_arn ->
  ?description:finding_description ->
  ?aws_account_id:registry_id ->
  unit ->
  enhanced_image_scan_finding

val make_image_scan_findings :
  ?enhanced_findings:enhanced_image_scan_finding_list ->
  ?findings:image_scan_finding_list ->
  ?finding_severity_counts:finding_severity_counts ->
  ?vulnerability_source_updated_at:vulnerability_source_update_timestamp ->
  ?image_scan_completed_at:scan_timestamp ->
  unit ->
  image_scan_findings

val make_image_replication_status :
  ?failure_code:replication_error ->
  ?status:replication_status ->
  ?registry_id:registry_id ->
  ?region:region ->
  unit ->
  image_replication_status

val make_image_failure :
  ?failure_reason:image_failure_reason ->
  ?failure_code:image_failure_code ->
  ?image_id:image_identifier ->
  unit ->
  image_failure

val make_image_detail :
  ?last_activated_at:last_activated_at_timestamp ->
  ?last_archived_at:last_archived_at_timestamp ->
  ?image_status:image_status ->
  ?subject_manifest_digest:image_digest ->
  ?last_recorded_pull_time:recorded_pull_timestamp ->
  ?artifact_media_type:media_type ->
  ?image_manifest_media_type:media_type ->
  ?image_scan_findings_summary:image_scan_findings_summary ->
  ?image_scan_status:image_scan_status ->
  ?image_pushed_at:push_timestamp ->
  ?image_size_in_bytes:image_size_in_bytes ->
  ?image_tags:image_tag_list ->
  ?image_digest:image_digest ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  image_detail

val make_get_signing_configuration_response :
  ?signing_configuration:signing_configuration ->
  ?registry_id:registry_id ->
  unit ->
  get_signing_configuration_response

val make_get_signing_configuration_request : unit -> unit

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

val make_get_registry_scanning_configuration_response :
  ?scanning_configuration:registry_scanning_configuration ->
  ?registry_id:registry_id ->
  unit ->
  get_registry_scanning_configuration_response

val make_get_registry_scanning_configuration_request : unit -> unit

val make_get_registry_policy_response :
  ?policy_text:registry_policy_text ->
  ?registry_id:registry_id ->
  unit ->
  get_registry_policy_response

val make_get_registry_policy_request : unit -> unit

val make_get_lifecycle_policy_response :
  ?last_evaluated_at:evaluation_timestamp ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  get_lifecycle_policy_response

val make_get_lifecycle_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_lifecycle_policy_request

val make_get_lifecycle_policy_preview_response :
  ?summary:lifecycle_policy_preview_summary ->
  ?preview_results:lifecycle_policy_preview_result_list ->
  ?next_token:next_token ->
  ?status:lifecycle_policy_preview_status ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  get_lifecycle_policy_preview_response

val make_get_lifecycle_policy_preview_request :
  ?filter:lifecycle_policy_preview_filter ->
  ?max_results:lifecycle_preview_max_results ->
  ?next_token:next_token ->
  ?image_ids:image_identifier_list ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  get_lifecycle_policy_preview_request

val make_get_download_url_for_layer_response :
  ?layer_digest:layer_digest -> ?download_url:url -> unit -> get_download_url_for_layer_response

val make_get_download_url_for_layer_request :
  ?registry_id:registry_id ->
  layer_digest:layer_digest ->
  repository_name:repository_name ->
  unit ->
  get_download_url_for_layer_request

val make_authorization_data :
  ?proxy_endpoint:proxy_endpoint ->
  ?expires_at:expiration_timestamp ->
  ?authorization_token:base64 ->
  unit ->
  authorization_data

val make_get_authorization_token_response :
  ?authorization_data:authorization_data_list -> unit -> get_authorization_token_response

val make_get_authorization_token_request :
  ?registry_ids:get_authorization_token_registry_id_list -> unit -> get_authorization_token_request

val make_get_account_setting_response :
  ?value:account_setting_name -> ?name:account_setting_name -> unit -> get_account_setting_response

val make_get_account_setting_request :
  name:account_setting_name -> unit -> get_account_setting_request

val make_describe_repository_creation_templates_response :
  ?next_token:next_token ->
  ?repository_creation_templates:repository_creation_template_list ->
  ?registry_id:registry_id ->
  unit ->
  describe_repository_creation_templates_response

val make_describe_repository_creation_templates_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?prefixes:prefix_list ->
  unit ->
  describe_repository_creation_templates_request

val make_describe_repositories_response :
  ?next_token:next_token -> ?repositories:repository_list -> unit -> describe_repositories_response

val make_describe_repositories_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?repository_names:repository_name_list ->
  ?registry_id:registry_id ->
  unit ->
  describe_repositories_request

val make_describe_registry_response :
  ?replication_configuration:replication_configuration ->
  ?registry_id:registry_id ->
  unit ->
  describe_registry_response

val make_describe_registry_request : unit -> unit

val make_describe_pull_through_cache_rules_response :
  ?next_token:next_token ->
  ?pull_through_cache_rules:pull_through_cache_rule_list ->
  unit ->
  describe_pull_through_cache_rules_response

val make_describe_pull_through_cache_rules_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?ecr_repository_prefixes:pull_through_cache_rule_repository_prefix_list ->
  ?registry_id:registry_id ->
  unit ->
  describe_pull_through_cache_rules_request

val make_describe_images_response :
  ?next_token:next_token -> ?image_details:image_detail_list -> unit -> describe_images_response

val make_describe_images_filter :
  ?image_status:image_status_filter -> ?tag_status:tag_status -> unit -> describe_images_filter

val make_describe_images_request :
  ?filter:describe_images_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?image_ids:image_identifier_list ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  describe_images_request

val make_describe_image_signing_status_response :
  ?signing_statuses:image_signing_status_list ->
  ?registry_id:registry_id ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  unit ->
  describe_image_signing_status_response

val make_describe_image_signing_status_request :
  ?registry_id:registry_id ->
  image_id:image_identifier ->
  repository_name:repository_name ->
  unit ->
  describe_image_signing_status_request

val make_describe_image_scan_findings_response :
  ?next_token:next_token ->
  ?image_scan_findings:image_scan_findings ->
  ?image_scan_status:image_scan_status ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  describe_image_scan_findings_response

val make_describe_image_scan_findings_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?registry_id:registry_id ->
  image_id:image_identifier ->
  repository_name:repository_name ->
  unit ->
  describe_image_scan_findings_request

val make_describe_image_replication_status_response :
  ?replication_statuses:image_replication_status_list ->
  ?image_id:image_identifier ->
  ?repository_name:repository_name ->
  unit ->
  describe_image_replication_status_response

val make_describe_image_replication_status_request :
  ?registry_id:registry_id ->
  image_id:image_identifier ->
  repository_name:repository_name ->
  unit ->
  describe_image_replication_status_request

val make_deregister_pull_time_update_exclusion_response :
  ?principal_arn:principal_arn -> unit -> deregister_pull_time_update_exclusion_response

val make_deregister_pull_time_update_exclusion_request :
  principal_arn:principal_arn -> unit -> deregister_pull_time_update_exclusion_request

val make_delete_signing_configuration_response :
  ?signing_configuration:signing_configuration ->
  ?registry_id:registry_id ->
  unit ->
  delete_signing_configuration_response

val make_delete_signing_configuration_request : unit -> unit
val make_delete_repository_response : ?repository:repository -> unit -> delete_repository_response

val make_delete_repository_request :
  ?force:force_flag ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  delete_repository_request

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

val make_delete_repository_creation_template_response :
  ?repository_creation_template:repository_creation_template ->
  ?registry_id:registry_id ->
  unit ->
  delete_repository_creation_template_response

val make_delete_repository_creation_template_request :
  prefix:prefix -> unit -> delete_repository_creation_template_request

val make_delete_registry_policy_response :
  ?policy_text:registry_policy_text ->
  ?registry_id:registry_id ->
  unit ->
  delete_registry_policy_response

val make_delete_registry_policy_request : unit -> unit

val make_delete_pull_through_cache_rule_response :
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?registry_id:registry_id ->
  ?created_at:creation_timestamp ->
  ?upstream_registry_url:url ->
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  delete_pull_through_cache_rule_response

val make_delete_pull_through_cache_rule_request :
  ?registry_id:registry_id ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  delete_pull_through_cache_rule_request

val make_delete_lifecycle_policy_response :
  ?last_evaluated_at:evaluation_timestamp ->
  ?lifecycle_policy_text:lifecycle_policy_text ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  delete_lifecycle_policy_response

val make_delete_lifecycle_policy_request :
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  delete_lifecycle_policy_request

val make_create_repository_response : ?repository:repository -> unit -> create_repository_response

val make_create_repository_request :
  ?encryption_configuration:encryption_configuration ->
  ?image_scanning_configuration:image_scanning_configuration ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_tag_mutability:image_tag_mutability ->
  ?tags:tag_list ->
  ?registry_id:registry_id ->
  repository_name:repository_name ->
  unit ->
  create_repository_request

val make_create_repository_creation_template_response :
  ?repository_creation_template:repository_creation_template ->
  ?registry_id:registry_id ->
  unit ->
  create_repository_creation_template_response

val make_create_repository_creation_template_request :
  ?custom_role_arn:custom_role_arn ->
  ?lifecycle_policy:lifecycle_policy_text_for_repository_creation_template ->
  ?repository_policy:repository_policy_text ->
  ?image_tag_mutability_exclusion_filters:image_tag_mutability_exclusion_filters ->
  ?image_tag_mutability:image_tag_mutability ->
  ?resource_tags:tag_list ->
  ?encryption_configuration:encryption_configuration_for_repository_creation_template ->
  ?description:repository_template_description ->
  applied_for:rct_applied_for_list ->
  prefix:prefix ->
  unit ->
  create_repository_creation_template_request

val make_create_pull_through_cache_rule_response :
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?upstream_registry:upstream_registry ->
  ?registry_id:registry_id ->
  ?created_at:creation_timestamp ->
  ?upstream_registry_url:url ->
  ?ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  create_pull_through_cache_rule_response

val make_create_pull_through_cache_rule_request :
  ?upstream_repository_prefix:pull_through_cache_rule_repository_prefix ->
  ?custom_role_arn:custom_role_arn ->
  ?credential_arn:credential_arn ->
  ?upstream_registry:upstream_registry ->
  ?registry_id:registry_id ->
  upstream_registry_url:url ->
  ecr_repository_prefix:pull_through_cache_rule_repository_prefix ->
  unit ->
  create_pull_through_cache_rule_request

val make_complete_layer_upload_response :
  ?layer_digest:layer_digest ->
  ?upload_id:upload_id ->
  ?repository_name:repository_name ->
  ?registry_id:registry_id ->
  unit ->
  complete_layer_upload_response

val make_complete_layer_upload_request :
  ?registry_id:registry_id ->
  layer_digests:layer_digest_list ->
  upload_id:upload_id ->
  repository_name:repository_name ->
  unit ->
  complete_layer_upload_request

val make_batch_get_repository_scanning_configuration_response :
  ?failures:repository_scanning_configuration_failure_list ->
  ?scanning_configurations:repository_scanning_configuration_list ->
  unit ->
  batch_get_repository_scanning_configuration_response

val make_batch_get_repository_scanning_configuration_request :
  repository_names:scanning_configuration_repository_name_list ->
  unit ->
  batch_get_repository_scanning_configuration_request

val make_batch_get_image_response :
  ?failures:image_failure_list -> ?images:image_list -> unit -> batch_get_image_response

val make_batch_get_image_request :
  ?accepted_media_types:media_type_list ->
  ?registry_id:registry_id ->
  image_ids:image_identifier_list ->
  repository_name:repository_name ->
  unit ->
  batch_get_image_request

val make_batch_delete_image_response :
  ?failures:image_failure_list ->
  ?image_ids:image_identifier_list ->
  unit ->
  batch_delete_image_response

val make_batch_delete_image_request :
  ?registry_id:registry_id ->
  image_ids:image_identifier_list ->
  repository_name:repository_name ->
  unit ->
  batch_delete_image_request

val make_batch_check_layer_availability_response :
  ?failures:layer_failure_list ->
  ?layers:layer_list ->
  unit ->
  batch_check_layer_availability_response

val make_batch_check_layer_availability_request :
  ?registry_id:registry_id ->
  layer_digests:batched_operation_layer_digest_list ->
  repository_name:repository_name ->
  unit ->
  batch_check_layer_availability_request
