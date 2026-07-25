open Types

let make_alias_list_entry ?alias_name:(alias_name_ : alias_name_type option)
    ?alias_arn:(alias_arn_ : arn_type option) ?target_key_id:(target_key_id_ : key_id_type option)
    ?creation_date:(creation_date_ : date_type option)
    ?last_updated_date:(last_updated_date_ : date_type option) () =
  ({
     alias_name = alias_name_;
     alias_arn = alias_arn_;
     target_key_id = target_key_id_;
     creation_date = creation_date_;
     last_updated_date = last_updated_date_;
   }
    : alias_list_entry)

let make_cancel_key_deletion_response ?key_id:(key_id_ : key_id_type option) () =
  ({ key_id = key_id_ } : cancel_key_deletion_response)

let make_cancel_key_deletion_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : cancel_key_deletion_request)

let make_connect_custom_key_store_response () = (() : unit)

let make_connect_custom_key_store_request
    ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({ custom_key_store_id = custom_key_store_id_ } : connect_custom_key_store_request)

let make_create_alias_request ~alias_name:(alias_name_ : alias_name_type)
    ~target_key_id:(target_key_id_ : key_id_type) () =
  ({ alias_name = alias_name_; target_key_id = target_key_id_ } : create_alias_request)

let make_create_custom_key_store_response
    ?custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type option) () =
  ({ custom_key_store_id = custom_key_store_id_ } : create_custom_key_store_response)

let make_xks_proxy_authentication_credential_type
    ~access_key_id:(access_key_id_ : xks_proxy_authentication_access_key_id_type)
    ~raw_secret_access_key:
      (raw_secret_access_key_ : xks_proxy_authentication_raw_secret_access_key_type) () =
  ({ access_key_id = access_key_id_; raw_secret_access_key = raw_secret_access_key_ }
    : xks_proxy_authentication_credential_type)

let make_create_custom_key_store_request
    ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : cloud_hsm_cluster_id_type option)
    ?trust_anchor_certificate:(trust_anchor_certificate_ : trust_anchor_certificate_type option)
    ?key_store_password:(key_store_password_ : key_store_password_type option)
    ?custom_key_store_type:(custom_key_store_type_ : custom_key_store_type option)
    ?xks_proxy_uri_endpoint:(xks_proxy_uri_endpoint_ : xks_proxy_uri_endpoint_type option)
    ?xks_proxy_uri_path:(xks_proxy_uri_path_ : xks_proxy_uri_path_type option)
    ?xks_proxy_vpc_endpoint_service_name:
      (xks_proxy_vpc_endpoint_service_name_ : xks_proxy_vpc_endpoint_service_name_type option)
    ?xks_proxy_vpc_endpoint_service_owner:
      (xks_proxy_vpc_endpoint_service_owner_ : account_id_type option)
    ?xks_proxy_authentication_credential:
      (xks_proxy_authentication_credential_ : xks_proxy_authentication_credential_type option)
    ?xks_proxy_connectivity:(xks_proxy_connectivity_ : xks_proxy_connectivity_type option)
    ~custom_key_store_name:(custom_key_store_name_ : custom_key_store_name_type) () =
  ({
     custom_key_store_name = custom_key_store_name_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     trust_anchor_certificate = trust_anchor_certificate_;
     key_store_password = key_store_password_;
     custom_key_store_type = custom_key_store_type_;
     xks_proxy_uri_endpoint = xks_proxy_uri_endpoint_;
     xks_proxy_uri_path = xks_proxy_uri_path_;
     xks_proxy_vpc_endpoint_service_name = xks_proxy_vpc_endpoint_service_name_;
     xks_proxy_vpc_endpoint_service_owner = xks_proxy_vpc_endpoint_service_owner_;
     xks_proxy_authentication_credential = xks_proxy_authentication_credential_;
     xks_proxy_connectivity = xks_proxy_connectivity_;
   }
    : create_custom_key_store_request)

let make_create_grant_response ?grant_token:(grant_token_ : grant_token_type option)
    ?grant_id:(grant_id_ : grant_id_type option) () =
  ({ grant_token = grant_token_; grant_id = grant_id_ } : create_grant_response)

let make_grant_constraints
    ?encryption_context_subset:(encryption_context_subset_ : encryption_context_type option)
    ?encryption_context_equals:(encryption_context_equals_ : encryption_context_type option)
    ?source_arn:(source_arn_ : grant_constraint_source_arn_type option) () =
  ({
     encryption_context_subset = encryption_context_subset_;
     encryption_context_equals = encryption_context_equals_;
     source_arn = source_arn_;
   }
    : grant_constraints)

let make_create_grant_request ?grantee_principal:(grantee_principal_ : principal_id_type option)
    ?retiring_principal:(retiring_principal_ : principal_id_type option)
    ?constraints:(constraints_ : grant_constraints option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option) ?name:(name_ : grant_name_type option)
    ?dry_run:(dry_run_ : nullable_boolean_type option)
    ?grantee_service_principal:(grantee_service_principal_ : service_principal_type option)
    ?retiring_service_principal:(retiring_service_principal_ : service_principal_type option)
    ~key_id:(key_id_ : key_id_type) ~operations:(operations_ : grant_operation_list) () =
  ({
     key_id = key_id_;
     grantee_principal = grantee_principal_;
     retiring_principal = retiring_principal_;
     operations = operations_;
     constraints = constraints_;
     grant_tokens = grant_tokens_;
     name = name_;
     dry_run = dry_run_;
     grantee_service_principal = grantee_service_principal_;
     retiring_service_principal = retiring_service_principal_;
   }
    : create_grant_request)

let make_xks_key_configuration_type ?id:(id_ : xks_key_id_type option) () =
  ({ id = id_ } : xks_key_configuration_type)

let make_multi_region_key ?arn:(arn_ : arn_type option) ?region:(region_ : region_type option) () =
  ({ arn = arn_; region = region_ } : multi_region_key)

