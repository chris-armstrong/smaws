open Types

val make_xks_proxy_configuration_type :
  ?vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
  ?uri_path:xks_proxy_uri_path_type ->
  ?uri_endpoint:xks_proxy_uri_endpoint_type ->
  ?access_key_id:xks_proxy_authentication_access_key_id_type ->
  ?connectivity:xks_proxy_connectivity_type ->
  unit ->
  xks_proxy_configuration_type

val make_xks_proxy_authentication_credential_type :
  raw_secret_access_key:xks_proxy_authentication_raw_secret_access_key_type ->
  access_key_id:xks_proxy_authentication_access_key_id_type ->
  unit ->
  xks_proxy_authentication_credential_type

val make_xks_key_configuration_type : ?id:xks_key_id_type -> unit -> xks_key_configuration_type

val make_verify_response :
  ?signing_algorithm:signing_algorithm_spec ->
  ?signature_valid:boolean_type ->
  ?key_id:key_id_type ->
  unit ->
  verify_response

val make_verify_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  ?message_type:message_type ->
  signing_algorithm:signing_algorithm_spec ->
  signature:ciphertext_type ->
  message:plaintext_type ->
  key_id:key_id_type ->
  unit ->
  verify_request

val make_verify_mac_response :
  ?mac_algorithm:mac_algorithm_spec ->
  ?mac_valid:boolean_type ->
  ?key_id:key_id_type ->
  unit ->
  verify_mac_response

val make_verify_mac_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  mac:ciphertext_type ->
  mac_algorithm:mac_algorithm_spec ->
  key_id:key_id_type ->
  message:plaintext_type ->
  unit ->
  verify_mac_request

val make_update_primary_region_request :
  primary_region:region_type -> key_id:key_id_type -> unit -> update_primary_region_request

val make_update_key_description_request :
  description:description_type -> key_id:key_id_type -> unit -> update_key_description_request

val make_update_custom_key_store_response : unit -> unit

val make_update_custom_key_store_request :
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
  ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type ->
  ?xks_proxy_vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
  ?xks_proxy_uri_path:xks_proxy_uri_path_type ->
  ?xks_proxy_uri_endpoint:xks_proxy_uri_endpoint_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?key_store_password:key_store_password_type ->
  ?new_custom_key_store_name:custom_key_store_name_type ->
  custom_key_store_id:custom_key_store_id_type ->
  unit ->
  update_custom_key_store_request

val make_update_alias_request :
  target_key_id:key_id_type -> alias_name:alias_name_type -> unit -> update_alias_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> key_id:key_id_type -> unit -> untag_resource_request

val make_tag : tag_value:tag_value_type -> tag_key:tag_key_type -> unit -> tag
val make_tag_resource_request : tags:tag_list -> key_id:key_id_type -> unit -> tag_resource_request

val make_sign_response :
  ?signing_algorithm:signing_algorithm_spec ->
  ?signature:ciphertext_type ->
  ?key_id:key_id_type ->
  unit ->
  sign_response

val make_sign_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  ?message_type:message_type ->
  signing_algorithm:signing_algorithm_spec ->
  message:plaintext_type ->
  key_id:key_id_type ->
  unit ->
  sign_request

val make_schedule_key_deletion_response :
  ?pending_window_in_days:pending_window_in_days_type ->
  ?key_state:key_state ->
  ?deletion_date:date_type ->
  ?key_id:key_id_type ->
  unit ->
  schedule_key_deletion_response

val make_schedule_key_deletion_request :
  ?pending_window_in_days:pending_window_in_days_type ->
  key_id:key_id_type ->
  unit ->
  schedule_key_deletion_request

val make_rotate_key_on_demand_response :
  ?key_id:key_id_type -> unit -> rotate_key_on_demand_response

val make_rotate_key_on_demand_request : key_id:key_id_type -> unit -> rotate_key_on_demand_request

val make_revoke_grant_request :
  ?dry_run:nullable_boolean_type ->
  grant_id:grant_id_type ->
  key_id:key_id_type ->
  unit ->
  revoke_grant_request

val make_retire_grant_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_id:grant_id_type ->
  ?key_id:key_id_type ->
  ?grant_token:grant_token_type ->
  unit ->
  retire_grant_request

val make_multi_region_key : ?region:region_type -> ?arn:arn_type -> unit -> multi_region_key

val make_multi_region_configuration :
  ?replica_keys:multi_region_key_list ->
  ?primary_key:multi_region_key ->
  ?multi_region_key_type:multi_region_key_type ->
  unit ->
  multi_region_configuration

