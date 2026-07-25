open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_id_type_to_yojson = string_to_yojson
let account_id_type_to_yojson = string_to_yojson

let algorithm_spec_to_yojson (x : algorithm_spec) =
  match x with
  | RSAES_PKCS1_V1_5 -> `String "RSAES_PKCS1_V1_5"
  | RSAES_OAEP_SHA_1 -> `String "RSAES_OAEP_SHA_1"
  | RSAES_OAEP_SHA_256 -> `String "RSAES_OAEP_SHA_256"
  | RSA_AES_KEY_WRAP_SHA_1 -> `String "RSA_AES_KEY_WRAP_SHA_1"
  | RSA_AES_KEY_WRAP_SHA_256 -> `String "RSA_AES_KEY_WRAP_SHA_256"
  | SM2PKE -> `String "SM2PKE"

let date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let key_id_type_to_yojson = string_to_yojson
let arn_type_to_yojson = string_to_yojson
let alias_name_type_to_yojson = string_to_yojson

let alias_list_entry_to_yojson (x : alias_list_entry) =
  assoc_to_yojson
    [
      ("AliasName", option_to_yojson alias_name_type_to_yojson x.alias_name);
      ("AliasArn", option_to_yojson arn_type_to_yojson x.alias_arn);
      ("TargetKeyId", option_to_yojson key_id_type_to_yojson x.target_key_id);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastUpdatedDate", option_to_yojson date_type_to_yojson x.last_updated_date);
    ]

let alias_list_to_yojson tree = list_to_yojson alias_list_entry_to_yojson tree
let error_message_type_to_yojson = string_to_yojson

