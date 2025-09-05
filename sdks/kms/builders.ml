open Types
let make_xks_proxy_configuration_type
  ?vpc_endpoint_service_name:(vpc_endpoint_service_name_ :
                               xks_proxy_vpc_endpoint_service_name_type
                                 option)
  ?uri_path:(uri_path_ : xks_proxy_uri_path_type option)
  ?uri_endpoint:(uri_endpoint_ : xks_proxy_uri_endpoint_type option)
  ?access_key_id:(access_key_id_ :
                   xks_proxy_authentication_access_key_id_type option)
  ?connectivity:(connectivity_ : xks_proxy_connectivity_type option) () =
  ({
     vpc_endpoint_service_name = vpc_endpoint_service_name_;
     uri_path = uri_path_;
     uri_endpoint = uri_endpoint_;
     access_key_id = access_key_id_;
     connectivity = connectivity_
   } : xks_proxy_configuration_type)
let make_xks_proxy_authentication_credential_type
  ~raw_secret_access_key:(raw_secret_access_key_ :
                           xks_proxy_authentication_raw_secret_access_key_type)
  ~access_key_id:(access_key_id_ :
                   xks_proxy_authentication_access_key_id_type)
  () =
  ({
     raw_secret_access_key = raw_secret_access_key_;
     access_key_id = access_key_id_
   } : xks_proxy_authentication_credential_type)
let make_xks_key_configuration_type ?id:(id_ : xks_key_id_type option) () =
  ({ id = id_ } : xks_key_configuration_type)
let make_verify_response
  ?signing_algorithm:(signing_algorithm_ : signing_algorithm_spec option)
  ?signature_valid:(signature_valid_ : boolean_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     signing_algorithm = signing_algorithm_;
     signature_valid = signature_valid_;
     key_id = key_id_
   } : verify_response)
let make_verify_request ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?message_type:(message_type_ : message_type option)
  ~signing_algorithm:(signing_algorithm_ : signing_algorithm_spec)
  ~signature:(signature_ : ciphertext_type)
  ~message:(message_ : plaintext_type) ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     signing_algorithm = signing_algorithm_;
     signature = signature_;
     message_type = message_type_;
     message = message_;
     key_id = key_id_
   } : verify_request)
let make_verify_mac_response
  ?mac_algorithm:(mac_algorithm_ : mac_algorithm_spec option)
  ?mac_valid:(mac_valid_ : boolean_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({ mac_algorithm = mac_algorithm_; mac_valid = mac_valid_; key_id = key_id_
   } : verify_mac_response)
let make_verify_mac_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ~mac:(mac_ : ciphertext_type)
  ~mac_algorithm:(mac_algorithm_ : mac_algorithm_spec)
  ~key_id:(key_id_ : key_id_type) ~message:(message_ : plaintext_type) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     mac = mac_;
     mac_algorithm = mac_algorithm_;
     key_id = key_id_;
     message = message_
   } : verify_mac_request)
let make_update_primary_region_request
  ~primary_region:(primary_region_ : region_type)
  ~key_id:(key_id_ : key_id_type) () =
  ({ primary_region = primary_region_; key_id = key_id_ } : update_primary_region_request)
let make_update_key_description_request
  ~description:(description_ : description_type)
  ~key_id:(key_id_ : key_id_type) () =
  ({ description = description_; key_id = key_id_ } : update_key_description_request)
let make_update_custom_key_store_response () = (() : unit)
let make_update_custom_key_store_request
  ?xks_proxy_connectivity:(xks_proxy_connectivity_ :
                            xks_proxy_connectivity_type option)
  ?xks_proxy_authentication_credential:(xks_proxy_authentication_credential_
                                         :
                                         xks_proxy_authentication_credential_type
                                           option)
  ?xks_proxy_vpc_endpoint_service_name:(xks_proxy_vpc_endpoint_service_name_
                                         :
                                         xks_proxy_vpc_endpoint_service_name_type
                                           option)
  ?xks_proxy_uri_path:(xks_proxy_uri_path_ : xks_proxy_uri_path_type option)
  ?xks_proxy_uri_endpoint:(xks_proxy_uri_endpoint_ :
                            xks_proxy_uri_endpoint_type option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ :
                          cloud_hsm_cluster_id_type option)
  ?key_store_password:(key_store_password_ : key_store_password_type option)
  ?new_custom_key_store_name:(new_custom_key_store_name_ :
                               custom_key_store_name_type option)
  ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({
     xks_proxy_connectivity = xks_proxy_connectivity_;
     xks_proxy_authentication_credential =
       xks_proxy_authentication_credential_;
     xks_proxy_vpc_endpoint_service_name =
       xks_proxy_vpc_endpoint_service_name_;
     xks_proxy_uri_path = xks_proxy_uri_path_;
     xks_proxy_uri_endpoint = xks_proxy_uri_endpoint_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     key_store_password = key_store_password_;
     new_custom_key_store_name = new_custom_key_store_name_;
     custom_key_store_id = custom_key_store_id_
   } : update_custom_key_store_request)
