open Smaws_Lib
open Types
let make_xks_proxy_configuration_type
  ?vpc_endpoint_service_name:(vpc_endpoint_service_name_ : string option)
  ?uri_path:(uri_path_ : string option)
  ?uri_endpoint:(uri_endpoint_ : string option)
  ?access_key_id:(access_key_id_ : string option)
  ?connectivity:(connectivity_ : xks_proxy_connectivity_type option) () =
  ({
     vpc_endpoint_service_name = vpc_endpoint_service_name_;
     uri_path = uri_path_;
     uri_endpoint = uri_endpoint_;
     access_key_id = access_key_id_;
     connectivity = connectivity_
   } : xks_proxy_configuration_type)
let make_xks_proxy_authentication_credential_type
  ~raw_secret_access_key:(raw_secret_access_key_ : string)
  ~access_key_id:(access_key_id_ : string) () =
  ({
     raw_secret_access_key = raw_secret_access_key_;
     access_key_id = access_key_id_
   } : xks_proxy_authentication_credential_type)
let make_xks_key_configuration_type ?id:(id_ : string option) () =
  ({ id = id_ } : xks_key_configuration_type)
let make_verify_response
  ?signing_algorithm:(signing_algorithm_ : signing_algorithm_spec option)
  ?signature_valid:(signature_valid_ : bool option)
  ?key_id:(key_id_ : string option) () =
  ({
     signing_algorithm = signing_algorithm_;
     signature_valid = signature_valid_;
     key_id = key_id_
   } : verify_response)
let make_verify_request ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?message_type:(message_type_ : message_type option)
  ~signing_algorithm:(signing_algorithm_ : signing_algorithm_spec)
  ~signature:(signature_ : bytes) ~message:(message_ : bytes)
  ~key_id:(key_id_ : string) () =
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
  ?mac_valid:(mac_valid_ : bool option) ?key_id:(key_id_ : string option) ()
  =
  ({ mac_algorithm = mac_algorithm_; mac_valid = mac_valid_; key_id = key_id_
   } : verify_mac_response)
let make_verify_mac_request ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option) ~mac:(mac_ : bytes)
  ~mac_algorithm:(mac_algorithm_ : mac_algorithm_spec)
  ~key_id:(key_id_ : string) ~message:(message_ : bytes) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     mac = mac_;
     mac_algorithm = mac_algorithm_;
     key_id = key_id_;
     message = message_
   } : verify_mac_request)
let make_update_primary_region_request
  ~primary_region:(primary_region_ : string) ~key_id:(key_id_ : string) () =
  ({ primary_region = primary_region_; key_id = key_id_ } : update_primary_region_request)
let make_update_key_description_request ~description:(description_ : string)
  ~key_id:(key_id_ : string) () =
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
                                         : string option)
  ?xks_proxy_uri_path:(xks_proxy_uri_path_ : string option)
  ?xks_proxy_uri_endpoint:(xks_proxy_uri_endpoint_ : string option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : string option)
  ?key_store_password:(key_store_password_ : string option)
  ?new_custom_key_store_name:(new_custom_key_store_name_ : string option)
  ~custom_key_store_id:(custom_key_store_id_ : string) () =
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
let make_update_alias_request ~target_key_id:(target_key_id_ : string)
  ~alias_name:(alias_name_ : string) () =
  ({ target_key_id = target_key_id_; alias_name = alias_name_ } : update_alias_request)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list)
  ~key_id:(key_id_ : string) () =
  ({ tag_keys = tag_keys_; key_id = key_id_ } : untag_resource_request)
