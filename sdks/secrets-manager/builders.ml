open Types

let make_validation_errors_entry ?error_message:(error_message_ : error_message option)
    ?check_name:(check_name_ : name_type option) () =
  ({ error_message = error_message_; check_name = check_name_ } : validation_errors_entry)

let make_validate_resource_policy_response
    ?validation_errors:(validation_errors_ : validation_errors_type option)
    ?policy_validation_passed:(policy_validation_passed_ : boolean_type option) () =
  ({ validation_errors = validation_errors_; policy_validation_passed = policy_validation_passed_ }
    : validate_resource_policy_response)

let make_validate_resource_policy_request ?secret_id:(secret_id_ : secret_id_type option)
    ~resource_policy:(resource_policy_ : non_empty_resource_policy_type) () =
  ({ resource_policy = resource_policy_; secret_id = secret_id_ }
    : validate_resource_policy_request)

let make_update_secret_version_stage_response ?name:(name_ : secret_name_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ name = name_; ar_n = ar_n_ } : update_secret_version_stage_response)

let make_update_secret_version_stage_request
    ?move_to_version_id:(move_to_version_id_ : secret_version_id_type option)
    ?remove_from_version_id:(remove_from_version_id_ : secret_version_id_type option)
    ~version_stage:(version_stage_ : secret_version_stage_type)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     move_to_version_id = move_to_version_id_;
     remove_from_version_id = remove_from_version_id_;
     version_stage = version_stage_;
     secret_id = secret_id_;
   }
    : update_secret_version_stage_request)

let make_update_secret_response ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ version_id = version_id_; name = name_; ar_n = ar_n_ } : update_secret_response)

let make_update_secret_request ?type_:(type__ : medea_type_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?description:(description_ : description_type option)
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     type_ = type__;
     secret_string = secret_string_;
     secret_binary = secret_binary_;
     kms_key_id = kms_key_id_;
     description = description_;
     client_request_token = client_request_token_;
     secret_id = secret_id_;
   }
    : update_secret_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list_type)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({ tag_keys = tag_keys_; secret_id = secret_id_ } : untag_resource_request)

let make_tag ?value:(value_ : tag_value_type option) ?key:(key_ : tag_key_type option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list_type) ~secret_id:(secret_id_ : secret_id_type)
    () =
  ({ tags = tags_; secret_id = secret_id_ } : tag_resource_request)

let make_stop_replication_to_replica_response ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ ar_n = ar_n_ } : stop_replication_to_replica_response)

let make_stop_replication_to_replica_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : stop_replication_to_replica_request)

let make_rotate_secret_response ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ version_id = version_id_; name = name_; ar_n = ar_n_ } : rotate_secret_response)

let make_rotation_rules_type
    ?schedule_expression:(schedule_expression_ : schedule_expression_type option)
    ?duration:(duration_ : duration_type option)
    ?automatically_after_days:
      (automatically_after_days_ : automatically_rotate_after_days_type option) () =
  ({
     schedule_expression = schedule_expression_;
     duration = duration_;
     automatically_after_days = automatically_after_days_;
   }
    : rotation_rules_type)

let make_external_secret_rotation_metadata_item
    ?value:(value_ : external_secret_rotation_metadata_item_value_type option)
    ?key:(key_ : external_secret_rotation_metadata_item_key_type option) () =
  ({ value = value_; key = key_ } : external_secret_rotation_metadata_item)

let make_rotate_secret_request ?rotate_immediately:(rotate_immediately_ : boolean_type option)
    ?external_secret_rotation_role_arn:(external_secret_rotation_role_arn_ : role_arn_type option)
    ?external_secret_rotation_metadata:
      (external_secret_rotation_metadata_ : external_secret_rotation_metadata_type option)
    ?rotation_rules:(rotation_rules_ : rotation_rules_type option)
    ?rotation_lambda_ar_n:(rotation_lambda_ar_n_ : rotation_lambda_arn_type option)
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     rotate_immediately = rotate_immediately_;
     external_secret_rotation_role_arn = external_secret_rotation_role_arn_;
     external_secret_rotation_metadata = external_secret_rotation_metadata_;
     rotation_rules = rotation_rules_;
     rotation_lambda_ar_n = rotation_lambda_ar_n_;
     client_request_token = client_request_token_;
     secret_id = secret_id_;
   }
    : rotate_secret_request)

