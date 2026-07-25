open Types

val make_alias_list_entry :
  ?alias_name:alias_name_type ->
  ?alias_arn:arn_type ->
  ?target_key_id:key_id_type ->
  ?creation_date:date_type ->
  ?last_updated_date:date_type ->
  unit ->
  alias_list_entry

val make_cancel_key_deletion_response : ?key_id:key_id_type -> unit -> cancel_key_deletion_response
val make_cancel_key_deletion_request : key_id:key_id_type -> unit -> cancel_key_deletion_request
val make_connect_custom_key_store_response : unit -> unit

val make_connect_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type -> unit -> connect_custom_key_store_request

val make_create_alias_request :
  alias_name:alias_name_type -> target_key_id:key_id_type -> unit -> create_alias_request

val make_create_custom_key_store_response :
  ?custom_key_store_id:custom_key_store_id_type -> unit -> create_custom_key_store_response

val make_xks_proxy_authentication_credential_type :
  access_key_id:xks_proxy_authentication_access_key_id_type ->
  raw_secret_access_key:xks_proxy_authentication_raw_secret_access_key_type ->
  unit ->
  xks_proxy_authentication_credential_type

val make_create_custom_key_store_request :
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?trust_anchor_certificate:trust_anchor_certificate_type ->
  ?key_store_password:key_store_password_type ->
  ?custom_key_store_type:custom_key_store_type ->
  ?xks_proxy_uri_endpoint:xks_proxy_uri_endpoint_type ->
  ?xks_proxy_uri_path:xks_proxy_uri_path_type ->
  ?xks_proxy_vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
  ?xks_proxy_vpc_endpoint_service_owner:account_id_type ->
  ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type ->
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
  custom_key_store_name:custom_key_store_name_type ->
  unit ->
  create_custom_key_store_request

val make_create_grant_response :
  ?grant_token:grant_token_type -> ?grant_id:grant_id_type -> unit -> create_grant_response

val make_grant_constraints :
  ?encryption_context_subset:encryption_context_type ->
  ?encryption_context_equals:encryption_context_type ->
  ?source_arn:grant_constraint_source_arn_type ->
  unit ->
  grant_constraints

val make_create_grant_request :
  ?grantee_principal:principal_id_type ->
  ?retiring_principal:principal_id_type ->
  ?constraints:grant_constraints ->
  ?grant_tokens:grant_token_list ->
  ?name:grant_name_type ->
  ?dry_run:nullable_boolean_type ->
  ?grantee_service_principal:service_principal_type ->
  ?retiring_service_principal:service_principal_type ->
  key_id:key_id_type ->
  operations:grant_operation_list ->
  unit ->
  create_grant_request

val make_xks_key_configuration_type : ?id:xks_key_id_type -> unit -> xks_key_configuration_type
val make_multi_region_key : ?arn:arn_type -> ?region:region_type -> unit -> multi_region_key

val make_multi_region_configuration :
  ?multi_region_key_type:multi_region_key_type ->
  ?primary_key:multi_region_key ->
  ?replica_keys:multi_region_key_list ->
  unit ->
  multi_region_configuration

val make_key_metadata :
  ?aws_account_id:aws_account_id_type ->
  ?arn:arn_type ->
  ?creation_date:date_type ->
  ?enabled:boolean_type ->
  ?description:description_type ->
  ?key_usage:key_usage_type ->
  ?key_state:key_state ->
  ?deletion_date:date_type ->
  ?valid_to:date_type ->
  ?origin:origin_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?expiration_model:expiration_model_type ->
  ?key_manager:key_manager_type ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_spec:key_spec ->
  ?encryption_algorithms:encryption_algorithm_spec_list ->
  ?signing_algorithms:signing_algorithm_spec_list ->
  ?key_agreement_algorithms:key_agreement_algorithm_spec_list ->
  ?multi_region:nullable_boolean_type ->
  ?multi_region_configuration:multi_region_configuration ->
  ?pending_deletion_window_in_days:pending_window_in_days_type ->
  ?mac_algorithms:mac_algorithm_spec_list ->
  ?xks_key_configuration:xks_key_configuration_type ->
  ?current_key_material_id:backing_key_id_type ->
  key_id:key_id_type ->
  unit ->
  key_metadata

