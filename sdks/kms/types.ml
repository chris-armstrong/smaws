open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kms";
      endpointPrefix = "kms";
      version = "2014-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec error_message_type = string
type nonrec xks_proxy_vpc_endpoint_service_not_found_exception =
  {
  message: string option }
type nonrec xks_proxy_vpc_endpoint_service_name_type = string
type nonrec xks_proxy_vpc_endpoint_service_invalid_configuration_exception =
  {
  message: string option }
type nonrec xks_proxy_vpc_endpoint_service_in_use_exception =
  {
  message: string option }
type nonrec xks_proxy_uri_unreachable_exception = {
  message: string option }
type nonrec xks_proxy_uri_path_type = string
type nonrec xks_proxy_uri_in_use_exception = {
  message: string option }
type nonrec xks_proxy_uri_endpoint_type = string
type nonrec xks_proxy_uri_endpoint_in_use_exception =
  {
  message: string option }
type nonrec xks_proxy_invalid_response_exception = {
  message: string option }
type nonrec xks_proxy_invalid_configuration_exception =
  {
  message: string option }
type nonrec xks_proxy_incorrect_authentication_credential_exception =
  {
  message: string option }
type nonrec base_unit = unit
type nonrec xks_proxy_connectivity_type =
  | VPC_ENDPOINT_SERVICE 
  | PUBLIC_ENDPOINT 
type nonrec xks_proxy_authentication_access_key_id_type = string
type nonrec xks_proxy_configuration_type =
  {
  vpc_endpoint_service_name: string option ;
  uri_path: string option ;
  uri_endpoint: string option ;
  access_key_id: string option ;
  connectivity: xks_proxy_connectivity_type option }
type nonrec xks_proxy_authentication_raw_secret_access_key_type = string
type nonrec xks_proxy_authentication_credential_type =
  {
  raw_secret_access_key: string ;
  access_key_id: string }
type nonrec xks_key_not_found_exception = {
  message: string option }
type nonrec xks_key_invalid_configuration_exception =
  {
  message: string option }
type nonrec xks_key_id_type = string
type nonrec xks_key_configuration_type = {
  id: string option }
type nonrec xks_key_already_in_use_exception = {
  message: string option }
type nonrec wrapping_key_spec =
  | SM2 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 
type nonrec key_id_type = string
type nonrec boolean_type = bool
type nonrec signing_algorithm_spec =
  | SM2DSA 
  | ECDSA_SHA_512 
  | ECDSA_SHA_384 
  | ECDSA_SHA_256 
  | RSASSA_PKCS1_V1_5_SHA_512 
  | RSASSA_PKCS1_V1_5_SHA_384 
  | RSASSA_PKCS1_V1_5_SHA_256 
  | RSASSA_PSS_SHA_512 
  | RSASSA_PSS_SHA_384 
  | RSASSA_PSS_SHA_256 
type nonrec verify_response =
  {
  signing_algorithm: signing_algorithm_spec option ;
  signature_valid: bool option ;
  key_id: string option }
type nonrec plaintext_type = bytes
type nonrec message_type =
  | DIGEST 
  | RAW 
type nonrec ciphertext_type = bytes
type nonrec grant_token_type = string
type nonrec grant_token_list = string list option list
type nonrec nullable_boolean_type = bool
type nonrec verify_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  signing_algorithm: signing_algorithm_spec ;
  signature: bytes ;
  message_type: message_type option ;
  message: bytes ;
  key_id: string }
type nonrec mac_algorithm_spec =
  | HMAC_SHA_512 
  | HMAC_SHA_384 
  | HMAC_SHA_256 
  | HMAC_SHA_224 
type nonrec verify_mac_response =
  {
  mac_algorithm: mac_algorithm_spec option ;
  mac_valid: bool option ;
  key_id: string option }
type nonrec verify_mac_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  mac: bytes ;
  mac_algorithm: mac_algorithm_spec ;
  key_id: string ;
  message: bytes }
type nonrec not_found_exception = {
  message: string option }
type nonrec kms_invalid_state_exception = {
  message: string option }
