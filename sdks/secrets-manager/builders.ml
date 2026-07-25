open Types

let make_api_error_type ?secret_id:(secret_id_ : secret_id_type option)
    ?error_code:(error_code_ : error_code option) ?message:(message_ : error_message option) () =
  ({ secret_id = secret_id_; error_code = error_code_; message = message_ } : api_error_type)

let make_replica_region_type ?region:(region_ : region_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option) () =
  ({ region = region_; kms_key_id = kms_key_id_ } : replica_region_type)

let make_secret_value_entry ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?created_date:(created_date_ : created_date_type option) () =
  ({
     ar_n = ar_n_;
     name = name_;
     version_id = version_id_;
     secret_binary = secret_binary_;
     secret_string = secret_string_;
     version_stages = version_stages_;
     created_date = created_date_;
   }
    : secret_value_entry)

let make_batch_get_secret_value_response ?secret_values:(secret_values_ : secret_values_type option)
    ?next_token:(next_token_ : next_token_type option)
    ?errors:(errors_ : api_error_list_type option) () =
  ({ secret_values = secret_values_; next_token = next_token_; errors = errors_ }
    : batch_get_secret_value_response)

let make_filter ?key:(key_ : filter_name_string_type option)
    ?values:(values_ : filter_values_string_list option) () =
  ({ key = key_; values = values_ } : filter)

let make_batch_get_secret_value_request
    ?secret_id_list:(secret_id_list_ : secret_id_list_type option)
    ?filters:(filters_ : filters_list_type option)
    ?max_results:(max_results_ : max_results_batch_type option)
    ?next_token:(next_token_ : next_token_type option) () =
  ({
     secret_id_list = secret_id_list_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : batch_get_secret_value_request)

let make_cancel_rotate_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option) () =
  ({ ar_n = ar_n_; name = name_; version_id = version_id_ } : cancel_rotate_secret_response)

let make_cancel_rotate_secret_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : cancel_rotate_secret_request)

let make_replication_status_type ?region:(region_ : region_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option) ?status:(status_ : status_type option)
    ?status_message:(status_message_ : status_message_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option) () =
  ({
     region = region_;
     kms_key_id = kms_key_id_;
     status = status_;
     status_message = status_message_;
     last_accessed_date = last_accessed_date_;
   }
    : replication_status_type)

let make_create_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?replication_status:(replication_status_ : replication_status_list_type option) () =
  ({
     ar_n = ar_n_;
     name = name_;
     version_id = version_id_;
     replication_status = replication_status_;
   }
    : create_secret_response)

let make_tag ?key:(key_ : tag_key_type option) ?value:(value_ : tag_value_type option) () =
  ({ key = key_; value = value_ } : tag)

let make_create_secret_request
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ?description:(description_ : description_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?secret_string:(secret_string_ : secret_string_type option) ?tags:(tags_ : tag_list_type option)
    ?add_replica_regions:(add_replica_regions_ : add_replica_region_list_type option)
    ?force_overwrite_replica_secret:(force_overwrite_replica_secret_ : boolean_type option)
    ?type_:(type__ : medea_type_type option) ~name:(name_ : name_type) () =
  ({
     name = name_;
     client_request_token = client_request_token_;
     description = description_;
     kms_key_id = kms_key_id_;
     secret_binary = secret_binary_;
     secret_string = secret_string_;
     tags = tags_;
     add_replica_regions = add_replica_regions_;
     force_overwrite_replica_secret = force_overwrite_replica_secret_;
     type_ = type__;
   }
    : create_secret_request)

let make_delete_resource_policy_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : name_type option) () =
  ({ ar_n = ar_n_; name = name_ } : delete_resource_policy_response)

let make_delete_resource_policy_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : delete_resource_policy_request)

let make_delete_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?deletion_date:(deletion_date_ : deletion_date_type option) () =
  ({ ar_n = ar_n_; name = name_; deletion_date = deletion_date_ } : delete_secret_response)