let make_tag ~tag_value:(tag_value_ : string) ~tag_key:(tag_key_ : string) ()
  = ({ tag_value = tag_value_; tag_key = tag_key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list)
  ~key_id:(key_id_ : string) () =
  ({ tags = tags_; key_id = key_id_ } : tag_resource_request)
let make_sign_response
  ?signing_algorithm:(signing_algorithm_ : signing_algorithm_spec option)
  ?signature:(signature_ : bytes option) ?key_id:(key_id_ : string option) ()
  =
  ({
     signing_algorithm = signing_algorithm_;
     signature = signature_;
     key_id = key_id_
   } : sign_response)
let make_sign_request ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?message_type:(message_type_ : message_type option)
  ~signing_algorithm:(signing_algorithm_ : signing_algorithm_spec)
  ~message:(message_ : bytes) ~key_id:(key_id_ : string) () =
  ({
     dry_run = dry_run_;
     signing_algorithm = signing_algorithm_;
     grant_tokens = grant_tokens_;
     message_type = message_type_;
     message = message_;
     key_id = key_id_
   } : sign_request)
let make_schedule_key_deletion_response
  ?pending_window_in_days:(pending_window_in_days_ : int option)
  ?key_state:(key_state_ : key_state option)
  ?deletion_date:(deletion_date_ : CoreTypes.Timestamp.t option)
  ?key_id:(key_id_ : string option) () =
  ({
     pending_window_in_days = pending_window_in_days_;
     key_state = key_state_;
     deletion_date = deletion_date_;
     key_id = key_id_
   } : schedule_key_deletion_response)
let make_schedule_key_deletion_request
  ?pending_window_in_days:(pending_window_in_days_ : int option)
  ~key_id:(key_id_ : string) () =
  ({ pending_window_in_days = pending_window_in_days_; key_id = key_id_ } : 
  schedule_key_deletion_request)
let make_rotate_key_on_demand_response ?key_id:(key_id_ : string option) () =
  ({ key_id = key_id_ } : rotate_key_on_demand_response)
let make_rotate_key_on_demand_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : rotate_key_on_demand_request)
let make_revoke_grant_request ?dry_run:(dry_run_ : bool option)
  ~grant_id:(grant_id_ : string) ~key_id:(key_id_ : string) () =
  ({ dry_run = dry_run_; grant_id = grant_id_; key_id = key_id_ } : revoke_grant_request)
let make_retire_grant_request ?dry_run:(dry_run_ : bool option)
  ?grant_id:(grant_id_ : string option) ?key_id:(key_id_ : string option)
  ?grant_token:(grant_token_ : string option) () =
  ({
     dry_run = dry_run_;
     grant_id = grant_id_;
     key_id = key_id_;
     grant_token = grant_token_
   } : retire_grant_request)
let make_multi_region_key ?region:(region_ : string option)
  ?arn:(arn_ : string option) () =
  ({ region = region_; arn = arn_ } : multi_region_key)