let make_multi_region_configuration
    ?multi_region_key_type:(multi_region_key_type_ : multi_region_key_type option)
    ?primary_key:(primary_key_ : multi_region_key option)
    ?replica_keys:(replica_keys_ : multi_region_key_list option) () =
  ({
     multi_region_key_type = multi_region_key_type_;
     primary_key = primary_key_;
     replica_keys = replica_keys_;
   }
    : multi_region_configuration)

let make_key_metadata ?aws_account_id:(aws_account_id_ : aws_account_id_type option)
    ?arn:(arn_ : arn_type option) ?creation_date:(creation_date_ : date_type option)
    ?enabled:(enabled_ : boolean_type option) ?description:(description_ : description_type option)
    ?key_usage:(key_usage_ : key_usage_type option) ?key_state:(key_state_ : key_state option)
    ?deletion_date:(deletion_date_ : date_type option) ?valid_to:(valid_to_ : date_type option)
    ?origin:(origin_ : origin_type option)
    ?custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type option)
    ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : cloud_hsm_cluster_id_type option)
    ?expiration_model:(expiration_model_ : expiration_model_type option)
    ?key_manager:(key_manager_ : key_manager_type option)
    ?customer_master_key_spec:(customer_master_key_spec_ : customer_master_key_spec option)
    ?key_spec:(key_spec_ : key_spec option)
    ?encryption_algorithms:(encryption_algorithms_ : encryption_algorithm_spec_list option)
    ?signing_algorithms:(signing_algorithms_ : signing_algorithm_spec_list option)
    ?key_agreement_algorithms:(key_agreement_algorithms_ : key_agreement_algorithm_spec_list option)
    ?multi_region:(multi_region_ : nullable_boolean_type option)
    ?multi_region_configuration:(multi_region_configuration_ : multi_region_configuration option)
    ?pending_deletion_window_in_days:
      (pending_deletion_window_in_days_ : pending_window_in_days_type option)
    ?mac_algorithms:(mac_algorithms_ : mac_algorithm_spec_list option)
    ?xks_key_configuration:(xks_key_configuration_ : xks_key_configuration_type option)
    ?current_key_material_id:(current_key_material_id_ : backing_key_id_type option)
    ~key_id:(key_id_ : key_id_type) () =
  ({
     aws_account_id = aws_account_id_;
     key_id = key_id_;
     arn = arn_;
     creation_date = creation_date_;
     enabled = enabled_;
     description = description_;
     key_usage = key_usage_;
     key_state = key_state_;
     deletion_date = deletion_date_;
     valid_to = valid_to_;
     origin = origin_;
     custom_key_store_id = custom_key_store_id_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     expiration_model = expiration_model_;
     key_manager = key_manager_;
     customer_master_key_spec = customer_master_key_spec_;
     key_spec = key_spec_;
     encryption_algorithms = encryption_algorithms_;
     signing_algorithms = signing_algorithms_;
     key_agreement_algorithms = key_agreement_algorithms_;
     multi_region = multi_region_;
     multi_region_configuration = multi_region_configuration_;
     pending_deletion_window_in_days = pending_deletion_window_in_days_;
     mac_algorithms = mac_algorithms_;
     xks_key_configuration = xks_key_configuration_;
     current_key_material_id = current_key_material_id_;
   }
    : key_metadata)

let make_create_key_response ?key_metadata:(key_metadata_ : key_metadata option) () =
  ({ key_metadata = key_metadata_ } : create_key_response)

let make_tag ~tag_key:(tag_key_ : tag_key_type) ~tag_value:(tag_value_ : tag_value_type) () =
  ({ tag_key = tag_key_; tag_value = tag_value_ } : tag)

let make_create_key_request ?policy:(policy_ : policy_type option)
    ?description:(description_ : description_type option)
    ?key_usage:(key_usage_ : key_usage_type option)
    ?customer_master_key_spec:(customer_master_key_spec_ : customer_master_key_spec option)
    ?key_spec:(key_spec_ : key_spec option) ?origin:(origin_ : origin_type option)
    ?custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type option)
    ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ : boolean_type option)
    ?tags:(tags_ : tag_list option) ?multi_region:(multi_region_ : nullable_boolean_type option)
    ?xks_key_id:(xks_key_id_ : xks_key_id_type option) () =
  ({
     policy = policy_;
     description = description_;
     key_usage = key_usage_;
     customer_master_key_spec = customer_master_key_spec_;
     key_spec = key_spec_;
     origin = origin_;
     custom_key_store_id = custom_key_store_id_;
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
     tags = tags_;
     multi_region = multi_region_;
     xks_key_id = xks_key_id_;
   }
    : create_key_request)

let make_xks_proxy_configuration_type
    ?connectivity:(connectivity_ : xks_proxy_connectivity_type option)
    ?access_key_id:(access_key_id_ : xks_proxy_authentication_access_key_id_type option)
    ?uri_endpoint:(uri_endpoint_ : xks_proxy_uri_endpoint_type option)
    ?uri_path:(uri_path_ : xks_proxy_uri_path_type option)
    ?vpc_endpoint_service_name:
      (vpc_endpoint_service_name_ : xks_proxy_vpc_endpoint_service_name_type option)
    ?vpc_endpoint_service_owner:(vpc_endpoint_service_owner_ : account_id_type option) () =
  ({
     connectivity = connectivity_;
     access_key_id = access_key_id_;
     uri_endpoint = uri_endpoint_;
     uri_path = uri_path_;
     vpc_endpoint_service_name = vpc_endpoint_service_name_;
     vpc_endpoint_service_owner = vpc_endpoint_service_owner_;
   }
    : xks_proxy_configuration_type)