type nonrec kms_invalid_mac_exception = {
  message: string option }
type nonrec kms_internal_exception = {
  message: string option }
type nonrec key_unavailable_exception = {
  message: string option }
type nonrec invalid_key_usage_exception = {
  message: string option }
type nonrec invalid_grant_token_exception = {
  message: string option }
type nonrec dry_run_operation_exception = {
  message: string option }
type nonrec disabled_exception = {
  message: string option }
type nonrec kms_invalid_signature_exception = {
  message: string option }
type nonrec dependency_timeout_exception = {
  message: string option }
type nonrec region_type = string
type nonrec update_primary_region_request =
  {
  primary_region: string ;
  key_id: string }
type nonrec unsupported_operation_exception = {
  message: string option }
type nonrec invalid_arn_exception = {
  message: string option }
type nonrec description_type = string
type nonrec update_key_description_request =
  {
  description: string ;
  key_id: string }
type nonrec update_custom_key_store_response = unit
type nonrec custom_key_store_id_type = string
type nonrec custom_key_store_name_type = string
type nonrec key_store_password_type = string
type nonrec cloud_hsm_cluster_id_type = string
type nonrec update_custom_key_store_request =
  {
  xks_proxy_connectivity: xks_proxy_connectivity_type option ;
  xks_proxy_authentication_credential:
    xks_proxy_authentication_credential_type option ;
  xks_proxy_vpc_endpoint_service_name: string option ;
  xks_proxy_uri_path: string option ;
  xks_proxy_uri_endpoint: string option ;
  cloud_hsm_cluster_id: string option ;
  key_store_password: string option ;
  new_custom_key_store_name: string option ;
  custom_key_store_id: string }
type nonrec custom_key_store_not_found_exception = {
  message: string option }
type nonrec custom_key_store_name_in_use_exception =
  {
  message: string option }
type nonrec custom_key_store_invalid_state_exception =
  {
  message: string option }
type nonrec cloud_hsm_cluster_not_related_exception =
  {
  message: string option }
type nonrec cloud_hsm_cluster_not_found_exception = {
  message: string option }
type nonrec cloud_hsm_cluster_not_active_exception =
  {
  message: string option }
type nonrec cloud_hsm_cluster_invalid_configuration_exception =
  {
  message: string option }
type nonrec alias_name_type = string
type nonrec update_alias_request =
  {
  target_key_id: string ;
  alias_name: string }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec tag_key_type = string
type nonrec tag_key_list = string list option list
type nonrec untag_resource_request = {
  tag_keys: string list ;
  key_id: string }
type nonrec tag_exception = {
  message: string option }
type nonrec trust_anchor_certificate_type = string
type nonrec tag_value_type = string
type nonrec tag = {
  tag_value: string ;
  tag_key: string }
type nonrec tag_list = tag list option list
type nonrec tag_resource_request = {
  tags: tag list ;
  key_id: string }
type nonrec sign_response =
  {
  signing_algorithm: signing_algorithm_spec option ;
  signature: bytes option ;
  key_id: string option }
type nonrec sign_request =
  {
  dry_run: bool option ;
  signing_algorithm: signing_algorithm_spec ;
  grant_tokens: string list option ;
  message_type: message_type option ;
  message: bytes ;
  key_id: string }
type nonrec date_type = Timestamp.t
type nonrec key_state =
  | Updating 
  | Unavailable 
  | PendingReplicaDeletion 
  | PendingImport 
  | PendingDeletion 
  | Disabled 
  | Enabled 
  | Creating 
type nonrec pending_window_in_days_type = int
type nonrec schedule_key_deletion_response =
  {
  pending_window_in_days: int option ;
  key_state: key_state option ;
  deletion_date: float option ;
  key_id: string option }
type nonrec schedule_key_deletion_request =
  {
  pending_window_in_days: int option ;
  key_id: string }
type nonrec conflict_exception = {
  message: string option }
type nonrec rotate_key_on_demand_response = {
  key_id: string option }
type nonrec rotate_key_on_demand_request = {
  key_id: string }