let make_delete_secret_request
    ?recovery_window_in_days:(recovery_window_in_days_ : recovery_window_in_days_type option)
    ?force_delete_without_recovery:(force_delete_without_recovery_ : boolean_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     secret_id = secret_id_;
     recovery_window_in_days = recovery_window_in_days_;
     force_delete_without_recovery = force_delete_without_recovery_;
   }
    : delete_secret_request)

let make_external_secret_rotation_metadata_item
    ?key:(key_ : external_secret_rotation_metadata_item_key_type option)
    ?value:(value_ : external_secret_rotation_metadata_item_value_type option) () =
  ({ key = key_; value = value_ } : external_secret_rotation_metadata_item)

let make_rotation_rules_type
    ?automatically_after_days:
      (automatically_after_days_ : automatically_rotate_after_days_type option)
    ?duration:(duration_ : duration_type option)
    ?schedule_expression:(schedule_expression_ : schedule_expression_type option) () =
  ({
     automatically_after_days = automatically_after_days_;
     duration = duration_;
     schedule_expression = schedule_expression_;
   }
    : rotation_rules_type)

let make_describe_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option) ?type_:(type__ : medea_type_type option)
    ?description:(description_ : description_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?rotation_enabled:(rotation_enabled_ : rotation_enabled_type option)
    ?rotation_lambda_ar_n:(rotation_lambda_ar_n_ : rotation_lambda_arn_type option)
    ?rotation_rules:(rotation_rules_ : rotation_rules_type option)
    ?external_secret_rotation_metadata:
      (external_secret_rotation_metadata_ : external_secret_rotation_metadata_type option)
    ?external_secret_rotation_role_arn:(external_secret_rotation_role_arn_ : role_arn_type option)
    ?last_rotated_date:(last_rotated_date_ : last_rotated_date_type option)
    ?last_changed_date:(last_changed_date_ : last_changed_date_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?deleted_date:(deleted_date_ : deleted_date_type option)
    ?next_rotation_date:(next_rotation_date_ : next_rotation_date_type option)
    ?tags:(tags_ : tag_list_type option)
    ?version_ids_to_stages:(version_ids_to_stages_ : secret_versions_to_stages_map_type option)
    ?owning_service:(owning_service_ : owning_service_type option)
    ?created_date:(created_date_ : timestamp_type option)
    ?primary_region:(primary_region_ : region_type option)
    ?replication_status:(replication_status_ : replication_status_list_type option) () =
  ({
     ar_n = ar_n_;
     name = name_;
     type_ = type__;
     description = description_;
     kms_key_id = kms_key_id_;
     rotation_enabled = rotation_enabled_;
     rotation_lambda_ar_n = rotation_lambda_ar_n_;
     rotation_rules = rotation_rules_;
     external_secret_rotation_metadata = external_secret_rotation_metadata_;
     external_secret_rotation_role_arn = external_secret_rotation_role_arn_;
     last_rotated_date = last_rotated_date_;
     last_changed_date = last_changed_date_;
     last_accessed_date = last_accessed_date_;
     deleted_date = deleted_date_;
     next_rotation_date = next_rotation_date_;
     tags = tags_;
     version_ids_to_stages = version_ids_to_stages_;
     owning_service = owning_service_;
     created_date = created_date_;
     primary_region = primary_region_;
     replication_status = replication_status_;
   }
    : describe_secret_response)

let make_describe_secret_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : describe_secret_request)

let make_get_random_password_response
    ?random_password:(random_password_ : random_password_type option) () =
  ({ random_password = random_password_ } : get_random_password_response)

let make_get_random_password_request
    ?password_length:(password_length_ : password_length_type option)
    ?exclude_characters:(exclude_characters_ : exclude_characters_type option)
    ?exclude_numbers:(exclude_numbers_ : exclude_numbers_type option)
    ?exclude_punctuation:(exclude_punctuation_ : exclude_punctuation_type option)
    ?exclude_uppercase:(exclude_uppercase_ : exclude_uppercase_type option)
    ?exclude_lowercase:(exclude_lowercase_ : exclude_lowercase_type option)
    ?include_space:(include_space_ : include_space_type option)
    ?require_each_included_type:
      (require_each_included_type_ : require_each_included_type_type option) () =
  ({
     password_length = password_length_;
     exclude_characters = exclude_characters_;
     exclude_numbers = exclude_numbers_;
     exclude_punctuation = exclude_punctuation_;
     exclude_uppercase = exclude_uppercase_;
     exclude_lowercase = exclude_lowercase_;
     include_space = include_space_;
     require_each_included_type = require_each_included_type_;
   }
    : get_random_password_request)

let make_get_resource_policy_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : name_type option)
    ?resource_policy:(resource_policy_ : non_empty_resource_policy_type option) () =
  ({ ar_n = ar_n_; name = name_; resource_policy = resource_policy_ }
    : get_resource_policy_response)