let make_multi_region_configuration
  ?replica_keys:(replica_keys_ : multi_region_key list option)
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
  ?xks_key_configuration:(xks_key_configuration_ :
                           xks_key_configuration_type option)
  ?mac_algorithms:(mac_algorithms_ : mac_algorithm_spec list option)
  ?pending_deletion_window_in_days:(pending_deletion_window_in_days_ :
                                     int option)
  ?multi_region_configuration:(multi_region_configuration_ :
                                multi_region_configuration option)
  ?multi_region:(multi_region_ : bool option)
  ?key_agreement_algorithms:(key_agreement_algorithms_ :
                              key_agreement_algorithm_spec list option)
  ?signing_algorithms:(signing_algorithms_ :
                        signing_algorithm_spec list option)
  ?encryption_algorithms:(encryption_algorithms_ :
                           encryption_algorithm_spec list option)
  ?key_spec:(key_spec_ : key_spec option)
  ?customer_master_key_spec:(customer_master_key_spec_ :
                              customer_master_key_spec option)
  ?key_manager:(key_manager_ : key_manager_type option)
  ?expiration_model:(expiration_model_ : expiration_model_type option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : string option)
  ?custom_key_store_id:(custom_key_store_id_ : string option)
  ?origin:(origin_ : origin_type option)
  ?valid_to:(valid_to_ : CoreTypes.Timestamp.t option)
  ?deletion_date:(deletion_date_ : CoreTypes.Timestamp.t option)
  ?key_state:(key_state_ : key_state option)
  ?key_usage:(key_usage_ : key_usage_type option)
  ?description:(description_ : string option)
  ?enabled:(enabled_ : bool option)
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option)
  ?aws_account_id:(aws_account_id_ : string option)
  ~key_id:(key_id_ : string) () =
  ({
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
  ?replica_tags:(replica_tags_ : tag list option)
  ?replica_policy:(replica_policy_ : string option)
  ?replica_key_metadata:(replica_key_metadata_ : key_metadata option) () =
  ({
     replica_tags = replica_tags_;
     replica_policy = replica_policy_;
     replica_key_metadata = replica_key_metadata_
   } : replicate_key_response)
let make_replicate_key_request ?tags:(tags_ : tag list option)
  ?description:(description_ : string option)
  ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ :
                                        bool option)
  ?policy:(policy_ : string option)
  ~replica_region:(replica_region_ : string) ~key_id:(key_id_ : string) () =
  ({
     tags = tags_;
     description = description_;
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
     policy = policy_;
     replica_region = replica_region_;
     key_id = key_id_
   } : replicate_key_request)
let make_re_encrypt_response
  ?destination_encryption_algorithm:(destination_encryption_algorithm_ :
                                      encryption_algorithm_spec option)
  ?source_encryption_algorithm:(source_encryption_algorithm_ :
                                 encryption_algorithm_spec option)
  ?key_id:(key_id_ : string option)
  ?source_key_id:(source_key_id_ : string option)
  ?ciphertext_blob:(ciphertext_blob_ : bytes option) () =
  ({
     destination_encryption_algorithm = destination_encryption_algorithm_;
     source_encryption_algorithm = source_encryption_algorithm_;
     key_id = key_id_;
     source_key_id = source_key_id_;
     ciphertext_blob = ciphertext_blob_
   } : re_encrypt_response)
let make_re_encrypt_request ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?destination_encryption_algorithm:(destination_encryption_algorithm_ :
                                      encryption_algorithm_spec option)
  ?source_encryption_algorithm:(source_encryption_algorithm_ :
                                 encryption_algorithm_spec option)
  ?destination_encryption_context:(destination_encryption_context_ :
                                    encryption_context_type option)
  ?source_key_id:(source_key_id_ : string option)
  ?source_encryption_context:(source_encryption_context_ :
                               encryption_context_type option)
  ~destination_key_id:(destination_key_id_ : string)
  ~ciphertext_blob:(ciphertext_blob_ : bytes) () =
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
                                        bool option)
  ?policy_name:(policy_name_ : string option) ~policy:(policy_ : string)
  ~key_id:(key_id_ : string) () =
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
  ?operations:(operations_ : grant_operation list option)
  ?issuing_account:(issuing_account_ : string option)
  ?retiring_principal:(retiring_principal_ : string option)
  ?grantee_principal:(grantee_principal_ : string option)
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option)
  ?name:(name_ : string option) ?grant_id:(grant_id_ : string option)
  ?key_id:(key_id_ : string option) () =
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
let make_list_grants_response ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option)
  ?grants:(grants_ : grant_list_entry list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; grants = grants_ } : 
  list_grants_response)
let make_list_retirable_grants_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option)
  ~retiring_principal:(retiring_principal_ : string) () =
  ({
     retiring_principal = retiring_principal_;
     marker = marker_;
     limit = limit_
   } : list_retirable_grants_request)
let make_list_resource_tags_response ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option) ?tags:(tags_ : tag list option)
  () =
  ({ truncated = truncated_; next_marker = next_marker_; tags = tags_ } : 
  list_resource_tags_response)
let make_list_resource_tags_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option) ~key_id:(key_id_ : string) () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_resource_tags_request)
let make_key_list_entry ?key_arn:(key_arn_ : string option)
  ?key_id:(key_id_ : string option) () =
  ({ key_arn = key_arn_; key_id = key_id_ } : key_list_entry)