let make_custom_key_stores_list_entry
    ?custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type option)
    ?custom_key_store_name:(custom_key_store_name_ : custom_key_store_name_type option)
    ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : cloud_hsm_cluster_id_type option)
    ?trust_anchor_certificate:(trust_anchor_certificate_ : trust_anchor_certificate_type option)
    ?connection_state:(connection_state_ : connection_state_type option)
    ?connection_error_code:(connection_error_code_ : connection_error_code_type option)
    ?creation_date:(creation_date_ : date_type option)
    ?custom_key_store_type:(custom_key_store_type_ : custom_key_store_type option)
    ?xks_proxy_configuration:(xks_proxy_configuration_ : xks_proxy_configuration_type option) () =
  ({
     custom_key_store_id = custom_key_store_id_;
     custom_key_store_name = custom_key_store_name_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     trust_anchor_certificate = trust_anchor_certificate_;
     connection_state = connection_state_;
     connection_error_code = connection_error_code_;
     creation_date = creation_date_;
     custom_key_store_type = custom_key_store_type_;
     xks_proxy_configuration = xks_proxy_configuration_;
   }
    : custom_key_stores_list_entry)

let make_decrypt_response ?key_id:(key_id_ : key_id_type option)
    ?plaintext:(plaintext_ : plaintext_type option)
    ?encryption_algorithm:(encryption_algorithm_ : encryption_algorithm_spec option)
    ?ciphertext_for_recipient:(ciphertext_for_recipient_ : ciphertext_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) () =
  ({
     key_id = key_id_;
     plaintext = plaintext_;
     encryption_algorithm = encryption_algorithm_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_material_id = key_material_id_;
   }
    : decrypt_response)

let make_recipient_info
    ?key_encryption_algorithm:(key_encryption_algorithm_ : key_encryption_mechanism option)
    ?attestation_document:(attestation_document_ : attestation_document_type option) () =
  ({
     key_encryption_algorithm = key_encryption_algorithm_;
     attestation_document = attestation_document_;
   }
    : recipient_info)

let make_decrypt_request ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option)
    ?encryption_context:(encryption_context_ : encryption_context_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option) ?key_id:(key_id_ : key_id_type option)
    ?encryption_algorithm:(encryption_algorithm_ : encryption_algorithm_spec option)
    ?recipient:(recipient_ : recipient_info option)
    ?dry_run:(dry_run_ : nullable_boolean_type option)
    ?dry_run_modifiers:(dry_run_modifiers_ : dry_run_modifier_list option) () =
  ({
     ciphertext_blob = ciphertext_blob_;
     encryption_context = encryption_context_;
     grant_tokens = grant_tokens_;
     key_id = key_id_;
     encryption_algorithm = encryption_algorithm_;
     recipient = recipient_;
     dry_run = dry_run_;
     dry_run_modifiers = dry_run_modifiers_;
   }
    : decrypt_request)

let make_delete_alias_request ~alias_name:(alias_name_ : alias_name_type) () =
  ({ alias_name = alias_name_ } : delete_alias_request)

let make_delete_custom_key_store_response () = (() : unit)

let make_delete_custom_key_store_request
    ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({ custom_key_store_id = custom_key_store_id_ } : delete_custom_key_store_request)

let make_delete_imported_key_material_response ?key_id:(key_id_ : key_id_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_response_type option) () =
  ({ key_id = key_id_; key_material_id = key_material_id_ } : delete_imported_key_material_response)

let make_delete_imported_key_material_request
    ?key_material_id:(key_material_id_ : backing_key_id_type option) ~key_id:(key_id_ : key_id_type)
    () =
  ({ key_id = key_id_; key_material_id = key_material_id_ } : delete_imported_key_material_request)

let make_derive_shared_secret_response ?key_id:(key_id_ : key_id_type option)
    ?shared_secret:(shared_secret_ : plaintext_type option)
    ?ciphertext_for_recipient:(ciphertext_for_recipient_ : ciphertext_type option)
    ?key_agreement_algorithm:(key_agreement_algorithm_ : key_agreement_algorithm_spec option)
    ?key_origin:(key_origin_ : origin_type option) () =
  ({
     key_id = key_id_;
     shared_secret = shared_secret_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_agreement_algorithm = key_agreement_algorithm_;
     key_origin = key_origin_;
   }
    : derive_shared_secret_response)

let make_derive_shared_secret_request ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option)
    ?recipient:(recipient_ : recipient_info option) ~key_id:(key_id_ : key_id_type)
    ~key_agreement_algorithm:(key_agreement_algorithm_ : key_agreement_algorithm_spec)
    ~public_key:(public_key_ : public_key_type) () =
  ({
     key_id = key_id_;
     key_agreement_algorithm = key_agreement_algorithm_;
     public_key = public_key_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
     recipient = recipient_;
   }
    : derive_shared_secret_request)

let make_describe_custom_key_stores_response
    ?custom_key_stores:(custom_key_stores_ : custom_key_stores_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ custom_key_stores = custom_key_stores_; next_marker = next_marker_; truncated = truncated_ }
    : describe_custom_key_stores_response)

let make_describe_custom_key_stores_request
    ?custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type option)
    ?custom_key_store_name:(custom_key_store_name_ : custom_key_store_name_type option)
    ?limit:(limit_ : limit_type option) ?marker:(marker_ : marker_type option) () =
  ({
     custom_key_store_id = custom_key_store_id_;
     custom_key_store_name = custom_key_store_name_;
     limit = limit_;
     marker = marker_;
   }
    : describe_custom_key_stores_request)

let make_describe_key_response ?key_metadata:(key_metadata_ : key_metadata option) () =
  ({ key_metadata = key_metadata_ } : describe_key_response)

let make_describe_key_request ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; grant_tokens = grant_tokens_ } : describe_key_request)

let make_disable_key_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : disable_key_request)

let make_disable_key_rotation_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : disable_key_rotation_request)