let make_get_resource_policy_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : get_resource_policy_request)

let make_get_secret_value_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?created_date:(created_date_ : created_date_type option) () =
  ({
     ar_n = ar_n_;
     name = name_;
     version_id = version_id_;
     secret_binary = secret_binary_;
     secret_string = secret_string_;
     version_stages = version_stages_;
     created_date = created_date_;
   }
    : get_secret_value_response)

let make_get_secret_value_request ?version_id:(version_id_ : secret_version_id_type option)
    ?version_stage:(version_stage_ : secret_version_stage_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_; version_id = version_id_; version_stage = version_stage_ }
    : get_secret_value_request)

let make_secret_versions_list_entry ?version_id:(version_id_ : secret_version_id_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?created_date:(created_date_ : created_date_type option)
    ?kms_key_ids:(kms_key_ids_ : kms_key_id_list_type option) () =
  ({
     version_id = version_id_;
     version_stages = version_stages_;
     last_accessed_date = last_accessed_date_;
     created_date = created_date_;
     kms_key_ids = kms_key_ids_;
   }
    : secret_versions_list_entry)

let make_list_secret_version_ids_response ?versions:(versions_ : secret_versions_list_type option)
    ?next_token:(next_token_ : next_token_type option) ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option) () =
  ({ versions = versions_; next_token = next_token_; ar_n = ar_n_; name = name_ }
    : list_secret_version_ids_response)

let make_list_secret_version_ids_request ?max_results:(max_results_ : max_results_type option)
    ?next_token:(next_token_ : next_token_type option)
    ?include_deprecated:(include_deprecated_ : boolean_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     secret_id = secret_id_;
     max_results = max_results_;
     next_token = next_token_;
     include_deprecated = include_deprecated_;
   }
    : list_secret_version_ids_request)

