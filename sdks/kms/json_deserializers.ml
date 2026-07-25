open Smaws_Lib.Json.DeserializeHelpers
open Types

let aws_account_id_type_of_yojson = string_of_yojson
let account_id_type_of_yojson = string_of_yojson

let algorithm_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSAES_PKCS1_V1_5" -> RSAES_PKCS1_V1_5
    | `String "RSAES_OAEP_SHA_1" -> RSAES_OAEP_SHA_1
    | `String "RSAES_OAEP_SHA_256" -> RSAES_OAEP_SHA_256
    | `String "RSA_AES_KEY_WRAP_SHA_1" -> RSA_AES_KEY_WRAP_SHA_1
    | `String "RSA_AES_KEY_WRAP_SHA_256" -> RSA_AES_KEY_WRAP_SHA_256
    | `String "SM2PKE" -> SM2PKE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "AlgorithmSpec")
     : algorithm_spec)
    : algorithm_spec)

let date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let key_id_type_of_yojson = string_of_yojson
let arn_type_of_yojson = string_of_yojson
let alias_name_type_of_yojson = string_of_yojson

let alias_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias_name = option_of_yojson (value_for_key alias_name_type_of_yojson "AliasName") _list path;
     alias_arn = option_of_yojson (value_for_key arn_type_of_yojson "AliasArn") _list path;
     target_key_id = option_of_yojson (value_for_key key_id_type_of_yojson "TargetKeyId") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_updated_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastUpdatedDate") _list path;
   }
    : alias_list_entry)

let alias_list_of_yojson tree path = list_of_yojson alias_list_entry_of_yojson tree path
let error_message_type_of_yojson = string_of_yojson

let already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : already_exists_exception)

let attestation_document_type_of_yojson = blob_of_yojson
let backing_key_id_response_type_of_yojson = string_of_yojson
let backing_key_id_type_of_yojson = string_of_yojson
let boolean_type_of_yojson = bool_of_yojson

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : not_found_exception)

let kms_invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : kms_invalid_state_exception)

let kms_internal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : kms_internal_exception)

let invalid_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_arn_exception)

let dependency_timeout_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : dependency_timeout_exception)

let cancel_key_deletion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path }
    : cancel_key_deletion_response)

let cancel_key_deletion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path }
    : cancel_key_deletion_request)

let ciphertext_type_of_yojson = blob_of_yojson
let cloud_hsm_cluster_id_type_of_yojson = string_of_yojson

let cloud_hsm_cluster_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : cloud_hsm_cluster_in_use_exception)

let cloud_hsm_cluster_invalid_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : cloud_hsm_cluster_invalid_configuration_exception)

let cloud_hsm_cluster_not_active_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : cloud_hsm_cluster_not_active_exception)

let cloud_hsm_cluster_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : cloud_hsm_cluster_not_found_exception)

let cloud_hsm_cluster_not_related_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : cloud_hsm_cluster_not_related_exception)

let cloud_trail_event_id_type_of_yojson = string_of_yojson

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : conflict_exception)

let custom_key_store_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : custom_key_store_not_found_exception)

let custom_key_store_invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : custom_key_store_invalid_state_exception)

let connect_custom_key_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let custom_key_store_id_type_of_yojson = string_of_yojson

let connect_custom_key_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId" _list path;
   }
    : connect_custom_key_store_request)

let connection_error_code_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_CREDENTIALS" -> INVALID_CREDENTIALS
    | `String "CLUSTER_NOT_FOUND" -> CLUSTER_NOT_FOUND
    | `String "NETWORK_ERRORS" -> NETWORK_ERRORS
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "INSUFFICIENT_CLOUDHSM_HSMS" -> INSUFFICIENT_CLOUDHSM_HSMS
    | `String "USER_LOCKED_OUT" -> USER_LOCKED_OUT
    | `String "USER_NOT_FOUND" -> USER_NOT_FOUND
    | `String "USER_LOGGED_IN" -> USER_LOGGED_IN
    | `String "SUBNET_NOT_FOUND" -> SUBNET_NOT_FOUND
    | `String "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET" -> INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET
    | `String "XKS_PROXY_ACCESS_DENIED" -> XKS_PROXY_ACCESS_DENIED
    | `String "XKS_PROXY_NOT_REACHABLE" -> XKS_PROXY_NOT_REACHABLE
    | `String "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND" -> XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND
    | `String "XKS_PROXY_INVALID_RESPONSE" -> XKS_PROXY_INVALID_RESPONSE
    | `String "XKS_PROXY_INVALID_CONFIGURATION" -> XKS_PROXY_INVALID_CONFIGURATION
    | `String "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION" ->
        XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION
    | `String "XKS_PROXY_TIMED_OUT" -> XKS_PROXY_TIMED_OUT
    | `String "XKS_PROXY_INVALID_TLS_CONFIGURATION" -> XKS_PROXY_INVALID_TLS_CONFIGURATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionErrorCodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionErrorCodeType")
     : connection_error_code_type)
    : connection_error_code_type)

let connection_state_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONNECTED" -> CONNECTED
    | `String "CONNECTING" -> CONNECTING
    | `String "FAILED" -> FAILED
    | `String "DISCONNECTED" -> DISCONNECTED
    | `String "DISCONNECTING" -> DISCONNECTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStateType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStateType")
     : connection_state_type)
    : connection_state_type)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_alias_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_alias_name_exception)

let create_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias_name = value_for_key alias_name_type_of_yojson "AliasName" _list path;
     target_key_id = value_for_key key_id_type_of_yojson "TargetKeyId" _list path;
   }
    : create_alias_request)

let xks_proxy_vpc_endpoint_service_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_vpc_endpoint_service_not_found_exception)

let xks_proxy_vpc_endpoint_service_invalid_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_vpc_endpoint_service_invalid_configuration_exception)

let xks_proxy_vpc_endpoint_service_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_vpc_endpoint_service_in_use_exception)

let xks_proxy_uri_unreachable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_uri_unreachable_exception)

let xks_proxy_uri_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_uri_in_use_exception)

let xks_proxy_uri_endpoint_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_uri_endpoint_in_use_exception)

let xks_proxy_invalid_response_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_invalid_response_exception)

let xks_proxy_invalid_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_invalid_configuration_exception)

let xks_proxy_incorrect_authentication_credential_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_proxy_incorrect_authentication_credential_exception)

let incorrect_trust_anchor_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : incorrect_trust_anchor_exception)

let custom_key_store_name_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : custom_key_store_name_in_use_exception)

let create_custom_key_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       option_of_yojson
         (value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId")
         _list path;
   }
    : create_custom_key_store_response)