let make_disconnect_custom_key_store_response () = (() : unit)

let make_disconnect_custom_key_store_request
    ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({ custom_key_store_id = custom_key_store_id_ } : disconnect_custom_key_store_request)

let make_enable_key_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : enable_key_request)

let make_enable_key_rotation_request
    ?rotation_period_in_days:(rotation_period_in_days_ : rotation_period_in_days_type option)
    ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; rotation_period_in_days = rotation_period_in_days_ }
    : enable_key_rotation_request)

let make_encrypt_response ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option)
    ?key_id:(key_id_ : key_id_type option)
    ?encryption_algorithm:(encryption_algorithm_ : encryption_algorithm_spec option) () =
  ({
     ciphertext_blob = ciphertext_blob_;
     key_id = key_id_;
     encryption_algorithm = encryption_algorithm_;
   }
    : encrypt_response)

let make_encrypt_request ?encryption_context:(encryption_context_ : encryption_context_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?encryption_algorithm:(encryption_algorithm_ : encryption_algorithm_spec option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type)
    ~plaintext:(plaintext_ : plaintext_type) () =
  ({
     key_id = key_id_;
     plaintext = plaintext_;
     encryption_context = encryption_context_;
     grant_tokens = grant_tokens_;
     encryption_algorithm = encryption_algorithm_;
     dry_run = dry_run_;
   }
    : encrypt_request)

let make_generate_data_key_response ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option)
    ?plaintext:(plaintext_ : plaintext_type option) ?key_id:(key_id_ : key_id_type option)
    ?ciphertext_for_recipient:(ciphertext_for_recipient_ : ciphertext_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) () =
  ({
     ciphertext_blob = ciphertext_blob_;
     plaintext = plaintext_;
     key_id = key_id_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_material_id = key_material_id_;
   }
    : generate_data_key_response)

let make_generate_data_key_request
    ?encryption_context:(encryption_context_ : encryption_context_type option)
    ?number_of_bytes:(number_of_bytes_ : number_of_bytes_type option)
    ?key_spec:(key_spec_ : data_key_spec option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?recipient:(recipient_ : recipient_info option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type) () =
  ({
     key_id = key_id_;
     encryption_context = encryption_context_;
     number_of_bytes = number_of_bytes_;
     key_spec = key_spec_;
     grant_tokens = grant_tokens_;
     recipient = recipient_;
     dry_run = dry_run_;
   }
    : generate_data_key_request)

let make_generate_data_key_pair_response
    ?private_key_ciphertext_blob:(private_key_ciphertext_blob_ : ciphertext_type option)
    ?private_key_plaintext:(private_key_plaintext_ : plaintext_type option)
    ?public_key:(public_key_ : public_key_type option) ?key_id:(key_id_ : key_id_type option)
    ?key_pair_spec:(key_pair_spec_ : data_key_pair_spec option)
    ?ciphertext_for_recipient:(ciphertext_for_recipient_ : ciphertext_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) () =
  ({
     private_key_ciphertext_blob = private_key_ciphertext_blob_;
     private_key_plaintext = private_key_plaintext_;
     public_key = public_key_;
     key_id = key_id_;
     key_pair_spec = key_pair_spec_;
     ciphertext_for_recipient = ciphertext_for_recipient_;
     key_material_id = key_material_id_;
   }
    : generate_data_key_pair_response)

let make_generate_data_key_pair_request
    ?encryption_context:(encryption_context_ : encryption_context_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?recipient:(recipient_ : recipient_info option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type)
    ~key_pair_spec:(key_pair_spec_ : data_key_pair_spec) () =
  ({
     encryption_context = encryption_context_;
     key_id = key_id_;
     key_pair_spec = key_pair_spec_;
     grant_tokens = grant_tokens_;
     recipient = recipient_;
     dry_run = dry_run_;
   }
    : generate_data_key_pair_request)

let make_generate_data_key_pair_without_plaintext_response
    ?private_key_ciphertext_blob:(private_key_ciphertext_blob_ : ciphertext_type option)
    ?public_key:(public_key_ : public_key_type option) ?key_id:(key_id_ : key_id_type option)
    ?key_pair_spec:(key_pair_spec_ : data_key_pair_spec option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) () =
  ({
     private_key_ciphertext_blob = private_key_ciphertext_blob_;
     public_key = public_key_;
     key_id = key_id_;
     key_pair_spec = key_pair_spec_;
     key_material_id = key_material_id_;
   }
    : generate_data_key_pair_without_plaintext_response)

let make_generate_data_key_pair_without_plaintext_request
    ?encryption_context:(encryption_context_ : encryption_context_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type)
    ~key_pair_spec:(key_pair_spec_ : data_key_pair_spec) () =
  ({
     encryption_context = encryption_context_;
     key_id = key_id_;
     key_pair_spec = key_pair_spec_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
   }
    : generate_data_key_pair_without_plaintext_request)

let make_generate_data_key_without_plaintext_response
    ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option)
    ?key_id:(key_id_ : key_id_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) () =
  ({ ciphertext_blob = ciphertext_blob_; key_id = key_id_; key_material_id = key_material_id_ }
    : generate_data_key_without_plaintext_response)

let make_generate_data_key_without_plaintext_request
    ?encryption_context:(encryption_context_ : encryption_context_type option)
    ?key_spec:(key_spec_ : data_key_spec option)
    ?number_of_bytes:(number_of_bytes_ : number_of_bytes_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type) () =
  ({
     key_id = key_id_;
     encryption_context = encryption_context_;
     key_spec = key_spec_;
     number_of_bytes = number_of_bytes_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
   }
    : generate_data_key_without_plaintext_request)

let make_generate_mac_response ?mac:(mac_ : ciphertext_type option)
    ?mac_algorithm:(mac_algorithm_ : mac_algorithm_spec option)
    ?key_id:(key_id_ : key_id_type option) () =
  ({ mac = mac_; mac_algorithm = mac_algorithm_; key_id = key_id_ } : generate_mac_response)

let make_generate_mac_request ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~message:(message_ : plaintext_type)
    ~key_id:(key_id_ : key_id_type) ~mac_algorithm:(mac_algorithm_ : mac_algorithm_spec) () =
  ({
     message = message_;
     key_id = key_id_;
     mac_algorithm = mac_algorithm_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
   }
    : generate_mac_request)

let make_generate_random_response ?plaintext:(plaintext_ : plaintext_type option)
    ?ciphertext_for_recipient:(ciphertext_for_recipient_ : ciphertext_type option) () =
  ({ plaintext = plaintext_; ciphertext_for_recipient = ciphertext_for_recipient_ }
    : generate_random_response)

let make_generate_random_request ?number_of_bytes:(number_of_bytes_ : number_of_bytes_type option)
    ?custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type option)
    ?recipient:(recipient_ : recipient_info option) () =
  ({
     number_of_bytes = number_of_bytes_;
     custom_key_store_id = custom_key_store_id_;
     recipient = recipient_;
   }
    : generate_random_request)