val make_create_key_response : ?key_metadata:key_metadata -> unit -> create_key_response
val make_tag : tag_key:tag_key_type -> tag_value:tag_value_type -> unit -> tag

val make_create_key_request :
  ?policy:policy_type ->
  ?description:description_type ->
  ?key_usage:key_usage_type ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_spec:key_spec ->
  ?origin:origin_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  ?bypass_policy_lockout_safety_check:boolean_type ->
  ?tags:tag_list ->
  ?multi_region:nullable_boolean_type ->
  ?xks_key_id:xks_key_id_type ->
  unit ->
  create_key_request

val make_xks_proxy_configuration_type :
  ?connectivity:xks_proxy_connectivity_type ->
  ?access_key_id:xks_proxy_authentication_access_key_id_type ->
  ?uri_endpoint:xks_proxy_uri_endpoint_type ->
  ?uri_path:xks_proxy_uri_path_type ->
  ?vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
  ?vpc_endpoint_service_owner:account_id_type ->
  unit ->
  xks_proxy_configuration_type

val make_custom_key_stores_list_entry :
  ?custom_key_store_id:custom_key_store_id_type ->
  ?custom_key_store_name:custom_key_store_name_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?trust_anchor_certificate:trust_anchor_certificate_type ->
  ?connection_state:connection_state_type ->
  ?connection_error_code:connection_error_code_type ->
  ?creation_date:date_type ->
  ?custom_key_store_type:custom_key_store_type ->
  ?xks_proxy_configuration:xks_proxy_configuration_type ->
  unit ->
  custom_key_stores_list_entry

val make_decrypt_response :
  ?key_id:key_id_type ->
  ?plaintext:plaintext_type ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?key_material_id:backing_key_id_type ->
  unit ->
  decrypt_response

val make_recipient_info :
  ?key_encryption_algorithm:key_encryption_mechanism ->
  ?attestation_document:attestation_document_type ->
  unit ->
  recipient_info

val make_decrypt_request :
  ?ciphertext_blob:ciphertext_type ->
  ?encryption_context:encryption_context_type ->
  ?grant_tokens:grant_token_list ->
  ?key_id:key_id_type ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?recipient:recipient_info ->
  ?dry_run:nullable_boolean_type ->
  ?dry_run_modifiers:dry_run_modifier_list ->
  unit ->
  decrypt_request

val make_delete_alias_request : alias_name:alias_name_type -> unit -> delete_alias_request
val make_delete_custom_key_store_response : unit -> unit

val make_delete_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type -> unit -> delete_custom_key_store_request

val make_delete_imported_key_material_response :
  ?key_id:key_id_type ->
  ?key_material_id:backing_key_id_response_type ->
  unit ->
  delete_imported_key_material_response

val make_delete_imported_key_material_request :
  ?key_material_id:backing_key_id_type ->
  key_id:key_id_type ->
  unit ->
  delete_imported_key_material_request

val make_derive_shared_secret_response :
  ?key_id:key_id_type ->
  ?shared_secret:plaintext_type ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?key_agreement_algorithm:key_agreement_algorithm_spec ->
  ?key_origin:origin_type ->
  unit ->
  derive_shared_secret_response

val make_derive_shared_secret_request :
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  ?recipient:recipient_info ->
  key_id:key_id_type ->
  key_agreement_algorithm:key_agreement_algorithm_spec ->
  public_key:public_key_type ->
  unit ->
  derive_shared_secret_request

val make_describe_custom_key_stores_response :
  ?custom_key_stores:custom_key_stores_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  describe_custom_key_stores_response

val make_describe_custom_key_stores_request :
  ?custom_key_store_id:custom_key_store_id_type ->
  ?custom_key_store_name:custom_key_store_name_type ->
  ?limit:limit_type ->
  ?marker:marker_type ->
  unit ->
  describe_custom_key_stores_request