let make_update_alias_request ~target_key_id:(target_key_id_ : key_id_type)
  ~alias_name:(alias_name_ : alias_name_type) () =
  ({ target_key_id = target_key_id_; alias_name = alias_name_ } : update_alias_request)
let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
  ~key_id:(key_id_ : key_id_type) () =
  ({ tag_keys = tag_keys_; key_id = key_id_ } : untag_resource_request)
let make_tag ~tag_value:(tag_value_ : tag_value_type)
  ~tag_key:(tag_key_ : tag_key_type) () =
  ({ tag_value = tag_value_; tag_key = tag_key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag_list)
  ~key_id:(key_id_ : key_id_type) () =
  ({ tags = tags_; key_id = key_id_ } : tag_resource_request)
let make_sign_response
  ?signing_algorithm:(signing_algorithm_ : signing_algorithm_spec option)
  ?signature:(signature_ : ciphertext_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     signing_algorithm = signing_algorithm_;
     signature = signature_;
     key_id = key_id_
   } : sign_response)
let make_sign_request ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?message_type:(message_type_ : message_type option)
  ~signing_algorithm:(signing_algorithm_ : signing_algorithm_spec)
  ~message:(message_ : plaintext_type) ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     signing_algorithm = signing_algorithm_;
     grant_tokens = grant_tokens_;
     message_type = message_type_;
     message = message_;
     key_id = key_id_
   } : sign_request)
let make_schedule_key_deletion_response
  ?pending_window_in_days:(pending_window_in_days_ :
                            pending_window_in_days_type option)
  ?key_state:(key_state_ : key_state option)
  ?deletion_date:(deletion_date_ : date_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     pending_window_in_days = pending_window_in_days_;
     key_state = key_state_;
     deletion_date = deletion_date_;
     key_id = key_id_
   } : schedule_key_deletion_response)
let make_schedule_key_deletion_request
  ?pending_window_in_days:(pending_window_in_days_ :
                            pending_window_in_days_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({ pending_window_in_days = pending_window_in_days_; key_id = key_id_ } : 
  schedule_key_deletion_request)
let make_rotate_key_on_demand_response ?key_id:(key_id_ : key_id_type option)
  () = ({ key_id = key_id_ } : rotate_key_on_demand_response)
let make_rotate_key_on_demand_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : rotate_key_on_demand_request)
let make_revoke_grant_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ~grant_id:(grant_id_ : grant_id_type) ~key_id:(key_id_ : key_id_type) () =
  ({ dry_run = dry_run_; grant_id = grant_id_; key_id = key_id_ } : revoke_grant_request)
let make_retire_grant_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_id:(grant_id_ : grant_id_type option)
  ?key_id:(key_id_ : key_id_type option)
  ?grant_token:(grant_token_ : grant_token_type option) () =
  ({
     dry_run = dry_run_;
     grant_id = grant_id_;
     key_id = key_id_;
     grant_token = grant_token_
   } : retire_grant_request)
let make_multi_region_key ?region:(region_ : region_type option)
  ?arn:(arn_ : arn_type option) () =
  ({ region = region_; arn = arn_ } : multi_region_key)
let make_multi_region_configuration
  ?replica_keys:(replica_keys_ : multi_region_key_list option)
  ?primary_key:(primary_key_ : multi_region_key option)
  ?multi_region_key_type:(multi_region_key_type_ :
                           multi_region_key_type option)
  () =
  ({
     replica_keys = replica_keys_;
     primary_key = primary_key_;
     multi_region_key_type = multi_region_key_type_
   } : multi_region_configuration)
let make_key_metadata
  ?current_key_material_id:(current_key_material_id_ :
                             backing_key_id_type option)
  ?xks_key_configuration:(xks_key_configuration_ :
                           xks_key_configuration_type option)
  ?mac_algorithms:(mac_algorithms_ : mac_algorithm_spec_list option)
  ?pending_deletion_window_in_days:(pending_deletion_window_in_days_ :
                                     pending_window_in_days_type option)
  ?multi_region_configuration:(multi_region_configuration_ :
                                multi_region_configuration option)
  ?multi_region:(multi_region_ : nullable_boolean_type option)
  ?key_agreement_algorithms:(key_agreement_algorithms_ :
                              key_agreement_algorithm_spec_list option)
  ?signing_algorithms:(signing_algorithms_ :
                        signing_algorithm_spec_list option)
  ?encryption_algorithms:(encryption_algorithms_ :
                           encryption_algorithm_spec_list option)
  ?key_spec:(key_spec_ : key_spec option)
  ?customer_master_key_spec:(customer_master_key_spec_ :
                              customer_master_key_spec option)
  ?key_manager:(key_manager_ : key_manager_type option)
  ?expiration_model:(expiration_model_ : expiration_model_type option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ :
                          cloud_hsm_cluster_id_type option)
  ?custom_key_store_id:(custom_key_store_id_ :
                         custom_key_store_id_type option)
  ?origin:(origin_ : origin_type option)
  ?valid_to:(valid_to_ : date_type option)
  ?deletion_date:(deletion_date_ : date_type option)
  ?key_state:(key_state_ : key_state option)
  ?key_usage:(key_usage_ : key_usage_type option)
  ?description:(description_ : description_type option)
  ?enabled:(enabled_ : boolean_type option)
  ?creation_date:(creation_date_ : date_type option)
  ?arn:(arn_ : arn_type option)
  ?aws_account_id:(aws_account_id_ : aws_account_id_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     current_key_material_id = current_key_material_id_;
     xks_key_configuration = xks_key_configuration_;
     mac_algorithms = mac_algorithms_;
     pending_deletion_window_in_days = pending_deletion_window_in_days_;
     multi_region_configuration = multi_region_configuration_;
     multi_region = multi_region_;
     key_agreement_algorithms = key_agreement_algorithms_;
     signing_algorithms = signing_algorithms_;
     encryption_algorithms = encryption_algorithms_;
     key_spec = key_spec_;
     customer_master_key_spec = customer_master_key_spec_;
     key_manager = key_manager_;
     expiration_model = expiration_model_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     custom_key_store_id = custom_key_store_id_;
     origin = origin_;
     valid_to = valid_to_;
     deletion_date = deletion_date_;
     key_state = key_state_;
     key_usage = key_usage_;
     description = description_;
     enabled = enabled_;
     creation_date = creation_date_;
     arn = arn_;
     key_id = key_id_;
     aws_account_id = aws_account_id_
   } : key_metadata)