let make_key_last_usage_data ?operation:(operation_ : key_last_usage_tracking_operation option)
    ?timestamp:(timestamp_ : date_type option)
    ?cloud_trail_event_id:(cloud_trail_event_id_ : cloud_trail_event_id_type option)
    ?kms_request_id:(kms_request_id_ : kms_request_id_type option) () =
  ({
     operation = operation_;
     timestamp = timestamp_;
     cloud_trail_event_id = cloud_trail_event_id_;
     kms_request_id = kms_request_id_;
   }
    : key_last_usage_data)

let make_get_key_last_usage_response ?key_id:(key_id_ : key_id_type option)
    ?key_last_usage:(key_last_usage_ : key_last_usage_data option)
    ?tracking_start_date:(tracking_start_date_ : date_type option)
    ?key_creation_date:(key_creation_date_ : date_type option) () =
  ({
     key_id = key_id_;
     key_last_usage = key_last_usage_;
     tracking_start_date = tracking_start_date_;
     key_creation_date = key_creation_date_;
   }
    : get_key_last_usage_response)

let make_get_key_last_usage_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : get_key_last_usage_request)

let make_get_key_policy_response ?policy:(policy_ : policy_type option)
    ?policy_name:(policy_name_ : policy_name_type option) () =
  ({ policy = policy_; policy_name = policy_name_ } : get_key_policy_response)

let make_get_key_policy_request ?policy_name:(policy_name_ : policy_name_type option)
    ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; policy_name = policy_name_ } : get_key_policy_request)

let make_get_key_rotation_status_response
    ?key_rotation_enabled:(key_rotation_enabled_ : boolean_type option)
    ?key_id:(key_id_ : key_id_type option)
    ?rotation_period_in_days:(rotation_period_in_days_ : rotation_period_in_days_type option)
    ?next_rotation_date:(next_rotation_date_ : date_type option)
    ?on_demand_rotation_start_date:(on_demand_rotation_start_date_ : date_type option) () =
  ({
     key_rotation_enabled = key_rotation_enabled_;
     key_id = key_id_;
     rotation_period_in_days = rotation_period_in_days_;
     next_rotation_date = next_rotation_date_;
     on_demand_rotation_start_date = on_demand_rotation_start_date_;
   }
    : get_key_rotation_status_response)

let make_get_key_rotation_status_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : get_key_rotation_status_request)

let make_get_parameters_for_import_response ?key_id:(key_id_ : key_id_type option)
    ?import_token:(import_token_ : ciphertext_type option)
    ?public_key:(public_key_ : plaintext_type option)
    ?parameters_valid_to:(parameters_valid_to_ : date_type option) () =
  ({
     key_id = key_id_;
     import_token = import_token_;
     public_key = public_key_;
     parameters_valid_to = parameters_valid_to_;
   }
    : get_parameters_for_import_response)

let make_get_parameters_for_import_request ~key_id:(key_id_ : key_id_type)
    ~wrapping_algorithm:(wrapping_algorithm_ : algorithm_spec)
    ~wrapping_key_spec:(wrapping_key_spec_ : wrapping_key_spec) () =
  ({
     key_id = key_id_;
     wrapping_algorithm = wrapping_algorithm_;
     wrapping_key_spec = wrapping_key_spec_;
   }
    : get_parameters_for_import_request)

let make_get_public_key_response ?key_id:(key_id_ : key_id_type option)
    ?public_key:(public_key_ : public_key_type option)
    ?customer_master_key_spec:(customer_master_key_spec_ : customer_master_key_spec option)
    ?key_spec:(key_spec_ : key_spec option) ?key_usage:(key_usage_ : key_usage_type option)
    ?encryption_algorithms:(encryption_algorithms_ : encryption_algorithm_spec_list option)
    ?signing_algorithms:(signing_algorithms_ : signing_algorithm_spec_list option)
    ?key_agreement_algorithms:(key_agreement_algorithms_ : key_agreement_algorithm_spec_list option)
    () =
  ({
     key_id = key_id_;
     public_key = public_key_;
     customer_master_key_spec = customer_master_key_spec_;
     key_spec = key_spec_;
     key_usage = key_usage_;
     encryption_algorithms = encryption_algorithms_;
     signing_algorithms = signing_algorithms_;
     key_agreement_algorithms = key_agreement_algorithms_;
   }
    : get_public_key_response)

let make_get_public_key_request ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; grant_tokens = grant_tokens_ } : get_public_key_request)