val make_describe_key_response : ?key_metadata:key_metadata -> unit -> describe_key_response

val make_describe_key_request :
  ?grant_tokens:grant_token_list -> key_id:key_id_type -> unit -> describe_key_request

val make_disable_key_request : key_id:key_id_type -> unit -> disable_key_request
val make_disable_key_rotation_request : key_id:key_id_type -> unit -> disable_key_rotation_request
val make_disconnect_custom_key_store_response : unit -> unit

val make_disconnect_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type -> unit -> disconnect_custom_key_store_request

val make_enable_key_request : key_id:key_id_type -> unit -> enable_key_request

val make_enable_key_rotation_request :
  ?rotation_period_in_days:rotation_period_in_days_type ->
  key_id:key_id_type ->
  unit ->
  enable_key_rotation_request

val make_encrypt_response :
  ?ciphertext_blob:ciphertext_type ->
  ?key_id:key_id_type ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  unit ->
  encrypt_response

val make_encrypt_request :
  ?encryption_context:encryption_context_type ->
  ?grant_tokens:grant_token_list ->
  ?encryption_algorithm:encryption_algorithm_spec ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  plaintext:plaintext_type ->
  unit ->
  encrypt_request

val make_generate_data_key_response :
  ?ciphertext_blob:ciphertext_type ->
  ?plaintext:plaintext_type ->
  ?key_id:key_id_type ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?key_material_id:backing_key_id_type ->
  unit ->
  generate_data_key_response

val make_generate_data_key_request :
  ?encryption_context:encryption_context_type ->
  ?number_of_bytes:number_of_bytes_type ->
  ?key_spec:data_key_spec ->
  ?grant_tokens:grant_token_list ->
  ?recipient:recipient_info ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  unit ->
  generate_data_key_request

val make_generate_data_key_pair_response :
  ?private_key_ciphertext_blob:ciphertext_type ->
  ?private_key_plaintext:plaintext_type ->
  ?public_key:public_key_type ->
  ?key_id:key_id_type ->
  ?key_pair_spec:data_key_pair_spec ->
  ?ciphertext_for_recipient:ciphertext_type ->
  ?key_material_id:backing_key_id_type ->
  unit ->
  generate_data_key_pair_response

val make_generate_data_key_pair_request :
  ?encryption_context:encryption_context_type ->
  ?grant_tokens:grant_token_list ->
  ?recipient:recipient_info ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  key_pair_spec:data_key_pair_spec ->
  unit ->
  generate_data_key_pair_request

val make_generate_data_key_pair_without_plaintext_response :
  ?private_key_ciphertext_blob:ciphertext_type ->
  ?public_key:public_key_type ->
  ?key_id:key_id_type ->
  ?key_pair_spec:data_key_pair_spec ->
  ?key_material_id:backing_key_id_type ->
  unit ->
  generate_data_key_pair_without_plaintext_response

val make_generate_data_key_pair_without_plaintext_request :
  ?encryption_context:encryption_context_type ->
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  key_pair_spec:data_key_pair_spec ->
  unit ->
  generate_data_key_pair_without_plaintext_request

val make_generate_data_key_without_plaintext_response :
  ?ciphertext_blob:ciphertext_type ->
  ?key_id:key_id_type ->
  ?key_material_id:backing_key_id_type ->
  unit ->
  generate_data_key_without_plaintext_response

val make_generate_data_key_without_plaintext_request :
  ?encryption_context:encryption_context_type ->
  ?key_spec:data_key_spec ->
  ?number_of_bytes:number_of_bytes_type ->
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  unit ->
  generate_data_key_without_plaintext_request

val make_generate_mac_response :
  ?mac:ciphertext_type ->
  ?mac_algorithm:mac_algorithm_spec ->
  ?key_id:key_id_type ->
  unit ->
  generate_mac_response