let make_list_keys_response ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option)
  ?keys:(keys_ : key_list_entry list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; keys = keys_ } : 
  list_keys_response)
let make_list_keys_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option) () =
  ({ marker = marker_; limit = limit_ } : list_keys_request)
let make_rotations_list_entry
  ?rotation_type:(rotation_type_ : rotation_type option)
  ?rotation_date:(rotation_date_ : CoreTypes.Timestamp.t option)
  ?key_id:(key_id_ : string option) () =
  ({
     rotation_type = rotation_type_;
     rotation_date = rotation_date_;
     key_id = key_id_
   } : rotations_list_entry)
let make_list_key_rotations_response ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option)
  ?rotations:(rotations_ : rotations_list_entry list option) () =
  ({
     truncated = truncated_;
     next_marker = next_marker_;
     rotations = rotations_
   } : list_key_rotations_response)
let make_list_key_rotations_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option) ~key_id:(key_id_ : string) () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_key_rotations_request)
let make_list_key_policies_response ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option)
  ?policy_names:(policy_names_ : string list option) () =
  ({
     truncated = truncated_;
     next_marker = next_marker_;
     policy_names = policy_names_
   } : list_key_policies_response)
let make_list_key_policies_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option) ~key_id:(key_id_ : string) () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_key_policies_request)
let make_list_grants_request
  ?grantee_principal:(grantee_principal_ : string option)
  ?grant_id:(grant_id_ : string option) ?marker:(marker_ : string option)
  ?limit:(limit_ : int option) ~key_id:(key_id_ : string) () =
  ({
     grantee_principal = grantee_principal_;
     grant_id = grant_id_;
     key_id = key_id_;
     marker = marker_;
     limit = limit_
   } : list_grants_request)
let make_alias_list_entry
  ?last_updated_date:(last_updated_date_ : CoreTypes.Timestamp.t option)
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option)
  ?target_key_id:(target_key_id_ : string option)
  ?alias_arn:(alias_arn_ : string option)
  ?alias_name:(alias_name_ : string option) () =
  ({
     last_updated_date = last_updated_date_;
     creation_date = creation_date_;
     target_key_id = target_key_id_;
     alias_arn = alias_arn_;
     alias_name = alias_name_
   } : alias_list_entry)
let make_list_aliases_response ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option)
  ?aliases:(aliases_ : alias_list_entry list option) () =
  ({ truncated = truncated_; next_marker = next_marker_; aliases = aliases_ } : 
  list_aliases_response)
let make_list_aliases_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option) ?key_id:(key_id_ : string option) () =
  ({ marker = marker_; limit = limit_; key_id = key_id_ } : list_aliases_request)
let make_import_key_material_response () = (() : unit)
let make_import_key_material_request
  ?expiration_model:(expiration_model_ : expiration_model_type option)
  ?valid_to:(valid_to_ : CoreTypes.Timestamp.t option)
  ~encrypted_key_material:(encrypted_key_material_ : bytes)
  ~import_token:(import_token_ : bytes) ~key_id:(key_id_ : string) () =
  ({
     expiration_model = expiration_model_;
     valid_to = valid_to_;
     encrypted_key_material = encrypted_key_material_;
     import_token = import_token_;
     key_id = key_id_
   } : import_key_material_request)
let make_get_public_key_response
  ?key_agreement_algorithms:(key_agreement_algorithms_ :
                              key_agreement_algorithm_spec list option)
  ?signing_algorithms:(signing_algorithms_ :
                        signing_algorithm_spec list option)
  ?encryption_algorithms:(encryption_algorithms_ :
                           encryption_algorithm_spec list option)
  ?key_usage:(key_usage_ : key_usage_type option)
  ?key_spec:(key_spec_ : key_spec option)
  ?customer_master_key_spec:(customer_master_key_spec_ :
                              customer_master_key_spec option)
  ?public_key:(public_key_ : bytes option) ?key_id:(key_id_ : string option)
  () =
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
  ?grant_tokens:(grant_tokens_ : string list option)
  ~key_id:(key_id_ : string) () =
  ({ grant_tokens = grant_tokens_; key_id = key_id_ } : get_public_key_request)
