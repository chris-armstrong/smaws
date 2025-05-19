open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec xks_proxy_vpc_endpoint_service_not_found_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because KMS could not find the specified VPC endpoint service. Use [DescribeCustomKeyStores] to verify the VPC endpoint service name for the external key store. Also, confirm that the [Allow principals] list for the VPC endpoint service includes the KMS service principal for the Region, such as [cks.kms.us-east-1.amazonaws.com].\n"]
type nonrec xks_proxy_vpc_endpoint_service_invalid_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the requirements for an external key store. To identify the cause, see the error message that accompanies the exception and {{:https://docs.aws.amazon.com/kms/latest/developerguide/vpc-connectivity.html#xks-vpc-requirements}review the requirements} for Amazon VPC endpoint service connectivity for an external key store.\n"]
type nonrec xks_proxy_vpc_endpoint_service_in_use_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified Amazon VPC endpoint service is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a different Amazon VPC endpoint service.\n"]
type nonrec xks_proxy_uri_unreachable_exception = {
  message: string option }[@@ocaml.doc
                            "KMS was unable to reach the specified [XksProxyUriPath]. The path must be reachable before you create the external key store or update its settings.\n\n This exception is also thrown when the external key store proxy response to a [GetHealthStatus] request indicates that all external key manager instances are unavailable.\n "]
type nonrec xks_proxy_uri_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the concatenation of the [XksProxyUriEndpoint] and [XksProxyUriPath] is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a unique external key store proxy API address.\n"]
type nonrec xks_proxy_uri_endpoint_in_use_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the [XksProxyUriEndpoint] is already associated with another external key store in this Amazon Web Services Region. To identify the cause, see the error message that accompanies the exception. \n"]
type nonrec xks_proxy_invalid_response_exception = {
  message: string option }[@@ocaml.doc
                            "\n\n KMS cannot interpret the response it received from the external key store proxy. The problem might be a poorly constructed response, but it could also be a transient network issue. If you see this error repeatedly, report it to the proxy vendor.\n "]
type nonrec xks_proxy_invalid_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the external key store proxy is not configured correctly. To identify the cause, see the error message that accompanies the exception.\n"]
type nonrec xks_proxy_incorrect_authentication_credential_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the proxy credentials failed to authenticate to the specified external key store proxy. The specified external key store proxy rejected a status request from KMS due to invalid credentials. This can indicate an error in the credentials or in the identification of the external key store proxy.\n"]
type nonrec xks_proxy_connectivity_type =
  | VPC_ENDPOINT_SERVICE 
  | PUBLIC_ENDPOINT [@@ocaml.doc ""]
type nonrec xks_proxy_configuration_type =
  {
  vpc_endpoint_service_name: string option ;
  uri_path: string option ;
  uri_endpoint: string option ;
  access_key_id: string option ;
  connectivity: xks_proxy_connectivity_type option }[@@ocaml.doc
                                                      "Detailed information about the external key store proxy (XKS proxy). Your external key store proxy translates KMS requests into a format that your external key manager can understand. These fields appear in a [DescribeCustomKeyStores] response only when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE].\n"]
type nonrec xks_proxy_authentication_credential_type =
  {
  raw_secret_access_key: string ;
  access_key_id: string }[@@ocaml.doc
                           "KMS uses the authentication credential to sign requests that it sends to the external key store proxy (XKS proxy) on your behalf. You establish these credentials on your external key store proxy and report them to KMS.\n\n The [XksProxyAuthenticationCredential] includes two required elements.\n "]
type nonrec xks_key_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the external key store proxy could not find the external key. This exception is thrown when the value of the [XksKeyId] parameter doesn't identify a key in the external key manager associated with the external key proxy.\n\n Verify that the [XksKeyId] represents an existing key in the external key manager. Use the key identifier that the external key store proxy uses to identify the key. For details, see the documentation provided with your external key store proxy or key manager.\n "]
type nonrec xks_key_invalid_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the external key specified by the [XksKeyId] parameter did not meet the configuration requirements for an external key store.\n\n The external key must be an AES-256 symmetric key that is enabled and performs encryption and decryption.\n "]
type nonrec xks_key_configuration_type = {
  id: string option }[@@ocaml.doc
                       "Information about the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key }that is associated with a KMS key in an external key store. \n\n This element appears in a [CreateKey] or [DescribeKey] response only for a KMS key in an external key store.\n \n  The {i external key} is a symmetric encryption key that is hosted by an external key manager outside of Amazon Web Services. When you use the KMS key in an external key store in a cryptographic operation, the cryptographic operation is performed in the external key manager using the specified external key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.\n  "]
type nonrec xks_key_already_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the ([XksKeyId]) is already associated with another KMS key in this external key store. Each KMS key in an external key store must be associated with a different external key.\n"]
type nonrec wrapping_key_spec =
  | SM2 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 [@@ocaml.doc ""]
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
  | RSASSA_PSS_SHA_256 [@@ocaml.doc ""]
type nonrec verify_response =
  {
  signing_algorithm: signing_algorithm_spec option ;
  signature_valid: bool option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec message_type =
  | DIGEST 
  | RAW [@@ocaml.doc ""]
type nonrec verify_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  signing_algorithm: signing_algorithm_spec ;
  signature: bytes ;
  message_type: message_type option ;
  message: bytes ;
  key_id: string }[@@ocaml.doc ""]
type nonrec mac_algorithm_spec =
  | HMAC_SHA_512 
  | HMAC_SHA_384 
  | HMAC_SHA_256 
  | HMAC_SHA_224 [@@ocaml.doc ""]
type nonrec verify_mac_response =
  {
  mac_algorithm: mac_algorithm_spec option ;
  mac_valid: bool option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec verify_mac_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  mac: bytes ;
  mac_algorithm: mac_algorithm_spec ;
  key_id: string ;
  message: bytes }[@@ocaml.doc ""]
type nonrec not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified entity or resource could not be found.\n"]
type nonrec kms_invalid_state_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the state of the specified resource is not valid for this request.\n\n This exceptions means one of the following:\n \n  {ul\n        {-  The key state of the KMS key is not compatible with the operation. \n            \n             To find the key state, use the [DescribeKey] operation. For more information about which key states are compatible with each KMS operation, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i  {i Key Management Service Developer Guide} }.\n             \n              }\n        {-  For cryptographic operations on KMS keys in custom key stores, this exception represents a general failure with many possible causes. To identify the cause, see the error message that accompanies the exception.\n            \n             }\n        }\n  "]
type nonrec kms_invalid_mac_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the HMAC verification failed. HMAC verification fails when the HMAC computed by using the specified message, HMAC KMS key, and MAC algorithm does not match the HMAC specified in the request.\n"]
type nonrec kms_internal_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because an internal exception occurred. The request can be retried.\n"]
type nonrec key_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified KMS key was not available. You can retry the request.\n"]
type nonrec invalid_key_usage_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected for one of the following reasons: \n\n {ul\n       {-  The [KeyUsage] value of the KMS key is incompatible with the API operation.\n           \n            }\n       {-  The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key [(KeySpec]).\n           \n            }\n       }\n   For encrypting, decrypting, re-encrypting, and generating data keys, the [KeyUsage] must be [ENCRYPT_DECRYPT]. For signing and verifying messages, the [KeyUsage] must be [SIGN_VERIFY]. For generating and verifying message authentication codes (MACs), the [KeyUsage] must be [GENERATE_VERIFY_MAC]. For deriving key agreement secrets, the [KeyUsage] must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n   \n    To find the encryption or signing algorithms supported for a particular KMS key, use the [DescribeKey] operation.\n    "]
type nonrec invalid_grant_token_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified grant token is not valid.\n"]
type nonrec dry_run_operation_exception = {
  message: string option }[@@ocaml.doc
                            " The request was rejected because the DryRun parameter was specified. \n"]
type nonrec disabled_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified KMS key is not enabled.\n"]
type nonrec kms_invalid_signature_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the signature verification failed. Signature verification fails when it cannot confirm that signature was produced by signing the specified message with the specified KMS key and signing algorithm.\n"]
type nonrec dependency_timeout_exception = {
  message: string option }[@@ocaml.doc
                            "The system timed out while trying to fulfill the request. You can retry the request.\n"]
type nonrec update_primary_region_request =
  {
  primary_region: string ;
  key_id: string }[@@ocaml.doc ""]
type nonrec unsupported_operation_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.\n"]
type nonrec invalid_arn_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because a specified ARN, or an ARN in a key policy, is not valid.\n"]
type nonrec update_key_description_request =
  {
  description: string ;
  key_id: string }[@@ocaml.doc ""]
type nonrec update_custom_key_store_response = unit
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
  custom_key_store_id: string }[@@ocaml.doc ""]