val make_generate_mac_request :
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  message:plaintext_type ->
  key_id:key_id_type ->
  mac_algorithm:mac_algorithm_spec ->
  unit ->
  generate_mac_request

val make_generate_random_response :
  ?plaintext:plaintext_type ->
  ?ciphertext_for_recipient:ciphertext_type ->
  unit ->
  generate_random_response

val make_generate_random_request :
  ?number_of_bytes:number_of_bytes_type ->
  ?custom_key_store_id:custom_key_store_id_type ->
  ?recipient:recipient_info ->
  unit ->
  generate_random_request

val make_key_last_usage_data :
  ?operation:key_last_usage_tracking_operation ->
  ?timestamp:date_type ->
  ?cloud_trail_event_id:cloud_trail_event_id_type ->
  ?kms_request_id:kms_request_id_type ->
  unit ->
  key_last_usage_data

val make_get_key_last_usage_response :
  ?key_id:key_id_type ->
  ?key_last_usage:key_last_usage_data ->
  ?tracking_start_date:date_type ->
  ?key_creation_date:date_type ->
  unit ->
  get_key_last_usage_response

val make_get_key_last_usage_request : key_id:key_id_type -> unit -> get_key_last_usage_request

val make_get_key_policy_response :
  ?policy:policy_type -> ?policy_name:policy_name_type -> unit -> get_key_policy_response

val make_get_key_policy_request :
  ?policy_name:policy_name_type -> key_id:key_id_type -> unit -> get_key_policy_request

val make_get_key_rotation_status_response :
  ?key_rotation_enabled:boolean_type ->
  ?key_id:key_id_type ->
  ?rotation_period_in_days:rotation_period_in_days_type ->
  ?next_rotation_date:date_type ->
  ?on_demand_rotation_start_date:date_type ->
  unit ->
  get_key_rotation_status_response

val make_get_key_rotation_status_request :
  key_id:key_id_type -> unit -> get_key_rotation_status_request

val make_get_parameters_for_import_response :
  ?key_id:key_id_type ->
  ?import_token:ciphertext_type ->
  ?public_key:plaintext_type ->
  ?parameters_valid_to:date_type ->
  unit ->
  get_parameters_for_import_response

val make_get_parameters_for_import_request :
  key_id:key_id_type ->
  wrapping_algorithm:algorithm_spec ->
  wrapping_key_spec:wrapping_key_spec ->
  unit ->
  get_parameters_for_import_request

val make_get_public_key_response :
  ?key_id:key_id_type ->
  ?public_key:public_key_type ->
  ?customer_master_key_spec:customer_master_key_spec ->
  ?key_spec:key_spec ->
  ?key_usage:key_usage_type ->
  ?encryption_algorithms:encryption_algorithm_spec_list ->
  ?signing_algorithms:signing_algorithm_spec_list ->
  ?key_agreement_algorithms:key_agreement_algorithm_spec_list ->
  unit ->
  get_public_key_response

val make_get_public_key_request :
  ?grant_tokens:grant_token_list -> key_id:key_id_type -> unit -> get_public_key_request

val make_grant_list_entry :
  ?key_id:key_id_type ->
  ?grant_id:grant_id_type ->
  ?name:grant_name_type ->
  ?creation_date:date_type ->
  ?grantee_principal:principal_id_type ->
  ?retiring_principal:principal_id_type ->
  ?issuing_account:principal_id_type ->
  ?operations:grant_operation_list ->
  ?constraints:grant_constraints ->
  ?grantee_service_principal:service_principal_type ->
  ?retiring_service_principal:service_principal_type ->
  unit ->
  grant_list_entry

val make_import_key_material_response :
  ?key_id:key_id_type ->
  ?key_material_id:backing_key_id_type ->
  unit ->
  import_key_material_response

val make_import_key_material_request :
  ?valid_to:date_type ->
  ?expiration_model:expiration_model_type ->
  ?import_type:import_type ->
  ?key_material_description:key_material_description_type ->
  ?key_material_id:backing_key_id_type ->
  key_id:key_id_type ->
  import_token:ciphertext_type ->
  encrypted_key_material:ciphertext_type ->
  unit ->
  import_key_material_request