val make_key_metadata :
  ?current_key_material_id:backing_key_id_type ->
  ?xks_key_configuration:xks_key_configuration_type ->
  ?mac_algorithms:mac_algorithm_spec_list ->
  ?pending_deletion_window_in_days:pending_window_in_days_type ->
  ?multi_region_configuration:multi_region_configuration ->
  ?multi_region:nullable_boolean_type ->
  ?key_agreement_algorithms:key_agreement_algorithm_spec_list ->
  ?signing_algorithms:signing_algorithm_spec_list ->
  ?encryption_algorithms:encryption_algorithm_spec_list ->
  ?key_spec:key_spec ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_manager:key_manager_type ->
  ?expiration_model:expiration_model_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  ?origin:origin_type ->
  ?valid_to:date_type ->
  ?deletion_date:date_type ->
  ?key_state:key_state ->
  ?key_usage:key_usage_type ->
  ?description:description_type ->
  ?enabled:boolean_type ->
  ?creation_date:date_type ->
  ?arn:arn_type ->
  ?aws_account_id:aws_account_id_type ->
  key_id:key_id_type ->
  unit ->
  key_metadata

val make_replicate_key_response :
  ?replica_tags:tag_list ->
  ?replica_policy:policy_type ->
  ?replica_key_metadata:key_metadata ->
  unit ->
  replicate_key_response

val make_replicate_key_request :
  ?tags:tag_list ->
  ?description:description_type ->
  ?bypass_policy_lockout_safety_check:boolean_type ->
  ?policy:policy_type ->
  replica_region:region_type ->
  key_id:key_id_type ->
  unit ->
  replicate_key_request

val make_re_encrypt_response :
  ?destination_key_material_id:backing_key_id_type ->
  ?source_key_material_id:backing_key_id_type ->
  ?destination_encryption_algorithm:encryption_algorithm_spec ->
  ?source_encryption_algorithm:encryption_algorithm_spec ->
  ?key_id:key_id_type ->
  ?source_key_id:key_id_type ->
  ?ciphertext_blob:ciphertext_type ->
  unit ->
  re_encrypt_response

val make_re_encrypt_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  ?destination_encryption_algorithm:encryption_algorithm_spec ->
  ?source_encryption_algorithm:encryption_algorithm_spec ->
  ?destination_encryption_context:encryption_context_type ->
  ?source_key_id:key_id_type ->
  ?source_encryption_context:encryption_context_type ->
  destination_key_id:key_id_type ->
  ciphertext_blob:ciphertext_type ->
  unit ->
  re_encrypt_request

val make_put_key_policy_request :
  ?bypass_policy_lockout_safety_check:boolean_type ->
  ?policy_name:policy_name_type ->
  policy:policy_type ->
  key_id:key_id_type ->
  unit ->
  put_key_policy_request

val make_grant_constraints :
  ?encryption_context_equals:encryption_context_type ->
  ?encryption_context_subset:encryption_context_type ->
  unit ->
  grant_constraints

val make_grant_list_entry :
  ?constraints:grant_constraints ->
  ?operations:grant_operation_list ->
  ?issuing_account:principal_id_type ->
  ?retiring_principal:principal_id_type ->
  ?grantee_principal:principal_id_type ->
  ?creation_date:date_type ->
  ?name:grant_name_type ->
  ?grant_id:grant_id_type ->
  ?key_id:key_id_type ->
  unit ->
  grant_list_entry

val make_list_grants_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?grants:grant_list ->
  unit ->
  list_grants_response

val make_list_retirable_grants_request :
  ?marker:marker_type ->
  ?limit:limit_type ->
  retiring_principal:principal_id_type ->
  unit ->
  list_retirable_grants_request

val make_list_resource_tags_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?tags:tag_list ->
  unit ->
  list_resource_tags_response

val make_list_resource_tags_request :
  ?marker:marker_type ->
  ?limit:limit_type ->
  key_id:key_id_type ->
  unit ->
  list_resource_tags_request

val make_key_list_entry : ?key_arn:arn_type -> ?key_id:key_id_type -> unit -> key_list_entry

val make_list_keys_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?keys:key_list ->
  unit ->
  list_keys_response

val make_list_keys_request : ?marker:marker_type -> ?limit:limit_type -> unit -> list_keys_request