let xks_proxy_connectivity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PUBLIC_ENDPOINT" -> PUBLIC_ENDPOINT
    | `String "VPC_ENDPOINT_SERVICE" -> VPC_ENDPOINT_SERVICE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "XksProxyConnectivityType" value)
    | _ -> raise (deserialize_wrong_type_error path "XksProxyConnectivityType")
     : xks_proxy_connectivity_type)
    : xks_proxy_connectivity_type)

let xks_proxy_authentication_raw_secret_access_key_type_of_yojson = string_of_yojson
let xks_proxy_authentication_access_key_id_type_of_yojson = string_of_yojson

let xks_proxy_authentication_credential_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_key_id =
       value_for_key xks_proxy_authentication_access_key_id_type_of_yojson "AccessKeyId" _list path;
     raw_secret_access_key =
       value_for_key xks_proxy_authentication_raw_secret_access_key_type_of_yojson
         "RawSecretAccessKey" _list path;
   }
    : xks_proxy_authentication_credential_type)

let xks_proxy_vpc_endpoint_service_name_type_of_yojson = string_of_yojson
let xks_proxy_uri_path_type_of_yojson = string_of_yojson
let xks_proxy_uri_endpoint_type_of_yojson = string_of_yojson

let custom_key_store_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_CLOUDHSM" -> AWS_CLOUDHSM
    | `String "EXTERNAL_KEY_STORE" -> EXTERNAL_KEY_STORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomKeyStoreType" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomKeyStoreType")
     : custom_key_store_type)
    : custom_key_store_type)

let key_store_password_type_of_yojson = string_of_yojson
let trust_anchor_certificate_type_of_yojson = string_of_yojson
let custom_key_store_name_type_of_yojson = string_of_yojson

let create_custom_key_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_name =
       value_for_key custom_key_store_name_type_of_yojson "CustomKeyStoreName" _list path;
     cloud_hsm_cluster_id =
       option_of_yojson
         (value_for_key cloud_hsm_cluster_id_type_of_yojson "CloudHsmClusterId")
         _list path;
     trust_anchor_certificate =
       option_of_yojson
         (value_for_key trust_anchor_certificate_type_of_yojson "TrustAnchorCertificate")
         _list path;
     key_store_password =
       option_of_yojson
         (value_for_key key_store_password_type_of_yojson "KeyStorePassword")
         _list path;
     custom_key_store_type =
       option_of_yojson
         (value_for_key custom_key_store_type_of_yojson "CustomKeyStoreType")
         _list path;
     xks_proxy_uri_endpoint =
       option_of_yojson
         (value_for_key xks_proxy_uri_endpoint_type_of_yojson "XksProxyUriEndpoint")
         _list path;
     xks_proxy_uri_path =
       option_of_yojson
         (value_for_key xks_proxy_uri_path_type_of_yojson "XksProxyUriPath")
         _list path;
     xks_proxy_vpc_endpoint_service_name =
       option_of_yojson
         (value_for_key xks_proxy_vpc_endpoint_service_name_type_of_yojson
            "XksProxyVpcEndpointServiceName")
         _list path;
     xks_proxy_vpc_endpoint_service_owner =
       option_of_yojson
         (value_for_key account_id_type_of_yojson "XksProxyVpcEndpointServiceOwner")
         _list path;
     xks_proxy_authentication_credential =
       option_of_yojson
         (value_for_key xks_proxy_authentication_credential_type_of_yojson
            "XksProxyAuthenticationCredential")
         _list path;
     xks_proxy_connectivity =
       option_of_yojson
         (value_for_key xks_proxy_connectivity_type_of_yojson "XksProxyConnectivity")
         _list path;
   }
    : create_custom_key_store_request)

let invalid_grant_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_grant_token_exception)

let dry_run_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : dry_run_operation_exception)

let disabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : disabled_exception)

let grant_id_type_of_yojson = string_of_yojson
let grant_token_type_of_yojson = string_of_yojson

let create_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant_token =
       option_of_yojson (value_for_key grant_token_type_of_yojson "GrantToken") _list path;
     grant_id = option_of_yojson (value_for_key grant_id_type_of_yojson "GrantId") _list path;
   }
    : create_grant_response)

let service_principal_type_of_yojson = string_of_yojson
let nullable_boolean_type_of_yojson = bool_of_yojson
let grant_name_type_of_yojson = string_of_yojson
let grant_token_list_of_yojson tree path = list_of_yojson grant_token_type_of_yojson tree path
let grant_constraint_source_arn_type_of_yojson = string_of_yojson
let encryption_context_value_of_yojson = string_of_yojson
let encryption_context_key_of_yojson = string_of_yojson

let encryption_context_type_of_yojson tree path =
  map_of_yojson encryption_context_key_of_yojson encryption_context_value_of_yojson tree path

let grant_constraints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_context_subset =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContextSubset")
         _list path;
     encryption_context_equals =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContextEquals")
         _list path;
     source_arn =
       option_of_yojson
         (value_for_key grant_constraint_source_arn_type_of_yojson "SourceArn")
         _list path;
   }
    : grant_constraints)