let make_get_parameters_for_import_response
  ?parameters_valid_to:(parameters_valid_to_ : CoreTypes.Timestamp.t option)
  ?public_key:(public_key_ : bytes option)
  ?import_token:(import_token_ : bytes option)
  ?key_id:(key_id_ : string option) () =
  ({
     parameters_valid_to = parameters_valid_to_;
     public_key = public_key_;
     import_token = import_token_;
     key_id = key_id_
   } : get_parameters_for_import_response)
let make_get_parameters_for_import_request
  ~wrapping_key_spec:(wrapping_key_spec_ : wrapping_key_spec)
  ~wrapping_algorithm:(wrapping_algorithm_ : algorithm_spec)
  ~key_id:(key_id_ : string) () =
  ({
     wrapping_key_spec = wrapping_key_spec_;
     wrapping_algorithm = wrapping_algorithm_;
     key_id = key_id_
   } : get_parameters_for_import_request)
let make_get_key_rotation_status_response
  ?on_demand_rotation_start_date:(on_demand_rotation_start_date_ :
                                   CoreTypes.Timestamp.t option)
  ?next_rotation_date:(next_rotation_date_ : CoreTypes.Timestamp.t option)
  ?rotation_period_in_days:(rotation_period_in_days_ : int option)
  ?key_id:(key_id_ : string option)
  ?key_rotation_enabled:(key_rotation_enabled_ : bool option) () =
  ({
     on_demand_rotation_start_date = on_demand_rotation_start_date_;
     next_rotation_date = next_rotation_date_;
     rotation_period_in_days = rotation_period_in_days_;
     key_id = key_id_;
     key_rotation_enabled = key_rotation_enabled_
   } : get_key_rotation_status_response)
let make_get_key_rotation_status_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : get_key_rotation_status_request)
let make_get_key_policy_response ?policy_name:(policy_name_ : string option)
  ?policy:(policy_ : string option) () =
  ({ policy_name = policy_name_; policy = policy_ } : get_key_policy_response)
let make_get_key_policy_request ?policy_name:(policy_name_ : string option)
  ~key_id:(key_id_ : string) () =
  ({ policy_name = policy_name_; key_id = key_id_ } : get_key_policy_request)
let make_generate_random_response
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ : bytes option)
  ?plaintext:(plaintext_ : bytes option) () =
  ({
     ciphertext_for_recipient = ciphertext_for_recipient_;
     plaintext = plaintext_
   } : generate_random_response)
let make_recipient_info
  ?attestation_document:(attestation_document_ : bytes option)
  ?key_encryption_algorithm:(key_encryption_algorithm_ :
                              key_encryption_mechanism option)
  () =
  ({
     attestation_document = attestation_document_;
     key_encryption_algorithm = key_encryption_algorithm_
   } : recipient_info)
let make_generate_random_request
  ?recipient:(recipient_ : recipient_info option)
  ?custom_key_store_id:(custom_key_store_id_ : string option)
  ?number_of_bytes:(number_of_bytes_ : int option) () =
  ({
     recipient = recipient_;
     custom_key_store_id = custom_key_store_id_;
     number_of_bytes = number_of_bytes_
   } : generate_random_request)
let make_generate_mac_response ?key_id:(key_id_ : string option)
  ?mac_algorithm:(mac_algorithm_ : mac_algorithm_spec option)
  ?mac:(mac_ : bytes option) () =
  ({ key_id = key_id_; mac_algorithm = mac_algorithm_; mac = mac_ } : 
  generate_mac_response)
let make_generate_mac_request ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ~mac_algorithm:(mac_algorithm_ : mac_algorithm_spec)
  ~key_id:(key_id_ : string) ~message:(message_ : bytes) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     mac_algorithm = mac_algorithm_;
     key_id = key_id_;
     message = message_
   } : generate_mac_request)
