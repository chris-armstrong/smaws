open Types

val make_api_error_type :
  ?secret_id:secret_id_type ->
  ?error_code:error_code ->
  ?message:error_message ->
  unit ->
  api_error_type

val make_replica_region_type :
  ?region:region_type -> ?kms_key_id:kms_key_id_type -> unit -> replica_region_type

val make_secret_value_entry :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  ?secret_binary:secret_binary_type ->
  ?secret_string:secret_string_type ->
  ?version_stages:secret_version_stages_type ->
  ?created_date:created_date_type ->
  unit ->
  secret_value_entry

val make_batch_get_secret_value_response :
  ?secret_values:secret_values_type ->
  ?next_token:next_token_type ->
  ?errors:api_error_list_type ->
  unit ->
  batch_get_secret_value_response

val make_filter :
  ?key:filter_name_string_type -> ?values:filter_values_string_list -> unit -> filter

val make_batch_get_secret_value_request :
  ?secret_id_list:secret_id_list_type ->
  ?filters:filters_list_type ->
  ?max_results:max_results_batch_type ->
  ?next_token:next_token_type ->
  unit ->
  batch_get_secret_value_request

val make_cancel_rotate_secret_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  unit ->
  cancel_rotate_secret_response

val make_cancel_rotate_secret_request :
  secret_id:secret_id_type -> unit -> cancel_rotate_secret_request

val make_replication_status_type :
  ?region:region_type ->
  ?kms_key_id:kms_key_id_type ->
  ?status:status_type ->
  ?status_message:status_message_type ->
  ?last_accessed_date:last_accessed_date_type ->
  unit ->
  replication_status_type

val make_create_secret_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  ?replication_status:replication_status_list_type ->
  unit ->
  create_secret_response

val make_tag : ?key:tag_key_type -> ?value:tag_value_type -> unit -> tag

val make_create_secret_request :
  ?client_request_token:client_request_token_type ->
  ?description:description_type ->
  ?kms_key_id:kms_key_id_type ->
  ?secret_binary:secret_binary_type ->
  ?secret_string:secret_string_type ->
  ?tags:tag_list_type ->
  ?add_replica_regions:add_replica_region_list_type ->
  ?force_overwrite_replica_secret:boolean_type ->
  ?type_:medea_type_type ->
  name:name_type ->
  unit ->
  create_secret_request

val make_delete_resource_policy_response :
  ?ar_n:secret_arn_type -> ?name:name_type -> unit -> delete_resource_policy_response

val make_delete_resource_policy_request :
  secret_id:secret_id_type -> unit -> delete_resource_policy_request

val make_delete_secret_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?deletion_date:deletion_date_type ->
  unit ->
  delete_secret_response

val make_delete_secret_request :
  ?recovery_window_in_days:recovery_window_in_days_type ->
  ?force_delete_without_recovery:boolean_type ->
  secret_id:secret_id_type ->
  unit ->
  delete_secret_request

val make_external_secret_rotation_metadata_item :
  ?key:external_secret_rotation_metadata_item_key_type ->
  ?value:external_secret_rotation_metadata_item_value_type ->
  unit ->
  external_secret_rotation_metadata_item

val make_rotation_rules_type :
  ?automatically_after_days:automatically_rotate_after_days_type ->
  ?duration:duration_type ->
  ?schedule_expression:schedule_expression_type ->
  unit ->
  rotation_rules_type

val make_describe_secret_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?type_:medea_type_type ->
  ?description:description_type ->
  ?kms_key_id:kms_key_id_type ->
  ?rotation_enabled:rotation_enabled_type ->
  ?rotation_lambda_ar_n:rotation_lambda_arn_type ->
  ?rotation_rules:rotation_rules_type ->
  ?external_secret_rotation_metadata:external_secret_rotation_metadata_type ->
  ?external_secret_rotation_role_arn:role_arn_type ->
  ?last_rotated_date:last_rotated_date_type ->
  ?last_changed_date:last_changed_date_type ->
  ?last_accessed_date:last_accessed_date_type ->
  ?deleted_date:deleted_date_type ->
  ?next_rotation_date:next_rotation_date_type ->
  ?tags:tag_list_type ->
  ?version_ids_to_stages:secret_versions_to_stages_map_type ->
  ?owning_service:owning_service_type ->
  ?created_date:timestamp_type ->
  ?primary_region:region_type ->
  ?replication_status:replication_status_list_type ->
  unit ->
  describe_secret_response