let make_grant_list_entry ?key_id:(key_id_ : key_id_type option)
    ?grant_id:(grant_id_ : grant_id_type option) ?name:(name_ : grant_name_type option)
    ?creation_date:(creation_date_ : date_type option)
    ?grantee_principal:(grantee_principal_ : principal_id_type option)
    ?retiring_principal:(retiring_principal_ : principal_id_type option)
    ?issuing_account:(issuing_account_ : principal_id_type option)
    ?operations:(operations_ : grant_operation_list option)
    ?constraints:(constraints_ : grant_constraints option)
    ?grantee_service_principal:(grantee_service_principal_ : service_principal_type option)
    ?retiring_service_principal:(retiring_service_principal_ : service_principal_type option) () =
  ({
     key_id = key_id_;
     grant_id = grant_id_;
     name = name_;
     creation_date = creation_date_;
     grantee_principal = grantee_principal_;
     retiring_principal = retiring_principal_;
     issuing_account = issuing_account_;
     operations = operations_;
     constraints = constraints_;
     grantee_service_principal = grantee_service_principal_;
     retiring_service_principal = retiring_service_principal_;
   }
    : grant_list_entry)

let make_import_key_material_response ?key_id:(key_id_ : key_id_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) () =
  ({ key_id = key_id_; key_material_id = key_material_id_ } : import_key_material_response)

let make_import_key_material_request ?valid_to:(valid_to_ : date_type option)
    ?expiration_model:(expiration_model_ : expiration_model_type option)
    ?import_type:(import_type_ : import_type option)
    ?key_material_description:(key_material_description_ : key_material_description_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option) ~key_id:(key_id_ : key_id_type)
    ~import_token:(import_token_ : ciphertext_type)
    ~encrypted_key_material:(encrypted_key_material_ : ciphertext_type) () =
  ({
     key_id = key_id_;
     import_token = import_token_;
     encrypted_key_material = encrypted_key_material_;
     valid_to = valid_to_;
     expiration_model = expiration_model_;
     import_type = import_type_;
     key_material_description = key_material_description_;
     key_material_id = key_material_id_;
   }
    : import_key_material_request)

let make_key_list_entry ?key_id:(key_id_ : key_id_type option) ?key_arn:(key_arn_ : arn_type option)
    () =
  ({ key_id = key_id_; key_arn = key_arn_ } : key_list_entry)

let make_list_aliases_response ?aliases:(aliases_ : alias_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ aliases = aliases_; next_marker = next_marker_; truncated = truncated_ }
    : list_aliases_response)

let make_list_aliases_request ?key_id:(key_id_ : key_id_type option)
    ?limit:(limit_ : limit_type option) ?marker:(marker_ : marker_type option) () =
  ({ key_id = key_id_; limit = limit_; marker = marker_ } : list_aliases_request)

let make_list_grants_response ?grants:(grants_ : grant_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ grants = grants_; next_marker = next_marker_; truncated = truncated_ } : list_grants_response)

let make_list_grants_request ?limit:(limit_ : limit_type option)
    ?marker:(marker_ : marker_type option) ?grant_id:(grant_id_ : grant_id_type option)
    ?grantee_principal:(grantee_principal_ : principal_id_type option)
    ?grantee_service_principal:(grantee_service_principal_ : service_principal_type option)
    ~key_id:(key_id_ : key_id_type) () =
  ({
     limit = limit_;
     marker = marker_;
     key_id = key_id_;
     grant_id = grant_id_;
     grantee_principal = grantee_principal_;
     grantee_service_principal = grantee_service_principal_;
   }
    : list_grants_request)

let make_list_key_policies_response ?policy_names:(policy_names_ : policy_name_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ policy_names = policy_names_; next_marker = next_marker_; truncated = truncated_ }
    : list_key_policies_response)

let make_list_key_policies_request ?limit:(limit_ : limit_type option)
    ?marker:(marker_ : marker_type option) ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; limit = limit_; marker = marker_ } : list_key_policies_request)

let make_rotations_list_entry ?key_id:(key_id_ : key_id_type option)
    ?key_material_id:(key_material_id_ : backing_key_id_type option)
    ?key_material_description:(key_material_description_ : key_material_description_type option)
    ?import_state:(import_state_ : import_state option)
    ?key_material_state:(key_material_state_ : key_material_state option)
    ?expiration_model:(expiration_model_ : expiration_model_type option)
    ?valid_to:(valid_to_ : date_type option) ?rotation_date:(rotation_date_ : date_type option)
    ?rotation_type:(rotation_type_ : rotation_type option) () =
  ({
     key_id = key_id_;
     key_material_id = key_material_id_;
     key_material_description = key_material_description_;
     import_state = import_state_;
     key_material_state = key_material_state_;
     expiration_model = expiration_model_;
     valid_to = valid_to_;
     rotation_date = rotation_date_;
     rotation_type = rotation_type_;
   }
    : rotations_list_entry)

let make_list_key_rotations_response ?rotations:(rotations_ : rotations_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ rotations = rotations_; next_marker = next_marker_; truncated = truncated_ }
    : list_key_rotations_response)

let make_list_key_rotations_request
    ?include_key_material:(include_key_material_ : include_key_material option)
    ?limit:(limit_ : limit_type option) ?marker:(marker_ : marker_type option)
    ~key_id:(key_id_ : key_id_type) () =
  ({
     key_id = key_id_;
     include_key_material = include_key_material_;
     limit = limit_;
     marker = marker_;
   }
    : list_key_rotations_request)

let make_list_keys_response ?keys:(keys_ : key_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ keys = keys_; next_marker = next_marker_; truncated = truncated_ } : list_keys_response)

let make_list_keys_request ?limit:(limit_ : limit_type option)
    ?marker:(marker_ : marker_type option) () =
  ({ limit = limit_; marker = marker_ } : list_keys_request)

let make_list_resource_tags_response ?tags:(tags_ : tag_list option)
    ?next_marker:(next_marker_ : marker_type option) ?truncated:(truncated_ : boolean_type option)
    () =
  ({ tags = tags_; next_marker = next_marker_; truncated = truncated_ }
    : list_resource_tags_response)