type nonrec invalid_grant_id_exception = {
  message: string option }
type nonrec grant_id_type = string
type nonrec revoke_grant_request =
  {
  dry_run: bool option ;
  grant_id: string ;
  key_id: string }
type nonrec retire_grant_request =
  {
  dry_run: bool option ;
  grant_id: string option ;
  key_id: string option ;
  grant_token: string option }
type nonrec malformed_policy_document_exception = {
  message: string option }
type nonrec already_exists_exception = {
  message: string option }
type nonrec aws_account_id_type = string
type nonrec arn_type = string
type nonrec key_usage_type =
  | KEY_AGREEMENT 
  | GENERATE_VERIFY_MAC 
  | ENCRYPT_DECRYPT 
  | SIGN_VERIFY 
type nonrec origin_type =
  | EXTERNAL_KEY_STORE 
  | AWS_CLOUDHSM 
  | EXTERNAL 
  | AWS_KMS 
type nonrec expiration_model_type =
  | KEY_MATERIAL_DOES_NOT_EXPIRE 
  | KEY_MATERIAL_EXPIRES 
type nonrec key_manager_type =
  | CUSTOMER 
  | AWS 
type nonrec customer_master_key_spec =
  | SM2 
  | HMAC_512 
  | HMAC_384 
  | HMAC_256 
  | HMAC_224 
  | SYMMETRIC_DEFAULT 
  | ECC_SECG_P256K1 
  | ECC_NIST_P521 
  | ECC_NIST_P384 
  | ECC_NIST_P256 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 
type nonrec key_spec =
  | SM2 
  | HMAC_512 
  | HMAC_384 
  | HMAC_256 
  | HMAC_224 
  | SYMMETRIC_DEFAULT 
  | ECC_SECG_P256K1 
  | ECC_NIST_P521 
  | ECC_NIST_P384 
  | ECC_NIST_P256 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 
type nonrec encryption_algorithm_spec =
  | SM2PKE 
  | RSAES_OAEP_SHA_256 
  | RSAES_OAEP_SHA_1 
  | SYMMETRIC_DEFAULT 
type nonrec encryption_algorithm_spec_list =
  encryption_algorithm_spec list option list
type nonrec signing_algorithm_spec_list =
  signing_algorithm_spec list option list
type nonrec key_agreement_algorithm_spec =
  | ECDH 
type nonrec key_agreement_algorithm_spec_list =
  key_agreement_algorithm_spec list option list
type nonrec multi_region_key_type =
  | REPLICA 
  | PRIMARY 
type nonrec multi_region_key = {
  region: string option ;
  arn: string option }
type nonrec multi_region_key_list = multi_region_key list option list
type nonrec multi_region_configuration =
  {
  replica_keys: multi_region_key list option ;
  primary_key: multi_region_key option ;
  multi_region_key_type: multi_region_key_type option }
type nonrec mac_algorithm_spec_list = mac_algorithm_spec list option list
type nonrec key_metadata =
  {
  xks_key_configuration: xks_key_configuration_type option ;
  mac_algorithms: mac_algorithm_spec list option ;
  pending_deletion_window_in_days: int option ;
  multi_region_configuration: multi_region_configuration option ;
  multi_region: bool option ;
  key_agreement_algorithms: key_agreement_algorithm_spec list option ;
  signing_algorithms: signing_algorithm_spec list option ;
  encryption_algorithms: encryption_algorithm_spec list option ;
  key_spec: key_spec option ;
  customer_master_key_spec: customer_master_key_spec option ;
  key_manager: key_manager_type option ;
  expiration_model: expiration_model_type option ;
  cloud_hsm_cluster_id: string option ;
  custom_key_store_id: string option ;
  origin: origin_type option ;
  valid_to: float option ;
  deletion_date: float option ;
  key_state: key_state option ;
  key_usage: key_usage_type option ;
  description: string option ;
  enabled: bool option ;
  creation_date: float option ;
  arn: string option ;
  key_id: string ;
  aws_account_id: string option }