let make_restore_secret_response ?name:(name_ : secret_name_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ name = name_; ar_n = ar_n_ } : restore_secret_response)

let make_restore_secret_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : restore_secret_request)

let make_replication_status_type
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?status_message:(status_message_ : status_message_type option)
    ?status:(status_ : status_type option) ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?region:(region_ : region_type option) () =
  ({
     last_accessed_date = last_accessed_date_;
     status_message = status_message_;
     status = status_;
     kms_key_id = kms_key_id_;
     region = region_;
   }
    : replication_status_type)

let make_replicate_secret_to_regions_response
    ?replication_status:(replication_status_ : replication_status_list_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ replication_status = replication_status_; ar_n = ar_n_ }
    : replicate_secret_to_regions_response)

let make_replica_region_type ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?region:(region_ : region_type option) () =
  ({ kms_key_id = kms_key_id_; region = region_ } : replica_region_type)

let make_replicate_secret_to_regions_request
    ?force_overwrite_replica_secret:(force_overwrite_replica_secret_ : boolean_type option)
    ~add_replica_regions:(add_replica_regions_ : add_replica_region_list_type)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     force_overwrite_replica_secret = force_overwrite_replica_secret_;
     add_replica_regions = add_replica_regions_;
     secret_id = secret_id_;
   }
    : replicate_secret_to_regions_request)

let make_remove_regions_from_replication_response
    ?replication_status:(replication_status_ : replication_status_list_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ replication_status = replication_status_; ar_n = ar_n_ }
    : remove_regions_from_replication_response)

let make_remove_regions_from_replication_request
    ~remove_replica_regions:(remove_replica_regions_ : remove_replica_region_list_type)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({ remove_replica_regions = remove_replica_regions_; secret_id = secret_id_ }
    : remove_regions_from_replication_request)

let make_put_secret_value_response
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ version_stages = version_stages_; version_id = version_id_; name = name_; ar_n = ar_n_ }
    : put_secret_value_response)

let make_put_secret_value_request ?rotation_token:(rotation_token_ : rotation_token_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     rotation_token = rotation_token_;
     version_stages = version_stages_;
     secret_string = secret_string_;
     secret_binary = secret_binary_;
     client_request_token = client_request_token_;
     secret_id = secret_id_;
   }
    : put_secret_value_request)

let make_put_resource_policy_response ?name:(name_ : name_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ name = name_; ar_n = ar_n_ } : put_resource_policy_response)

let make_put_resource_policy_request
    ?block_public_policy:(block_public_policy_ : boolean_type option)
    ~resource_policy:(resource_policy_ : non_empty_resource_policy_type)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     block_public_policy = block_public_policy_;
     resource_policy = resource_policy_;
     secret_id = secret_id_;
   }
    : put_resource_policy_request)