let grant_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "Decrypt" -> Decrypt
    | `String "Encrypt" -> Encrypt
    | `String "GenerateDataKey" -> GenerateDataKey
    | `String "GenerateDataKeyWithoutPlaintext" -> GenerateDataKeyWithoutPlaintext
    | `String "ReEncryptFrom" -> ReEncryptFrom
    | `String "ReEncryptTo" -> ReEncryptTo
    | `String "Sign" -> Sign
    | `String "Verify" -> Verify
    | `String "GetPublicKey" -> GetPublicKey
    | `String "CreateGrant" -> CreateGrant
    | `String "RetireGrant" -> RetireGrant
    | `String "DescribeKey" -> DescribeKey
    | `String "GenerateDataKeyPair" -> GenerateDataKeyPair
    | `String "GenerateDataKeyPairWithoutPlaintext" -> GenerateDataKeyPairWithoutPlaintext
    | `String "GenerateMac" -> GenerateMac
    | `String "VerifyMac" -> VerifyMac
    | `String "DeriveSharedSecret" -> DeriveSharedSecret
    | `String value -> raise (deserialize_unknown_enum_value_error path "GrantOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "GrantOperation")
     : grant_operation)
    : grant_operation)

let grant_operation_list_of_yojson tree path = list_of_yojson grant_operation_of_yojson tree path
let principal_id_type_of_yojson = string_of_yojson

let create_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     grantee_principal =
       option_of_yojson (value_for_key principal_id_type_of_yojson "GranteePrincipal") _list path;
     retiring_principal =
       option_of_yojson (value_for_key principal_id_type_of_yojson "RetiringPrincipal") _list path;
     operations = value_for_key grant_operation_list_of_yojson "Operations" _list path;
     constraints =
       option_of_yojson (value_for_key grant_constraints_of_yojson "Constraints") _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     name = option_of_yojson (value_for_key grant_name_type_of_yojson "Name") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
     grantee_service_principal =
       option_of_yojson
         (value_for_key service_principal_type_of_yojson "GranteeServicePrincipal")
         _list path;
     retiring_service_principal =
       option_of_yojson
         (value_for_key service_principal_type_of_yojson "RetiringServicePrincipal")
         _list path;
   }
    : create_grant_request)

let xks_key_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_key_not_found_exception)

let xks_key_invalid_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_key_invalid_configuration_exception)

let xks_key_already_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : xks_key_already_in_use_exception)

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : unsupported_operation_exception)

let tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : tag_exception)

let malformed_policy_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : malformed_policy_document_exception)

let xks_key_id_type_of_yojson = string_of_yojson

let xks_key_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = option_of_yojson (value_for_key xks_key_id_type_of_yojson "Id") _list path }
    : xks_key_configuration_type)

let mac_algorithm_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "HMAC_SHA_224" -> HMAC_SHA_224
    | `String "HMAC_SHA_256" -> HMAC_SHA_256
    | `String "HMAC_SHA_384" -> HMAC_SHA_384
    | `String "HMAC_SHA_512" -> HMAC_SHA_512
    | `String value -> raise (deserialize_unknown_enum_value_error path "MacAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "MacAlgorithmSpec")
     : mac_algorithm_spec)
    : mac_algorithm_spec)

let mac_algorithm_spec_list_of_yojson tree path =
  list_of_yojson mac_algorithm_spec_of_yojson tree path

let pending_window_in_days_type_of_yojson = int_of_yojson
let region_type_of_yojson = string_of_yojson

let multi_region_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_type_of_yojson "Arn") _list path;
     region = option_of_yojson (value_for_key region_type_of_yojson "Region") _list path;
   }
    : multi_region_key)

let multi_region_key_list_of_yojson tree path = list_of_yojson multi_region_key_of_yojson tree path

let multi_region_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIMARY" -> PRIMARY
    | `String "REPLICA" -> REPLICA
    | `String value -> raise (deserialize_unknown_enum_value_error path "MultiRegionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "MultiRegionKeyType")
     : multi_region_key_type)
    : multi_region_key_type)

let multi_region_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_region_key_type =
       option_of_yojson
         (value_for_key multi_region_key_type_of_yojson "MultiRegionKeyType")
         _list path;
     primary_key =
       option_of_yojson (value_for_key multi_region_key_of_yojson "PrimaryKey") _list path;
     replica_keys =
       option_of_yojson (value_for_key multi_region_key_list_of_yojson "ReplicaKeys") _list path;
   }
    : multi_region_configuration)

let key_agreement_algorithm_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "ECDH" -> ECDH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyAgreementAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAgreementAlgorithmSpec")
     : key_agreement_algorithm_spec)
    : key_agreement_algorithm_spec)

let key_agreement_algorithm_spec_list_of_yojson tree path =
  list_of_yojson key_agreement_algorithm_spec_of_yojson tree path

let signing_algorithm_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSASSA_PSS_SHA_256" -> RSASSA_PSS_SHA_256
    | `String "RSASSA_PSS_SHA_384" -> RSASSA_PSS_SHA_384
    | `String "RSASSA_PSS_SHA_512" -> RSASSA_PSS_SHA_512
    | `String "RSASSA_PKCS1_V1_5_SHA_256" -> RSASSA_PKCS1_V1_5_SHA_256
    | `String "RSASSA_PKCS1_V1_5_SHA_384" -> RSASSA_PKCS1_V1_5_SHA_384
    | `String "RSASSA_PKCS1_V1_5_SHA_512" -> RSASSA_PKCS1_V1_5_SHA_512
    | `String "ECDSA_SHA_256" -> ECDSA_SHA_256
    | `String "ECDSA_SHA_384" -> ECDSA_SHA_384
    | `String "ECDSA_SHA_512" -> ECDSA_SHA_512
    | `String "SM2DSA" -> SM2DSA
    | `String "ML_DSA_SHAKE_256" -> ML_DSA_SHAKE_256
    | `String "ED25519_SHA_512" -> ED25519_SHA_512
    | `String "ED25519_PH_SHA_512" -> ED25519_PH_SHA_512
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SigningAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningAlgorithmSpec")
     : signing_algorithm_spec)
    : signing_algorithm_spec)

let signing_algorithm_spec_list_of_yojson tree path =
  list_of_yojson signing_algorithm_spec_of_yojson tree path

let encryption_algorithm_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYMMETRIC_DEFAULT" -> SYMMETRIC_DEFAULT
    | `String "RSAES_OAEP_SHA_1" -> RSAES_OAEP_SHA_1
    | `String "RSAES_OAEP_SHA_256" -> RSAES_OAEP_SHA_256
    | `String "SM2PKE" -> SM2PKE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EncryptionAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionAlgorithmSpec")
     : encryption_algorithm_spec)
    : encryption_algorithm_spec)

let encryption_algorithm_spec_list_of_yojson tree path =
  list_of_yojson encryption_algorithm_spec_of_yojson tree path

let key_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_4096" -> RSA_4096
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String "ECC_SECG_P256K1" -> ECC_SECG_P256K1
    | `String "SYMMETRIC_DEFAULT" -> SYMMETRIC_DEFAULT
    | `String "HMAC_224" -> HMAC_224
    | `String "HMAC_256" -> HMAC_256
    | `String "HMAC_384" -> HMAC_384
    | `String "HMAC_512" -> HMAC_512
    | `String "SM2" -> SM2
    | `String "ML_DSA_44" -> ML_DSA_44
    | `String "ML_DSA_65" -> ML_DSA_65
    | `String "ML_DSA_87" -> ML_DSA_87
    | `String "ECC_NIST_EDWARDS25519" -> ECC_NIST_EDWARDS25519
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "KeySpec")
     : key_spec)
    : key_spec)

let customer_master_key_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_4096" -> RSA_4096
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String "ECC_SECG_P256K1" -> ECC_SECG_P256K1
    | `String "SYMMETRIC_DEFAULT" -> SYMMETRIC_DEFAULT
    | `String "HMAC_224" -> HMAC_224
    | `String "HMAC_256" -> HMAC_256
    | `String "HMAC_384" -> HMAC_384
    | `String "HMAC_512" -> HMAC_512
    | `String "SM2" -> SM2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomerMasterKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomerMasterKeySpec")
     : customer_master_key_spec)
    : customer_master_key_spec)

let key_manager_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS" -> AWS
    | `String "CUSTOMER" -> CUSTOMER
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyManagerType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyManagerType")
     : key_manager_type)
    : key_manager_type)

let expiration_model_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEY_MATERIAL_EXPIRES" -> KEY_MATERIAL_EXPIRES
    | `String "KEY_MATERIAL_DOES_NOT_EXPIRE" -> KEY_MATERIAL_DOES_NOT_EXPIRE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExpirationModelType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExpirationModelType")
     : expiration_model_type)
    : expiration_model_type)

let origin_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_KMS" -> AWS_KMS
    | `String "EXTERNAL" -> EXTERNAL
    | `String "AWS_CLOUDHSM" -> AWS_CLOUDHSM
    | `String "EXTERNAL_KEY_STORE" -> EXTERNAL_KEY_STORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OriginType" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginType")
     : origin_type)
    : origin_type)

let key_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Creating" -> Creating
    | `String "Enabled" -> Enabled
    | `String "Disabled" -> Disabled
    | `String "PendingDeletion" -> PendingDeletion
    | `String "PendingImport" -> PendingImport
    | `String "PendingReplicaDeletion" -> PendingReplicaDeletion
    | `String "Unavailable" -> Unavailable
    | `String "Updating" -> Updating
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyState" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyState")
     : key_state)
    : key_state)