let make_replicate_key_response
  ?replica_tags:(replica_tags_ : tag_list option)
  ?replica_policy:(replica_policy_ : policy_type option)
  ?replica_key_metadata:(replica_key_metadata_ : key_metadata option) () =
  ({
     replica_tags = replica_tags_;
     replica_policy = replica_policy_;
     replica_key_metadata = replica_key_metadata_
   } : replicate_key_response)
let make_replicate_key_request ?tags:(tags_ : tag_list option)
  ?description:(description_ : description_type option)
  ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ :
                                        boolean_type option)
  ?policy:(policy_ : policy_type option)
  ~replica_region:(replica_region_ : region_type)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     tags = tags_;
     description = description_;
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
     policy = policy_;
     replica_region = replica_region_;
     key_id = key_id_
   } : replicate_key_request)
let make_re_encrypt_response
  ?destination_key_material_id:(destination_key_material_id_ :
                                 backing_key_id_type option)
  ?source_key_material_id:(source_key_material_id_ :
                            backing_key_id_type option)
  ?destination_encryption_algorithm:(destination_encryption_algorithm_ :
                                      encryption_algorithm_spec option)
  ?source_encryption_algorithm:(source_encryption_algorithm_ :
                                 encryption_algorithm_spec option)
  ?key_id:(key_id_ : key_id_type option)
  ?source_key_id:(source_key_id_ : key_id_type option)
  ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option) () =
  ({
     destination_key_material_id = destination_key_material_id_;
     source_key_material_id = source_key_material_id_;
     destination_encryption_algorithm = destination_encryption_algorithm_;
     source_encryption_algorithm = source_encryption_algorithm_;
     key_id = key_id_;
     source_key_id = source_key_id_;
     ciphertext_blob = ciphertext_blob_
   } : re_encrypt_response)
let make_re_encrypt_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?destination_encryption_algorithm:(destination_encryption_algorithm_ :
                                      encryption_algorithm_spec option)
  ?source_encryption_algorithm:(source_encryption_algorithm_ :
                                 encryption_algorithm_spec option)
  ?destination_encryption_context:(destination_encryption_context_ :
                                    encryption_context_type option)
  ?source_key_id:(source_key_id_ : key_id_type option)
  ?source_encryption_context:(source_encryption_context_ :
                               encryption_context_type option)
  ~destination_key_id:(destination_key_id_ : key_id_type)
  ~ciphertext_blob:(ciphertext_blob_ : ciphertext_type) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     destination_encryption_algorithm = destination_encryption_algorithm_;
     source_encryption_algorithm = source_encryption_algorithm_;
     destination_encryption_context = destination_encryption_context_;
     destination_key_id = destination_key_id_;
     source_key_id = source_key_id_;
     source_encryption_context = source_encryption_context_;
     ciphertext_blob = ciphertext_blob_
   } : re_encrypt_request)
let make_put_key_policy_request
  ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ :
                                        boolean_type option)
  ?policy_name:(policy_name_ : policy_name_type option)
  ~policy:(policy_ : policy_type) ~key_id:(key_id_ : key_id_type) () =
  ({
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
     policy = policy_;
     policy_name = policy_name_;
     key_id = key_id_
   } : put_key_policy_request)
let make_grant_constraints
  ?encryption_context_equals:(encryption_context_equals_ :
                               encryption_context_type option)
  ?encryption_context_subset:(encryption_context_subset_ :
                               encryption_context_type option)
  () =
  ({
     encryption_context_equals = encryption_context_equals_;
     encryption_context_subset = encryption_context_subset_
   } : grant_constraints)