val make_rotations_list_entry :
  ?rotation_type:rotation_type ->
  ?rotation_date:date_type ->
  ?valid_to:date_type ->
  ?expiration_model:expiration_model_type ->
  ?key_material_state:key_material_state ->
  ?import_state:import_state ->
  ?key_material_description:key_material_description_type ->
  ?key_material_id:backing_key_id_type ->
  ?key_id:key_id_type ->
  unit ->
  rotations_list_entry

val make_list_key_rotations_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?rotations:rotations_list ->
  unit ->
  list_key_rotations_response

val make_list_key_rotations_request :
  ?marker:marker_type ->
  ?limit:limit_type ->
  ?include_key_material:include_key_material ->
  key_id:key_id_type ->
  unit ->
  list_key_rotations_request

val make_list_key_policies_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?policy_names:policy_name_list ->
  unit ->
  list_key_policies_response

val make_list_key_policies_request :
  ?marker:marker_type ->
  ?limit:limit_type ->
  key_id:key_id_type ->
  unit ->
  list_key_policies_request

val make_list_grants_request :
  ?grantee_principal:principal_id_type ->
  ?grant_id:grant_id_type ->
  ?marker:marker_type ->
  ?limit:limit_type ->
  key_id:key_id_type ->
  unit ->
  list_grants_request

val make_alias_list_entry :
  ?last_updated_date:date_type ->
  ?creation_date:date_type ->
  ?target_key_id:key_id_type ->
  ?alias_arn:arn_type ->
  ?alias_name:alias_name_type ->
  unit ->
  alias_list_entry

val make_list_aliases_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?aliases:alias_list ->
  unit ->
  list_aliases_response

val make_list_aliases_request :
  ?marker:marker_type -> ?limit:limit_type -> ?key_id:key_id_type -> unit -> list_aliases_request

val make_import_key_material_response :
  ?key_material_id:backing_key_id_type ->
  ?key_id:key_id_type ->
  unit ->
  import_key_material_response

val make_import_key_material_request :
  ?key_material_id:backing_key_id_type ->
  ?key_material_description:key_material_description_type ->
  ?import_type:import_type ->
  ?expiration_model:expiration_model_type ->
  ?valid_to:date_type ->
  encrypted_key_material:ciphertext_type ->
  import_token:ciphertext_type ->
  key_id:key_id_type ->
  unit ->
  import_key_material_request

val make_get_public_key_response :
  ?key_agreement_algorithms:key_agreement_algorithm_spec_list ->
  ?signing_algorithms:signing_algorithm_spec_list ->
  ?encryption_algorithms:encryption_algorithm_spec_list ->
  ?key_usage:key_usage_type ->
  ?key_spec:key_spec ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?public_key:public_key_type ->
  ?key_id:key_id_type ->
  unit ->
  get_public_key_response

val make_get_public_key_request :
  ?grant_tokens:grant_token_list -> key_id:key_id_type -> unit -> get_public_key_request

val make_get_parameters_for_import_response :
  ?parameters_valid_to:date_type ->
  ?public_key:plaintext_type ->
  ?import_token:ciphertext_type ->
  ?key_id:key_id_type ->
  unit ->
  get_parameters_for_import_response

val make_get_parameters_for_import_request :
  wrapping_key_spec:wrapping_key_spec ->
  wrapping_algorithm:algorithm_spec ->
  key_id:key_id_type ->
  unit ->
  get_parameters_for_import_request

val make_get_key_rotation_status_response :
  ?on_demand_rotation_start_date:date_type ->
  ?next_rotation_date:date_type ->
  ?rotation_period_in_days:rotation_period_in_days_type ->
  ?key_id:key_id_type ->
  ?key_rotation_enabled:boolean_type ->
  unit ->
  get_key_rotation_status_response

val make_get_key_rotation_status_request :
  key_id:key_id_type -> unit -> get_key_rotation_status_request

val make_get_key_policy_response :
  ?policy_name:policy_name_type -> ?policy:policy_type -> unit -> get_key_policy_response

val make_get_key_policy_request :
  ?policy_name:policy_name_type -> key_id:key_id_type -> unit -> get_key_policy_request

val make_generate_random_response :
  ?ciphertext_for_recipient:ciphertext_type ->
  ?plaintext:plaintext_type ->
  unit ->
  generate_random_response

val make_recipient_info :
  ?attestation_document:attestation_document_type ->
  ?key_encryption_algorithm:key_encryption_mechanism ->
  unit ->
  recipient_info

val make_generate_random_request :
  ?recipient:recipient_info ->
  ?custom_key_store_id:custom_key_store_id_type ->
  ?number_of_bytes:number_of_bytes_type ->
  unit ->
  generate_random_request