let key_usage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SIGN_VERIFY" -> SIGN_VERIFY
    | `String "ENCRYPT_DECRYPT" -> ENCRYPT_DECRYPT
    | `String "GENERATE_VERIFY_MAC" -> GENERATE_VERIFY_MAC
    | `String "KEY_AGREEMENT" -> KEY_AGREEMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyUsageType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyUsageType")
     : key_usage_type)
    : key_usage_type)

let description_type_of_yojson = string_of_yojson

let key_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id =
       option_of_yojson (value_for_key aws_account_id_type_of_yojson "AWSAccountId") _list path;
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     arn = option_of_yojson (value_for_key arn_type_of_yojson "Arn") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     key_usage = option_of_yojson (value_for_key key_usage_type_of_yojson "KeyUsage") _list path;
     key_state = option_of_yojson (value_for_key key_state_of_yojson "KeyState") _list path;
     deletion_date = option_of_yojson (value_for_key date_type_of_yojson "DeletionDate") _list path;
     valid_to = option_of_yojson (value_for_key date_type_of_yojson "ValidTo") _list path;
     origin = option_of_yojson (value_for_key origin_type_of_yojson "Origin") _list path;
     custom_key_store_id =
       option_of_yojson
         (value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId")
         _list path;
     cloud_hsm_cluster_id =
       option_of_yojson
         (value_for_key cloud_hsm_cluster_id_type_of_yojson "CloudHsmClusterId")
         _list path;
     expiration_model =
       option_of_yojson (value_for_key expiration_model_type_of_yojson "ExpirationModel") _list path;
     key_manager =
       option_of_yojson (value_for_key key_manager_type_of_yojson "KeyManager") _list path;
     customer_master_key_spec =
       option_of_yojson
         (value_for_key customer_master_key_spec_of_yojson "CustomerMasterKeySpec")
         _list path;
     key_spec = option_of_yojson (value_for_key key_spec_of_yojson "KeySpec") _list path;
     encryption_algorithms =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_list_of_yojson "EncryptionAlgorithms")
         _list path;
     signing_algorithms =
       option_of_yojson
         (value_for_key signing_algorithm_spec_list_of_yojson "SigningAlgorithms")
         _list path;
     key_agreement_algorithms =
       option_of_yojson
         (value_for_key key_agreement_algorithm_spec_list_of_yojson "KeyAgreementAlgorithms")
         _list path;
     multi_region =
       option_of_yojson (value_for_key nullable_boolean_type_of_yojson "MultiRegion") _list path;
     multi_region_configuration =
       option_of_yojson
         (value_for_key multi_region_configuration_of_yojson "MultiRegionConfiguration")
         _list path;
     pending_deletion_window_in_days =
       option_of_yojson
         (value_for_key pending_window_in_days_type_of_yojson "PendingDeletionWindowInDays")
         _list path;
     mac_algorithms =
       option_of_yojson (value_for_key mac_algorithm_spec_list_of_yojson "MacAlgorithms") _list path;
     xks_key_configuration =
       option_of_yojson
         (value_for_key xks_key_configuration_type_of_yojson "XksKeyConfiguration")
         _list path;
     current_key_material_id =
       option_of_yojson
         (value_for_key backing_key_id_type_of_yojson "CurrentKeyMaterialId")
         _list path;
   }
    : key_metadata)

let create_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_metadata = option_of_yojson (value_for_key key_metadata_of_yojson "KeyMetadata") _list path;
   }
    : create_key_response)

let tag_value_type_of_yojson = string_of_yojson
let tag_key_type_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_key = value_for_key tag_key_type_of_yojson "TagKey" _list path;
     tag_value = value_for_key tag_value_type_of_yojson "TagValue" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let policy_type_of_yojson = string_of_yojson

let create_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key policy_type_of_yojson "Policy") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     key_usage = option_of_yojson (value_for_key key_usage_type_of_yojson "KeyUsage") _list path;
     customer_master_key_spec =
       option_of_yojson
         (value_for_key customer_master_key_spec_of_yojson "CustomerMasterKeySpec")
         _list path;
     key_spec = option_of_yojson (value_for_key key_spec_of_yojson "KeySpec") _list path;
     origin = option_of_yojson (value_for_key origin_type_of_yojson "Origin") _list path;
     custom_key_store_id =
       option_of_yojson
         (value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId")
         _list path;
     bypass_policy_lockout_safety_check =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "BypassPolicyLockoutSafetyCheck")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     multi_region =
       option_of_yojson (value_for_key nullable_boolean_type_of_yojson "MultiRegion") _list path;
     xks_key_id = option_of_yojson (value_for_key xks_key_id_type_of_yojson "XksKeyId") _list path;
   }
    : create_key_request)

let custom_key_store_has_cm_ks_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : custom_key_store_has_cm_ks_exception)

let xks_proxy_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connectivity =
       option_of_yojson
         (value_for_key xks_proxy_connectivity_type_of_yojson "Connectivity")
         _list path;
     access_key_id =
       option_of_yojson
         (value_for_key xks_proxy_authentication_access_key_id_type_of_yojson "AccessKeyId")
         _list path;
     uri_endpoint =
       option_of_yojson
         (value_for_key xks_proxy_uri_endpoint_type_of_yojson "UriEndpoint")
         _list path;
     uri_path =
       option_of_yojson (value_for_key xks_proxy_uri_path_type_of_yojson "UriPath") _list path;
     vpc_endpoint_service_name =
       option_of_yojson
         (value_for_key xks_proxy_vpc_endpoint_service_name_type_of_yojson "VpcEndpointServiceName")
         _list path;
     vpc_endpoint_service_owner =
       option_of_yojson
         (value_for_key account_id_type_of_yojson "VpcEndpointServiceOwner")
         _list path;
   }
    : xks_proxy_configuration_type)

let custom_key_stores_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       option_of_yojson
         (value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId")
         _list path;
     custom_key_store_name =
       option_of_yojson
         (value_for_key custom_key_store_name_type_of_yojson "CustomKeyStoreName")
         _list path;
     cloud_hsm_cluster_id =
       option_of_yojson
         (value_for_key cloud_hsm_cluster_id_type_of_yojson "CloudHsmClusterId")
         _list path;
     trust_anchor_certificate =
       option_of_yojson
         (value_for_key trust_anchor_certificate_type_of_yojson "TrustAnchorCertificate")
         _list path;
     connection_state =
       option_of_yojson (value_for_key connection_state_type_of_yojson "ConnectionState") _list path;
     connection_error_code =
       option_of_yojson
         (value_for_key connection_error_code_type_of_yojson "ConnectionErrorCode")
         _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     custom_key_store_type =
       option_of_yojson
         (value_for_key custom_key_store_type_of_yojson "CustomKeyStoreType")
         _list path;
     xks_proxy_configuration =
       option_of_yojson
         (value_for_key xks_proxy_configuration_type_of_yojson "XksProxyConfiguration")
         _list path;
   }
    : custom_key_stores_list_entry)

let custom_key_stores_list_of_yojson tree path =
  list_of_yojson custom_key_stores_list_entry_of_yojson tree path

let data_key_pair_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_4096" -> RSA_4096
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String "ECC_SECG_P256K1" -> ECC_SECG_P256K1
    | `String "SM2" -> SM2
    | `String "ECC_NIST_EDWARDS25519" -> ECC_NIST_EDWARDS25519
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataKeyPairSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "DataKeyPairSpec")
     : data_key_pair_spec)
    : data_key_pair_spec)

let data_key_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "AES_256" -> AES_256
    | `String "AES_128" -> AES_128
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "DataKeySpec")
     : data_key_spec)
    : data_key_spec)

let key_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : key_unavailable_exception)

let invalid_key_usage_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_key_usage_exception)

let invalid_ciphertext_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_ciphertext_exception)

let incorrect_key_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : incorrect_key_exception)

let plaintext_type_of_yojson = blob_of_yojson

let decrypt_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     plaintext = option_of_yojson (value_for_key plaintext_type_of_yojson "Plaintext") _list path;
     encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "EncryptionAlgorithm")
         _list path;
     ciphertext_for_recipient =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "CiphertextForRecipient")
         _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : decrypt_response)