let make_grant_list_entry
  ?constraints:(constraints_ : grant_constraints option)
  ?operations:(operations_ : grant_operation_list option)
  ?issuing_account:(issuing_account_ : principal_id_type option)
  ?retiring_principal:(retiring_principal_ : principal_id_type option)
  ?grantee_principal:(grantee_principal_ : principal_id_type option)
  ?creation_date:(creation_date_ : date_type option)
  ?name:(name_ : grant_name_type option)
  ?grant_id:(grant_id_ : grant_id_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     constraints = constraints_;
     operations = operations_;
     issuing_account = issuing_account_;
     retiring_principal = retiring_principal_;
     grantee_principal = grantee_principal_;
     creation_date = creation_date_;
     name = name_;
     grant_id = grant_id_;
     key_id = key_id_
   } : grant_list_entry)
let make_list_grants_response ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?grants:(grants_ : grant_list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; grants = grants_ } : 
  list_grants_response)
let make_list_retirable_grants_request ?marker:(marker_ : marker_type option)
  ?limit:(limit_ : limit_type option)
  ~retiring_principal:(retiring_principal_ : principal_id_type) () =
  ({
     retiring_principal = retiring_principal_;
     marker = marker_;
     limit = limit_
   } : list_retirable_grants_request)
let make_list_resource_tags_response
  ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?tags:(tags_ : tag_list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; tags = tags_ } : 
  list_resource_tags_response)
let make_list_resource_tags_request ?marker:(marker_ : marker_type option)
  ?limit:(limit_ : limit_type option) ~key_id:(key_id_ : key_id_type) () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_resource_tags_request)
let make_key_list_entry ?key_arn:(key_arn_ : arn_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({ key_arn = key_arn_; key_id = key_id_ } : key_list_entry)
let make_list_keys_response ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?keys:(keys_ : key_list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; keys = keys_ } : 
  list_keys_response)
let make_list_keys_request ?marker:(marker_ : marker_type option)
  ?limit:(limit_ : limit_type option) () =
  ({ marker = marker_; limit = limit_ } : list_keys_request)
let make_rotations_list_entry
  ?rotation_type:(rotation_type_ : rotation_type option)
  ?rotation_date:(rotation_date_ : date_type option)
  ?valid_to:(valid_to_ : date_type option)
  ?expiration_model:(expiration_model_ : expiration_model_type option)
  ?key_material_state:(key_material_state_ : key_material_state option)
  ?import_state:(import_state_ : import_state option)
  ?key_material_description:(key_material_description_ :
                              key_material_description_type option)
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     rotation_type = rotation_type_;
     rotation_date = rotation_date_;
     valid_to = valid_to_;
     expiration_model = expiration_model_;
     key_material_state = key_material_state_;
     import_state = import_state_;
     key_material_description = key_material_description_;
     key_material_id = key_material_id_;
     key_id = key_id_
   } : rotations_list_entry)
let make_list_key_rotations_response
  ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?rotations:(rotations_ : rotations_list option) () =
  ({
     truncated = truncated_;
     next_marker = next_marker_;
     rotations = rotations_
   } : list_key_rotations_response)
let make_list_key_rotations_request ?marker:(marker_ : marker_type option)
  ?limit:(limit_ : limit_type option)
  ?include_key_material:(include_key_material_ : include_key_material option)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     marker = marker_;
     limit = limit_;
     include_key_material = include_key_material_;
     key_id = key_id_
   } : list_key_rotations_request)
let make_list_key_policies_response
  ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?policy_names:(policy_names_ : policy_name_list option) () =
  ({
     truncated = truncated_;
     next_marker = next_marker_;
     policy_names = policy_names_
   } : list_key_policies_response)
let make_list_key_policies_request ?marker:(marker_ : marker_type option)
  ?limit:(limit_ : limit_type option) ~key_id:(key_id_ : key_id_type) () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_key_policies_request)
let make_list_grants_request
  ?grantee_principal:(grantee_principal_ : principal_id_type option)
  ?grant_id:(grant_id_ : grant_id_type option)
  ?marker:(marker_ : marker_type option) ?limit:(limit_ : limit_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     grantee_principal = grantee_principal_;
     grant_id = grant_id_;
     key_id = key_id_;
     marker = marker_;
     limit = limit_
   } : list_grants_request)
let make_alias_list_entry
  ?last_updated_date:(last_updated_date_ : date_type option)
  ?creation_date:(creation_date_ : date_type option)
  ?target_key_id:(target_key_id_ : key_id_type option)
  ?alias_arn:(alias_arn_ : arn_type option)
  ?alias_name:(alias_name_ : alias_name_type option) () =
  ({
     last_updated_date = last_updated_date_;
     creation_date = creation_date_;
     target_key_id = target_key_id_;
     alias_arn = alias_arn_;
     alias_name = alias_name_
   } : alias_list_entry)
let make_list_aliases_response ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?aliases:(aliases_ : alias_list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; aliases = aliases_ } : 
  list_aliases_response)
let make_list_aliases_request ?marker:(marker_ : marker_type option)
  ?limit:(limit_ : limit_type option) ?key_id:(key_id_ : key_id_type option)
  () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_aliases_request)