let make_secret_versions_list_entry ?kms_key_ids:(kms_key_ids_ : kms_key_id_list_type option)
    ?created_date:(created_date_ : created_date_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?version_id:(version_id_ : secret_version_id_type option) () =
  ({
     kms_key_ids = kms_key_ids_;
     created_date = created_date_;
     last_accessed_date = last_accessed_date_;
     version_stages = version_stages_;
     version_id = version_id_;
   }
    : secret_versions_list_entry)

let make_list_secret_version_ids_response ?name:(name_ : secret_name_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) ?next_token:(next_token_ : next_token_type option)
    ?versions:(versions_ : secret_versions_list_type option) () =
  ({ name = name_; ar_n = ar_n_; next_token = next_token_; versions = versions_ }
    : list_secret_version_ids_response)

let make_list_secret_version_ids_request
    ?include_deprecated:(include_deprecated_ : boolean_type option)
    ?next_token:(next_token_ : next_token_type option)
    ?max_results:(max_results_ : max_results_type option) ~secret_id:(secret_id_ : secret_id_type)
    () =
  ({
     include_deprecated = include_deprecated_;
     next_token = next_token_;
     max_results = max_results_;
     secret_id = secret_id_;
   }
    : list_secret_version_ids_request)

let make_secret_list_entry ?primary_region:(primary_region_ : region_type option)
    ?created_date:(created_date_ : timestamp_type option)
    ?owning_service:(owning_service_ : owning_service_type option)
    ?secret_versions_to_stages:
      (secret_versions_to_stages_ : secret_versions_to_stages_map_type option)
    ?tags:(tags_ : tag_list_type option)
    ?next_rotation_date:(next_rotation_date_ : next_rotation_date_type option)
    ?deleted_date:(deleted_date_ : deleted_date_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?last_changed_date:(last_changed_date_ : last_changed_date_type option)
    ?last_rotated_date:(last_rotated_date_ : last_rotated_date_type option)
    ?external_secret_rotation_role_arn:(external_secret_rotation_role_arn_ : role_arn_type option)
    ?external_secret_rotation_metadata:
      (external_secret_rotation_metadata_ : external_secret_rotation_metadata_type option)
    ?rotation_rules:(rotation_rules_ : rotation_rules_type option)
    ?rotation_lambda_ar_n:(rotation_lambda_ar_n_ : rotation_lambda_arn_type option)
    ?rotation_enabled:(rotation_enabled_ : rotation_enabled_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?description:(description_ : description_type option) ?type_:(type__ : medea_type_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({
     primary_region = primary_region_;
     created_date = created_date_;
     owning_service = owning_service_;
     secret_versions_to_stages = secret_versions_to_stages_;
     tags = tags_;
     next_rotation_date = next_rotation_date_;
     deleted_date = deleted_date_;
     last_accessed_date = last_accessed_date_;
     last_changed_date = last_changed_date_;
     last_rotated_date = last_rotated_date_;
     external_secret_rotation_role_arn = external_secret_rotation_role_arn_;
     external_secret_rotation_metadata = external_secret_rotation_metadata_;
     rotation_rules = rotation_rules_;
     rotation_lambda_ar_n = rotation_lambda_ar_n_;
     rotation_enabled = rotation_enabled_;
     kms_key_id = kms_key_id_;
     description = description_;
     type_ = type__;
     name = name_;
     ar_n = ar_n_;
   }
    : secret_list_entry)

let make_list_secrets_response ?next_token:(next_token_ : next_token_type option)
    ?secret_list:(secret_list_ : secret_list_type option) () =
  ({ next_token = next_token_; secret_list = secret_list_ } : list_secrets_response)

let make_filter ?values:(values_ : filter_values_string_list option)
    ?key:(key_ : filter_name_string_type option) () =
  ({ values = values_; key = key_ } : filter)

let make_list_secrets_request ?sort_by:(sort_by_ : sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?filters:(filters_ : filters_list_type option)
    ?next_token:(next_token_ : next_token_type option)
    ?max_results:(max_results_ : max_results_type option)
    ?include_planned_deletion:(include_planned_deletion_ : boolean_type option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     include_planned_deletion = include_planned_deletion_;
   }
    : list_secrets_request)

let make_get_secret_value_response ?created_date:(created_date_ : created_date_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({
     created_date = created_date_;
     version_stages = version_stages_;
     secret_string = secret_string_;
     secret_binary = secret_binary_;
     version_id = version_id_;
     name = name_;
     ar_n = ar_n_;
   }
    : get_secret_value_response)

let make_get_secret_value_request ?version_stage:(version_stage_ : secret_version_stage_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({ version_stage = version_stage_; version_id = version_id_; secret_id = secret_id_ }
    : get_secret_value_request)

let make_get_resource_policy_response
    ?resource_policy:(resource_policy_ : non_empty_resource_policy_type option)
    ?name:(name_ : name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ resource_policy = resource_policy_; name = name_; ar_n = ar_n_ }
    : get_resource_policy_response)

let make_get_resource_policy_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : get_resource_policy_request)

let make_get_random_password_response
    ?random_password:(random_password_ : random_password_type option) () =
  ({ random_password = random_password_ } : get_random_password_response)

let make_get_random_password_request
    ?require_each_included_type:
      (require_each_included_type_ : require_each_included_type_type option)
    ?include_space:(include_space_ : include_space_type option)
    ?exclude_lowercase:(exclude_lowercase_ : exclude_lowercase_type option)
    ?exclude_uppercase:(exclude_uppercase_ : exclude_uppercase_type option)
    ?exclude_punctuation:(exclude_punctuation_ : exclude_punctuation_type option)
    ?exclude_numbers:(exclude_numbers_ : exclude_numbers_type option)
    ?exclude_characters:(exclude_characters_ : exclude_characters_type option)
    ?password_length:(password_length_ : password_length_type option) () =
  ({
     require_each_included_type = require_each_included_type_;
     include_space = include_space_;
     exclude_lowercase = exclude_lowercase_;
     exclude_uppercase = exclude_uppercase_;
     exclude_punctuation = exclude_punctuation_;
     exclude_numbers = exclude_numbers_;
     exclude_characters = exclude_characters_;
     password_length = password_length_;
   }
    : get_random_password_request)

let make_describe_secret_response
    ?replication_status:(replication_status_ : replication_status_list_type option)
    ?primary_region:(primary_region_ : region_type option)
    ?created_date:(created_date_ : timestamp_type option)
    ?owning_service:(owning_service_ : owning_service_type option)
    ?version_ids_to_stages:(version_ids_to_stages_ : secret_versions_to_stages_map_type option)
    ?tags:(tags_ : tag_list_type option)
    ?next_rotation_date:(next_rotation_date_ : next_rotation_date_type option)
    ?deleted_date:(deleted_date_ : deleted_date_type option)
    ?last_accessed_date:(last_accessed_date_ : last_accessed_date_type option)
    ?last_changed_date:(last_changed_date_ : last_changed_date_type option)
    ?last_rotated_date:(last_rotated_date_ : last_rotated_date_type option)
    ?external_secret_rotation_role_arn:(external_secret_rotation_role_arn_ : role_arn_type option)
    ?external_secret_rotation_metadata:
      (external_secret_rotation_metadata_ : external_secret_rotation_metadata_type option)
    ?rotation_rules:(rotation_rules_ : rotation_rules_type option)
    ?rotation_lambda_ar_n:(rotation_lambda_ar_n_ : rotation_lambda_arn_type option)
    ?rotation_enabled:(rotation_enabled_ : rotation_enabled_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?description:(description_ : description_type option) ?type_:(type__ : medea_type_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({
     replication_status = replication_status_;
     primary_region = primary_region_;
     created_date = created_date_;
     owning_service = owning_service_;
     version_ids_to_stages = version_ids_to_stages_;
     tags = tags_;
     next_rotation_date = next_rotation_date_;
     deleted_date = deleted_date_;
     last_accessed_date = last_accessed_date_;
     last_changed_date = last_changed_date_;
     last_rotated_date = last_rotated_date_;
     external_secret_rotation_role_arn = external_secret_rotation_role_arn_;
     external_secret_rotation_metadata = external_secret_rotation_metadata_;
     rotation_rules = rotation_rules_;
     rotation_lambda_ar_n = rotation_lambda_ar_n_;
     rotation_enabled = rotation_enabled_;
     kms_key_id = kms_key_id_;
     description = description_;
     type_ = type__;
     name = name_;
     ar_n = ar_n_;
   }
    : describe_secret_response)

let make_describe_secret_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : describe_secret_request)

let make_delete_secret_response ?deletion_date:(deletion_date_ : deletion_date_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ deletion_date = deletion_date_; name = name_; ar_n = ar_n_ } : delete_secret_response)

let make_delete_secret_request
    ?force_delete_without_recovery:(force_delete_without_recovery_ : boolean_type option)
    ?recovery_window_in_days:(recovery_window_in_days_ : recovery_window_in_days_type option)
    ~secret_id:(secret_id_ : secret_id_type) () =
  ({
     force_delete_without_recovery = force_delete_without_recovery_;
     recovery_window_in_days = recovery_window_in_days_;
     secret_id = secret_id_;
   }
    : delete_secret_request)

let make_delete_resource_policy_response ?name:(name_ : name_type option)
    ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ name = name_; ar_n = ar_n_ } : delete_resource_policy_response)

let make_delete_resource_policy_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : delete_resource_policy_request)

let make_create_secret_response
    ?replication_status:(replication_status_ : replication_status_list_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({
     replication_status = replication_status_;
     version_id = version_id_;
     name = name_;
     ar_n = ar_n_;
   }
    : create_secret_response)

let make_create_secret_request ?type_:(type__ : medea_type_type option)
    ?force_overwrite_replica_secret:(force_overwrite_replica_secret_ : boolean_type option)
    ?add_replica_regions:(add_replica_regions_ : add_replica_region_list_type option)
    ?tags:(tags_ : tag_list_type option) ?secret_string:(secret_string_ : secret_string_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id_type option)
    ?description:(description_ : description_type option)
    ?client_request_token:(client_request_token_ : client_request_token_type option)
    ~name:(name_ : name_type) () =
  ({
     type_ = type__;
     force_overwrite_replica_secret = force_overwrite_replica_secret_;
     add_replica_regions = add_replica_regions_;
     tags = tags_;
     secret_string = secret_string_;
     secret_binary = secret_binary_;
     kms_key_id = kms_key_id_;
     description = description_;
     client_request_token = client_request_token_;
     name = name_;
   }
    : create_secret_request)

let make_cancel_rotate_secret_response ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({ version_id = version_id_; name = name_; ar_n = ar_n_ } : cancel_rotate_secret_response)

let make_cancel_rotate_secret_request ~secret_id:(secret_id_ : secret_id_type) () =
  ({ secret_id = secret_id_ } : cancel_rotate_secret_request)

let make_secret_value_entry ?created_date:(created_date_ : created_date_type option)
    ?version_stages:(version_stages_ : secret_version_stages_type option)
    ?secret_string:(secret_string_ : secret_string_type option)
    ?secret_binary:(secret_binary_ : secret_binary_type option)
    ?version_id:(version_id_ : secret_version_id_type option)
    ?name:(name_ : secret_name_type option) ?ar_n:(ar_n_ : secret_arn_type option) () =
  ({
     created_date = created_date_;
     version_stages = version_stages_;
     secret_string = secret_string_;
     secret_binary = secret_binary_;
     version_id = version_id_;
     name = name_;
     ar_n = ar_n_;
   }
    : secret_value_entry)

let make_api_error_type ?message:(message_ : error_message option)
    ?error_code:(error_code_ : error_code option) ?secret_id:(secret_id_ : secret_id_type option) ()
    =
  ({ message = message_; error_code = error_code_; secret_id = secret_id_ } : api_error_type)

let make_batch_get_secret_value_response ?errors:(errors_ : api_error_list_type option)
    ?next_token:(next_token_ : next_token_type option)
    ?secret_values:(secret_values_ : secret_values_type option) () =
  ({ errors = errors_; next_token = next_token_; secret_values = secret_values_ }
    : batch_get_secret_value_response)

let make_batch_get_secret_value_request ?next_token:(next_token_ : next_token_type option)
    ?max_results:(max_results_ : max_results_batch_type option)
    ?filters:(filters_ : filters_list_type option)
    ?secret_id_list:(secret_id_list_ : secret_id_list_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     secret_id_list = secret_id_list_;
   }
    : batch_get_secret_value_request)