type nonrec custom_key_store_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because KMS cannot find a custom key store with the specified key store name or ID.\n"]
type nonrec custom_key_store_name_in_use_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified custom key store name is already assigned to another custom key store in the account. Try again with a custom key store name that is unique in the account.\n"]
type nonrec custom_key_store_invalid_state_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because of the [ConnectionState] of the custom key store. To get the [ConnectionState] of a custom key store, use the [DescribeCustomKeyStores] operation.\n\n This exception is thrown under the following conditions:\n \n  {ul\n        {-  You requested the [ConnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [FAILED]. This operation is valid for all other [ConnectionState] values. To reconnect a custom key store in a [FAILED] state, disconnect it ([DisconnectCustomKeyStore]), then connect it ([ConnectCustomKeyStore]).\n            \n             }\n        {-  You requested the [CreateKey] operation in a custom key store that is not connected. This operations is valid only when the custom key store [ConnectionState] is [CONNECTED].\n            \n             }\n        {-  You requested the [DisconnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [DISCONNECTED]. This operation is valid for all other [ConnectionState] values.\n            \n             }\n        {-  You requested the [UpdateCustomKeyStore] or [DeleteCustomKeyStore] operation on a custom key store that is not disconnected. This operation is valid only when the custom key store [ConnectionState] is [DISCONNECTED].\n            \n             }\n        {-  You requested the [GenerateRandom] operation in an CloudHSM key store that is not connected. This operation is valid only when the CloudHSM key store [ConnectionState] is [CONNECTED]. \n            \n             }\n        }\n  "]
type nonrec cloud_hsm_cluster_not_related_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified CloudHSM cluster has a different cluster certificate than the original cluster. You cannot use the operation to specify an unrelated cluster for an CloudHSM key store.\n\n Specify an CloudHSM cluster that shares a backup history with the original cluster. This includes clusters that were created from a backup of the current cluster, and clusters that were created from the same backup that produced the current cluster.\n \n  CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n  "]
type nonrec cloud_hsm_cluster_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because KMS cannot find the CloudHSM cluster with the specified cluster ID. Retry the request with a different cluster ID.\n"]
type nonrec cloud_hsm_cluster_not_active_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the CloudHSM cluster associated with the CloudHSM key store is not active. Initialize and activate the cluster and try the command again. For detailed instructions, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/getting-started.html}Getting Started} in the {i CloudHSM User Guide}.\n"]
type nonrec cloud_hsm_cluster_invalid_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the associated CloudHSM cluster did not meet the configuration requirements for an CloudHSM key store.\n\n {ul\n       {-  The CloudHSM cluster must be configured with private subnets in at least two different Availability Zones in the Region.\n           \n            }\n       {-  The {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}security group for the cluster} (cloudhsm-cluster-{i }-sg) must include inbound rules and outbound rules that allow TCP traffic on ports 2223-2225. The {b Source} in the inbound rules and the {b Destination} in the outbound rules must match the security group ID. These rules are set by default when you create the CloudHSM cluster. Do not delete or change them. To get information about a particular security group, use the {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html}DescribeSecurityGroups} operation.\n           \n            }\n       {-  The CloudHSM cluster must contain at least as many HSMs as the operation requires. To add HSMs, use the CloudHSM {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html}CreateHsm} operation.\n           \n            For the [CreateCustomKeyStore], [UpdateCustomKeyStore], and [CreateKey] operations, the CloudHSM cluster must have at least two active HSMs, each in a different Availability Zone. For the [ConnectCustomKeyStore] operation, the CloudHSM must contain at least one active HSM.\n            \n             }\n       }\n   For information about the requirements for an CloudHSM cluster that is associated with an CloudHSM key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}Assemble the Prerequisites} in the {i Key Management Service Developer Guide}. For information about creating a private subnet for an CloudHSM cluster, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/create-subnets.html}Create a Private Subnet} in the {i CloudHSM User Guide}. For information about cluster security groups, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}Configure a Default Security Group} in the {i  {i CloudHSM User Guide} }. \n   "]
type nonrec update_alias_request =
  {
  target_key_id: string ;
  alias_name: string }[@@ocaml.doc ""]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because a quota was exceeded. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html}Quotas} in the {i Key Management Service Developer Guide}.\n"]