let make_list_resource_tags_request ?limit:(limit_ : limit_type option)
    ?marker:(marker_ : marker_type option) ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; limit = limit_; marker = marker_ } : list_resource_tags_request)

let make_list_retirable_grants_request ?limit:(limit_ : limit_type option)
    ?marker:(marker_ : marker_type option)
    ?retiring_principal:(retiring_principal_ : principal_id_type option)
    ?retiring_service_principal:(retiring_service_principal_ : service_principal_type option) () =
  ({
     limit = limit_;
     marker = marker_;
     retiring_principal = retiring_principal_;
     retiring_service_principal = retiring_service_principal_;
   }
    : list_retirable_grants_request)

let make_put_key_policy_request ?policy_name:(policy_name_ : policy_name_type option)
    ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ : boolean_type option)
    ~key_id:(key_id_ : key_id_type) ~policy:(policy_ : policy_type) () =
  ({
     key_id = key_id_;
     policy_name = policy_name_;
     policy = policy_;
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
   }
    : put_key_policy_request)

let make_re_encrypt_response ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option)
    ?source_key_id:(source_key_id_ : key_id_type option) ?key_id:(key_id_ : key_id_type option)
    ?source_encryption_algorithm:(source_encryption_algorithm_ : encryption_algorithm_spec option)
    ?destination_encryption_algorithm:
      (destination_encryption_algorithm_ : encryption_algorithm_spec option)
    ?source_key_material_id:(source_key_material_id_ : backing_key_id_type option)
    ?destination_key_material_id:(destination_key_material_id_ : backing_key_id_type option) () =
  ({
     ciphertext_blob = ciphertext_blob_;
     source_key_id = source_key_id_;
     key_id = key_id_;
     source_encryption_algorithm = source_encryption_algorithm_;
     destination_encryption_algorithm = destination_encryption_algorithm_;
     source_key_material_id = source_key_material_id_;
     destination_key_material_id = destination_key_material_id_;
   }
    : re_encrypt_response)

let make_re_encrypt_request ?ciphertext_blob:(ciphertext_blob_ : ciphertext_type option)
    ?source_encryption_context:(source_encryption_context_ : encryption_context_type option)
    ?source_key_id:(source_key_id_ : key_id_type option)
    ?destination_encryption_context:
      (destination_encryption_context_ : encryption_context_type option)
    ?source_encryption_algorithm:(source_encryption_algorithm_ : encryption_algorithm_spec option)
    ?destination_encryption_algorithm:
      (destination_encryption_algorithm_ : encryption_algorithm_spec option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option)
    ?dry_run_modifiers:(dry_run_modifiers_ : dry_run_modifier_list option)
    ~destination_key_id:(destination_key_id_ : key_id_type) () =
  ({
     ciphertext_blob = ciphertext_blob_;
     source_encryption_context = source_encryption_context_;
     source_key_id = source_key_id_;
     destination_key_id = destination_key_id_;
     destination_encryption_context = destination_encryption_context_;
     source_encryption_algorithm = source_encryption_algorithm_;
     destination_encryption_algorithm = destination_encryption_algorithm_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
     dry_run_modifiers = dry_run_modifiers_;
   }
    : re_encrypt_request)

let make_replicate_key_response ?replica_key_metadata:(replica_key_metadata_ : key_metadata option)
    ?replica_policy:(replica_policy_ : policy_type option)
    ?replica_tags:(replica_tags_ : tag_list option) () =
  ({
     replica_key_metadata = replica_key_metadata_;
     replica_policy = replica_policy_;
     replica_tags = replica_tags_;
   }
    : replicate_key_response)

let make_replicate_key_request ?policy:(policy_ : policy_type option)
    ?bypass_policy_lockout_safety_check:(bypass_policy_lockout_safety_check_ : boolean_type option)
    ?description:(description_ : description_type option) ?tags:(tags_ : tag_list option)
    ~key_id:(key_id_ : key_id_type) ~replica_region:(replica_region_ : region_type) () =
  ({
     key_id = key_id_;
     replica_region = replica_region_;
     policy = policy_;
     bypass_policy_lockout_safety_check = bypass_policy_lockout_safety_check_;
     description = description_;
     tags = tags_;
   }
    : replicate_key_request)

let make_retire_grant_request ?grant_token:(grant_token_ : grant_token_type option)
    ?key_id:(key_id_ : key_id_type option) ?grant_id:(grant_id_ : grant_id_type option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) () =
  ({ grant_token = grant_token_; key_id = key_id_; grant_id = grant_id_; dry_run = dry_run_ }
    : retire_grant_request)

let make_revoke_grant_request ?dry_run:(dry_run_ : nullable_boolean_type option)
    ~key_id:(key_id_ : key_id_type) ~grant_id:(grant_id_ : grant_id_type) () =
  ({ key_id = key_id_; grant_id = grant_id_; dry_run = dry_run_ } : revoke_grant_request)

let make_rotate_key_on_demand_response ?key_id:(key_id_ : key_id_type option) () =
  ({ key_id = key_id_ } : rotate_key_on_demand_response)

let make_rotate_key_on_demand_request ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_ } : rotate_key_on_demand_request)

let make_schedule_key_deletion_response ?key_id:(key_id_ : key_id_type option)
    ?deletion_date:(deletion_date_ : date_type option) ?key_state:(key_state_ : key_state option)
    ?pending_window_in_days:(pending_window_in_days_ : pending_window_in_days_type option) () =
  ({
     key_id = key_id_;
     deletion_date = deletion_date_;
     key_state = key_state_;
     pending_window_in_days = pending_window_in_days_;
   }
    : schedule_key_deletion_response)

let make_schedule_key_deletion_request
    ?pending_window_in_days:(pending_window_in_days_ : pending_window_in_days_type option)
    ~key_id:(key_id_ : key_id_type) () =
  ({ key_id = key_id_; pending_window_in_days = pending_window_in_days_ }
    : schedule_key_deletion_request)