let make_generate_data_key_without_plaintext_response
  ?key_id:(key_id_ : string option)
  ?ciphertext_blob:(ciphertext_blob_ : bytes option) () =
  ({ key_id = key_id_; ciphertext_blob = ciphertext_blob_ } : generate_data_key_without_plaintext_response)
let make_generate_data_key_without_plaintext_request
  ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?number_of_bytes:(number_of_bytes_ : int option)
  ?key_spec:(key_spec_ : data_key_spec option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_id:(key_id_ : string) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     number_of_bytes = number_of_bytes_;
     key_spec = key_spec_;
     encryption_context = encryption_context_;
     key_id = key_id_
   } : generate_data_key_without_plaintext_request)
let make_generate_data_key_pair_without_plaintext_response
  ?key_pair_spec:(key_pair_spec_ : data_key_pair_spec option)
  ?key_id:(key_id_ : string option) ?public_key:(public_key_ : bytes option)
  ?private_key_ciphertext_blob:(private_key_ciphertext_blob_ : bytes option)
  () =
  ({
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     public_key = public_key_;
     private_key_ciphertext_blob = private_key_ciphertext_blob_
   } : generate_data_key_pair_without_plaintext_response)
let make_generate_data_key_pair_without_plaintext_request
  ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_pair_spec:(key_pair_spec_ : data_key_pair_spec)
  ~key_id:(key_id_ : string) () =
  ({
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     encryption_context = encryption_context_
   } : generate_data_key_pair_without_plaintext_request)
let make_generate_data_key_pair_response
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ : bytes option)
  ?key_pair_spec:(key_pair_spec_ : data_key_pair_spec option)
  ?key_id:(key_id_ : string option) ?public_key:(public_key_ : bytes option)
  ?private_key_plaintext:(private_key_plaintext_ : bytes option)
  ?private_key_ciphertext_blob:(private_key_ciphertext_blob_ : bytes option)
  () =
  ({
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     public_key = public_key_;
     private_key_plaintext = private_key_plaintext_;
     private_key_ciphertext_blob = private_key_ciphertext_blob_
   } : generate_data_key_pair_response)
let make_generate_data_key_pair_request ?dry_run:(dry_run_ : bool option)
  ?recipient:(recipient_ : recipient_info option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_pair_spec:(key_pair_spec_ : data_key_pair_spec)
  ~key_id:(key_id_ : string) () =
  ({
     dry_run = dry_run_;
     recipient = recipient_;
     grant_tokens = grant_tokens_;
     key_pair_spec = key_pair_spec_;
     key_id = key_id_;
     encryption_context = encryption_context_
   } : generate_data_key_pair_request)
let make_generate_data_key_response
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ : bytes option)
  ?key_id:(key_id_ : string option) ?plaintext:(plaintext_ : bytes option)
  ?ciphertext_blob:(ciphertext_blob_ : bytes option) () =
  ({
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_id = key_id_;
     plaintext = plaintext_;
     ciphertext_blob = ciphertext_blob_
   } : generate_data_key_response)
let make_generate_data_key_request ?dry_run:(dry_run_ : bool option)
  ?recipient:(recipient_ : recipient_info option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?key_spec:(key_spec_ : data_key_spec option)
  ?number_of_bytes:(number_of_bytes_ : int option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~key_id:(key_id_ : string) () =
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
  ?key_id:(key_id_ : string option)
  ?ciphertext_blob:(ciphertext_blob_ : bytes option) () =
  ({
     encryption_algorithm = encryption_algorithm_;
     key_id = key_id_;
     ciphertext_blob = ciphertext_blob_
   } : encrypt_response)
let make_encrypt_request ?dry_run:(dry_run_ : bool option)
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~plaintext:(plaintext_ : bytes) ~key_id:(key_id_ : string) () =
  ({
     dry_run = dry_run_;
     encryption_algorithm = encryption_algorithm_;
     grant_tokens = grant_tokens_;
     encryption_context = encryption_context_;
     plaintext = plaintext_;
     key_id = key_id_
   } : encrypt_request)
let make_enable_key_rotation_request
  ?rotation_period_in_days:(rotation_period_in_days_ : int option)
  ~key_id:(key_id_ : string) () =
  ({ rotation_period_in_days = rotation_period_in_days_; key_id = key_id_ } : 
  enable_key_rotation_request)
let make_enable_key_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : enable_key_request)
let make_disconnect_custom_key_store_response () = (() : unit)
let make_disconnect_custom_key_store_request
  ~custom_key_store_id:(custom_key_store_id_ : string) () =
  ({ custom_key_store_id = custom_key_store_id_ } : disconnect_custom_key_store_request)
let make_disable_key_rotation_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : disable_key_rotation_request)
let make_disable_key_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : disable_key_request)
let make_describe_key_response
  ?key_metadata:(key_metadata_ : key_metadata option) () =
  ({ key_metadata = key_metadata_ } : describe_key_response)