val make_key_list_entry : ?key_id:key_id_type -> ?key_arn:arn_type -> unit -> key_list_entry

val make_list_aliases_response :
  ?aliases:alias_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  list_aliases_response

val make_list_aliases_request :
  ?key_id:key_id_type -> ?limit:limit_type -> ?marker:marker_type -> unit -> list_aliases_request

val make_list_grants_response :
  ?grants:grant_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  list_grants_response

val make_list_grants_request :
  ?limit:limit_type ->
  ?marker:marker_type ->
  ?grant_id:grant_id_type ->
  ?grantee_principal:principal_id_type ->
  ?grantee_service_principal:service_principal_type ->
  key_id:key_id_type ->
  unit ->
  list_grants_request

val make_list_key_policies_response :
  ?policy_names:policy_name_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  list_key_policies_response

val make_list_key_policies_request :
  ?limit:limit_type ->
  ?marker:marker_type ->
  key_id:key_id_type ->
  unit ->
  list_key_policies_request

val make_rotations_list_entry :
  ?key_id:key_id_type ->
  ?key_material_id:backing_key_id_type ->
  ?key_material_description:key_material_description_type ->
  ?import_state:import_state ->
  ?key_material_state:key_material_state ->
  ?expiration_model:expiration_model_type ->
  ?valid_to:date_type ->
  ?rotation_date:date_type ->
  ?rotation_type:rotation_type ->
  unit ->
  rotations_list_entry

val make_list_key_rotations_response :
  ?rotations:rotations_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  list_key_rotations_response

val make_list_key_rotations_request :
  ?include_key_material:include_key_material ->
  ?limit:limit_type ->
  ?marker:marker_type ->
  key_id:key_id_type ->
  unit ->
  list_key_rotations_request

val make_list_keys_response :
  ?keys:key_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  list_keys_response

val make_list_keys_request : ?limit:limit_type -> ?marker:marker_type -> unit -> list_keys_request

val make_list_resource_tags_response :
  ?tags:tag_list ->
  ?next_marker:marker_type ->
  ?truncated:boolean_type ->
  unit ->
  list_resource_tags_response

val make_list_resource_tags_request :
  ?limit:limit_type ->
  ?marker:marker_type ->
  key_id:key_id_type ->
  unit ->
  list_resource_tags_request

val make_list_retirable_grants_request :
  ?limit:limit_type ->
  ?marker:marker_type ->
  ?retiring_principal:principal_id_type ->
  ?retiring_service_principal:service_principal_type ->
  unit ->
  list_retirable_grants_request

val make_put_key_policy_request :
  ?policy_name:policy_name_type ->
  ?bypass_policy_lockout_safety_check:boolean_type ->
  key_id:key_id_type ->
  policy:policy_type ->
  unit ->
  put_key_policy_request

val make_re_encrypt_response :
  ?ciphertext_blob:ciphertext_type ->
  ?source_key_id:key_id_type ->
  ?key_id:key_id_type ->
  ?source_encryption_algorithm:encryption_algorithm_spec ->
  ?destination_encryption_algorithm:encryption_algorithm_spec ->
  ?source_key_material_id:backing_key_id_type ->
  ?destination_key_material_id:backing_key_id_type ->
  unit ->
  re_encrypt_response

val make_re_encrypt_request :
  ?ciphertext_blob:ciphertext_type ->
  ?source_encryption_context:encryption_context_type ->
  ?source_key_id:key_id_type ->
  ?destination_encryption_context:encryption_context_type ->
  ?source_encryption_algorithm:encryption_algorithm_spec ->
  ?destination_encryption_algorithm:encryption_algorithm_spec ->
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  ?dry_run_modifiers:dry_run_modifier_list ->
  destination_key_id:key_id_type ->
  unit ->
  re_encrypt_request