let make_sign_response ?key_id:(key_id_ : key_id_type option)
    ?signature:(signature_ : ciphertext_type option)
    ?signing_algorithm:(signing_algorithm_ : signing_algorithm_spec option) () =
  ({ key_id = key_id_; signature = signature_; signing_algorithm = signing_algorithm_ }
    : sign_response)

let make_sign_request ?message_type:(message_type_ : message_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type)
    ~message:(message_ : plaintext_type)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm_spec) () =
  ({
     key_id = key_id_;
     message = message_;
     message_type = message_type_;
     grant_tokens = grant_tokens_;
     signing_algorithm = signing_algorithm_;
     dry_run = dry_run_;
   }
    : sign_request)

let make_tag_resource_request ~key_id:(key_id_ : key_id_type) ~tags:(tags_ : tag_list) () =
  ({ key_id = key_id_; tags = tags_ } : tag_resource_request)

let make_verify_mac_response ?key_id:(key_id_ : key_id_type option)
    ?mac_valid:(mac_valid_ : boolean_type option)
    ?mac_algorithm:(mac_algorithm_ : mac_algorithm_spec option) () =
  ({ key_id = key_id_; mac_valid = mac_valid_; mac_algorithm = mac_algorithm_ }
    : verify_mac_response)

let make_verify_mac_request ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~message:(message_ : plaintext_type)
    ~key_id:(key_id_ : key_id_type) ~mac_algorithm:(mac_algorithm_ : mac_algorithm_spec)
    ~mac:(mac_ : ciphertext_type) () =
  ({
     message = message_;
     key_id = key_id_;
     mac_algorithm = mac_algorithm_;
     mac = mac_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
   }
    : verify_mac_request)

let make_verify_response ?key_id:(key_id_ : key_id_type option)
    ?signature_valid:(signature_valid_ : boolean_type option)
    ?signing_algorithm:(signing_algorithm_ : signing_algorithm_spec option) () =
  ({ key_id = key_id_; signature_valid = signature_valid_; signing_algorithm = signing_algorithm_ }
    : verify_response)

let make_verify_request ?message_type:(message_type_ : message_type option)
    ?grant_tokens:(grant_tokens_ : grant_token_list option)
    ?dry_run:(dry_run_ : nullable_boolean_type option) ~key_id:(key_id_ : key_id_type)
    ~message:(message_ : plaintext_type) ~signature:(signature_ : ciphertext_type)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm_spec) () =
  ({
     key_id = key_id_;
     message = message_;
     message_type = message_type_;
     signature = signature_;
     signing_algorithm = signing_algorithm_;
     grant_tokens = grant_tokens_;
     dry_run = dry_run_;
   }
    : verify_request)

let make_update_primary_region_request ~key_id:(key_id_ : key_id_type)
    ~primary_region:(primary_region_ : region_type) () =
  ({ key_id = key_id_; primary_region = primary_region_ } : update_primary_region_request)

let make_update_key_description_request ~key_id:(key_id_ : key_id_type)
    ~description:(description_ : description_type) () =
  ({ key_id = key_id_; description = description_ } : update_key_description_request)

let make_update_custom_key_store_response () = (() : unit)

let make_update_custom_key_store_request
    ?new_custom_key_store_name:(new_custom_key_store_name_ : custom_key_store_name_type option)
    ?key_store_password:(key_store_password_ : key_store_password_type option)
    ?cloud_hsm_cluster_id:(cloud_hsm_cluster_id_ : cloud_hsm_cluster_id_type option)
    ?xks_proxy_uri_endpoint:(xks_proxy_uri_endpoint_ : xks_proxy_uri_endpoint_type option)
    ?xks_proxy_uri_path:(xks_proxy_uri_path_ : xks_proxy_uri_path_type option)
    ?xks_proxy_vpc_endpoint_service_name:
      (xks_proxy_vpc_endpoint_service_name_ : xks_proxy_vpc_endpoint_service_name_type option)
    ?xks_proxy_vpc_endpoint_service_owner:
      (xks_proxy_vpc_endpoint_service_owner_ : account_id_type option)
    ?xks_proxy_authentication_credential:
      (xks_proxy_authentication_credential_ : xks_proxy_authentication_credential_type option)
    ?xks_proxy_connectivity:(xks_proxy_connectivity_ : xks_proxy_connectivity_type option)
    ~custom_key_store_id:(custom_key_store_id_ : custom_key_store_id_type) () =
  ({
     custom_key_store_id = custom_key_store_id_;
     new_custom_key_store_name = new_custom_key_store_name_;
     key_store_password = key_store_password_;
     cloud_hsm_cluster_id = cloud_hsm_cluster_id_;
     xks_proxy_uri_endpoint = xks_proxy_uri_endpoint_;
     xks_proxy_uri_path = xks_proxy_uri_path_;
     xks_proxy_vpc_endpoint_service_name = xks_proxy_vpc_endpoint_service_name_;
     xks_proxy_vpc_endpoint_service_owner = xks_proxy_vpc_endpoint_service_owner_;
     xks_proxy_authentication_credential = xks_proxy_authentication_credential_;
     xks_proxy_connectivity = xks_proxy_connectivity_;
   }
    : update_custom_key_store_request)

let make_update_alias_request ~alias_name:(alias_name_ : alias_name_type)
    ~target_key_id:(target_key_id_ : key_id_type) () =
  ({ alias_name = alias_name_; target_key_id = target_key_id_ } : update_alias_request)

let make_untag_resource_request ~key_id:(key_id_ : key_id_type) ~tag_keys:(tag_keys_ : tag_key_list)
    () =
  ({ key_id = key_id_; tag_keys = tag_keys_ } : untag_resource_request)