type nonrec policy_type = string
type nonrec replicate_key_response =
  {
  replica_tags: tag list option ;
  replica_policy: string option ;
  replica_key_metadata: key_metadata option }
type nonrec replicate_key_request =
  {
  tags: tag list option ;
  description: string option ;
  bypass_policy_lockout_safety_check: bool option ;
  policy: string option ;
  replica_region: string ;
  key_id: string }
type nonrec invalid_ciphertext_exception = {
  message: string option }
type nonrec incorrect_key_exception = {
  message: string option }
type nonrec re_encrypt_response =
  {
  destination_encryption_algorithm: encryption_algorithm_spec option ;
  source_encryption_algorithm: encryption_algorithm_spec option ;
  key_id: string option ;
  source_key_id: string option ;
  ciphertext_blob: bytes option }
type nonrec encryption_context_value = string
type nonrec encryption_context_key = string
type nonrec encryption_context_type = (string_ option * string_ option) list
type nonrec re_encrypt_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  destination_encryption_algorithm: encryption_algorithm_spec option ;
  source_encryption_algorithm: encryption_algorithm_spec option ;
  destination_encryption_context: (string * string) list option ;
  destination_key_id: string ;
  source_key_id: string option ;
  source_encryption_context: (string * string) list option ;
  ciphertext_blob: bytes }
type nonrec policy_name_type = string
type nonrec put_key_policy_request =
  {
  bypass_policy_lockout_safety_check: bool option ;
  policy: string ;
  policy_name: string option ;
  key_id: string }
type nonrec invalid_marker_exception = {
  message: string option }
type nonrec grant_name_type = string
type nonrec principal_id_type = string
type nonrec grant_operation =
  | DeriveSharedSecret 
  | VerifyMac 
  | GenerateMac 
  | GenerateDataKeyPairWithoutPlaintext 
  | GenerateDataKeyPair 
  | DescribeKey 
  | RetireGrant 
  | CreateGrant 
  | GetPublicKey 
  | Verify 
  | Sign 
  | ReEncryptTo 
  | ReEncryptFrom 
  | GenerateDataKeyWithoutPlaintext 
  | GenerateDataKey 
  | Encrypt 
  | Decrypt 
type nonrec grant_operation_list = grant_operation list option list
type nonrec grant_constraints =
  {
  encryption_context_equals: (string * string) list option ;
  encryption_context_subset: (string * string) list option }
type nonrec grant_list_entry =
  {
  constraints: grant_constraints option ;
  operations: grant_operation list option ;
  issuing_account: string option ;
  retiring_principal: string option ;
  grantee_principal: string option ;
  creation_date: float option ;
  name: string option ;
  grant_id: string option ;
  key_id: string option }
type nonrec grant_list = grant_list_entry list option list
type nonrec marker_type = string
type nonrec list_grants_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  grants: grant_list_entry list option }
type nonrec limit_type = int
type nonrec list_retirable_grants_request =
  {
  retiring_principal: string ;
  marker: string option ;
  limit: int option }
type nonrec list_resource_tags_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  tags: tag list option }
type nonrec list_resource_tags_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string }
type nonrec key_list_entry = {
  key_arn: string option ;
  key_id: string option }
type nonrec key_list = key_list_entry list option list
type nonrec list_keys_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  keys: key_list_entry list option }
type nonrec list_keys_request = {
  marker: string option ;
  limit: int option }
type nonrec rotation_type =
  | ON_DEMAND 
  | AUTOMATIC 
type nonrec rotations_list_entry =
  {
  rotation_type: rotation_type option ;
  rotation_date: float option ;
  key_id: string option }
type nonrec rotations_list = rotations_list_entry list option list
type nonrec list_key_rotations_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  rotations: rotations_list_entry list option }
type nonrec list_key_rotations_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string }
type nonrec policy_name_list = string list option list
type nonrec list_key_policies_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  policy_names: string list option }
type nonrec list_key_policies_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string }
type nonrec list_grants_request =
  {
  grantee_principal: string option ;
  grant_id: string option ;
  key_id: string ;
  marker: string option ;
  limit: int option }