let already_exists_exception_to_yojson (x : already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let attestation_document_type_to_yojson = blob_to_yojson
let backing_key_id_response_type_to_yojson = string_to_yojson
let backing_key_id_type_to_yojson = string_to_yojson
let boolean_type_to_yojson = bool_to_yojson

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let kms_invalid_state_exception_to_yojson (x : kms_invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let kms_internal_exception_to_yojson (x : kms_internal_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let dependency_timeout_exception_to_yojson (x : dependency_timeout_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let cancel_key_deletion_response_to_yojson (x : cancel_key_deletion_response) =
  assoc_to_yojson [ ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id) ]

let cancel_key_deletion_request_to_yojson (x : cancel_key_deletion_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let ciphertext_type_to_yojson = blob_to_yojson
let cloud_hsm_cluster_id_type_to_yojson = string_to_yojson

let cloud_hsm_cluster_in_use_exception_to_yojson (x : cloud_hsm_cluster_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let cloud_hsm_cluster_invalid_configuration_exception_to_yojson
    (x : cloud_hsm_cluster_invalid_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let cloud_hsm_cluster_not_active_exception_to_yojson (x : cloud_hsm_cluster_not_active_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let cloud_hsm_cluster_not_found_exception_to_yojson (x : cloud_hsm_cluster_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let cloud_hsm_cluster_not_related_exception_to_yojson (x : cloud_hsm_cluster_not_related_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let cloud_trail_event_id_type_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let custom_key_store_not_found_exception_to_yojson (x : custom_key_store_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let custom_key_store_invalid_state_exception_to_yojson
    (x : custom_key_store_invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let connect_custom_key_store_response_to_yojson = unit_to_yojson
let custom_key_store_id_type_to_yojson = string_to_yojson

let connect_custom_key_store_request_to_yojson (x : connect_custom_key_store_request) =
  assoc_to_yojson
    [ ("CustomKeyStoreId", Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)) ]

let connection_error_code_type_to_yojson (x : connection_error_code_type) =
  match x with
  | INVALID_CREDENTIALS -> `String "INVALID_CREDENTIALS"
  | CLUSTER_NOT_FOUND -> `String "CLUSTER_NOT_FOUND"
  | NETWORK_ERRORS -> `String "NETWORK_ERRORS"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | INSUFFICIENT_CLOUDHSM_HSMS -> `String "INSUFFICIENT_CLOUDHSM_HSMS"
  | USER_LOCKED_OUT -> `String "USER_LOCKED_OUT"
  | USER_NOT_FOUND -> `String "USER_NOT_FOUND"
  | USER_LOGGED_IN -> `String "USER_LOGGED_IN"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET -> `String "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET"
  | XKS_PROXY_ACCESS_DENIED -> `String "XKS_PROXY_ACCESS_DENIED"
  | XKS_PROXY_NOT_REACHABLE -> `String "XKS_PROXY_NOT_REACHABLE"
  | XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND -> `String "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND"
  | XKS_PROXY_INVALID_RESPONSE -> `String "XKS_PROXY_INVALID_RESPONSE"
  | XKS_PROXY_INVALID_CONFIGURATION -> `String "XKS_PROXY_INVALID_CONFIGURATION"
  | XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION ->
      `String "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION"
  | XKS_PROXY_TIMED_OUT -> `String "XKS_PROXY_TIMED_OUT"
  | XKS_PROXY_INVALID_TLS_CONFIGURATION -> `String "XKS_PROXY_INVALID_TLS_CONFIGURATION"

let connection_state_type_to_yojson (x : connection_state_type) =
  match x with
  | CONNECTED -> `String "CONNECTED"
  | CONNECTING -> `String "CONNECTING"
  | FAILED -> `String "FAILED"
  | DISCONNECTED -> `String "DISCONNECTED"
  | DISCONNECTING -> `String "DISCONNECTING"

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let invalid_alias_name_exception_to_yojson (x : invalid_alias_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let create_alias_request_to_yojson (x : create_alias_request) =
  assoc_to_yojson
    [
      ("AliasName", Some (alias_name_type_to_yojson x.alias_name));
      ("TargetKeyId", Some (key_id_type_to_yojson x.target_key_id));
    ]

let xks_proxy_vpc_endpoint_service_not_found_exception_to_yojson
    (x : xks_proxy_vpc_endpoint_service_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_vpc_endpoint_service_invalid_configuration_exception_to_yojson
    (x : xks_proxy_vpc_endpoint_service_invalid_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_vpc_endpoint_service_in_use_exception_to_yojson
    (x : xks_proxy_vpc_endpoint_service_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_uri_unreachable_exception_to_yojson (x : xks_proxy_uri_unreachable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_uri_in_use_exception_to_yojson (x : xks_proxy_uri_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_uri_endpoint_in_use_exception_to_yojson (x : xks_proxy_uri_endpoint_in_use_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_invalid_response_exception_to_yojson (x : xks_proxy_invalid_response_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_invalid_configuration_exception_to_yojson
    (x : xks_proxy_invalid_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_incorrect_authentication_credential_exception_to_yojson
    (x : xks_proxy_incorrect_authentication_credential_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let incorrect_trust_anchor_exception_to_yojson (x : incorrect_trust_anchor_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let custom_key_store_name_in_use_exception_to_yojson (x : custom_key_store_name_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let create_custom_key_store_response_to_yojson (x : create_custom_key_store_response) =
  assoc_to_yojson
    [
      ("CustomKeyStoreId", option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id);
    ]

let xks_proxy_connectivity_type_to_yojson (x : xks_proxy_connectivity_type) =
  match x with
  | PUBLIC_ENDPOINT -> `String "PUBLIC_ENDPOINT"
  | VPC_ENDPOINT_SERVICE -> `String "VPC_ENDPOINT_SERVICE"

let xks_proxy_authentication_raw_secret_access_key_type_to_yojson = string_to_yojson
let xks_proxy_authentication_access_key_id_type_to_yojson = string_to_yojson

let xks_proxy_authentication_credential_type_to_yojson
    (x : xks_proxy_authentication_credential_type) =
  assoc_to_yojson
    [
      ("AccessKeyId", Some (xks_proxy_authentication_access_key_id_type_to_yojson x.access_key_id));
      ( "RawSecretAccessKey",
        Some (xks_proxy_authentication_raw_secret_access_key_type_to_yojson x.raw_secret_access_key)
      );
    ]

let xks_proxy_vpc_endpoint_service_name_type_to_yojson = string_to_yojson
let xks_proxy_uri_path_type_to_yojson = string_to_yojson
let xks_proxy_uri_endpoint_type_to_yojson = string_to_yojson

let custom_key_store_type_to_yojson (x : custom_key_store_type) =
  match x with
  | AWS_CLOUDHSM -> `String "AWS_CLOUDHSM"
  | EXTERNAL_KEY_STORE -> `String "EXTERNAL_KEY_STORE"

let key_store_password_type_to_yojson = string_to_yojson
let trust_anchor_certificate_type_to_yojson = string_to_yojson
let custom_key_store_name_type_to_yojson = string_to_yojson

let create_custom_key_store_request_to_yojson (x : create_custom_key_store_request) =
  assoc_to_yojson
    [
      ("CustomKeyStoreName", Some (custom_key_store_name_type_to_yojson x.custom_key_store_name));
      ( "CloudHsmClusterId",
        option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id );
      ( "TrustAnchorCertificate",
        option_to_yojson trust_anchor_certificate_type_to_yojson x.trust_anchor_certificate );
      ("KeyStorePassword", option_to_yojson key_store_password_type_to_yojson x.key_store_password);
      ( "CustomKeyStoreType",
        option_to_yojson custom_key_store_type_to_yojson x.custom_key_store_type );
      ( "XksProxyUriEndpoint",
        option_to_yojson xks_proxy_uri_endpoint_type_to_yojson x.xks_proxy_uri_endpoint );
      ("XksProxyUriPath", option_to_yojson xks_proxy_uri_path_type_to_yojson x.xks_proxy_uri_path);
      ( "XksProxyVpcEndpointServiceName",
        option_to_yojson xks_proxy_vpc_endpoint_service_name_type_to_yojson
          x.xks_proxy_vpc_endpoint_service_name );
      ( "XksProxyVpcEndpointServiceOwner",
        option_to_yojson account_id_type_to_yojson x.xks_proxy_vpc_endpoint_service_owner );
      ( "XksProxyAuthenticationCredential",
        option_to_yojson xks_proxy_authentication_credential_type_to_yojson
          x.xks_proxy_authentication_credential );
      ( "XksProxyConnectivity",
        option_to_yojson xks_proxy_connectivity_type_to_yojson x.xks_proxy_connectivity );
    ]

let invalid_grant_token_exception_to_yojson (x : invalid_grant_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let dry_run_operation_exception_to_yojson (x : dry_run_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let disabled_exception_to_yojson (x : disabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let grant_id_type_to_yojson = string_to_yojson
let grant_token_type_to_yojson = string_to_yojson

let create_grant_response_to_yojson (x : create_grant_response) =
  assoc_to_yojson
    [
      ("GrantToken", option_to_yojson grant_token_type_to_yojson x.grant_token);
      ("GrantId", option_to_yojson grant_id_type_to_yojson x.grant_id);
    ]

let service_principal_type_to_yojson = string_to_yojson
let nullable_boolean_type_to_yojson = bool_to_yojson
let grant_name_type_to_yojson = string_to_yojson
let grant_token_list_to_yojson tree = list_to_yojson grant_token_type_to_yojson tree
let grant_constraint_source_arn_type_to_yojson = string_to_yojson
let encryption_context_value_to_yojson = string_to_yojson
let encryption_context_key_to_yojson = string_to_yojson

let encryption_context_type_to_yojson tree =
  map_to_yojson encryption_context_key_to_yojson encryption_context_value_to_yojson tree

let grant_constraints_to_yojson (x : grant_constraints) =
  assoc_to_yojson
    [
      ( "EncryptionContextSubset",
        option_to_yojson encryption_context_type_to_yojson x.encryption_context_subset );
      ( "EncryptionContextEquals",
        option_to_yojson encryption_context_type_to_yojson x.encryption_context_equals );
      ("SourceArn", option_to_yojson grant_constraint_source_arn_type_to_yojson x.source_arn);
    ]

let grant_operation_to_yojson (x : grant_operation) =
  match x with
  | Decrypt -> `String "Decrypt"
  | Encrypt -> `String "Encrypt"
  | GenerateDataKey -> `String "GenerateDataKey"
  | GenerateDataKeyWithoutPlaintext -> `String "GenerateDataKeyWithoutPlaintext"
  | ReEncryptFrom -> `String "ReEncryptFrom"
  | ReEncryptTo -> `String "ReEncryptTo"
  | Sign -> `String "Sign"
  | Verify -> `String "Verify"
  | GetPublicKey -> `String "GetPublicKey"
  | CreateGrant -> `String "CreateGrant"
  | RetireGrant -> `String "RetireGrant"
  | DescribeKey -> `String "DescribeKey"
  | GenerateDataKeyPair -> `String "GenerateDataKeyPair"
  | GenerateDataKeyPairWithoutPlaintext -> `String "GenerateDataKeyPairWithoutPlaintext"
  | GenerateMac -> `String "GenerateMac"
  | VerifyMac -> `String "VerifyMac"
  | DeriveSharedSecret -> `String "DeriveSharedSecret"

let grant_operation_list_to_yojson tree = list_to_yojson grant_operation_to_yojson tree
let principal_id_type_to_yojson = string_to_yojson

let create_grant_request_to_yojson (x : create_grant_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("GranteePrincipal", option_to_yojson principal_id_type_to_yojson x.grantee_principal);
      ("RetiringPrincipal", option_to_yojson principal_id_type_to_yojson x.retiring_principal);
      ("Operations", Some (grant_operation_list_to_yojson x.operations));
      ("Constraints", option_to_yojson grant_constraints_to_yojson x.constraints);
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("Name", option_to_yojson grant_name_type_to_yojson x.name);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
      ( "GranteeServicePrincipal",
        option_to_yojson service_principal_type_to_yojson x.grantee_service_principal );
      ( "RetiringServicePrincipal",
        option_to_yojson service_principal_type_to_yojson x.retiring_service_principal );
    ]

let xks_key_not_found_exception_to_yojson (x : xks_key_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_key_invalid_configuration_exception_to_yojson (x : xks_key_invalid_configuration_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_key_already_in_use_exception_to_yojson (x : xks_key_already_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let tag_exception_to_yojson (x : tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let malformed_policy_document_exception_to_yojson (x : malformed_policy_document_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_key_id_type_to_yojson = string_to_yojson

let xks_key_configuration_type_to_yojson (x : xks_key_configuration_type) =
  assoc_to_yojson [ ("Id", option_to_yojson xks_key_id_type_to_yojson x.id) ]

let mac_algorithm_spec_to_yojson (x : mac_algorithm_spec) =
  match x with
  | HMAC_SHA_224 -> `String "HMAC_SHA_224"
  | HMAC_SHA_256 -> `String "HMAC_SHA_256"
  | HMAC_SHA_384 -> `String "HMAC_SHA_384"
  | HMAC_SHA_512 -> `String "HMAC_SHA_512"

let mac_algorithm_spec_list_to_yojson tree = list_to_yojson mac_algorithm_spec_to_yojson tree
let pending_window_in_days_type_to_yojson = int_to_yojson
let region_type_to_yojson = string_to_yojson

let multi_region_key_to_yojson (x : multi_region_key) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_type_to_yojson x.arn);
      ("Region", option_to_yojson region_type_to_yojson x.region);
    ]

let multi_region_key_list_to_yojson tree = list_to_yojson multi_region_key_to_yojson tree

let multi_region_key_type_to_yojson (x : multi_region_key_type) =
  match x with PRIMARY -> `String "PRIMARY" | REPLICA -> `String "REPLICA"

let multi_region_configuration_to_yojson (x : multi_region_configuration) =
  assoc_to_yojson
    [
      ( "MultiRegionKeyType",
        option_to_yojson multi_region_key_type_to_yojson x.multi_region_key_type );
      ("PrimaryKey", option_to_yojson multi_region_key_to_yojson x.primary_key);
      ("ReplicaKeys", option_to_yojson multi_region_key_list_to_yojson x.replica_keys);
    ]

let key_agreement_algorithm_spec_to_yojson (x : key_agreement_algorithm_spec) =
  match x with ECDH -> `String "ECDH"

let key_agreement_algorithm_spec_list_to_yojson tree =
  list_to_yojson key_agreement_algorithm_spec_to_yojson tree

let signing_algorithm_spec_to_yojson (x : signing_algorithm_spec) =
  match x with
  | RSASSA_PSS_SHA_256 -> `String "RSASSA_PSS_SHA_256"
  | RSASSA_PSS_SHA_384 -> `String "RSASSA_PSS_SHA_384"
  | RSASSA_PSS_SHA_512 -> `String "RSASSA_PSS_SHA_512"
  | RSASSA_PKCS1_V1_5_SHA_256 -> `String "RSASSA_PKCS1_V1_5_SHA_256"
  | RSASSA_PKCS1_V1_5_SHA_384 -> `String "RSASSA_PKCS1_V1_5_SHA_384"
  | RSASSA_PKCS1_V1_5_SHA_512 -> `String "RSASSA_PKCS1_V1_5_SHA_512"
  | ECDSA_SHA_256 -> `String "ECDSA_SHA_256"
  | ECDSA_SHA_384 -> `String "ECDSA_SHA_384"
  | ECDSA_SHA_512 -> `String "ECDSA_SHA_512"
  | SM2DSA -> `String "SM2DSA"
  | ML_DSA_SHAKE_256 -> `String "ML_DSA_SHAKE_256"
  | ED25519_SHA_512 -> `String "ED25519_SHA_512"
  | ED25519_PH_SHA_512 -> `String "ED25519_PH_SHA_512"

let signing_algorithm_spec_list_to_yojson tree =
  list_to_yojson signing_algorithm_spec_to_yojson tree

let encryption_algorithm_spec_to_yojson (x : encryption_algorithm_spec) =
  match x with
  | SYMMETRIC_DEFAULT -> `String "SYMMETRIC_DEFAULT"
  | RSAES_OAEP_SHA_1 -> `String "RSAES_OAEP_SHA_1"
  | RSAES_OAEP_SHA_256 -> `String "RSAES_OAEP_SHA_256"
  | SM2PKE -> `String "SM2PKE"

let encryption_algorithm_spec_list_to_yojson tree =
  list_to_yojson encryption_algorithm_spec_to_yojson tree

let key_spec_to_yojson (x : key_spec) =
  match x with
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"
  | ECC_SECG_P256K1 -> `String "ECC_SECG_P256K1"
  | SYMMETRIC_DEFAULT -> `String "SYMMETRIC_DEFAULT"
  | HMAC_224 -> `String "HMAC_224"
  | HMAC_256 -> `String "HMAC_256"
  | HMAC_384 -> `String "HMAC_384"
  | HMAC_512 -> `String "HMAC_512"
  | SM2 -> `String "SM2"
  | ML_DSA_44 -> `String "ML_DSA_44"
  | ML_DSA_65 -> `String "ML_DSA_65"
  | ML_DSA_87 -> `String "ML_DSA_87"
  | ECC_NIST_EDWARDS25519 -> `String "ECC_NIST_EDWARDS25519"

let customer_master_key_spec_to_yojson (x : customer_master_key_spec) =
  match x with
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"
  | ECC_SECG_P256K1 -> `String "ECC_SECG_P256K1"
  | SYMMETRIC_DEFAULT -> `String "SYMMETRIC_DEFAULT"
  | HMAC_224 -> `String "HMAC_224"
  | HMAC_256 -> `String "HMAC_256"
  | HMAC_384 -> `String "HMAC_384"
  | HMAC_512 -> `String "HMAC_512"
  | SM2 -> `String "SM2"

let key_manager_type_to_yojson (x : key_manager_type) =
  match x with AWS -> `String "AWS" | CUSTOMER -> `String "CUSTOMER"

let expiration_model_type_to_yojson (x : expiration_model_type) =
  match x with
  | KEY_MATERIAL_EXPIRES -> `String "KEY_MATERIAL_EXPIRES"
  | KEY_MATERIAL_DOES_NOT_EXPIRE -> `String "KEY_MATERIAL_DOES_NOT_EXPIRE"

let origin_type_to_yojson (x : origin_type) =
  match x with
  | AWS_KMS -> `String "AWS_KMS"
  | EXTERNAL -> `String "EXTERNAL"
  | AWS_CLOUDHSM -> `String "AWS_CLOUDHSM"
  | EXTERNAL_KEY_STORE -> `String "EXTERNAL_KEY_STORE"

let key_state_to_yojson (x : key_state) =
  match x with
  | Creating -> `String "Creating"
  | Enabled -> `String "Enabled"
  | Disabled -> `String "Disabled"
  | PendingDeletion -> `String "PendingDeletion"
  | PendingImport -> `String "PendingImport"
  | PendingReplicaDeletion -> `String "PendingReplicaDeletion"
  | Unavailable -> `String "Unavailable"
  | Updating -> `String "Updating"

let key_usage_type_to_yojson (x : key_usage_type) =
  match x with
  | SIGN_VERIFY -> `String "SIGN_VERIFY"
  | ENCRYPT_DECRYPT -> `String "ENCRYPT_DECRYPT"
  | GENERATE_VERIFY_MAC -> `String "GENERATE_VERIFY_MAC"
  | KEY_AGREEMENT -> `String "KEY_AGREEMENT"

let description_type_to_yojson = string_to_yojson

let key_metadata_to_yojson (x : key_metadata) =
  assoc_to_yojson
    [
      ("AWSAccountId", option_to_yojson aws_account_id_type_to_yojson x.aws_account_id);
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Arn", option_to_yojson arn_type_to_yojson x.arn);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("KeyUsage", option_to_yojson key_usage_type_to_yojson x.key_usage);
      ("KeyState", option_to_yojson key_state_to_yojson x.key_state);
      ("DeletionDate", option_to_yojson date_type_to_yojson x.deletion_date);
      ("ValidTo", option_to_yojson date_type_to_yojson x.valid_to);
      ("Origin", option_to_yojson origin_type_to_yojson x.origin);
      ("CustomKeyStoreId", option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id);
      ( "CloudHsmClusterId",
        option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id );
      ("ExpirationModel", option_to_yojson expiration_model_type_to_yojson x.expiration_model);
      ("KeyManager", option_to_yojson key_manager_type_to_yojson x.key_manager);
      ( "CustomerMasterKeySpec",
        option_to_yojson customer_master_key_spec_to_yojson x.customer_master_key_spec );
      ("KeySpec", option_to_yojson key_spec_to_yojson x.key_spec);
      ( "EncryptionAlgorithms",
        option_to_yojson encryption_algorithm_spec_list_to_yojson x.encryption_algorithms );
      ( "SigningAlgorithms",
        option_to_yojson signing_algorithm_spec_list_to_yojson x.signing_algorithms );
      ( "KeyAgreementAlgorithms",
        option_to_yojson key_agreement_algorithm_spec_list_to_yojson x.key_agreement_algorithms );
      ("MultiRegion", option_to_yojson nullable_boolean_type_to_yojson x.multi_region);
      ( "MultiRegionConfiguration",
        option_to_yojson multi_region_configuration_to_yojson x.multi_region_configuration );
      ( "PendingDeletionWindowInDays",
        option_to_yojson pending_window_in_days_type_to_yojson x.pending_deletion_window_in_days );
      ("MacAlgorithms", option_to_yojson mac_algorithm_spec_list_to_yojson x.mac_algorithms);
      ( "XksKeyConfiguration",
        option_to_yojson xks_key_configuration_type_to_yojson x.xks_key_configuration );
      ( "CurrentKeyMaterialId",
        option_to_yojson backing_key_id_type_to_yojson x.current_key_material_id );
    ]

let create_key_response_to_yojson (x : create_key_response) =
  assoc_to_yojson [ ("KeyMetadata", option_to_yojson key_metadata_to_yojson x.key_metadata) ]

let tag_value_type_to_yojson = string_to_yojson
let tag_key_type_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("TagKey", Some (tag_key_type_to_yojson x.tag_key));
      ("TagValue", Some (tag_value_type_to_yojson x.tag_value));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let policy_type_to_yojson = string_to_yojson

let create_key_request_to_yojson (x : create_key_request) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson policy_type_to_yojson x.policy);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("KeyUsage", option_to_yojson key_usage_type_to_yojson x.key_usage);
      ( "CustomerMasterKeySpec",
        option_to_yojson customer_master_key_spec_to_yojson x.customer_master_key_spec );
      ("KeySpec", option_to_yojson key_spec_to_yojson x.key_spec);
      ("Origin", option_to_yojson origin_type_to_yojson x.origin);
      ("CustomKeyStoreId", option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id);
      ( "BypassPolicyLockoutSafetyCheck",
        option_to_yojson boolean_type_to_yojson x.bypass_policy_lockout_safety_check );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MultiRegion", option_to_yojson nullable_boolean_type_to_yojson x.multi_region);
      ("XksKeyId", option_to_yojson xks_key_id_type_to_yojson x.xks_key_id);
    ]

let custom_key_store_has_cm_ks_exception_to_yojson (x : custom_key_store_has_cm_ks_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let xks_proxy_configuration_type_to_yojson (x : xks_proxy_configuration_type) =
  assoc_to_yojson
    [
      ("Connectivity", option_to_yojson xks_proxy_connectivity_type_to_yojson x.connectivity);
      ( "AccessKeyId",
        option_to_yojson xks_proxy_authentication_access_key_id_type_to_yojson x.access_key_id );
      ("UriEndpoint", option_to_yojson xks_proxy_uri_endpoint_type_to_yojson x.uri_endpoint);
      ("UriPath", option_to_yojson xks_proxy_uri_path_type_to_yojson x.uri_path);
      ( "VpcEndpointServiceName",
        option_to_yojson xks_proxy_vpc_endpoint_service_name_type_to_yojson
          x.vpc_endpoint_service_name );
      ( "VpcEndpointServiceOwner",
        option_to_yojson account_id_type_to_yojson x.vpc_endpoint_service_owner );
    ]

let custom_key_stores_list_entry_to_yojson (x : custom_key_stores_list_entry) =
  assoc_to_yojson
    [
      ("CustomKeyStoreId", option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id);
      ( "CustomKeyStoreName",
        option_to_yojson custom_key_store_name_type_to_yojson x.custom_key_store_name );
      ( "CloudHsmClusterId",
        option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id );
      ( "TrustAnchorCertificate",
        option_to_yojson trust_anchor_certificate_type_to_yojson x.trust_anchor_certificate );
      ("ConnectionState", option_to_yojson connection_state_type_to_yojson x.connection_state);
      ( "ConnectionErrorCode",
        option_to_yojson connection_error_code_type_to_yojson x.connection_error_code );
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ( "CustomKeyStoreType",
        option_to_yojson custom_key_store_type_to_yojson x.custom_key_store_type );
      ( "XksProxyConfiguration",
        option_to_yojson xks_proxy_configuration_type_to_yojson x.xks_proxy_configuration );
    ]

let custom_key_stores_list_to_yojson tree =
  list_to_yojson custom_key_stores_list_entry_to_yojson tree

let data_key_pair_spec_to_yojson (x : data_key_pair_spec) =
  match x with
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"
  | ECC_SECG_P256K1 -> `String "ECC_SECG_P256K1"
  | SM2 -> `String "SM2"
  | ECC_NIST_EDWARDS25519 -> `String "ECC_NIST_EDWARDS25519"

let data_key_spec_to_yojson (x : data_key_spec) =
  match x with AES_256 -> `String "AES_256" | AES_128 -> `String "AES_128"

let key_unavailable_exception_to_yojson (x : key_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let invalid_key_usage_exception_to_yojson (x : invalid_key_usage_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let invalid_ciphertext_exception_to_yojson (x : invalid_ciphertext_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let incorrect_key_exception_to_yojson (x : incorrect_key_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let plaintext_type_to_yojson = blob_to_yojson

let decrypt_response_to_yojson (x : decrypt_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("Plaintext", option_to_yojson plaintext_type_to_yojson x.plaintext);
      ( "EncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm );
      ( "CiphertextForRecipient",
        option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient );
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let dry_run_modifier_type_to_yojson (x : dry_run_modifier_type) =
  match x with IGNORE_CIPHERTEXT -> `String "IGNORE_CIPHERTEXT"

let dry_run_modifier_list_to_yojson tree = list_to_yojson dry_run_modifier_type_to_yojson tree

let key_encryption_mechanism_to_yojson (x : key_encryption_mechanism) =
  match x with RSAES_OAEP_SHA_256 -> `String "RSAES_OAEP_SHA_256"

let recipient_info_to_yojson (x : recipient_info) =
  assoc_to_yojson
    [
      ( "KeyEncryptionAlgorithm",
        option_to_yojson key_encryption_mechanism_to_yojson x.key_encryption_algorithm );
      ( "AttestationDocument",
        option_to_yojson attestation_document_type_to_yojson x.attestation_document );
    ]

let decrypt_request_to_yojson (x : decrypt_request) =
  assoc_to_yojson
    [
      ("CiphertextBlob", option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob);
      ("EncryptionContext", option_to_yojson encryption_context_type_to_yojson x.encryption_context);
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ( "EncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm );
      ("Recipient", option_to_yojson recipient_info_to_yojson x.recipient);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
      ("DryRunModifiers", option_to_yojson dry_run_modifier_list_to_yojson x.dry_run_modifiers);
    ]

let delete_alias_request_to_yojson (x : delete_alias_request) =
  assoc_to_yojson [ ("AliasName", Some (alias_name_type_to_yojson x.alias_name)) ]

let delete_custom_key_store_response_to_yojson = unit_to_yojson

let delete_custom_key_store_request_to_yojson (x : delete_custom_key_store_request) =
  assoc_to_yojson
    [ ("CustomKeyStoreId", Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)) ]

let delete_imported_key_material_response_to_yojson (x : delete_imported_key_material_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyMaterialId", option_to_yojson backing_key_id_response_type_to_yojson x.key_material_id);
    ]

let delete_imported_key_material_request_to_yojson (x : delete_imported_key_material_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let derive_shared_secret_response_to_yojson (x : derive_shared_secret_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("SharedSecret", option_to_yojson plaintext_type_to_yojson x.shared_secret);
      ( "CiphertextForRecipient",
        option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient );
      ( "KeyAgreementAlgorithm",
        option_to_yojson key_agreement_algorithm_spec_to_yojson x.key_agreement_algorithm );
      ("KeyOrigin", option_to_yojson origin_type_to_yojson x.key_origin);
    ]

let public_key_type_to_yojson = blob_to_yojson

let derive_shared_secret_request_to_yojson (x : derive_shared_secret_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ( "KeyAgreementAlgorithm",
        Some (key_agreement_algorithm_spec_to_yojson x.key_agreement_algorithm) );
      ("PublicKey", Some (public_key_type_to_yojson x.public_key));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
      ("Recipient", option_to_yojson recipient_info_to_yojson x.recipient);
    ]

let invalid_marker_exception_to_yojson (x : invalid_marker_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let marker_type_to_yojson = string_to_yojson

let describe_custom_key_stores_response_to_yojson (x : describe_custom_key_stores_response) =
  assoc_to_yojson
    [
      ("CustomKeyStores", option_to_yojson custom_key_stores_list_to_yojson x.custom_key_stores);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let limit_type_to_yojson = int_to_yojson

let describe_custom_key_stores_request_to_yojson (x : describe_custom_key_stores_request) =
  assoc_to_yojson
    [
      ("CustomKeyStoreId", option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id);
      ( "CustomKeyStoreName",
        option_to_yojson custom_key_store_name_type_to_yojson x.custom_key_store_name );
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
    ]

let describe_key_response_to_yojson (x : describe_key_response) =
  assoc_to_yojson [ ("KeyMetadata", option_to_yojson key_metadata_to_yojson x.key_metadata) ]

let describe_key_request_to_yojson (x : describe_key_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
    ]

let disable_key_request_to_yojson (x : disable_key_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let disable_key_rotation_request_to_yojson (x : disable_key_rotation_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let disconnect_custom_key_store_response_to_yojson = unit_to_yojson

let disconnect_custom_key_store_request_to_yojson (x : disconnect_custom_key_store_request) =
  assoc_to_yojson
    [ ("CustomKeyStoreId", Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)) ]

let enable_key_request_to_yojson (x : enable_key_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let rotation_period_in_days_type_to_yojson = int_to_yojson

let enable_key_rotation_request_to_yojson (x : enable_key_rotation_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ( "RotationPeriodInDays",
        option_to_yojson rotation_period_in_days_type_to_yojson x.rotation_period_in_days );
    ]

let encrypt_response_to_yojson (x : encrypt_response) =
  assoc_to_yojson
    [
      ("CiphertextBlob", option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ( "EncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm );
    ]

let encrypt_request_to_yojson (x : encrypt_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Plaintext", Some (plaintext_type_to_yojson x.plaintext));
      ("EncryptionContext", option_to_yojson encryption_context_type_to_yojson x.encryption_context);
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ( "EncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm );
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let expired_import_token_exception_to_yojson (x : expired_import_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let generate_data_key_response_to_yojson (x : generate_data_key_response) =
  assoc_to_yojson
    [
      ("CiphertextBlob", option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob);
      ("Plaintext", option_to_yojson plaintext_type_to_yojson x.plaintext);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ( "CiphertextForRecipient",
        option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient );
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let number_of_bytes_type_to_yojson = int_to_yojson

let generate_data_key_request_to_yojson (x : generate_data_key_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("EncryptionContext", option_to_yojson encryption_context_type_to_yojson x.encryption_context);
      ("NumberOfBytes", option_to_yojson number_of_bytes_type_to_yojson x.number_of_bytes);
      ("KeySpec", option_to_yojson data_key_spec_to_yojson x.key_spec);
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("Recipient", option_to_yojson recipient_info_to_yojson x.recipient);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let generate_data_key_pair_response_to_yojson (x : generate_data_key_pair_response) =
  assoc_to_yojson
    [
      ( "PrivateKeyCiphertextBlob",
        option_to_yojson ciphertext_type_to_yojson x.private_key_ciphertext_blob );
      ("PrivateKeyPlaintext", option_to_yojson plaintext_type_to_yojson x.private_key_plaintext);
      ("PublicKey", option_to_yojson public_key_type_to_yojson x.public_key);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyPairSpec", option_to_yojson data_key_pair_spec_to_yojson x.key_pair_spec);
      ( "CiphertextForRecipient",
        option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient );
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let generate_data_key_pair_request_to_yojson (x : generate_data_key_pair_request) =
  assoc_to_yojson
    [
      ("EncryptionContext", option_to_yojson encryption_context_type_to_yojson x.encryption_context);
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("KeyPairSpec", Some (data_key_pair_spec_to_yojson x.key_pair_spec));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("Recipient", option_to_yojson recipient_info_to_yojson x.recipient);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let generate_data_key_pair_without_plaintext_response_to_yojson
    (x : generate_data_key_pair_without_plaintext_response) =
  assoc_to_yojson
    [
      ( "PrivateKeyCiphertextBlob",
        option_to_yojson ciphertext_type_to_yojson x.private_key_ciphertext_blob );
      ("PublicKey", option_to_yojson public_key_type_to_yojson x.public_key);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyPairSpec", option_to_yojson data_key_pair_spec_to_yojson x.key_pair_spec);
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let generate_data_key_pair_without_plaintext_request_to_yojson
    (x : generate_data_key_pair_without_plaintext_request) =
  assoc_to_yojson
    [
      ("EncryptionContext", option_to_yojson encryption_context_type_to_yojson x.encryption_context);
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("KeyPairSpec", Some (data_key_pair_spec_to_yojson x.key_pair_spec));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let generate_data_key_without_plaintext_response_to_yojson
    (x : generate_data_key_without_plaintext_response) =
  assoc_to_yojson
    [
      ("CiphertextBlob", option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let generate_data_key_without_plaintext_request_to_yojson
    (x : generate_data_key_without_plaintext_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("EncryptionContext", option_to_yojson encryption_context_type_to_yojson x.encryption_context);
      ("KeySpec", option_to_yojson data_key_spec_to_yojson x.key_spec);
      ("NumberOfBytes", option_to_yojson number_of_bytes_type_to_yojson x.number_of_bytes);
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let generate_mac_response_to_yojson (x : generate_mac_response) =
  assoc_to_yojson
    [
      ("Mac", option_to_yojson ciphertext_type_to_yojson x.mac);
      ("MacAlgorithm", option_to_yojson mac_algorithm_spec_to_yojson x.mac_algorithm);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
    ]

let generate_mac_request_to_yojson (x : generate_mac_request) =
  assoc_to_yojson
    [
      ("Message", Some (plaintext_type_to_yojson x.message));
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("MacAlgorithm", Some (mac_algorithm_spec_to_yojson x.mac_algorithm));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let generate_random_response_to_yojson (x : generate_random_response) =
  assoc_to_yojson
    [
      ("Plaintext", option_to_yojson plaintext_type_to_yojson x.plaintext);
      ( "CiphertextForRecipient",
        option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient );
    ]

let generate_random_request_to_yojson (x : generate_random_request) =
  assoc_to_yojson
    [
      ("NumberOfBytes", option_to_yojson number_of_bytes_type_to_yojson x.number_of_bytes);
      ("CustomKeyStoreId", option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id);
      ("Recipient", option_to_yojson recipient_info_to_yojson x.recipient);
    ]

let kms_request_id_type_to_yojson = string_to_yojson

let key_last_usage_tracking_operation_to_yojson (x : key_last_usage_tracking_operation) =
  match x with
  | Decrypt -> `String "Decrypt"
  | DeriveSharedSecret -> `String "DeriveSharedSecret"
  | Encrypt -> `String "Encrypt"
  | GenerateDataKey -> `String "GenerateDataKey"
  | GenerateDataKeyPair -> `String "GenerateDataKeyPair"
  | GenerateDataKeyPairWithoutPlaintext -> `String "GenerateDataKeyPairWithoutPlaintext"
  | GenerateDataKeyWithoutPlaintext -> `String "GenerateDataKeyWithoutPlaintext"
  | GenerateMac -> `String "GenerateMac"
  | ReEncrypt -> `String "ReEncrypt"
  | Sign -> `String "Sign"
  | Verify -> `String "Verify"
  | VerifyMac -> `String "VerifyMac"

let key_last_usage_data_to_yojson (x : key_last_usage_data) =
  assoc_to_yojson
    [
      ("Operation", option_to_yojson key_last_usage_tracking_operation_to_yojson x.operation);
      ("Timestamp", option_to_yojson date_type_to_yojson x.timestamp);
      ( "CloudTrailEventId",
        option_to_yojson cloud_trail_event_id_type_to_yojson x.cloud_trail_event_id );
      ("KmsRequestId", option_to_yojson kms_request_id_type_to_yojson x.kms_request_id);
    ]

let get_key_last_usage_response_to_yojson (x : get_key_last_usage_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyLastUsage", option_to_yojson key_last_usage_data_to_yojson x.key_last_usage);
      ("TrackingStartDate", option_to_yojson date_type_to_yojson x.tracking_start_date);
      ("KeyCreationDate", option_to_yojson date_type_to_yojson x.key_creation_date);
    ]

let get_key_last_usage_request_to_yojson (x : get_key_last_usage_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let policy_name_type_to_yojson = string_to_yojson

let get_key_policy_response_to_yojson (x : get_key_policy_response) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson policy_type_to_yojson x.policy);
      ("PolicyName", option_to_yojson policy_name_type_to_yojson x.policy_name);
    ]

let get_key_policy_request_to_yojson (x : get_key_policy_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("PolicyName", option_to_yojson policy_name_type_to_yojson x.policy_name);
    ]

let get_key_rotation_status_response_to_yojson (x : get_key_rotation_status_response) =
  assoc_to_yojson
    [
      ("KeyRotationEnabled", option_to_yojson boolean_type_to_yojson x.key_rotation_enabled);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ( "RotationPeriodInDays",
        option_to_yojson rotation_period_in_days_type_to_yojson x.rotation_period_in_days );
      ("NextRotationDate", option_to_yojson date_type_to_yojson x.next_rotation_date);
      ( "OnDemandRotationStartDate",
        option_to_yojson date_type_to_yojson x.on_demand_rotation_start_date );
    ]

let get_key_rotation_status_request_to_yojson (x : get_key_rotation_status_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let get_parameters_for_import_response_to_yojson (x : get_parameters_for_import_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("ImportToken", option_to_yojson ciphertext_type_to_yojson x.import_token);
      ("PublicKey", option_to_yojson plaintext_type_to_yojson x.public_key);
      ("ParametersValidTo", option_to_yojson date_type_to_yojson x.parameters_valid_to);
    ]

let wrapping_key_spec_to_yojson (x : wrapping_key_spec) =
  match x with
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | SM2 -> `String "SM2"

let get_parameters_for_import_request_to_yojson (x : get_parameters_for_import_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("WrappingAlgorithm", Some (algorithm_spec_to_yojson x.wrapping_algorithm));
      ("WrappingKeySpec", Some (wrapping_key_spec_to_yojson x.wrapping_key_spec));
    ]

let get_public_key_response_to_yojson (x : get_public_key_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("PublicKey", option_to_yojson public_key_type_to_yojson x.public_key);
      ( "CustomerMasterKeySpec",
        option_to_yojson customer_master_key_spec_to_yojson x.customer_master_key_spec );
      ("KeySpec", option_to_yojson key_spec_to_yojson x.key_spec);
      ("KeyUsage", option_to_yojson key_usage_type_to_yojson x.key_usage);
      ( "EncryptionAlgorithms",
        option_to_yojson encryption_algorithm_spec_list_to_yojson x.encryption_algorithms );
      ( "SigningAlgorithms",
        option_to_yojson signing_algorithm_spec_list_to_yojson x.signing_algorithms );
      ( "KeyAgreementAlgorithms",
        option_to_yojson key_agreement_algorithm_spec_list_to_yojson x.key_agreement_algorithms );
    ]

let get_public_key_request_to_yojson (x : get_public_key_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
    ]

let grant_list_entry_to_yojson (x : grant_list_entry) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("GrantId", option_to_yojson grant_id_type_to_yojson x.grant_id);
      ("Name", option_to_yojson grant_name_type_to_yojson x.name);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("GranteePrincipal", option_to_yojson principal_id_type_to_yojson x.grantee_principal);
      ("RetiringPrincipal", option_to_yojson principal_id_type_to_yojson x.retiring_principal);
      ("IssuingAccount", option_to_yojson principal_id_type_to_yojson x.issuing_account);
      ("Operations", option_to_yojson grant_operation_list_to_yojson x.operations);
      ("Constraints", option_to_yojson grant_constraints_to_yojson x.constraints);
      ( "GranteeServicePrincipal",
        option_to_yojson service_principal_type_to_yojson x.grantee_service_principal );
      ( "RetiringServicePrincipal",
        option_to_yojson service_principal_type_to_yojson x.retiring_service_principal );
    ]

let grant_list_to_yojson tree = list_to_yojson grant_list_entry_to_yojson tree

let invalid_import_token_exception_to_yojson (x : invalid_import_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let incorrect_key_material_exception_to_yojson (x : incorrect_key_material_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let import_key_material_response_to_yojson (x : import_key_material_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let key_material_description_type_to_yojson = string_to_yojson

let import_type_to_yojson (x : import_type) =
  match x with
  | NEW_KEY_MATERIAL -> `String "NEW_KEY_MATERIAL"
  | EXISTING_KEY_MATERIAL -> `String "EXISTING_KEY_MATERIAL"

let import_key_material_request_to_yojson (x : import_key_material_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("ImportToken", Some (ciphertext_type_to_yojson x.import_token));
      ("EncryptedKeyMaterial", Some (ciphertext_type_to_yojson x.encrypted_key_material));
      ("ValidTo", option_to_yojson date_type_to_yojson x.valid_to);
      ("ExpirationModel", option_to_yojson expiration_model_type_to_yojson x.expiration_model);
      ("ImportType", option_to_yojson import_type_to_yojson x.import_type);
      ( "KeyMaterialDescription",
        option_to_yojson key_material_description_type_to_yojson x.key_material_description );
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
    ]

let import_state_to_yojson (x : import_state) =
  match x with IMPORTED -> `String "IMPORTED" | PENDING_IMPORT -> `String "PENDING_IMPORT"

let include_key_material_to_yojson (x : include_key_material) =
  match x with
  | ALL_KEY_MATERIAL -> `String "ALL_KEY_MATERIAL"
  | ROTATIONS_ONLY -> `String "ROTATIONS_ONLY"

let invalid_grant_id_exception_to_yojson (x : invalid_grant_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let kms_invalid_mac_exception_to_yojson (x : kms_invalid_mac_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let kms_invalid_signature_exception_to_yojson (x : kms_invalid_signature_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_type_to_yojson x.message) ]

let key_list_entry_to_yojson (x : key_list_entry) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyArn", option_to_yojson arn_type_to_yojson x.key_arn);
    ]

let key_list_to_yojson tree = list_to_yojson key_list_entry_to_yojson tree

let key_material_state_to_yojson (x : key_material_state) =
  match x with
  | NON_CURRENT -> `String "NON_CURRENT"
  | CURRENT -> `String "CURRENT"
  | PENDING_ROTATION -> `String "PENDING_ROTATION"
  | PENDING_MULTI_REGION_IMPORT_AND_ROTATION -> `String "PENDING_MULTI_REGION_IMPORT_AND_ROTATION"

let list_aliases_response_to_yojson (x : list_aliases_response) =
  assoc_to_yojson
    [
      ("Aliases", option_to_yojson alias_list_to_yojson x.aliases);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let list_aliases_request_to_yojson (x : list_aliases_request) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
    ]

let list_grants_response_to_yojson (x : list_grants_response) =
  assoc_to_yojson
    [
      ("Grants", option_to_yojson grant_list_to_yojson x.grants);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let list_grants_request_to_yojson (x : list_grants_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("GrantId", option_to_yojson grant_id_type_to_yojson x.grant_id);
      ("GranteePrincipal", option_to_yojson principal_id_type_to_yojson x.grantee_principal);
      ( "GranteeServicePrincipal",
        option_to_yojson service_principal_type_to_yojson x.grantee_service_principal );
    ]

let policy_name_list_to_yojson tree = list_to_yojson policy_name_type_to_yojson tree

let list_key_policies_response_to_yojson (x : list_key_policies_response) =
  assoc_to_yojson
    [
      ("PolicyNames", option_to_yojson policy_name_list_to_yojson x.policy_names);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let list_key_policies_request_to_yojson (x : list_key_policies_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
    ]

let rotation_type_to_yojson (x : rotation_type) =
  match x with AUTOMATIC -> `String "AUTOMATIC" | ON_DEMAND -> `String "ON_DEMAND"

let rotations_list_entry_to_yojson (x : rotations_list_entry) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("KeyMaterialId", option_to_yojson backing_key_id_type_to_yojson x.key_material_id);
      ( "KeyMaterialDescription",
        option_to_yojson key_material_description_type_to_yojson x.key_material_description );
      ("ImportState", option_to_yojson import_state_to_yojson x.import_state);
      ("KeyMaterialState", option_to_yojson key_material_state_to_yojson x.key_material_state);
      ("ExpirationModel", option_to_yojson expiration_model_type_to_yojson x.expiration_model);
      ("ValidTo", option_to_yojson date_type_to_yojson x.valid_to);
      ("RotationDate", option_to_yojson date_type_to_yojson x.rotation_date);
      ("RotationType", option_to_yojson rotation_type_to_yojson x.rotation_type);
    ]

let rotations_list_to_yojson tree = list_to_yojson rotations_list_entry_to_yojson tree

let list_key_rotations_response_to_yojson (x : list_key_rotations_response) =
  assoc_to_yojson
    [
      ("Rotations", option_to_yojson rotations_list_to_yojson x.rotations);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let list_key_rotations_request_to_yojson (x : list_key_rotations_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("IncludeKeyMaterial", option_to_yojson include_key_material_to_yojson x.include_key_material);
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
    ]

let list_keys_response_to_yojson (x : list_keys_response) =
  assoc_to_yojson
    [
      ("Keys", option_to_yojson key_list_to_yojson x.keys);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let list_keys_request_to_yojson (x : list_keys_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
    ]

let list_resource_tags_response_to_yojson (x : list_resource_tags_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextMarker", option_to_yojson marker_type_to_yojson x.next_marker);
      ("Truncated", option_to_yojson boolean_type_to_yojson x.truncated);
    ]

let list_resource_tags_request_to_yojson (x : list_resource_tags_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
    ]

let list_retirable_grants_request_to_yojson (x : list_retirable_grants_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson limit_type_to_yojson x.limit);
      ("Marker", option_to_yojson marker_type_to_yojson x.marker);
      ("RetiringPrincipal", option_to_yojson principal_id_type_to_yojson x.retiring_principal);
      ( "RetiringServicePrincipal",
        option_to_yojson service_principal_type_to_yojson x.retiring_service_principal );
    ]

let message_type_to_yojson (x : message_type) =
  match x with
  | RAW -> `String "RAW"
  | DIGEST -> `String "DIGEST"
  | EXTERNAL_MU -> `String "EXTERNAL_MU"

let put_key_policy_request_to_yojson (x : put_key_policy_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("PolicyName", option_to_yojson policy_name_type_to_yojson x.policy_name);
      ("Policy", Some (policy_type_to_yojson x.policy));
      ( "BypassPolicyLockoutSafetyCheck",
        option_to_yojson boolean_type_to_yojson x.bypass_policy_lockout_safety_check );
    ]

let re_encrypt_response_to_yojson (x : re_encrypt_response) =
  assoc_to_yojson
    [
      ("CiphertextBlob", option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob);
      ("SourceKeyId", option_to_yojson key_id_type_to_yojson x.source_key_id);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ( "SourceEncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.source_encryption_algorithm );
      ( "DestinationEncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.destination_encryption_algorithm );
      ( "SourceKeyMaterialId",
        option_to_yojson backing_key_id_type_to_yojson x.source_key_material_id );
      ( "DestinationKeyMaterialId",
        option_to_yojson backing_key_id_type_to_yojson x.destination_key_material_id );
    ]

let re_encrypt_request_to_yojson (x : re_encrypt_request) =
  assoc_to_yojson
    [
      ("CiphertextBlob", option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob);
      ( "SourceEncryptionContext",
        option_to_yojson encryption_context_type_to_yojson x.source_encryption_context );
      ("SourceKeyId", option_to_yojson key_id_type_to_yojson x.source_key_id);
      ("DestinationKeyId", Some (key_id_type_to_yojson x.destination_key_id));
      ( "DestinationEncryptionContext",
        option_to_yojson encryption_context_type_to_yojson x.destination_encryption_context );
      ( "SourceEncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.source_encryption_algorithm );
      ( "DestinationEncryptionAlgorithm",
        option_to_yojson encryption_algorithm_spec_to_yojson x.destination_encryption_algorithm );
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
      ("DryRunModifiers", option_to_yojson dry_run_modifier_list_to_yojson x.dry_run_modifiers);
    ]

let replicate_key_response_to_yojson (x : replicate_key_response) =
  assoc_to_yojson
    [
      ("ReplicaKeyMetadata", option_to_yojson key_metadata_to_yojson x.replica_key_metadata);
      ("ReplicaPolicy", option_to_yojson policy_type_to_yojson x.replica_policy);
      ("ReplicaTags", option_to_yojson tag_list_to_yojson x.replica_tags);
    ]

let replicate_key_request_to_yojson (x : replicate_key_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("ReplicaRegion", Some (region_type_to_yojson x.replica_region));
      ("Policy", option_to_yojson policy_type_to_yojson x.policy);
      ( "BypassPolicyLockoutSafetyCheck",
        option_to_yojson boolean_type_to_yojson x.bypass_policy_lockout_safety_check );
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let retire_grant_request_to_yojson (x : retire_grant_request) =
  assoc_to_yojson
    [
      ("GrantToken", option_to_yojson grant_token_type_to_yojson x.grant_token);
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("GrantId", option_to_yojson grant_id_type_to_yojson x.grant_id);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let revoke_grant_request_to_yojson (x : revoke_grant_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("GrantId", Some (grant_id_type_to_yojson x.grant_id));
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let rotate_key_on_demand_response_to_yojson (x : rotate_key_on_demand_response) =
  assoc_to_yojson [ ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id) ]

let rotate_key_on_demand_request_to_yojson (x : rotate_key_on_demand_request) =
  assoc_to_yojson [ ("KeyId", Some (key_id_type_to_yojson x.key_id)) ]

let schedule_key_deletion_response_to_yojson (x : schedule_key_deletion_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("DeletionDate", option_to_yojson date_type_to_yojson x.deletion_date);
      ("KeyState", option_to_yojson key_state_to_yojson x.key_state);
      ( "PendingWindowInDays",
        option_to_yojson pending_window_in_days_type_to_yojson x.pending_window_in_days );
    ]

let schedule_key_deletion_request_to_yojson (x : schedule_key_deletion_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ( "PendingWindowInDays",
        option_to_yojson pending_window_in_days_type_to_yojson x.pending_window_in_days );
    ]

let sign_response_to_yojson (x : sign_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("Signature", option_to_yojson ciphertext_type_to_yojson x.signature);
      ("SigningAlgorithm", option_to_yojson signing_algorithm_spec_to_yojson x.signing_algorithm);
    ]

let sign_request_to_yojson (x : sign_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Message", Some (plaintext_type_to_yojson x.message));
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("SigningAlgorithm", Some (signing_algorithm_spec_to_yojson x.signing_algorithm));
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_type_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("KeyId", Some (key_id_type_to_yojson x.key_id)); ("Tags", Some (tag_list_to_yojson x.tags)) ]

let verify_mac_response_to_yojson (x : verify_mac_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("MacValid", option_to_yojson boolean_type_to_yojson x.mac_valid);
      ("MacAlgorithm", option_to_yojson mac_algorithm_spec_to_yojson x.mac_algorithm);
    ]

let verify_mac_request_to_yojson (x : verify_mac_request) =
  assoc_to_yojson
    [
      ("Message", Some (plaintext_type_to_yojson x.message));
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("MacAlgorithm", Some (mac_algorithm_spec_to_yojson x.mac_algorithm));
      ("Mac", Some (ciphertext_type_to_yojson x.mac));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let verify_response_to_yojson (x : verify_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_type_to_yojson x.key_id);
      ("SignatureValid", option_to_yojson boolean_type_to_yojson x.signature_valid);
      ("SigningAlgorithm", option_to_yojson signing_algorithm_spec_to_yojson x.signing_algorithm);
    ]

let verify_request_to_yojson (x : verify_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Message", Some (plaintext_type_to_yojson x.message));
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("Signature", Some (ciphertext_type_to_yojson x.signature));
      ("SigningAlgorithm", Some (signing_algorithm_spec_to_yojson x.signing_algorithm));
      ("GrantTokens", option_to_yojson grant_token_list_to_yojson x.grant_tokens);
      ("DryRun", option_to_yojson nullable_boolean_type_to_yojson x.dry_run);
    ]

let update_primary_region_request_to_yojson (x : update_primary_region_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("PrimaryRegion", Some (region_type_to_yojson x.primary_region));
    ]

let update_key_description_request_to_yojson (x : update_key_description_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("Description", Some (description_type_to_yojson x.description));
    ]

let update_custom_key_store_response_to_yojson = unit_to_yojson

let update_custom_key_store_request_to_yojson (x : update_custom_key_store_request) =
  assoc_to_yojson
    [
      ("CustomKeyStoreId", Some (custom_key_store_id_type_to_yojson x.custom_key_store_id));
      ( "NewCustomKeyStoreName",
        option_to_yojson custom_key_store_name_type_to_yojson x.new_custom_key_store_name );
      ("KeyStorePassword", option_to_yojson key_store_password_type_to_yojson x.key_store_password);
      ( "CloudHsmClusterId",
        option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id );
      ( "XksProxyUriEndpoint",
        option_to_yojson xks_proxy_uri_endpoint_type_to_yojson x.xks_proxy_uri_endpoint );
      ("XksProxyUriPath", option_to_yojson xks_proxy_uri_path_type_to_yojson x.xks_proxy_uri_path);
      ( "XksProxyVpcEndpointServiceName",
        option_to_yojson xks_proxy_vpc_endpoint_service_name_type_to_yojson
          x.xks_proxy_vpc_endpoint_service_name );
      ( "XksProxyVpcEndpointServiceOwner",
        option_to_yojson account_id_type_to_yojson x.xks_proxy_vpc_endpoint_service_owner );
      ( "XksProxyAuthenticationCredential",
        option_to_yojson xks_proxy_authentication_credential_type_to_yojson
          x.xks_proxy_authentication_credential );
      ( "XksProxyConnectivity",
        option_to_yojson xks_proxy_connectivity_type_to_yojson x.xks_proxy_connectivity );
    ]

let update_alias_request_to_yojson (x : update_alias_request) =
  assoc_to_yojson
    [
      ("AliasName", Some (alias_name_type_to_yojson x.alias_name));
      ("TargetKeyId", Some (key_id_type_to_yojson x.target_key_id));
    ]

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("KeyId", Some (key_id_type_to_yojson x.key_id));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]