val make_replicate_key_response :
  ?replica_key_metadata:key_metadata ->
  ?replica_policy:policy_type ->
  ?replica_tags:tag_list ->
  unit ->
  replicate_key_response

val make_replicate_key_request :
  ?policy:policy_type ->
  ?bypass_policy_lockout_safety_check:boolean_type ->
  ?description:description_type ->
  ?tags:tag_list ->
  key_id:key_id_type ->
  replica_region:region_type ->
  unit ->
  replicate_key_request

val make_retire_grant_request :
  ?grant_token:grant_token_type ->
  ?key_id:key_id_type ->
  ?grant_id:grant_id_type ->
  ?dry_run:nullable_boolean_type ->
  unit ->
  retire_grant_request

val make_revoke_grant_request :
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  grant_id:grant_id_type ->
  unit ->
  revoke_grant_request

val make_rotate_key_on_demand_response :
  ?key_id:key_id_type -> unit -> rotate_key_on_demand_response

val make_rotate_key_on_demand_request : key_id:key_id_type -> unit -> rotate_key_on_demand_request

val make_schedule_key_deletion_response :
  ?key_id:key_id_type ->
  ?deletion_date:date_type ->
  ?key_state:key_state ->
  ?pending_window_in_days:pending_window_in_days_type ->
  unit ->
  schedule_key_deletion_response

val make_schedule_key_deletion_request :
  ?pending_window_in_days:pending_window_in_days_type ->
  key_id:key_id_type ->
  unit ->
  schedule_key_deletion_request

val make_sign_response :
  ?key_id:key_id_type ->
  ?signature:ciphertext_type ->
  ?signing_algorithm:signing_algorithm_spec ->
  unit ->
  sign_response

val make_sign_request :
  ?message_type:message_type ->
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  message:plaintext_type ->
  signing_algorithm:signing_algorithm_spec ->
  unit ->
  sign_request

val make_tag_resource_request : key_id:key_id_type -> tags:tag_list -> unit -> tag_resource_request

val make_verify_mac_response :
  ?key_id:key_id_type ->
  ?mac_valid:boolean_type ->
  ?mac_algorithm:mac_algorithm_spec ->
  unit ->
  verify_mac_response

val make_verify_mac_request :
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  message:plaintext_type ->
  key_id:key_id_type ->
  mac_algorithm:mac_algorithm_spec ->
  mac:ciphertext_type ->
  unit ->
  verify_mac_request

val make_verify_response :
  ?key_id:key_id_type ->
  ?signature_valid:boolean_type ->
  ?signing_algorithm:signing_algorithm_spec ->
  unit ->
  verify_response

val make_verify_request :
  ?message_type:message_type ->
  ?grant_tokens:grant_token_list ->
  ?dry_run:nullable_boolean_type ->
  key_id:key_id_type ->
  message:plaintext_type ->
  signature:ciphertext_type ->
  signing_algorithm:signing_algorithm_spec ->
  unit ->
  verify_request

val make_update_primary_region_request :
  key_id:key_id_type -> primary_region:region_type -> unit -> update_primary_region_request

val make_update_key_description_request :
  key_id:key_id_type -> description:description_type -> unit -> update_key_description_request

val make_update_custom_key_store_response : unit -> unit

val make_update_custom_key_store_request :
  ?new_custom_key_store_name:custom_key_store_name_type ->
  ?key_store_password:key_store_password_type ->
  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
  ?xks_proxy_uri_endpoint:xks_proxy_uri_endpoint_type ->
  ?xks_proxy_uri_path:xks_proxy_uri_path_type ->
  ?xks_proxy_vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
  ?xks_proxy_vpc_endpoint_service_owner:account_id_type ->
  ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type ->
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
  custom_key_store_id:custom_key_store_id_type ->
  unit ->
  update_custom_key_store_request

val make_update_alias_request :
  alias_name:alias_name_type -> target_key_id:key_id_type -> unit -> update_alias_request

val make_untag_resource_request :
  key_id:key_id_type -> tag_keys:tag_key_list -> unit -> untag_resource_request