let dry_run_modifier_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IGNORE_CIPHERTEXT" -> IGNORE_CIPHERTEXT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DryRunModifierType" value)
    | _ -> raise (deserialize_wrong_type_error path "DryRunModifierType")
     : dry_run_modifier_type)
    : dry_run_modifier_type)

let dry_run_modifier_list_of_yojson tree path =
  list_of_yojson dry_run_modifier_type_of_yojson tree path

let key_encryption_mechanism_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSAES_OAEP_SHA_256" -> RSAES_OAEP_SHA_256
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyEncryptionMechanism" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyEncryptionMechanism")
     : key_encryption_mechanism)
    : key_encryption_mechanism)

let recipient_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_encryption_algorithm =
       option_of_yojson
         (value_for_key key_encryption_mechanism_of_yojson "KeyEncryptionAlgorithm")
         _list path;
     attestation_document =
       option_of_yojson
         (value_for_key attestation_document_type_of_yojson "AttestationDocument")
         _list path;
   }
    : recipient_info)

let decrypt_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext_blob =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "CiphertextBlob") _list path;
     encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContext")
         _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "EncryptionAlgorithm")
         _list path;
     recipient = option_of_yojson (value_for_key recipient_info_of_yojson "Recipient") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
     dry_run_modifiers =
       option_of_yojson (value_for_key dry_run_modifier_list_of_yojson "DryRunModifiers") _list path;
   }
    : decrypt_request)

let delete_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_name = value_for_key alias_name_type_of_yojson "AliasName" _list path }
    : delete_alias_request)

let delete_custom_key_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_custom_key_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId" _list path;
   }
    : delete_custom_key_store_request)

let delete_imported_key_material_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_material_id =
       option_of_yojson
         (value_for_key backing_key_id_response_type_of_yojson "KeyMaterialId")
         _list path;
   }
    : delete_imported_key_material_response)

let delete_imported_key_material_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : delete_imported_key_material_request)

let derive_shared_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     shared_secret =
       option_of_yojson (value_for_key plaintext_type_of_yojson "SharedSecret") _list path;
     ciphertext_for_recipient =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "CiphertextForRecipient")
         _list path;
     key_agreement_algorithm =
       option_of_yojson
         (value_for_key key_agreement_algorithm_spec_of_yojson "KeyAgreementAlgorithm")
         _list path;
     key_origin = option_of_yojson (value_for_key origin_type_of_yojson "KeyOrigin") _list path;
   }
    : derive_shared_secret_response)

let public_key_type_of_yojson = blob_of_yojson

let derive_shared_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     key_agreement_algorithm =
       value_for_key key_agreement_algorithm_spec_of_yojson "KeyAgreementAlgorithm" _list path;
     public_key = value_for_key public_key_type_of_yojson "PublicKey" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
     recipient = option_of_yojson (value_for_key recipient_info_of_yojson "Recipient") _list path;
   }
    : derive_shared_secret_request)

let invalid_marker_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_marker_exception)

let marker_type_of_yojson = string_of_yojson

let describe_custom_key_stores_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_stores =
       option_of_yojson
         (value_for_key custom_key_stores_list_of_yojson "CustomKeyStores")
         _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : describe_custom_key_stores_response)

let limit_type_of_yojson = int_of_yojson

let describe_custom_key_stores_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       option_of_yojson
         (value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId")
         _list path;
     custom_key_store_name =
       option_of_yojson
         (value_for_key custom_key_store_name_type_of_yojson "CustomKeyStoreName")
         _list path;
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
   }
    : describe_custom_key_stores_request)

let describe_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_metadata = option_of_yojson (value_for_key key_metadata_of_yojson "KeyMetadata") _list path;
   }
    : describe_key_response)

let describe_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
   }
    : describe_key_request)

let disable_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path } : disable_key_request)

let disable_key_rotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path }
    : disable_key_rotation_request)

let disconnect_custom_key_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disconnect_custom_key_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId" _list path;
   }
    : disconnect_custom_key_store_request)

let enable_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path } : enable_key_request)

let rotation_period_in_days_type_of_yojson = int_of_yojson

let enable_key_rotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     rotation_period_in_days =
       option_of_yojson
         (value_for_key rotation_period_in_days_type_of_yojson "RotationPeriodInDays")
         _list path;
   }
    : enable_key_rotation_request)

let encrypt_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext_blob =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "CiphertextBlob") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "EncryptionAlgorithm")
         _list path;
   }
    : encrypt_response)

let encrypt_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     plaintext = value_for_key plaintext_type_of_yojson "Plaintext" _list path;
     encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContext")
         _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "EncryptionAlgorithm")
         _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : encrypt_request)

let expired_import_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : expired_import_token_exception)

let generate_data_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext_blob =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "CiphertextBlob") _list path;
     plaintext = option_of_yojson (value_for_key plaintext_type_of_yojson "Plaintext") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     ciphertext_for_recipient =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "CiphertextForRecipient")
         _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : generate_data_key_response)

let number_of_bytes_type_of_yojson = int_of_yojson

let generate_data_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContext")
         _list path;
     number_of_bytes =
       option_of_yojson (value_for_key number_of_bytes_type_of_yojson "NumberOfBytes") _list path;
     key_spec = option_of_yojson (value_for_key data_key_spec_of_yojson "KeySpec") _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     recipient = option_of_yojson (value_for_key recipient_info_of_yojson "Recipient") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : generate_data_key_request)

let generate_data_key_pair_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_key_ciphertext_blob =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "PrivateKeyCiphertextBlob")
         _list path;
     private_key_plaintext =
       option_of_yojson (value_for_key plaintext_type_of_yojson "PrivateKeyPlaintext") _list path;
     public_key = option_of_yojson (value_for_key public_key_type_of_yojson "PublicKey") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_pair_spec =
       option_of_yojson (value_for_key data_key_pair_spec_of_yojson "KeyPairSpec") _list path;
     ciphertext_for_recipient =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "CiphertextForRecipient")
         _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : generate_data_key_pair_response)

let generate_data_key_pair_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContext")
         _list path;
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     key_pair_spec = value_for_key data_key_pair_spec_of_yojson "KeyPairSpec" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     recipient = option_of_yojson (value_for_key recipient_info_of_yojson "Recipient") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : generate_data_key_pair_request)

let generate_data_key_pair_without_plaintext_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_key_ciphertext_blob =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "PrivateKeyCiphertextBlob")
         _list path;
     public_key = option_of_yojson (value_for_key public_key_type_of_yojson "PublicKey") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_pair_spec =
       option_of_yojson (value_for_key data_key_pair_spec_of_yojson "KeyPairSpec") _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : generate_data_key_pair_without_plaintext_response)

let generate_data_key_pair_without_plaintext_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContext")
         _list path;
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     key_pair_spec = value_for_key data_key_pair_spec_of_yojson "KeyPairSpec" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : generate_data_key_pair_without_plaintext_request)

let generate_data_key_without_plaintext_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext_blob =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "CiphertextBlob") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : generate_data_key_without_plaintext_response)

let generate_data_key_without_plaintext_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "EncryptionContext")
         _list path;
     key_spec = option_of_yojson (value_for_key data_key_spec_of_yojson "KeySpec") _list path;
     number_of_bytes =
       option_of_yojson (value_for_key number_of_bytes_type_of_yojson "NumberOfBytes") _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : generate_data_key_without_plaintext_request)