let make_import_key_material_response
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({ key_material_id = key_material_id_; key_id = key_id_ } : import_key_material_response)
let make_import_key_material_request
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?key_material_description:(key_material_description_ :
                              key_material_description_type option)
  ?import_type:(import_type_ : import_type option)
  ?expiration_model:(expiration_model_ : expiration_model_type option)
  ?valid_to:(valid_to_ : date_type option)
  ~encrypted_key_material:(encrypted_key_material_ : ciphertext_type)
  ~import_token:(import_token_ : ciphertext_type)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     key_material_id = key_material_id_;
     key_material_description = key_material_description_;
     import_type = import_type_;
     expiration_model = expiration_model_;
     valid_to = valid_to_;
     encrypted_key_material = encrypted_key_material_;
     import_token = import_token_;
     key_id = key_id_
   } : import_key_material_request)
let make_get_public_key_response
  ?key_agreement_algorithms:(key_agreement_algorithms_ :
                              key_agreement_algorithm_spec_list option)
  ?signing_algorithms:(signing_algorithms_ :
                        signing_algorithm_spec_list option)
  ?encryption_algorithms:(encryption_algorithms_ :
                           encryption_algorithm_spec_list option)
  ?key_usage:(key_usage_ : key_usage_type option)
  ?key_spec:(key_spec_ : key_spec option)
  ?customer_master_key_spec:(customer_master_key_spec_ :
                              customer_master_key_spec option)
  ?public_key:(public_key_ : public_key_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     key_agreement_algorithms = key_agreement_algorithms_;
     signing_algorithms = signing_algorithms_;
     encryption_algorithms = encryption_algorithms_;
     key_usage = key_usage_;
     key_spec = key_spec_;
     customer_master_key_spec = customer_master_key_spec_;
     public_key = public_key_;
     key_id = key_id_
   } : get_public_key_response)
let make_get_public_key_request
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ~key_id:(key_id_ : key_id_type) () =
  ({ grant_tokens = grant_tokens_; key_id = key_id_ } : get_public_key_request)
let make_get_parameters_for_import_response
  ?parameters_valid_to:(parameters_valid_to_ : date_type option)
  ?public_key:(public_key_ : plaintext_type option)
  ?import_token:(import_token_ : ciphertext_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     parameters_valid_to = parameters_valid_to_;
     public_key = public_key_;
     import_token = import_token_;
     key_id = key_id_
   } : get_parameters_for_import_response)
let make_get_parameters_for_import_request
  ~wrapping_key_spec:(wrapping_key_spec_ : wrapping_key_spec)
  ~wrapping_algorithm:(wrapping_algorithm_ : algorithm_spec)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     wrapping_key_spec = wrapping_key_spec_;
     wrapping_algorithm = wrapping_algorithm_;
     key_id = key_id_
   } : get_parameters_for_import_request)
let make_get_key_rotation_status_response
  ?on_demand_rotation_start_date:(on_demand_rotation_start_date_ :
                                   date_type option)
  ?next_rotation_date:(next_rotation_date_ : date_type option)
  ?rotation_period_in_days:(rotation_period_in_days_ :
                             rotation_period_in_days_type option)
  ?key_id:(key_id_ : key_id_type option)
  ?key_rotation_enabled:(key_rotation_enabled_ : boolean_type option) () =
  ({
     on_demand_rotation_start_date = on_demand_rotation_start_date_;
     next_rotation_date = next_rotation_date_;
     rotation_period_in_days = rotation_period_in_days_;
     key_id = key_id_;
     key_rotation_enabled = key_rotation_enabled_
   } : get_key_rotation_status_response)
let make_get_key_rotation_status_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : get_key_rotation_status_request)
let make_get_key_policy_response
  ?policy_name:(policy_name_ : policy_name_type option)
  ?policy:(policy_ : policy_type option) () =
  ({ policy_name = policy_name_; policy = policy_ } : get_key_policy_response)
let make_get_key_policy_request
  ?policy_name:(policy_name_ : policy_name_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({ policy_name = policy_name_; key_id = key_id_ } : get_key_policy_request)
let make_generate_random_response
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ :
                              ciphertext_type option)
  ?plaintext:(plaintext_ : plaintext_type option) () =
  ({
     ciphertext_for_recipient = ciphertext_for_recipient_;
     plaintext = plaintext_
   } : generate_random_response)
let make_recipient_info
  ?attestation_document:(attestation_document_ :
                          attestation_document_type option)
  ?key_encryption_algorithm:(key_encryption_algorithm_ :
                              key_encryption_mechanism option)
  () =
  ({
     attestation_document = attestation_document_;
     key_encryption_algorithm = key_encryption_algorithm_
   } : recipient_info)
let make_generate_random_request
  ?recipient:(recipient_ : recipient_info option)
  ?custom_key_store_id:(custom_key_store_id_ :
                         custom_key_store_id_type option)
  ?number_of_bytes:(number_of_bytes_ : number_of_bytes_type option) () =
  ({
     recipient = recipient_;
     custom_key_store_id = custom_key_store_id_;
     number_of_bytes = number_of_bytes_
   } : generate_random_request)
let make_generate_mac_response ?key_id:(key_id_ : key_id_type option)
  ?mac_algorithm:(mac_algorithm_ : mac_algorithm_spec option)
  ?mac:(mac_ : ciphertext_type option) () =
  ({ key_id = key_id_; mac_algorithm = mac_algorithm_; mac = mac_ } : 
  generate_mac_response)