val make_generate_mac_response :
  ?key_id:key_id_type ->
  ?mac_algorithm:mac_algorithm_spec ->
  ?mac:ciphertext_type ->
  unit ->
  generate_mac_response

val make_generate_mac_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  mac_algorithm:mac_algorithm_spec ->
  key_id:key_id_type ->
  message:plaintext_type ->
  unit ->
  generate_mac_request

val make_generate_data_key_without_plaintext_response :
  ?key_material_id:backing_key_id_type ->
  ?key_id:key_id_type ->
  ?ciphertext_blob:ciphertext_type ->
  unit ->
  generate_data_key_without_plaintext_response

val make_generate_data_key_without_plaintext_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  ?number_of_bytes:number_of_bytes_type ->
  ?key_spec:data_key_spec ->
  ?encryption_context:encryption_context_type ->
  key_id:key_id_type ->
  unit ->
  generate_data_key_without_plaintext_request

val make_generate_data_key_pair_without_plaintext_response :
  ?key_material_id:backing_key_id_type ->
  ?key_pair_spec:data_key_pair_spec ->
  ?key_id:key_id_type ->
  ?public_key:public_key_type ->
  ?private_key_ciphertext_blob:ciphertext_type ->
  unit ->
  generate_data_key_pair_without_plaintext_response

val make_generate_data_key_pair_without_plaintext_request :
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  ?encryption_context:encryption_context_type ->
  key_pair_spec:data_key_pair_spec ->
  key_id:key_id_type ->
  unit ->
  generate_data_key_pair_without_plaintext_request

val make_generate_data_key_pair_response :
  ?key_material_id:backing_key_id_type ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?key_pair_spec:data_key_pair_spec ->
  ?key_id:key_id_type ->
  ?public_key:public_key_type ->
  ?private_key_plaintext:plaintext_type ->
  ?private_key_ciphertext_blob:ciphertext_type ->
  unit ->
  generate_data_key_pair_response

val make_generate_data_key_pair_request :
  ?dry_run:nullable_boolean_type ->
  ?recipient:recipient_info ->
  ?grant_tokens:grant_token_list ->
  ?encryption_context:encryption_context_type ->
  key_pair_spec:data_key_pair_spec ->
  key_id:key_id_type ->
  unit ->
  generate_data_key_pair_request

val make_generate_data_key_response :
  ?key_material_id:backing_key_id_type ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?key_id:key_id_type ->
  ?plaintext:plaintext_type ->
  ?ciphertext_blob:ciphertext_type ->
  unit ->
  generate_data_key_response

val make_generate_data_key_request :
  ?dry_run:nullable_boolean_type ->
  ?recipient:recipient_info ->
  ?grant_tokens:grant_token_list ->
  ?key_spec:data_key_spec ->
  ?number_of_bytes:number_of_bytes_type ->
  ?encryption_context:encryption_context_type ->
  key_id:key_id_type ->
  unit ->
  generate_data_key_request

val make_encrypt_response :
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?key_id:key_id_type ->
  ?ciphertext_blob:ciphertext_type ->
  unit ->
  encrypt_response

val make_encrypt_request :
  ?dry_run:nullable_boolean_type ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?grant_tokens:grant_token_list ->
  ?encryption_context:encryption_context_type ->
  plaintext:plaintext_type ->
  key_id:key_id_type ->
  unit ->
  encrypt_request

val make_enable_key_rotation_request :
  ?rotation_period_in_days:rotation_period_in_days_type ->
  key_id:key_id_type ->
  unit ->
  enable_key_rotation_request

val make_enable_key_request : key_id:key_id_type -> unit -> enable_key_request
val make_disconnect_custom_key_store_response : unit -> unit

val make_disconnect_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type -> unit -> disconnect_custom_key_store_request

val make_disable_key_rotation_request : key_id:key_id_type -> unit -> disable_key_rotation_request
val make_disable_key_request : key_id:key_id_type -> unit -> disable_key_request
val make_describe_key_response : ?key_metadata:key_metadata -> unit -> describe_key_response

val make_describe_key_request :
  ?grant_tokens:grant_token_list -> key_id:key_id_type -> unit -> describe_key_request

val make_custom_key_stores_list_entry :
  ?xks_proxy_configuration:xks_proxy_configuration_type ->
  ?custom_key_store_type:custom_key_store_type ->
  ?creation_date:date_type ->
  ?connection_error_code:connection_error_code_type ->
  ?connection_state:connection_state_type ->
  ?trust_anchor_certificate:trust_anchor_certificate_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?custom_key_store_name:custom_key_store_name_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  unit ->
  custom_key_stores_list_entry