let generate_mac_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mac = option_of_yojson (value_for_key ciphertext_type_of_yojson "Mac") _list path;
     mac_algorithm =
       option_of_yojson (value_for_key mac_algorithm_spec_of_yojson "MacAlgorithm") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
   }
    : generate_mac_response)

let generate_mac_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key plaintext_type_of_yojson "Message" _list path;
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     mac_algorithm = value_for_key mac_algorithm_spec_of_yojson "MacAlgorithm" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : generate_mac_request)

let generate_random_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plaintext = option_of_yojson (value_for_key plaintext_type_of_yojson "Plaintext") _list path;
     ciphertext_for_recipient =
       option_of_yojson
         (value_for_key ciphertext_type_of_yojson "CiphertextForRecipient")
         _list path;
   }
    : generate_random_response)

let generate_random_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_bytes =
       option_of_yojson (value_for_key number_of_bytes_type_of_yojson "NumberOfBytes") _list path;
     custom_key_store_id =
       option_of_yojson
         (value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId")
         _list path;
     recipient = option_of_yojson (value_for_key recipient_info_of_yojson "Recipient") _list path;
   }
    : generate_random_request)

let kms_request_id_type_of_yojson = string_of_yojson

let key_last_usage_tracking_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "Decrypt" -> Decrypt
    | `String "DeriveSharedSecret" -> DeriveSharedSecret
    | `String "Encrypt" -> Encrypt
    | `String "GenerateDataKey" -> GenerateDataKey
    | `String "GenerateDataKeyPair" -> GenerateDataKeyPair
    | `String "GenerateDataKeyPairWithoutPlaintext" -> GenerateDataKeyPairWithoutPlaintext
    | `String "GenerateDataKeyWithoutPlaintext" -> GenerateDataKeyWithoutPlaintext
    | `String "GenerateMac" -> GenerateMac
    | `String "ReEncrypt" -> ReEncrypt
    | `String "Sign" -> Sign
    | `String "Verify" -> Verify
    | `String "VerifyMac" -> VerifyMac
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyLastUsageTrackingOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyLastUsageTrackingOperation")
     : key_last_usage_tracking_operation)
    : key_last_usage_tracking_operation)

let key_last_usage_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation =
       option_of_yojson
         (value_for_key key_last_usage_tracking_operation_of_yojson "Operation")
         _list path;
     timestamp = option_of_yojson (value_for_key date_type_of_yojson "Timestamp") _list path;
     cloud_trail_event_id =
       option_of_yojson
         (value_for_key cloud_trail_event_id_type_of_yojson "CloudTrailEventId")
         _list path;
     kms_request_id =
       option_of_yojson (value_for_key kms_request_id_type_of_yojson "KmsRequestId") _list path;
   }
    : key_last_usage_data)

let get_key_last_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_last_usage =
       option_of_yojson (value_for_key key_last_usage_data_of_yojson "KeyLastUsage") _list path;
     tracking_start_date =
       option_of_yojson (value_for_key date_type_of_yojson "TrackingStartDate") _list path;
     key_creation_date =
       option_of_yojson (value_for_key date_type_of_yojson "KeyCreationDate") _list path;
   }
    : get_key_last_usage_response)

let get_key_last_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path } : get_key_last_usage_request)

let policy_name_type_of_yojson = string_of_yojson

let get_key_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key policy_type_of_yojson "Policy") _list path;
     policy_name =
       option_of_yojson (value_for_key policy_name_type_of_yojson "PolicyName") _list path;
   }
    : get_key_policy_response)

let get_key_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     policy_name =
       option_of_yojson (value_for_key policy_name_type_of_yojson "PolicyName") _list path;
   }
    : get_key_policy_request)

let get_key_rotation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_rotation_enabled =
       option_of_yojson (value_for_key boolean_type_of_yojson "KeyRotationEnabled") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     rotation_period_in_days =
       option_of_yojson
         (value_for_key rotation_period_in_days_type_of_yojson "RotationPeriodInDays")
         _list path;
     next_rotation_date =
       option_of_yojson (value_for_key date_type_of_yojson "NextRotationDate") _list path;
     on_demand_rotation_start_date =
       option_of_yojson (value_for_key date_type_of_yojson "OnDemandRotationStartDate") _list path;
   }
    : get_key_rotation_status_response)

let get_key_rotation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path }
    : get_key_rotation_status_request)

let get_parameters_for_import_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     import_token =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "ImportToken") _list path;
     public_key = option_of_yojson (value_for_key plaintext_type_of_yojson "PublicKey") _list path;
     parameters_valid_to =
       option_of_yojson (value_for_key date_type_of_yojson "ParametersValidTo") _list path;
   }
    : get_parameters_for_import_response)

let wrapping_key_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_4096" -> RSA_4096
    | `String "SM2" -> SM2
    | `String value -> raise (deserialize_unknown_enum_value_error path "WrappingKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "WrappingKeySpec")
     : wrapping_key_spec)
    : wrapping_key_spec)

let get_parameters_for_import_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     wrapping_algorithm = value_for_key algorithm_spec_of_yojson "WrappingAlgorithm" _list path;
     wrapping_key_spec = value_for_key wrapping_key_spec_of_yojson "WrappingKeySpec" _list path;
   }
    : get_parameters_for_import_request)

let get_public_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     public_key = option_of_yojson (value_for_key public_key_type_of_yojson "PublicKey") _list path;
     customer_master_key_spec =
       option_of_yojson
         (value_for_key customer_master_key_spec_of_yojson "CustomerMasterKeySpec")
         _list path;
     key_spec = option_of_yojson (value_for_key key_spec_of_yojson "KeySpec") _list path;
     key_usage = option_of_yojson (value_for_key key_usage_type_of_yojson "KeyUsage") _list path;
     encryption_algorithms =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_list_of_yojson "EncryptionAlgorithms")
         _list path;
     signing_algorithms =
       option_of_yojson
         (value_for_key signing_algorithm_spec_list_of_yojson "SigningAlgorithms")
         _list path;
     key_agreement_algorithms =
       option_of_yojson
         (value_for_key key_agreement_algorithm_spec_list_of_yojson "KeyAgreementAlgorithms")
         _list path;
   }
    : get_public_key_response)

let get_public_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
   }
    : get_public_key_request)

let grant_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     grant_id = option_of_yojson (value_for_key grant_id_type_of_yojson "GrantId") _list path;
     name = option_of_yojson (value_for_key grant_name_type_of_yojson "Name") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     grantee_principal =
       option_of_yojson (value_for_key principal_id_type_of_yojson "GranteePrincipal") _list path;
     retiring_principal =
       option_of_yojson (value_for_key principal_id_type_of_yojson "RetiringPrincipal") _list path;
     issuing_account =
       option_of_yojson (value_for_key principal_id_type_of_yojson "IssuingAccount") _list path;
     operations =
       option_of_yojson (value_for_key grant_operation_list_of_yojson "Operations") _list path;
     constraints =
       option_of_yojson (value_for_key grant_constraints_of_yojson "Constraints") _list path;
     grantee_service_principal =
       option_of_yojson
         (value_for_key service_principal_type_of_yojson "GranteeServicePrincipal")
         _list path;
     retiring_service_principal =
       option_of_yojson
         (value_for_key service_principal_type_of_yojson "RetiringServicePrincipal")
         _list path;
   }
    : grant_list_entry)

let grant_list_of_yojson tree path = list_of_yojson grant_list_entry_of_yojson tree path

let invalid_import_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_import_token_exception)

let incorrect_key_material_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : incorrect_key_material_exception)

let import_key_material_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : import_key_material_response)

let key_material_description_type_of_yojson = string_of_yojson

let import_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW_KEY_MATERIAL" -> NEW_KEY_MATERIAL
    | `String "EXISTING_KEY_MATERIAL" -> EXISTING_KEY_MATERIAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportType")
     : import_type)
    : import_type)