type nonrec alias_list_entry =
  {
  last_updated_date: float option ;
  creation_date: float option ;
  target_key_id: string option ;
  alias_arn: string option ;
  alias_name: string option }
type nonrec alias_list = alias_list_entry list option list
type nonrec list_aliases_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  aliases: alias_list_entry list option }
type nonrec list_aliases_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string option }
type nonrec invalid_import_token_exception = {
  message: string option }
type nonrec incorrect_key_material_exception = {
  message: string option }
type nonrec expired_import_token_exception = {
  message: string option }
type nonrec import_key_material_response = unit
type nonrec import_key_material_request =
  {
  expiration_model: expiration_model_type option ;
  valid_to: float option ;
  encrypted_key_material: bytes ;
  import_token: bytes ;
  key_id: string }
type nonrec public_key_type = bytes
type nonrec get_public_key_response =
  {
  key_agreement_algorithms: key_agreement_algorithm_spec list option ;
  signing_algorithms: signing_algorithm_spec list option ;
  encryption_algorithms: encryption_algorithm_spec list option ;
  key_usage: key_usage_type option ;
  key_spec: key_spec option ;
  customer_master_key_spec: customer_master_key_spec option ;
  public_key: bytes option ;
  key_id: string option }
type nonrec get_public_key_request =
  {
  grant_tokens: string list option ;
  key_id: string }
type nonrec get_parameters_for_import_response =
  {
  parameters_valid_to: float option ;
  public_key: bytes option ;
  import_token: bytes option ;
  key_id: string option }
type nonrec algorithm_spec =
  | SM2PKE 
  | RSA_AES_KEY_WRAP_SHA_256 
  | RSA_AES_KEY_WRAP_SHA_1 
  | RSAES_OAEP_SHA_256 
  | RSAES_OAEP_SHA_1 
  | RSAES_PKCS1_V1_5 
type nonrec get_parameters_for_import_request =
  {
  wrapping_key_spec: wrapping_key_spec ;
  wrapping_algorithm: algorithm_spec ;
  key_id: string }
type nonrec rotation_period_in_days_type = int
type nonrec get_key_rotation_status_response =
  {
  on_demand_rotation_start_date: float option ;
  next_rotation_date: float option ;
  rotation_period_in_days: int option ;
  key_id: string option ;
  key_rotation_enabled: bool option }
type nonrec get_key_rotation_status_request = {
  key_id: string }
type nonrec get_key_policy_response =
  {
  policy_name: string option ;
  policy: string option }
type nonrec get_key_policy_request =
  {
  policy_name: string option ;
  key_id: string }
type nonrec generate_random_response =
  {
  ciphertext_for_recipient: bytes option ;
  plaintext: bytes option }
type nonrec number_of_bytes_type = int
type nonrec key_encryption_mechanism =
  | RSAES_OAEP_SHA_256 
type nonrec attestation_document_type = bytes
type nonrec recipient_info =
  {
  attestation_document: bytes option ;
  key_encryption_algorithm: key_encryption_mechanism option }
type nonrec generate_random_request =
  {
  recipient: recipient_info option ;
  custom_key_store_id: string option ;
  number_of_bytes: int option }
type nonrec generate_mac_response =
  {
  key_id: string option ;
  mac_algorithm: mac_algorithm_spec option ;
  mac: bytes option }
type nonrec generate_mac_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  mac_algorithm: mac_algorithm_spec ;
  key_id: string ;
  message: bytes }
type nonrec generate_data_key_without_plaintext_response =
  {
  key_id: string option ;
  ciphertext_blob: bytes option }
type nonrec data_key_spec =
  | AES_128 
  | AES_256 
type nonrec generate_data_key_without_plaintext_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  number_of_bytes: int option ;
  key_spec: data_key_spec option ;
  encryption_context: (string * string) list option ;
  key_id: string }
type nonrec data_key_pair_spec =
  | SM2 
  | ECC_SECG_P256K1 
  | ECC_NIST_P521 
  | ECC_NIST_P384 
  | ECC_NIST_P256 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 