let make_describe_key_request
  ?grant_tokens:(grant_tokens_ : string list option)
  ~key_id:(key_id_ : string) () =
  ({ grant_tokens = grant_tokens_; key_id = key_id_ } : describe_key_request)
let make_custom_key_stores_list_entry
  ?xks_proxy_configuration:(xks_proxy_configuration_ :
                             xks_proxy_configuration_type option)
  ?custom_key_store_type:(custom_key_store_type_ :
                           custom_key_store_type option)
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option)
  ?connection_error_code:(connection_error_code_ :
                           connection_error_code_type option)
  ?connection_state:(connection_state_ : connection_state_type option)
  ?trust_anchor_certificate:(trust_anchor_certificate_ : string option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : string option)
  ?custom_key_store_name:(custom_key_store_name_ : string option)
  ?custom_key_store_id:(custom_key_store_id_ : string option) () =
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
  ?truncated:(truncated_ : bool option)
  ?next_marker:(next_marker_ : string option)
  ?custom_key_stores:(custom_key_stores_ :
                       custom_key_stores_list_entry list option)
  () =
  ({
     truncated = truncated_;
     next_marker = next_marker_;
     custom_key_stores = custom_key_stores_
   } : describe_custom_key_stores_response)
let make_describe_custom_key_stores_request ?marker:(marker_ : string option)
  ?limit:(limit_ : int option)
  ?custom_key_store_name:(custom_key_store_name_ : string option)
  ?custom_key_store_id:(custom_key_store_id_ : string option) () =
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
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ : bytes option)
  ?shared_secret:(shared_secret_ : bytes option)
  ?key_id:(key_id_ : string option) () =
  ({
     key_origin = key_origin_;
     key_agreement_algorithm = key_agreement_algorithm_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     shared_secret = shared_secret_;
     key_id = key_id_
   } : derive_shared_secret_response)
let make_derive_shared_secret_request
  ?recipient:(recipient_ : recipient_info option)
  ?dry_run:(dry_run_ : bool option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ~public_key:(public_key_ : bytes)
  ~key_agreement_algorithm:(key_agreement_algorithm_ :
                             key_agreement_algorithm_spec)
  ~key_id:(key_id_ : string) () =
  ({
     recipient = recipient_;
     dry_run = dry_run_;
     grant_tokens = grant_tokens_;
     public_key = public_key_;
     key_agreement_algorithm = key_agreement_algorithm_;
     key_id = key_id_
   } : derive_shared_secret_request)
let make_delete_imported_key_material_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : delete_imported_key_material_request)
let make_delete_custom_key_store_response () = (() : unit)
let make_delete_custom_key_store_request
  ~custom_key_store_id:(custom_key_store_id_ : string) () =
  ({ custom_key_store_id = custom_key_store_id_ } : delete_custom_key_store_request)
let make_delete_alias_request ~alias_name:(alias_name_ : string) () =
  ({ alias_name = alias_name_ } : delete_alias_request)