let import_key_material_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     import_token = value_for_key ciphertext_type_of_yojson "ImportToken" _list path;
     encrypted_key_material =
       value_for_key ciphertext_type_of_yojson "EncryptedKeyMaterial" _list path;
     valid_to = option_of_yojson (value_for_key date_type_of_yojson "ValidTo") _list path;
     expiration_model =
       option_of_yojson (value_for_key expiration_model_type_of_yojson "ExpirationModel") _list path;
     import_type = option_of_yojson (value_for_key import_type_of_yojson "ImportType") _list path;
     key_material_description =
       option_of_yojson
         (value_for_key key_material_description_type_of_yojson "KeyMaterialDescription")
         _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
   }
    : import_key_material_request)

let import_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORTED" -> IMPORTED
    | `String "PENDING_IMPORT" -> PENDING_IMPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportState" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportState")
     : import_state)
    : import_state)

let include_key_material_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_KEY_MATERIAL" -> ALL_KEY_MATERIAL
    | `String "ROTATIONS_ONLY" -> ROTATIONS_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "IncludeKeyMaterial" value)
    | _ -> raise (deserialize_wrong_type_error path "IncludeKeyMaterial")
     : include_key_material)
    : include_key_material)

let invalid_grant_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : invalid_grant_id_exception)

let kms_invalid_mac_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : kms_invalid_mac_exception)

let kms_invalid_signature_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_type_of_yojson "message") _list path }
    : kms_invalid_signature_exception)

let key_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_arn = option_of_yojson (value_for_key arn_type_of_yojson "KeyArn") _list path;
   }
    : key_list_entry)

let key_list_of_yojson tree path = list_of_yojson key_list_entry_of_yojson tree path