type nonrec untag_resource_request = {
  tag_keys: string list ;
  key_id: string }[@@ocaml.doc ""]
type nonrec tag_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because one or more tags are not valid.\n"]
type nonrec tag = {
  tag_value: string ;
  tag_key: string }[@@ocaml.doc
                     "A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    For information about the rules that apply to tag keys and tag values, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html}User-Defined Tag Restrictions} in the {i Amazon Web Services Billing and Cost Management User Guide}.\n    "]
type nonrec tag_resource_request = {
  tags: tag list ;
  key_id: string }[@@ocaml.doc ""]
type nonrec sign_response =
  {
  signing_algorithm: signing_algorithm_spec option ;
  signature: bytes option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec sign_request =
  {
  dry_run: bool option ;
  signing_algorithm: signing_algorithm_spec ;
  grant_tokens: string list option ;
  message_type: message_type option ;
  message: bytes ;
  key_id: string }[@@ocaml.doc ""]
type nonrec key_state =
  | Updating 
  | Unavailable 
  | PendingReplicaDeletion 
  | PendingImport 
  | PendingDeletion 
  | Disabled 
  | Enabled 
  | Creating [@@ocaml.doc ""]
type nonrec schedule_key_deletion_response =
  {
  pending_window_in_days: int option ;
  key_state: key_state option ;
  deletion_date: CoreTypes.Timestamp.t option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec schedule_key_deletion_request =
  {
  pending_window_in_days: int option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because an automatic rotation of this key is currently in progress or scheduled to begin within the next 20 minutes. \n"]
type nonrec rotate_key_on_demand_response = {
  key_id: string option }[@@ocaml.doc ""]
type nonrec rotate_key_on_demand_request = {
  key_id: string }[@@ocaml.doc ""]
type nonrec invalid_grant_id_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified [GrantId] is not valid.\n"]
type nonrec revoke_grant_request =
  {
  dry_run: bool option ;
  grant_id: string ;
  key_id: string }[@@ocaml.doc ""]
type nonrec retire_grant_request =
  {
  dry_run: bool option ;
  grant_id: string option ;
  key_id: string option ;
  grant_token: string option }[@@ocaml.doc ""]
type nonrec malformed_policy_document_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified policy is not syntactically or semantically correct.\n"]
type nonrec already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because it attempted to create a resource that already exists.\n"]
type nonrec key_usage_type =
  | KEY_AGREEMENT 
  | GENERATE_VERIFY_MAC 
  | ENCRYPT_DECRYPT 
  | SIGN_VERIFY [@@ocaml.doc ""]
type nonrec origin_type =
  | EXTERNAL_KEY_STORE 
  | AWS_CLOUDHSM 
  | EXTERNAL 
  | AWS_KMS [@@ocaml.doc ""]
type nonrec expiration_model_type =
  | KEY_MATERIAL_DOES_NOT_EXPIRE 
  | KEY_MATERIAL_EXPIRES [@@ocaml.doc ""]
type nonrec key_manager_type =
  | CUSTOMER 
  | AWS [@@ocaml.doc ""]
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
  | RSA_2048 [@@ocaml.doc ""]
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
  | RSA_2048 [@@ocaml.doc ""]
type nonrec encryption_algorithm_spec =
  | SM2PKE 
  | RSAES_OAEP_SHA_256 
  | RSAES_OAEP_SHA_1 
  | SYMMETRIC_DEFAULT [@@ocaml.doc ""]
type nonrec key_agreement_algorithm_spec =
  | ECDH [@@ocaml.doc ""]
type nonrec multi_region_key_type =
  | REPLICA 
  | PRIMARY [@@ocaml.doc ""]
type nonrec multi_region_key = {
  region: string option ;
  arn: string option }[@@ocaml.doc
                        "Describes the primary or replica key in a multi-Region key.\n"]
type nonrec multi_region_configuration =
  {
  replica_keys: multi_region_key list option ;
  primary_key: multi_region_key option ;
  multi_region_key_type: multi_region_key_type option }[@@ocaml.doc
                                                         "Describes the configuration of this multi-Region key. This field appears only when the KMS key is a primary or replica of a multi-Region key.\n\n For more information about any listed KMS key, use the [DescribeKey] operation.\n "]
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
  valid_to: CoreTypes.Timestamp.t option ;
  deletion_date: CoreTypes.Timestamp.t option ;
  key_state: key_state option ;
  key_usage: key_usage_type option ;
  description: string option ;
  enabled: bool option ;
  creation_date: CoreTypes.Timestamp.t option ;
  arn: string option ;
  key_id: string ;
  aws_account_id: string option }[@@ocaml.doc
                                   "Contains metadata about a KMS key.\n\n This data type is used as a response element for the [CreateKey], [DescribeKey], and [ReplicateKey] operations.\n "]
type nonrec replicate_key_response =
  {
  replica_tags: tag list option ;
  replica_policy: string option ;
  replica_key_metadata: key_metadata option }[@@ocaml.doc ""]
type nonrec replicate_key_request =
  {
  tags: tag list option ;
  description: string option ;
  bypass_policy_lockout_safety_check: bool option ;
  policy: string option ;
  replica_region: string ;
  key_id: string }[@@ocaml.doc ""]
type nonrec invalid_ciphertext_exception = {
  message: string option }[@@ocaml.doc
                            "From the [Decrypt] or [ReEncrypt] operation, the request was rejected because the specified ciphertext, or additional authenticated data incorporated into the ciphertext, such as the encryption context, is corrupted, missing, or otherwise invalid.\n\n From the [ImportKeyMaterial] operation, the request was rejected because KMS could not decrypt the encrypted (wrapped) key material. \n "]
type nonrec incorrect_key_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified KMS key cannot decrypt the data. The [KeyId] in a [Decrypt] request and the [SourceKeyId] in a [ReEncrypt] request must identify the same KMS key that was used to encrypt the ciphertext.\n"]
type nonrec re_encrypt_response =
  {
  destination_encryption_algorithm: encryption_algorithm_spec option ;
  source_encryption_algorithm: encryption_algorithm_spec option ;
  key_id: string option ;
  source_key_id: string option ;
  ciphertext_blob: bytes option }[@@ocaml.doc ""]
type nonrec encryption_context_type = (string * string) list[@@ocaml.doc ""]
type nonrec re_encrypt_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  destination_encryption_algorithm: encryption_algorithm_spec option ;
  source_encryption_algorithm: encryption_algorithm_spec option ;
  destination_encryption_context: encryption_context_type option ;
  destination_key_id: string ;
  source_key_id: string option ;
  source_encryption_context: encryption_context_type option ;
  ciphertext_blob: bytes }[@@ocaml.doc ""]
type nonrec put_key_policy_request =
  {
  bypass_policy_lockout_safety_check: bool option ;
  policy: string ;
  policy_name: string option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec invalid_marker_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the marker that specifies where pagination should next begin is not valid.\n"]
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
  | Decrypt [@@ocaml.doc ""]
type nonrec grant_constraints =
  {
  encryption_context_equals: encryption_context_type option ;
  encryption_context_subset: encryption_context_type option }[@@ocaml.doc
                                                               "Use this structure to allow {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} in the grant only when the operation request includes the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}encryption context}. \n\n KMS applies the grant constraints only to cryptographic operations that support an encryption context, that is, all cryptographic operations with a {{:https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks}symmetric KMS key}. Grant constraints are not applied to operations that do not support an encryption context, such as cryptographic operations with asymmetric KMS keys and management operations, such as [DescribeKey] or [RetireGrant].\n \n   In a cryptographic operation, the encryption context in the decryption operation must be an exact, case-sensitive match for the keys and values in the encryption context of the encryption operation. Only the order of the pairs can vary.\n   \n    However, in a grant constraint, the key in each key-value pair is not case sensitive, but the value is case sensitive.\n    \n     To avoid confusion, do not use multiple encryption context pairs that differ only by case. To require a fully case-sensitive encryption context, use the [kms:EncryptionContext:] and [kms:EncryptionContextKeys] conditions in an IAM or key policy. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context}kms:EncryptionContext:} in the {i  {i Key Management Service Developer Guide} }.\n     \n      "]
type nonrec grant_list_entry =
  {
  constraints: grant_constraints option ;
  operations: grant_operation list option ;
  issuing_account: string option ;
  retiring_principal: string option ;
  grantee_principal: string option ;
  creation_date: CoreTypes.Timestamp.t option ;
  name: string option ;
  grant_id: string option ;
  key_id: string option }[@@ocaml.doc
                           "Contains information about a grant.\n"]
type nonrec list_grants_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  grants: grant_list_entry list option }[@@ocaml.doc ""]
type nonrec list_retirable_grants_request =
  {
  retiring_principal: string ;
  marker: string option ;
  limit: int option }[@@ocaml.doc ""]
type nonrec list_resource_tags_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_resource_tags_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec key_list_entry = {
  key_arn: string option ;
  key_id: string option }[@@ocaml.doc
                           "Contains information about each entry in the key list.\n"]
type nonrec list_keys_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  keys: key_list_entry list option }[@@ocaml.doc ""]
type nonrec list_keys_request = {
  marker: string option ;
  limit: int option }[@@ocaml.doc ""]