val make_describe_secret_request : secret_id:secret_id_type -> unit -> describe_secret_request

val make_get_random_password_response :
  ?random_password:random_password_type -> unit -> get_random_password_response

val make_get_random_password_request :
  ?password_length:password_length_type ->
  ?exclude_characters:exclude_characters_type ->
  ?exclude_numbers:exclude_numbers_type ->
  ?exclude_punctuation:exclude_punctuation_type ->
  ?exclude_uppercase:exclude_uppercase_type ->
  ?exclude_lowercase:exclude_lowercase_type ->
  ?include_space:include_space_type ->
  ?require_each_included_type:require_each_included_type_type ->
  unit ->
  get_random_password_request

val make_get_resource_policy_response :
  ?ar_n:secret_arn_type ->
  ?name:name_type ->
  ?resource_policy:non_empty_resource_policy_type ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  secret_id:secret_id_type -> unit -> get_resource_policy_request

val make_get_secret_value_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  ?secret_binary:secret_binary_type ->
  ?secret_string:secret_string_type ->
  ?version_stages:secret_version_stages_type ->
  ?created_date:created_date_type ->
  unit ->
  get_secret_value_response

val make_get_secret_value_request :
  ?version_id:secret_version_id_type ->
  ?version_stage:secret_version_stage_type ->
  secret_id:secret_id_type ->
  unit ->
  get_secret_value_request

val make_secret_versions_list_entry :
  ?version_id:secret_version_id_type ->
  ?version_stages:secret_version_stages_type ->
  ?last_accessed_date:last_accessed_date_type ->
  ?created_date:created_date_type ->
  ?kms_key_ids:kms_key_id_list_type ->
  unit ->
  secret_versions_list_entry

val make_list_secret_version_ids_response :
  ?versions:secret_versions_list_type ->
  ?next_token:next_token_type ->
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  unit ->
  list_secret_version_ids_response

val make_list_secret_version_ids_request :
  ?max_results:max_results_type ->
  ?next_token:next_token_type ->
  ?include_deprecated:boolean_type ->
  secret_id:secret_id_type ->
  unit ->
  list_secret_version_ids_request

val make_secret_list_entry :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?type_:medea_type_type ->
  ?description:description_type ->
  ?kms_key_id:kms_key_id_type ->
  ?rotation_enabled:rotation_enabled_type ->
  ?rotation_lambda_ar_n:rotation_lambda_arn_type ->
  ?rotation_rules:rotation_rules_type ->
  ?external_secret_rotation_metadata:external_secret_rotation_metadata_type ->
  ?external_secret_rotation_role_arn:role_arn_type ->
  ?last_rotated_date:last_rotated_date_type ->
  ?last_changed_date:last_changed_date_type ->
  ?last_accessed_date:last_accessed_date_type ->
  ?deleted_date:deleted_date_type ->
  ?next_rotation_date:next_rotation_date_type ->
  ?tags:tag_list_type ->
  ?secret_versions_to_stages:secret_versions_to_stages_map_type ->
  ?owning_service:owning_service_type ->
  ?created_date:timestamp_type ->
  ?primary_region:region_type ->
  unit ->
  secret_list_entry

val make_list_secrets_response :
  ?secret_list:secret_list_type -> ?next_token:next_token_type -> unit -> list_secrets_response

val make_list_secrets_request :
  ?include_planned_deletion:boolean_type ->
  ?max_results:max_results_type ->
  ?next_token:next_token_type ->
  ?filters:filters_list_type ->
  ?sort_order:sort_order_type ->
  ?sort_by:sort_by_type ->
  unit ->
  list_secrets_request

val make_put_resource_policy_response :
  ?ar_n:secret_arn_type -> ?name:name_type -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?block_public_policy:boolean_type ->
  secret_id:secret_id_type ->
  resource_policy:non_empty_resource_policy_type ->
  unit ->
  put_resource_policy_request