let key_material_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "NON_CURRENT" -> NON_CURRENT
    | `String "CURRENT" -> CURRENT
    | `String "PENDING_ROTATION" -> PENDING_ROTATION
    | `String "PENDING_MULTI_REGION_IMPORT_AND_ROTATION" -> PENDING_MULTI_REGION_IMPORT_AND_ROTATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyMaterialState" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyMaterialState")
     : key_material_state)
    : key_material_state)

let list_aliases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aliases = option_of_yojson (value_for_key alias_list_of_yojson "Aliases") _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : list_aliases_response)

let list_aliases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
   }
    : list_aliases_request)

let list_grants_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grants = option_of_yojson (value_for_key grant_list_of_yojson "Grants") _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : list_grants_response)

let list_grants_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     grant_id = option_of_yojson (value_for_key grant_id_type_of_yojson "GrantId") _list path;
     grantee_principal =
       option_of_yojson (value_for_key principal_id_type_of_yojson "GranteePrincipal") _list path;
     grantee_service_principal =
       option_of_yojson
         (value_for_key service_principal_type_of_yojson "GranteeServicePrincipal")
         _list path;
   }
    : list_grants_request)

let policy_name_list_of_yojson tree path = list_of_yojson policy_name_type_of_yojson tree path

let list_key_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_names =
       option_of_yojson (value_for_key policy_name_list_of_yojson "PolicyNames") _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : list_key_policies_response)

let list_key_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
   }
    : list_key_policies_request)

let rotation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String value -> raise (deserialize_unknown_enum_value_error path "RotationType" value)
    | _ -> raise (deserialize_wrong_type_error path "RotationType")
     : rotation_type)
    : rotation_type)

let rotations_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     key_material_id =
       option_of_yojson (value_for_key backing_key_id_type_of_yojson "KeyMaterialId") _list path;
     key_material_description =
       option_of_yojson
         (value_for_key key_material_description_type_of_yojson "KeyMaterialDescription")
         _list path;
     import_state = option_of_yojson (value_for_key import_state_of_yojson "ImportState") _list path;
     key_material_state =
       option_of_yojson (value_for_key key_material_state_of_yojson "KeyMaterialState") _list path;
     expiration_model =
       option_of_yojson (value_for_key expiration_model_type_of_yojson "ExpirationModel") _list path;
     valid_to = option_of_yojson (value_for_key date_type_of_yojson "ValidTo") _list path;
     rotation_date = option_of_yojson (value_for_key date_type_of_yojson "RotationDate") _list path;
     rotation_type =
       option_of_yojson (value_for_key rotation_type_of_yojson "RotationType") _list path;
   }
    : rotations_list_entry)

let rotations_list_of_yojson tree path = list_of_yojson rotations_list_entry_of_yojson tree path

let list_key_rotations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rotations = option_of_yojson (value_for_key rotations_list_of_yojson "Rotations") _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : list_key_rotations_response)

let list_key_rotations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     include_key_material =
       option_of_yojson
         (value_for_key include_key_material_of_yojson "IncludeKeyMaterial")
         _list path;
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
   }
    : list_key_rotations_request)

let list_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keys = option_of_yojson (value_for_key key_list_of_yojson "Keys") _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : list_keys_response)

let list_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
   }
    : list_keys_request)

let list_resource_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_marker = option_of_yojson (value_for_key marker_type_of_yojson "NextMarker") _list path;
     truncated = option_of_yojson (value_for_key boolean_type_of_yojson "Truncated") _list path;
   }
    : list_resource_tags_response)

let list_resource_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
   }
    : list_resource_tags_request)

let list_retirable_grants_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key limit_type_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_type_of_yojson "Marker") _list path;
     retiring_principal =
       option_of_yojson (value_for_key principal_id_type_of_yojson "RetiringPrincipal") _list path;
     retiring_service_principal =
       option_of_yojson
         (value_for_key service_principal_type_of_yojson "RetiringServicePrincipal")
         _list path;
   }
    : list_retirable_grants_request)

let message_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RAW" -> RAW
    | `String "DIGEST" -> DIGEST
    | `String "EXTERNAL_MU" -> EXTERNAL_MU
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageType" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageType")
     : message_type)
    : message_type)

let put_key_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     policy_name =
       option_of_yojson (value_for_key policy_name_type_of_yojson "PolicyName") _list path;
     policy = value_for_key policy_type_of_yojson "Policy" _list path;
     bypass_policy_lockout_safety_check =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "BypassPolicyLockoutSafetyCheck")
         _list path;
   }
    : put_key_policy_request)

let re_encrypt_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext_blob =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "CiphertextBlob") _list path;
     source_key_id = option_of_yojson (value_for_key key_id_type_of_yojson "SourceKeyId") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     source_encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "SourceEncryptionAlgorithm")
         _list path;
     destination_encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "DestinationEncryptionAlgorithm")
         _list path;
     source_key_material_id =
       option_of_yojson
         (value_for_key backing_key_id_type_of_yojson "SourceKeyMaterialId")
         _list path;
     destination_key_material_id =
       option_of_yojson
         (value_for_key backing_key_id_type_of_yojson "DestinationKeyMaterialId")
         _list path;
   }
    : re_encrypt_response)

let re_encrypt_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ciphertext_blob =
       option_of_yojson (value_for_key ciphertext_type_of_yojson "CiphertextBlob") _list path;
     source_encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "SourceEncryptionContext")
         _list path;
     source_key_id = option_of_yojson (value_for_key key_id_type_of_yojson "SourceKeyId") _list path;
     destination_key_id = value_for_key key_id_type_of_yojson "DestinationKeyId" _list path;
     destination_encryption_context =
       option_of_yojson
         (value_for_key encryption_context_type_of_yojson "DestinationEncryptionContext")
         _list path;
     source_encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "SourceEncryptionAlgorithm")
         _list path;
     destination_encryption_algorithm =
       option_of_yojson
         (value_for_key encryption_algorithm_spec_of_yojson "DestinationEncryptionAlgorithm")
         _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
     dry_run_modifiers =
       option_of_yojson (value_for_key dry_run_modifier_list_of_yojson "DryRunModifiers") _list path;
   }
    : re_encrypt_request)

let replicate_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_key_metadata =
       option_of_yojson (value_for_key key_metadata_of_yojson "ReplicaKeyMetadata") _list path;
     replica_policy =
       option_of_yojson (value_for_key policy_type_of_yojson "ReplicaPolicy") _list path;
     replica_tags = option_of_yojson (value_for_key tag_list_of_yojson "ReplicaTags") _list path;
   }
    : replicate_key_response)

let replicate_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     replica_region = value_for_key region_type_of_yojson "ReplicaRegion" _list path;
     policy = option_of_yojson (value_for_key policy_type_of_yojson "Policy") _list path;
     bypass_policy_lockout_safety_check =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "BypassPolicyLockoutSafetyCheck")
         _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : replicate_key_request)

let retire_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant_token =
       option_of_yojson (value_for_key grant_token_type_of_yojson "GrantToken") _list path;
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     grant_id = option_of_yojson (value_for_key grant_id_type_of_yojson "GrantId") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : retire_grant_request)

let revoke_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     grant_id = value_for_key grant_id_type_of_yojson "GrantId" _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : revoke_grant_request)

let rotate_key_on_demand_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path }
    : rotate_key_on_demand_response)

let rotate_key_on_demand_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_id = value_for_key key_id_type_of_yojson "KeyId" _list path }
    : rotate_key_on_demand_request)

let schedule_key_deletion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     deletion_date = option_of_yojson (value_for_key date_type_of_yojson "DeletionDate") _list path;
     key_state = option_of_yojson (value_for_key key_state_of_yojson "KeyState") _list path;
     pending_window_in_days =
       option_of_yojson
         (value_for_key pending_window_in_days_type_of_yojson "PendingWindowInDays")
         _list path;
   }
    : schedule_key_deletion_response)

let schedule_key_deletion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     pending_window_in_days =
       option_of_yojson
         (value_for_key pending_window_in_days_type_of_yojson "PendingWindowInDays")
         _list path;
   }
    : schedule_key_deletion_request)

let sign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     signature = option_of_yojson (value_for_key ciphertext_type_of_yojson "Signature") _list path;
     signing_algorithm =
       option_of_yojson
         (value_for_key signing_algorithm_spec_of_yojson "SigningAlgorithm")
         _list path;
   }
    : sign_response)

let sign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     message = value_for_key plaintext_type_of_yojson "Message" _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     signing_algorithm =
       value_for_key signing_algorithm_spec_of_yojson "SigningAlgorithm" _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : sign_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_type_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let verify_mac_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     mac_valid = option_of_yojson (value_for_key boolean_type_of_yojson "MacValid") _list path;
     mac_algorithm =
       option_of_yojson (value_for_key mac_algorithm_spec_of_yojson "MacAlgorithm") _list path;
   }
    : verify_mac_response)

let verify_mac_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key plaintext_type_of_yojson "Message" _list path;
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     mac_algorithm = value_for_key mac_algorithm_spec_of_yojson "MacAlgorithm" _list path;
     mac = value_for_key ciphertext_type_of_yojson "Mac" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : verify_mac_request)

let verify_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = option_of_yojson (value_for_key key_id_type_of_yojson "KeyId") _list path;
     signature_valid =
       option_of_yojson (value_for_key boolean_type_of_yojson "SignatureValid") _list path;
     signing_algorithm =
       option_of_yojson
         (value_for_key signing_algorithm_spec_of_yojson "SigningAlgorithm")
         _list path;
   }
    : verify_response)

let verify_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     message = value_for_key plaintext_type_of_yojson "Message" _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     signature = value_for_key ciphertext_type_of_yojson "Signature" _list path;
     signing_algorithm =
       value_for_key signing_algorithm_spec_of_yojson "SigningAlgorithm" _list path;
     grant_tokens =
       option_of_yojson (value_for_key grant_token_list_of_yojson "GrantTokens") _list path;
     dry_run = option_of_yojson (value_for_key nullable_boolean_type_of_yojson "DryRun") _list path;
   }
    : verify_request)

let update_primary_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     primary_region = value_for_key region_type_of_yojson "PrimaryRegion" _list path;
   }
    : update_primary_region_request)

let update_key_description_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     description = value_for_key description_type_of_yojson "Description" _list path;
   }
    : update_key_description_request)

let update_custom_key_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_custom_key_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_key_store_id =
       value_for_key custom_key_store_id_type_of_yojson "CustomKeyStoreId" _list path;
     new_custom_key_store_name =
       option_of_yojson
         (value_for_key custom_key_store_name_type_of_yojson "NewCustomKeyStoreName")
         _list path;
     key_store_password =
       option_of_yojson
         (value_for_key key_store_password_type_of_yojson "KeyStorePassword")
         _list path;
     cloud_hsm_cluster_id =
       option_of_yojson
         (value_for_key cloud_hsm_cluster_id_type_of_yojson "CloudHsmClusterId")
         _list path;
     xks_proxy_uri_endpoint =
       option_of_yojson
         (value_for_key xks_proxy_uri_endpoint_type_of_yojson "XksProxyUriEndpoint")
         _list path;
     xks_proxy_uri_path =
       option_of_yojson
         (value_for_key xks_proxy_uri_path_type_of_yojson "XksProxyUriPath")
         _list path;
     xks_proxy_vpc_endpoint_service_name =
       option_of_yojson
         (value_for_key xks_proxy_vpc_endpoint_service_name_type_of_yojson
            "XksProxyVpcEndpointServiceName")
         _list path;
     xks_proxy_vpc_endpoint_service_owner =
       option_of_yojson
         (value_for_key account_id_type_of_yojson "XksProxyVpcEndpointServiceOwner")
         _list path;
     xks_proxy_authentication_credential =
       option_of_yojson
         (value_for_key xks_proxy_authentication_credential_type_of_yojson
            "XksProxyAuthenticationCredential")
         _list path;
     xks_proxy_connectivity =
       option_of_yojson
         (value_for_key xks_proxy_connectivity_type_of_yojson "XksProxyConnectivity")
         _list path;
   }
    : update_custom_key_store_request)

let update_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias_name = value_for_key alias_name_type_of_yojson "AliasName" _list path;
     target_key_id = value_for_key key_id_type_of_yojson "TargetKeyId" _list path;
   }
    : update_alias_request)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id = value_for_key key_id_type_of_yojson "KeyId" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)