let make_generate_mac_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ~mac_algorithm:(mac_algorithm_ : mac_algorithm_spec)
  ~key_id:(key_id_ : key_id_type) ~message:(message_ : plaintext_type) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     mac_algorithm = mac_algorithm_;
     key_id = key_id_;
     message = message_
   } : generate_mac_request)
let make_generate_data_key_without_plaintext_response
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?key_id:(key_id_ : key_id_type option)
  ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option) () =
  ({
     key_material_id = key_material_id_;
     key_id = key_id_;
     ciphertext_blob = ciphertext_blob_
   } : generate_data_key_without_plaintext_response)
let make_generate_data_key_without_plaintext_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?number_of_bytes:(number_of_bytes_ : number_of_bytes_type option)
  ?key_spec:(key_spec_ : data_key_spec option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     number_of_bytes = number_of_bytes_;
     key_spec = key_spec_;
     encryption_context = encryption_context_;
     key_id = key_id_
   } : generate_data_key_without_plaintext_request)
let make_generate_data_key_pair_without_plaintext_response
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?key_pair_spec:(key_pair_spec_ : data_key_pair_spec option)
  ?key_id:(key_id_ : key_id_type option)
  ?public_key:(public_key_ : public_key_type option)
  ?private_key_ciphertext_blob:(private_key_ciphertext_blob_ :
                                 ciphertext_type option)
  () =
  ({
     key_material_id = key_material_id_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     public_key = public_key_;
     private_key_ciphertext_blob = private_key_ciphertext_blob_
   } : generate_data_key_pair_without_plaintext_response)
let make_generate_data_key_pair_without_plaintext_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_pair_spec:(key_pair_spec_ : data_key_pair_spec)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     encryption_context = encryption_context_
   } : generate_data_key_pair_without_plaintext_request)
let make_generate_data_key_pair_response
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ :
                              ciphertext_type option)
  ?key_pair_spec:(key_pair_spec_ : data_key_pair_spec option)
  ?key_id:(key_id_ : key_id_type option)
  ?public_key:(public_key_ : public_key_type option)
  ?private_key_plaintext:(private_key_plaintext_ : plaintext_type option)
  ?private_key_ciphertext_blob:(private_key_ciphertext_blob_ :
                                 ciphertext_type option)
  () =
  ({
     key_material_id = key_material_id_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     public_key = public_key_;
     private_key_plaintext = private_key_plaintext_;
     private_key_ciphertext_blob = private_key_ciphertext_blob_
   } : generate_data_key_pair_response)
let make_generate_data_key_pair_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?recipient:(recipient_ : recipient_info option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_pair_spec:(key_pair_spec_ : data_key_pair_spec)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     recipient = recipient_;
     grant_tokens = grant_tokens_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     encryption_context = encryption_context_
   } : generate_data_key_pair_request)
let make_generate_data_key_response
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ :
                              ciphertext_type option)
  ?key_id:(key_id_ : key_id_type option)
  ?plaintext:(plaintext_ : plaintext_type option)
  ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option) () =
  ({
     key_material_id = key_material_id_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_id = key_id_;
     plaintext = plaintext_;
     ciphertext_blob = ciphertext_blob_
   } : generate_data_key_response)
let make_generate_data_key_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?recipient:(recipient_ : recipient_info option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?key_spec:(key_spec_ : data_key_spec option)
  ?number_of_bytes:(number_of_bytes_ : number_of_bytes_type option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     recipient = recipient_;
     grant_tokens = grant_tokens_;
     key_spec = key_spec_;
     number_of_bytes = number_of_bytes_;
     encryption_context = encryption_context_;
     key_id = key_id_
   } : generate_data_key_request)
let make_encrypt_response
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?key_id:(key_id_ : key_id_type option)
  ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option) () =
  ({
     encryption_algorithm = encryption_algorithm_;
     key_id = key_id_;
     ciphertext_blob = ciphertext_blob_
   } : encrypt_response)
let make_encrypt_request ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~plaintext:(plaintext_ : plaintext_type) ~key_id:(key_id_ : key_id_type) ()
  =
  ({
     dry_run = dry_run_;
     encryption_algorithm = encryption_algorithm_;
     grant_tokens = grant_tokens_;
     encryption_context = encryption_context_;
     plaintext = plaintext_;
     key_id = key_id_
   } : encrypt_request)
let make_enable_key_rotation_request
  ?rotation_period_in_days:(rotation_period_in_days_ :
                             rotation_period_in_days_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({ rotation_period_in_days = rotation_period_in_days_; key_id = key_id_ } : 
  enable_key_rotation_request)
let make_enable_key_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : enable_key_request)
let make_disconnect_custom_key_store_response () = (() : unit)
let make_disconnect_custom_key_store_request
  ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({ custom_key_store_id = custom_key_store_id_ } : disconnect_custom_key_store_request)
let make_disable_key_rotation_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : disable_key_rotation_request)
let make_disable_key_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : disable_key_request)
let make_describe_key_response
  ?key_metadata:(key_metadata_ : key_metadata option) () =
  ({ key_metadata = key_metadata_ } : describe_key_response)