let make_decrypt_response
  ?ciphertext_for_recipient:(ciphertext_for_recipient_ : bytes option)
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?plaintext:(plaintext_ : bytes option) ?key_id:(key_id_ : string option) ()
  =
  ({
     ciphertext_for_recipient = ciphertext_for_recipient_;
     encryption_algorithm = encryption_algorithm_;
     plaintext = plaintext_;
     key_id = key_id_
   } : decrypt_response)
let make_decrypt_request ?dry_run:(dry_run_ : bool option)
  ?recipient:(recipient_ : recipient_info option)
  ?encryption_algorithm:(encryption_algorithm_ :
                          encryption_algorithm_spec option)
  ?key_id:(key_id_ : string option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?encryption_context:(encryption_context_ : encryption_context_type option)
  ~ciphertext_blob:(ciphertext_blob_ : bytes) () =
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
let make_create_key_request ?xks_key_id:(xks_key_id_ : string option)
  ?multi_region:(multi_region_ : bool option) ?tags:(tags_ : tag list option)
  ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ :
                                        bool option)
  ?custom_key_store_id:(custom_key_store_id_ : string option)
  ?origin:(origin_ : origin_type option)
  ?key_spec:(key_spec_ : key_spec option)
  ?customer_master_key_spec:(customer_master_key_spec_ :
                              customer_master_key_spec option)
  ?key_usage:(key_usage_ : key_usage_type option)
  ?description:(description_ : string option)
  ?policy:(policy_ : string option) () =
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
let make_create_grant_response ?grant_id:(grant_id_ : string option)
  ?grant_token:(grant_token_ : string option) () =
  ({ grant_id = grant_id_; grant_token = grant_token_ } : create_grant_response)
let make_create_grant_request ?dry_run:(dry_run_ : bool option)
  ?name:(name_ : string option)
  ?grant_tokens:(grant_tokens_ : string list option)
  ?constraints:(constraints_ : grant_constraints option)
  ?retiring_principal:(retiring_principal_ : string option)
  ~operations:(operations_ : grant_operation list)
  ~grantee_principal:(grantee_principal_ : string) ~key_id:(key_id_ : string)
  () =
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
  ?custom_key_store_id:(custom_key_store_id_ : string option) () =
  ({ custom_key_store_id = custom_key_store_id_ } : create_custom_key_store_response)
let make_create_custom_key_store_request
  ?xks_proxy_connectivity:(xks_proxy_connectivity_ :
                            xks_proxy_connectivity_type option)
  ?xks_proxy_authentication_credential:(xks_proxy_authentication_credential_
                                         :
                                         xks_proxy_authentication_credential_type
                                           option)
  ?xks_proxy_vpc_endpoint_service_name:(xks_proxy_vpc_endpoint_service_name_
                                         : string option)
  ?xks_proxy_uri_path:(xks_proxy_uri_path_ : string option)
  ?xks_proxy_uri_endpoint:(xks_proxy_uri_endpoint_ : string option)
  ?custom_key_store_type:(custom_key_store_type_ :
                           custom_key_store_type option)
  ?key_store_password:(key_store_password_ : string option)
  ?trust_anchor_certificate:(trust_anchor_certificate_ : string option)
  ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : string option)
  ~custom_key_store_name:(custom_key_store_name_ : string) () =
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
let make_create_alias_request ~target_key_id:(target_key_id_ : string)
  ~alias_name:(alias_name_ : string) () =
  ({ target_key_id = target_key_id_; alias_name = alias_name_ } : create_alias_request)
let make_connect_custom_key_store_response () = (() : unit)
let make_connect_custom_key_store_request
  ~custom_key_store_id:(custom_key_store_id_ : string) () =
  ({ custom_key_store_id = custom_key_store_id_ } : connect_custom_key_store_request)
let make_cancel_key_deletion_response ?key_id:(key_id_ : string option) () =
  ({ key_id = key_id_ } : cancel_key_deletion_response)
let make_cancel_key_deletion_request ~key_id:(key_id_ : string) () =
  ({ key_id = key_id_ } : cancel_key_deletion_request)