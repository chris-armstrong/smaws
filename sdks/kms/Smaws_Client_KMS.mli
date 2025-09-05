(** 
    KMS client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec error_message_type = string[@@ocaml.doc ""]
type nonrec xks_proxy_vpc_endpoint_service_not_found_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because KMS could not find the specified VPC endpoint service. Use [DescribeCustomKeyStores] to verify the VPC endpoint service name for the external key store. Also, confirm that the [Allow principals] list for the VPC endpoint service includes the KMS service principal for the Region, such as [cks.kms.us-east-1.amazonaws.com].\n"]
type nonrec xks_proxy_vpc_endpoint_service_name_type = string[@@ocaml.doc ""]
type nonrec xks_proxy_vpc_endpoint_service_invalid_configuration_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the requirements for an external key store. To identify the cause, see the error message that accompanies the exception and {{:https://docs.aws.amazon.com/kms/latest/developerguide/vpc-connectivity.html#xks-vpc-requirements}review the requirements} for Amazon VPC endpoint service connectivity for an external key store.\n"]
type nonrec xks_proxy_vpc_endpoint_service_in_use_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified Amazon VPC endpoint service is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a different Amazon VPC endpoint service.\n"]
type nonrec xks_proxy_uri_unreachable_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "KMS was unable to reach the specified [XksProxyUriPath]. The path must be reachable before you create the external key store or update its settings.\n\n This exception is also thrown when the external key store proxy response to a [GetHealthStatus] request indicates that all external key manager instances are unavailable.\n "]
type nonrec xks_proxy_uri_path_type = string[@@ocaml.doc ""]
type nonrec xks_proxy_uri_in_use_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the concatenation of the [XksProxyUriEndpoint] and [XksProxyUriPath] is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a unique external key store proxy API address.\n"]
type nonrec xks_proxy_uri_endpoint_type = string[@@ocaml.doc ""]
type nonrec xks_proxy_uri_endpoint_in_use_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the [XksProxyUriEndpoint] is already associated with another external key store in this Amazon Web Services Region. To identify the cause, see the error message that accompanies the exception. \n"]
type nonrec xks_proxy_invalid_response_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "\n\n KMS cannot interpret the response it received from the external key store proxy. The problem might be a poorly constructed response, but it could also be a transient network issue. If you see this error repeatedly, report it to the proxy vendor.\n "]
type nonrec xks_proxy_invalid_configuration_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the external key store proxy is not configured correctly. To identify the cause, see the error message that accompanies the exception.\n"]
type nonrec xks_proxy_incorrect_authentication_credential_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the proxy credentials failed to authenticate to the specified external key store proxy. The specified external key store proxy rejected a status request from KMS due to invalid credentials. This can indicate an error in the credentials or in the identification of the external key store proxy.\n"]
type nonrec xks_proxy_connectivity_type =
  | VPC_ENDPOINT_SERVICE [@ocaml.doc ""]
  | PUBLIC_ENDPOINT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec xks_proxy_authentication_access_key_id_type = string[@@ocaml.doc
                                                                  ""]
type nonrec xks_proxy_configuration_type =
  {
  vpc_endpoint_service_name: xks_proxy_vpc_endpoint_service_name_type option
    [@ocaml.doc
      "The Amazon VPC endpoint service used to communicate with the external key store proxy. This field appears only when the external key store proxy uses an Amazon VPC endpoint service to communicate with KMS.\n"];
  uri_path: xks_proxy_uri_path_type option
    [@ocaml.doc "The path to the external key store proxy APIs.\n"];
  uri_endpoint: xks_proxy_uri_endpoint_type option
    [@ocaml.doc
      "The URI endpoint for the external key store proxy.\n\n If the external key store proxy has a public endpoint, it is displayed here.\n \n  If the external key store proxy uses an Amazon VPC endpoint service name, this field displays the private DNS name associated with the VPC endpoint service.\n  "];
  access_key_id: xks_proxy_authentication_access_key_id_type option
    [@ocaml.doc
      "The part of the external key store {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateCustomKeyStore.html#KMS-CreateCustomKeyStore-request-XksProxyAuthenticationCredential}proxy authentication credential} that uniquely identifies the secret access key.\n"];
  connectivity: xks_proxy_connectivity_type option
    [@ocaml.doc
      "Indicates whether the external key store proxy uses a public endpoint or an Amazon VPC endpoint service to communicate with KMS.\n"]}
[@@ocaml.doc
  "Detailed information about the external key store proxy (XKS proxy). Your external key store proxy translates KMS requests into a format that your external key manager can understand. These fields appear in a [DescribeCustomKeyStores] response only when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE].\n"]
type nonrec xks_proxy_authentication_raw_secret_access_key_type = string
[@@ocaml.doc ""]
type nonrec xks_proxy_authentication_credential_type =
  {
  raw_secret_access_key: xks_proxy_authentication_raw_secret_access_key_type
    [@ocaml.doc
      "A secret string of 43-64 characters. Valid characters are a-z, A-Z, 0-9, /, +, and =.\n"];
  access_key_id: xks_proxy_authentication_access_key_id_type
    [@ocaml.doc "A unique identifier for the raw secret access key.\n"]}
[@@ocaml.doc
  "KMS uses the authentication credential to sign requests that it sends to the external key store proxy (XKS proxy) on your behalf. You establish these credentials on your external key store proxy and report them to KMS.\n\n The [XksProxyAuthenticationCredential] includes two required elements.\n "]
type nonrec xks_key_not_found_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the external key store proxy could not find the external key. This exception is thrown when the value of the [XksKeyId] parameter doesn't identify a key in the external key manager associated with the external key proxy.\n\n Verify that the [XksKeyId] represents an existing key in the external key manager. Use the key identifier that the external key store proxy uses to identify the key. For details, see the documentation provided with your external key store proxy or key manager.\n "]
type nonrec xks_key_invalid_configuration_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the external key specified by the [XksKeyId] parameter did not meet the configuration requirements for an external key store.\n\n The external key must be an AES-256 symmetric key that is enabled and performs encryption and decryption.\n "]
type nonrec xks_key_id_type = string[@@ocaml.doc ""]
type nonrec xks_key_configuration_type =
  {
  id: xks_key_id_type option
    [@ocaml.doc
      "The ID of the external key in its external key manager. This is the ID that the external key store proxy uses to identify the external key.\n"]}
[@@ocaml.doc
  "Information about the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key }that is associated with a KMS key in an external key store. \n\n This element appears in a [CreateKey] or [DescribeKey] response only for a KMS key in an external key store.\n \n  The {i external key} is a symmetric encryption key that is hosted by an external key manager outside of Amazon Web Services. When you use the KMS key in an external key store in a cryptographic operation, the cryptographic operation is performed in the external key manager using the specified external key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.\n  "]
type nonrec xks_key_already_in_use_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the ([XksKeyId]) is already associated with another KMS key in this external key store. Each KMS key in an external key store must be associated with a different external key.\n"]
type nonrec wrapping_key_spec =
  | SM2 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec key_id_type = string[@@ocaml.doc ""]
type nonrec boolean_type = bool[@@ocaml.doc ""]
type nonrec signing_algorithm_spec =
  | ML_DSA_SHAKE_256 [@ocaml.doc ""]
  | SM2DSA [@ocaml.doc ""]
  | ECDSA_SHA_512 [@ocaml.doc ""]
  | ECDSA_SHA_384 [@ocaml.doc ""]
  | ECDSA_SHA_256 [@ocaml.doc ""]
  | RSASSA_PKCS1_V1_5_SHA_512 [@ocaml.doc ""]
  | RSASSA_PKCS1_V1_5_SHA_384 [@ocaml.doc ""]
  | RSASSA_PKCS1_V1_5_SHA_256 [@ocaml.doc ""]
  | RSASSA_PSS_SHA_512 [@ocaml.doc ""]
  | RSASSA_PSS_SHA_384 [@ocaml.doc ""]
  | RSASSA_PSS_SHA_256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec verify_response =
  {
  signing_algorithm: signing_algorithm_spec option
    [@ocaml.doc
      "The signing algorithm that was used to verify the signature.\n"];
  signature_valid: boolean_type option
    [@ocaml.doc
      "A Boolean value that indicates whether the signature was verified. A value of [True] indicates that the [Signature] was produced by signing the [Message] with the specified [KeyID] and [SigningAlgorithm.] If the signature is not verified, the [Verify] operation fails with a [KMSInvalidSignatureException] exception. \n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key that was used to verify the signature.\n"]}
[@@ocaml.doc ""]
type nonrec plaintext_type = bytes[@@ocaml.doc ""]
type nonrec message_type =
  | EXTERNAL_MU [@ocaml.doc ""]
  | DIGEST [@ocaml.doc ""]
  | RAW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ciphertext_type = bytes[@@ocaml.doc ""]
type nonrec grant_token_type = string[@@ocaml.doc ""]
type nonrec grant_token_list = grant_token_type list[@@ocaml.doc ""]
type nonrec nullable_boolean_type = bool[@@ocaml.doc ""]
type nonrec verify_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  signing_algorithm: signing_algorithm_spec
    [@ocaml.doc
      "The signing algorithm that was used to sign the message. If you submit a different algorithm, the signature verification fails.\n"];
  signature: ciphertext_type
    [@ocaml.doc "The signature that the [Sign] operation generated.\n"];
  message_type: message_type option
    [@ocaml.doc
      "Tells KMS whether the value of the [Message] parameter should be hashed as part of the signing algorithm. Use [RAW] for unhashed messages; use [DIGEST] for message digests, which are already hashed; use [EXTERNAL_MU] for 64-byte representative \206\188 used in ML-DSA signing as defined in NIST FIPS 204 Section 6.2.\n\n When the value of [MessageType] is [RAW], KMS uses the standard signing algorithm, which begins with a hash function. When the value is [DIGEST], KMS skips the hashing step in the signing algorithm. When the value is [EXTERNAL_MU] KMS skips the concatenated hashing of the public key hash and the message done in the ML-DSA signing algorithm.\n \n   Use the [DIGEST] or [EXTERNAL_MU] value only when the value of the [Message] parameter is a message digest. If you use the [DIGEST] value with an unhashed message, the security of the signing operation can be compromised.\n   \n     When the value of [MessageType] is [DIGEST], the length of the [Message] value must match the length of hashed messages for the specified signing algorithm.\n     \n      When the value of [MessageType] is [EXTERNAL_MU] the length of the [Message] value must be 64 bytes.\n      \n       You can submit a message digest and omit the [MessageType] or specify [RAW] so the digest is hashed again while signing. However, if the signed message is hashed once while signing, but twice while verifying, verification fails, even when the message hasn't changed.\n       \n        The hashing algorithm that [Verify] uses is based on the [SigningAlgorithm] value.\n        \n         {ul\n               {-  Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.\n                   \n                    }\n               {-  Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.\n                   \n                    }\n               {-  Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.\n                   \n                    }\n               {-  Signing algorithms that end in SHAKE_256 use the SHAKE_256 hashing algorithm.\n                   \n                    }\n               {-  SM2DSA uses the SM3 hashing algorithm. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/offline-operations.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.\n                   \n                    }\n               }\n  "];
  message: plaintext_type
    [@ocaml.doc
      "Specifies the message that was signed. You can submit a raw message of up to 4096 bytes, or a hash digest of the message. If you submit a digest, use the [MessageType] parameter with a value of [DIGEST].\n\n If the message specified here is different from the message that was signed, the signature verification fails. A message and its hash digest are considered to be the same message.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the asymmetric KMS key that will be used to verify the signature. This must be the same KMS key that was used to generate the signature. If you specify a different KMS key, the signature verification fails.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec mac_algorithm_spec =
  | HMAC_SHA_512 [@ocaml.doc ""]
  | HMAC_SHA_384 [@ocaml.doc ""]
  | HMAC_SHA_256 [@ocaml.doc ""]
  | HMAC_SHA_224 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec verify_mac_response =
  {
  mac_algorithm: mac_algorithm_spec option
    [@ocaml.doc "The MAC algorithm used in the verification.\n"];
  mac_valid: boolean_type option
    [@ocaml.doc
      "A Boolean value that indicates whether the HMAC was verified. A value of [True] indicates that the HMAC ([Mac]) was generated with the specified [Message], HMAC KMS key ([KeyID]) and [MacAlgorithm.].\n\n If the HMAC is not verified, the [VerifyMac] operation fails with a [KMSInvalidMacException] exception. This exception indicates that one or more of the inputs changed since the HMAC was computed.\n "];
  key_id: key_id_type option
    [@ocaml.doc "The HMAC KMS key used in the verification.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec verify_mac_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  mac: ciphertext_type
    [@ocaml.doc
      "The HMAC to verify. Enter the HMAC that was generated by the [GenerateMac] operation when you specified the same message, HMAC KMS key, and MAC algorithm as the values specified in this request.\n"];
  mac_algorithm: mac_algorithm_spec
    [@ocaml.doc
      "The MAC algorithm that will be used in the verification. Enter the same MAC algorithm that was used to compute the HMAC. This algorithm must be supported by the HMAC KMS key identified by the [KeyId] parameter.\n"];
  key_id: key_id_type
    [@ocaml.doc
      "The KMS key that will be used in the verification.\n\n Enter a key ID of the KMS key that was used to generate the HMAC. If you identify a different KMS key, the [VerifyMac] operation fails.\n "];
  message: plaintext_type
    [@ocaml.doc
      "The message that will be used in the verification. Enter the same message that was used to generate the HMAC.\n\n  [GenerateMac] and [VerifyMac] do not provide special handling for message digests. If you generated an HMAC for a hash digest of a message, you must verify the HMAC for the same hash digest.\n "]}
[@@ocaml.doc ""]
type nonrec not_found_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified entity or resource could not be found.\n"]
type nonrec kms_invalid_state_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the state of the specified resource is not valid for this request.\n\n This exceptions means one of the following:\n \n  {ul\n        {-  The key state of the KMS key is not compatible with the operation. \n            \n             To find the key state, use the [DescribeKey] operation. For more information about which key states are compatible with each KMS operation, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i  {i Key Management Service Developer Guide} }.\n             \n              }\n        {-  For cryptographic operations on KMS keys in custom key stores, this exception represents a general failure with many possible causes. To identify the cause, see the error message that accompanies the exception.\n            \n             }\n        }\n  "]
type nonrec kms_invalid_mac_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the HMAC verification failed. HMAC verification fails when the HMAC computed by using the specified message, HMAC KMS key, and MAC algorithm does not match the HMAC specified in the request.\n"]
type nonrec kms_internal_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because an internal exception occurred. The request can be retried.\n"]
type nonrec key_unavailable_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified KMS key was not available. You can retry the request.\n"]
type nonrec invalid_key_usage_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected for one of the following reasons: \n\n {ul\n       {-  The [KeyUsage] value of the KMS key is incompatible with the API operation.\n           \n            }\n       {-  The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key [(KeySpec]).\n           \n            }\n       }\n   For encrypting, decrypting, re-encrypting, and generating data keys, the [KeyUsage] must be [ENCRYPT_DECRYPT]. For signing and verifying messages, the [KeyUsage] must be [SIGN_VERIFY]. For generating and verifying message authentication codes (MACs), the [KeyUsage] must be [GENERATE_VERIFY_MAC]. For deriving key agreement secrets, the [KeyUsage] must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n   \n    To find the encryption or signing algorithms supported for a particular KMS key, use the [DescribeKey] operation.\n    "]
type nonrec invalid_grant_token_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified grant token is not valid.\n"]
type nonrec dry_run_operation_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       " The request was rejected because the DryRun parameter was specified. \n"]
type nonrec disabled_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified KMS key is not enabled.\n"]
type nonrec kms_invalid_signature_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the signature verification failed. Signature verification fails when it cannot confirm that signature was produced by signing the specified message with the specified KMS key and signing algorithm.\n"]
type nonrec dependency_timeout_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The system timed out while trying to fulfill the request. You can retry the request.\n"]
type nonrec region_type = string[@@ocaml.doc ""]
type nonrec update_primary_region_request =
  {
  primary_region: region_type
    [@ocaml.doc
      "The Amazon Web Services Region of the new primary key. Enter the Region ID, such as [us-east-1] or [ap-southeast-2]. There must be an existing replica key in this Region. \n\n When the operation completes, the multi-Region key in this Region will be the primary key.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the current primary key. When the operation completes, this KMS key will be a replica key.\n\n Specify the key ID or key ARN of a multi-Region primary key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec unsupported_operation_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.\n"]
type nonrec invalid_arn_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because a specified ARN, or an ARN in a key policy, is not valid.\n"]
type nonrec description_type = string[@@ocaml.doc ""]
type nonrec update_key_description_request =
  {
  description: description_type
    [@ocaml.doc
      "New description for the KMS key.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n   "];
  key_id: key_id_type
    [@ocaml.doc
      "Updates the description of the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec update_custom_key_store_response = unit[@@ocaml.doc ""]
type nonrec custom_key_store_id_type = string[@@ocaml.doc ""]
type nonrec custom_key_store_name_type = string[@@ocaml.doc ""]
type nonrec key_store_password_type = string[@@ocaml.doc ""]
type nonrec cloud_hsm_cluster_id_type = string[@@ocaml.doc ""]
type nonrec update_custom_key_store_request =
  {
  xks_proxy_connectivity: xks_proxy_connectivity_type option
    [@ocaml.doc
      "Changes the connectivity setting for the external key store. To indicate that the external key store proxy uses a Amazon VPC endpoint service to communicate with KMS, specify [VPC_ENDPOINT_SERVICE]. Otherwise, specify [PUBLIC_ENDPOINT].\n\n If you change the [XksProxyConnectivity] to [VPC_ENDPOINT_SERVICE], you must also change the [XksProxyUriEndpoint] and add an [XksProxyVpcEndpointServiceName] value. \n \n  If you change the [XksProxyConnectivity] to [PUBLIC_ENDPOINT], you must also change the [XksProxyUriEndpoint] and specify a null or empty string for the [XksProxyVpcEndpointServiceName] value.\n  \n   To change this value, the external key store must be disconnected.\n   "];
  xks_proxy_authentication_credential:
    xks_proxy_authentication_credential_type option
    [@ocaml.doc
      "Changes the credentials that KMS uses to sign requests to the external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n You must specify both the [AccessKeyId] and [SecretAccessKey] value in the authentication credential, even if you are only updating one value.\n \n  This parameter doesn't establish or change your authentication credentials on the proxy. It just tells KMS the credential that you established with your external key store proxy. For example, if you rotate the credential on your external key store proxy, you can use this parameter to update the credential in KMS.\n  \n   You can change this value when the external key store is connected or disconnected.\n   "];
  xks_proxy_vpc_endpoint_service_name:
    xks_proxy_vpc_endpoint_service_name_type option
    [@ocaml.doc
      "Changes the name that KMS uses to identify the Amazon VPC endpoint service for your external key store proxy (XKS proxy). This parameter is valid when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE] and the [XksProxyConnectivity] is [VPC_ENDPOINT_SERVICE].\n\n To change this value, the external key store must be disconnected.\n "];
  xks_proxy_uri_path: xks_proxy_uri_path_type option
    [@ocaml.doc
      "Changes the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key manager and external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The value must start with [/] and must end with [/kms/xks/v1], where [v1] represents the version of the KMS external key store proxy API. You can include an optional prefix between the required elements such as \n {[\n /{i example}/kms/xks/v1\n ]}\n .\n \n  The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n  \n   You can change this value when the external key store is connected or disconnected.\n   "];
  xks_proxy_uri_endpoint: xks_proxy_uri_endpoint_type option
    [@ocaml.doc
      "Changes the URI endpoint that KMS uses to connect to your external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n For external key stores with an [XksProxyConnectivity] value of [PUBLIC_ENDPOINT], the protocol must be HTTPS.\n \n  For external key stores with an [XksProxyConnectivity] value of [VPC_ENDPOINT_SERVICE], specify [https://] followed by the private DNS name associated with the VPC endpoint service. Each external key store must use a different private DNS name.\n  \n   The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n   \n    To change this value, the external key store must be disconnected.\n    "];
  cloud_hsm_cluster_id: cloud_hsm_cluster_id_type option
    [@ocaml.doc
      "Associates the custom key store with a related CloudHSM cluster. This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the cluster ID of the cluster that you used to create the custom key store or a cluster that shares a backup history and has the same cluster certificate as the original cluster. You cannot use this parameter to associate a custom key store with an unrelated cluster. In addition, the replacement cluster must {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}fulfill the requirements} for a cluster associated with a custom key store. To view the cluster certificate of a cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n \n  To change this value, the CloudHSM key store must be disconnected.\n  "];
  key_store_password: key_store_password_type option
    [@ocaml.doc
      "Enter the current password of the [kmsuser] crypto user (CU) in the CloudHSM cluster that is associated with the custom key store. This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n This parameter tells KMS the current password of the [kmsuser] crypto user (CU). It does not set or change the password of any users in the CloudHSM cluster.\n \n  To change this value, the CloudHSM key store must be disconnected.\n  "];
  new_custom_key_store_name: custom_key_store_name_type option
    [@ocaml.doc
      "Changes the friendly name of the custom key store to the value that you specify. The custom key store name must be unique in the Amazon Web Services account.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    To change this value, an CloudHSM key store must be disconnected. An external key store can be connected or disconnected.\n    "];
  custom_key_store_id: custom_key_store_id_type
    [@ocaml.doc
      "Identifies the custom key store that you want to update. Enter the ID of the custom key store. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec custom_key_store_not_found_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because KMS cannot find a custom key store with the specified key store name or ID.\n"]
type nonrec custom_key_store_name_in_use_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified custom key store name is already assigned to another custom key store in the account. Try again with a custom key store name that is unique in the account.\n"]
type nonrec custom_key_store_invalid_state_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because of the [ConnectionState] of the custom key store. To get the [ConnectionState] of a custom key store, use the [DescribeCustomKeyStores] operation.\n\n This exception is thrown under the following conditions:\n \n  {ul\n        {-  You requested the [ConnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [FAILED]. This operation is valid for all other [ConnectionState] values. To reconnect a custom key store in a [FAILED] state, disconnect it ([DisconnectCustomKeyStore]), then connect it ([ConnectCustomKeyStore]).\n            \n             }\n        {-  You requested the [CreateKey] operation in a custom key store that is not connected. This operations is valid only when the custom key store [ConnectionState] is [CONNECTED].\n            \n             }\n        {-  You requested the [DisconnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [DISCONNECTED]. This operation is valid for all other [ConnectionState] values.\n            \n             }\n        {-  You requested the [UpdateCustomKeyStore] or [DeleteCustomKeyStore] operation on a custom key store that is not disconnected. This operation is valid only when the custom key store [ConnectionState] is [DISCONNECTED].\n            \n             }\n        {-  You requested the [GenerateRandom] operation in an CloudHSM key store that is not connected. This operation is valid only when the CloudHSM key store [ConnectionState] is [CONNECTED]. \n            \n             }\n        }\n  "]
type nonrec cloud_hsm_cluster_not_related_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified CloudHSM cluster has a different cluster certificate than the original cluster. You cannot use the operation to specify an unrelated cluster for an CloudHSM key store.\n\n Specify an CloudHSM cluster that shares a backup history with the original cluster. This includes clusters that were created from a backup of the current cluster, and clusters that were created from the same backup that produced the current cluster.\n \n  CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n  "]
type nonrec cloud_hsm_cluster_not_found_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because KMS cannot find the CloudHSM cluster with the specified cluster ID. Retry the request with a different cluster ID.\n"]
type nonrec cloud_hsm_cluster_not_active_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the CloudHSM cluster associated with the CloudHSM key store is not active. Initialize and activate the cluster and try the command again. For detailed instructions, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/getting-started.html}Getting Started} in the {i CloudHSM User Guide}.\n"]
type nonrec cloud_hsm_cluster_invalid_configuration_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the associated CloudHSM cluster did not meet the configuration requirements for an CloudHSM key store.\n\n {ul\n       {-  The CloudHSM cluster must be configured with private subnets in at least two different Availability Zones in the Region.\n           \n            }\n       {-  The {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}security group for the cluster} (cloudhsm-cluster-{i }-sg) must include inbound rules and outbound rules that allow TCP traffic on ports 2223-2225. The {b Source} in the inbound rules and the {b Destination} in the outbound rules must match the security group ID. These rules are set by default when you create the CloudHSM cluster. Do not delete or change them. To get information about a particular security group, use the {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html}DescribeSecurityGroups} operation.\n           \n            }\n       {-  The CloudHSM cluster must contain at least as many HSMs as the operation requires. To add HSMs, use the CloudHSM {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html}CreateHsm} operation.\n           \n            For the [CreateCustomKeyStore], [UpdateCustomKeyStore], and [CreateKey] operations, the CloudHSM cluster must have at least two active HSMs, each in a different Availability Zone. For the [ConnectCustomKeyStore] operation, the CloudHSM must contain at least one active HSM.\n            \n             }\n       }\n   For information about the requirements for an CloudHSM cluster that is associated with an CloudHSM key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}Assemble the Prerequisites} in the {i Key Management Service Developer Guide}. For information about creating a private subnet for an CloudHSM cluster, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/create-subnets.html}Create a Private Subnet} in the {i CloudHSM User Guide}. For information about cluster security groups, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}Configure a Default Security Group} in the {i  {i CloudHSM User Guide} }. \n   "]
type nonrec alias_name_type = string[@@ocaml.doc ""]
type nonrec update_alias_request =
  {
  target_key_id: key_id_type
    [@ocaml.doc
      "Identifies the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key} to associate with the alias. You don't have permission to associate an alias with an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}.\n\n The KMS key must be in the same Amazon Web Services account and Region as the alias. Also, the new target KMS key must be the same type as the current target KMS key (both symmetric or both asymmetric or both HMAC) and they must have the same key usage. \n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   \n    To verify that the alias is mapped to the correct KMS key, use [ListAliases].\n    "];
  alias_name: alias_name_type
    [@ocaml.doc
      "Identifies the alias that is changing its KMS key. This value must begin with [alias/] followed by the alias name, such as [alias/ExampleAlias]. You cannot use [UpdateAlias] to change the alias name.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec limit_exceeded_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because a length constraint or quota was exceeded. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html}Quotas} in the {i Key Management Service Developer Guide}.\n"]
type nonrec tag_key_type = string[@@ocaml.doc ""]
type nonrec tag_key_list = tag_key_type list[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: tag_key_list
    [@ocaml.doc
      "One or more tag keys. Specify only the tag keys, not the tag values.\n"];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key from which you are removing tags.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec tag_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because one or more tags are not valid.\n"]
type nonrec trust_anchor_certificate_type = string[@@ocaml.doc ""]
type nonrec tag_value_type = string[@@ocaml.doc ""]
type nonrec tag =
  {
  tag_value: tag_value_type [@ocaml.doc "The value of the tag.\n"];
  tag_key: tag_key_type [@ocaml.doc "The key of the tag.\n"]}[@@ocaml.doc
                                                               "A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    For information about the rules that apply to tag keys and tag values, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html}User-Defined Tag Restrictions} in the {i Amazon Web Services Billing and Cost Management User Guide}.\n    "]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag_list
    [@ocaml.doc
      "One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an empty (null) string. \n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.\n    "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies a customer managed key in the account and Region.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec sign_response =
  {
  signing_algorithm: signing_algorithm_spec option
    [@ocaml.doc "The signing algorithm that was used to sign the message.\n"];
  signature: ciphertext_type option
    [@ocaml.doc
      "The cryptographic signature that was generated for the message. \n\n {ul\n       {-  When used with the supported RSA signing algorithms, the encoding of this value is defined by {{:https://tools.ietf.org/html/rfc8017}PKCS #1 in RFC 8017}.\n           \n            }\n       {-  When used with the [ECDSA_SHA_256], [ECDSA_SHA_384], or [ECDSA_SHA_512] signing algorithms, this value is a DER-encoded object as defined by ANSI X9.62\226\128\1472005 and {{:https://tools.ietf.org/html/rfc3279#section-2.2.3}RFC 3279 Section 2.2.3}. This is the most commonly used signature format and is appropriate for most uses. \n           \n            }\n       }\n   When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n   "];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key that was used to sign the message.\n"]}
[@@ocaml.doc ""]
type nonrec sign_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  signing_algorithm: signing_algorithm_spec
    [@ocaml.doc
      "Specifies the signing algorithm to use when signing the message. \n\n Choose an algorithm that is compatible with the type and size of the specified asymmetric KMS key. When signing with RSA key pairs, RSASSA-PSS algorithms are preferred. We include RSASSA-PKCS1-v1_5 algorithms for compatibility with existing applications.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  message_type: message_type option
    [@ocaml.doc
      "Tells KMS whether the value of the [Message] parameter should be hashed as part of the signing algorithm. Use [RAW] for unhashed messages; use [DIGEST] for message digests, which are already hashed; use [EXTERNAL_MU] for 64-byte representative \206\188 used in ML-DSA signing as defined in NIST FIPS 204 Section 6.2.\n\n When the value of [MessageType] is [RAW], KMS uses the standard signing algorithm, which begins with a hash function. When the value is [DIGEST], KMS skips the hashing step in the signing algorithm. When the value is [EXTERNAL_MU] KMS skips the concatenated hashing of the public key hash and the message done in the ML-DSA signing algorithm.\n \n   Use the [DIGEST] or [EXTERNAL_MU] value only when the value of the [Message] parameter is a message digest. If you use the [DIGEST] value with an unhashed message, the security of the signing operation can be compromised.\n   \n     When the value of [MessageType] is [DIGEST], the length of the [Message] value must match the length of hashed messages for the specified signing algorithm.\n     \n      When the value of [MessageType] is [EXTERNAL_MU] the length of the [Message] value must be 64 bytes.\n      \n       You can submit a message digest and omit the [MessageType] or specify [RAW] so the digest is hashed again while signing. However, this can cause verification failures when verifying with a system that assumes a single hash.\n       \n        The hashing algorithm that [Sign] uses is based on the [SigningAlgorithm] value.\n        \n         {ul\n               {-  Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.\n                   \n                    }\n               {-  Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.\n                   \n                    }\n               {-  Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.\n                   \n                    }\n               {-  Signing algorithms that end in SHAKE_256 use the SHAKE_256 hashing algorithm.\n                   \n                    }\n               {-  SM2DSA uses the SM3 hashing algorithm. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/offline-operations.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.\n                   \n                    }\n               }\n  "];
  message: plaintext_type
    [@ocaml.doc
      "Specifies the message or message digest to sign. Messages can be 0-4096 bytes. To sign a larger message, provide a message digest.\n\n If you provide a message digest, use the [DIGEST] value of [MessageType] to prevent the digest from being hashed again while signing.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies an asymmetric KMS key. KMS uses the private key in the asymmetric KMS key to sign the message. The [KeyUsage] type of the KMS key must be [SIGN_VERIFY]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec date_type = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec key_state =
  | Updating [@ocaml.doc ""]
  | Unavailable [@ocaml.doc ""]
  | PendingReplicaDeletion [@ocaml.doc ""]
  | PendingImport [@ocaml.doc ""]
  | PendingDeletion [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""]
  | Enabled [@ocaml.doc ""]
  | Creating [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec pending_window_in_days_type = int[@@ocaml.doc ""]
type nonrec schedule_key_deletion_response =
  {
  pending_window_in_days: pending_window_in_days_type option
    [@ocaml.doc
      "The waiting period before the KMS key is deleted. \n\n If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.\n "];
  key_state: key_state option
    [@ocaml.doc
      "The current status of the KMS key.\n\n For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n "];
  deletion_date: date_type option
    [@ocaml.doc
      "The date and time after which KMS deletes the KMS key.\n\n If the KMS key is a multi-Region primary key with replica keys, this field does not appear. The deletion date for the primary key isn't known until its last replica key is deleted.\n "];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key whose deletion is scheduled.\n"]}
[@@ocaml.doc ""]
type nonrec schedule_key_deletion_request =
  {
  pending_window_in_days: pending_window_in_days_type option
    [@ocaml.doc
      "The waiting period, specified in number of days. After the waiting period ends, KMS deletes the KMS key.\n\n If the KMS key is a multi-Region primary key with replica keys, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.\n \n  This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30. You can use the {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-schedule-key-deletion-pending-window-in-days} [kms:ScheduleKeyDeletionPendingWindowInDays] } condition key to further constrain the values that principals can specify in the [PendingWindowInDays] parameter.\n  "];
  key_id: key_id_type
    [@ocaml.doc
      "The unique identifier of the KMS key to delete.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec conflict_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because an automatic rotation of this key is currently in progress or scheduled to begin within the next 20 minutes. \n"]
type nonrec rotate_key_on_demand_response =
  {
  key_id: key_id_type option
    [@ocaml.doc
      "Identifies the symmetric encryption KMS key that you initiated on-demand rotation on.\n"]}
[@@ocaml.doc ""]
type nonrec rotate_key_on_demand_request =
  {
  key_id: key_id_type
    [@ocaml.doc
      "Identifies a symmetric encryption KMS key. You cannot perform on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, multi-Region KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. To perform on-demand rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate}multi-Region keys}, invoke the on-demand rotation on the primary key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_grant_id_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified [GrantId] is not valid.\n"]
type nonrec grant_id_type = string[@@ocaml.doc ""]
type nonrec revoke_grant_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_id: grant_id_type
    [@ocaml.doc
      "Identifies the grant to revoke. To get the grant ID, use [CreateGrant], [ListGrants], or [ListRetirableGrants].\n"];
  key_id: key_id_type
    [@ocaml.doc
      "A unique identifier for the KMS key associated with the grant. To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec retire_grant_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_id: grant_id_type option
    [@ocaml.doc
      "Identifies the grant to retire. To get the grant ID, use [CreateGrant], [ListGrants], or [ListRetirableGrants].\n\n {ul\n       {-  Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123\n           \n            }\n       }\n  "];
  key_id: key_id_type option
    [@ocaml.doc
      "The key ARN KMS key associated with the grant. To find the key ARN, use the [ListKeys] operation.\n\n For example: [arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n "];
  grant_token: grant_token_type option
    [@ocaml.doc
      "Identifies the grant to be retired. You can use a grant token to identify a new grant even before it has achieved eventual consistency.\n\n Only the [CreateGrant] operation returns a grant token. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency}Eventual consistency} in the {i Key Management Service Developer Guide}.\n "]}
[@@ocaml.doc ""]
type nonrec malformed_policy_document_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified policy is not syntactically or semantically correct.\n"]
type nonrec already_exists_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because it attempted to create a resource that already exists.\n"]
type nonrec aws_account_id_type = string[@@ocaml.doc ""]
type nonrec arn_type = string[@@ocaml.doc ""]
type nonrec key_usage_type =
  | KEY_AGREEMENT [@ocaml.doc ""]
  | GENERATE_VERIFY_MAC [@ocaml.doc ""]
  | ENCRYPT_DECRYPT [@ocaml.doc ""]
  | SIGN_VERIFY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec origin_type =
  | EXTERNAL_KEY_STORE [@ocaml.doc ""]
  | AWS_CLOUDHSM [@ocaml.doc ""]
  | EXTERNAL [@ocaml.doc ""]
  | AWS_KMS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec expiration_model_type =
  | KEY_MATERIAL_DOES_NOT_EXPIRE [@ocaml.doc ""]
  | KEY_MATERIAL_EXPIRES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec key_manager_type =
  | CUSTOMER [@ocaml.doc ""]
  | AWS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec customer_master_key_spec =
  | SM2 [@ocaml.doc ""]
  | HMAC_512 [@ocaml.doc ""]
  | HMAC_384 [@ocaml.doc ""]
  | HMAC_256 [@ocaml.doc ""]
  | HMAC_224 [@ocaml.doc ""]
  | SYMMETRIC_DEFAULT [@ocaml.doc ""]
  | ECC_SECG_P256K1 [@ocaml.doc ""]
  | ECC_NIST_P521 [@ocaml.doc ""]
  | ECC_NIST_P384 [@ocaml.doc ""]
  | ECC_NIST_P256 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec key_spec =
  | ML_DSA_87 [@ocaml.doc ""]
  | ML_DSA_65 [@ocaml.doc ""]
  | ML_DSA_44 [@ocaml.doc ""]
  | SM2 [@ocaml.doc ""]
  | HMAC_512 [@ocaml.doc ""]
  | HMAC_384 [@ocaml.doc ""]
  | HMAC_256 [@ocaml.doc ""]
  | HMAC_224 [@ocaml.doc ""]
  | SYMMETRIC_DEFAULT [@ocaml.doc ""]
  | ECC_SECG_P256K1 [@ocaml.doc ""]
  | ECC_NIST_P521 [@ocaml.doc ""]
  | ECC_NIST_P384 [@ocaml.doc ""]
  | ECC_NIST_P256 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec encryption_algorithm_spec =
  | SM2PKE [@ocaml.doc ""]
  | RSAES_OAEP_SHA_256 [@ocaml.doc ""]
  | RSAES_OAEP_SHA_1 [@ocaml.doc ""]
  | SYMMETRIC_DEFAULT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec encryption_algorithm_spec_list = encryption_algorithm_spec list
[@@ocaml.doc ""]
type nonrec signing_algorithm_spec_list = signing_algorithm_spec list
[@@ocaml.doc ""]
type nonrec key_agreement_algorithm_spec =
  | ECDH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec key_agreement_algorithm_spec_list =
  key_agreement_algorithm_spec list[@@ocaml.doc ""]
type nonrec multi_region_key_type =
  | REPLICA [@ocaml.doc ""]
  | PRIMARY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec multi_region_key =
  {
  region: region_type option
    [@ocaml.doc
      "Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.\n"];
  arn: arn_type option
    [@ocaml.doc
      "Displays the key ARN of a primary or replica key of a multi-Region key.\n"]}
[@@ocaml.doc "Describes the primary or replica key in a multi-Region key.\n"]
type nonrec multi_region_key_list = multi_region_key list[@@ocaml.doc ""]
type nonrec multi_region_configuration =
  {
  replica_keys: multi_region_key_list option
    [@ocaml.doc
      "displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.\n"];
  primary_key: multi_region_key option
    [@ocaml.doc
      "Displays the key ARN and Region of the primary key. This field includes the current KMS key if it is the primary key.\n"];
  multi_region_key_type: multi_region_key_type option
    [@ocaml.doc
      "Indicates whether the KMS key is a [PRIMARY] or [REPLICA] key.\n"]}
[@@ocaml.doc
  "Describes the configuration of this multi-Region key. This field appears only when the KMS key is a primary or replica of a multi-Region key.\n\n For more information about any listed KMS key, use the [DescribeKey] operation.\n "]
type nonrec mac_algorithm_spec_list = mac_algorithm_spec list[@@ocaml.doc ""]
type nonrec backing_key_id_type = string[@@ocaml.doc ""]
type nonrec key_metadata =
  {
  current_key_material_id: backing_key_id_type option
    [@ocaml.doc
      "Identifies the current key material. This value is present for symmetric encryption keys with [AWS_KMS] origin and single-Region, symmetric encryption keys with [EXTERNAL] origin. These KMS keys support automatic or on-demand key rotation and can have multiple key materials associated with them. KMS uses the current key material for both encryption and decryption, and the non-current key material for decryption operations only.\n"];
  xks_key_configuration: xks_key_configuration_type option
    [@ocaml.doc
      "Information about the external key that is associated with a KMS key in an external key store.\n\n For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.\n "];
  mac_algorithms: mac_algorithm_spec_list option
    [@ocaml.doc
      "The message authentication code (MAC) algorithm that the HMAC KMS key supports.\n\n This value is present only when the [KeyUsage] of the KMS key is [GENERATE_VERIFY_MAC].\n "];
  pending_deletion_window_in_days: pending_window_in_days_type option
    [@ocaml.doc
      "The waiting period before the primary key in a multi-Region key is deleted. This waiting period begins when the last of its replica keys is deleted. This value is present only when the [KeyState] of the KMS key is [PendingReplicaDeletion]. That indicates that the KMS key is the primary key in a multi-Region key, it is scheduled for deletion, and it still has existing replica keys.\n\n When a single-Region KMS key or a multi-Region replica key is scheduled for deletion, its deletion date is displayed in the [DeletionDate] field. However, when the primary key in a multi-Region key is scheduled for deletion, its waiting period doesn't begin until all of its replica keys are deleted. This value displays that waiting period. When the last replica key in the multi-Region key is deleted, the [KeyState] of the scheduled primary key changes from [PendingReplicaDeletion] to [PendingDeletion] and the deletion date appears in the [DeletionDate] field.\n "];
  multi_region_configuration: multi_region_configuration option
    [@ocaml.doc
      "Lists the primary and replica keys in same multi-Region key. This field is present only when the value of the [MultiRegion] field is [True].\n\n For more information about any listed KMS key, use the [DescribeKey] operation.\n \n  {ul\n        {-   [MultiRegionKeyType] indicates whether the KMS key is a [PRIMARY] or [REPLICA] key.\n            \n             }\n        {-   [PrimaryKey] displays the key ARN and Region of the primary key. This field displays the current KMS key if it is the primary key.\n            \n             }\n        {-   [ReplicaKeys] displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.\n            \n             }\n        }\n  "];
  multi_region: nullable_boolean_type option
    [@ocaml.doc
      "Indicates whether the KMS key is a multi-Region ([True]) or regional ([False]) key. This value is [True] for multi-Region primary and replica keys and [False] for regional KMS keys.\n\n For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n "];
  key_agreement_algorithms: key_agreement_algorithm_spec_list option
    [@ocaml.doc
      "The key agreement algorithm used to derive a shared secret.\n"];
  signing_algorithms: signing_algorithm_spec_list option
    [@ocaml.doc
      "The signing algorithms that the KMS key supports. You cannot use the KMS key with other signing algorithms within KMS.\n\n This field appears only when the [KeyUsage] of the KMS key is [SIGN_VERIFY].\n "];
  encryption_algorithms: encryption_algorithm_spec_list option
    [@ocaml.doc
      "The encryption algorithms that the KMS key supports. You cannot use the KMS key with other encryption algorithms within KMS.\n\n This value is present only when the [KeyUsage] of the KMS key is [ENCRYPT_DECRYPT].\n "];
  key_spec: key_spec option
    [@ocaml.doc "Describes the type of key material in the KMS key.\n"];
  customer_master_key_spec: customer_master_key_spec option
    [@ocaml.doc
      "Instead, use the [KeySpec] field.\n\n The [KeySpec] and [CustomerMasterKeySpec] fields have the same value. We recommend that you use the [KeySpec] field in your code. However, to avoid breaking changes, KMS supports both fields.\n "];
  key_manager: key_manager_type option
    [@ocaml.doc
      "The manager of the KMS key. KMS keys in your Amazon Web Services account are either customer managed or Amazon Web Services managed. For more information about the difference, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys}KMS keys} in the {i Key Management Service Developer Guide}.\n"];
  expiration_model: expiration_model_type option
    [@ocaml.doc
      "Specifies whether the KMS key's key material expires. This value is present only when [Origin] is [EXTERNAL], otherwise this value is omitted.\n"];
  cloud_hsm_cluster_id: cloud_hsm_cluster_id_type option
    [@ocaml.doc
      "The cluster ID of the CloudHSM cluster that contains the key material for the KMS key. When you create a KMS key in an CloudHSM {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}, KMS creates the key material for the KMS key in the associated CloudHSM cluster. This field is present only when the KMS key is created in an CloudHSM key store.\n"];
  custom_key_store_id: custom_key_store_id_type option
    [@ocaml.doc
      "A unique identifier for the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store} that contains the KMS key. This field is present only when the KMS key is created in a custom key store.\n"];
  origin: origin_type option
    [@ocaml.doc
      "The source of the key material for the KMS key. When this value is [AWS_KMS], KMS created the key material. When this value is [EXTERNAL], the key material was imported or the KMS key doesn't have any key material. When this value is [AWS_CLOUDHSM], the key material was created in the CloudHSM cluster associated with a custom key store.\n"];
  valid_to: date_type option
    [@ocaml.doc
      "The earliest time at which any imported key material permanently associated with this KMS key expires. When a key material expires, KMS deletes the key material and the KMS key becomes unusable. This value is present only for KMS keys whose [Origin] is [EXTERNAL] and the [ExpirationModel] is [KEY_MATERIAL_EXPIRES], otherwise this value is omitted.\n"];
  deletion_date: date_type option
    [@ocaml.doc
      "The date and time after which KMS deletes this KMS key. This value is present only when the KMS key is scheduled for deletion, that is, when its [KeyState] is [PendingDeletion].\n\n When the primary key in a multi-Region key is scheduled for deletion but still has replica keys, its key state is [PendingReplicaDeletion] and the length of its waiting period is displayed in the [PendingDeletionWindowInDays] field.\n "];
  key_state: key_state option
    [@ocaml.doc
      "The current status of the KMS key.\n\n For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n "];
  key_usage: key_usage_type option
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations} for which you can use the KMS key.\n"];
  description: description_type option
    [@ocaml.doc "The description of the KMS key.\n"];
  enabled: boolean_type option
    [@ocaml.doc
      "Specifies whether the KMS key is enabled. When [KeyState] is [Enabled] this value is true, otherwise it is false.\n"];
  creation_date: date_type option
    [@ocaml.doc "The date and time when the KMS key was created.\n"];
  arn: arn_type option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the KMS key. For examples, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms}Key Management Service (KMS)} in the Example ARNs section of the {i Amazon Web Services General Reference}.\n"];
  key_id: key_id_type
    [@ocaml.doc "The globally unique identifier for the KMS key.\n"];
  aws_account_id: aws_account_id_type option
    [@ocaml.doc
      "The twelve-digit account ID of the Amazon Web Services account that owns the KMS key.\n"]}
[@@ocaml.doc
  "Contains metadata about a KMS key.\n\n This data type is used as a response element for the [CreateKey], [DescribeKey], and [ReplicateKey] operations.\n "]
type nonrec policy_type = string[@@ocaml.doc ""]
type nonrec replicate_key_response =
  {
  replica_tags: tag_list option
    [@ocaml.doc
      "The tags on the new replica key. The value is a list of tag key and tag value pairs.\n"];
  replica_policy: policy_type option
    [@ocaml.doc
      "The key policy of the new replica key. The value is a key policy document in JSON format.\n"];
  replica_key_metadata: key_metadata option
    [@ocaml.doc
      "Displays details about the new replica key, including its Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) and {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys}. It also includes the ARN and Amazon Web Services Region of its primary key and other replica keys.\n"]}
[@@ocaml.doc ""]
type nonrec replicate_key_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "Assigns one or more tags to the replica key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the [TagResource] operation.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n     \n       To use this parameter, you must have {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} permission in an IAM policy.\n       \n        Tags are not a shared property of multi-Region keys. You can specify the same tags or different tags for each key in a set of related multi-Region keys. KMS does not synchronize this property.\n        \n         Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.\n         \n          When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tags in KMS}.\n          "];
  description: description_type option
    [@ocaml.doc
      "A description of the KMS key. The default value is an empty string (no description).\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    The description is not a shared property of multi-Region keys. You can specify the same description or a different description for each key in a set of related multi-Region keys. KMS does not synchronize this property.\n    "];
  bypass_policy_lockout_safety_check: boolean_type option
    [@ocaml.doc
      "Skips (\"bypasses\") the key policy lockout safety check. The default value is false.\n\n  Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.\n   \n     Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.\n     "];
  policy: policy_type option
    [@ocaml.doc
      "The key policy to attach to the KMS key. This parameter is optional. If you do not provide a key policy, KMS attaches the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html}default key policy} to the KMS key.\n\n The key policy is not a shared property of multi-Region keys. You can specify the same key policy or a different key policy for each key in a set of related multi-Region keys. KMS does not synchronize this property.\n \n  If you provide a key policy, it must meet the following criteria:\n  \n   {ul\n         {-  The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)\n             \n              }\n         {-  Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.\n             \n              }\n         }\n   A key policy document can include only the following characters:\n   \n    {ul\n          {-  Printable ASCII characters from the space character ([\\u0020]) through the end of the ASCII character range.\n              \n               }\n          {-  Printable characters in the Basic Latin and Latin-1 Supplement character set (through [\\u00FF]).\n              \n               }\n          {-  The tab ([\\u0009]), line feed ([\\u000A]), and carriage return ([\\u000D]) special characters\n              \n               }\n          }\n   For information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key policies in KMS} in the {i Key Management Service Developer Guide}. For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }.\n   "];
  replica_region: region_type
    [@ocaml.doc
      "The Region ID of the Amazon Web Services Region for this replica key. \n\n Enter the Region ID, such as [us-east-1] or [ap-southeast-2]. For a list of Amazon Web Services Regions in which KMS is supported, see {{:https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region}KMS service endpoints} in the {i Amazon Web Services General Reference}.\n \n  The replica must be in a different Amazon Web Services Region than its primary key and other replicas of that primary key, but in the same Amazon Web Services partition. KMS must be available in the replica Region. If the Region is not enabled by default, the Amazon Web Services account must be enabled in the Region. For information about Amazon Web Services partitions, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)} in the {i Amazon Web Services General Reference}. For information about enabling and disabling Regions, see {{:https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable}Enabling a Region} and {{:https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable}Disabling a Region} in the {i Amazon Web Services General Reference}.\n  "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the multi-Region primary key that is being replicated. To determine whether a KMS key is a multi-Region primary key, use the [DescribeKey] operation to check the value of the [MultiRegionKeyType] property.\n\n Specify the key ID or key ARN of a multi-Region primary key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_ciphertext_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "From the [Decrypt] or [ReEncrypt] operation, the request was rejected because the specified ciphertext, or additional authenticated data incorporated into the ciphertext, such as the encryption context, is corrupted, missing, or otherwise invalid.\n\n From the [ImportKeyMaterial] operation, the request was rejected because KMS could not decrypt the encrypted (wrapped) key material. \n "]
type nonrec incorrect_key_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified KMS key cannot decrypt the data. The [KeyId] in a [Decrypt] request and the [SourceKeyId] in a [ReEncrypt] request must identify the same KMS key that was used to encrypt the ciphertext.\n"]
type nonrec re_encrypt_response =
  {
  destination_key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to reencrypt the data. This field is present only when data is reencrypted using a symmetric encryption KMS key.\n"];
  source_key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to originally encrypt the data. This field is present only when the original encryption used a symmetric encryption KMS key.\n"];
  destination_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to reencrypt the data.\n"];
  source_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to decrypt the ciphertext before it was reencrypted.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to reencrypt the data.\n"];
  source_key_id: key_id_type option
    [@ocaml.doc
      "Unique identifier of the KMS key used to originally encrypt the data.\n"];
  ciphertext_blob: ciphertext_type option
    [@ocaml.doc
      "The reencrypted data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec encryption_context_value = string[@@ocaml.doc ""]
type nonrec encryption_context_key = string[@@ocaml.doc ""]
type nonrec encryption_context_type =
  (encryption_context_key * encryption_context_value) list[@@ocaml.doc ""]
type nonrec re_encrypt_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  destination_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that KMS will use to reecrypt the data after it has decrypted it. The default value, [SYMMETRIC_DEFAULT], represents the encryption algorithm used for symmetric encryption KMS keys.\n\n This parameter is required only when the destination KMS key is an asymmetric KMS key.\n "];
  source_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that KMS will use to decrypt the ciphertext before it is reencrypted. The default value, [SYMMETRIC_DEFAULT], represents the algorithm used for symmetric encryption KMS keys.\n\n Specify the same algorithm that was used to encrypt the ciphertext. If you specify a different algorithm, the decrypt attempt fails.\n \n  This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.\n  "];
  destination_encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies that encryption context to use when the reencrypting the data.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    A destination encryption context is valid only when the destination KMS key is a symmetric encryption KMS key. The standard ciphertext format for asymmetric KMS keys does not include fields for metadata.\n    \n     An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n     \n      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n      "];
  destination_key_id: key_id_type
    [@ocaml.doc
      "A unique identifier for the KMS key that is used to reencrypt the data. Specify a symmetric encryption KMS key or an asymmetric KMS key with a [KeyUsage] value of [ENCRYPT_DECRYPT]. To find the [KeyUsage] value of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  source_key_id: key_id_type option
    [@ocaml.doc
      "Specifies the KMS key that KMS will use to decrypt the ciphertext before it is re-encrypted.\n\n Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the [ReEncrypt] operation throws an [IncorrectKeyException].\n \n  This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.\n  \n   To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n   \n    For example:\n    \n     {ul\n           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Alias name: [alias/ExampleAlias] \n               \n                }\n           {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n               \n                }\n           }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  source_encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context to use to decrypt the ciphertext. Enter the same encryption context that was used to encrypt the ciphertext.\n\n An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n \n  For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n  "];
  ciphertext_blob: ciphertext_type
    [@ocaml.doc "Ciphertext of the data to reencrypt.\n"]}[@@ocaml.doc ""]
type nonrec policy_name_type = string[@@ocaml.doc ""]
type nonrec put_key_policy_request =
  {
  bypass_policy_lockout_safety_check: boolean_type option
    [@ocaml.doc
      "Skips (\"bypasses\") the key policy lockout safety check. The default value is false.\n\n  Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.\n   \n     Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.\n     "];
  policy: policy_type
    [@ocaml.doc
      "The key policy to attach to the KMS key.\n\n The key policy must meet the following criteria:\n \n  {ul\n        {-  The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)\n            \n             }\n        {-  Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.\n            \n             }\n        }\n    If either of the required [Resource] or [Action] elements are missing from a key policy statement, the policy statement has no effect. When a key policy statement is missing one of these elements, the KMS console correctly reports an error, but the [PutKeyPolicy] API request succeeds, even though the policy statement is ineffective.\n    \n     For more information on required key policy elements, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-overview.html#key-policy-elements}Elements in a key policy} in the {i Key Management Service Developer Guide}.\n     \n       A key policy document can include only the following characters:\n       \n        {ul\n              {-  Printable ASCII characters from the space character ([\\u0020]) through the end of the ASCII character range.\n                  \n                   }\n              {-  Printable characters in the Basic Latin and Latin-1 Supplement character set (through [\\u00FF]).\n                  \n                   }\n              {-  The tab ([\\u0009]), line feed ([\\u000A]), and carriage return ([\\u000D]) special characters\n                  \n                   }\n              }\n    If the key policy exceeds the length constraint, KMS returns a [LimitExceededException].\n    \n      For information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key policies in KMS} in the {i Key Management Service Developer Guide}.For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }.\n      "];
  policy_name: policy_name_type option
    [@ocaml.doc
      "The name of the key policy. If no policy name is specified, the default value is [default]. The only valid value is [default].\n"];
  key_id: key_id_type
    [@ocaml.doc
      "Sets the key policy on the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_marker_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the marker that specifies where pagination should next begin is not valid.\n"]
type nonrec grant_name_type = string[@@ocaml.doc ""]
type nonrec principal_id_type = string[@@ocaml.doc ""]
type nonrec grant_operation =
  | DeriveSharedSecret [@ocaml.doc ""]
  | VerifyMac [@ocaml.doc ""]
  | GenerateMac [@ocaml.doc ""]
  | GenerateDataKeyPairWithoutPlaintext [@ocaml.doc ""]
  | GenerateDataKeyPair [@ocaml.doc ""]
  | DescribeKey [@ocaml.doc ""]
  | RetireGrant [@ocaml.doc ""]
  | CreateGrant [@ocaml.doc ""]
  | GetPublicKey [@ocaml.doc ""]
  | Verify [@ocaml.doc ""]
  | Sign [@ocaml.doc ""]
  | ReEncryptTo [@ocaml.doc ""]
  | ReEncryptFrom [@ocaml.doc ""]
  | GenerateDataKeyWithoutPlaintext [@ocaml.doc ""]
  | GenerateDataKey [@ocaml.doc ""]
  | Encrypt [@ocaml.doc ""]
  | Decrypt [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec grant_operation_list = grant_operation list[@@ocaml.doc ""]
type nonrec grant_constraints =
  {
  encryption_context_equals: encryption_context_type option
    [@ocaml.doc
      "A list of key-value pairs that must match the encryption context in the {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operation} request. The grant allows the operation only when the encryption context in the request is the same as the encryption context specified in this constraint.\n"];
  encryption_context_subset: encryption_context_type option
    [@ocaml.doc
      "A list of key-value pairs that must be included in the encryption context of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operation} request. The grant allows the cryptographic operation only when the encryption context in the request includes the key-value pairs specified in this constraint, although it can include additional key-value pairs.\n"]}
[@@ocaml.doc
  "Use this structure to allow {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations} in the grant only when the operation request includes the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}encryption context}. \n\n KMS applies the grant constraints only to cryptographic operations that support an encryption context, that is, all cryptographic operations with a symmetric KMS key. Grant constraints are not applied to operations that do not support an encryption context, such as cryptographic operations with asymmetric KMS keys and management operations, such as [DescribeKey] or [RetireGrant].\n \n   In a cryptographic operation, the encryption context in the decryption operation must be an exact, case-sensitive match for the keys and values in the encryption context of the encryption operation. Only the order of the pairs can vary.\n   \n    However, in a grant constraint, the key in each key-value pair is not case sensitive, but the value is case sensitive.\n    \n     To avoid confusion, do not use multiple encryption context pairs that differ only by case. To require a fully case-sensitive encryption context, use the [kms:EncryptionContext:] and [kms:EncryptionContextKeys] conditions in an IAM or key policy. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-encryption-context}kms:EncryptionContext:context-key} in the {i  {i Key Management Service Developer Guide} }.\n     \n      "]
type nonrec grant_list_entry =
  {
  constraints: grant_constraints option
    [@ocaml.doc
      "A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows.\n"];
  operations: grant_operation_list option
    [@ocaml.doc "The list of operations permitted by the grant.\n"];
  issuing_account: principal_id_type option
    [@ocaml.doc
      "The Amazon Web Services account under which the grant was issued.\n"];
  retiring_principal: principal_id_type option
    [@ocaml.doc "The principal that can retire the grant.\n"];
  grantee_principal: principal_id_type option
    [@ocaml.doc
      "The identity that gets the permissions in the grant.\n\n The [GranteePrincipal] field in the [ListGrants] response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the [GranteePrincipal] field contains the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services}service principal}, which might represent several different grantee principals.\n "];
  creation_date: date_type option
    [@ocaml.doc "The date and time when the grant was created.\n"];
  name: grant_name_type option
    [@ocaml.doc
      "The friendly name that identifies the grant. If a name was provided in the [CreateGrant] request, that name is returned. Otherwise this value is null.\n"];
  grant_id: grant_id_type option
    [@ocaml.doc "The unique identifier for the grant.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The unique identifier for the KMS key to which the grant applies.\n"]}
[@@ocaml.doc "Contains information about a grant.\n"]
type nonrec grant_list = grant_list_entry list[@@ocaml.doc ""]
type nonrec marker_type = string[@@ocaml.doc ""]
type nonrec list_grants_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  grants: grant_list option [@ocaml.doc "A list of grants.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec limit_type = int[@@ocaml.doc ""]
type nonrec list_retirable_grants_request =
  {
  retiring_principal: principal_id_type
    [@ocaml.doc
      "The retiring principal for which to list grants. Enter a principal in your Amazon Web Services account.\n\n To specify the retiring principal, use the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i  {i Identity and Access Management User Guide} }.\n "];
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.\n "]}
[@@ocaml.doc ""]
type nonrec list_resource_tags_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n\n Do not assume or infer any information from this value.\n "];
  tags: tag_list option
    [@ocaml.doc
      "A list of tags. Each tag consists of a tag key and a tag value.\n\n  Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec list_resource_tags_request =
  {
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n\n Do not attempt to construct this value. Use only the value of [NextMarker] from the truncated response you just received.\n "];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Gets tags on the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec key_list_entry =
  {
  key_arn: arn_type option [@ocaml.doc "ARN of the key.\n"];
  key_id: key_id_type option [@ocaml.doc "Unique identifier of the key.\n"]}
[@@ocaml.doc "Contains information about each entry in the key list.\n"]
type nonrec key_list = key_list_entry list[@@ocaml.doc ""]
type nonrec list_keys_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  keys: key_list option [@ocaml.doc "A list of KMS keys.\n"]}[@@ocaml.doc ""]
type nonrec list_keys_request =
  {
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.\n "]}
[@@ocaml.doc ""]
type nonrec key_material_description_type = string[@@ocaml.doc ""]
type nonrec import_state =
  | PENDING_IMPORT [@ocaml.doc ""]
  | IMPORTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec key_material_state =
  | PENDING_ROTATION [@ocaml.doc ""]
  | CURRENT [@ocaml.doc ""]
  | NON_CURRENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec rotation_type =
  | ON_DEMAND [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec rotations_list_entry =
  {
  rotation_type: rotation_type option
    [@ocaml.doc
      "Identifies whether the key material rotation was a scheduled {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-enable-disable.html}automatic rotation} or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-on-demand.html}on-demand rotation}. This field is not present for the first key material or an imported key material in [PENDING_ROTATION] state.\n"];
  rotation_date: date_type option
    [@ocaml.doc
      "Date and time that the key material rotation completed. Formatted as Unix time. This field is not present for the first key material or an imported key material in [PENDING_ROTATION] state.\n"];
  valid_to: date_type option
    [@ocaml.doc
      "Date and time at which the key material expires. This field is only present for symmetric encryption KMS keys with [EXTERNAL] origin in rotation list entries with an [ExpirationModel] value of [KEY_MATERIAL_EXPIRES].\n"];
  expiration_model: expiration_model_type option
    [@ocaml.doc
      "Indicates if the key material is configured to automatically expire. There are two possible values for this field: [KEY_MATERIAL_EXPIRES] and [KEY_MATERIAL_DOES_NOT_EXPIRE]. For any key material that expires, the expiration date and time is indicated in [ValidTo]. This field is only present for symmetric encryption KMS keys with [EXTERNAL] origin.\n"];
  key_material_state: key_material_state option
    [@ocaml.doc
      "There are three possible values for this field: [CURRENT], [NON_CURRENT] and [PENDING_ROTATION]. KMS uses [CURRENT] key material for both encryption and decryption and [NON_CURRENT] key material only for decryption. [PENDING_ROTATION] identifies key material that has been imported for on-demand key rotation but the rotation hasn't completed. Key material in [PENDING_ROTATION] is not permanently associated with the KMS key. You can delete this key material and import different key material in its place. The [PENDING_ROTATION] value is only used in symmetric encryption keys with imported key material. The other values, [CURRENT] and [NON_CURRENT], are used for all KMS keys that support automatic or on-demand key rotation.\n"];
  import_state: import_state option
    [@ocaml.doc
      "Indicates if the key material is currently imported into KMS. It has two possible values: [IMPORTED] or [PENDING_IMPORT]. This field is only present for symmetric encryption KMS keys with [EXTERNAL] origin.\n"];
  key_material_description: key_material_description_type option
    [@ocaml.doc
      "User-specified description of the key material. This field is only present for symmetric encryption KMS keys with [EXTERNAL] origin.\n"];
  key_material_id: backing_key_id_type option
    [@ocaml.doc "Unique identifier of the key material. \n"];
  key_id: key_id_type option [@ocaml.doc "Unique identifier of the key.\n"]}
[@@ocaml.doc
  "Each entry contains information about one of the key materials associated with a KMS key.\n"]
type nonrec rotations_list = rotations_list_entry list[@@ocaml.doc ""]
type nonrec list_key_rotations_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  rotations: rotations_list option
    [@ocaml.doc
      "A list of completed key material rotations. When the optional input parameter [IncludeKeyMaterial] is specified with a value of [ALL_KEY_MATERIAL], this list includes the first key material and any imported key material pending rotation.\n"]}
[@@ocaml.doc ""]
type nonrec include_key_material =
  | ROTATIONS_ONLY [@ocaml.doc ""]
  | ALL_KEY_MATERIAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_key_rotations_request =
  {
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.\n "];
  include_key_material: include_key_material option
    [@ocaml.doc
      "Use this optional parameter to control which key materials associated with this key are listed in the response. The default value of this parameter is [ROTATIONS_ONLY]. If you omit this parameter, KMS returns information on the key materials created by automatic or on-demand key rotation. When you specify a value of [ALL_KEY_MATERIAL], KMS adds the first key material and any imported key material pending rotation to the response. This parameter can only be used with KMS keys that support automatic or on-demand key rotation. \n"];
  key_id: key_id_type
    [@ocaml.doc
      "Gets the key rotations for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec policy_name_list = policy_name_type list[@@ocaml.doc ""]
type nonrec list_key_policies_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  policy_names: policy_name_list option
    [@ocaml.doc
      "A list of key policy names. The only valid value is [default].\n"]}
[@@ocaml.doc ""]
type nonrec list_key_policies_request =
  {
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.\n \n  Only one policy can be attached to a key.\n  "];
  key_id: key_id_type
    [@ocaml.doc
      "Gets the names of key policies for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec list_grants_request =
  {
  grantee_principal: principal_id_type option
    [@ocaml.doc
      "Returns only grants where the specified principal is the grantee principal for the grant.\n"];
  grant_id: grant_id_type option
    [@ocaml.doc
      "Returns only the grant with the specified grant ID. The grant ID uniquely identifies the grant. \n"];
  key_id: key_id_type
    [@ocaml.doc
      "Returns only grants for the specified KMS key. This parameter is required.\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "];
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.\n "]}
[@@ocaml.doc ""]
type nonrec alias_list_entry =
  {
  last_updated_date: date_type option
    [@ocaml.doc
      "Date and time that the alias was most recently associated with a KMS key in the account and Region. Formatted as Unix time.\n"];
  creation_date: date_type option
    [@ocaml.doc
      "Date and time that the alias was most recently created in the account and Region. Formatted as Unix time.\n"];
  target_key_id: key_id_type option
    [@ocaml.doc
      "String that contains the key identifier of the KMS key associated with the alias.\n"];
  alias_arn: arn_type option
    [@ocaml.doc "String that contains the key ARN.\n"];
  alias_name: alias_name_type option
    [@ocaml.doc
      "String that contains the alias. This value begins with [alias/].\n"]}
[@@ocaml.doc "Contains information about an alias.\n"]
type nonrec alias_list = alias_list_entry list[@@ocaml.doc ""]
type nonrec list_aliases_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  aliases: alias_list option [@ocaml.doc "A list of aliases.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec list_aliases_request =
  {
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.\n "];
  key_id: key_id_type option
    [@ocaml.doc
      "Lists only aliases that are associated with the specified KMS key. Enter a KMS key in your Amazon Web Services account. \n\n This parameter is optional. If you omit it, [ListAliases] returns all aliases in the account and Region.\n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_import_token_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the provided import token is invalid or is associated with a different KMS key.\n"]
type nonrec incorrect_key_material_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the key material in the request is, expired, invalid, or does not meet expectations. For example, it is not the same key material that was previously imported or KMS expected new key material but the key material being imported is already associated with the KMS key.\n"]
type nonrec expired_import_token_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified import token is expired. Use [GetParametersForImport] to get a new import token and public key, use the new public key to encrypt the key material, and then try the request again.\n"]
type nonrec import_key_material_response =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc "Identifies the imported key material.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key into which key material was imported.\n"]}
[@@ocaml.doc ""]
type nonrec import_type =
  | EXISTING_KEY_MATERIAL [@ocaml.doc ""]
  | NEW_KEY_MATERIAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec import_key_material_request =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "Identifies the key material being imported. This parameter is optional and only usable with symmetric encryption keys. You cannot specify a key material ID with [ImportType] set to [NEW_KEY_MATERIAL]. Whenever you import key material into a symmetric encryption key, KMS assigns a unique identifier to the key material based on the KMS key ID and the imported key material. When you re-import key material with a specified key material ID, KMS:\n\n {ul\n       {-  Computes the identifier for the key material\n           \n            }\n       {-  Matches the computed identifier against the specified key material ID\n           \n            }\n       {-  Verifies that the key material ID is already associated with the KMS key\n           \n            }\n       }\n   To get the list of key material IDs associated with a KMS key, use [ListKeyRotations].\n   "];
  key_material_description: key_material_description_type option
    [@ocaml.doc
      "Description for the key material being imported. This parameter is optional and only usable with symmetric encryption keys. If you do not specify a key material description, KMS retains the value you specified when you last imported the same key material into this KMS key.\n"];
  import_type: import_type option
    [@ocaml.doc
      "Indicates whether the key material being imported is previously associated with this KMS key or not. This parameter is optional and only usable with symmetric encryption keys. If no key material has ever been imported into the KMS key, and this parameter is omitted, the parameter defaults to [NEW_KEY_MATERIAL]. After the first key material is imported, if this parameter is omitted then the parameter defaults to [EXISTING_KEY_MATERIAL].\n"];
  expiration_model: expiration_model_type option
    [@ocaml.doc
      "Specifies whether the key material expires. The default is [KEY_MATERIAL_EXPIRES]. For help with this choice, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html#importing-keys-expiration}Setting an expiration time} in the {i Key Management Service Developer Guide}.\n\n When the value of [ExpirationModel] is [KEY_MATERIAL_EXPIRES], you must specify a value for the [ValidTo] parameter. When value is [KEY_MATERIAL_DOES_NOT_EXPIRE], you must omit the [ValidTo] parameter.\n \n  You cannot change the [ExpirationModel] or [ValidTo] values for the current import after the request completes. To change either value, you must reimport the key material.\n  "];
  valid_to: date_type option
    [@ocaml.doc
      "The date and time when the imported key material expires. This parameter is required when the value of the [ExpirationModel] parameter is [KEY_MATERIAL_EXPIRES]. Otherwise it is not valid.\n\n The value of this parameter must be a future date and time. The maximum value is 365 days from the request date.\n \n  When the key material expires, KMS deletes the key material from the KMS key. Without its key material, the KMS key is unusable. To use the KMS key in cryptographic operations, you must reimport the same key material.\n  \n   You cannot change the [ExpirationModel] or [ValidTo] values for the current import after the request completes. To change either value, you must delete ([DeleteImportedKeyMaterial]) and reimport the key material.\n   "];
  encrypted_key_material: ciphertext_type
    [@ocaml.doc
      "The encrypted key material to import. The key material must be encrypted under the public wrapping key that [GetParametersForImport] returned, using the wrapping algorithm that you specified in the same [GetParametersForImport] request.\n"];
  import_token: ciphertext_type
    [@ocaml.doc
      "The import token that you received in the response to a previous [GetParametersForImport] request. It must be from the same response that contained the public key that you used to encrypt the key material.\n"];
  key_id: key_id_type
    [@ocaml.doc
      "The identifier of the KMS key that will be associated with the imported key material. This must be the same KMS key specified in the [KeyID] parameter of the corresponding [GetParametersForImport] request. The [Origin] of the KMS key must be [EXTERNAL] and its [KeyState] must be [PendingImport]. \n\n The KMS key can be a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key, including a {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. You cannot perform this operation on a KMS key in a custom key store, or on a KMS key in a different Amazon Web Services account.\n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec public_key_type = bytes[@@ocaml.doc ""]
type nonrec get_public_key_response =
  {
  key_agreement_algorithms: key_agreement_algorithm_spec_list option
    [@ocaml.doc
      "The key agreement algorithm used to derive a shared secret. This field is present only when the KMS key has a [KeyUsage] value of [KEY_AGREEMENT].\n"];
  signing_algorithms: signing_algorithm_spec_list option
    [@ocaml.doc
      "The signing algorithms that KMS supports for this key.\n\n This field appears in the response only when the [KeyUsage] of the public key is [SIGN_VERIFY].\n "];
  encryption_algorithms: encryption_algorithm_spec_list option
    [@ocaml.doc
      "The encryption algorithms that KMS supports for this key. \n\n This information is critical. If a public key encrypts data outside of KMS by using an unsupported encryption algorithm, the ciphertext cannot be decrypted. \n \n  This field appears in the response only when the [KeyUsage] of the public key is [ENCRYPT_DECRYPT].\n  "];
  key_usage: key_usage_type option
    [@ocaml.doc
      "The permitted use of the public key. Valid values for asymmetric key pairs are [ENCRYPT_DECRYPT], [SIGN_VERIFY], and [KEY_AGREEMENT]. \n\n This information is critical. For example, if a public key with [SIGN_VERIFY] key usage encrypts data outside of KMS, the ciphertext cannot be decrypted. \n "];
  key_spec: key_spec option
    [@ocaml.doc "The type of the of the public key that was downloaded.\n"];
  customer_master_key_spec: customer_master_key_spec option
    [@ocaml.doc
      "Instead, use the [KeySpec] field in the [GetPublicKey] response.\n\n The [KeySpec] and [CustomerMasterKeySpec] fields have the same value. We recommend that you use the [KeySpec] field in your code. However, to avoid breaking changes, KMS supports both fields.\n "];
  public_key: public_key_type option
    [@ocaml.doc
      "The exported public key. \n\n The value is a DER-encoded X.509 public key, also known as [SubjectPublicKeyInfo] (SPKI), as defined in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n \n  \n  "];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key from which the public key was downloaded.\n"]}
[@@ocaml.doc ""]
type nonrec get_public_key_request =
  {
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the asymmetric KMS key that includes the public key.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec get_parameters_for_import_response =
  {
  parameters_valid_to: date_type option
    [@ocaml.doc
      "The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an [ImportKeyMaterial] request and you must send another [GetParametersForImport] request to get new ones.\n"];
  public_key: plaintext_type option
    [@ocaml.doc
      "The public key to use to encrypt the key material before importing it with [ImportKeyMaterial].\n"];
  import_token: ciphertext_type option
    [@ocaml.doc
      "The import token to send in a subsequent [ImportKeyMaterial] request.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key to use in a subsequent [ImportKeyMaterial] request. This is the same KMS key specified in the [GetParametersForImport] request.\n"]}
[@@ocaml.doc ""]
type nonrec algorithm_spec =
  | SM2PKE [@ocaml.doc ""]
  | RSA_AES_KEY_WRAP_SHA_256 [@ocaml.doc ""]
  | RSA_AES_KEY_WRAP_SHA_1 [@ocaml.doc ""]
  | RSAES_OAEP_SHA_256 [@ocaml.doc ""]
  | RSAES_OAEP_SHA_1 [@ocaml.doc ""]
  | RSAES_PKCS1_V1_5 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_parameters_for_import_request =
  {
  wrapping_key_spec: wrapping_key_spec
    [@ocaml.doc
      "The type of RSA public key to return in the response. You will use this wrapping key with the specified wrapping algorithm to protect your key material during import. \n\n Use the longest RSA wrapping key that is practical. \n \n  You cannot use an RSA_2048 public key to directly wrap an ECC_NIST_P521 private key. Instead, use an RSA_AES wrapping algorithm or choose a longer RSA public key.\n  "];
  wrapping_algorithm: algorithm_spec
    [@ocaml.doc
      "The algorithm you will use with the RSA public key ([PublicKey]) in the response to protect your key material during import. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-get-public-key-and-token.html#select-wrapping-algorithm}Select a wrapping algorithm} in the {i Key Management Service Developer Guide}.\n\n For RSA_AES wrapping algorithms, you encrypt your key material with an AES key that you generate, then encrypt your AES key with the RSA public key from KMS. For RSAES wrapping algorithms, you encrypt your key material directly with the RSA public key from KMS.\n \n  The wrapping algorithms that you can use depend on the type of key material that you are importing. To import an RSA private key, you must use an RSA_AES wrapping algorithm.\n  \n   {ul\n         {-   {b RSA_AES_KEY_WRAP_SHA_256} \226\128\148 Supported for wrapping RSA and ECC key material.\n             \n              }\n         {-   {b RSA_AES_KEY_WRAP_SHA_1} \226\128\148 Supported for wrapping RSA and ECC key material.\n             \n              }\n         {-   {b RSAES_OAEP_SHA_256} \226\128\148 Supported for all types of key material, except RSA key material (private key).\n             \n              You cannot use the RSAES_OAEP_SHA_256 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.\n              \n               }\n         {-   {b RSAES_OAEP_SHA_1} \226\128\148 Supported for all types of key material, except RSA key material (private key).\n             \n              You cannot use the RSAES_OAEP_SHA_1 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.\n              \n               }\n         {-   {b RSAES_PKCS1_V1_5} (Deprecated) \226\128\148 As of October 10, 2023, KMS does not support the RSAES_PKCS1_V1_5 wrapping algorithm.\n             \n              }\n         }\n  "];
  key_id: key_id_type
    [@ocaml.doc
      "The identifier of the KMS key that will be associated with the imported key material. The [Origin] of the KMS key must be [EXTERNAL].\n\n All KMS key types are supported, including multi-Region keys. However, you cannot import key material into a KMS key in a custom key store.\n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec rotation_period_in_days_type = int[@@ocaml.doc ""]
type nonrec get_key_rotation_status_response =
  {
  on_demand_rotation_start_date: date_type option
    [@ocaml.doc
      "Identifies the date and time that an in progress on-demand rotation was initiated.\n\n KMS uses a background process to perform rotations. As a result, there might be a slight delay between initiating on-demand key rotation and the rotation's completion. Once the on-demand rotation is complete, KMS removes this field from the response. You can use [ListKeyRotations] to view the details of the completed on-demand rotation.\n "];
  next_rotation_date: date_type option
    [@ocaml.doc
      "The next date that KMS will automatically rotate the key material.\n"];
  rotation_period_in_days: rotation_period_in_days_type option
    [@ocaml.doc
      "The number of days between each automatic rotation. The default value is 365 days.\n"];
  key_id: key_id_type option
    [@ocaml.doc "Identifies the specified symmetric encryption KMS key.\n"];
  key_rotation_enabled: boolean_type option
    [@ocaml.doc
      "A Boolean value that specifies whether key rotation is enabled.\n"]}
[@@ocaml.doc ""]
type nonrec get_key_rotation_status_request =
  {
  key_id: key_id_type
    [@ocaml.doc
      "Gets the rotation status for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec get_key_policy_response =
  {
  policy_name: policy_name_type option
    [@ocaml.doc
      "The name of the key policy. The only valid value is [default].\n"];
  policy: policy_type option
    [@ocaml.doc "A key policy document in JSON format.\n"]}[@@ocaml.doc ""]
type nonrec get_key_policy_request =
  {
  policy_name: policy_name_type option
    [@ocaml.doc
      "Specifies the name of the key policy. If no policy name is specified, the default value is [default]. The only valid name is [default]. To get the names of key policies, use [ListKeyPolicies].\n"];
  key_id: key_id_type
    [@ocaml.doc
      "Gets the key policy for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec generate_random_response =
  {
  ciphertext_for_recipient: ciphertext_type option
    [@ocaml.doc
      "The plaintext random bytes encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  plaintext: plaintext_type option
    [@ocaml.doc
      "The random byte string. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n\n If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.\n "]}
[@@ocaml.doc ""]
type nonrec number_of_bytes_type = int[@@ocaml.doc ""]
type nonrec key_encryption_mechanism =
  | RSAES_OAEP_SHA_256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attestation_document_type = bytes[@@ocaml.doc ""]
type nonrec recipient_info =
  {
  attestation_document: attestation_document_type option
    [@ocaml.doc
      "The attestation document for an Amazon Web Services Nitro Enclave. This document includes the enclave's public key.\n"];
  key_encryption_algorithm: key_encryption_mechanism option
    [@ocaml.doc
      "The encryption algorithm that KMS should use with the public key for an Amazon Web Services Nitro Enclave to encrypt plaintext values for the response. The only valid value is [RSAES_OAEP_SHA_256].\n"]}
[@@ocaml.doc
  "Contains information about the party that receives the response from the API operation.\n\n This data type is designed to support Amazon Web Services Nitro Enclaves, which lets you create an isolated compute environment in Amazon EC2. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "]
type nonrec generate_random_request =
  {
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.\n \n  When you use this parameter, instead of returning plaintext bytes, KMS encrypts the plaintext bytes under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [Plaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  custom_key_store_id: custom_key_store_id_type option
    [@ocaml.doc
      "Generates the random byte string in the CloudHSM cluster that is associated with the specified CloudHSM key store. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n\n External key store IDs are not valid for this parameter. If you specify the ID of an external key store, [GenerateRandom] throws an [UnsupportedOperationException].\n "];
  number_of_bytes: number_of_bytes_type option
    [@ocaml.doc
      "The length of the random byte string. This parameter is required.\n"]}
[@@ocaml.doc ""]
type nonrec generate_mac_response =
  {
  key_id: key_id_type option
    [@ocaml.doc "The HMAC KMS key used in the operation.\n"];
  mac_algorithm: mac_algorithm_spec option
    [@ocaml.doc "The MAC algorithm that was used to generate the HMAC.\n"];
  mac: ciphertext_type option
    [@ocaml.doc
      "The hash-based message authentication code (HMAC) that was generated for the specified message, HMAC KMS key, and MAC algorithm.\n\n This is the standard, raw HMAC defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.\n "]}
[@@ocaml.doc ""]
type nonrec generate_mac_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  mac_algorithm: mac_algorithm_spec
    [@ocaml.doc
      "The MAC algorithm used in the operation.\n\n  The algorithm must be compatible with the HMAC KMS key that you specify. To find the MAC algorithms that your HMAC KMS key supports, use the [DescribeKey] operation and see the [MacAlgorithms] field in the [DescribeKey] response.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "The HMAC KMS key to use in the operation. The MAC algorithm computes the HMAC for the message and the key as described in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.\n\n To identify an HMAC KMS key, use the [DescribeKey] operation and see the [KeySpec] field in the response.\n "];
  message: plaintext_type
    [@ocaml.doc
      "The message to be hashed. Specify a message of up to 4,096 bytes. \n\n  [GenerateMac] and [VerifyMac] do not provide special handling for message digests. If you generate an HMAC for a hash digest of a message, you must verify the HMAC of the same hash digest.\n "]}
[@@ocaml.doc ""]
type nonrec generate_data_key_without_plaintext_response =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to encrypt the data key.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the data key.\n"];
  ciphertext_blob: ciphertext_type option
    [@ocaml.doc
      "The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec data_key_spec =
  | AES_128 [@ocaml.doc ""]
  | AES_256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec generate_data_key_without_plaintext_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  number_of_bytes: number_of_bytes_type option
    [@ocaml.doc
      "The length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the [KeySpec] field instead of this one.\n"];
  key_spec: data_key_spec option
    [@ocaml.doc
      "The length of the data key. Use [AES_128] to generate a 128-bit symmetric key, or [AES_256] to generate a 256-bit symmetric key.\n"];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the data key.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n     "];
  key_id: key_id_type
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec data_key_pair_spec =
  | SM2 [@ocaml.doc ""]
  | ECC_SECG_P256K1 [@ocaml.doc ""]
  | ECC_NIST_P521 [@ocaml.doc ""]
  | ECC_NIST_P384 [@ocaml.doc ""]
  | ECC_NIST_P256 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec generate_data_key_pair_without_plaintext_response =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to encrypt the private key.\n"];
  key_pair_spec: data_key_pair_spec option
    [@ocaml.doc "The type of data key pair that was generated.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the private key.\n"];
  public_key: public_key_type option
    [@ocaml.doc
      "The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"];
  private_key_ciphertext_blob: ciphertext_type option
    [@ocaml.doc
      "The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec generate_data_key_pair_without_plaintext_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_pair_spec: data_key_pair_spec
    [@ocaml.doc
      "Determines the type of data key pair that is generated.\n\n The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), the rule that permits you to use ECC KMS keys only to sign and verify, and the rule that permits you to use ML-DSA key pairs to sign and verify only are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation. \n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the private key in the data key pair.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n     "]}
[@@ocaml.doc ""]
type nonrec generate_data_key_pair_response =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to encrypt the private key.\n"];
  ciphertext_for_recipient: ciphertext_type option
    [@ocaml.doc
      "The plaintext private data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  key_pair_spec: data_key_pair_spec option
    [@ocaml.doc "The type of data key pair that was generated.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the private key.\n"];
  public_key: public_key_type option
    [@ocaml.doc
      "The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"];
  private_key_plaintext: plaintext_type option
    [@ocaml.doc
      "The plaintext copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n\n If the response includes the [CiphertextForRecipient] field, the [PrivateKeyPlaintext] field is null or empty.\n "];
  private_key_ciphertext_blob: ciphertext_type option
    [@ocaml.doc
      "The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec generate_data_key_pair_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To call DeriveSharedSecret for an Amazon Web Services Nitro Enclaves, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} to generate the attestation document and then use the Recipient parameter from any Amazon Web Services SDK to provide the attestation document for the enclave.\n \n  When you use this parameter, instead of returning a plaintext copy of the private data key, KMS encrypts the plaintext private data key under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains a copy of the private data key encrypted under the KMS key specified by the [KeyId] parameter. The [PrivateKeyPlaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_pair_spec: data_key_pair_spec
    [@ocaml.doc
      "Determines the type of data key pair that is generated. \n\n The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), the rule that permits you to use ECC KMS keys only to sign and verify, and the rule that permits you to use ML-DSA key pairs to sign and verify only are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the private key in the data key pair.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n     "]}
[@@ocaml.doc ""]
type nonrec generate_data_key_response =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to encrypt the data key. This field is omitted if the request includes the [Recipient] parameter.\n"];
  ciphertext_for_recipient: ciphertext_type option
    [@ocaml.doc
      "The plaintext data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the data key.\n"];
  plaintext: plaintext_type option
    [@ocaml.doc
      "The plaintext data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to encrypt your data outside of KMS. Then, remove it from memory as soon as possible.\n\n If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.\n "];
  ciphertext_blob: ciphertext_type option
    [@ocaml.doc
      "The encrypted copy of the data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec generate_data_key_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.\n \n  When you use this parameter, instead of returning the plaintext data key, KMS encrypts the plaintext data key under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains a copy of the data key encrypted under the KMS key specified by the [KeyId] parameter. The [Plaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_spec: data_key_spec option
    [@ocaml.doc
      "Specifies the length of the data key. Use [AES_128] to generate a 128-bit symmetric key, or [AES_256] to generate a 256-bit symmetric key.\n\n You must specify either the [KeySpec] or the [NumberOfBytes] parameter (but not both) in every [GenerateDataKey] request.\n "];
  number_of_bytes: number_of_bytes_type option
    [@ocaml.doc
      "Specifies the length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For 128-bit (16-byte) and 256-bit (32-byte) data keys, use the [KeySpec] parameter.\n\n You must specify either the [KeySpec] or the [NumberOfBytes] parameter (but not both) in every [GenerateDataKey] request.\n "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the data key.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n     "];
  key_id: key_id_type
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec encrypt_response =
  {
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to encrypt the plaintext.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to encrypt the plaintext.\n"];
  ciphertext_blob: ciphertext_type option
    [@ocaml.doc
      "The encrypted plaintext. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec encrypt_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that KMS will use to encrypt the plaintext message. The algorithm must be compatible with the KMS key that you specify.\n\n This parameter is required only for asymmetric KMS keys. The default value, [SYMMETRIC_DEFAULT], is the algorithm used for symmetric encryption KMS keys. If you are using an asymmetric KMS key, we recommend RSAES_OAEP_SHA_256.\n \n  The SM2PKE algorithm is only available in China Regions.\n  "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used to encrypt the data. An encryption context is valid only for {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations} with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context. \n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n     "];
  plaintext: plaintext_type [@ocaml.doc "Data to be encrypted.\n"];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key to use in the encryption operation. The KMS key must have a [KeyUsage] of [ENCRYPT_DECRYPT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec enable_key_rotation_request =
  {
  rotation_period_in_days: rotation_period_in_days_type option
    [@ocaml.doc
      "Use this parameter to specify a custom period of time between each rotation date. If no value is specified, the default value is 365 days.\n\n The rotation period defines the number of days after you enable automatic key rotation that KMS will rotate your key material, and the number of days between each automatic rotation thereafter.\n \n  You can use the {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-rotation-period-in-days} [kms:RotationPeriodInDays] } condition key to further constrain the values that principals can specify in the [RotationPeriodInDays] parameter.\n  \n    \n   "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies a symmetric encryption KMS key. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec enable_key_request =
  {
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key to enable.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec disconnect_custom_key_store_response = unit[@@ocaml.doc ""]
type nonrec disconnect_custom_key_store_request =
  {
  custom_key_store_id: custom_key_store_id_type
    [@ocaml.doc
      "Enter the ID of the custom key store you want to disconnect. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec disable_key_rotation_request =
  {
  key_id: key_id_type
    [@ocaml.doc
      "Identifies a symmetric encryption KMS key. You cannot enable or disable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec disable_key_request =
  {
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key to disable.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec describe_key_response =
  {
  key_metadata: key_metadata option
    [@ocaml.doc "Metadata associated with the key.\n"]}[@@ocaml.doc ""]
type nonrec describe_key_request =
  {
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Describes the specified KMS key. \n\n If you specify a predefined Amazon Web Services alias (an Amazon Web Services alias with no key ID), KMS associates the alias with an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html##aws-managed-cmk}Amazon Web Services managed key} and returns its [KeyId] and [Arn] in the response.\n \n  To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Alias name: [alias/ExampleAlias] \n              \n               }\n          {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec connection_state_type =
  | DISCONNECTING [@ocaml.doc ""]
  | DISCONNECTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CONNECTING [@ocaml.doc ""]
  | CONNECTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec connection_error_code_type =
  | XKS_PROXY_INVALID_TLS_CONFIGURATION [@ocaml.doc ""]
  | XKS_PROXY_TIMED_OUT [@ocaml.doc ""]
  | XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION [@ocaml.doc ""]
  | XKS_PROXY_INVALID_CONFIGURATION [@ocaml.doc ""]
  | XKS_PROXY_INVALID_RESPONSE [@ocaml.doc ""]
  | XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND [@ocaml.doc ""]
  | XKS_PROXY_NOT_REACHABLE [@ocaml.doc ""]
  | XKS_PROXY_ACCESS_DENIED [@ocaml.doc ""]
  | INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET [@ocaml.doc ""]
  | SUBNET_NOT_FOUND [@ocaml.doc ""]
  | USER_LOGGED_IN [@ocaml.doc ""]
  | USER_NOT_FOUND [@ocaml.doc ""]
  | USER_LOCKED_OUT [@ocaml.doc ""]
  | INSUFFICIENT_CLOUDHSM_HSMS [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
  | NETWORK_ERRORS [@ocaml.doc ""]
  | CLUSTER_NOT_FOUND [@ocaml.doc ""]
  | INVALID_CREDENTIALS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec custom_key_store_type =
  | EXTERNAL_KEY_STORE [@ocaml.doc ""]
  | AWS_CLOUDHSM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec custom_key_stores_list_entry =
  {
  xks_proxy_configuration: xks_proxy_configuration_type option
    [@ocaml.doc
      "Configuration settings for the external key store proxy (XKS proxy). The external key store proxy translates KMS requests into a format that your external key manager can understand. The proxy configuration includes connection information that KMS requires.\n\n This field appears only when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE].\n "];
  custom_key_store_type: custom_key_store_type option
    [@ocaml.doc
      "Indicates the type of the custom key store. [AWS_CLOUDHSM] indicates a custom key store backed by an CloudHSM cluster. [EXTERNAL_KEY_STORE] indicates a custom key store backed by an external key store proxy and external key manager outside of Amazon Web Services.\n"];
  creation_date: date_type option
    [@ocaml.doc "The date and time when the custom key store was created.\n"];
  connection_error_code: connection_error_code_type option
    [@ocaml.doc
      "Describes the connection error. This field appears in the response only when the [ConnectionState] is [FAILED].\n\n Many failures can be resolved by updating the properties of the custom key store. To update a custom key store, disconnect it ([DisconnectCustomKeyStore]), correct the errors ([UpdateCustomKeyStore]), and try to connect again ([ConnectCustomKeyStore]). For additional help resolving these errors, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in {i Key Management Service Developer Guide}.\n \n   {b All custom key stores:} \n  \n   {ul\n         {-   [INTERNAL_ERROR] \226\128\148 KMS could not complete the request due to an internal error. Retry the request. For [ConnectCustomKeyStore] requests, disconnect the custom key store before trying to connect again.\n             \n              }\n         {-   [NETWORK_ERRORS] \226\128\148 Network errors are preventing KMS from connecting the custom key store to its backing key store.\n             \n              }\n         }\n    {b CloudHSM key stores:} \n   \n    {ul\n          {-   [CLUSTER_NOT_FOUND] \226\128\148 KMS cannot find the CloudHSM cluster with the specified cluster ID.\n              \n               }\n          {-   [INSUFFICIENT_CLOUDHSM_HSMS] \226\128\148 The associated CloudHSM cluster does not contain any active HSMs. To connect a custom key store to its CloudHSM cluster, the cluster must contain at least one active HSM.\n              \n               }\n          {-   [INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET] \226\128\148 At least one private subnet associated with the CloudHSM cluster doesn't have any available IP addresses. A CloudHSM key store connection requires one free IP address in each of the associated private subnets, although two are preferable. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-   [INVALID_CREDENTIALS] \226\128\148 The [KeyStorePassword] for the custom key store doesn't match the current password of the [kmsuser] crypto user in the CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must change the [kmsuser] account password and update the [KeyStorePassword] value for the custom key store.\n              \n               }\n          {-   [SUBNET_NOT_FOUND] \226\128\148 A subnet in the CloudHSM cluster configuration was deleted. If KMS cannot find all of the subnets in the cluster configuration, attempts to connect the custom key store to the CloudHSM cluster fail. To fix this error, create a cluster from a recent backup and associate it with your custom key store. (This process creates a new cluster configuration with a VPC and private subnets.) For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-   [USER_LOCKED_OUT] \226\128\148 The [kmsuser] CU account is locked out of the associated CloudHSM cluster due to too many failed password attempts. Before you can connect your custom key store to its CloudHSM cluster, you must change the [kmsuser] account password and update the key store password value for the custom key store.\n              \n               }\n          {-   [USER_LOGGED_IN] \226\128\148 The [kmsuser] CU account is logged into the associated CloudHSM cluster. This prevents KMS from rotating the [kmsuser] account password and logging into the cluster. Before you can connect your custom key store to its CloudHSM cluster, you must log the [kmsuser] CU out of the cluster. If you changed the [kmsuser] password to log into the cluster, you must also and update the key store password value for the custom key store. For help, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2}How to Log Out and Reconnect} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-   [USER_NOT_FOUND] \226\128\148 KMS cannot find a [kmsuser] CU account in the associated CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must create a [kmsuser] CU account in the cluster, and then update the key store password value for the custom key store.\n              \n               }\n          }\n    {b External key stores:} \n   \n    {ul\n          {-   [INVALID_CREDENTIALS] \226\128\148 One or both of the [XksProxyAuthenticationCredential] values is not valid on the specified external key store proxy.\n              \n               }\n          {-   [XKS_PROXY_ACCESS_DENIED] \226\128\148 KMS requests are denied access to the external key store proxy. If the external key store proxy has authorization rules, verify that they permit KMS to communicate with the proxy on your behalf.\n              \n               }\n          {-   [XKS_PROXY_INVALID_CONFIGURATION] \226\128\148 A configuration error is preventing the external key store from connecting to its proxy. Verify the value of the [XksProxyUriPath].\n              \n               }\n          {-   [XKS_PROXY_INVALID_RESPONSE] \226\128\148 KMS cannot interpret the response from the external key store proxy. If you see this connection error code repeatedly, notify your external key store proxy vendor.\n              \n               }\n          {-   [XKS_PROXY_INVALID_TLS_CONFIGURATION] \226\128\148 KMS cannot connect to the external key store proxy because the TLS configuration is invalid. Verify that the XKS proxy supports TLS 1.2 or 1.3. Also, verify that the TLS certificate is not expired, and that it matches the hostname in the [XksProxyUriEndpoint] value, and that it is signed by a certificate authority included in the {{:https://github.com/aws/aws-kms-xksproxy-api-spec/blob/main/TrustedCertificateAuthorities}Trusted Certificate Authorities} list.\n              \n               }\n          {-   [XKS_PROXY_NOT_REACHABLE] \226\128\148 KMS can't communicate with your external key store proxy. Verify that the [XksProxyUriEndpoint] and [XksProxyUriPath] are correct. Use the tools for your external key store proxy to verify that the proxy is active and available on its network. Also, verify that your external key manager instances are operating properly. Connection attempts fail with this connection error code if the proxy reports that all external key manager instances are unavailable.\n              \n               }\n          {-   [XKS_PROXY_TIMED_OUT] \226\128\148 KMS can connect to the external key store proxy, but the proxy does not respond to KMS in the time allotted. If you see this connection error code repeatedly, notify your external key store proxy vendor.\n              \n               }\n          {-   [XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION] \226\128\148 The Amazon VPC endpoint service configuration doesn't conform to the requirements for an KMS external key store.\n              \n               {ul\n                     {-  The VPC endpoint service must be an endpoint service for interface endpoints in the caller's Amazon Web Services account.\n                         \n                          }\n                     {-  It must have a network load balancer (NLB) connected to at least two subnets, each in a different Availability Zone.\n                         \n                          }\n                     {-  The [Allow principals] list must include the KMS service principal for the Region, \n                         {[\n                         cks.kms..amazonaws.com\n                         ]}\n                         , such as [cks.kms.us-east-1.amazonaws.com].\n                         \n                          }\n                     {-  It must {i not} require {{:https://docs.aws.amazon.com/vpc/latest/privatelink/create-endpoint-service.html}acceptance} of connection requests.\n                         \n                          }\n                     {-  It must have a private DNS name. The private DNS name for an external key store with [VPC_ENDPOINT_SERVICE] connectivity must be unique in its Amazon Web Services Region.\n                         \n                          }\n                     {-  The domain of the private DNS name must have a {{:https://docs.aws.amazon.com/vpc/latest/privatelink/verify-domains.html}verification status} of [verified].\n                         \n                          }\n                     {-  The {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html}TLS certificate} specifies the private DNS hostname at which the endpoint is reachable.\n                         \n                          }\n                     \n           }\n            }\n          {-   [XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND] \226\128\148 KMS can't find the VPC endpoint service that it uses to communicate with the external key store proxy. Verify that the [XksProxyVpcEndpointServiceName] is correct and the KMS service principal has service consumer permissions on the Amazon VPC endpoint service.\n              \n               }\n          }\n  "];
  connection_state: connection_state_type option
    [@ocaml.doc
      "Indicates whether the custom key store is connected to its backing key store. For an CloudHSM key store, the [ConnectionState] indicates whether it is connected to its CloudHSM cluster. For an external key store, the [ConnectionState] indicates whether it is connected to the external key store proxy that communicates with your external key manager.\n\n You can create and use KMS keys in your custom key stores only when its [ConnectionState] is [CONNECTED].\n \n  The [ConnectionState] value is [DISCONNECTED] only if the key store has never been connected or you use the [DisconnectCustomKeyStore] operation to disconnect it. If the value is [CONNECTED] but you are having trouble using the custom key store, make sure that the backing key store is reachable and active. For an CloudHSM key store, verify that its associated CloudHSM cluster is active and contains at least one active HSM. For an external key store, verify that the external key store proxy and external key manager are connected and enabled.\n  \n   A value of [FAILED] indicates that an attempt to connect was unsuccessful. The [ConnectionErrorCode] field in the response indicates the cause of the failure. For help resolving a connection failure, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting a custom key store} in the {i Key Management Service Developer Guide}.\n   "];
  trust_anchor_certificate: trust_anchor_certificate_type option
    [@ocaml.doc
      "The trust anchor certificate of the CloudHSM cluster associated with an CloudHSM key store. When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the cluster}, you create this certificate and save it in the [customerCA.crt] file.\n\n This field appears only when the [CustomKeyStoreType] is [AWS_CLOUDHSM].\n "];
  cloud_hsm_cluster_id: cloud_hsm_cluster_id_type option
    [@ocaml.doc
      "A unique identifier for the CloudHSM cluster that is associated with an CloudHSM key store. This field appears only when the [CustomKeyStoreType] is [AWS_CLOUDHSM].\n"];
  custom_key_store_name: custom_key_store_name_type option
    [@ocaml.doc
      "The user-specified friendly name for the custom key store.\n"];
  custom_key_store_id: custom_key_store_id_type option
    [@ocaml.doc "A unique identifier for the custom key store.\n"]}[@@ocaml.doc
                                                                    "Contains information about each custom key store in the custom key store list.\n"]
type nonrec custom_key_stores_list = custom_key_stores_list_entry list
[@@ocaml.doc ""]
type nonrec describe_custom_key_stores_response =
  {
  truncated: boolean_type option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: marker_type option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  custom_key_stores: custom_key_stores_list option
    [@ocaml.doc "Contains metadata about each custom key store.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_custom_key_stores_request =
  {
  marker: marker_type option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: limit_type option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n"];
  custom_key_store_name: custom_key_store_name_type option
    [@ocaml.doc
      "Gets only information about the specified custom key store. Enter the friendly name of the custom key store.\n\n By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the [CustomKeyStoreId] or [CustomKeyStoreName] parameter, but not both.\n "];
  custom_key_store_id: custom_key_store_id_type option
    [@ocaml.doc
      "Gets only information about the specified custom key store. Enter the key store ID.\n\n By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the [CustomKeyStoreId] or [CustomKeyStoreName] parameter, but not both.\n "]}
[@@ocaml.doc ""]
type nonrec derive_shared_secret_response =
  {
  key_origin: origin_type option
    [@ocaml.doc
      "The source of the key material for the specified KMS key.\n\n When this value is [AWS_KMS], KMS created the key material. When this value is [EXTERNAL], the key material was imported or the KMS key doesn't have any key material.\n \n  The only valid values for DeriveSharedSecret are [AWS_KMS] and [EXTERNAL]. DeriveSharedSecret does not support KMS keys with a [KeyOrigin] value of [AWS_CLOUDHSM] or [EXTERNAL_KEY_STORE].\n  "];
  key_agreement_algorithm: key_agreement_algorithm_spec option
    [@ocaml.doc
      "Identifies the key agreement algorithm used to derive the shared secret.\n"];
  ciphertext_for_recipient: ciphertext_type option
    [@ocaml.doc
      "The plaintext shared secret encrypted with the public key in the attestation document.\n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  shared_secret: plaintext_type option
    [@ocaml.doc
      "The raw secret derived from the specified key agreement algorithm, private key in the asymmetric KMS key, and your peer's public key.\n\n If the response includes the [CiphertextForRecipient] field, the [SharedSecret] field is null or empty.\n "];
  key_id: key_id_type option
    [@ocaml.doc "Identifies the KMS key used to derive the shared secret.\n"]}
[@@ocaml.doc ""]
type nonrec derive_shared_secret_request =
  {
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To call DeriveSharedSecret for an Amazon Web Services Nitro Enclaves, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} to generate the attestation document and then use the Recipient parameter from any Amazon Web Services SDK to provide the attestation document for the enclave.\n \n  When you use this parameter, instead of returning a plaintext copy of the shared secret, KMS encrypts the plaintext shared secret under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains the encrypted shared secret derived from the KMS key specified by the [KeyId] parameter and public key specified by the [PublicKey] parameter. The [SharedSecret] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  public_key: public_key_type
    [@ocaml.doc
      "Specifies the public key in your peer's NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) key pair.\n\n The public key must be a DER-encoded X.509 public key, also known as [SubjectPublicKeyInfo] (SPKI), as defined in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}.\n \n   [GetPublicKey] returns the public key of an asymmetric KMS key pair in the required DER-encoded format.\n  \n    If you use {{:https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-welcome.html}Amazon Web Services CLI version 1}, you must provide the DER-encoded X.509 public key in a file. Otherwise, the Amazon Web Services CLI Base64-encodes the public key a second time, resulting in a [ValidationException].\n    \n      You can specify the public key as binary data in a file using fileb (\n      {[\n      fileb://\n      ]}\n      ) or in-line using a Base64 encoded string.\n      "];
  key_agreement_algorithm: key_agreement_algorithm_spec
    [@ocaml.doc
      "Specifies the key agreement algorithm used to derive the shared secret. The only valid value is [ECDH].\n"];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies an asymmetric NIST-recommended ECC or SM2 (China Regions only) KMS key. KMS uses the private key in the specified key pair to derive the shared secret. The key usage of the KMS key must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec backing_key_id_response_type = string[@@ocaml.doc ""]
type nonrec delete_imported_key_material_response =
  {
  key_material_id: backing_key_id_response_type option
    [@ocaml.doc "Identifies the deleted key material.\n"];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key from which the key material was deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_imported_key_material_request =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "Identifies the imported key material you are deleting. \n\n  If no KeyMaterialId is specified, KMS deletes the current key material.\n  \n    To get the list of key material IDs associated with a KMS key, use [ListKeyRotations].\n    "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key from which you are deleting imported key material. The [Origin] of the KMS key must be [EXTERNAL].\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec custom_key_store_has_cm_ks_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the custom key store contains KMS keys. After verifying that you do not need to use the KMS keys, use the [ScheduleKeyDeletion] operation to delete the KMS keys. After they are deleted, you can delete the custom key store.\n"]
type nonrec delete_custom_key_store_response = unit[@@ocaml.doc ""]
type nonrec delete_custom_key_store_request =
  {
  custom_key_store_id: custom_key_store_id_type
    [@ocaml.doc
      "Enter the ID of the custom key store you want to delete. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec delete_alias_request =
  {
  alias_name: alias_name_type
    [@ocaml.doc
      "The alias to be deleted. The alias name must begin with [alias/] followed by the alias name, such as [alias/ExampleAlias].\n"]}
[@@ocaml.doc ""]
type nonrec decrypt_response =
  {
  key_material_id: backing_key_id_type option
    [@ocaml.doc
      "The identifier of the key material used to decrypt the ciphertext. This field is present only when the operation uses a symmetric encryption KMS key. This field is omitted if the request includes the [Recipient] parameter.\n"];
  ciphertext_for_recipient: ciphertext_type option
    [@ocaml.doc
      "The plaintext data encrypted with the public key in the attestation document. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to decrypt the ciphertext.\n"];
  plaintext: plaintext_type option
    [@ocaml.doc
      "Decrypted plaintext data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n\n If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.\n "];
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to decrypt the ciphertext.\n"]}
[@@ocaml.doc ""]
type nonrec decrypt_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave-concepts.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.\n \n  When you use this parameter, instead of returning the plaintext data, KMS encrypts the plaintext data with the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [Plaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that will be used to decrypt the ciphertext. Specify the same algorithm that was used to encrypt the data. If you specify a different algorithm, the [Decrypt] operation fails.\n\n This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. The default value, [SYMMETRIC_DEFAULT], represents the only supported algorithm that is valid for symmetric encryption KMS keys.\n "];
  key_id: key_id_type option
    [@ocaml.doc
      "Specifies the KMS key that KMS uses to decrypt the ciphertext.\n\n Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the [Decrypt] operation throws an [IncorrectKeyException].\n \n  This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.\n  \n   To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n   \n    For example:\n    \n     {ul\n           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Alias name: [alias/ExampleAlias] \n               \n                }\n           {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n               \n                }\n           }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens. \n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context to use when decrypting the data. An encryption context is valid only for {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations} with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context.\n\n An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n \n  For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption context} in the {i Key Management Service Developer Guide}.\n  "];
  ciphertext_blob: ciphertext_type
    [@ocaml.doc "Ciphertext to be decrypted. The blob includes metadata.\n"]}
[@@ocaml.doc ""]
type nonrec create_key_response =
  {
  key_metadata: key_metadata option
    [@ocaml.doc "Metadata associated with the KMS key.\n"]}[@@ocaml.doc ""]
type nonrec create_key_request =
  {
  xks_key_id: xks_key_id_type option
    [@ocaml.doc
      "Identifies the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key} that serves as key material for the KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key store}. Specify the ID that the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-xks-proxy}external key store proxy} uses to refer to the external key. For help, see the documentation for your external key store proxy.\n\n This parameter is required for a KMS key with an [Origin] value of [EXTERNAL_KEY_STORE]. It is not valid for KMS keys with any other [Origin] value.\n \n  The external key must be an existing 256-bit AES symmetric encryption key hosted outside of Amazon Web Services in an external key manager associated with the external key store specified by the [CustomKeyStoreId] parameter. This key must be enabled and configured to perform encryption and decryption. Each KMS key in an external key store must use a different external key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html#xks-key-requirements}Requirements for a KMS key in an external key store} in the {i Key Management Service Developer Guide}.\n  \n   Each KMS key in an external key store is associated two backing keys. One is key material that KMS generates. The other is the external key specified by this parameter. When you use the KMS key in an external key store to encrypt data, the encryption operation is performed first by KMS using the KMS key material, and then by the external key manager using the specified external key, a process known as {i double encryption}. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-double-encryption}Double encryption} in the {i Key Management Service Developer Guide}.\n   "];
  multi_region: nullable_boolean_type option
    [@ocaml.doc
      "Creates a multi-Region primary key that you can replicate into other Amazon Web Services Regions. You cannot change this value after you create the KMS key. \n\n For a multi-Region key, set this parameter to [True]. For a single-Region KMS key, omit this parameter or set it to [False]. The default value is [False].\n \n  This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n  \n   This value creates a {i primary key}, not a replica. To create a {i replica key}, use the [ReplicateKey] operation. \n   \n    You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key with imported key material. However, you cannot create a multi-Region key in a custom key store.\n    "];
  tags: tag_list option
    [@ocaml.doc
      "Assigns one or more tags to the KMS key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the [TagResource] operation.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n     \n       To use this parameter, you must have {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} permission in an IAM policy.\n       \n        Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.\n        \n         When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tags in KMS}.\n         "];
  bypass_policy_lockout_safety_check: boolean_type option
    [@ocaml.doc
      "Skips (\"bypasses\") the key policy lockout safety check. The default value is false.\n\n  Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.\n   \n     Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.\n     "];
  custom_key_store_id: custom_key_store_id_type option
    [@ocaml.doc
      "Creates the KMS key in the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. The [ConnectionState] of the custom key store must be [CONNECTED]. To find the CustomKeyStoreID and ConnectionState use the [DescribeCustomKeyStores] operation.\n\n This parameter is valid only for symmetric encryption KMS keys in a single Region. You cannot create any other type of KMS key in a custom key store.\n \n  When you create a KMS key in an CloudHSM key store, KMS generates a non-exportable 256-bit symmetric key in its associated CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you must use the [XksKeyId] parameter to specify an external key that serves as key material for the KMS key.\n  "];
  origin: origin_type option
    [@ocaml.doc
      "The source of the key material for the KMS key. You cannot change the origin after you create the KMS key. The default is [AWS_KMS], which means that KMS creates the key material.\n\n To {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-create-cmk.html}create a KMS key with no key material} (for imported key material), set this value to [EXTERNAL]. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i Key Management Service Developer Guide}. The [EXTERNAL] origin value is valid only for symmetric KMS keys.\n \n  To {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-cmk-keystore.html}create a KMS key in an CloudHSM key store} and create its key material in the associated CloudHSM cluster, set this value to [AWS_CLOUDHSM]. You must also use the [CustomKeyStoreId] parameter to identify the CloudHSM key store. The [KeySpec] value must be [SYMMETRIC_DEFAULT].\n  \n   To {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html}create a KMS key in an external key store}, set this value to [EXTERNAL_KEY_STORE]. You must also use the [CustomKeyStoreId] parameter to identify the external key store and the [XksKeyId] parameter to identify the associated external key. The [KeySpec] value must be [SYMMETRIC_DEFAULT].\n   "];
  key_spec: key_spec option
    [@ocaml.doc
      "Specifies the type of KMS key to create. The default value, [SYMMETRIC_DEFAULT], creates a KMS key with a 256-bit AES-GCM key that is used for encryption and decryption, except in China Regions, where it creates a 128-bit symmetric key that uses SM4 encryption. For a detailed description of all supported key specs, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-choose-key-spec.html}Key spec reference} in the {i  {i Key Management Service Developer Guide} }.\n\n The [KeySpec] determines whether the KMS key contains a symmetric key or an asymmetric key pair. It also determines the algorithms that the KMS key supports. You can't change the [KeySpec] after the KMS key is created. To further restrict the algorithms that can be used with the KMS key, use a condition key in its key policy or IAM policy. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-encryption-algorithm}kms:EncryptionAlgorithm}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-mac-algorithm}kms:MacAlgorithm}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-key-agreement-algorithm}kms:KeyAgreementAlgorithm}, or {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-signing-algorithm}kms:SigningAlgorithm} in the {i  {i Key Management Service Developer Guide} }.\n \n    {{:http://aws.amazon.com/kms/features/#AWS_Service_Integration}Amazon Web Services services that are integrated with KMS} use symmetric encryption KMS keys to protect your data. These services do not support asymmetric KMS keys or HMAC KMS keys.\n   \n     KMS supports the following key specs for KMS keys:\n     \n      {ul\n            {-  Symmetric encryption key (default)\n                \n                 {ul\n                       {-   [SYMMETRIC_DEFAULT] \n                           \n                            }\n                       \n             }\n              }\n            {-  HMAC keys (symmetric)\n                \n                 {ul\n                       {-   [HMAC_224] \n                           \n                            }\n                       {-   [HMAC_256] \n                           \n                            }\n                       {-   [HMAC_384] \n                           \n                            }\n                       {-   [HMAC_512] \n                           \n                            }\n                       \n             }\n              }\n            {-  Asymmetric RSA key pairs (encryption and decryption -or- signing and verification)\n                \n                 {ul\n                       {-   [RSA_2048] \n                           \n                            }\n                       {-   [RSA_3072] \n                           \n                            }\n                       {-   [RSA_4096] \n                           \n                            }\n                       \n             }\n              }\n            {-  Asymmetric NIST-recommended elliptic curve key pairs (signing and verification -or- deriving shared secrets)\n                \n                 {ul\n                       {-   [ECC_NIST_P256] (secp256r1)\n                           \n                            }\n                       {-   [ECC_NIST_P384] (secp384r1)\n                           \n                            }\n                       {-   [ECC_NIST_P521] (secp521r1)\n                           \n                            }\n                       \n             }\n              }\n            {-  Other asymmetric elliptic curve key pairs (signing and verification)\n                \n                 {ul\n                       {-   [ECC_SECG_P256K1] (secp256k1), commonly used for cryptocurrencies.\n                           \n                            }\n                       \n             }\n              }\n            {-  Asymmetric ML-DSA key pairs (signing and verification)\n                \n                 {ul\n                       {-   [ML_DSA_44] \n                           \n                            }\n                       {-   [ML_DSA_65] \n                           \n                            }\n                       {-   [ML_DSA_87] \n                           \n                            }\n                       \n             }\n              }\n            {-  SM2 key pairs (encryption and decryption -or- signing and verification -or- deriving shared secrets)\n                \n                 {ul\n                       {-   [SM2] (China Regions only)\n                           \n                            }\n                       \n             }\n              }\n            }\n  "];
  customer_master_key_spec: customer_master_key_spec option
    [@ocaml.doc
      "Instead, use the [KeySpec] parameter.\n\n The [KeySpec] and [CustomerMasterKeySpec] parameters work the same way. Only the names differ. We recommend that you use [KeySpec] parameter in your code. However, to avoid breaking changes, KMS supports both parameters.\n "];
  key_usage: key_usage_type option
    [@ocaml.doc
      "Determines the {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations} for which you can use the KMS key. The default value is [ENCRYPT_DECRYPT]. This parameter is optional when you are creating a symmetric encryption KMS key; otherwise, it is required. You can't change the [KeyUsage] value after the KMS key is created.\n\n Select only one valid value.\n \n  {ul\n        {-  For symmetric encryption KMS keys, omit the parameter or specify [ENCRYPT_DECRYPT].\n            \n             }\n        {-  For HMAC KMS keys (symmetric), specify [GENERATE_VERIFY_MAC].\n            \n             }\n        {-  For asymmetric KMS keys with RSA key pairs, specify [ENCRYPT_DECRYPT] or [SIGN_VERIFY].\n            \n             }\n        {-  For asymmetric KMS keys with NIST-recommended elliptic curve key pairs, specify [SIGN_VERIFY] or [KEY_AGREEMENT].\n            \n             }\n        {-  For asymmetric KMS keys with [ECC_SECG_P256K1] key pairs, specify [SIGN_VERIFY].\n            \n             }\n        {-  For asymmetric KMS keys with ML-DSA key pairs, specify [SIGN_VERIFY].\n            \n             }\n        {-  For asymmetric KMS keys with SM2 key pairs (China Regions only), specify [ENCRYPT_DECRYPT], [SIGN_VERIFY], or [KEY_AGREEMENT].\n            \n             }\n        }\n  "];
  description: description_type option
    [@ocaml.doc
      "A description of the KMS key. Use a description that helps you decide whether the KMS key is appropriate for a task. The default value is an empty string (no description).\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    To set or change the description after the key is created, use [UpdateKeyDescription].\n    "];
  policy: policy_type option
    [@ocaml.doc
      "The key policy to attach to the KMS key.\n\n If you provide a key policy, it must meet the following criteria:\n \n  {ul\n        {-  The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)\n            \n             }\n        {-  Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.\n            \n             }\n        }\n    If either of the required [Resource] or [Action] elements are missing from a key policy statement, the policy statement has no effect. When a key policy statement is missing one of these elements, the KMS console correctly reports an error, but the [CreateKey] and [PutKeyPolicy] API requests succeed, even though the policy statement is ineffective.\n    \n     For more information on required key policy elements, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-overview.html#key-policy-elements}Elements in a key policy} in the {i Key Management Service Developer Guide}.\n     \n       If you do not provide a key policy, KMS attaches a default key policy to the KMS key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html}Default key policy} in the {i Key Management Service Developer Guide}. \n       \n         If the key policy exceeds the length constraint, KMS returns a [LimitExceededException].\n         \n           For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }.\n           "]}
[@@ocaml.doc ""]
type nonrec create_grant_response =
  {
  grant_id: grant_id_type option
    [@ocaml.doc
      "The unique identifier for the grant.\n\n You can use the [GrantId] in a [ListGrants], [RetireGrant], or [RevokeGrant] operation.\n "];
  grant_token: grant_token_type option
    [@ocaml.doc
      "The grant token.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "]}
[@@ocaml.doc ""]
type nonrec create_grant_request =
  {
  dry_run: nullable_boolean_type option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/testing-permissions.html}Testing your permissions} in the {i Key Management Service Developer Guide}.\n "];
  name: grant_name_type option
    [@ocaml.doc
      "A friendly name for the grant. Use this value to prevent the unintended creation of duplicate grants when retrying this request.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    When this value is absent, all [CreateGrant] requests result in a new grant with a unique [GrantId] even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the [CreateGrant] request.\n    \n     When this value is present, you can retry a [CreateGrant] request with identical parameters; if the grant already exists, the original [GrantId] is returned without creating a new grant. Note that the returned grant token is unique with every [CreateGrant] request, even when a duplicate [GrantId] is returned. All grant tokens for the same grant ID can be used interchangeably.\n     "];
  grant_tokens: grant_token_list option
    [@ocaml.doc
      "A list of grant tokens. \n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  constraints: grant_constraints option
    [@ocaml.doc
      "Specifies a grant constraint.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    KMS supports the [EncryptionContextEquals] and [EncryptionContextSubset] grant constraints, which allow the permissions in the grant only when the encryption context in the request matches ([EncryptionContextEquals]) or includes ([EncryptionContextSubset]) the encryption context specified in the constraint. \n    \n     The encryption context grant constraints are supported only on {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations}grant operations} that include an [EncryptionContext] parameter, such as cryptographic operations on symmetric encryption KMS keys. Grants with grant constraints can include the [DescribeKey] and [RetireGrant] operations, but the constraint doesn't apply to these operations. If a grant with a grant constraint includes the [CreateGrant] operation, the constraint requires that any grants created with the [CreateGrant] permission have an equally strict or stricter encryption context constraint.\n     \n      You cannot use an encryption context grant constraint for cryptographic operations with asymmetric KMS keys or HMAC KMS keys. Operations with these keys don't support an encryption context.\n      \n       Each constraint value can include up to 8 encryption context pairs. The encryption context value in each constraint cannot exceed 384 characters. For information about grant constraints, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints}Using grant constraints} in the {i Key Management Service Developer Guide}. For more information about encryption context, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i  {i Key Management Service Developer Guide} }. \n       "];
  operations: grant_operation_list
    [@ocaml.doc
      "A list of operations that the grant permits. \n\n This list must include only operations that are permitted in a grant. Also, the operation must be supported on the KMS key. For example, you cannot create a grant for a symmetric encryption KMS key that allows the [Sign] operation, or a grant for an asymmetric KMS key that allows the [GenerateDataKey] operation. If you try, KMS returns a [ValidationError] exception. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations}Grant operations} in the {i Key Management Service Developer Guide}.\n "];
  retiring_principal: principal_id_type option
    [@ocaml.doc
      "The principal that has permission to use the [RetireGrant] operation to retire the grant. \n\n To specify the principal, use the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i  {i Identity and Access Management User Guide} }.\n \n  The grant determines the retiring principal. Other principals might have permission to retire the grant or revoke the grant. For details, see [RevokeGrant] and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-delete.html}Retiring and revoking grants} in the {i Key Management Service Developer Guide}. \n  "];
  grantee_principal: principal_id_type
    [@ocaml.doc
      "The identity that gets the permissions specified in the grant.\n\n To specify the grantee principal, use the Amazon Resource Name (ARN) of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i  {i Identity and Access Management User Guide} }.\n "];
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key for the grant. The grant gives principals permission to use this KMS key.\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec incorrect_trust_anchor_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the trust anchor certificate in the request to create an CloudHSM key store is not the trust anchor certificate for the specified CloudHSM cluster.\n\n When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the CloudHSM cluster}, you create the trust anchor certificate and save it in the [customerCA.crt] file.\n "]
type nonrec cloud_hsm_cluster_in_use_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified CloudHSM cluster is already associated with an CloudHSM key store in the account, or it shares a backup history with an CloudHSM key store in the account. Each CloudHSM key store in the account must be associated with a different CloudHSM cluster.\n\n CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n "]
type nonrec create_custom_key_store_response =
  {
  custom_key_store_id: custom_key_store_id_type option
    [@ocaml.doc "A unique identifier for the new custom key store.\n"]}
[@@ocaml.doc ""]
type nonrec create_custom_key_store_request =
  {
  xks_proxy_connectivity: xks_proxy_connectivity_type option
    [@ocaml.doc
      "Indicates how KMS communicates with the external key store proxy. This parameter is required for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n If the external key store proxy uses a public endpoint, specify [PUBLIC_ENDPOINT]. If the external key store proxy uses a Amazon VPC endpoint service for communication with KMS, specify [VPC_ENDPOINT_SERVICE]. For help making this choice, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/choose-xks-connectivity.html}Choosing a connectivity option} in the {i Key Management Service Developer Guide}.\n \n  An Amazon VPC endpoint service keeps your communication with KMS in a private address space entirely within Amazon Web Services, but it requires more configuration, including establishing a Amazon VPC with multiple subnets, a VPC endpoint service, a network load balancer, and a verified private DNS name. A public endpoint is simpler to set up, but it might be slower and might not fulfill your security requirements. You might consider testing with a public endpoint, and then establishing a VPC endpoint service for production tasks. Note that this choice does not determine the location of the external key store proxy. Even if you choose a VPC endpoint service, the proxy can be hosted within the VPC or outside of Amazon Web Services such as in your corporate data center.\n  "];
  xks_proxy_authentication_credential:
    xks_proxy_authentication_credential_type option
    [@ocaml.doc
      "Specifies an authentication credential for the external key store proxy (XKS proxy). This parameter is required for all custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The [XksProxyAuthenticationCredential] has two required elements: [RawSecretAccessKey], a secret key, and [AccessKeyId], a unique identifier for the [RawSecretAccessKey]. For character requirements, see {{:API_XksProxyAuthenticationCredentialType.html}XksProxyAuthenticationCredentialType}.\n \n  KMS uses this authentication credential to sign requests to the external key store proxy on your behalf. This credential is unrelated to Identity and Access Management (IAM) and Amazon Web Services credentials.\n  \n   This parameter doesn't set or change the authentication credentials on the XKS proxy. It just tells KMS the credential that you established on your external key store proxy. If you rotate your proxy authentication credential, use the [UpdateCustomKeyStore] operation to provide the new credential to KMS.\n   "];
  xks_proxy_vpc_endpoint_service_name:
    xks_proxy_vpc_endpoint_service_name_type option
    [@ocaml.doc
      "Specifies the name of the Amazon VPC endpoint service for interface endpoints that is used to communicate with your external key store proxy (XKS proxy). This parameter is required when the value of [CustomKeyStoreType] is [EXTERNAL_KEY_STORE] and the value of [XksProxyConnectivity] is [VPC_ENDPOINT_SERVICE].\n\n The Amazon VPC endpoint service must {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements}fulfill all requirements} for use with an external key store. \n \n   {b Uniqueness requirements:} \n  \n   {ul\n         {-  External key stores with [VPC_ENDPOINT_SERVICE] connectivity can share an Amazon VPC, but each external key store must have its own VPC endpoint service and private DNS name.\n             \n              }\n         }\n  "];
  xks_proxy_uri_path: xks_proxy_uri_path_type option
    [@ocaml.doc
      "Specifies the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key store proxy. This parameter is required for all custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The value must start with [/] and must end with [/kms/xks/v1] where [v1] represents the version of the KMS external key store proxy API. This path can include an optional prefix between the required elements such as \n {[\n /{i prefix}/kms/xks/v1\n ]}\n .\n \n   {b Uniqueness requirements: } \n  \n   {ul\n         {-  The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n             \n              }\n         }\n  "];
  xks_proxy_uri_endpoint: xks_proxy_uri_endpoint_type option
    [@ocaml.doc
      "Specifies the endpoint that KMS uses to send requests to the external key store proxy (XKS proxy). This parameter is required for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The protocol must be HTTPS. KMS communicates on port 443. Do not specify the port in the [XksProxyUriEndpoint] value.\n \n  For external key stores with [XksProxyConnectivity] value of [VPC_ENDPOINT_SERVICE], specify [https://] followed by the private DNS name of the VPC endpoint service.\n  \n   For external key stores with [PUBLIC_ENDPOINT] connectivity, this endpoint must be reachable before you create the custom key store. KMS connects to the external key store proxy while creating the custom key store. For external key stores with [VPC_ENDPOINT_SERVICE] connectivity, KMS connects when you call the [ConnectCustomKeyStore] operation.\n   \n    The value of this parameter must begin with [https://]. The remainder can contain upper and lower case letters (A-Z and a-z), numbers (0-9), dots ([.]), and hyphens ([-]). Additional slashes ([/] and [\\]) are not permitted.\n    \n      {b Uniqueness requirements: } \n     \n      {ul\n            {-  The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n                \n                 }\n            {-  An external key store with [PUBLIC_ENDPOINT] connectivity cannot use the same [XksProxyUriEndpoint] value as an external key store with [VPC_ENDPOINT_SERVICE] connectivity in this Amazon Web Services Region.\n                \n                 }\n            {-  Each external key store with [VPC_ENDPOINT_SERVICE] connectivity must have its own private DNS name. The [XksProxyUriEndpoint] value for external key stores with [VPC_ENDPOINT_SERVICE] connectivity (private DNS name) must be unique in the Amazon Web Services account and Region.\n                \n                 }\n            }\n  "];
  custom_key_store_type: custom_key_store_type option
    [@ocaml.doc
      "Specifies the type of custom key store. The default value is [AWS_CLOUDHSM].\n\n For a custom key store backed by an CloudHSM cluster, omit the parameter or enter [AWS_CLOUDHSM]. For a custom key store backed by an external key manager outside of Amazon Web Services, enter [EXTERNAL_KEY_STORE]. You cannot change this property after the key store is created.\n "];
  key_store_password: key_store_password_type option
    [@ocaml.doc
      "Specifies the [kmsuser] password for an CloudHSM key store. This parameter is required for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the password of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html#concept-kmsuser} [kmsuser] crypto user (CU) account} in the specified CloudHSM cluster. KMS logs into the cluster as this user to manage key material on your behalf.\n \n  The password must be a string of 7 to 32 characters. Its value is case sensitive.\n  \n   This parameter tells KMS the [kmsuser] account password; it does not change the password in the CloudHSM cluster.\n   "];
  trust_anchor_certificate: trust_anchor_certificate_type option
    [@ocaml.doc
      "Specifies the certificate for an CloudHSM key store. This parameter is required for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the content of the trust anchor certificate for the CloudHSM cluster. This is the content of the [customerCA.crt] file that you created when you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html}initialized the cluster}.\n "];
  cloud_hsm_cluster_id: cloud_hsm_cluster_id_type option
    [@ocaml.doc
      "Identifies the CloudHSM cluster for an CloudHSM key store. This parameter is required for custom key stores with [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the cluster ID of any active CloudHSM cluster that is not already associated with a custom key store. To find the cluster ID, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n "];
  custom_key_store_name: custom_key_store_name_type
    [@ocaml.doc
      "Specifies a friendly name for the custom key store. The name must be unique in your Amazon Web Services account and Region. This parameter is required for all custom key stores.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec invalid_alias_name_exception =
  {
  message: error_message_type option [@ocaml.doc ""]}[@@ocaml.doc
                                                       "The request was rejected because the specified alias name is not valid.\n"]
type nonrec create_alias_request =
  {
  target_key_id: key_id_type
    [@ocaml.doc
      "Associates the alias with the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}. The KMS key must be in the same Amazon Web Services Region. \n\n A valid key ID is required. If you supply a null or empty string value, this operation returns an error.\n \n  For help finding the key ID and ARN, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/find-cmk-id-arn.html}Find the key ID and key ARN} in the {i  {i Key Management Service Developer Guide} }.\n  \n   Specify the key ID or key ARN of the KMS key.\n   \n    For example:\n    \n     {ul\n           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "];
  alias_name: alias_name_type
    [@ocaml.doc
      "Specifies the alias name. This value must begin with [alias/] followed by a name, such as [alias/ExampleAlias]. \n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    The [AliasName] value must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). The alias name cannot begin with [alias/aws/]. The [alias/aws/] prefix is reserved for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed keys}.\n    "]}
[@@ocaml.doc ""]
type nonrec connect_custom_key_store_response = unit[@@ocaml.doc ""]
type nonrec connect_custom_key_store_request =
  {
  custom_key_store_id: custom_key_store_id_type
    [@ocaml.doc
      "Enter the key store ID of the custom key store that you want to connect. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_key_deletion_response =
  {
  key_id: key_id_type option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key whose deletion is canceled.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_key_deletion_request =
  {
  key_id: key_id_type
    [@ocaml.doc
      "Identifies the KMS key whose deletion is being canceled.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_xks_proxy_configuration_type :
  ?vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type ->
    ?uri_path:xks_proxy_uri_path_type ->
      ?uri_endpoint:xks_proxy_uri_endpoint_type ->
        ?access_key_id:xks_proxy_authentication_access_key_id_type ->
          ?connectivity:xks_proxy_connectivity_type ->
            unit -> xks_proxy_configuration_type
val make_xks_proxy_authentication_credential_type :
  raw_secret_access_key:xks_proxy_authentication_raw_secret_access_key_type
    ->
    access_key_id:xks_proxy_authentication_access_key_id_type ->
      unit -> xks_proxy_authentication_credential_type
val make_xks_key_configuration_type :
  ?id:xks_key_id_type -> unit -> xks_key_configuration_type
val make_verify_response :
  ?signing_algorithm:signing_algorithm_spec ->
    ?signature_valid:boolean_type ->
      ?key_id:key_id_type -> unit -> verify_response
val make_verify_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_tokens:grant_token_list ->
      ?message_type:message_type ->
        signing_algorithm:signing_algorithm_spec ->
          signature:ciphertext_type ->
            message:plaintext_type ->
              key_id:key_id_type -> unit -> verify_request
val make_verify_mac_response :
  ?mac_algorithm:mac_algorithm_spec ->
    ?mac_valid:boolean_type ->
      ?key_id:key_id_type -> unit -> verify_mac_response
val make_verify_mac_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_tokens:grant_token_list ->
      mac:ciphertext_type ->
        mac_algorithm:mac_algorithm_spec ->
          key_id:key_id_type ->
            message:plaintext_type -> unit -> verify_mac_request
val make_update_primary_region_request :
  primary_region:region_type ->
    key_id:key_id_type -> unit -> update_primary_region_request
val make_update_key_description_request :
  description:description_type ->
    key_id:key_id_type -> unit -> update_key_description_request
val make_update_custom_key_store_response : unit -> unit
val make_update_custom_key_store_request :
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
    ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type
      ->
      ?xks_proxy_vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type
        ->
        ?xks_proxy_uri_path:xks_proxy_uri_path_type ->
          ?xks_proxy_uri_endpoint:xks_proxy_uri_endpoint_type ->
            ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
              ?key_store_password:key_store_password_type ->
                ?new_custom_key_store_name:custom_key_store_name_type ->
                  custom_key_store_id:custom_key_store_id_type ->
                    unit -> update_custom_key_store_request
val make_update_alias_request :
  target_key_id:key_id_type ->
    alias_name:alias_name_type -> unit -> update_alias_request
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    key_id:key_id_type -> unit -> untag_resource_request
val make_tag :
  tag_value:tag_value_type -> tag_key:tag_key_type -> unit -> tag
val make_tag_resource_request :
  tags:tag_list -> key_id:key_id_type -> unit -> tag_resource_request
val make_sign_response :
  ?signing_algorithm:signing_algorithm_spec ->
    ?signature:ciphertext_type ->
      ?key_id:key_id_type -> unit -> sign_response
val make_sign_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_tokens:grant_token_list ->
      ?message_type:message_type ->
        signing_algorithm:signing_algorithm_spec ->
          message:plaintext_type ->
            key_id:key_id_type -> unit -> sign_request
val make_schedule_key_deletion_response :
  ?pending_window_in_days:pending_window_in_days_type ->
    ?key_state:key_state ->
      ?deletion_date:date_type ->
        ?key_id:key_id_type -> unit -> schedule_key_deletion_response
val make_schedule_key_deletion_request :
  ?pending_window_in_days:pending_window_in_days_type ->
    key_id:key_id_type -> unit -> schedule_key_deletion_request
val make_rotate_key_on_demand_response :
  ?key_id:key_id_type -> unit -> rotate_key_on_demand_response
val make_rotate_key_on_demand_request :
  key_id:key_id_type -> unit -> rotate_key_on_demand_request
val make_revoke_grant_request :
  ?dry_run:nullable_boolean_type ->
    grant_id:grant_id_type ->
      key_id:key_id_type -> unit -> revoke_grant_request
val make_retire_grant_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_id:grant_id_type ->
      ?key_id:key_id_type ->
        ?grant_token:grant_token_type -> unit -> retire_grant_request
val make_multi_region_key :
  ?region:region_type -> ?arn:arn_type -> unit -> multi_region_key
val make_multi_region_configuration :
  ?replica_keys:multi_region_key_list ->
    ?primary_key:multi_region_key ->
      ?multi_region_key_type:multi_region_key_type ->
        unit -> multi_region_configuration
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
                            ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type
                              ->
                              ?custom_key_store_id:custom_key_store_id_type
                                ->
                                ?origin:origin_type ->
                                  ?valid_to:date_type ->
                                    ?deletion_date:date_type ->
                                      ?key_state:key_state ->
                                        ?key_usage:key_usage_type ->
                                          ?description:description_type ->
                                            ?enabled:boolean_type ->
                                              ?creation_date:date_type ->
                                                ?arn:arn_type ->
                                                  ?aws_account_id:aws_account_id_type
                                                    ->
                                                    key_id:key_id_type ->
                                                      unit -> key_metadata
val make_replicate_key_response :
  ?replica_tags:tag_list ->
    ?replica_policy:policy_type ->
      ?replica_key_metadata:key_metadata -> unit -> replicate_key_response
val make_replicate_key_request :
  ?tags:tag_list ->
    ?description:description_type ->
      ?bypass_policy_lockout_safety_check:boolean_type ->
        ?policy:policy_type ->
          replica_region:region_type ->
            key_id:key_id_type -> unit -> replicate_key_request
val make_re_encrypt_response :
  ?destination_key_material_id:backing_key_id_type ->
    ?source_key_material_id:backing_key_id_type ->
      ?destination_encryption_algorithm:encryption_algorithm_spec ->
        ?source_encryption_algorithm:encryption_algorithm_spec ->
          ?key_id:key_id_type ->
            ?source_key_id:key_id_type ->
              ?ciphertext_blob:ciphertext_type -> unit -> re_encrypt_response
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
                    unit -> re_encrypt_request
val make_put_key_policy_request :
  ?bypass_policy_lockout_safety_check:boolean_type ->
    ?policy_name:policy_name_type ->
      policy:policy_type ->
        key_id:key_id_type -> unit -> put_key_policy_request
val make_grant_constraints :
  ?encryption_context_equals:encryption_context_type ->
    ?encryption_context_subset:encryption_context_type ->
      unit -> grant_constraints
val make_grant_list_entry :
  ?constraints:grant_constraints ->
    ?operations:grant_operation_list ->
      ?issuing_account:principal_id_type ->
        ?retiring_principal:principal_id_type ->
          ?grantee_principal:principal_id_type ->
            ?creation_date:date_type ->
              ?name:grant_name_type ->
                ?grant_id:grant_id_type ->
                  ?key_id:key_id_type -> unit -> grant_list_entry
val make_list_grants_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type ->
      ?grants:grant_list -> unit -> list_grants_response
val make_list_retirable_grants_request :
  ?marker:marker_type ->
    ?limit:limit_type ->
      retiring_principal:principal_id_type ->
        unit -> list_retirable_grants_request
val make_list_resource_tags_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type ->
      ?tags:tag_list -> unit -> list_resource_tags_response
val make_list_resource_tags_request :
  ?marker:marker_type ->
    ?limit:limit_type ->
      key_id:key_id_type -> unit -> list_resource_tags_request
val make_key_list_entry :
  ?key_arn:arn_type -> ?key_id:key_id_type -> unit -> key_list_entry
val make_list_keys_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type -> ?keys:key_list -> unit -> list_keys_response
val make_list_keys_request :
  ?marker:marker_type -> ?limit:limit_type -> unit -> list_keys_request
val make_rotations_list_entry :
  ?rotation_type:rotation_type ->
    ?rotation_date:date_type ->
      ?valid_to:date_type ->
        ?expiration_model:expiration_model_type ->
          ?key_material_state:key_material_state ->
            ?import_state:import_state ->
              ?key_material_description:key_material_description_type ->
                ?key_material_id:backing_key_id_type ->
                  ?key_id:key_id_type -> unit -> rotations_list_entry
val make_list_key_rotations_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type ->
      ?rotations:rotations_list -> unit -> list_key_rotations_response
val make_list_key_rotations_request :
  ?marker:marker_type ->
    ?limit:limit_type ->
      ?include_key_material:include_key_material ->
        key_id:key_id_type -> unit -> list_key_rotations_request
val make_list_key_policies_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type ->
      ?policy_names:policy_name_list -> unit -> list_key_policies_response
val make_list_key_policies_request :
  ?marker:marker_type ->
    ?limit:limit_type ->
      key_id:key_id_type -> unit -> list_key_policies_request
val make_list_grants_request :
  ?grantee_principal:principal_id_type ->
    ?grant_id:grant_id_type ->
      ?marker:marker_type ->
        ?limit:limit_type ->
          key_id:key_id_type -> unit -> list_grants_request
val make_alias_list_entry :
  ?last_updated_date:date_type ->
    ?creation_date:date_type ->
      ?target_key_id:key_id_type ->
        ?alias_arn:arn_type ->
          ?alias_name:alias_name_type -> unit -> alias_list_entry
val make_list_aliases_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type ->
      ?aliases:alias_list -> unit -> list_aliases_response
val make_list_aliases_request :
  ?marker:marker_type ->
    ?limit:limit_type -> ?key_id:key_id_type -> unit -> list_aliases_request
val make_import_key_material_response :
  ?key_material_id:backing_key_id_type ->
    ?key_id:key_id_type -> unit -> import_key_material_response
val make_import_key_material_request :
  ?key_material_id:backing_key_id_type ->
    ?key_material_description:key_material_description_type ->
      ?import_type:import_type ->
        ?expiration_model:expiration_model_type ->
          ?valid_to:date_type ->
            encrypted_key_material:ciphertext_type ->
              import_token:ciphertext_type ->
                key_id:key_id_type -> unit -> import_key_material_request
val make_get_public_key_response :
  ?key_agreement_algorithms:key_agreement_algorithm_spec_list ->
    ?signing_algorithms:signing_algorithm_spec_list ->
      ?encryption_algorithms:encryption_algorithm_spec_list ->
        ?key_usage:key_usage_type ->
          ?key_spec:key_spec ->
            ?customer_master_key_spec:customer_master_key_spec ->
              ?public_key:public_key_type ->
                ?key_id:key_id_type -> unit -> get_public_key_response
val make_get_public_key_request :
  ?grant_tokens:grant_token_list ->
    key_id:key_id_type -> unit -> get_public_key_request
val make_get_parameters_for_import_response :
  ?parameters_valid_to:date_type ->
    ?public_key:plaintext_type ->
      ?import_token:ciphertext_type ->
        ?key_id:key_id_type -> unit -> get_parameters_for_import_response
val make_get_parameters_for_import_request :
  wrapping_key_spec:wrapping_key_spec ->
    wrapping_algorithm:algorithm_spec ->
      key_id:key_id_type -> unit -> get_parameters_for_import_request
val make_get_key_rotation_status_response :
  ?on_demand_rotation_start_date:date_type ->
    ?next_rotation_date:date_type ->
      ?rotation_period_in_days:rotation_period_in_days_type ->
        ?key_id:key_id_type ->
          ?key_rotation_enabled:boolean_type ->
            unit -> get_key_rotation_status_response
val make_get_key_rotation_status_request :
  key_id:key_id_type -> unit -> get_key_rotation_status_request
val make_get_key_policy_response :
  ?policy_name:policy_name_type ->
    ?policy:policy_type -> unit -> get_key_policy_response
val make_get_key_policy_request :
  ?policy_name:policy_name_type ->
    key_id:key_id_type -> unit -> get_key_policy_request
val make_generate_random_response :
  ?ciphertext_for_recipient:ciphertext_type ->
    ?plaintext:plaintext_type -> unit -> generate_random_response
val make_recipient_info :
  ?attestation_document:attestation_document_type ->
    ?key_encryption_algorithm:key_encryption_mechanism ->
      unit -> recipient_info
val make_generate_random_request :
  ?recipient:recipient_info ->
    ?custom_key_store_id:custom_key_store_id_type ->
      ?number_of_bytes:number_of_bytes_type ->
        unit -> generate_random_request
val make_generate_mac_response :
  ?key_id:key_id_type ->
    ?mac_algorithm:mac_algorithm_spec ->
      ?mac:ciphertext_type -> unit -> generate_mac_response
val make_generate_mac_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_tokens:grant_token_list ->
      mac_algorithm:mac_algorithm_spec ->
        key_id:key_id_type ->
          message:plaintext_type -> unit -> generate_mac_request
val make_generate_data_key_without_plaintext_response :
  ?key_material_id:backing_key_id_type ->
    ?key_id:key_id_type ->
      ?ciphertext_blob:ciphertext_type ->
        unit -> generate_data_key_without_plaintext_response
val make_generate_data_key_without_plaintext_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_tokens:grant_token_list ->
      ?number_of_bytes:number_of_bytes_type ->
        ?key_spec:data_key_spec ->
          ?encryption_context:encryption_context_type ->
            key_id:key_id_type ->
              unit -> generate_data_key_without_plaintext_request
val make_generate_data_key_pair_without_plaintext_response :
  ?key_material_id:backing_key_id_type ->
    ?key_pair_spec:data_key_pair_spec ->
      ?key_id:key_id_type ->
        ?public_key:public_key_type ->
          ?private_key_ciphertext_blob:ciphertext_type ->
            unit -> generate_data_key_pair_without_plaintext_response
val make_generate_data_key_pair_without_plaintext_request :
  ?dry_run:nullable_boolean_type ->
    ?grant_tokens:grant_token_list ->
      ?encryption_context:encryption_context_type ->
        key_pair_spec:data_key_pair_spec ->
          key_id:key_id_type ->
            unit -> generate_data_key_pair_without_plaintext_request
val make_generate_data_key_pair_response :
  ?key_material_id:backing_key_id_type ->
    ?ciphertext_for_recipient:ciphertext_type ->
      ?key_pair_spec:data_key_pair_spec ->
        ?key_id:key_id_type ->
          ?public_key:public_key_type ->
            ?private_key_plaintext:plaintext_type ->
              ?private_key_ciphertext_blob:ciphertext_type ->
                unit -> generate_data_key_pair_response
val make_generate_data_key_pair_request :
  ?dry_run:nullable_boolean_type ->
    ?recipient:recipient_info ->
      ?grant_tokens:grant_token_list ->
        ?encryption_context:encryption_context_type ->
          key_pair_spec:data_key_pair_spec ->
            key_id:key_id_type -> unit -> generate_data_key_pair_request
val make_generate_data_key_response :
  ?key_material_id:backing_key_id_type ->
    ?ciphertext_for_recipient:ciphertext_type ->
      ?key_id:key_id_type ->
        ?plaintext:plaintext_type ->
          ?ciphertext_blob:ciphertext_type ->
            unit -> generate_data_key_response
val make_generate_data_key_request :
  ?dry_run:nullable_boolean_type ->
    ?recipient:recipient_info ->
      ?grant_tokens:grant_token_list ->
        ?key_spec:data_key_spec ->
          ?number_of_bytes:number_of_bytes_type ->
            ?encryption_context:encryption_context_type ->
              key_id:key_id_type -> unit -> generate_data_key_request
val make_encrypt_response :
  ?encryption_algorithm:encryption_algorithm_spec ->
    ?key_id:key_id_type ->
      ?ciphertext_blob:ciphertext_type -> unit -> encrypt_response
val make_encrypt_request :
  ?dry_run:nullable_boolean_type ->
    ?encryption_algorithm:encryption_algorithm_spec ->
      ?grant_tokens:grant_token_list ->
        ?encryption_context:encryption_context_type ->
          plaintext:plaintext_type ->
            key_id:key_id_type -> unit -> encrypt_request
val make_enable_key_rotation_request :
  ?rotation_period_in_days:rotation_period_in_days_type ->
    key_id:key_id_type -> unit -> enable_key_rotation_request
val make_enable_key_request :
  key_id:key_id_type -> unit -> enable_key_request
val make_disconnect_custom_key_store_response : unit -> unit
val make_disconnect_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type ->
    unit -> disconnect_custom_key_store_request
val make_disable_key_rotation_request :
  key_id:key_id_type -> unit -> disable_key_rotation_request
val make_disable_key_request :
  key_id:key_id_type -> unit -> disable_key_request
val make_describe_key_response :
  ?key_metadata:key_metadata -> unit -> describe_key_response
val make_describe_key_request :
  ?grant_tokens:grant_token_list ->
    key_id:key_id_type -> unit -> describe_key_request
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
                    unit -> custom_key_stores_list_entry
val make_describe_custom_key_stores_response :
  ?truncated:boolean_type ->
    ?next_marker:marker_type ->
      ?custom_key_stores:custom_key_stores_list ->
        unit -> describe_custom_key_stores_response
val make_describe_custom_key_stores_request :
  ?marker:marker_type ->
    ?limit:limit_type ->
      ?custom_key_store_name:custom_key_store_name_type ->
        ?custom_key_store_id:custom_key_store_id_type ->
          unit -> describe_custom_key_stores_request
val make_derive_shared_secret_response :
  ?key_origin:origin_type ->
    ?key_agreement_algorithm:key_agreement_algorithm_spec ->
      ?ciphertext_for_recipient:ciphertext_type ->
        ?shared_secret:plaintext_type ->
          ?key_id:key_id_type -> unit -> derive_shared_secret_response
val make_derive_shared_secret_request :
  ?recipient:recipient_info ->
    ?dry_run:nullable_boolean_type ->
      ?grant_tokens:grant_token_list ->
        public_key:public_key_type ->
          key_agreement_algorithm:key_agreement_algorithm_spec ->
            key_id:key_id_type -> unit -> derive_shared_secret_request
val make_delete_imported_key_material_response :
  ?key_material_id:backing_key_id_response_type ->
    ?key_id:key_id_type -> unit -> delete_imported_key_material_response
val make_delete_imported_key_material_request :
  ?key_material_id:backing_key_id_type ->
    key_id:key_id_type -> unit -> delete_imported_key_material_request
val make_delete_custom_key_store_response : unit -> unit
val make_delete_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type ->
    unit -> delete_custom_key_store_request
val make_delete_alias_request :
  alias_name:alias_name_type -> unit -> delete_alias_request
val make_decrypt_response :
  ?key_material_id:backing_key_id_type ->
    ?ciphertext_for_recipient:ciphertext_type ->
      ?encryption_algorithm:encryption_algorithm_spec ->
        ?plaintext:plaintext_type ->
          ?key_id:key_id_type -> unit -> decrypt_response
val make_decrypt_request :
  ?dry_run:nullable_boolean_type ->
    ?recipient:recipient_info ->
      ?encryption_algorithm:encryption_algorithm_spec ->
        ?key_id:key_id_type ->
          ?grant_tokens:grant_token_list ->
            ?encryption_context:encryption_context_type ->
              ciphertext_blob:ciphertext_type -> unit -> decrypt_request
val make_create_key_response :
  ?key_metadata:key_metadata -> unit -> create_key_response
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
                      ?policy:policy_type -> unit -> create_key_request
val make_create_grant_response :
  ?grant_id:grant_id_type ->
    ?grant_token:grant_token_type -> unit -> create_grant_response
val make_create_grant_request :
  ?dry_run:nullable_boolean_type ->
    ?name:grant_name_type ->
      ?grant_tokens:grant_token_list ->
        ?constraints:grant_constraints ->
          ?retiring_principal:principal_id_type ->
            operations:grant_operation_list ->
              grantee_principal:principal_id_type ->
                key_id:key_id_type -> unit -> create_grant_request
val make_create_custom_key_store_response :
  ?custom_key_store_id:custom_key_store_id_type ->
    unit -> create_custom_key_store_response
val make_create_custom_key_store_request :
  ?xks_proxy_connectivity:xks_proxy_connectivity_type ->
    ?xks_proxy_authentication_credential:xks_proxy_authentication_credential_type
      ->
      ?xks_proxy_vpc_endpoint_service_name:xks_proxy_vpc_endpoint_service_name_type
        ->
        ?xks_proxy_uri_path:xks_proxy_uri_path_type ->
          ?xks_proxy_uri_endpoint:xks_proxy_uri_endpoint_type ->
            ?custom_key_store_type:custom_key_store_type ->
              ?key_store_password:key_store_password_type ->
                ?trust_anchor_certificate:trust_anchor_certificate_type ->
                  ?cloud_hsm_cluster_id:cloud_hsm_cluster_id_type ->
                    custom_key_store_name:custom_key_store_name_type ->
                      unit -> create_custom_key_store_request
val make_create_alias_request :
  target_key_id:key_id_type ->
    alias_name:alias_name_type -> unit -> create_alias_request
val make_connect_custom_key_store_response : unit -> unit
val make_connect_custom_key_store_request :
  custom_key_store_id:custom_key_store_id_type ->
    unit -> connect_custom_key_store_request
val make_cancel_key_deletion_response :
  ?key_id:key_id_type -> unit -> cancel_key_deletion_response
val make_cancel_key_deletion_request :
  key_id:key_id_type -> unit -> cancel_key_deletion_request(** {1:operations Operations} *)

module CancelKeyDeletion :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_key_deletion_request ->
        (cancel_key_deletion_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Cancels the deletion of a KMS key. When this operation succeeds, the key state of the KMS key is [Disabled]. To enable the KMS key, use [EnableKey]. \n\n For more information about scheduling and canceling deletion of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html}Deleting KMS keys} in the {i Key Management Service Developer Guide}.\n \n  The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n  \n    {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CancelKeyDeletion} (key policy)\n    \n      {b Related operations}: [ScheduleKeyDeletion] \n     \n       {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n      "]
module ConnectCustomKeyStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      connect_custom_key_store_request ->
        (connect_custom_key_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudHsmClusterInvalidConfigurationException of
              cloud_hsm_cluster_invalid_configuration_exception 
          | `CloudHsmClusterNotActiveException of
              cloud_hsm_cluster_not_active_exception 
          | `CustomKeyStoreInvalidStateException of
              custom_key_store_invalid_state_exception 
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `KMSInternalException of kms_internal_exception ]) result
end[@@ocaml.doc
     "Connects or reconnects a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store} to its backing key store. For an CloudHSM key store, [ConnectCustomKeyStore] connects the key store to its associated CloudHSM cluster. For an external key store, [ConnectCustomKeyStore] connects the key store to the external key store proxy that communicates with your external key manager.\n\n The custom key store must be connected before you can create KMS keys in the key store or use the KMS keys it contains. You can disconnect and reconnect a custom key store at any time.\n \n  The connection process for a custom key store can take an extended amount of time to complete. This operation starts the connection process, but it does not wait for it to complete. When it succeeds, this operation quickly returns an HTTP 200 response and a JSON object with no properties. However, this response does not indicate that the custom key store is connected. To get the connection state of the custom key store, use the [DescribeCustomKeyStores] operation.\n  \n    This operation is part of the custom key stores feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.\n   \n    The [ConnectCustomKeyStore] operation might fail for various reasons. To find the reason, use the [DescribeCustomKeyStores] operation and see the [ConnectionErrorCode] in the response. For help interpreting the [ConnectionErrorCode], see [CustomKeyStoresListEntry].\n    \n     To fix the failure, use the [DisconnectCustomKeyStore] operation to disconnect the custom key store, correct the error, use the [UpdateCustomKeyStore] operation if necessary, and then use [ConnectCustomKeyStore] again.\n     \n       {b CloudHSM key store} \n      \n       During the connection process for an CloudHSM key store, KMS finds the CloudHSM cluster that is associated with the custom key store, creates the connection infrastructure, connects to the cluster, logs into the CloudHSM client as the [kmsuser] CU, and rotates its password.\n       \n        To connect an CloudHSM key store, its associated CloudHSM cluster must have at least one active HSM. To get the number of active HSMs in a cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation. To add HSMs to the cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html}CreateHsm} operation. Also, the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html#concept-kmsuser} [kmsuser] crypto user} (CU) must not be logged into the cluster. This prevents KMS from using this account to log in.\n        \n         If you are having trouble connecting or disconnecting a CloudHSM key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting an CloudHSM key store} in the {i Key Management Service Developer Guide}.\n         \n           {b External key store} \n          \n           When you connect an external key store that uses public endpoint connectivity, KMS tests its ability to communicate with your external key manager by sending a request via the external key store proxy.\n           \n            When you connect to an external key store that uses VPC endpoint service connectivity, KMS establishes the networking elements that it needs to communicate with your external key manager via the external key store proxy. This includes creating an interface endpoint to the VPC endpoint service and a private hosted zone for traffic between KMS and the VPC endpoint service.\n            \n             To connect an external key store, KMS must be able to connect to the external key store proxy, the external key store proxy must be able to communicate with your external key manager, and the external key manager must be available for cryptographic operations.\n             \n              If you are having trouble connecting or disconnecting an external key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html}Troubleshooting an external key store} in the {i Key Management Service Developer Guide}.\n              \n                {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.\n               \n                 {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ConnectCustomKeyStore} (IAM policy)\n                \n                  {b Related operations} \n                 \n                  {ul\n                        {-   [CreateCustomKeyStore] \n                            \n                             }\n                        {-   [DeleteCustomKeyStore] \n                            \n                             }\n                        {-   [DescribeCustomKeyStores] \n                            \n                             }\n                        {-   [DisconnectCustomKeyStore] \n                            \n                             }\n                        {-   [UpdateCustomKeyStore] \n                            \n                             }\n                        }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module CreateAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AlreadyExistsException of already_exists_exception 
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidAliasNameException of invalid_alias_name_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Creates a friendly name for a KMS key. \n\n  Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n    You can use an alias to identify a KMS key in the KMS console, in the [DescribeKey] operation and in {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations}, such as [Encrypt] and [GenerateDataKey]. You can also change the KMS key that's associated with the alias ([UpdateAlias]) or delete the alias ([DeleteAlias]) at any time. These operations don't affect the underlying KMS key. \n    \n     You can associate the alias with any customer managed key in the same Amazon Web Services Region. Each alias is associated with only one KMS key at a time, but a KMS key can have multiple aliases. A valid KMS key is required. You can't create an alias without a KMS key.\n     \n      The alias must be unique in the account and Region, but you can have aliases with the same name in different Regions. For detailed information about aliases, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html}Aliases in KMS} in the {i Key Management Service Developer Guide}.\n      \n       This operation does not return a response. To get the alias that you created, use the [ListAliases] operation.\n       \n        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n        \n          {b Cross-account use}: No. You cannot perform this operation on an alias in a different Amazon Web Services account.\n         \n           {b Required permissions} \n          \n           {ul\n                 {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateAlias} on the alias (IAM policy).\n                     \n                      }\n                 {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateAlias} on the KMS key (key policy).\n                     \n                      }\n                 }\n   For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/alias-access.html}Controlling access to aliases} in the {i Key Management Service Developer Guide}.\n   \n     {b Related operations:} \n    \n     {ul\n           {-   [DeleteAlias] \n               \n                }\n           {-   [ListAliases] \n               \n                }\n           {-   [UpdateAlias] \n               \n                }\n           }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module CreateCustomKeyStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_custom_key_store_request ->
        (create_custom_key_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudHsmClusterInUseException of
              cloud_hsm_cluster_in_use_exception 
          | `CloudHsmClusterInvalidConfigurationException of
              cloud_hsm_cluster_invalid_configuration_exception 
          | `CloudHsmClusterNotActiveException of
              cloud_hsm_cluster_not_active_exception 
          | `CloudHsmClusterNotFoundException of
              cloud_hsm_cluster_not_found_exception 
          | `CustomKeyStoreNameInUseException of
              custom_key_store_name_in_use_exception 
          | `IncorrectTrustAnchorException of
              incorrect_trust_anchor_exception 
          | `KMSInternalException of kms_internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `XksProxyIncorrectAuthenticationCredentialException of
              xks_proxy_incorrect_authentication_credential_exception 
          | `XksProxyInvalidConfigurationException of
              xks_proxy_invalid_configuration_exception 
          | `XksProxyInvalidResponseException of
              xks_proxy_invalid_response_exception 
          | `XksProxyUriEndpointInUseException of
              xks_proxy_uri_endpoint_in_use_exception 
          | `XksProxyUriInUseException of xks_proxy_uri_in_use_exception 
          | `XksProxyUriUnreachableException of
              xks_proxy_uri_unreachable_exception 
          | `XksProxyVpcEndpointServiceInUseException of
              xks_proxy_vpc_endpoint_service_in_use_exception 
          | `XksProxyVpcEndpointServiceInvalidConfigurationException of
              xks_proxy_vpc_endpoint_service_invalid_configuration_exception 
          | `XksProxyVpcEndpointServiceNotFoundException of
              xks_proxy_vpc_endpoint_service_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store} backed by a key store that you own and manage. When you use a KMS key in a custom key store for a cryptographic operation, the cryptographic operation is actually performed in your key store using your keys. KMS supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key stores} backed by an {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html}CloudHSM cluster} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key stores} backed by an external key store proxy and external key manager outside of Amazon Web Services.\n\n  This operation is part of the custom key stores feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.\n \n  Before you create the custom key store, the required elements must be in place and operational. We recommend that you use the test tools that KMS provides to verify the configuration your external key store proxy. For details about the required elements and verification tests, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}Assemble the prerequisites (for CloudHSM key stores)} or {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements}Assemble the prerequisites (for external key stores)} in the {i Key Management Service Developer Guide}.\n  \n   To create a custom key store, use the following parameters.\n   \n    {ul\n          {-  To create an CloudHSM key store, specify the [CustomKeyStoreName], [CloudHsmClusterId], [KeyStorePassword], and [TrustAnchorCertificate]. The [CustomKeyStoreType] parameter is optional for CloudHSM key stores. If you include it, set it to the default value, [AWS_CLOUDHSM]. For help with failures, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting an CloudHSM key store} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-  To create an external key store, specify the [CustomKeyStoreName] and a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE]. Also, specify values for [XksProxyConnectivity], [XksProxyAuthenticationCredential], [XksProxyUriEndpoint], and [XksProxyUriPath]. If your [XksProxyConnectivity] value is [VPC_ENDPOINT_SERVICE], specify the [XksProxyVpcEndpointServiceName] parameter. For help with failures, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html}Troubleshooting an external key store} in the {i Key Management Service Developer Guide}.\n              \n               }\n          }\n    For external key stores:\n    \n     Some external key managers provide a simpler method for creating an external key store. For details, see your external key manager documentation.\n     \n      When creating an external key store in the KMS console, you can upload a JSON-based proxy configuration file with the desired values. You cannot use a proxy configuration with the [CreateCustomKeyStore] operation. However, you can use the values in the file to help you determine the correct values for the [CreateCustomKeyStore] parameters.\n      \n        When the operation completes successfully, it returns the ID of the new custom key store. Before you can use your new custom key store, you need to use the [ConnectCustomKeyStore] operation to connect a new CloudHSM key store to its CloudHSM cluster, or to connect a new external key store to the external key store proxy for your external key manager. Even if you are not going to use your custom key store immediately, you might want to connect it to verify that all settings are correct and then disconnect it until you are ready to use it.\n        \n          {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.\n         \n           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateCustomKeyStore} (IAM policy).\n          \n            {b Related operations:} \n           \n            {ul\n                  {-   [ConnectCustomKeyStore] \n                      \n                       }\n                  {-   [DeleteCustomKeyStore] \n                      \n                       }\n                  {-   [DescribeCustomKeyStores] \n                      \n                       }\n                  {-   [DisconnectCustomKeyStore] \n                      \n                       }\n                  {-   [UpdateCustomKeyStore] \n                      \n                       }\n                  }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module CreateGrant :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_grant_request ->
        (create_grant_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Adds a grant to a KMS key. \n\n A {i grant} is a policy instrument that allows Amazon Web Services principals to use KMS keys in cryptographic operations. It also can allow them to view a KMS key ([DescribeKey]) and create and manage grants. When authorizing access to a KMS key, grants are considered along with key policies and IAM policies. Grants are often used for temporary permissions because you can create one, use its permissions, and delete it without changing your key policies or IAM policies. \n \n  For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i  {i Key Management Service Developer Guide} }. For examples of creating grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/example_kms_CreateGrant_section.html}Use CreateGrant with an Amazon Web Services SDK or CLI}. \n  \n   The [CreateGrant] operation returns a [GrantToken] and a [GrantId].\n   \n    {ul\n          {-  When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as {i eventual consistency}. Once the grant has achieved eventual consistency, the grantee principal can use the permissions in the grant without identifying the grant. \n              \n               However, to use the permissions in the grant immediately, use the [GrantToken] that [CreateGrant] returns. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/using-grant-token.html}Using a grant token} in the {i  {i Key Management Service Developer Guide} }.\n               \n                }\n          {-  The [CreateGrant] operation also returns a [GrantId]. You can use the [GrantId] and a key identifier to identify the grant in the [RetireGrant] and [RevokeGrant] operations. To find the grant ID, use the [ListGrants] or [ListRetirableGrants] operations.\n              \n               }\n          }\n   The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n   \n     {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter. \n    \n      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateGrant} (key policy)\n     \n       {b Related operations:} \n      \n       {ul\n             {-   [ListGrants] \n                 \n                  }\n             {-   [ListRetirableGrants] \n                 \n                  }\n             {-   [RetireGrant] \n                 \n                  }\n             {-   [RevokeGrant] \n                 \n                  }\n             }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module CreateKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_key_request ->
        (create_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudHsmClusterInvalidConfigurationException of
              cloud_hsm_cluster_invalid_configuration_exception 
          | `CustomKeyStoreInvalidStateException of
              custom_key_store_invalid_state_exception 
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `MalformedPolicyDocumentException of
              malformed_policy_document_exception 
          | `TagException of tag_exception 
          | `UnsupportedOperationException of unsupported_operation_exception 
          | `XksKeyAlreadyInUseException of xks_key_already_in_use_exception 
          | `XksKeyInvalidConfigurationException of
              xks_key_invalid_configuration_exception 
          | `XksKeyNotFoundException of xks_key_not_found_exception ]) result
end[@@ocaml.doc
     "Creates a unique customer managed {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms-keys}KMS key} in your Amazon Web Services account and Region. You can use a KMS key in cryptographic operations, such as encryption and signing. Some Amazon Web Services services let you use KMS keys that you create and manage to protect your service resources.\n\n A KMS key is a logical representation of a cryptographic key. In addition to the key material used in cryptographic operations, a KMS key includes metadata, such as the key ID, key policy, creation date, description, and key state. \n \n  Use the parameters of [CreateKey] to specify the type of KMS key, the source of its key material, its key policy, description, tags, and other properties.\n  \n    KMS has replaced the term {i customer master key (CMK)} with {i KMS key} and {i KMS key}. The concept has not changed. To prevent breaking changes, KMS is keeping some variations of this term.\n    \n      To create different types of KMS keys, use the following guidance:\n      \n        Symmetric encryption KMS key  By default, [CreateKey] creates a symmetric encryption KMS key with key material that KMS generates. This is the basic and most widely used type of KMS key, and provides the best performance.\n                                      \n                                       To create a symmetric encryption KMS key, you don't need to specify any parameters. The default value for [KeySpec], [SYMMETRIC_DEFAULT], the default value for [KeyUsage], [ENCRYPT_DECRYPT], and the default value for [Origin], [AWS_KMS], create a symmetric encryption KMS key with KMS key material.\n                                       \n                                        If you need a key for basic encryption and decryption or you are creating a KMS key to protect your resources in an Amazon Web Services service, create a symmetric encryption KMS key. The key material in a symmetric encryption key never leaves KMS unencrypted. You can use a symmetric encryption KMS key to encrypt and decrypt data up to 4,096 bytes, but they are typically used to generate data keys and data keys pairs. For details, see [GenerateDataKey] and [GenerateDataKeyPair].\n                                        \n                                          \n                                         \n                                           Asymmetric KMS keys  To create an asymmetric KMS key, use the [KeySpec] parameter to specify the type of key material in the KMS key. Then, use the [KeyUsage] parameter to determine whether the KMS key will be used to encrypt and decrypt or sign and verify. You can't change these properties after the KMS key is created.\n                                                                \n                                                                 Asymmetric KMS keys contain an RSA key pair, Elliptic Curve (ECC) key pair, ML-DSA key pair or an SM2 key pair (China Regions only). The private key in an asymmetric KMS key never leaves KMS unencrypted. However, you can use the [GetPublicKey] operation to download the public key so it can be used outside of KMS. Each KMS key can have only one key usage. KMS keys with RSA key pairs can be used to encrypt and decrypt data or sign and verify messages (but not both). KMS keys with NIST-recommended ECC key pairs can be used to sign and verify messages or derive shared secrets (but not both). KMS keys with [ECC_SECG_P256K1] can be used only to sign and verify messages. KMS keys with ML-DSA key pairs can be used to sign and verify messages. KMS keys with SM2 key pairs (China Regions only) can be used to either encrypt and decrypt data, sign and verify messages, or derive shared secrets (you must choose one key usage type). For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.\n                                                                 \n                                                                   \n                                                                  \n                                                                    HMAC KMS key  \nTo create an HMAC KMS key, set the [KeySpec] parameter to a key spec value for HMAC KMS keys. Then set the [KeyUsage] parameter to [GENERATE_VERIFY_MAC]. You must set the key usage even though [GENERATE_VERIFY_MAC] is the only valid key usage value for HMAC KMS keys. You can't change these properties after the KMS key is created.\n\n HMAC KMS keys are symmetric keys that never leave KMS unencrypted. You can use HMAC keys to generate ([GenerateMac]) and verify ([VerifyMac]) HMAC codes for messages up to 4096 bytes.\n \n   \n  \n    Multi-Region primary keys Imported key material  To create a multi-Region {i primary key} in the local Amazon Web Services Region, use the [MultiRegion] parameter with a value of [True]. To create a multi-Region {i replica key}, that is, a KMS key with the same key ID and key material as a primary key, but in a different Amazon Web Services Region, use the [ReplicateKey] operation. To change a replica key to a primary key, and its primary key to a replica key, use the [UpdatePrimaryRegion] operation.\n                                                     \n                                                      You can create multi-Region KMS keys for all supported KMS key types: symmetric encryption KMS keys, HMAC KMS keys, asymmetric encryption KMS keys, and asymmetric signing KMS keys. You can also create multi-Region keys with imported key material. However, you can't create multi-Region keys in a custom key store.\n                                                      \n                                                       This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n                                                       \n                                                         \n                                                        \n                                                           To import your own key material into a KMS key, begin by creating a KMS key with no key material. To do this, use the [Origin] parameter of [CreateKey] with a value of [EXTERNAL]. Next, use [GetParametersForImport] operation to get a public key and import token. Use the wrapping public key to encrypt your key material. Then, use [ImportKeyMaterial] with your import token to import the key material. For step-by-step instructions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i  {i Key Management Service Developer Guide} }.\n                                                           \n                                                            You can import key material into KMS keys of all supported KMS key types: symmetric encryption KMS keys, HMAC KMS keys, asymmetric encryption KMS keys, and asymmetric signing KMS keys. You can also create multi-Region keys with imported key material. However, you can't import key material into a KMS key in a custom key store.\n                                                            \n                                                             To create a multi-Region primary key with imported key material, use the [Origin] parameter of [CreateKey] with a value of [EXTERNAL] and the [MultiRegion] parameter with a value of [True]. To create replicas of the multi-Region primary key, use the [ReplicateKey] operation. For instructions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-create-cmk.html }Importing key material step 1}. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n                                                             \n                                                               \n                                                              \n                                                                Custom key store  \nA {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store} lets you protect your Amazon Web Services resources using keys in a backing key store that you own and manage. When you request a cryptographic operation with a KMS key in a custom key store, the operation is performed in the backing key store using its cryptographic keys.\n\n KMS supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key stores} backed by an CloudHSM cluster and {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key stores} backed by an external key manager outside of Amazon Web Services. When you create a KMS key in an CloudHSM key store, KMS generates an encryption key in the CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you specify an existing encryption key in the external key manager.\n \n   Some external key managers provide a simpler method for creating a KMS key in an external key store. For details, see your external key manager documentation.\n   \n     Before you create a KMS key in a custom key store, the [ConnectionState] of the key store must be [CONNECTED]. To connect the custom key store, use the [ConnectCustomKeyStore] operation. To find the [ConnectionState], use the [DescribeCustomKeyStores] operation.\n     \n      To create a KMS key in a custom key store, use the [CustomKeyStoreId]. Use the default [KeySpec] value, [SYMMETRIC_DEFAULT], and the default [KeyUsage] value, [ENCRYPT_DECRYPT] to create a symmetric encryption key. No other key type is supported in a custom key store.\n      \n       To create a KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-cmk-keystore.html}CloudHSM key store}, use the [Origin] parameter with a value of [AWS_CLOUDHSM]. The CloudHSM cluster that is associated with the custom key store must have at least two active HSMs in different Availability Zones in the Amazon Web Services Region.\n       \n        To create a KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html}external key store}, use the [Origin] parameter with a value of [EXTERNAL_KEY_STORE] and an [XksKeyId] parameter that identifies an existing external key.\n        \n          Some external key managers provide a simpler method for creating a KMS key in an external key store. For details, see your external key manager documentation.\n          \n               {b Cross-account use}: No. You cannot use this operation to create a KMS key in a different Amazon Web Services account.\n              \n                {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:CreateKey} (IAM policy). To use the [Tags] parameter, {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} (IAM policy). For examples and information about related permissions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/customer-managed-policies.html#iam-policy-example-create-key}Allow a user to create KMS keys} in the {i Key Management Service Developer Guide}.\n               \n                 {b Related operations:} \n                \n                 {ul\n                       {-   [DescribeKey] \n                           \n                            }\n                       {-   [ListKeys] \n                           \n                            }\n                       {-   [ScheduleKeyDeletion] \n                           \n                            }\n                       }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module Decrypt :
sig
  val request :
    Smaws_Lib.Context.t ->
      decrypt_request ->
        (decrypt_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `IncorrectKeyException of incorrect_key_exception 
          | `InvalidCiphertextException of invalid_ciphertext_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Decrypts ciphertext that was encrypted by a KMS key using any of the following operations:\n\n {ul\n       {-   [Encrypt] \n           \n            }\n       {-   [GenerateDataKey] \n           \n            }\n       {-   [GenerateDataKeyPair] \n           \n            }\n       {-   [GenerateDataKeyWithoutPlaintext] \n           \n            }\n       {-   [GenerateDataKeyPairWithoutPlaintext] \n           \n            }\n       }\n   You can use this operation to decrypt ciphertext that was encrypted under a symmetric encryption KMS key or an asymmetric encryption KMS key. When the KMS key is asymmetric, you must specify the KMS key and the encryption algorithm that was used to encrypt the ciphertext. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.\n   \n    The [Decrypt] operation also decrypts ciphertext that was encrypted outside of KMS by the public key in an KMS asymmetric KMS key. However, it cannot decrypt symmetric ciphertext produced by other libraries, such as the {{:https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/}Amazon Web Services Encryption SDK} or {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon S3 client-side encryption}. These libraries return a ciphertext format that is incompatible with KMS.\n    \n     If the ciphertext was encrypted under a symmetric encryption KMS key, the [KeyId] parameter is optional. KMS can get this information from metadata that it adds to the symmetric ciphertext blob. This feature adds durability to your implementation by ensuring that authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost track of the key ID. However, specifying the KMS key is always recommended as a best practice. When you use the [KeyId] parameter to specify a KMS key, KMS only uses the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the [Decrypt] operation fails. This practice ensures that you use the KMS key that you intend.\n     \n      Whenever possible, use key policies to give users permission to call the [Decrypt] operation on a particular KMS key, instead of using IAM policies. Otherwise, you might create an IAM policy that gives the user [Decrypt] permission on all KMS keys. This user could decrypt ciphertext that was encrypted by KMS keys in other accounts if the key policy for the cross-account KMS key permits it. If you must use an IAM policy for [Decrypt] permissions, limit the user to particular KMS keys or particular trusted accounts. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policies-best-practices}Best practices for IAM policies} in the {i Key Management Service Developer Guide}.\n      \n        [Decrypt] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [Decrypt] for a Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. Instead of the plaintext data, the response includes the plaintext data encrypted with the public key from the attestation document ([CiphertextForRecipient]). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n       \n        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n        \n          {b Cross-account use}: Yes. If you use the [KeyId] parameter to identify a KMS key in a different Amazon Web Services account, specify the key ARN or the alias ARN of the KMS key.\n         \n           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Decrypt} (key policy)\n          \n            {b Related operations:} \n           \n            {ul\n                  {-   [Encrypt] \n                      \n                       }\n                  {-   [GenerateDataKey] \n                      \n                       }\n                  {-   [GenerateDataKeyPair] \n                      \n                       }\n                  {-   [ReEncrypt] \n                      \n                       }\n                  }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DeleteAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alias_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes the specified alias. \n\n  Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n    Because an alias is not a property of a KMS key, you can delete and change the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the [DescribeKey] operation. To get the aliases of all KMS keys, use the [ListAliases] operation. \n    \n     Each KMS key can have multiple aliases. To change the alias of a KMS key, use [DeleteAlias] to delete the current alias and [CreateAlias] to create a new alias. To associate an existing alias with a different KMS key, call [UpdateAlias].\n     \n       {b Cross-account use}: No. You cannot perform this operation on an alias in a different Amazon Web Services account.\n      \n        {b Required permissions} \n       \n        {ul\n              {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteAlias} on the alias (IAM policy).\n                  \n                   }\n              {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteAlias} on the KMS key (key policy).\n                  \n                   }\n              }\n   For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access}Controlling access to aliases} in the {i Key Management Service Developer Guide}.\n   \n     {b Related operations:} \n    \n     {ul\n           {-   [CreateAlias] \n               \n                }\n           {-   [ListAliases] \n               \n                }\n           {-   [UpdateAlias] \n               \n                }\n           }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DeleteCustomKeyStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_custom_key_store_request ->
        (delete_custom_key_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CustomKeyStoreHasCMKsException of
              custom_key_store_has_cm_ks_exception 
          | `CustomKeyStoreInvalidStateException of
              custom_key_store_invalid_state_exception 
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `KMSInternalException of kms_internal_exception ]) result
end[@@ocaml.doc
     "Deletes a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. This operation does not affect any backing elements of the custom key store. It does not delete the CloudHSM cluster that is associated with an CloudHSM key store, or affect any users or keys in the cluster. For an external key store, it does not affect the external key store proxy, external key manager, or any external keys.\n\n  This operation is part of the custom key stores feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.\n \n  The custom key store that you delete cannot contain any {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys}KMS keys}. Before deleting the key store, verify that you will never need to use any of the KMS keys in the key store for any {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations}. Then, use [ScheduleKeyDeletion] to delete the KMS keys from the key store. After the required waiting period expires and all KMS keys are deleted from the custom key store, use [DisconnectCustomKeyStore] to disconnect the key store from KMS. Then, you can delete the custom key store.\n  \n   For keys in an CloudHSM key store, the [ScheduleKeyDeletion] operation makes a best effort to delete the key material from the associated cluster. However, you might need to manually {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key}delete the orphaned key material} from the cluster and its backups. KMS never creates, manages, or deletes cryptographic keys in the external key manager associated with an external key store. You must manage them using your external key manager tools.\n   \n    Instead of deleting the custom key store, consider using the [DisconnectCustomKeyStore] operation to disconnect the custom key store from its backing key store. While the key store is disconnected, you cannot create or use the KMS keys in the key store. But, you do not need to delete KMS keys and you can reconnect a disconnected custom key store at any time.\n    \n     If the operation succeeds, it returns a JSON object with no properties.\n     \n       {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.\n      \n        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteCustomKeyStore} (IAM policy)\n       \n         {b Related operations:} \n        \n         {ul\n               {-   [ConnectCustomKeyStore] \n                   \n                    }\n               {-   [CreateCustomKeyStore] \n                   \n                    }\n               {-   [DescribeCustomKeyStores] \n                   \n                    }\n               {-   [DisconnectCustomKeyStore] \n                   \n                    }\n               {-   [UpdateCustomKeyStore] \n                   \n                    }\n               }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DeleteImportedKeyMaterial :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_imported_key_material_request ->
        (delete_imported_key_material_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Deletes key material that was previously imported. This operation makes the specified KMS key temporarily unusable. To restore the usability of the KMS key, reimport the same key material. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i Key Management Service Developer Guide}.\n\n When the specified KMS key is in the [PendingDeletion] state, this operation does not change the KMS key's state. Otherwise, it changes the KMS key's state to [PendingImport].\n \n  The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n  \n    {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeleteImportedKeyMaterial} (key policy)\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [GetParametersForImport] \n                \n                 }\n            {-   [ListKeyRotations] \n                \n                 }\n            {-   [ImportKeyMaterial] \n                \n                 }\n            }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DeriveSharedSecret :
sig
  val request :
    Smaws_Lib.Context.t ->
      derive_shared_secret_request ->
        (derive_shared_secret_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Derives a shared secret using a key agreement algorithm.\n\n  You must use an asymmetric NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) KMS key pair with a [KeyUsage] value of [KEY_AGREEMENT] to call DeriveSharedSecret.\n  \n    DeriveSharedSecret uses the {{:https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-56Ar3.pdf#page=60}Elliptic Curve Cryptography Cofactor Diffie-Hellman Primitive} (ECDH) to establish a key agreement between two peers by deriving a shared secret from their elliptic curve public-private key pairs. You can use the raw shared secret that DeriveSharedSecret returns to derive a symmetric key that can encrypt and decrypt data that is sent between the two peers, or that can generate and verify HMACs. KMS recommends that you follow {{:https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-56Cr2.pdf}NIST recommendations for key derivation} when using the raw shared secret to derive a symmetric key.\n    \n     The following workflow demonstrates how to establish key agreement over an insecure communication channel using DeriveSharedSecret.\n     \n      {ol\n            {-   {b Alice} calls [CreateKey] to create an asymmetric KMS key pair with a [KeyUsage] value of [KEY_AGREEMENT].\n                \n                 The asymmetric KMS key must use a NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) key spec.\n                 \n                  }\n            {-   {b Bob} creates an elliptic curve key pair.\n                \n                 Bob can call [CreateKey] to create an asymmetric KMS key pair or generate a key pair outside of KMS. Bob's key pair must use the same NIST-recommended elliptic curve (ECC) or SM2 (China Regions ony) curve as Alice.\n                 \n                  }\n            {-  Alice and Bob {b exchange their public keys} through an insecure communication channel (like the internet).\n                \n                 Use [GetPublicKey] to download the public key of your asymmetric KMS key pair.\n                 \n                   KMS strongly recommends verifying that the public key you receive came from the expected party before using it to derive a shared secret.\n                   \n                     }\n            {-   {b Alice} calls DeriveSharedSecret.\n                \n                 KMS uses the private key from the KMS key pair generated in {b Step 1}, Bob's public key, and the Elliptic Curve Cryptography Cofactor Diffie-Hellman Primitive to derive the shared secret. The private key in your KMS key pair never leaves KMS unencrypted. DeriveSharedSecret returns the raw shared secret.\n                 \n                  }\n            {-   {b Bob} uses the Elliptic Curve Cryptography Cofactor Diffie-Hellman Primitive to calculate the same raw secret using his private key and Alice's public key.\n                \n                 }\n            }\n   To derive a shared secret you must provide a key agreement algorithm, the private key of the caller's asymmetric NIST-recommended elliptic curve or SM2 (China Regions only) KMS key pair, and the public key from your peer's NIST-recommended elliptic curve or SM2 (China Regions only) key pair. The public key can be from another asymmetric KMS key pair or from a key pair generated outside of KMS, but both key pairs must be on the same elliptic curve.\n   \n    The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n    \n      {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n     \n       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DeriveSharedSecret} (key policy)\n      \n        {b Related operations:} \n       \n        {ul\n              {-   [CreateKey] \n                  \n                   }\n              {-   [GetPublicKey] \n                  \n                   }\n              {-   [DescribeKey] \n                  \n                   }\n              }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DescribeCustomKeyStores :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_custom_key_stores_request ->
        (describe_custom_key_stores_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception ]) result
end[@@ocaml.doc
     "Gets information about {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key stores} in the account and Region.\n\n  This operation is part of the custom key stores feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.\n \n  By default, this operation returns information about all custom key stores in the account and Region. To get only information about a particular custom key store, use either the [CustomKeyStoreName] or [CustomKeyStoreId] parameter (but not both).\n  \n   To determine whether the custom key store is connected to its CloudHSM cluster or external key store proxy, use the [ConnectionState] element in the response. If an attempt to connect the custom key store failed, the [ConnectionState] value is [FAILED] and the [ConnectionErrorCode] element in the response indicates the cause of the failure. For help interpreting the [ConnectionErrorCode], see [CustomKeyStoresListEntry].\n   \n    Custom key stores have a [DISCONNECTED] connection state if the key store has never been connected or you used the [DisconnectCustomKeyStore] operation to disconnect it. Otherwise, the connection state is CONNECTED. If your custom key store connection state is [CONNECTED] but you are having trouble using it, verify that the backing store is active and available. For an CloudHSM key store, verify that the associated CloudHSM cluster is active and contains the minimum number of HSMs required for the operation, if any. For an external key store, verify that the external key store proxy and its associated external key manager are reachable and enabled.\n    \n      For help repairing your CloudHSM key store, see the {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting CloudHSM key stores}. For help repairing your external key store, see the {{:https://docs.aws.amazon.com/kms/latest/developerguide/xks-troubleshooting.html}Troubleshooting external key stores}. Both topics are in the {i Key Management Service Developer Guide}.\n     \n       {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.\n      \n        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DescribeCustomKeyStores} (IAM policy)\n       \n         {b Related operations:} \n        \n         {ul\n               {-   [ConnectCustomKeyStore] \n                   \n                    }\n               {-   [CreateCustomKeyStore] \n                   \n                    }\n               {-   [DeleteCustomKeyStore] \n                   \n                    }\n               {-   [DisconnectCustomKeyStore] \n                   \n                    }\n               {-   [UpdateCustomKeyStore] \n                   \n                    }\n               }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DescribeKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_key_request ->
        (describe_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Provides detailed information about a KMS key. You can run [DescribeKey] on a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key} or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}.\n\n This detailed information includes the key ARN, creation date (and deletion date, if applicable), the key state, and the origin and expiration date (if any) of the key material. It includes fields, like [KeySpec], that help you distinguish different types of KMS keys. It also displays the key usage (encryption, signing, or generating and verifying MACs) and the algorithms that the KMS key supports. \n \n  For {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}multi-Region keys}, [DescribeKey] displays the primary key and all related replica keys. For KMS keys in {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-cloudhsm.html}CloudHSM key stores}, it includes information about the key store, such as the key store ID and the CloudHSM cluster ID. For KMS keys in {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key stores}, it includes the custom key store ID and the ID of the external key.\n  \n    [DescribeKey] does not return the following information:\n   \n    {ul\n          {-  Aliases associated with the KMS key. To get this information, use [ListAliases].\n              \n               }\n          {-  Whether automatic key rotation is enabled on the KMS key. To get this information, use [GetKeyRotationStatus]. Also, some key states prevent a KMS key from being automatically rotated. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-how-it-works}How key rotation works} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-  Tags on the KMS key. To get this information, use [ListResourceTags].\n              \n               }\n          {-  Key policies and grants on the KMS key. To get this information, use [GetKeyPolicy] and [ListGrants].\n              \n               }\n          }\n   In general, [DescribeKey] is a non-mutating operation. It returns data about KMS keys, but doesn't change them. However, Amazon Web Services services use [DescribeKey] to create {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed keys} from a {i predefined Amazon Web Services alias} with no key ID.\n   \n     {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n    \n      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DescribeKey} (key policy)\n     \n       {b Related operations:} \n      \n       {ul\n             {-   [GetKeyPolicy] \n                 \n                  }\n             {-   [GetKeyRotationStatus] \n                 \n                  }\n             {-   [ListAliases] \n                 \n                  }\n             {-   [ListGrants] \n                 \n                  }\n             {-   [ListKeys] \n                 \n                  }\n             {-   [ListResourceTags] \n                 \n                  }\n             {-   [ListRetirableGrants] \n                 \n                  }\n             }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DisableKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_key_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Sets the state of a KMS key to disabled. This change temporarily prevents use of the KMS key for {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations}. \n\n The KMS key that you use for this operation must be in a compatible key state. For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i  {i Key Management Service Developer Guide} }.\n \n   {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n  \n    {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DisableKey} (key policy)\n   \n     {b Related operations}: [EnableKey] \n    \n      {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n     "]
module DisableKeyRotation :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_key_rotation_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Disables {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-enable-disable.html}automatic rotation of the key material} of the specified symmetric encryption KMS key.\n\n Automatic key rotation is supported only on symmetric encryption KMS keys. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.\n \n  You can enable ([EnableKeyRotation]) and disable automatic rotation of the key material in {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed KMS keys}. Key material rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys} is not configurable. KMS always rotates the key material for every year. Rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned KMS keys} varies.\n  \n    In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years to every year. For details, see [EnableKeyRotation].\n    \n      The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n      \n        {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n       \n         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DisableKeyRotation} (key policy)\n        \n          {b Related operations:} \n         \n          {ul\n                {-   [EnableKeyRotation] \n                    \n                     }\n                {-   [GetKeyRotationStatus] \n                    \n                     }\n                {-   [ListKeyRotations] \n                    \n                     }\n                {-   [RotateKeyOnDemand] \n                    \n                     }\n                }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module DisconnectCustomKeyStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      disconnect_custom_key_store_request ->
        (disconnect_custom_key_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CustomKeyStoreInvalidStateException of
              custom_key_store_invalid_state_exception 
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `KMSInternalException of kms_internal_exception ]) result
end[@@ocaml.doc
     "Disconnects the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store} from its backing key store. This operation disconnects an CloudHSM key store from its associated CloudHSM cluster or disconnects an external key store from the external key store proxy that communicates with your external key manager.\n\n  This operation is part of the custom key stores feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.\n \n  While a custom key store is disconnected, you can manage the custom key store and its KMS keys, but you cannot create or use its KMS keys. You can reconnect the custom key store at any time.\n  \n    While a custom key store is disconnected, all attempts to create KMS keys in the custom key store or to use existing KMS keys in {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations} will fail. This action can prevent users from storing and accessing sensitive data.\n    \n      When you disconnect a custom key store, its [ConnectionState] changes to [Disconnected]. To find the connection state of a custom key store, use the [DescribeCustomKeyStores] operation. To reconnect a custom key store, use the [ConnectCustomKeyStore] operation.\n      \n       If the operation succeeds, it returns a JSON object with no properties.\n       \n         {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.\n        \n          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:DisconnectCustomKeyStore} (IAM policy)\n         \n           {b Related operations:} \n          \n           {ul\n                 {-   [ConnectCustomKeyStore] \n                     \n                      }\n                 {-   [CreateCustomKeyStore] \n                     \n                      }\n                 {-   [DeleteCustomKeyStore] \n                     \n                      }\n                 {-   [DescribeCustomKeyStores] \n                     \n                      }\n                 {-   [UpdateCustomKeyStore] \n                     \n                      }\n                 }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module EnableKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_key_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Sets the key state of a KMS key to enabled. This allows you to use the KMS key for {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#cryptographic-operations}cryptographic operations}. \n\n The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n \n   {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n  \n    {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:EnableKey} (key policy)\n   \n     {b Related operations}: [DisableKey] \n    \n      {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n     "]
module EnableKeyRotation :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_key_rotation_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Enables {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-enable-disable.html}automatic rotation of the key material} of the specified symmetric encryption KMS key. \n\n By default, when you enable automatic rotation of a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed KMS key}, KMS rotates the key material of the KMS key one year (approximately 365 days) from the enable date and every year thereafter. You can use the optional [RotationPeriodInDays] parameter to specify a custom rotation period when you enable key rotation, or you can use [RotationPeriodInDays] to modify the rotation period of a key that you previously enabled automatic key rotation on.\n \n  You can monitor rotation of the key material for your KMS keys in CloudTrail and Amazon CloudWatch. To disable rotation of the key material in a customer managed KMS key, use the [DisableKeyRotation] operation. You can use the [GetKeyRotationStatus] operation to identify any in progress rotations. You can use the [ListKeyRotations] operation to view the details of completed rotations.\n  \n   Automatic key rotation is supported only on symmetric encryption KMS keys. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate}multi-Region keys}, set the property on the primary key. \n   \n    You cannot enable or disable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys}. KMS always rotates the key material of Amazon Web Services managed keys every year. Rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned KMS keys} is managed by the Amazon Web Services service that owns the key.\n    \n      In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years (approximately 1,095 days) to every year (approximately 365 days).\n      \n       New Amazon Web Services managed keys are automatically rotated one year after they are created, and approximately every year thereafter. \n       \n        Existing Amazon Web Services managed keys are automatically rotated one year after their most recent rotation, and every year thereafter.\n        \n          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n          \n            {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n           \n             {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:EnableKeyRotation} (key policy)\n            \n              {b Related operations:} \n             \n              {ul\n                    {-   [DisableKeyRotation] \n                        \n                         }\n                    {-   [GetKeyRotationStatus] \n                        \n                         }\n                    {-   [ListKeyRotations] \n                        \n                         }\n                    {-   [RotateKeyOnDemand] \n                        \n                          You can perform on-demand ([RotateKeyOnDemand]) rotation of the key material in customer managed KMS keys, regardless of whether or not automatic key rotation is enabled.\n                          \n                            }\n                    }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module Encrypt :
sig
  val request :
    Smaws_Lib.Context.t ->
      encrypt_request ->
        (encrypt_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Encrypts plaintext of up to 4,096 bytes using a KMS key. You can use a symmetric or asymmetric KMS key with a [KeyUsage] of [ENCRYPT_DECRYPT].\n\n You can use this operation to encrypt small amounts of arbitrary data, such as a personal identifier or database password, or other sensitive information. You don't need to use the [Encrypt] operation to encrypt a data key. The [GenerateDataKey] and [GenerateDataKeyPair] operations return a plaintext data key and an encrypted copy of that data key.\n \n  If you use a symmetric encryption KMS key, you can use an encryption context to add additional security to your encryption operation. If you specify an [EncryptionContext] when encrypting data, you must specify the same encryption context (a case-sensitive exact match) when decrypting the data. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption Context} in the {i Key Management Service Developer Guide}.\n  \n   If you specify an asymmetric KMS key, you must also specify the encryption algorithm. The algorithm must be compatible with the KMS key spec.\n   \n     When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.\n     \n      You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric encryption KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.\n      \n        The maximum size of the data that you can encrypt varies with the type of KMS key and the encryption algorithm that you choose.\n        \n         {ul\n               {-  Symmetric encryption KMS keys\n                   \n                    {ul\n                          {-   [SYMMETRIC_DEFAULT]: 4096 bytes\n                              \n                               }\n                          \n                }\n                 }\n               {-   [RSA_2048] \n                   \n                    {ul\n                          {-   [RSAES_OAEP_SHA_1]: 214 bytes\n                              \n                               }\n                          {-   [RSAES_OAEP_SHA_256]: 190 bytes\n                              \n                               }\n                          \n                }\n                 }\n               {-   [RSA_3072] \n                   \n                    {ul\n                          {-   [RSAES_OAEP_SHA_1]: 342 bytes\n                              \n                               }\n                          {-   [RSAES_OAEP_SHA_256]: 318 bytes\n                              \n                               }\n                          \n                }\n                 }\n               {-   [RSA_4096] \n                   \n                    {ul\n                          {-   [RSAES_OAEP_SHA_1]: 470 bytes\n                              \n                               }\n                          {-   [RSAES_OAEP_SHA_256]: 446 bytes\n                              \n                               }\n                          \n                }\n                 }\n               {-   [SM2PKE]: 1024 bytes (China Regions only)\n                   \n                    }\n               }\n   The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n   \n     {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n    \n      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Encrypt} (key policy)\n     \n       {b Related operations:} \n      \n       {ul\n             {-   [Decrypt] \n                 \n                  }\n             {-   [GenerateDataKey] \n                 \n                  }\n             {-   [GenerateDataKeyPair] \n                 \n                  }\n             }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GenerateDataKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_request ->
        (generate_data_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Returns a unique symmetric data key for use outside of KMS. This operation returns a plaintext copy of the data key and a copy that is encrypted under a symmetric encryption KMS key that you specify. The bytes in the plaintext key are random; they are not related to the caller or the KMS key. You can use the plaintext key to encrypt your data outside of KMS and store the encrypted data key with the encrypted data.\n\n To generate a data key, specify the symmetric encryption KMS key that will be used to encrypt the data key. You cannot use an asymmetric KMS key to encrypt data keys. To get the type of your KMS key, use the [DescribeKey] operation.\n \n  You must also specify the length of the data key. Use either the [KeySpec] or [NumberOfBytes] parameters (but not both). For 128-bit and 256-bit data keys, use the [KeySpec] parameter.\n  \n   To generate a 128-bit SM4 data key (China Regions only), specify a [KeySpec] value of [AES_128] or a [NumberOfBytes] value of [16]. The symmetric encryption key used in China Regions to encrypt your data key is an SM4 encryption key.\n   \n    To get only an encrypted copy of the data key, use [GenerateDataKeyWithoutPlaintext]. To generate an asymmetric data key pair, use the [GenerateDataKeyPair] or [GenerateDataKeyPairWithoutPlaintext] operation. To get a cryptographically secure random byte string, use [GenerateRandom].\n    \n     You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption Context} in the {i Key Management Service Developer Guide}.\n     \n       [GenerateDataKey] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [GenerateDataKey] for an Amazon Web Services Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. [GenerateDataKey] returns a copy of the data key encrypted under the specified KMS key, as usual. But instead of a plaintext copy of the data key, the response includes a copy of the data key encrypted under the public key from the attestation document ([CiphertextForRecipient]). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}..\n      \n       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n       \n         {b How to use your data key} \n        \n         We recommend that you use the following pattern to encrypt data locally in your application. You can write your own code or use a client-side encryption library, such as the {{:https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/}Amazon Web Services Encryption SDK}, the {{:https://docs.aws.amazon.com/dynamodb-encryption-client/latest/devguide/}Amazon DynamoDB Encryption Client}, or {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon S3 client-side encryption} to do these tasks for you.\n         \n          To encrypt data outside of KMS:\n          \n           {ol\n                 {-  Use the [GenerateDataKey] operation to get a data key.\n                     \n                      }\n                 {-  Use the plaintext data key (in the [Plaintext] field of the response) to encrypt your data outside of KMS. Then erase the plaintext data key from memory.\n                     \n                      }\n                 {-  Store the encrypted data key (in the [CiphertextBlob] field of the response) with the encrypted data.\n                     \n                      }\n                 }\n   To decrypt data outside of KMS:\n   \n    {ol\n          {-  Use the [Decrypt] operation to decrypt the encrypted data key. The operation returns a plaintext copy of the data key.\n              \n               }\n          {-  Use the plaintext data key to decrypt data outside of KMS, then erase the plaintext data key from memory.\n              \n               }\n          }\n    {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKey} (key policy)\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [Decrypt] \n                \n                 }\n            {-   [Encrypt] \n                \n                 }\n            {-   [GenerateDataKeyPair] \n                \n                 }\n            {-   [GenerateDataKeyPairWithoutPlaintext] \n                \n                 }\n            {-   [GenerateDataKeyWithoutPlaintext] \n                \n                 }\n            }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GenerateDataKeyPair :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_pair_request ->
        (generate_data_key_pair_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns a unique asymmetric data key pair for use outside of KMS. This operation returns a plaintext public key, a plaintext private key, and a copy of the private key that is encrypted under the symmetric encryption KMS key you specify. You can use the data key pair to perform asymmetric cryptography and implement digital signatures outside of KMS. The bytes in the keys are random; they are not related to the caller or to the KMS key that is used to encrypt the private key. \n\n You can use the public key that [GenerateDataKeyPair] returns to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key with the data. When you are ready to decrypt data or sign a message, you can use the [Decrypt] operation to decrypt the encrypted private key.\n \n  To generate a data key pair, you must specify a symmetric encryption KMS key to encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation. \n  \n   Use the [KeyPairSpec] parameter to choose an RSA or Elliptic Curve (ECC) data key pair. In China Regions, you can also choose an SM2 data key pair. KMS recommends that you use ECC key pairs for signing, and use RSA and SM2 key pairs for either encryption or signing, but not both. However, KMS cannot enforce any restrictions on the use of data key pairs outside of KMS.\n   \n    If you are using the data key pair to encrypt data, or for any operation where you don't immediately need a private key, consider using the [GenerateDataKeyPairWithoutPlaintext] operation. [GenerateDataKeyPairWithoutPlaintext] returns a plaintext public key and an encrypted private key, but omits the plaintext private key that you need only to decrypt ciphertext or sign a message. Later, when you need to decrypt the data or sign a message, use the [Decrypt] operation to decrypt the encrypted private key in the data key pair.\n    \n      [GenerateDataKeyPair] returns a unique data key pair for each request. The bytes in the keys are random; they are not related to the caller or the KMS key that is used to encrypt the private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}. The private key is a DER-encoded PKCS8 PrivateKeyInfo, as specified in {{:https://tools.ietf.org/html/rfc5958}RFC 5958}.\n     \n       [GenerateDataKeyPair] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [GenerateDataKeyPair] for an Amazon Web Services Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. [GenerateDataKeyPair] returns the public data key and a copy of the private data key encrypted under the specified KMS key, as usual. But instead of a plaintext copy of the private data key ([PrivateKeyPlaintext]), the response includes a copy of the private data key encrypted under the public key from the attestation document ([CiphertextForRecipient]). For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}..\n      \n       You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption Context} in the {i Key Management Service Developer Guide}.\n       \n        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n        \n          {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n         \n           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKeyPair} (key policy)\n          \n            {b Related operations:} \n           \n            {ul\n                  {-   [Decrypt] \n                      \n                       }\n                  {-   [Encrypt] \n                      \n                       }\n                  {-   [GenerateDataKey] \n                      \n                       }\n                  {-   [GenerateDataKeyPairWithoutPlaintext] \n                      \n                       }\n                  {-   [GenerateDataKeyWithoutPlaintext] \n                      \n                       }\n                  }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GenerateDataKeyPairWithoutPlaintext :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_pair_without_plaintext_request ->
        (generate_data_key_pair_without_plaintext_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns a unique asymmetric data key pair for use outside of KMS. This operation returns a plaintext public key and a copy of the private key that is encrypted under the symmetric encryption KMS key you specify. Unlike [GenerateDataKeyPair], this operation does not return a plaintext private key. The bytes in the keys are random; they are not related to the caller or to the KMS key that is used to encrypt the private key. \n\n You can use the public key that [GenerateDataKeyPairWithoutPlaintext] returns to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key with the data. When you are ready to decrypt data or sign a message, you can use the [Decrypt] operation to decrypt the encrypted private key.\n \n  To generate a data key pair, you must specify a symmetric encryption KMS key to encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation. \n  \n   Use the [KeyPairSpec] parameter to choose an RSA or Elliptic Curve (ECC) data key pair. In China Regions, you can also choose an SM2 data key pair. KMS recommends that you use ECC key pairs for signing, and use RSA and SM2 key pairs for either encryption or signing, but not both. However, KMS cannot enforce any restrictions on the use of data key pairs outside of KMS.\n   \n     [GenerateDataKeyPairWithoutPlaintext] returns a unique data key pair for each request. The bytes in the key are not related to the caller or KMS key that is used to encrypt the private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}.\n    \n     You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption Context} in the {i Key Management Service Developer Guide}.\n     \n      The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n      \n        {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n       \n         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKeyPairWithoutPlaintext} (key policy)\n        \n          {b Related operations:} \n         \n          {ul\n                {-   [Decrypt] \n                    \n                     }\n                {-   [Encrypt] \n                    \n                     }\n                {-   [GenerateDataKey] \n                    \n                     }\n                {-   [GenerateDataKeyPair] \n                    \n                     }\n                {-   [GenerateDataKeyWithoutPlaintext] \n                    \n                     }\n                }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GenerateDataKeyWithoutPlaintext :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_data_key_without_plaintext_request ->
        (generate_data_key_without_plaintext_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Returns a unique symmetric data key for use outside of KMS. This operation returns a data key that is encrypted under a symmetric encryption KMS key that you specify. The bytes in the key are random; they are not related to the caller or to the KMS key.\n\n  [GenerateDataKeyWithoutPlaintext] is identical to the [GenerateDataKey] operation except that it does not return a plaintext copy of the data key. \n \n  This operation is useful for systems that need to encrypt data at some point, but not immediately. When you need to encrypt the data, you call the [Decrypt] operation on the encrypted copy of the key.\n  \n   It's also useful in distributed systems with different levels of trust. For example, you might store encrypted data in containers. One component of your system creates new containers and stores an encrypted data key with each container. Then, a different component puts the data into the containers. That component first decrypts the data key, uses the plaintext data key to encrypt data, puts the encrypted data into the container, and then destroys the plaintext data key. In this system, the component that creates the containers never sees the plaintext data key.\n   \n    To request an asymmetric data key pair, use the [GenerateDataKeyPair] or [GenerateDataKeyPairWithoutPlaintext] operations.\n    \n     To generate a data key, you must specify the symmetric encryption KMS key that is used to encrypt the data key. You cannot use an asymmetric KMS key or a key in a custom key store to generate a data key. To get the type of your KMS key, use the [DescribeKey] operation.\n     \n      You must also specify the length of the data key. Use either the [KeySpec] or [NumberOfBytes] parameters (but not both). For 128-bit and 256-bit data keys, use the [KeySpec] parameter.\n      \n       To generate an SM4 data key (China Regions only), specify a [KeySpec] value of [AES_128] or [NumberOfBytes] value of [16]. The symmetric encryption key used in China Regions to encrypt your data key is an SM4 encryption key.\n       \n        If the operation succeeds, you will find the encrypted copy of the data key in the [CiphertextBlob] field.\n        \n         You can use an optional encryption context to add additional security to the encryption operation. If you specify an [EncryptionContext], you must specify the same encryption context (a case-sensitive exact match) when decrypting the encrypted data key. Otherwise, the request to decrypt fails with an [InvalidCiphertextException]. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}Encryption Context} in the {i Key Management Service Developer Guide}.\n         \n          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n          \n            {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n           \n             {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateDataKeyWithoutPlaintext} (key policy)\n            \n              {b Related operations:} \n             \n              {ul\n                    {-   [Decrypt] \n                        \n                         }\n                    {-   [Encrypt] \n                        \n                         }\n                    {-   [GenerateDataKey] \n                        \n                         }\n                    {-   [GenerateDataKeyPair] \n                        \n                         }\n                    {-   [GenerateDataKeyPairWithoutPlaintext] \n                        \n                         }\n                    }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GenerateMac :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_mac_request ->
        (generate_mac_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Generates a hash-based message authentication code (HMAC) for a message using an HMAC KMS key and a MAC algorithm that the key supports. HMAC KMS keys and the HMAC algorithms that KMS uses conform to industry standards defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.\n\n You can use value that GenerateMac returns in the [VerifyMac] operation to demonstrate that the original message has not changed. Also, because a secret key is used to create the hash, you can verify that the party that generated the hash has the required secret key. You can also use the raw result to implement HMAC-based algorithms such as key derivation functions. This operation is part of KMS support for HMAC KMS keys. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC keys in KMS} in the {i  {i Key Management Service Developer Guide} }.\n \n   Best practices recommend that you limit the time during which any signing mechanism, including an HMAC, is effective. This deters an attack where the actor uses a signed message to establish validity repeatedly or long after the message is superseded. HMAC tags do not include a timestamp, but you can include a timestamp in the token or message to help you detect when its time to refresh the HMAC. \n   \n     The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n     \n       {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter. \n      \n        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateMac} (key policy)\n       \n         {b Related operations}: [VerifyMac] \n        \n          {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n         "]
module GenerateRandom :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_random_request ->
        (generate_random_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CustomKeyStoreInvalidStateException of
              custom_key_store_invalid_state_exception 
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `KMSInternalException of kms_internal_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns a random byte string that is cryptographically secure.\n\n You must use the [NumberOfBytes] parameter to specify the length of the random byte string. There is no default value for string length.\n \n  By default, the random byte string is generated in KMS. To generate the byte string in the CloudHSM cluster associated with an CloudHSM key store, use the [CustomKeyStoreId] parameter.\n  \n    [GenerateRandom] also supports {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave.html}Amazon Web Services Nitro Enclaves}, which provide an isolated compute environment in Amazon EC2. To call [GenerateRandom] for a Nitro enclave, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK. Use the [Recipient] parameter to provide the attestation document for the enclave. Instead of plaintext bytes, the response includes the plaintext bytes encrypted under the public key from the attestation document ([CiphertextForRecipient]).For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   \n    For more information about entropy and random number generation, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-cryptography.html#entropy-and-random-numbers}Entropy and random number generation} in the {i Key Management Service Developer Guide}.\n    \n      {b Cross-account use}: Not applicable. [GenerateRandom] does not use any account-specific resources, such as KMS keys.\n     \n       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GenerateRandom} (IAM policy)\n      \n        {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n       "]
module GetKeyPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_policy_request ->
        (get_key_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Gets a key policy attached to the specified KMS key.\n\n  {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n \n   {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetKeyPolicy} (key policy)\n  \n    {b Related operations}: {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} \n   \n     {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n    "]
module GetKeyRotationStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_rotation_status_request ->
        (get_key_rotation_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Provides detailed information about the rotation status for a KMS key, including whether {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-enable-disable.html}automatic rotation of the key material} is enabled for the specified KMS key, the {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotation-period}rotation period}, and the next scheduled rotation date.\n\n Automatic key rotation is supported only on symmetric encryption KMS keys. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.\n \n  You can enable ([EnableKeyRotation]) and disable automatic rotation ([DisableKeyRotation]) of the key material in customer managed KMS keys. Key material rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys} is not configurable. KMS always rotates the key material in Amazon Web Services managed KMS keys every year. The key rotation status for Amazon Web Services managed KMS keys is always [true].\n  \n   You can perform on-demand ([RotateKeyOnDemand]) rotation of the key material in customer managed KMS keys, regardless of whether or not automatic key rotation is enabled. You can use GetKeyRotationStatus to identify the date and time that an in progress on-demand rotation was initiated. You can use [ListKeyRotations] to view the details of completed rotations.\n   \n     In May 2022, KMS changed the rotation schedule for Amazon Web Services managed keys from every three years to every year. For details, see [EnableKeyRotation].\n     \n       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n       \n        {ul\n              {-  Disabled: The key rotation status does not change when you disable a KMS key. However, while the KMS key is disabled, KMS does not rotate the key material. When you re-enable the KMS key, rotation resumes. If the key material in the re-enabled KMS key hasn't been rotated in one year, KMS rotates it immediately, and every year thereafter. If it's been less than a year since the key material in the re-enabled KMS key was rotated, the KMS key resumes its prior rotation schedule.\n                  \n                   }\n              {-  Pending deletion: While a KMS key is pending deletion, its key rotation status is [false] and KMS does not rotate the key material. If you cancel the deletion, the original key rotation status returns to [true].\n                  \n                   }\n              }\n    {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetKeyRotationStatus} (key policy)\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [DisableKeyRotation] \n                \n                 }\n            {-   [EnableKeyRotation] \n                \n                 }\n            {-   [ListKeyRotations] \n                \n                 }\n            {-   [RotateKeyOnDemand] \n                \n                 }\n            }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GetParametersForImport :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_for_import_request ->
        (get_parameters_for_import_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns the public key and an import token you need to import or reimport key material for a KMS key. \n\n By default, KMS keys are created with key material that KMS generates. This operation supports {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing key material}, an advanced feature that lets you generate and import the cryptographic key material for a KMS key.\n \n  Before calling [GetParametersForImport], use the [CreateKey] operation with an [Origin] value of [EXTERNAL] to create a KMS key with no key material. You can import key material for a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key. You can also import key material into a {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. However, you can't import key material into a KMS key in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. You can also use [GetParametersForImport] to get a public key and import token to {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html#reimport-key-material}reimport the original key material} into a KMS key whose key material expired or was deleted.\n  \n    [GetParametersForImport] returns the items that you need to import your key material.\n   \n    {ul\n          {-  The public key (or \"wrapping key\") of an RSA key pair that KMS generates.\n              \n               You will use this public key to encrypt (\"wrap\") your key material while it's in transit to KMS. \n               \n                }\n          {-  A import token that ensures that KMS can decrypt your key material and associate it with the correct KMS key.\n              \n               }\n          }\n   The public key and its import token are permanently linked and must be used together. Each public key and import token set is valid for 24 hours. The expiration date and time appear in the [ParametersValidTo] field in the [GetParametersForImport] response. You cannot use an expired public key or import token in an [ImportKeyMaterial] request. If your key and token expire, send another [GetParametersForImport] request.\n   \n     [GetParametersForImport] requires the following information:\n    \n     {ul\n           {-  The key ID of the KMS key for which you are importing the key material.\n               \n                }\n           {-  The key spec of the public key (\"wrapping key\") that you will use to encrypt your key material during import.\n               \n                }\n           {-  The wrapping algorithm that you will use with the public key to encrypt your key material.\n               \n                }\n           }\n   You can use the same or a different public key spec and wrapping algorithm each time you import or reimport the same key material. \n   \n    The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n    \n      {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n     \n       {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetParametersForImport} (key policy)\n      \n        {b Related operations:} \n       \n        {ul\n              {-   [ImportKeyMaterial] \n                  \n                   }\n              {-   [DeleteImportedKeyMaterial] \n                  \n                   }\n              }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module GetPublicKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_public_key_request ->
        (get_public_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns the public key of an asymmetric KMS key. Unlike the private key of a asymmetric KMS key, which never leaves KMS unencrypted, callers with [kms:GetPublicKey] permission can download the public key of an asymmetric KMS key. You can share the public key to allow others to encrypt messages and verify signatures outside of KMS. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.\n\n You do not need to download the public key. Instead, you can use the public key within KMS by calling the [Encrypt], [ReEncrypt], or [Verify] operations with the identifier of an asymmetric KMS key. When you use the public key within KMS, you benefit from the authentication, authorization, and logging that are part of every KMS operation. You also reduce of risk of encrypting data that cannot be decrypted. These features are not effective outside of KMS.\n \n  To help you use the public key safely outside of KMS, [GetPublicKey] returns important information about the public key in the response, including:\n  \n   {ul\n         {-   {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeySpec}KeySpec}: The type of key material in the public key, such as [RSA_4096] or [ECC_NIST_P521].\n             \n              }\n         {-   {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeyUsage}KeyUsage}: Whether the key is used for encryption, signing, or deriving a shared secret.\n             \n              }\n         {-   {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-EncryptionAlgorithms}EncryptionAlgorithms}, {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeyAgreementAlgorithms}KeyAgreementAlgorithms}, or {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-SigningAlgorithms}SigningAlgorithms}: A list of the encryption algorithms, key agreement algorithms, or signing algorithms for the key.\n             \n              }\n         }\n   Although KMS cannot enforce these restrictions on external operations, it is crucial that you use this information to prevent the public key from being used improperly. For example, you can prevent a public signing key from being used encrypt data, or prevent a public key from being used with an encryption algorithm that is not supported by KMS. You can also avoid errors, such as using the wrong signing algorithm in a verification operation.\n   \n    To verify a signature outside of KMS with an SM2 public key (China Regions only), you must specify the distinguishing ID. By default, KMS uses [1234567812345678] as the distinguishing ID. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/offline-operations.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.\n    \n     The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n     \n       {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n      \n        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:GetPublicKey} (key policy)\n       \n         {b Related operations}: [CreateKey] \n        \n          {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n         "]
module ImportKeyMaterial :
sig
  val request :
    Smaws_Lib.Context.t ->
      import_key_material_request ->
        (import_key_material_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `ExpiredImportTokenException of expired_import_token_exception 
          | `IncorrectKeyMaterialException of
              incorrect_key_material_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidCiphertextException of invalid_ciphertext_exception 
          | `InvalidImportTokenException of invalid_import_token_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Imports or reimports key material into an existing KMS key that was created without key material. You can also use this operation to set or update the expiration model and expiration date of the imported key material.\n\n By default, KMS creates KMS keys with key material that it generates. You can also generate and import your own key material. For more information about importing key material, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing key material}.\n \n  For asymmetric, HMAC and multi-Region keys, you cannot change the key material after the initial import. You can import multiple key materials into single-Region, symmetric encryption keys and rotate the key material on demand using [RotateKeyOnDemand].\n  \n   After you import key material, you can {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html#reimport-key-material}reimport the same key material} into that KMS key or, if the key supports on-demand rotation, import new key material. You can use the [ImportType] parameter to indicate whether you are importing new key material or re-importing previously imported key material. You might reimport key material to replace key material that expired or key material that you deleted. You might also reimport key material to change the expiration model or expiration date of the key material.\n   \n    Each time you import key material into KMS, you can determine whether ([ExpirationModel]) and when ([ValidTo]) the key material expires. To change the expiration of your key material, you must import it again, either by calling [ImportKeyMaterial] or using the {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html#importing-keys-import-key-material-console}import features} of the KMS console.\n    \n     Before you call [ImportKeyMaterial], complete these steps:\n     \n      {ul\n            {-  Create or identify a KMS key with [EXTERNAL] origin, which indicates that the KMS key is designed for imported key material. \n                \n                 To create a new KMS key for imported key material, call the [CreateKey] operation with an [Origin] value of [EXTERNAL]. You can create a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, asymmetric key agreement key, or asymmetric signing KMS key. You can also import key material into a {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. However, you can't import key material into a KMS key in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}.\n                 \n                  }\n            {-  Call the [GetParametersForImport] operation to get a public key and import token set for importing key material. \n                \n                 }\n            {-  Use the public key in the [GetParametersForImport] response to encrypt your key material.\n                \n                 }\n            }\n    Then, in an [ImportKeyMaterial] request, you submit your encrypted key material and import token. When calling this operation, you must specify the following values:\n   \n    {ul\n          {-  The key ID or key ARN of the KMS key to associate with the imported key material. Its [Origin] must be [EXTERNAL] and its [KeyState] must be [PendingImport]. You cannot perform this operation on a KMS key in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}, or on a KMS key in a different Amazon Web Services account. To get the [Origin] and [KeyState] of a KMS key, call [DescribeKey].\n              \n               }\n          {-  The encrypted key material. \n              \n               }\n          {-  The import token that [GetParametersForImport] returned. You must use a public key and token from the same [GetParametersForImport] response.\n              \n               }\n          {-  Whether the key material expires ([ExpirationModel]) and, if so, when ([ValidTo]). For help with this choice, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html#importing-keys-expiration}Setting an expiration time} in the {i Key Management Service Developer Guide}.\n              \n               If you set an expiration date, KMS deletes the key material from the KMS key on the specified date, making the KMS key unusable. To use the KMS key in cryptographic operations again, you must reimport the same key material. However, you can delete and reimport the key material at any time, including before the key material expires. Each time you reimport, you can eliminate or reset the expiration time.\n               \n                }\n          }\n   When this operation is successful, the key state of the KMS key changes from [PendingImport] to [Enabled], and you can use the KMS key in cryptographic operations. For single-Region, symmetric encryption keys, you will need to import all of the key materials associated with the KMS key to change its state to [Enabled]. Use the [ListKeyRotations] operation to list the ID and import state of each key material associated with a KMS key.\n   \n    If this operation fails, use the exception to help determine the problem. If the error is related to the key material, the import token, or wrapping key, use [GetParametersForImport] to get a new public key and import token for the KMS key and repeat the import procedure. For help, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-conceptual.html}Create a KMS key with imported key material} in the {i Key Management Service Developer Guide}.\n    \n     The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n     \n       {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n      \n        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ImportKeyMaterial} (key policy)\n       \n         {b Related operations:} \n        \n         {ul\n               {-   [DeleteImportedKeyMaterial] \n                   \n                    }\n               {-   [GetParametersForImport] \n                   \n                    }\n               {-   [ListKeyRotations] \n                   \n                    }\n               {-   [RotateKeyOnDemand] \n                   \n                    }\n               }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListAliases :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_aliases_request ->
        (list_aliases_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Gets a list of aliases in the caller's Amazon Web Services account and region. For more information about aliases, see [CreateAlias].\n\n By default, the [ListAliases] operation returns all aliases in the account and region. To get only the aliases associated with a particular KMS key, use the [KeyId] parameter.\n \n  The [ListAliases] response can include aliases that you created and associated with your customer managed keys, and aliases that Amazon Web Services created and associated with Amazon Web Services managed keys in your account. You can recognize Amazon Web Services aliases because their names have the format \n  {[\n  aws/\n  ]}\n  , such as [aws/dynamodb].\n  \n   The response might also include aliases that have no [TargetKeyId] field. These are predefined aliases that Amazon Web Services has created but has not yet associated with a KMS key. Aliases that Amazon Web Services creates in your account, including predefined aliases, do not count against your {{:https://docs.aws.amazon.com/kms/latest/developerguide/resource-limits.html#aliases-per-key}KMS aliases quota}.\n   \n     {b Cross-account use}: No. [ListAliases] does not return aliases in other Amazon Web Services accounts.\n    \n      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListAliases} (IAM policy)\n     \n      For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/alias-access.html}Controlling access to aliases} in the {i Key Management Service Developer Guide}.\n      \n        {b Related operations:} \n       \n        {ul\n              {-   [CreateAlias] \n                  \n                   }\n              {-   [DeleteAlias] \n                  \n                   }\n              {-   [UpdateAlias] \n                  \n                   }\n              }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListGrants :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_grants_request ->
        (list_grants_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidGrantIdException of invalid_grant_id_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Gets a list of all grants for the specified KMS key. \n\n You must specify the KMS key in all requests. You can filter the grant list by grant ID or grantee principal.\n \n  For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i  {i Key Management Service Developer Guide} }. For examples of creating grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/example_kms_CreateGrant_section.html}Use CreateGrant with an Amazon Web Services SDK or CLI}. \n  \n    The [GranteePrincipal] field in the [ListGrants] response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the [GranteePrincipal] field contains the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services}service principal}, which might represent several different grantee principals.\n    \n       {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.\n      \n        {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListGrants} (key policy)\n       \n         {b Related operations:} \n        \n         {ul\n               {-   [CreateGrant] \n                   \n                    }\n               {-   [ListRetirableGrants] \n                   \n                    }\n               {-   [RetireGrant] \n                   \n                    }\n               {-   [RevokeGrant] \n                   \n                    }\n               }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListKeyPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_key_policies_request ->
        (list_key_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Gets the names of the key policies that are attached to a KMS key. This operation is designed to get policy names that you can use in a [GetKeyPolicy] operation. However, the only valid policy name is [default]. \n\n  {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n \n   {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListKeyPolicies} (key policy)\n  \n    {b Related operations:} \n   \n    {ul\n          {-   [GetKeyPolicy] \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} \n              \n               }\n          }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListKeyRotations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_key_rotations_request ->
        (list_key_rotations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns information about the key materials associated with the specified KMS key. You can use the optional [IncludeKeyMaterial] parameter to control which key materials are included in the response.\n\n You must specify the KMS key in all requests. You can refine the key rotations list by limiting the number of rotations returned.\n \n  For detailed information about automatic and on-demand key rotations, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}Rotate KMS keys} in the {i Key Management Service Developer Guide}.\n  \n    {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListKeyRotations} (key policy)\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [EnableKeyRotation] \n                \n                 }\n            {-   [DeleteImportedKeyMaterial] \n                \n                 }\n            {-   [DisableKeyRotation] \n                \n                 }\n            {-   [GetKeyRotationStatus] \n                \n                 }\n            {-   [ImportKeyMaterial] \n                \n                 }\n            {-   [RotateKeyOnDemand] \n                \n                 }\n            }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_keys_request ->
        (list_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception ]) result
end[@@ocaml.doc
     "Gets a list of all KMS keys in the caller's Amazon Web Services account and Region.\n\n  {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n \n   {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListKeys} (IAM policy)\n  \n    {b Related operations:} \n   \n    {ul\n          {-   [CreateKey] \n              \n               }\n          {-   [DescribeKey] \n              \n               }\n          {-   [ListAliases] \n              \n               }\n          {-   [ListResourceTags] \n              \n               }\n          }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListResourceTags :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_tags_request ->
        (list_resource_tags_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Returns all tags on the specified KMS key.\n\n For general information about tags, including the format and syntax, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services resources} in the {i Amazon Web Services General Reference}. For information about using tags in KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tags in KMS}.\n \n   {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n  \n    {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListResourceTags} (key policy)\n   \n     {b Related operations:} \n    \n     {ul\n           {-   [CreateKey] \n               \n                }\n           {-   [ReplicateKey] \n               \n                }\n           {-   [TagResource] \n               \n                }\n           {-   [UntagResource] \n               \n                }\n           }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ListRetirableGrants :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_retirable_grants_request ->
        (list_grants_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidMarkerException of invalid_marker_exception 
          | `KMSInternalException of kms_internal_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Returns information about all grants in the Amazon Web Services account and Region that have the specified retiring principal. \n\n You can specify any principal in your Amazon Web Services account. The grants that are returned include grants for KMS keys in your Amazon Web Services account and other Amazon Web Services accounts. You might use this operation to determine which grants you may retire. To retire a grant, use the [RetireGrant] operation.\n \n  For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i  {i Key Management Service Developer Guide} }. For examples of creating grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/example_kms_CreateGrant_section.html}Use CreateGrant with an Amazon Web Services SDK or CLI}. \n  \n    {b Cross-account use}: You must specify a principal in your Amazon Web Services account. This operation returns a list of grants where the retiring principal specified in the [ListRetirableGrants] request is the same retiring principal on the grant. This can include grants on KMS keys owned by other Amazon Web Services accounts, but you do not need [kms:ListRetirableGrants] permission (or any other additional permission) in any Amazon Web Services account other than your own.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ListRetirableGrants} (IAM policy) in your Amazon Web Services account.\n    \n      KMS authorizes [ListRetirableGrants] requests by evaluating the caller account's kms:ListRetirableGrants permissions. The authorized resource in [ListRetirableGrants] calls is the retiring principal specified in the request. KMS does not evaluate the caller's permissions to verify their access to any KMS keys or grants that might be returned by the [ListRetirableGrants] call.\n      \n         {b Related operations:} \n        \n         {ul\n               {-   [CreateGrant] \n                   \n                    }\n               {-   [ListGrants] \n                   \n                    }\n               {-   [RetireGrant] \n                   \n                    }\n               {-   [RevokeGrant] \n                   \n                    }\n               }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module PutKeyPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_key_policy_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `MalformedPolicyDocumentException of
              malformed_policy_document_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Attaches a key policy to the specified KMS key. \n\n For more information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key Policies} in the {i Key Management Service Developer Guide}. For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }. For examples of adding a key policy in multiple programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/example_kms_PutKeyPolicy_section.html}Use PutKeyPolicy with an Amazon Web Services SDK or CLI} in the {i Key Management Service Developer Guide}.\n \n   {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n  \n    {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:PutKeyPolicy} (key policy)\n   \n     {b Related operations}: [GetKeyPolicy] \n    \n      {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n     "]
module ReEncrypt :
sig
  val request :
    Smaws_Lib.Context.t ->
      re_encrypt_request ->
        (re_encrypt_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `IncorrectKeyException of incorrect_key_exception 
          | `InvalidCiphertextException of invalid_ciphertext_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Decrypts ciphertext and then reencrypts it entirely within KMS. You can use this operation to change the KMS key under which data is encrypted, such as when you {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys-manually.html}manually rotate} a KMS key or change the KMS key that protects a ciphertext. You can also use it to reencrypt ciphertext under the same KMS key, such as to change the {{:https://docs.aws.amazon.com/kms/latest/developerguide/encrypt_context.html}encryption context} of a ciphertext.\n\n The [ReEncrypt] operation can decrypt ciphertext that was encrypted by using a KMS key in an KMS operation, such as [Encrypt] or [GenerateDataKey]. It can also decrypt ciphertext that was encrypted by using the public key of an {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS key} outside of KMS. However, it cannot decrypt ciphertext produced by other libraries, such as the {{:https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/}Amazon Web Services Encryption SDK} or {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon S3 client-side encryption}. These libraries return a ciphertext format that is incompatible with KMS.\n \n  When you use the [ReEncrypt] operation, you need to provide information for the decrypt operation and the subsequent encrypt operation.\n  \n   {ul\n         {-  If your ciphertext was encrypted under an asymmetric KMS key, you must use the [SourceKeyId] parameter to identify the KMS key that encrypted the ciphertext. You must also supply the encryption algorithm that was used. This information is required to decrypt the data.\n             \n              }\n         {-  If your ciphertext was encrypted under a symmetric encryption KMS key, the [SourceKeyId] parameter is optional. KMS can get this information from metadata that it adds to the symmetric ciphertext blob. This feature adds durability to your implementation by ensuring that authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost track of the key ID. However, specifying the source KMS key is always recommended as a best practice. When you use the [SourceKeyId] parameter to specify a KMS key, KMS uses only the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the [ReEncrypt] operation fails. This practice ensures that you use the KMS key that you intend.\n             \n              }\n         {-  To reencrypt the data, you must use the [DestinationKeyId] parameter to specify the KMS key that re-encrypts the data after it is decrypted. If the destination KMS key is an asymmetric KMS key, you must also provide the encryption algorithm. The algorithm that you choose must be compatible with the KMS key.\n             \n               When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.\n               \n                You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric encryption KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.\n                \n                  }\n         }\n   The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n   \n     {b Cross-account use}: Yes. The source KMS key and destination KMS key can be in different Amazon Web Services accounts. Either or both KMS keys can be in a different account than the caller. To specify a KMS key in a different account, you must use its key ARN or alias ARN.\n    \n      {b Required permissions}:\n     \n      {ul\n            {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ReEncryptFrom} permission on the source KMS key (key policy)\n                \n                 }\n            {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:ReEncryptTo} permission on the destination KMS key (key policy)\n                \n                 }\n            }\n   To permit reencryption from or to a KMS key, include the [\"kms:ReEncrypt*\"] permission in your {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}key policy}. This permission is automatically included in the key policy when you use the console to create a KMS key. But you must include it manually when you create a KMS key programmatically or when you use the [PutKeyPolicy] operation to set a key policy.\n   \n     {b Related operations:} \n    \n     {ul\n           {-   [Decrypt] \n               \n                }\n           {-   [Encrypt] \n               \n                }\n           {-   [GenerateDataKey] \n               \n                }\n           {-   [GenerateDataKeyPair] \n               \n                }\n           }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ReplicateKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      replicate_key_request ->
        (replicate_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AlreadyExistsException of already_exists_exception 
          | `DisabledException of disabled_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `MalformedPolicyDocumentException of
              malformed_policy_document_exception 
          | `NotFoundException of not_found_exception 
          | `TagException of tag_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Replicates a multi-Region key into the specified Region. This operation creates a multi-Region replica key based on a multi-Region primary key in a different Region of the same Amazon Web Services partition. You can create multiple replicas of a primary key, but each must be in a different Region. To create a multi-Region primary key, use the [CreateKey] operation.\n\n This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n \n  A {i replica key} is a fully-functional KMS key that can be used independently of its primary and peer replica keys. A primary key and its replica keys share properties that make them interoperable. They have the same {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id}key ID} and key material. They also have the same key spec, key usage, key material origin, and automatic key rotation status. KMS automatically synchronizes these shared properties among related multi-Region keys. All other properties of a replica key can differ, including its {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}key policy}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}tags}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html}aliases}, and {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}key state}. KMS pricing and quotas for KMS keys apply to each primary key and replica key.\n  \n   When this operation completes, the new replica key has a transient key state of [Creating]. This key state changes to [Enabled] (or [PendingImport]) after a few seconds when the process of creating the new replica key is complete. While the key state is [Creating], you can manage key, but you cannot yet use it in cryptographic operations. If you are creating and using the replica key programmatically, retry on [KMSInvalidStateException] or call [DescribeKey] to check its [KeyState] value before using it. For details about the [Creating] key state, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n   \n    You cannot create more than one replica of a primary key in any Region. If the Region already includes a replica of the key you're trying to replicate, [ReplicateKey] returns an [AlreadyExistsException] error. If the key state of the existing replica is [PendingDeletion], you can cancel the scheduled key deletion ([CancelKeyDeletion]) or wait for the key to be deleted. The new replica key you create will have the same {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-sync-properties}shared properties} as the original replica key.\n    \n     The CloudTrail log of a [ReplicateKey] operation records a [ReplicateKey] operation in the primary key's Region and a [CreateKey] operation in the replica key's Region.\n     \n      If you replicate a multi-Region primary key with imported key material, the replica key is created with no key material. You must import the same key material that you imported into the primary key.\n      \n       To convert a replica key to a primary key, use the [UpdatePrimaryRegion] operation.\n       \n          [ReplicateKey] uses different default values for the [KeyPolicy] and [Tags] parameters than those used in the KMS console. For details, see the parameter descriptions.\n         \n            {b Cross-account use}: No. You cannot use this operation to create a replica key in a different Amazon Web Services account. \n           \n             {b Required permissions}: \n            \n             {ul\n                   {-   [kms:ReplicateKey] on the primary key (in the primary key's Region). Include this permission in the primary key's key policy.\n                       \n                        }\n                   {-   [kms:CreateKey] in an IAM policy in the replica Region.\n                       \n                        }\n                   {-  To use the [Tags] parameter, [kms:TagResource] in an IAM policy in the replica Region.\n                       \n                        }\n                   }\n    {b Related operations} \n   \n    {ul\n          {-   [CreateKey] \n              \n               }\n          {-   [UpdatePrimaryRegion] \n              \n               }\n          }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module RetireGrant :
sig
  val request :
    Smaws_Lib.Context.t ->
      retire_grant_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidGrantIdException of invalid_grant_id_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes a grant. Typically, you retire a grant when you no longer need its permissions. To identify the grant to retire, use a {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}grant token}, or both the grant ID and a key identifier (key ID or key ARN) of the KMS key. The [CreateGrant] operation returns both values.\n\n This operation can be called by the {i retiring principal} for a grant, by the {i grantee principal} if the grant allows the [RetireGrant] operation, and by the Amazon Web Services account in which the grant is created. It can also be called by principals to whom permission for retiring a grant is delegated.\n \n  For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i  {i Key Management Service Developer Guide} }. For examples of creating grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/example_kms_CreateGrant_section.html}Use CreateGrant with an Amazon Web Services SDK or CLI}. \n  \n    {b Cross-account use}: Yes. You can retire a grant on a KMS key in a different Amazon Web Services account.\n   \n     {b Required permissions}: Permission to retire a grant is determined primarily by the grant. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-delete.html}Retiring and revoking grants} in the {i Key Management Service Developer Guide}.\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [CreateGrant] \n                \n                 }\n            {-   [ListGrants] \n                \n                 }\n            {-   [ListRetirableGrants] \n                \n                 }\n            {-   [RevokeGrant] \n                \n                 }\n            }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module RevokeGrant :
sig
  val request :
    Smaws_Lib.Context.t ->
      revoke_grant_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `InvalidGrantIdException of invalid_grant_id_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Deletes the specified grant. You revoke a grant to terminate the permissions that the grant allows. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-delete.html}Retiring and revoking grants} in the {i  {i Key Management Service Developer Guide} }.\n\n When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as {i eventual consistency}. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency}Eventual consistency} in the {i  {i Key Management Service Developer Guide} }. \n \n  For detailed information about grants, including grant terminology, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html}Grants in KMS} in the {i  {i Key Management Service Developer Guide} }. For examples of creating grants in several programming languages, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/example_kms_CreateGrant_section.html}Use CreateGrant with an Amazon Web Services SDK or CLI}. \n  \n    {b Cross-account use}: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key ARN in the value of the [KeyId] parameter.\n   \n     {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:RevokeGrant} (key policy).\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [CreateGrant] \n                \n                 }\n            {-   [ListGrants] \n                \n                 }\n            {-   [ListRetirableGrants] \n                \n                 }\n            {-   [RetireGrant] \n                \n                 }\n            }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module RotateKeyOnDemand :
sig
  val request :
    Smaws_Lib.Context.t ->
      rotate_key_on_demand_request ->
        (rotate_key_on_demand_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Immediately initiates rotation of the key material of the specified symmetric encryption KMS key.\n\n You can perform {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-on-demand.html}on-demand rotation} of the key material in customer managed KMS keys, regardless of whether or not {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotating-keys-enable-disable.html}automatic key rotation} is enabled. On-demand rotations do not change existing automatic rotation schedules. For example, consider a KMS key that has automatic key rotation enabled with a rotation period of 730 days. If the key is scheduled to automatically rotate on April 14, 2024, and you perform an on-demand rotation on April 10, 2024, the key will automatically rotate, as scheduled, on April 14, 2024 and every 730 days thereafter.\n \n   You can perform on-demand key rotation a {b maximum of 10 times} per KMS key. You can use the KMS console to view the number of remaining on-demand rotations available for a KMS key.\n   \n     You can use [GetKeyRotationStatus] to identify any in progress on-demand rotations. You can use [ListKeyRotations] to identify the date that completed on-demand rotations were performed. You can monitor rotation of the key material for your KMS keys in CloudTrail and Amazon CloudWatch.\n     \n      On-demand key rotation is supported only on symmetric encryption KMS keys. You cannot perform on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, multi-Region KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}. When you initiate on-demand key rotation on a symmetric encryption KMS key with imported key material, you must have already imported {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-import-key-material.html}new key material} and that key material's state should be [PENDING_ROTATION]. Use the [ListKeyRotations] operation to check the state of all key materials associated with a KMS key. To perform on-demand rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#multi-region-rotate}multi-Region keys}, invoke the on-demand rotation on the primary key.\n      \n       You cannot initiate on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed KMS keys}. KMS always rotates the key material of Amazon Web Services managed keys every year. Rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned KMS keys} is managed by the Amazon Web Services service that owns the key.\n       \n        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n        \n          {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n         \n           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:RotateKeyOnDemand} (key policy)\n          \n            {b Related operations:} \n           \n            {ul\n                  {-   [EnableKeyRotation] \n                      \n                       }\n                  {-   [DisableKeyRotation] \n                      \n                       }\n                  {-   [GetKeyRotationStatus] \n                      \n                       }\n                  {-   [ImportKeyMaterial] \n                      \n                       }\n                  {-   [ListKeyRotations] \n                      \n                       }\n                  }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module ScheduleKeyDeletion :
sig
  val request :
    Smaws_Lib.Context.t ->
      schedule_key_deletion_request ->
        (schedule_key_deletion_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Schedules the deletion of a KMS key. By default, KMS applies a waiting period of 30 days, but you can specify a waiting period of 7-30 days. When this operation is successful, the key state of the KMS key changes to [PendingDeletion] and the key can't be used in any cryptographic operations. It remains in this state for the duration of the waiting period. Before the waiting period ends, you can use [CancelKeyDeletion] to cancel the deletion of the KMS key. After the waiting period ends, KMS deletes the KMS key, its key material, and all KMS data associated with it, including all aliases that refer to it.\n\n  Deleting a KMS key is a destructive and potentially dangerous operation. When a KMS key is deleted, all data that was encrypted under the KMS key is unrecoverable. (The only exception is a {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-delete.html}multi-Region replica key}, or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#import-delete-key}asymmetric or HMAC KMS key with imported key material}.) To prevent the use of a KMS key without deleting it, use [DisableKey]. \n  \n    You can schedule the deletion of a multi-Region primary key and its replica keys at any time. However, KMS will not delete a multi-Region primary key with existing replica keys. If you schedule the deletion of a primary key with replicas, its key state changes to [PendingReplicaDeletion] and it cannot be replicated or used in cryptographic operations. This status can continue indefinitely. When the last of its replicas keys is deleted (not just scheduled), the key state of the primary key changes to [PendingDeletion] and its waiting period ([PendingWindowInDays]) begins. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#deleting-mrks}Deleting multi-Region keys} in the {i Key Management Service Developer Guide}.\n    \n     When KMS {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#delete-cmk-keystore}deletes a KMS key from an CloudHSM key store}, it makes a best effort to delete the associated key material from the associated CloudHSM cluster. However, you might need to manually {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key}delete the orphaned key material} from the cluster and its backups. {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html#delete-xks-key}Deleting a KMS key from an external key store} has no effect on the associated external key. However, for both types of custom key stores, deleting a KMS key is destructive and irreversible. You cannot decrypt ciphertext encrypted under the KMS key by using only its associated external key or CloudHSM key. Also, you cannot recreate a KMS key in an external key store by creating a new KMS key with the same key material.\n     \n      For more information about scheduling a KMS key for deletion, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html}Deleting KMS keys} in the {i Key Management Service Developer Guide}.\n      \n       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n       \n         {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n        \n          {b Required permissions}: kms:ScheduleKeyDeletion (key policy)\n         \n           {b Related operations} \n          \n           {ul\n                 {-   [CancelKeyDeletion] \n                     \n                      }\n                 {-   [DisableKey] \n                     \n                      }\n                 }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module Sign :
sig
  val request :
    Smaws_Lib.Context.t ->
      sign_request ->
        (sign_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Creates a {{:https://en.wikipedia.org/wiki/Digital_signature}digital signature} for a message or message digest by using the private key in an asymmetric signing KMS key. To verify the signature, use the [Verify] operation, or use the public key in the same asymmetric KMS key outside of KMS. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.\n\n Digital signatures are generated and verified by using asymmetric key pair, such as an RSA, ECC, or ML-DSA pair that is represented by an asymmetric KMS key. The key owner (or an authorized user) uses their private key to sign a message. Anyone with the public key can verify that the message was signed with that particular private key and that the message hasn't changed since it was signed. \n \n  To use the [Sign] operation, provide the following information:\n  \n   {ul\n         {-  Use the [KeyId] parameter to identify an asymmetric KMS key with a [KeyUsage] value of [SIGN_VERIFY]. To get the [KeyUsage] value of a KMS key, use the [DescribeKey] operation. The caller must have [kms:Sign] permission on the KMS key.\n             \n              }\n         {-  Use the [Message] parameter to specify the message or message digest to sign. You can submit messages of up to 4096 bytes. To sign a larger message, generate a hash digest of the message, and then provide the hash digest in the [Message] parameter. To indicate whether the message is a full message, a digest, or an ML-DSA EXTERNAL_MU, use the [MessageType] parameter.\n             \n              }\n         {-  Choose a signing algorithm that is compatible with the KMS key. \n             \n              }\n         }\n    When signing a message, be sure to record the KMS key and the signing algorithm. This information is required to verify the signature.\n    \n       Best practices recommend that you limit the time during which any signature is effective. This deters an attack where the actor uses a signed message to establish validity repeatedly or long after the message is superseded. Signatures do not include a timestamp, but you can include a timestamp in the signed message to help you detect when its time to refresh the signature. \n       \n         To verify the signature that this operation generates, use the [Verify] operation. Or use the [GetPublicKey] operation to download the public key and then use the public key to verify the signature outside of KMS. \n         \n          The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n          \n            {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter.\n           \n             {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Sign} (key policy)\n            \n              {b Related operations}: [Verify] \n             \n               {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n              "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception 
          | `TagException of tag_exception ]) result
end[@@ocaml.doc
     "Adds or edits tags on a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}.\n\n  Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n    Each tag consists of a tag key and a tag value, both of which are case-sensitive strings. The tag value can be an empty (null) string. To add a tag, specify a new tag key and a tag value. To edit a tag, specify an existing tag key and a new tag value.\n    \n     You can use this operation to tag a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}, but you cannot tag an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}, an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk}Amazon Web Services owned key}, a {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-overview.html}custom key store}, or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html}alias}.\n     \n      You can also add tags to a KMS key while creating it ([CreateKey]) or replicating it ([ReplicateKey]).\n      \n       For information about using tags in KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging keys}. For general information about tags, including the format and syntax, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services resources} in the {i Amazon Web Services General Reference}. \n       \n        The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n        \n          {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account. \n         \n           {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} (key policy)\n          \n            {b Related operations} \n           \n            {ul\n                  {-   [CreateKey] \n                      \n                       }\n                  {-   [ListResourceTags] \n                      \n                       }\n                  {-   [ReplicateKey] \n                      \n                       }\n                  {-   [UntagResource] \n                      \n                       }\n                  }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `TagException of tag_exception ]) result
end[@@ocaml.doc
     "Deletes tags from a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}. To delete a tag, specify the tag key and the KMS key.\n\n  Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n    When it succeeds, the [UntagResource] operation doesn't return any output. Also, if the specified tag key isn't found on the KMS key, it doesn't throw an exception or return a response. To confirm that the operation worked, use the [ListResourceTags] operation.\n    \n     For information about using tags in KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging keys}. For general information about tags, including the format and syntax, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services resources} in the {i Amazon Web Services General Reference}. \n     \n      The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n      \n        {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.\n       \n         {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UntagResource} (key policy)\n        \n          {b Related operations} \n         \n          {ul\n                {-   [CreateKey] \n                    \n                     }\n                {-   [ListResourceTags] \n                    \n                     }\n                {-   [ReplicateKey] \n                    \n                     }\n                {-   [TagResource] \n                    \n                     }\n                }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module UpdateAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_alias_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Associates an existing KMS alias with a different KMS key. Each alias is associated with only one KMS key at a time, although a KMS key can have multiple aliases. The alias and the KMS key must be in the same Amazon Web Services account and Region.\n\n  Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n    The current and new KMS key must be the same type (both symmetric or both asymmetric or both HMAC), and they must have the same key usage. This restriction prevents errors in code that uses aliases. If you must assign an alias to a different type of KMS key, use [DeleteAlias] to delete the old alias and [CreateAlias] to create a new alias.\n    \n     You cannot use [UpdateAlias] to change an alias name. To change an alias name, use [DeleteAlias] to delete the old alias and [CreateAlias] to create a new alias.\n     \n      Because an alias is not a property of a KMS key, you can create, update, and delete the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the [DescribeKey] operation. To get the aliases of all KMS keys in the account, use the [ListAliases] operation. \n      \n       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n       \n         {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account. \n        \n          {b Required permissions} \n         \n          {ul\n                {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateAlias} on the alias (IAM policy).\n                    \n                     }\n                {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateAlias} on the current KMS key (key policy).\n                    \n                     }\n                {-   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateAlias} on the new KMS key (key policy).\n                    \n                     }\n                }\n   For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access}Controlling access to aliases} in the {i Key Management Service Developer Guide}.\n   \n     {b Related operations:} \n    \n     {ul\n           {-   [CreateAlias] \n               \n                }\n           {-   [DeleteAlias] \n               \n                }\n           {-   [ListAliases] \n               \n                }\n           }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module UpdateCustomKeyStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_custom_key_store_request ->
        (update_custom_key_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudHsmClusterInvalidConfigurationException of
              cloud_hsm_cluster_invalid_configuration_exception 
          | `CloudHsmClusterNotActiveException of
              cloud_hsm_cluster_not_active_exception 
          | `CloudHsmClusterNotFoundException of
              cloud_hsm_cluster_not_found_exception 
          | `CloudHsmClusterNotRelatedException of
              cloud_hsm_cluster_not_related_exception 
          | `CustomKeyStoreInvalidStateException of
              custom_key_store_invalid_state_exception 
          | `CustomKeyStoreNameInUseException of
              custom_key_store_name_in_use_exception 
          | `CustomKeyStoreNotFoundException of
              custom_key_store_not_found_exception 
          | `KMSInternalException of kms_internal_exception 
          | `XksProxyIncorrectAuthenticationCredentialException of
              xks_proxy_incorrect_authentication_credential_exception 
          | `XksProxyInvalidConfigurationException of
              xks_proxy_invalid_configuration_exception 
          | `XksProxyInvalidResponseException of
              xks_proxy_invalid_response_exception 
          | `XksProxyUriEndpointInUseException of
              xks_proxy_uri_endpoint_in_use_exception 
          | `XksProxyUriInUseException of xks_proxy_uri_in_use_exception 
          | `XksProxyUriUnreachableException of
              xks_proxy_uri_unreachable_exception 
          | `XksProxyVpcEndpointServiceInUseException of
              xks_proxy_vpc_endpoint_service_in_use_exception 
          | `XksProxyVpcEndpointServiceInvalidConfigurationException of
              xks_proxy_vpc_endpoint_service_invalid_configuration_exception 
          | `XksProxyVpcEndpointServiceNotFoundException of
              xks_proxy_vpc_endpoint_service_not_found_exception ])
          result
end[@@ocaml.doc
     "Changes the properties of a custom key store. You can use this operation to change the properties of an CloudHSM key store or an external key store.\n\n Use the required [CustomKeyStoreId] parameter to identify the custom key store. Use the remaining optional parameters to change its properties. This operation does not return any property values. To verify the updated property values, use the [DescribeCustomKeyStores] operation.\n \n   This operation is part of the custom key stores feature in KMS, which combines the convenience and extensive integration of KMS with the isolation and control of a key store that you own and manage.\n  \n    When updating the properties of an external key store, verify that the updated settings connect your key store, via the external key store proxy, to the same external key manager as the previous settings, or to a backup or snapshot of the external key manager with the same cryptographic keys. If the updated connection settings fail, you can fix them and retry, although an extended delay might disrupt Amazon Web Services services. However, if KMS permanently loses its access to cryptographic keys, ciphertext encrypted under those keys is unrecoverable.\n    \n       For external key stores:\n       \n        Some external key managers provide a simpler method for updating an external key store. For details, see your external key manager documentation.\n        \n         When updating an external key store in the KMS console, you can upload a JSON-based proxy configuration file with the desired values. You cannot upload the proxy configuration file to the [UpdateCustomKeyStore] operation. However, you can use the file to help you determine the correct values for the [UpdateCustomKeyStore] parameters.\n         \n           For an CloudHSM key store, you can use this operation to change the custom key store friendly name ([NewCustomKeyStoreName]), to tell KMS about a change to the [kmsuser] crypto user password ([KeyStorePassword]), or to associate the custom key store with a different, but related, CloudHSM cluster ([CloudHsmClusterId]). To update any property of an CloudHSM key store, the [ConnectionState] of the CloudHSM key store must be [DISCONNECTED]. \n           \n            For an external key store, you can use this operation to change the custom key store friendly name ([NewCustomKeyStoreName]), or to tell KMS about a change to the external key store proxy authentication credentials ([XksProxyAuthenticationCredential]), connection method ([XksProxyConnectivity]), external proxy endpoint ([XksProxyUriEndpoint]) and path ([XksProxyUriPath]). For external key stores with an [XksProxyConnectivity] of [VPC_ENDPOINT_SERVICE], you can also update the Amazon VPC endpoint service name ([XksProxyVpcEndpointServiceName]). To update most properties of an external key store, the [ConnectionState] of the external key store must be [DISCONNECTED]. However, you can update the [CustomKeyStoreName], [XksProxyAuthenticationCredential], and [XksProxyUriPath] of an external key store when it is in the CONNECTED or DISCONNECTED state. \n            \n             If your update requires a [DISCONNECTED] state, before using [UpdateCustomKeyStore], use the [DisconnectCustomKeyStore] operation to disconnect the custom key store. After the [UpdateCustomKeyStore] operation completes, use the [ConnectCustomKeyStore] to reconnect the custom key store. To find the [ConnectionState] of the custom key store, use the [DescribeCustomKeyStores] operation. \n             \n               \n              \n               Before updating the custom key store, verify that the new values allow KMS to connect the custom key store to its backing key store. For example, before you change the [XksProxyUriPath] value, verify that the external key store proxy is reachable at the new path.\n               \n                If the operation succeeds, it returns a JSON object with no properties.\n                \n                  {b Cross-account use}: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.\n                 \n                   {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateCustomKeyStore} (IAM policy)\n                  \n                    {b Related operations:} \n                   \n                    {ul\n                          {-   [ConnectCustomKeyStore] \n                              \n                               }\n                          {-   [CreateCustomKeyStore] \n                              \n                               }\n                          {-   [DeleteCustomKeyStore] \n                              \n                               }\n                          {-   [DescribeCustomKeyStores] \n                              \n                               }\n                          {-   [DisconnectCustomKeyStore] \n                              \n                               }\n                          }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module UpdateKeyDescription :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_key_description_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Updates the description of a KMS key. To see the description of a KMS key, use [DescribeKey]. \n\n The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n \n   {b Cross-account use}: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account. \n  \n    {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:UpdateKeyDescription} (key policy)\n   \n     {b Related operations} \n    \n     {ul\n           {-   [CreateKey] \n               \n                }\n           {-   [DescribeKey] \n               \n                }\n           }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module UpdatePrimaryRegion :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_primary_region_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DisabledException of disabled_exception 
          | `InvalidArnException of invalid_arn_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Changes the primary key of a multi-Region key. \n\n This operation changes the replica key in the specified Region to a primary key and changes the former primary key to a replica key. For example, suppose you have a primary key in [us-east-1] and a replica key in [eu-west-2]. If you run [UpdatePrimaryRegion] with a [PrimaryRegion] value of [eu-west-2], the primary key is now the key in [eu-west-2], and the key in [us-east-1] becomes a replica key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-update.html}Change the primary key in a set of multi-Region keys} in the {i Key Management Service Developer Guide}.\n \n  This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n  \n   The {i primary key} of a multi-Region key is the source for properties that are always shared by primary and replica keys, including the key material, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id}key ID}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec}key spec}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage}key usage}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin}key material origin}, and {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html}automatic key rotation}. It's the only key that can be replicated. You cannot {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_ScheduleKeyDeletion.html}delete the primary key} until all replica keys are deleted.\n   \n    The key ID and primary Region that you specify uniquely identify the replica key that will become the primary key. The primary Region must already have a replica key. This operation does not create a KMS key in the specified Region. To find the replica keys, use the [DescribeKey] operation on the primary key or any replica key. To create a replica key, use the [ReplicateKey] operation.\n    \n     You can run this operation while using the affected multi-Region keys in cryptographic operations. This operation should not delay, interrupt, or cause failures in cryptographic operations. \n     \n      Even after this operation completes, the process of updating the primary Region might still be in progress for a few more seconds. Operations such as [DescribeKey] might display both the old and new primary keys as replicas. The old and new primary keys have a transient key state of [Updating]. The original key state is restored when the update is complete. While the key state is [Updating], you can use the keys in cryptographic operations, but you cannot replicate the new primary key or perform certain management operations, such as enabling or disabling these keys. For details about the [Updating] key state, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n      \n       This operation does not return any output. To verify that primary key is changed, use the [DescribeKey] operation.\n       \n         {b Cross-account use}: No. You cannot use this operation in a different Amazon Web Services account. \n        \n          {b Required permissions}: \n         \n          {ul\n                {-   [kms:UpdatePrimaryRegion] on the current primary key (in the primary key's Region). Include this permission primary key's key policy.\n                    \n                     }\n                {-   [kms:UpdatePrimaryRegion] on the current replica key (in the replica key's Region). Include this permission in the replica key's key policy.\n                    \n                     }\n                }  {b Related operations} \n                  \n                   {ul\n                         {-   [CreateKey] \n                             \n                              }\n                         {-   [ReplicateKey] \n                             \n                              }\n                         }\n    {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n   "]
module Verify :
sig
  val request :
    Smaws_Lib.Context.t ->
      verify_request ->
        (verify_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DependencyTimeoutException of dependency_timeout_exception 
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidSignatureException of kms_invalid_signature_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Verifies a digital signature that was generated by the [Sign] operation. \n\n \n \n  Verification confirms that an authorized user signed the message with the specified KMS key and signing algorithm, and the message hasn't changed since it was signed. If the signature is verified, the value of the [SignatureValid] field in the response is [True]. If the signature verification fails, the [Verify] operation fails with an [KMSInvalidSignatureException] exception.\n  \n   A digital signature is generated by using the private key in an asymmetric KMS key. The signature is verified by using the public key in the same asymmetric KMS key. For information about asymmetric KMS keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric KMS keys} in the {i Key Management Service Developer Guide}.\n   \n    To use the [Verify] operation, specify the same asymmetric KMS key, message, and signing algorithm that were used to produce the signature. The message type does not need to be the same as the one used for signing, but it must indicate whether the value of the [Message] parameter should be hashed as part of the verification process.\n    \n     You can also verify the digital signature by using the public key of the KMS key outside of KMS. Use the [GetPublicKey] operation to download the public key in the asymmetric KMS key and then use the public key to verify the signature outside of KMS. The advantage of using the [Verify] operation is that it is performed within KMS. As a result, it's easy to call, the operation is performed within the FIPS boundary, it is logged in CloudTrail, and you can use key policy and IAM policy to determine who is authorized to use the KMS key to verify signatures.\n     \n      To verify a signature outside of KMS with an SM2 public key (China Regions only), you must specify the distinguishing ID. By default, KMS uses [1234567812345678] as the distinguishing ID. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/offline-operations.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.\n      \n       The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n       \n         {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter. \n        \n          {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:Verify} (key policy)\n         \n           {b Related operations}: [Sign] \n          \n            {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n           "]
module VerifyMac :
sig
  val request :
    Smaws_Lib.Context.t ->
      verify_mac_request ->
        (verify_mac_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DisabledException of disabled_exception 
          | `DryRunOperationException of dry_run_operation_exception 
          | `InvalidGrantTokenException of invalid_grant_token_exception 
          | `InvalidKeyUsageException of invalid_key_usage_exception 
          | `KeyUnavailableException of key_unavailable_exception 
          | `KMSInternalException of kms_internal_exception 
          | `KMSInvalidMacException of kms_invalid_mac_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `NotFoundException of not_found_exception ]) result
end[@@ocaml.doc
     "Verifies the hash-based message authentication code (HMAC) for a specified message, HMAC KMS key, and MAC algorithm. To verify the HMAC, [VerifyMac] computes an HMAC using the message, HMAC KMS key, and MAC algorithm that you specify, and compares the computed HMAC to the HMAC that you specify. If the HMACs are identical, the verification succeeds; otherwise, it fails. Verification indicates that the message hasn't changed since the HMAC was calculated, and the specified key was used to generate and verify the HMAC.\n\n HMAC KMS keys and the HMAC algorithms that KMS uses conform to industry standards defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.\n \n  This operation is part of KMS support for HMAC KMS keys. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC keys in KMS} in the {i Key Management Service Developer Guide}.\n  \n   The KMS key that you use for this operation must be in a compatible key state. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n   \n     {b Cross-account use}: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify the key ARN or alias ARN in the value of the [KeyId] parameter. \n    \n      {b Required permissions}: {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:VerifyMac} (key policy)\n     \n       {b Related operations}: [GenerateMac] \n      \n        {b Eventual consistency}: The KMS API follows an eventual consistency model. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/accessing-kms.html#programming-eventual-consistency}KMS eventual consistency}.\n       "]