let make_secret_list_entry ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option) ?type_:(type__ : medea_type_type option)
    ?description:(description_ : description_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?rotation_enabled:(rotation_enabled_ : rotation_enabled_type option)
    ?rotation_lambda_ar_n:(rotation_lambda_ar_n_ : rotation_lambda_arn_type option)
    ?rotation_rules:(rotation_rules_ : rotation_rules_type option)
    ?external_secret_rotation_metadata:
      (external_secret_rotation_metadata_ : external_secret_rotation_metadata_type option)
    ?external_secret_rotation_role_arn:(external_secret_rotation_role_arn_ : role_arn_type option)
    ?last_rotated_date:(last_rotated_date_ : last_rotated_date_type option)
    ?last_changed_date:(last_changed_date_ : last_changed_date_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?deleted_date:(deleted_date_ : deleted_date_type option)
    ?next_rotation_date:(next_rotation_date_ : next_rotation_date_type option)
    ?tags:(tags_ : tag_list_type option)
    ?secret_versions_to_stages:
      (secret_versions_to_stages_ : secret_versions_to_stages_map_type option)
    ?owning_service:(owning_service_ : owning_service_type option)
    ?created_date:(created_date_ : timestamp_type option)
    ?primary_region:(primary_region_ : region_type option) () =
  ({
     ar_n = ar_n_;
     name = name_;
     type_ = type__;
     description = description_;
     kms_key_id = kms_key_id_;
     rotation_enabled = rotation_enabled_;
     rotation_lambda_ar_n = rotation_lambda_ar_n_;
     rotation_rules = rotation_rules_;
     external_secret_rotation_metadata = external_secret_rotation_metadata_;
     external_secret_rotation_role_arn = external_secret_rotation_role_arn_;
     last_rotated_date = last_rotated_date_;
     last_changed_date = last_changed_date_;
     last_accessed_date = last_accessed_date_;
     deleted_date = deleted_date_;
     next_rotation_date = next_rotation_date_;
     tags = tags_;
     secret_versions_to_stages = secret_versions_to_stages_;
     owning_service = owning_service_;
     created_date = created_date_;
     primary_region = primary_region_;
   }
    : secret_list_entry)

let make_list_secrets_response ?secret_list:(secret_list_ : secret_list_type option)
    ?next_token:(next_token_ : next_token_type option) () =
  ({ secret_list = secret_list_; next_token = next_token_ } : list_secrets_response)

let make_list_secrets_request
    ?include_planned_deletion:(include_planned_deletion_ : boolean_type option)
    ?max_results:(max_results_ : max_results_type option)
    ?next_token:(next_token_ : next_token_type option)
    ?filters:(filters_ : filters_list_type option)
    ?sort_order:(sort_order_ : sort_order_type option) ?sort_by:(sort_by_ : sort_by_type option) ()
    =
  ({
     include_planned_deletion = include_planned_deletion_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_secrets_request)

let make_put_resource_policy_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : name_type option) () =
  ({ ar_n = ar_n_; name = name_ } : put_resource_policy_response)

let make_put_resource_policy_request
    ?block_public_policy:(block_public_policy_ : boolean_type option)
    ~secret_id:(secret_id_ : secret_id_type)
    ~resource_policy:(resource_policy_ : non_empty_resource_policy_type) () =
  ({
     secret_id = secret_id_;
     resource_policy = resource_policy_;
     block_public_policy = block_public_policy_;
   }
    : put_resource_policy_request)

let make_put_secret_value_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option) () =
  ({ ar_n = ar_n_; name = name_; version_id = version_id_; version_stages = version_stages_ }
    : put_secret_value_response)

let make_put_secret_value_request
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?rotation_token:(rotation_token_ : rotation_token_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     secret_id = secret_id_;
     client_request_token = client_request_token_;
     secret_binary = secret_binary_;
     secret_string = secret_string_;
     version_stages = version_stages_;
     rotation_token = rotation_token_;
   }
    : put_secret_value_request)

let make_remove_regions_from_replication_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?replication_status:(replication_status_ : replication_status_list_type option) () =
  ({ ar_n = ar_n_; replication_status = replication_status_ }
    : remove_regions_from_replication_response)

let make_remove_regions_from_replication_request ~secret_id:(secret_id_ : secret_id_type)
    ~remove_replica_regions:(remove_replica_regions_ : remove_replica_region_list_type) () =
  ({ secret_id = secret_id_; remove_replica_regions = remove_replica_regions_ }
    : remove_regions_from_replication_request)

let make_replicate_secret_to_regions_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?replication_status:(replication_status_ : replication_status_list_type option) () =
  ({ ar_n = ar_n_; replication_status = replication_status_ }
    : replicate_secret_to_regions_response)

let make_replicate_secret_to_regions_request
    ?force_overwrite_replica_secret:(force_overwrite_replica_secret_ : boolean_type option)
    ~secret_id:(secret_id_ : secret_id_type)
    ~add_replica_regions:(add_replica_regions_ : add_replica_region_list_type) () =
  ({
     secret_id = secret_id_;
     add_replica_regions = add_replica_regions_;
     force_overwrite_replica_secret = force_overwrite_replica_secret_;
   }
    : replicate_secret_to_regions_request)

let make_restore_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option) () =
  ({ ar_n = ar_n_; name = name_ } : restore_secret_response)