let make_describe_key_request
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ~key_id:(key_id_ : key_id_type) () =
  ({ grant_tokens = grant_tokens_; key_id = key_id_ } : describe_key_request)
let make_custom_key_stores_list_entry
  ?xks_proxy_configuration:(xks_proxy_configuration_ :
                             xks_proxy_configuration_type option)
  ?custom_key_store_type:(custom_key_store_type_ :
                           custom_key_store_type option)
  ?creation_date:(creation_date_ : date_type option)
  ?connection_error_code:(connection_error_code_ :
                           connection_error_code_type option)
  ?connection_state:(connection_state_ : connection_state_type option)
  ?trust_anchor_certificate:(trust_anchor_certificate_ :
                              trust_anchor_certificate_type option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ :
                          cloud_hsm_cluster_id_type option)
  ?custom_key_store_name:(custom_key_store_name_ :
                           custom_key_store_name_type option)
  ?custom_key_store_id:(custom_key_store_id_ :
                         custom_key_store_id_type option)
  () =
  ({
     xks_proxy_configuration = xks_proxy_configuration_;
     custom_key_store_type = custom_key_store_type_;
     creation_date = creation_date_;
     connection_error_code = connection_error_code_;
     connection_state = connection_state_;
     trust_anchor_certificate = trust_anchor_certificate_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     custom_key_store_name = custom_key_store_name_;
     custom_key_store_id = custom_key_store_id_
   } : custom_key_stores_list_entry)
let make_describe_custom_key_stores_response
  ?truncated:(truncated_ : boolean_type option)
  ?next_marker:(next_marker_ : marker_type option)
  ?custom_key_stores:(custom_key_stores_ : custom_key_stores_list option) ()
  =
  ({
     truncated = truncated_;
     next_marker = next_marker_;
     custom_key_stores = custom_key_stores_
   } : describe_custom_key_stores_response)
let make_describe_custom_key_stores_request
  ?marker:(marker_ : marker_type option) ?limit:(limit_ : limit_type option)
  ?custom_key_store_name:(custom_key_store_name_ :
                           custom_key_store_name_type option)
  ?custom_key_store_id:(custom_key_store_id_ :
                         custom_key_store_id_type option)
  () =
  ({
     marker = marker_;
     limit = limit_;
     custom_key_store_name = custom_key_store_name_;
     custom_key_store_id = custom_key_store_id_
   } : describe_custom_key_stores_request)
let make_derive_shared_secret_response
  ?key_origin:(key_origin_ : origin_type option)
  ?key_agreement_algorithm:(key_agreement_algorithm_ :
                             key_agreement_algorithm_spec option)
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ :
                              ciphertext_type option)
  ?shared_secret:(shared_secret_ : plaintext_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     key_origin = key_origin_;
     key_agreement_algorithm = key_agreement_algorithm_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     shared_secret = shared_secret_;
     key_id = key_id_
   } : derive_shared_secret_response)
let make_derive_shared_secret_request
  ?recipient:(recipient_ : recipient_info option)
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ~public_key:(public_key_ : public_key_type)
  ~key_agreement_algorithm:(key_agreement_algorithm_ :
                             key_agreement_algorithm_spec)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     recipient = recipient_;
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     public_key = public_key_;
     key_agreement_algorithm = key_agreement_algorithm_;
     key_id = key_id_
   } : derive_shared_secret_request)
let make_delete_imported_key_material_response
  ?key_material_id:(key_material_id_ : backing_key_id_response_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({ key_material_id = key_material_id_; key_id = key_id_ } : delete_imported_key_material_response)
let make_delete_imported_key_material_request
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ~key_id:(key_id_ : key_id_type) () =
  ({ key_material_id = key_material_id_; key_id = key_id_ } : delete_imported_key_material_request)
let make_delete_custom_key_store_response () = (() : unit)
let make_delete_custom_key_store_request
  ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({ custom_key_store_id = custom_key_store_id_ } : delete_custom_key_store_request)
let make_delete_alias_request ~alias_name:(alias_name_ : alias_name_type) ()
  = ({ alias_name = alias_name_ } : delete_alias_request)
let make_decrypt_response
  ?key_material_id:(key_material_id_ : backing_key_id_type option)
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ :
                              ciphertext_type option)
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?plaintext:(plaintext_ : plaintext_type option)
  ?key_id:(key_id_ : key_id_type option) () =
  ({
     key_material_id = key_material_id_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     encryption_algorithm = encryption_algorithm_;
     plaintext = plaintext_;
     key_id = key_id_
   } : decrypt_response)
