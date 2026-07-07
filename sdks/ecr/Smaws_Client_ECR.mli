(** ECR client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module BatchCheckLayerAvailability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_check_layer_availability_request ->
    ( batch_check_layer_availability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_check_layer_availability_request ->
    ( batch_check_layer_availability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Checks the availability of one or more image layers in a repository.\n\n\
  \ When an image is pushed to a repository, each image layer is checked to verify if it has been \
   uploaded before. If it has been uploaded, then the image layer is skipped.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module BatchDeleteImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_image_request ->
    ( batch_delete_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_image_request ->
    ( batch_delete_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a list of specified images within a repository. Images are specified with either an \
   [imageTag] or [imageDigest].\n\n\
  \ You can remove a tag from an image by specifying the image's tag in your request. When you \
   remove the last tag from an image, the image is deleted from your repository.\n\
  \ \n\
  \  You can completely delete an image (and all of its tags) by specifying the image's digest in \
   your request.\n\
  \  "]

module BatchGetImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnableToGetUpstreamImageException of unable_to_get_upstream_image_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_image_request ->
    ( batch_get_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnableToGetUpstreamImageException of unable_to_get_upstream_image_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_image_request ->
    ( batch_get_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnableToGetUpstreamImageException of unable_to_get_upstream_image_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets detailed information for an image. Images are specified with either an [imageTag] or \
   [imageDigest].\n\n\
  \ When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.\n\
  \ "]

module BatchGetRepositoryScanningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_repository_scanning_configuration_request ->
    ( batch_get_repository_scanning_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_repository_scanning_configuration_request ->
    ( batch_get_repository_scanning_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the scanning configuration for one or more repositories.\n"]

module CompleteLayerUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EmptyUploadException of empty_upload_exception
    | `InvalidLayerException of invalid_layer_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `KmsException of kms_exception
    | `LayerAlreadyExistsException of layer_already_exists_exception
    | `LayerPartTooSmallException of layer_part_too_small_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UploadNotFoundException of upload_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    complete_layer_upload_request ->
    ( complete_layer_upload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EmptyUploadException of empty_upload_exception
      | `InvalidLayerException of invalid_layer_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `LayerAlreadyExistsException of layer_already_exists_exception
      | `LayerPartTooSmallException of layer_part_too_small_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UploadNotFoundException of upload_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    complete_layer_upload_request ->
    ( complete_layer_upload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EmptyUploadException of empty_upload_exception
      | `InvalidLayerException of invalid_layer_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `LayerAlreadyExistsException of layer_already_exists_exception
      | `LayerPartTooSmallException of layer_part_too_small_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UploadNotFoundException of upload_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Informs Amazon ECR that the image layer upload has completed for a specified registry, \
   repository name, and upload ID. You can optionally provide a [sha256] digest of the image layer \
   for data validation purposes.\n\n\
  \ When an image is pushed, the CompleteLayerUpload API is called once per each new image layer \
   to verify that the upload has completed.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module CreatePullThroughCacheRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PullThroughCacheRuleAlreadyExistsException of
      pull_through_cache_rule_already_exists_exception
    | `SecretNotFoundException of secret_not_found_exception
    | `ServerException of server_exception
    | `UnableToAccessSecretException of unable_to_access_secret_exception
    | `UnableToDecryptSecretValueException of unable_to_decrypt_secret_value_exception
    | `UnsupportedUpstreamRegistryException of unsupported_upstream_registry_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pull_through_cache_rule_request ->
    ( create_pull_through_cache_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PullThroughCacheRuleAlreadyExistsException of
        pull_through_cache_rule_already_exists_exception
      | `SecretNotFoundException of secret_not_found_exception
      | `ServerException of server_exception
      | `UnableToAccessSecretException of unable_to_access_secret_exception
      | `UnableToDecryptSecretValueException of unable_to_decrypt_secret_value_exception
      | `UnsupportedUpstreamRegistryException of unsupported_upstream_registry_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pull_through_cache_rule_request ->
    ( create_pull_through_cache_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PullThroughCacheRuleAlreadyExistsException of
        pull_through_cache_rule_already_exists_exception
      | `SecretNotFoundException of secret_not_found_exception
      | `ServerException of server_exception
      | `UnableToAccessSecretException of unable_to_access_secret_exception
      | `UnableToDecryptSecretValueException of unable_to_decrypt_secret_value_exception
      | `UnsupportedUpstreamRegistryException of unsupported_upstream_registry_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a pull through cache rule. A pull through cache rule provides a way to cache images \
   from an upstream registry source in your Amazon ECR private registry. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/pull-through-cache.html}Using pull \
   through cache rules} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module CreateRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagParameterException of invalid_tag_parameter_exception
    | `KmsException of kms_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RepositoryAlreadyExistsException of repository_already_exists_exception
    | `ServerException of server_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_repository_request ->
    ( create_repository_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `KmsException of kms_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryAlreadyExistsException of repository_already_exists_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_repository_request ->
    ( create_repository_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `KmsException of kms_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryAlreadyExistsException of repository_already_exists_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a repository. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html}Amazon ECR \
   repositories} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module CreateRepositoryCreationTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `TemplateAlreadyExistsException of template_already_exists_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_repository_creation_template_request ->
    ( create_repository_creation_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `TemplateAlreadyExistsException of template_already_exists_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_repository_creation_template_request ->
    ( create_repository_creation_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `TemplateAlreadyExistsException of template_already_exists_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a repository creation template. This template is used to define the settings for \
   repositories created by Amazon ECR on your behalf. For example, repositories created through \
   pull through cache actions. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-creation-templates.html}Private \
   repository creation templates} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module DeleteLifecyclePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_policy_request ->
    ( delete_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_policy_request ->
    ( delete_lifecycle_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the lifecycle policy associated with the specified repository.\n"]

module DeletePullThroughCacheRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pull_through_cache_rule_request ->
    ( delete_pull_through_cache_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pull_through_cache_rule_request ->
    ( delete_pull_through_cache_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a pull through cache rule.\n"]

module DeleteRegistryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RegistryPolicyNotFoundException of registry_policy_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_registry_policy_request ->
    ( delete_registry_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryPolicyNotFoundException of registry_policy_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_registry_policy_request ->
    ( delete_registry_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryPolicyNotFoundException of registry_policy_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the registry permissions policy.\n"]

module DeleteRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `KmsException of kms_exception
    | `RepositoryNotEmptyException of repository_not_empty_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_request ->
    ( delete_repository_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `RepositoryNotEmptyException of repository_not_empty_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_request ->
    ( delete_repository_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `RepositoryNotEmptyException of repository_not_empty_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a repository. If the repository isn't empty, you must either delete the contents of the \
   repository or use the [force] option to delete the repository and have Amazon ECR delete all of \
   its contents on your behalf.\n"]

module DeleteRepositoryCreationTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `TemplateNotFoundException of template_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_creation_template_request ->
    ( delete_repository_creation_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TemplateNotFoundException of template_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_creation_template_request ->
    ( delete_repository_creation_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TemplateNotFoundException of template_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a repository creation template.\n"]

module DeleteRepositoryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_policy_request ->
    ( delete_repository_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_policy_request ->
    ( delete_repository_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the repository policy associated with the specified repository.\n"]

module DeleteSigningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServerException of server_exception
    | `SigningConfigurationNotFoundException of signing_configuration_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_signing_configuration_request ->
    ( delete_signing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServerException of server_exception
      | `SigningConfigurationNotFoundException of signing_configuration_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_signing_configuration_request ->
    ( delete_signing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServerException of server_exception
      | `SigningConfigurationNotFoundException of signing_configuration_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the registry's signing configuration. Images pushed after deletion of the signing \
   configuration will no longer be automatically signed.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html}Managed signing} \
   in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ \n\
  \   Deleting the signing configuration does not affect existing image signatures.\n\
  \   \n\
  \    "]

module DeregisterPullTimeUpdateExclusion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ExclusionNotFoundException of exclusion_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_pull_time_update_exclusion_request ->
    ( deregister_pull_time_update_exclusion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ExclusionNotFoundException of exclusion_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_pull_time_update_exclusion_request ->
    ( deregister_pull_time_update_exclusion_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ExclusionNotFoundException of exclusion_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a principal from the pull time update exclusion list for a registry. Once removed, \
   Amazon ECR will resume updating the pull time if the specified principal pulls an image.\n"]

module DescribeImageReplicationStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageNotFoundException of image_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_replication_status_request ->
    ( describe_image_replication_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_replication_status_request ->
    ( describe_image_replication_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the replication status for a specified image.\n"]

module DescribeImageScanFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageNotFoundException of image_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ScanNotFoundException of scan_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_scan_findings_request ->
    ( describe_image_scan_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ScanNotFoundException of scan_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_scan_findings_request ->
    ( describe_image_scan_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ScanNotFoundException of scan_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the scan findings for the specified image.\n"]

module DescribeImageSigningStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageNotFoundException of image_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_signing_status_request ->
    ( describe_image_signing_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_signing_status_request ->
    ( describe_image_signing_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the signing status for a specified image. If the image matched signing rules that \
   reference different signing profiles, a status is returned for each profile.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html}Managed signing} \
   in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ "]

module DescribeImages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageNotFoundException of image_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns metadata about the images in a repository.\n\n\
  \  Starting with Docker version 1.9, the Docker client compresses image layers before pushing \
   them to a V2 Docker registry. The output of the [docker images] command shows the uncompressed \
   image size. Therefore, Docker might return a larger image than the image shown in the Amazon \
   Web Services Management Console.\n\
  \  \n\
  \     The new version of Amazon ECR {i Basic Scanning} doesn't use the \
   [ImageDetail$imageScanFindingsSummary] and [ImageDetail$imageScanStatus] attributes from the \
   API response to return scan results. Use the [DescribeImageScanFindings] API instead. For more \
   information about Amazon Web Services native basic scanning, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html} Scan images for \
   software vulnerabilities in Amazon ECR}.\n\
  \     \n\
  \      "]

module DescribePullThroughCacheRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pull_through_cache_rules_request ->
    ( describe_pull_through_cache_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pull_through_cache_rules_request ->
    ( describe_pull_through_cache_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the pull through cache rules for a registry.\n"]

module DescribeRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registry_request ->
    ( describe_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registry_request ->
    ( describe_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the settings for a registry. The replication configuration for a repository can be \
   created or updated with the [PutReplicationConfiguration] API action.\n"]

module DescribeRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_repositories_request ->
    ( describe_repositories_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_repositories_request ->
    ( describe_repositories_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes image repositories in a registry.\n"]

module DescribeRepositoryCreationTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_repository_creation_templates_request ->
    ( describe_repository_creation_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_repository_creation_templates_request ->
    ( describe_repository_creation_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details about the repository creation templates in a registry. The [prefixes] request \
   parameter can be used to return the details for a specific repository creation template.\n"]

module GetAccountSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_setting_request ->
    ( get_account_setting_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_setting_request ->
    ( get_account_setting_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the account setting value for the specified setting name.\n"]

module GetAuthorizationToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_authorization_token_request ->
    ( get_authorization_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_authorization_token_request ->
    ( get_authorization_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an authorization token. An authorization token represents your IAM authentication \
   credentials and can be used to access any Amazon ECR registry that your IAM principal has \
   access to. The authorization token is valid for 12 hours.\n\n\
  \ The [authorizationToken] returned is a base64 encoded string that can be decoded and used in a \
   [docker login] command to authenticate to a registry. The CLI offers an [get-login-password] \
   command that simplifies the login process. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth}Registry \
   authentication} in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ "]

module GetDownloadUrlForLayer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LayerInaccessibleException of layer_inaccessible_exception
    | `LayersNotFoundException of layers_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnableToGetUpstreamLayerException of unable_to_get_upstream_layer_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_download_url_for_layer_request ->
    ( get_download_url_for_layer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LayerInaccessibleException of layer_inaccessible_exception
      | `LayersNotFoundException of layers_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnableToGetUpstreamLayerException of unable_to_get_upstream_layer_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_download_url_for_layer_request ->
    ( get_download_url_for_layer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LayerInaccessibleException of layer_inaccessible_exception
      | `LayersNotFoundException of layers_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnableToGetUpstreamLayerException of unable_to_get_upstream_layer_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only \
   get URLs for image layers that are referenced in an image.\n\n\
  \ When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer that is \
   not already cached.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module GetLifecyclePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lifecycle_policy_request ->
    ( get_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lifecycle_policy_request ->
    ( get_lifecycle_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the lifecycle policy for the specified repository.\n"]

module GetLifecyclePolicyPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LifecyclePolicyPreviewNotFoundException of lifecycle_policy_preview_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lifecycle_policy_preview_request ->
    ( get_lifecycle_policy_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyPreviewNotFoundException of lifecycle_policy_preview_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lifecycle_policy_preview_request ->
    ( get_lifecycle_policy_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyPreviewNotFoundException of lifecycle_policy_preview_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the results of the lifecycle policy preview request for the specified repository.\n"]

module GetRegistryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RegistryPolicyNotFoundException of registry_policy_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_registry_policy_request ->
    ( get_registry_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryPolicyNotFoundException of registry_policy_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_registry_policy_request ->
    ( get_registry_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryPolicyNotFoundException of registry_policy_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the permissions policy for a registry.\n"]

module GetRegistryScanningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_registry_scanning_configuration_request ->
    ( get_registry_scanning_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_registry_scanning_configuration_request ->
    ( get_registry_scanning_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the scanning configuration for a registry.\n"]

module GetRepositoryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_policy_request ->
    ( get_repository_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_policy_request ->
    ( get_repository_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the repository policy for the specified repository.\n"]

module GetSigningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `SigningConfigurationNotFoundException of signing_configuration_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_signing_configuration_request ->
    ( get_signing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `SigningConfigurationNotFoundException of signing_configuration_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_signing_configuration_request ->
    ( get_signing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `SigningConfigurationNotFoundException of signing_configuration_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the registry's signing configuration, which defines rules for automatically signing \
   images using Amazon Web Services Signer.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html}Managed signing} \
   in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ "]

module InitiateLayerUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `KmsException of kms_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    initiate_layer_upload_request ->
    ( initiate_layer_upload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    initiate_layer_upload_request ->
    ( initiate_layer_upload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Notifies Amazon ECR that you intend to upload an image layer.\n\n\
  \ When an image is pushed, the InitiateLayerUpload API is called once per image layer that has \
   not already been uploaded. Whether or not an image layer has been uploaded is determined by the \
   BatchCheckLayerAvailability API action.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module ListImageReferrers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnableToListUpstreamImageReferrersException of
      unable_to_list_upstream_image_referrers_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_image_referrers_request ->
    ( list_image_referrers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnableToListUpstreamImageReferrersException of
        unable_to_list_upstream_image_referrers_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_image_referrers_request ->
    ( list_image_referrers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnableToListUpstreamImageReferrersException of
        unable_to_list_upstream_image_referrers_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the artifacts associated with a specified subject image.\n\n\
  \  The IAM principal invoking this operation must have the [ecr:BatchGetImage] permission.\n\
  \  \n\
  \   "]

module ListImages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_images_request ->
    ( list_images_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_images_request ->
    ( list_images_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the image IDs for the specified repository.\n\n\
  \ You can filter images based on whether or not they are tagged by using the [tagStatus] filter \
   and specifying either [TAGGED], [UNTAGGED] or [ANY]. For example, you can filter your results \
   to return only [UNTAGGED] images and then pipe that result to a [BatchDeleteImage] operation to \
   delete them. Or, you can filter your results to return only [TAGGED] images to list all of the \
   tags in your repository.\n\
  \ "]

module ListPullTimeUpdateExclusions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pull_time_update_exclusions_request ->
    ( list_pull_time_update_exclusions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pull_time_update_exclusions_request ->
    ( list_pull_time_update_exclusions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IAM principals that are excluded from having their image pull times recorded.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the tags for an Amazon ECR resource.\n"]

module PutAccountSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_account_setting_request ->
    ( put_account_setting_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_account_setting_request ->
    ( put_account_setting_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Allows you to change the basic scan type version or registry policy scope.\n"]

module PutImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageAlreadyExistsException of image_already_exists_exception
    | `ImageDigestDoesNotMatchException of image_digest_does_not_match_exception
    | `ImageTagAlreadyExistsException of image_tag_already_exists_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `KmsException of kms_exception
    | `LayersNotFoundException of layers_not_found_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ReferencedImagesNotFoundException of referenced_images_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_image_request ->
    ( put_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageAlreadyExistsException of image_already_exists_exception
      | `ImageDigestDoesNotMatchException of image_digest_does_not_match_exception
      | `ImageTagAlreadyExistsException of image_tag_already_exists_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `LayersNotFoundException of layers_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ReferencedImagesNotFoundException of referenced_images_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_image_request ->
    ( put_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageAlreadyExistsException of image_already_exists_exception
      | `ImageDigestDoesNotMatchException of image_digest_does_not_match_exception
      | `ImageTagAlreadyExistsException of image_tag_already_exists_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `LayersNotFoundException of layers_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ReferencedImagesNotFoundException of referenced_images_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the image manifest and tags associated with an image.\n\n\
  \ When an image is pushed and all new image layers have been uploaded, the PutImage API is \
   called once to create or update the image manifest and the tags associated with the image.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module PutImageScanningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_image_scanning_configuration_request ->
    ( put_image_scanning_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_image_scanning_configuration_request ->
    ( put_image_scanning_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The [PutImageScanningConfiguration] API is being deprecated, in favor of specifying the image \
   scanning configuration at the registry level. For more information, see \
   [PutRegistryScanningConfiguration].\n\
  \ \n\
  \   Updates the image scanning configuration for the specified repository.\n\
  \   "]

module PutImageTagMutability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_image_tag_mutability_request ->
    ( put_image_tag_mutability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_image_tag_mutability_request ->
    ( put_image_tag_mutability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the image tag mutability settings for the specified repository. For more information, \
   see {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html}Image \
   tag mutability} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module PutLifecyclePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_policy_request ->
    ( put_lifecycle_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_policy_request ->
    ( put_lifecycle_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the lifecycle policy for the specified repository. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html}Lifecycle \
   policy template}.\n"]

module PutRegistryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_registry_policy_request ->
    ( put_registry_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_registry_policy_request ->
    ( put_registry_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the permissions policy for your registry.\n\n\
  \ A registry policy is used to specify permissions for another Amazon Web Services account and \
   is used when configuring cross-account replication. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html}Registry \
   permissions} in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ "]

module PutRegistryScanningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BlockedByOrganizationPolicyException of blocked_by_organization_policy_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_registry_scanning_configuration_request ->
    ( put_registry_scanning_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BlockedByOrganizationPolicyException of blocked_by_organization_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_registry_scanning_configuration_request ->
    ( put_registry_scanning_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BlockedByOrganizationPolicyException of blocked_by_organization_policy_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates or updates the scanning configuration for your private registry.\n"]

module PutReplicationConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_replication_configuration_request ->
    ( put_replication_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_replication_configuration_request ->
    ( put_replication_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the replication configuration for a registry. The existing replication \
   configuration for a repository can be retrieved with the [DescribeRegistry] API action. The \
   first time the PutReplicationConfiguration API is called, a service-linked IAM role is created \
   in your account for the replication process. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/using-service-linked-roles.html}Using \
   service-linked roles for Amazon ECR} in the {i Amazon Elastic Container Registry User Guide}. \
   For more information on the custom role for replication, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/replication-creation-templates.html#roles-creatingrole-user-console}Creating \
   an IAM role for replication}.\n\n\
  \  When configuring cross-account replication, the destination account must grant the source \
   account permission to replicate. This permission is controlled using a registry permissions \
   policy. For more information, see [PutRegistryPolicy].\n\
  \  \n\
  \   "]

module PutSigningConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_signing_configuration_request ->
    ( put_signing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_signing_configuration_request ->
    ( put_signing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the registry's signing configuration, which defines rules for automatically \
   signing images with Amazon Web Services Signer.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html}Managed signing} \
   in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ \n\
  \   To successfully generate a signature, the IAM principal pushing images must have permission \
   to sign payloads with the Amazon Web Services Signer signing profile referenced in the signing \
   configuration.\n\
  \   \n\
  \    "]

module RegisterPullTimeUpdateExclusion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ExclusionAlreadyExistsException of exclusion_already_exists_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_pull_time_update_exclusion_request ->
    ( register_pull_time_update_exclusion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ExclusionAlreadyExistsException of exclusion_already_exists_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_pull_time_update_exclusion_request ->
    ( register_pull_time_update_exclusion_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ExclusionAlreadyExistsException of exclusion_already_exists_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an IAM principal to the pull time update exclusion list for a registry. Amazon ECR will \
   not record the pull time if an excluded principal pulls an image.\n"]

module SetRepositoryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_repository_policy_request ->
    ( set_repository_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_repository_policy_request ->
    ( set_repository_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a repository policy to the specified repository to control access permissions. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html}Amazon ECR \
   Repository policies} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module StartImageScan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageArchivedException of image_archived_exception
    | `ImageNotFoundException of image_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedImageTypeException of unsupported_image_type_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_image_scan_request ->
    ( start_image_scan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageArchivedException of image_archived_exception
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedImageTypeException of unsupported_image_type_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_image_scan_request ->
    ( start_image_scan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageArchivedException of image_archived_exception
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedImageTypeException of unsupported_image_type_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a basic image vulnerability scan.\n\n\
  \  A basic image scan can only be started once per 24 hours on an individual image. This limit \
   includes if an image was scanned on initial push. You can start up to 100,000 basic scans per \
   24 hours. This limit includes both scans on initial push and scans initiated by the \
   StartImageScan API. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning-basic.html}Basic \
   scanning} in the {i Amazon Elastic Container Registry User Guide}.\n\
  \ "]

module StartLifecyclePolicyPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
    | `LifecyclePolicyPreviewInProgressException of lifecycle_policy_preview_in_progress_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_lifecycle_policy_preview_request ->
    ( start_lifecycle_policy_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
      | `LifecyclePolicyPreviewInProgressException of lifecycle_policy_preview_in_progress_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_lifecycle_policy_preview_request ->
    ( start_lifecycle_policy_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `LifecyclePolicyNotFoundException of lifecycle_policy_not_found_exception
      | `LifecyclePolicyPreviewInProgressException of lifecycle_policy_preview_in_progress_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a preview of a lifecycle policy for the specified repository. This allows you to see the \
   results before associating the lifecycle policy with the repository.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagParameterException of invalid_tag_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not \
   changed if they are not specified in the request parameters.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagParameterException of invalid_tag_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes specified tags from a resource.\n"]

module UpdateImageStorageClass : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageNotFoundException of image_not_found_exception
    | `ImageStorageClassUpdateNotSupportedException of
      image_storage_class_update_not_supported_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_image_storage_class_request ->
    ( update_image_storage_class_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `ImageStorageClassUpdateNotSupportedException of
        image_storage_class_update_not_supported_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_image_storage_class_request ->
    ( update_image_storage_class_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `ImageStorageClassUpdateNotSupportedException of
        image_storage_class_update_not_supported_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Transitions an image between storage classes. You can transition images from Amazon ECR \
   standard storage class to Amazon ECR archival storage class for long-term storage, or restore \
   archived images back to Amazon ECR standard.\n"]

module UpdatePullThroughCacheRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
    | `SecretNotFoundException of secret_not_found_exception
    | `ServerException of server_exception
    | `UnableToAccessSecretException of unable_to_access_secret_exception
    | `UnableToDecryptSecretValueException of unable_to_decrypt_secret_value_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pull_through_cache_rule_request ->
    ( update_pull_through_cache_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `SecretNotFoundException of secret_not_found_exception
      | `ServerException of server_exception
      | `UnableToAccessSecretException of unable_to_access_secret_exception
      | `UnableToDecryptSecretValueException of unable_to_decrypt_secret_value_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pull_through_cache_rule_request ->
    ( update_pull_through_cache_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `SecretNotFoundException of secret_not_found_exception
      | `ServerException of server_exception
      | `UnableToAccessSecretException of unable_to_access_secret_exception
      | `UnableToDecryptSecretValueException of unable_to_decrypt_secret_value_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing pull through cache rule.\n"]

module UpdateRepositoryCreationTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `TemplateNotFoundException of template_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_repository_creation_template_request ->
    ( update_repository_creation_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TemplateNotFoundException of template_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_repository_creation_template_request ->
    ( update_repository_creation_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TemplateNotFoundException of template_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing repository creation template.\n"]

module UploadLayerPart : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidLayerPartException of invalid_layer_part_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `KmsException of kms_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UploadNotFoundException of upload_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upload_layer_part_request ->
    ( upload_layer_part_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLayerPartException of invalid_layer_part_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UploadNotFoundException of upload_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upload_layer_part_request ->
    ( upload_layer_part_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLayerPartException of invalid_layer_part_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `KmsException of kms_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UploadNotFoundException of upload_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uploads an image layer part to Amazon ECR.\n\n\
  \ When an image is pushed, each new image layer is uploaded in parts. The maximum size of each \
   image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API is called once \
   per each new image layer part.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

(** {1:Serialization and Deserialization} *)
module ValidatePullThroughCacheRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
    | `ServerException of server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    validate_pull_through_cache_rule_request ->
    ( validate_pull_through_cache_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    validate_pull_through_cache_rule_request ->
    ( validate_pull_through_cache_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `PullThroughCacheRuleNotFoundException of pull_through_cache_rule_not_found_exception
      | `ServerException of server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates an existing pull through cache rule for an upstream registry that requires \
   authentication. This will retrieve the contents of the Amazon Web Services Secrets Manager \
   secret, verify the syntax, and then validate that authentication to the upstream registry is \
   successful.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