type nonrec generate_data_key_pair_without_plaintext_response =
  {
  key_pair_spec: data_key_pair_spec option ;
  key_id: string option ;
  public_key: bytes option ;
  private_key_ciphertext_blob: bytes option }
type nonrec generate_data_key_pair_without_plaintext_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  key_pair_spec: data_key_pair_spec ;
  key_id: string ;
  encryption_context: (string * string) list option }
type nonrec generate_data_key_pair_response =
  {
  ciphertext_for_recipient: bytes option ;
  key_pair_spec: data_key_pair_spec option ;
  key_id: string option ;
  public_key: bytes option ;
  private_key_plaintext: bytes option ;
  private_key_ciphertext_blob: bytes option }
type nonrec generate_data_key_pair_request =
  {
  dry_run: bool option ;
  recipient: recipient_info option ;
  grant_tokens: string list option ;
  key_pair_spec: data_key_pair_spec ;
  key_id: string ;
  encryption_context: (string * string) list option }
type nonrec generate_data_key_response =
  {
  ciphertext_for_recipient: bytes option ;
  key_id: string option ;
  plaintext: bytes option ;
  ciphertext_blob: bytes option }
type nonrec generate_data_key_request =
  {
  dry_run: bool option ;
  recipient: recipient_info option ;
  grant_tokens: string list option ;
  key_spec: data_key_spec option ;
  number_of_bytes: int option ;
  encryption_context: (string * string) list option ;
  key_id: string }
type nonrec encrypt_response =
  {
  encryption_algorithm: encryption_algorithm_spec option ;
  key_id: string option ;
  ciphertext_blob: bytes option }
type nonrec encrypt_request =
  {
  dry_run: bool option ;
  encryption_algorithm: encryption_algorithm_spec option ;
  grant_tokens: string list option ;
  encryption_context: (string * string) list option ;
  plaintext: bytes ;
  key_id: string }
type nonrec enable_key_rotation_request =
  {
  rotation_period_in_days: int option ;
  key_id: string }
type nonrec enable_key_request = {
  key_id: string }
type nonrec disconnect_custom_key_store_response = unit
type nonrec disconnect_custom_key_store_request =
  {
  custom_key_store_id: string }
type nonrec disable_key_rotation_request = {
  key_id: string }
type nonrec disable_key_request = {
  key_id: string }
type nonrec describe_key_response = {
  key_metadata: key_metadata option }
type nonrec describe_key_request =
  {
  grant_tokens: string list option ;
  key_id: string }
type nonrec connection_state_type =
  | DISCONNECTING 
  | DISCONNECTED 
  | FAILED 
  | CONNECTING 
  | CONNECTED 
type nonrec connection_error_code_type =
  | XKS_PROXY_INVALID_TLS_CONFIGURATION 
  | XKS_PROXY_TIMED_OUT 
  | XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION 
  | XKS_PROXY_INVALID_CONFIGURATION 
  | XKS_PROXY_INVALID_RESPONSE 
  | XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND 
  | XKS_PROXY_NOT_REACHABLE 
  | XKS_PROXY_ACCESS_DENIED 
  | INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET 
  | SUBNET_NOT_FOUND 
  | USER_LOGGED_IN 
  | USER_NOT_FOUND 
  | USER_LOCKED_OUT 
  | INSUFFICIENT_CLOUDHSM_HSMS 
  | INTERNAL_ERROR 
  | NETWORK_ERRORS 
  | CLUSTER_NOT_FOUND 
  | INVALID_CREDENTIALS 
type nonrec custom_key_store_type =
  | EXTERNAL_KEY_STORE 
  | AWS_CLOUDHSM 
type nonrec custom_key_stores_list_entry =
  {
  xks_proxy_configuration: xks_proxy_configuration_type option ;
  custom_key_store_type: custom_key_store_type option ;
  creation_date: float option ;
  connection_error_code: connection_error_code_type option ;
  connection_state: connection_state_type option ;
  trust_anchor_certificate: string option ;
  cloud_hsm_cluster_id: string option ;
  custom_key_store_name: string option ;
  custom_key_store_id: string option }