type nonrec rotation_type =
  | ON_DEMAND 
  | AUTOMATIC [@@ocaml.doc ""]
type nonrec rotations_list_entry =
  {
  rotation_type: rotation_type option ;
  rotation_date: CoreTypes.Timestamp.t option ;
  key_id: string option }[@@ocaml.doc
                           "Contains information about completed key material rotations.\n"]
type nonrec list_key_rotations_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  rotations: rotations_list_entry list option }[@@ocaml.doc ""]
type nonrec list_key_rotations_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec list_key_policies_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  policy_names: string list option }[@@ocaml.doc ""]
type nonrec list_key_policies_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec list_grants_request =
  {
  grantee_principal: string option ;
  grant_id: string option ;
  key_id: string ;
  marker: string option ;
  limit: int option }[@@ocaml.doc ""]
type nonrec alias_list_entry =
  {
  last_updated_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t option ;
  target_key_id: string option ;
  alias_arn: string option ;
  alias_name: string option }[@@ocaml.doc
                               "Contains information about an alias.\n"]
type nonrec list_aliases_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  aliases: alias_list_entry list option }[@@ocaml.doc ""]
type nonrec list_aliases_request =
  {
  marker: string option ;
  limit: int option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec invalid_import_token_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the provided import token is invalid or is associated with a different KMS key.\n"]
type nonrec incorrect_key_material_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the key material in the request is, expired, invalid, or is not the same key material that was previously imported into this KMS key.\n"]
type nonrec expired_import_token_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified import token is expired. Use [GetParametersForImport] to get a new import token and public key, use the new public key to encrypt the key material, and then try the request again.\n"]
type nonrec import_key_material_response = unit
type nonrec import_key_material_request =
  {
  expiration_model: expiration_model_type option ;
  valid_to: CoreTypes.Timestamp.t option ;
  encrypted_key_material: bytes ;
  import_token: bytes ;
  key_id: string }[@@ocaml.doc ""]
type nonrec get_public_key_response =
  {
  key_agreement_algorithms: key_agreement_algorithm_spec list option ;
  signing_algorithms: signing_algorithm_spec list option ;
  encryption_algorithms: encryption_algorithm_spec list option ;
  key_usage: key_usage_type option ;
  key_spec: key_spec option ;
  customer_master_key_spec: customer_master_key_spec option ;
  public_key: bytes option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec get_public_key_request =
  {
  grant_tokens: string list option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec get_parameters_for_import_response =
  {
  parameters_valid_to: CoreTypes.Timestamp.t option ;
  public_key: bytes option ;
  import_token: bytes option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec algorithm_spec =
  | SM2PKE 
  | RSA_AES_KEY_WRAP_SHA_256 
  | RSA_AES_KEY_WRAP_SHA_1 
  | RSAES_OAEP_SHA_256 
  | RSAES_OAEP_SHA_1 
  | RSAES_PKCS1_V1_5 [@@ocaml.doc ""]
type nonrec get_parameters_for_import_request =
  {
  wrapping_key_spec: wrapping_key_spec ;
  wrapping_algorithm: algorithm_spec ;
  key_id: string }[@@ocaml.doc ""]
type nonrec get_key_rotation_status_response =
  {
  on_demand_rotation_start_date: CoreTypes.Timestamp.t option ;
  next_rotation_date: CoreTypes.Timestamp.t option ;
  rotation_period_in_days: int option ;
  key_id: string option ;
  key_rotation_enabled: bool option }[@@ocaml.doc ""]
type nonrec get_key_rotation_status_request = {
  key_id: string }[@@ocaml.doc ""]
type nonrec get_key_policy_response =
  {
  policy_name: string option ;
  policy: string option }[@@ocaml.doc ""]
type nonrec get_key_policy_request =
  {
  policy_name: string option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec generate_random_response =
  {
  ciphertext_for_recipient: bytes option ;
  plaintext: bytes option }[@@ocaml.doc ""]
type nonrec key_encryption_mechanism =
  | RSAES_OAEP_SHA_256 [@@ocaml.doc ""]
type nonrec recipient_info =
  {
  attestation_document: bytes option ;
  key_encryption_algorithm: key_encryption_mechanism option }[@@ocaml.doc
                                                               "Contains information about the party that receives the response from the API operation.\n\n This data type is designed to support Amazon Web Services Nitro Enclaves, which lets you create an isolated compute environment in Amazon EC2. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "]
type nonrec generate_random_request =
  {
  recipient: recipient_info option ;
  custom_key_store_id: string option ;
  number_of_bytes: int option }[@@ocaml.doc ""]
type nonrec generate_mac_response =
  {
  key_id: string option ;
  mac_algorithm: mac_algorithm_spec option ;
  mac: bytes option }[@@ocaml.doc ""]
type nonrec generate_mac_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  mac_algorithm: mac_algorithm_spec ;
  key_id: string ;
  message: bytes }[@@ocaml.doc ""]
type nonrec generate_data_key_without_plaintext_response =
  {
  key_id: string option ;
  ciphertext_blob: bytes option }[@@ocaml.doc ""]
type nonrec data_key_spec =
  | AES_128 
  | AES_256 [@@ocaml.doc ""]
type nonrec generate_data_key_without_plaintext_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  number_of_bytes: int option ;
  key_spec: data_key_spec option ;
  encryption_context: encryption_context_type option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec data_key_pair_spec =
  | SM2 
  | ECC_SECG_P256K1 
  | ECC_NIST_P521 
  | ECC_NIST_P384 
  | ECC_NIST_P256 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 [@@ocaml.doc ""]
type nonrec generate_data_key_pair_without_plaintext_response =
  {
  key_pair_spec: data_key_pair_spec option ;
  key_id: string option ;
  public_key: bytes option ;
  private_key_ciphertext_blob: bytes option }[@@ocaml.doc ""]
type nonrec generate_data_key_pair_without_plaintext_request =
  {
  dry_run: bool option ;
  grant_tokens: string list option ;
  key_pair_spec: data_key_pair_spec ;
  key_id: string ;
  encryption_context: encryption_context_type option }[@@ocaml.doc ""]
type nonrec generate_data_key_pair_response =
  {
  ciphertext_for_recipient: bytes option ;
  key_pair_spec: data_key_pair_spec option ;
  key_id: string option ;
  public_key: bytes option ;
  private_key_plaintext: bytes option ;
  private_key_ciphertext_blob: bytes option }[@@ocaml.doc ""]
type nonrec generate_data_key_pair_request =
  {
  dry_run: bool option ;
  recipient: recipient_info option ;
  grant_tokens: string list option ;
  key_pair_spec: data_key_pair_spec ;
  key_id: string ;
  encryption_context: encryption_context_type option }[@@ocaml.doc ""]
type nonrec generate_data_key_response =
  {
  ciphertext_for_recipient: bytes option ;
  key_id: string option ;
  plaintext: bytes option ;
  ciphertext_blob: bytes option }[@@ocaml.doc ""]
type nonrec generate_data_key_request =
  {
  dry_run: bool option ;
  recipient: recipient_info option ;
  grant_tokens: string list option ;
  key_spec: data_key_spec option ;
  number_of_bytes: int option ;
  encryption_context: encryption_context_type option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec encrypt_response =
  {
  encryption_algorithm: encryption_algorithm_spec option ;
  key_id: string option ;
  ciphertext_blob: bytes option }[@@ocaml.doc ""]
type nonrec encrypt_request =
  {
  dry_run: bool option ;
  encryption_algorithm: encryption_algorithm_spec option ;
  grant_tokens: string list option ;
  encryption_context: encryption_context_type option ;
  plaintext: bytes ;
  key_id: string }[@@ocaml.doc ""]
type nonrec enable_key_rotation_request =
  {
  rotation_period_in_days: int option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec enable_key_request = {
  key_id: string }[@@ocaml.doc ""]
type nonrec disconnect_custom_key_store_response = unit
type nonrec disconnect_custom_key_store_request =
  {
  custom_key_store_id: string }[@@ocaml.doc ""]
type nonrec disable_key_rotation_request = {
  key_id: string }[@@ocaml.doc ""]
type nonrec disable_key_request = {
  key_id: string }[@@ocaml.doc ""]
type nonrec describe_key_response = {
  key_metadata: key_metadata option }[@@ocaml.doc ""]
type nonrec describe_key_request =
  {
  grant_tokens: string list option ;
  key_id: string }[@@ocaml.doc ""]
type nonrec connection_state_type =
  | DISCONNECTING 
  | DISCONNECTED 
  | FAILED 
  | CONNECTING 
  | CONNECTED [@@ocaml.doc ""]
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
  | INVALID_CREDENTIALS [@@ocaml.doc ""]
type nonrec custom_key_store_type =
  | EXTERNAL_KEY_STORE 
  | AWS_CLOUDHSM [@@ocaml.doc ""]
type nonrec custom_key_stores_list_entry =
  {
  xks_proxy_configuration: xks_proxy_configuration_type option ;
  custom_key_store_type: custom_key_store_type option ;
  creation_date: CoreTypes.Timestamp.t option ;
  connection_error_code: connection_error_code_type option ;
  connection_state: connection_state_type option ;
  trust_anchor_certificate: string option ;
  cloud_hsm_cluster_id: string option ;
  custom_key_store_name: string option ;
  custom_key_store_id: string option }[@@ocaml.doc
                                        "Contains information about each custom key store in the custom key store list.\n"]
type nonrec describe_custom_key_stores_response =
  {
  truncated: bool option ;
  next_marker: string option ;
  custom_key_stores: custom_key_stores_list_entry list option }[@@ocaml.doc
                                                                 ""]
type nonrec describe_custom_key_stores_request =
  {
  marker: string option ;
  limit: int option ;
  custom_key_store_name: string option ;
  custom_key_store_id: string option }[@@ocaml.doc ""]
type nonrec derive_shared_secret_response =
  {
  key_origin: origin_type option ;
  key_agreement_algorithm: key_agreement_algorithm_spec option ;
  ciphertext_for_recipient: bytes option ;
  shared_secret: bytes option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec derive_shared_secret_request =
  {
  recipient: recipient_info option ;
  dry_run: bool option ;
  grant_tokens: string list option ;
  public_key: bytes ;
  key_agreement_algorithm: key_agreement_algorithm_spec ;
  key_id: string }[@@ocaml.doc ""]
type nonrec delete_imported_key_material_request = {
  key_id: string }[@@ocaml.doc ""]
type nonrec custom_key_store_has_cm_ks_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the custom key store contains KMS keys. After verifying that you do not need to use the KMS keys, use the [ScheduleKeyDeletion] operation to delete the KMS keys. After they are deleted, you can delete the custom key store.\n"]
type nonrec delete_custom_key_store_response = unit
type nonrec delete_custom_key_store_request = {
  custom_key_store_id: string }[@@ocaml.doc ""]
type nonrec delete_alias_request = {
  alias_name: string }[@@ocaml.doc ""]
type nonrec decrypt_response =
  {
  ciphertext_for_recipient: bytes option ;
  encryption_algorithm: encryption_algorithm_spec option ;
  plaintext: bytes option ;
  key_id: string option }[@@ocaml.doc ""]
type nonrec decrypt_request =
  {
  dry_run: bool option ;
  recipient: recipient_info option ;
  encryption_algorithm: encryption_algorithm_spec option ;
  key_id: string option ;
  grant_tokens: string list option ;
  encryption_context: encryption_context_type option ;
  ciphertext_blob: bytes }[@@ocaml.doc ""]
type nonrec create_key_response = {
  key_metadata: key_metadata option }[@@ocaml.doc ""]
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
  policy: string option }[@@ocaml.doc ""]
type nonrec create_grant_response =
  {
  grant_id: string option ;
  grant_token: string option }[@@ocaml.doc ""]
type nonrec create_grant_request =
  {
  dry_run: bool option ;
  name: string option ;
  grant_tokens: string list option ;
  constraints: grant_constraints option ;
  operations: grant_operation list ;
  retiring_principal: string option ;
  grantee_principal: string ;
  key_id: string }[@@ocaml.doc ""]
type nonrec incorrect_trust_anchor_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the trust anchor certificate in the request to create an CloudHSM key store is not the trust anchor certificate for the specified CloudHSM cluster.\n\n When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the CloudHSM cluster}, you create the trust anchor certificate and save it in the [customerCA.crt] file.\n "]
type nonrec cloud_hsm_cluster_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified CloudHSM cluster is already associated with an CloudHSM key store in the account, or it shares a backup history with an CloudHSM key store in the account. Each CloudHSM key store in the account must be associated with a different CloudHSM cluster.\n\n CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n "]
type nonrec create_custom_key_store_response =
  {
  custom_key_store_id: string option }[@@ocaml.doc ""]
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
  custom_key_store_name: string }[@@ocaml.doc ""]
type nonrec invalid_alias_name_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified alias name is not valid.\n"]
type nonrec create_alias_request =
  {
  target_key_id: string ;
  alias_name: string }[@@ocaml.doc ""]
type nonrec connect_custom_key_store_response = unit
type nonrec connect_custom_key_store_request = {
  custom_key_store_id: string }[@@ocaml.doc ""]
type nonrec cancel_key_deletion_response = {
  key_id: string option }[@@ocaml.doc ""]
type nonrec cancel_key_deletion_request = {
  key_id: string }[@@ocaml.doc ""]