let make_restore_secret_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : restore_secret_request)

let make_rotate_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option) () =
  ({ ar_n = ar_n_; name = name_; version_id = version_id_ } : rotate_secret_response)

let make_rotate_secret_request
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ?rotation_lambda_ar_n:(rotation_lambda_ar_n_ : rotation_lambda_arn_type option)
    ?rotation_rules:(rotation_rules_ : rotation_rules_type option)
    ?external_secret_rotation_metadata:
      (external_secret_rotation_metadata_ : external_secret_rotation_metadata_type option)
    ?external_secret_rotation_role_arn:(external_secret_rotation_role_arn_ : role_arn_type option)
    ?rotate_immediately:(rotate_immediately_ : boolean_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     secret_id = secret_id_;
     client_request_token = client_request_token_;
     rotation_lambda_ar_n = rotation_lambda_ar_n_;
     rotation_rules = rotation_rules_;
     external_secret_rotation_metadata = external_secret_rotation_metadata_;
     external_secret_rotation_role_arn = external_secret_rotation_role_arn_;
     rotate_immediately = rotate_immediately_;
   }
    : rotate_secret_request)

let make_stop_replication_to_replica_response ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ ar_n = ar_n_ } : stop_replication_to_replica_response)

let make_stop_replication_to_replica_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : stop_replication_to_replica_request)

let make_tag_resource_request ~secret_id:(secret_id_ : secret_id_type) ~tags:(tags_ : tag_list_type)
    () =
  ({ secret_id = secret_id_; tags = tags_ } : tag_resource_request)

let make_untag_resource_request ~secret_id:(secret_id_ : secret_id_type)
    ~tag_keys:(tag_keys_ : tag_key_list_type) () =
  ({ secret_id = secret_id_; tag_keys = tag_keys_ } : untag_resource_request)

let make_update_secret_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option)
    ?version_id:(version_id_ : secret_version_id_type option) () =
  ({ ar_n = ar_n_; name = name_; version_id = version_id_ } : update_secret_response)

let make_update_secret_request
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ?description:(description_ : description_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?type_:(type__ : medea_type_type option) ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     secret_id = secret_id_;
     client_request_token = client_request_token_;
     description = description_;
     kms_key_id = kms_key_id_;
     secret_binary = secret_binary_;
     secret_string = secret_string_;
     type_ = type__;
   }
    : update_secret_request)

let make_update_secret_version_stage_response ?ar_n:(ar_n_ : secret_arn_type option)
    ?name:(name_ : secret_name_type option) () =
  ({ ar_n = ar_n_; name = name_ } : update_secret_version_stage_response)

let make_update_secret_version_stage_request
    ?remove_from_version_id:(remove_from_version_id_ : secret_version_id_type option)
    ?move_to_version_id:(move_to_version_id_ : secret_version_id_type option)
    ~secret_id:(secret_id_ : secret_id_type)
    ~version_stage:(version_stage_ : secret_version_stage_type) () =
  ({
     secret_id = secret_id_;
     version_stage = version_stage_;
     remove_from_version_id = remove_from_version_id_;
     move_to_version_id = move_to_version_id_;
   }
    : update_secret_version_stage_request)

let make_validation_errors_entry ?check_name:(check_name_ : name_type option)
    ?error_message:(error_message_ : error_message option) () =
  ({ check_name = check_name_; error_message = error_message_ } : validation_errors_entry)

let make_validate_resource_policy_response
    ?policy_validation_passed:(policy_validation_passed_ : boolean_type option)
    ?validation_errors:(validation_errors_ : validation_errors_type option) () =
  ({ policy_validation_passed = policy_validation_passed_; validation_errors = validation_errors_ }
    : validate_resource_policy_response)

let make_validate_resource_policy_request ?secret_id:(secret_id_ : secret_id_type option)
    ~resource_policy:(resource_policy_ : non_empty_resource_policy_type) () =
  ({ secret_id = secret_id_; resource_policy = resource_policy_ }
    : validate_resource_policy_request)