val make_put_secret_value_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  ?version_stages:secret_version_stages_type ->
  unit ->
  put_secret_value_response

val make_put_secret_value_request :
  ?client_request_token:client_request_token_type ->
  ?secret_binary:secret_binary_type ->
  ?secret_string:secret_string_type ->
  ?version_stages:secret_version_stages_type ->
  ?rotation_token:rotation_token_type ->
  secret_id:secret_id_type ->
  unit ->
  put_secret_value_request

val make_remove_regions_from_replication_response :
  ?ar_n:secret_arn_type ->
  ?replication_status:replication_status_list_type ->
  unit ->
  remove_regions_from_replication_response

val make_remove_regions_from_replication_request :
  secret_id:secret_id_type ->
  remove_replica_regions:remove_replica_region_list_type ->
  unit ->
  remove_regions_from_replication_request

val make_replicate_secret_to_regions_response :
  ?ar_n:secret_arn_type ->
  ?replication_status:replication_status_list_type ->
  unit ->
  replicate_secret_to_regions_response

val make_replicate_secret_to_regions_request :
  ?force_overwrite_replica_secret:boolean_type ->
  secret_id:secret_id_type ->
  add_replica_regions:add_replica_region_list_type ->
  unit ->
  replicate_secret_to_regions_request

val make_restore_secret_response :
  ?ar_n:secret_arn_type -> ?name:secret_name_type -> unit -> restore_secret_response

val make_restore_secret_request : secret_id:secret_id_type -> unit -> restore_secret_request

val make_rotate_secret_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  unit ->
  rotate_secret_response

val make_rotate_secret_request :
  ?client_request_token:client_request_token_type ->
  ?rotation_lambda_ar_n:rotation_lambda_arn_type ->
  ?rotation_rules:rotation_rules_type ->
  ?external_secret_rotation_metadata:external_secret_rotation_metadata_type ->
  ?external_secret_rotation_role_arn:role_arn_type ->
  ?rotate_immediately:boolean_type ->
  secret_id:secret_id_type ->
  unit ->
  rotate_secret_request

val make_stop_replication_to_replica_response :
  ?ar_n:secret_arn_type -> unit -> stop_replication_to_replica_response

val make_stop_replication_to_replica_request :
  secret_id:secret_id_type -> unit -> stop_replication_to_replica_request

val make_tag_resource_request :
  secret_id:secret_id_type -> tags:tag_list_type -> unit -> tag_resource_request

val make_untag_resource_request :
  secret_id:secret_id_type -> tag_keys:tag_key_list_type -> unit -> untag_resource_request

val make_update_secret_response :
  ?ar_n:secret_arn_type ->
  ?name:secret_name_type ->
  ?version_id:secret_version_id_type ->
  unit ->
  update_secret_response

val make_update_secret_request :
  ?client_request_token:client_request_token_type ->
  ?description:description_type ->
  ?kms_key_id:kms_key_id_type ->
  ?secret_binary:secret_binary_type ->
  ?secret_string:secret_string_type ->
  ?type_:medea_type_type ->
  secret_id:secret_id_type ->
  unit ->
  update_secret_request

val make_update_secret_version_stage_response :
  ?ar_n:secret_arn_type -> ?name:secret_name_type -> unit -> update_secret_version_stage_response

val make_update_secret_version_stage_request :
  ?remove_from_version_id:secret_version_id_type ->
  ?move_to_version_id:secret_version_id_type ->
  secret_id:secret_id_type ->
  version_stage:secret_version_stage_type ->
  unit ->
  update_secret_version_stage_request

val make_validation_errors_entry :
  ?check_name:name_type -> ?error_message:error_message -> unit -> validation_errors_entry

val make_validate_resource_policy_response :
  ?policy_validation_passed:boolean_type ->
  ?validation_errors:validation_errors_type ->
  unit ->
  validate_resource_policy_response

val make_validate_resource_policy_request :
  ?secret_id:secret_id_type ->
  resource_policy:non_empty_resource_policy_type ->
  unit ->
  validate_resource_policy_request