let make_decrypt_request ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?recipient:(recipient_ : recipient_info option)
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?key_id:(key_id_ : key_id_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~ciphertext_blob:(ciphertext_blob_ : ciphertext_type) () =
  ({
     dry_run = dry_run_;
     recipient = recipient_;
     encryption_algorithm = encryption_algorithm_;
     key_id = key_id_;
     grant_tokens = grant_tokens_;
     encryption_context = encryption_context_;
     ciphertext_blob = ciphertext_blob_
   } : decrypt_request)
let make_create_key_response
  ?key_metadata:(key_metadata_ : key_metadata option) () =
  ({ key_metadata = key_metadata_ } : create_key_response)
let make_create_key_request
  ?xks_key_id:(xks_key_id_ : xks_key_id_type option)
  ?multi_region:(multi_region_ : nullable_boolean_type option)
  ?tags:(tags_ : tag_list option)
  ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ :
                                        boolean_type option)
  ?custom_key_store_id:(custom_key_store_id_ :
                         custom_key_store_id_type option)
  ?origin:(origin_ : origin_type option)
  ?key_spec:(key_spec_ : key_spec option)
  ?customer_master_key_spec:(customer_master_key_spec_ :
                              customer_master_key_spec option)
  ?key_usage:(key_usage_ : key_usage_type option)
  ?description:(description_ : description_type option)
  ?policy:(policy_ : policy_type option) () =
  ({
     xks_key_id = xks_key_id_;
     multi_region = multi_region_;
     tags = tags_;
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
     custom_key_store_id = custom_key_store_id_;
     origin = origin_;
     key_spec = key_spec_;
     customer_master_key_spec = customer_master_key_spec_;
     key_usage = key_usage_;
     description = description_;
     policy = policy_
   } : create_key_request)
let make_create_grant_response ?grant_id:(grant_id_ : grant_id_type option)
  ?grant_token:(grant_token_ : grant_token_type option) () =
  ({ grant_id = grant_id_; grant_token = grant_token_ } : create_grant_response)
let make_create_grant_request
  ?dry_run:(dry_run_ : nullable_boolean_type option)
  ?name:(name_ : grant_name_type option)
  ?grant_tokens:(grant_tokens_ : grant_token_list option)
  ?constraints:(constraints_ : grant_constraints option)
  ?retiring_principal:(retiring_principal_ : principal_id_type option)
  ~operations:(operations_ : grant_operation_list)
  ~grantee_principal:(grantee_principal_ : principal_id_type)
  ~key_id:(key_id_ : key_id_type) () =
  ({
     dry_run = dry_run_;
     name = name_;
     grant_tokens = grant_tokens_;
     constraints = constraints_;
     operations = operations_;
     retiring_principal = retiring_principal_;
     grantee_principal = grantee_principal_;
     key_id = key_id_
   } : create_grant_request)
let make_create_custom_key_store_response
  ?custom_key_store_id:(custom_key_store_id_ :
                         custom_key_store_id_type option)
  () =
  ({ custom_key_store_id = custom_key_store_id_ } : create_custom_key_store_response)
let make_create_custom_key_store_request
  ?xks_proxy_connectivity:(xks_proxy_connectivity_ :
                            xks_proxy_connectivity_type option)
  ?xks_proxy_authentication_credential:(xks_proxy_authentication_credential_
                                         :
                                         xks_proxy_authentication_credential_type
                                           option)
  ?xks_proxy_vpc_endpoint_service_name:(xks_proxy_vpc_endpoint_service_name_
                                         :
                                         xks_proxy_vpc_endpoint_service_name_type
                                           option)
  ?xks_proxy_uri_path:(xks_proxy_uri_path_ : xks_proxy_uri_path_type option)
  ?xks_proxy_uri_endpoint:(xks_proxy_uri_endpoint_ :
                            xks_proxy_uri_endpoint_type option)
  ?custom_key_store_type:(custom_key_store_type_ :
                           custom_key_store_type option)
  ?key_store_password:(key_store_password_ : key_store_password_type option)
  ?trust_anchor_certificate:(trust_anchor_certificate_ :
                              trust_anchor_certificate_type option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ :
                          cloud_hsm_cluster_id_type option)
  ~custom_key_store_name:(custom_key_store_name_ :
                           custom_key_store_name_type)
  () =
  ({
     xks_proxy_connectivity = xks_proxy_connectivity_;
     xks_proxy_authentication_credential =
       xks_proxy_authentication_credential_;
     xks_proxy_vpc_endpoint_service_name =
       xks_proxy_vpc_endpoint_service_name_;
     xks_proxy_uri_path = xks_proxy_uri_path_;
     xks_proxy_uri_endpoint = xks_proxy_uri_endpoint_;
     custom_key_store_type = custom_key_store_type_;
     key_store_password = key_store_password_;
     trust_anchor_certificate = trust_anchor_certificate_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     custom_key_store_name = custom_key_store_name_
   } : create_custom_key_store_request)
let make_create_alias_request ~target_key_id:(target_key_id_ : key_id_type)
  ~alias_name:(alias_name_ : alias_name_type) () =
  ({ target_key_id = target_key_id_; alias_name = alias_name_ } : create_alias_request)
let make_connect_custom_key_store_response () = (() : unit)
let make_connect_custom_key_store_request
  ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({ custom_key_store_id = custom_key_store_id_ } : connect_custom_key_store_request)
let make_cancel_key_deletion_response ?key_id:(key_id_ : key_id_type option)
  () = ({ key_id = key_id_ } : cancel_key_deletion_response)
let make_cancel_key_deletion_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : cancel_key_deletion_request)