type nonrec custom_key_stores_list =
  custom_key_stores_list_entry list option list
type nonrec describe_custom_key_stores_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  custom_key_stores: custom_key_stores_list_entry list option }
type nonrec describe_custom_key_stores_request =
  {
  marker: string option ;
  limit: int option ;
  custom_key_store_name: string option ;
  custom_key_store_id: string option }
type nonrec derive_shared_secret_response =
  {
  key_origin: origin_type option ;
  key_agreement_algorithm: key_agreement_algorithm_spec option ;
  ciphertext_for_recipient: bytes option ;
  shared_secret: bytes option ;
  key_id: string option }
type nonrec derive_shared_secret_request =
  {
  recipient: recipient_info option ;
  dry_run: bool option ;
  grant_tokens: string list option ;
  public_key: bytes ;
  key_agreement_algorithm: key_agreement_algorithm_spec ;
  key_id: string }
type nonrec delete_imported_key_material_request = {
  key_id: string }
type nonrec custom_key_store_has_cm_ks_exception = {
  message: string option }
type nonrec delete_custom_key_store_response = unit
type nonrec delete_custom_key_store_request = {
  custom_key_store_id: string }
type nonrec delete_alias_request = {
  alias_name: string }
type nonrec decrypt_response =
  {
  ciphertext_for_recipient: bytes option ;
  encryption_algorithm: encryption_algorithm_spec option ;
  plaintext: bytes option ;
  key_id: string option }
type nonrec decrypt_request =
  {
  dry_run: bool option ;
  recipient: recipient_info option ;
  encryption_algorithm: encryption_algorithm_spec option ;
  key_id: string option ;
  grant_tokens: string list option ;
  encryption_context: (string * string) list option ;
  ciphertext_blob: bytes }
type nonrec create_key_response = {
  key_metadata: key_metadata option }
type nonrec create_key_request =
  {
  xks_key_id: string option ;
  multi_region: bool option ;
  tags: tag list option ;
  bypass_policy_lockout_safety_check: bool option ;
  custom_key_store_id: string option ;
  origin: origin_type option ;
  key_spec: key_spec option ;
  customer_master_key_spec: customer_master_key_spec option ;
  key_usage: key_usage_type option ;
  description: string option ;
  policy: string option }
type nonrec create_grant_response =
  {
  grant_id: string option ;
  grant_token: string option }
type nonrec create_grant_request =
  {
  dry_run: bool option ;
  name: string option ;
  grant_tokens: string list option ;
  constraints: grant_constraints option ;
  operations: grant_operation list ;
  retiring_principal: string option ;
  grantee_principal: string ;
  key_id: string }
type nonrec incorrect_trust_anchor_exception = {
  message: string option }
type nonrec cloud_hsm_cluster_in_use_exception = {
  message: string option }
type nonrec create_custom_key_store_response =
  {
  custom_key_store_id: string option }
type nonrec create_custom_key_store_request =
  {
  xks_proxy_connectivity: xks_proxy_connectivity_type option ;
  xks_proxy_authentication_credential:
    xks_proxy_authentication_credential_type option ;
  xks_proxy_vpc_endpoint_service_name: string option ;
  xks_proxy_uri_path: string option ;
  xks_proxy_uri_endpoint: string option ;
  custom_key_store_type: custom_key_store_type option ;
  key_store_password: string option ;
  trust_anchor_certificate: string option ;
  cloud_hsm_cluster_id: string option ;
  custom_key_store_name: string }
type nonrec invalid_alias_name_exception = {
  message: string option }
type nonrec create_alias_request =
  {
  target_key_id: string ;
  alias_name: string }
type nonrec connect_custom_key_store_response = unit
type nonrec connect_custom_key_store_request = {
  custom_key_store_id: string }
type nonrec cancel_key_deletion_response = {
  key_id: string option }
type nonrec cancel_key_deletion_request = {
  key_id: string }
type nonrec trent_service = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t