val make_describe_custom_key_stores_response :
  ?truncated:boolean_type ->
  ?next_marker:marker_type ->
  ?custom_key_stores:custom_key_stores_list ->
  unit ->
  describe_custom_key_stores_response

val make_describe_custom_key_stores_request :
  ?marker:marker_type ->
  ?limit:limit_type ->
  ?custom_key_store_name:custom_key_store_name_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  unit ->
  describe_custom_key_stores_request

val make_derive_shared_secret_response :
  ?key_origin:origin_type ->
  ?key_agreement_algorithm:key_agreement_algorithm_spec ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?shared_secret:plaintext_type ->
  ?key_id:key_id_type ->
  unit ->
  derive_shared_secret_response

val make_derive_shared_secret_request :
  ?recipient:recipient_info ->
  ?dry_run:nullable_boolean_type ->
  ?grant_tokens:grant_token_list ->
  public_key:public_key_type ->
  key_agreement_algorithm:key_agreement_algorithm_spec ->
  key_id:key_id_type ->
  unit ->
  derive_shared_secret_request

val make_delete_imported_key_material_response :
  ?key_material_id:backing_key_id_response_type ->
  ?key_id:key_id_type ->
  unit ->
  delete_imported_key_material_response

val make_delete_imported_key_material_request :
  ?key_material_id:backing_key_id_type ->
  key_id:key_id_type ->
  unit ->
  delete_imported_key_material_request

val make_delete_custom_key_store_response : unit -> unit

val make_delete_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type -> unit -> delete_custom_key_store_request

val make_delete_alias_request : alias_name:alias_name_type -> unit -> delete_alias_request

val make_decrypt_response :
  ?key_material_id:backing_key_id_type ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?plaintext:plaintext_type ->
  ?key_id:key_id_type ->
  unit ->
  decrypt_response

val make_decrypt_request :
  ?dry_run:nullable_boolean_type ->
  ?recipient:recipient_info ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?key_id:key_id_type ->
  ?grant_tokens:grant_token_list ->
  ?encryption_context:encryption_context_type ->
  ciphertext_blob:ciphertext_type ->
  unit ->
  decrypt_request

val make_create_key_response : ?key_metadata:key_metadata -> unit -> create_key_response

val make_create_key_request :
  ?xks_key_id:xks_key_id_type ->
  ?multi_region:nullable_boolean_type ->
  ?tags:tag_list ->
  ?bypass_policy_lockout_safety_check:boolean_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  ?origin:origin_type ->
  ?key_spec:key_spec ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_usage:key_usage_type ->
  ?description:description_type ->
  ?policy:policy_type ->
  unit ->
  create_key_request

val make_create_grant_response :
  ?grant_id:grant_id_type -> ?grant_token:grant_token_type -> unit -> create_grant_response

val make_create_grant_request :
  ?dry_run:nullable_boolean_type ->
  ?name:grant_name_type ->
  ?grant_tokens:grant_token_list ->
  ?constraints:grant_constraints ->
  ?retiring_principal:principal_id_type ->
  operations:grant_operation_list ->
  grantee_principal:principal_id_type ->
  key_id:key_id_type ->
  unit ->
  create_grant_request

val make_create_custom_key_store_response :
  ?custom_key_store_id:custom_key_store_id_type -> unit -> create_custom_key_store_response

val make_create_custom_key_store_request :
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
  ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type ->
  ?xks_proxy_vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
  ?xks_proxy_uri_path:xks_proxy_uri_path_type ->
  ?xks_proxy_uri_endpoint:xks_proxy_uri_endpoint_type ->
  ?custom_key_store_type:custom_key_store_type ->
  ?key_store_password:key_store_password_type ->
  ?trust_anchor_certificate:trust_anchor_certificate_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  custom_key_store_name:custom_key_store_name_type ->
  unit ->
  create_custom_key_store_request

val make_create_alias_request :
  target_key_id:key_id_type -> alias_name:alias_name_type -> unit -> create_alias_request

val make_connect_custom_key_store_response : unit -> unit

val make_connect_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type -> unit -> connect_custom_key_store_request

val make_cancel_key_deletion_response : ?key_id:key_id_type -> unit -> cancel_key_deletion_response
val make_cancel_key_deletion_request : key_id:key_id_type -> unit -> cancel_key_deletion_request
