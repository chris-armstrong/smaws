open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kms";
      endpointPrefix = "kms";
      version = "2014-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec xks_proxy_vpc_endpoint_service_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because KMS could not find the specified VPC endpoint service. Use [DescribeCustomKeyStores] to verify the VPC endpoint service name for the external key store. Also, confirm that the [Allow principals] list for the VPC endpoint service includes the KMS service principal for the Region, such as [cks.kms.us-east-1.amazonaws.com].\n"]
type nonrec xks_proxy_vpc_endpoint_service_invalid_configuration_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the Amazon VPC endpoint service configuration does not fulfill the requirements for an external key store. To identify the cause, see the error message that accompanies the exception and {{:https://docs.aws.amazon.com/kms/latest/developerguide/vpc-connectivity.html#xks-vpc-requirements}review the requirements} for Amazon VPC endpoint service connectivity for an external key store.\n"]
type nonrec xks_proxy_vpc_endpoint_service_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified Amazon VPC endpoint service is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a different Amazon VPC endpoint service.\n"]
type nonrec xks_proxy_uri_unreachable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "KMS was unable to reach the specified [XksProxyUriPath]. The path must be reachable before you create the external key store or update its settings.\n\n This exception is also thrown when the external key store proxy response to a [GetHealthStatus] request indicates that all external key manager instances are unavailable.\n "]
type nonrec xks_proxy_uri_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the concatenation of the [XksProxyUriEndpoint] and [XksProxyUriPath] is already associated with another external key store in this Amazon Web Services Region. Each external key store in a Region must use a unique external key store proxy API address.\n"]
type nonrec xks_proxy_uri_endpoint_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the [XksProxyUriEndpoint] is already associated with another external key store in this Amazon Web Services Region. To identify the cause, see the error message that accompanies the exception. \n"]
type nonrec xks_proxy_invalid_response_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "\n\n KMS cannot interpret the response it received from the external key store proxy. The problem might be a poorly constructed response, but it could also be a transient network issue. If you see this error repeatedly, report it to the proxy vendor.\n "]
type nonrec xks_proxy_invalid_configuration_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the external key store proxy is not configured correctly. To identify the cause, see the error message that accompanies the exception.\n"]
type nonrec xks_proxy_incorrect_authentication_credential_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the proxy credentials failed to authenticate to the specified external key store proxy. The specified external key store proxy rejected a status request from KMS due to invalid credentials. This can indicate an error in the credentials or in the identification of the external key store proxy.\n"]
type nonrec xks_proxy_connectivity_type =
  | VPC_ENDPOINT_SERVICE [@ocaml.doc ""]
  | PUBLIC_ENDPOINT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec xks_proxy_configuration_type =
  {
  vpc_endpoint_service_name: string option
    [@ocaml.doc
      "The Amazon VPC endpoint service used to communicate with the external key store proxy. This field appears only when the external key store proxy uses an Amazon VPC endpoint service to communicate with KMS.\n"];
  uri_path: string option
    [@ocaml.doc "The path to the external key store proxy APIs.\n"];
  uri_endpoint: string option
    [@ocaml.doc
      "The URI endpoint for the external key store proxy.\n\n If the external key store proxy has a public endpoint, it is displayed here.\n \n  If the external key store proxy uses an Amazon VPC endpoint service name, this field displays the private DNS name associated with the VPC endpoint service.\n  "];
  access_key_id: string option
    [@ocaml.doc
      "The part of the external key store {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateCustomKeyStore.html#KMS-CreateCustomKeyStore-request-XksProxyAuthenticationCredential}proxy authentication credential} that uniquely identifies the secret access key.\n"];
  connectivity: xks_proxy_connectivity_type option
    [@ocaml.doc
      "Indicates whether the external key store proxy uses a public endpoint or an Amazon VPC endpoint service to communicate with KMS.\n"]}
[@@ocaml.doc
  "Detailed information about the external key store proxy (XKS proxy). Your external key store proxy translates KMS requests into a format that your external key manager can understand. These fields appear in a [DescribeCustomKeyStores] response only when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE].\n"]
type nonrec xks_proxy_authentication_credential_type =
  {
  raw_secret_access_key: string
    [@ocaml.doc
      "A secret string of 43-64 characters. Valid characters are a-z, A-Z, 0-9, /, +, and =.\n"];
  access_key_id: string
    [@ocaml.doc "A unique identifier for the raw secret access key.\n"]}
[@@ocaml.doc
  "KMS uses the authentication credential to sign requests that it sends to the external key store proxy (XKS proxy) on your behalf. You establish these credentials on your external key store proxy and report them to KMS.\n\n The [XksProxyAuthenticationCredential] includes two required elements.\n "]
type nonrec xks_key_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the external key store proxy could not find the external key. This exception is thrown when the value of the [XksKeyId] parameter doesn't identify a key in the external key manager associated with the external key proxy.\n\n Verify that the [XksKeyId] represents an existing key in the external key manager. Use the key identifier that the external key store proxy uses to identify the key. For details, see the documentation provided with your external key store proxy or key manager.\n "]
type nonrec xks_key_invalid_configuration_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the external key specified by the [XksKeyId] parameter did not meet the configuration requirements for an external key store.\n\n The external key must be an AES-256 symmetric key that is enabled and performs encryption and decryption.\n "]
type nonrec xks_key_configuration_type =
  {
  id: string option
    [@ocaml.doc
      "The ID of the external key in its external key manager. This is the ID that the external key store proxy uses to identify the external key.\n"]}
[@@ocaml.doc
  "Information about the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key }that is associated with a KMS key in an external key store. \n\n This element appears in a [CreateKey] or [DescribeKey] response only for a KMS key in an external key store.\n \n  The {i external key} is a symmetric encryption key that is hosted by an external key manager outside of Amazon Web Services. When you use the KMS key in an external key store in a cryptographic operation, the cryptographic operation is performed in the external key manager using the specified external key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.\n  "]
type nonrec xks_key_already_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the ([XksKeyId]) is already associated with another KMS key in this external key store. Each KMS key in an external key store must be associated with a different external key.\n"]
type nonrec wrapping_key_spec =
  | SM2 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec signing_algorithm_spec =
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
  signature_valid: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether the signature was verified. A value of [True] indicates that the [Signature] was produced by signing the [Message] with the specified [KeyID] and [SigningAlgorithm.] If the signature is not verified, the [Verify] operation fails with a [KMSInvalidSignatureException] exception. \n"];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key that was used to verify the signature.\n"]}
[@@ocaml.doc ""]
type nonrec message_type =
  | DIGEST [@ocaml.doc ""]
  | RAW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec verify_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  signing_algorithm: signing_algorithm_spec
    [@ocaml.doc
      "The signing algorithm that was used to sign the message. If you submit a different algorithm, the signature verification fails.\n"];
  signature: bytes
    [@ocaml.doc "The signature that the [Sign] operation generated.\n"];
  message_type: message_type option
    [@ocaml.doc
      "Tells KMS whether the value of the [Message] parameter should be hashed as part of the signing algorithm. Use [RAW] for unhashed messages; use [DIGEST] for message digests, which are already hashed.\n\n When the value of [MessageType] is [RAW], KMS uses the standard signing algorithm, which begins with a hash function. When the value is [DIGEST], KMS skips the hashing step in the signing algorithm.\n \n   Use the [DIGEST] value only when the value of the [Message] parameter is a message digest. If you use the [DIGEST] value with an unhashed message, the security of the verification operation can be compromised.\n   \n     When the value of [MessageType]is [DIGEST], the length of the [Message] value must match the length of hashed messages for the specified signing algorithm.\n     \n      You can submit a message digest and omit the [MessageType] or specify [RAW] so the digest is hashed again while signing. However, if the signed message is hashed once while signing, but twice while verifying, verification fails, even when the message hasn't changed.\n      \n       The hashing algorithm in that [Verify] uses is based on the [SigningAlgorithm] value.\n       \n        {ul\n              {-  Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.\n                  \n                   }\n              {-  Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.\n                  \n                   }\n              {-  Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.\n                  \n                   }\n              {-  SM2DSA uses the SM3 hashing algorithm. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.\n                  \n                   }\n              }\n  "];
  message: bytes
    [@ocaml.doc
      "Specifies the message that was signed. You can submit a raw message of up to 4096 bytes, or a hash digest of the message. If you submit a digest, use the [MessageType] parameter with a value of [DIGEST].\n\n If the message specified here is different from the message that was signed, the signature verification fails. A message and its hash digest are considered to be the same message.\n "];
  key_id: string
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
  mac_valid: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether the HMAC was verified. A value of [True] indicates that the HMAC ([Mac]) was generated with the specified [Message], HMAC KMS key ([KeyID]) and [MacAlgorithm.].\n\n If the HMAC is not verified, the [VerifyMac] operation fails with a [KMSInvalidMacException] exception. This exception indicates that one or more of the inputs changed since the HMAC was computed.\n "];
  key_id: string option
    [@ocaml.doc "The HMAC KMS key used in the verification.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec verify_mac_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  mac: bytes
    [@ocaml.doc
      "The HMAC to verify. Enter the HMAC that was generated by the [GenerateMac] operation when you specified the same message, HMAC KMS key, and MAC algorithm as the values specified in this request.\n"];
  mac_algorithm: mac_algorithm_spec
    [@ocaml.doc
      "The MAC algorithm that will be used in the verification. Enter the same MAC algorithm that was used to compute the HMAC. This algorithm must be supported by the HMAC KMS key identified by the [KeyId] parameter.\n"];
  key_id: string
    [@ocaml.doc
      "The KMS key that will be used in the verification.\n\n Enter a key ID of the KMS key that was used to generate the HMAC. If you identify a different KMS key, the [VerifyMac] operation fails.\n "];
  message: bytes
    [@ocaml.doc
      "The message that will be used in the verification. Enter the same message that was used to generate the HMAC.\n\n  [GenerateMac] and [VerifyMac] do not provide special handling for message digests. If you generated an HMAC for a hash digest of a message, you must verify the HMAC for the same hash digest.\n "]}
[@@ocaml.doc ""]
type nonrec not_found_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified entity or resource could not be found.\n"]
type nonrec kms_invalid_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the state of the specified resource is not valid for this request.\n\n This exceptions means one of the following:\n \n  {ul\n        {-  The key state of the KMS key is not compatible with the operation. \n            \n             To find the key state, use the [DescribeKey] operation. For more information about which key states are compatible with each KMS operation, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i  {i Key Management Service Developer Guide} }.\n             \n              }\n        {-  For cryptographic operations on KMS keys in custom key stores, this exception represents a general failure with many possible causes. To identify the cause, see the error message that accompanies the exception.\n            \n             }\n        }\n  "]
type nonrec kms_invalid_mac_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the HMAC verification failed. HMAC verification fails when the HMAC computed by using the specified message, HMAC KMS key, and MAC algorithm does not match the HMAC specified in the request.\n"]
type nonrec kms_internal_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because an internal exception occurred. The request can be retried.\n"]
type nonrec key_unavailable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified KMS key was not available. You can retry the request.\n"]
type nonrec invalid_key_usage_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected for one of the following reasons: \n\n {ul\n       {-  The [KeyUsage] value of the KMS key is incompatible with the API operation.\n           \n            }\n       {-  The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key [(KeySpec]).\n           \n            }\n       }\n   For encrypting, decrypting, re-encrypting, and generating data keys, the [KeyUsage] must be [ENCRYPT_DECRYPT]. For signing and verifying messages, the [KeyUsage] must be [SIGN_VERIFY]. For generating and verifying message authentication codes (MACs), the [KeyUsage] must be [GENERATE_VERIFY_MAC]. For deriving key agreement secrets, the [KeyUsage] must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n   \n    To find the encryption or signing algorithms supported for a particular KMS key, use the [DescribeKey] operation.\n    "]
type nonrec invalid_grant_token_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified grant token is not valid.\n"]
type nonrec dry_run_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           " The request was rejected because the DryRun parameter was specified. \n"]
type nonrec disabled_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified KMS key is not enabled.\n"]
type nonrec kms_invalid_signature_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the signature verification failed. Signature verification fails when it cannot confirm that signature was produced by signing the specified message with the specified KMS key and signing algorithm.\n"]
type nonrec dependency_timeout_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The system timed out while trying to fulfill the request. You can retry the request.\n"]
type nonrec update_primary_region_request =
  {
  primary_region: string
    [@ocaml.doc
      "The Amazon Web Services Region of the new primary key. Enter the Region ID, such as [us-east-1] or [ap-southeast-2]. There must be an existing replica key in this Region. \n\n When the operation completes, the multi-Region key in this Region will be the primary key.\n "];
  key_id: string
    [@ocaml.doc
      "Identifies the current primary key. When the operation completes, this KMS key will be a replica key.\n\n Specify the key ID or key ARN of a multi-Region primary key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec unsupported_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because a specified parameter is not supported or a specified resource is not valid for this operation.\n"]
type nonrec invalid_arn_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because a specified ARN, or an ARN in a key policy, is not valid.\n"]
type nonrec update_key_description_request =
  {
  description: string
    [@ocaml.doc
      "New description for the KMS key.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n   "];
  key_id: string
    [@ocaml.doc
      "Updates the description of the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec update_custom_key_store_request =
  {
  xks_proxy_connectivity: xks_proxy_connectivity_type option
    [@ocaml.doc
      "Changes the connectivity setting for the external key store. To indicate that the external key store proxy uses a Amazon VPC endpoint service to communicate with KMS, specify [VPC_ENDPOINT_SERVICE]. Otherwise, specify [PUBLIC_ENDPOINT].\n\n If you change the [XksProxyConnectivity] to [VPC_ENDPOINT_SERVICE], you must also change the [XksProxyUriEndpoint] and add an [XksProxyVpcEndpointServiceName] value. \n \n  If you change the [XksProxyConnectivity] to [PUBLIC_ENDPOINT], you must also change the [XksProxyUriEndpoint] and specify a null or empty string for the [XksProxyVpcEndpointServiceName] value.\n  \n   To change this value, the external key store must be disconnected.\n   "];
  xks_proxy_authentication_credential:
    xks_proxy_authentication_credential_type option
    [@ocaml.doc
      "Changes the credentials that KMS uses to sign requests to the external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n You must specify both the [AccessKeyId] and [SecretAccessKey] value in the authentication credential, even if you are only updating one value.\n \n  This parameter doesn't establish or change your authentication credentials on the proxy. It just tells KMS the credential that you established with your external key store proxy. For example, if you rotate the credential on your external key store proxy, you can use this parameter to update the credential in KMS.\n  \n   You can change this value when the external key store is connected or disconnected.\n   "];
  xks_proxy_vpc_endpoint_service_name: string option
    [@ocaml.doc
      "Changes the name that KMS uses to identify the Amazon VPC endpoint service for your external key store proxy (XKS proxy). This parameter is valid when the [CustomKeyStoreType] is [EXTERNAL_KEY_STORE] and the [XksProxyConnectivity] is [VPC_ENDPOINT_SERVICE].\n\n To change this value, the external key store must be disconnected.\n "];
  xks_proxy_uri_path: string option
    [@ocaml.doc
      "Changes the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key manager and external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The value must start with [/] and must end with [/kms/xks/v1], where [v1] represents the version of the KMS external key store proxy API. You can include an optional prefix between the required elements such as \n {[\n /{i example}/kms/xks/v1\n ]}\n .\n \n  The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n  \n   You can change this value when the external key store is connected or disconnected.\n   "];
  xks_proxy_uri_endpoint: string option
    [@ocaml.doc
      "Changes the URI endpoint that KMS uses to connect to your external key store proxy (XKS proxy). This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n For external key stores with an [XksProxyConnectivity] value of [PUBLIC_ENDPOINT], the protocol must be HTTPS.\n \n  For external key stores with an [XksProxyConnectivity] value of [VPC_ENDPOINT_SERVICE], specify [https://] followed by the private DNS name associated with the VPC endpoint service. Each external key store must use a different private DNS name.\n  \n   The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n   \n    To change this value, the external key store must be disconnected.\n    "];
  cloud_hsm_cluster_id: string option
    [@ocaml.doc
      "Associates the custom key store with a related CloudHSM cluster. This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the cluster ID of the cluster that you used to create the custom key store or a cluster that shares a backup history and has the same cluster certificate as the original cluster. You cannot use this parameter to associate a custom key store with an unrelated cluster. In addition, the replacement cluster must {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}fulfill the requirements} for a cluster associated with a custom key store. To view the cluster certificate of a cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n \n  To change this value, the CloudHSM key store must be disconnected.\n  "];
  key_store_password: string option
    [@ocaml.doc
      "Enter the current password of the [kmsuser] crypto user (CU) in the CloudHSM cluster that is associated with the custom key store. This parameter is valid only for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n This parameter tells KMS the current password of the [kmsuser] crypto user (CU). It does not set or change the password of any users in the CloudHSM cluster.\n \n  To change this value, the CloudHSM key store must be disconnected.\n  "];
  new_custom_key_store_name: string option
    [@ocaml.doc
      "Changes the friendly name of the custom key store to the value that you specify. The custom key store name must be unique in the Amazon Web Services account.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    To change this value, an CloudHSM key store must be disconnected. An external key store can be connected or disconnected.\n    "];
  custom_key_store_id: string
    [@ocaml.doc
      "Identifies the custom key store that you want to update. Enter the ID of the custom key store. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec custom_key_store_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because KMS cannot find a custom key store with the specified key store name or ID.\n"]
type nonrec custom_key_store_name_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified custom key store name is already assigned to another custom key store in the account. Try again with a custom key store name that is unique in the account.\n"]
type nonrec custom_key_store_invalid_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because of the [ConnectionState] of the custom key store. To get the [ConnectionState] of a custom key store, use the [DescribeCustomKeyStores] operation.\n\n This exception is thrown under the following conditions:\n \n  {ul\n        {-  You requested the [ConnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [FAILED]. This operation is valid for all other [ConnectionState] values. To reconnect a custom key store in a [FAILED] state, disconnect it ([DisconnectCustomKeyStore]), then connect it ([ConnectCustomKeyStore]).\n            \n             }\n        {-  You requested the [CreateKey] operation in a custom key store that is not connected. This operations is valid only when the custom key store [ConnectionState] is [CONNECTED].\n            \n             }\n        {-  You requested the [DisconnectCustomKeyStore] operation on a custom key store with a [ConnectionState] of [DISCONNECTING] or [DISCONNECTED]. This operation is valid for all other [ConnectionState] values.\n            \n             }\n        {-  You requested the [UpdateCustomKeyStore] or [DeleteCustomKeyStore] operation on a custom key store that is not disconnected. This operation is valid only when the custom key store [ConnectionState] is [DISCONNECTED].\n            \n             }\n        {-  You requested the [GenerateRandom] operation in an CloudHSM key store that is not connected. This operation is valid only when the CloudHSM key store [ConnectionState] is [CONNECTED]. \n            \n             }\n        }\n  "]
type nonrec cloud_hsm_cluster_not_related_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified CloudHSM cluster has a different cluster certificate than the original cluster. You cannot use the operation to specify an unrelated cluster for an CloudHSM key store.\n\n Specify an CloudHSM cluster that shares a backup history with the original cluster. This includes clusters that were created from a backup of the current cluster, and clusters that were created from the same backup that produced the current cluster.\n \n  CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n  "]
type nonrec cloud_hsm_cluster_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because KMS cannot find the CloudHSM cluster with the specified cluster ID. Retry the request with a different cluster ID.\n"]
type nonrec cloud_hsm_cluster_not_active_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the CloudHSM cluster associated with the CloudHSM key store is not active. Initialize and activate the cluster and try the command again. For detailed instructions, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/getting-started.html}Getting Started} in the {i CloudHSM User Guide}.\n"]
type nonrec cloud_hsm_cluster_invalid_configuration_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the associated CloudHSM cluster did not meet the configuration requirements for an CloudHSM key store.\n\n {ul\n       {-  The CloudHSM cluster must be configured with private subnets in at least two different Availability Zones in the Region.\n           \n            }\n       {-  The {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}security group for the cluster} (cloudhsm-cluster-{i }-sg) must include inbound rules and outbound rules that allow TCP traffic on ports 2223-2225. The {b Source} in the inbound rules and the {b Destination} in the outbound rules must match the security group ID. These rules are set by default when you create the CloudHSM cluster. Do not delete or change them. To get information about a particular security group, use the {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html}DescribeSecurityGroups} operation.\n           \n            }\n       {-  The CloudHSM cluster must contain at least as many HSMs as the operation requires. To add HSMs, use the CloudHSM {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html}CreateHsm} operation.\n           \n            For the [CreateCustomKeyStore], [UpdateCustomKeyStore], and [CreateKey] operations, the CloudHSM cluster must have at least two active HSMs, each in a different Availability Zone. For the [ConnectCustomKeyStore] operation, the CloudHSM must contain at least one active HSM.\n            \n             }\n       }\n   For information about the requirements for an CloudHSM cluster that is associated with an CloudHSM key store, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore}Assemble the Prerequisites} in the {i Key Management Service Developer Guide}. For information about creating a private subnet for an CloudHSM cluster, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/create-subnets.html}Create a Private Subnet} in the {i CloudHSM User Guide}. For information about cluster security groups, see {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/configure-sg.html}Configure a Default Security Group} in the {i  {i CloudHSM User Guide} }. \n   "]
type nonrec update_alias_request =
  {
  target_key_id: string
    [@ocaml.doc
      "Identifies the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key} to associate with the alias. You don't have permission to associate an alias with an {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed key}.\n\n The KMS key must be in the same Amazon Web Services account and Region as the alias. Also, the new target KMS key must be the same type as the current target KMS key (both symmetric or both asymmetric or both HMAC) and they must have the same key usage. \n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   \n    To verify that the alias is mapped to the correct KMS key, use [ListAliases].\n    "];
  alias_name: string
    [@ocaml.doc
      "Identifies the alias that is changing its KMS key. This value must begin with [alias/] followed by the alias name, such as [alias/ExampleAlias]. You cannot use [UpdateAlias] to change the alias name.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because a quota was exceeded. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html}Quotas} in the {i Key Management Service Developer Guide}.\n"]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc
      "One or more tag keys. Specify only the tag keys, not the tag values.\n"];
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key from which you are removing tags.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec tag_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because one or more tags are not valid.\n"]
type nonrec tag =
  {
  tag_value: string [@ocaml.doc "The value of the tag.\n"];
  tag_key: string [@ocaml.doc "The key of the tag.\n"]}[@@ocaml.doc
                                                         "A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both required, but tag values can be empty (null) strings.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    For information about the rules that apply to tag keys and tag values, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html}User-Defined Tag Restrictions} in the {i Amazon Web Services Billing and Cost Management User Guide}.\n    "]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an empty (null) string. \n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.\n    "];
  key_id: string
    [@ocaml.doc
      "Identifies a customer managed key in the account and Region.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec sign_response =
  {
  signing_algorithm: signing_algorithm_spec option
    [@ocaml.doc "The signing algorithm that was used to sign the message.\n"];
  signature: bytes option
    [@ocaml.doc
      "The cryptographic signature that was generated for the message. \n\n {ul\n       {-  When used with the supported RSA signing algorithms, the encoding of this value is defined by {{:https://tools.ietf.org/html/rfc8017}PKCS #1 in RFC 8017}.\n           \n            }\n       {-  When used with the [ECDSA_SHA_256], [ECDSA_SHA_384], or [ECDSA_SHA_512] signing algorithms, this value is a DER-encoded object as defined by ANSI X9.62\226\128\1472005 and {{:https://tools.ietf.org/html/rfc3279#section-2.2.3}RFC 3279 Section 2.2.3}. This is the most commonly used signature format and is appropriate for most uses. \n           \n            }\n       }\n   When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n   "];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key that was used to sign the message.\n"]}
[@@ocaml.doc ""]
type nonrec sign_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  signing_algorithm: signing_algorithm_spec
    [@ocaml.doc
      "Specifies the signing algorithm to use when signing the message. \n\n Choose an algorithm that is compatible with the type and size of the specified asymmetric KMS key. When signing with RSA key pairs, RSASSA-PSS algorithms are preferred. We include RSASSA-PKCS1-v1_5 algorithms for compatibility with existing applications.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  message_type: message_type option
    [@ocaml.doc
      "Tells KMS whether the value of the [Message] parameter should be hashed as part of the signing algorithm. Use [RAW] for unhashed messages; use [DIGEST] for message digests, which are already hashed.\n\n When the value of [MessageType] is [RAW], KMS uses the standard signing algorithm, which begins with a hash function. When the value is [DIGEST], KMS skips the hashing step in the signing algorithm.\n \n   Use the [DIGEST] value only when the value of the [Message] parameter is a message digest. If you use the [DIGEST] value with an unhashed message, the security of the signing operation can be compromised.\n   \n     When the value of [MessageType]is [DIGEST], the length of the [Message] value must match the length of hashed messages for the specified signing algorithm.\n     \n      You can submit a message digest and omit the [MessageType] or specify [RAW] so the digest is hashed again while signing. However, this can cause verification failures when verifying with a system that assumes a single hash.\n      \n       The hashing algorithm in that [Sign] uses is based on the [SigningAlgorithm] value.\n       \n        {ul\n              {-  Signing algorithms that end in SHA_256 use the SHA_256 hashing algorithm.\n                  \n                   }\n              {-  Signing algorithms that end in SHA_384 use the SHA_384 hashing algorithm.\n                  \n                   }\n              {-  Signing algorithms that end in SHA_512 use the SHA_512 hashing algorithm.\n                  \n                   }\n              {-  SM2DSA uses the SM3 hashing algorithm. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/asymmetric-key-specs.html#key-spec-sm-offline-verification}Offline verification with SM2 key pairs}.\n                  \n                   }\n              }\n  "];
  message: bytes
    [@ocaml.doc
      "Specifies the message or message digest to sign. Messages can be 0-4096 bytes. To sign a larger message, provide a message digest.\n\n If you provide a message digest, use the [DIGEST] value of [MessageType] to prevent the digest from being hashed again while signing.\n "];
  key_id: string
    [@ocaml.doc
      "Identifies an asymmetric KMS key. KMS uses the private key in the asymmetric KMS key to sign the message. The [KeyUsage] type of the KMS key must be [SIGN_VERIFY]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec key_state =
  | Updating [@ocaml.doc ""]
  | Unavailable [@ocaml.doc ""]
  | PendingReplicaDeletion [@ocaml.doc ""]
  | PendingImport [@ocaml.doc ""]
  | PendingDeletion [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""]
  | Enabled [@ocaml.doc ""]
  | Creating [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec schedule_key_deletion_response =
  {
  pending_window_in_days: int option
    [@ocaml.doc
      "The waiting period before the KMS key is deleted. \n\n If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.\n "];
  key_state: key_state option
    [@ocaml.doc
      "The current status of the KMS key.\n\n For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n "];
  deletion_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time after which KMS deletes the KMS key.\n\n If the KMS key is a multi-Region primary key with replica keys, this field does not appear. The deletion date for the primary key isn't known until its last replica key is deleted.\n "];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key whose deletion is scheduled.\n"]}
[@@ocaml.doc ""]
type nonrec schedule_key_deletion_request =
  {
  pending_window_in_days: int option
    [@ocaml.doc
      "The waiting period, specified in number of days. After the waiting period ends, KMS deletes the KMS key.\n\n If the KMS key is a multi-Region primary key with replica keys, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately.\n \n  This value is optional. If you include a value, it must be between 7 and 30, inclusive. If you do not include a value, it defaults to 30. You can use the {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-schedule-key-deletion-pending-window-in-days} [kms:ScheduleKeyDeletionPendingWindowInDays] } condition key to further constrain the values that principals can specify in the [PendingWindowInDays] parameter.\n  "];
  key_id: string
    [@ocaml.doc
      "The unique identifier of the KMS key to delete.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec conflict_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because an automatic rotation of this key is currently in progress or scheduled to begin within the next 20 minutes. \n"]
type nonrec rotate_key_on_demand_response =
  {
  key_id: string option
    [@ocaml.doc
      "Identifies the symmetric encryption KMS key that you initiated on-demand rotation on.\n"]}
[@@ocaml.doc ""]
type nonrec rotate_key_on_demand_request =
  {
  key_id: string
    [@ocaml.doc
      "Identifies a symmetric encryption KMS key. You cannot perform on-demand rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To perform on-demand rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, invoke the on-demand rotation on the primary key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_grant_id_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified [GrantId] is not valid.\n"]
type nonrec revoke_grant_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_id: string
    [@ocaml.doc
      "Identifies the grant to revoke. To get the grant ID, use [CreateGrant], [ListGrants], or [ListRetirableGrants].\n"];
  key_id: string
    [@ocaml.doc
      "A unique identifier for the KMS key associated with the grant. To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec retire_grant_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_id: string option
    [@ocaml.doc
      "Identifies the grant to retire. To get the grant ID, use [CreateGrant], [ListGrants], or [ListRetirableGrants].\n\n {ul\n       {-  Grant ID Example - 0123456789012345678901234567890123456789012345678901234567890123\n           \n            }\n       }\n  "];
  key_id: string option
    [@ocaml.doc
      "The key ARN KMS key associated with the grant. To find the key ARN, use the [ListKeys] operation.\n\n For example: [arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n "];
  grant_token: string option
    [@ocaml.doc
      "Identifies the grant to be retired. You can use a grant token to identify a new grant even before it has achieved eventual consistency.\n\n Only the [CreateGrant] operation returns a grant token. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency}Eventual consistency} in the {i Key Management Service Developer Guide}.\n "]}
[@@ocaml.doc ""]
type nonrec malformed_policy_document_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified policy is not syntactically or semantically correct.\n"]
type nonrec already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because it attempted to create a resource that already exists.\n"]
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
type nonrec key_agreement_algorithm_spec =
  | ECDH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec multi_region_key_type =
  | REPLICA [@ocaml.doc ""]
  | PRIMARY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec multi_region_key =
  {
  region: string option
    [@ocaml.doc
      "Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.\n"];
  arn: string option
    [@ocaml.doc
      "Displays the key ARN of a primary or replica key of a multi-Region key.\n"]}
[@@ocaml.doc "Describes the primary or replica key in a multi-Region key.\n"]
type nonrec multi_region_configuration =
  {
  replica_keys: multi_region_key list option
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
type nonrec key_metadata =
  {
  xks_key_configuration: xks_key_configuration_type option
    [@ocaml.doc
      "Information about the external key that is associated with a KMS key in an external key store.\n\n For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}External key} in the {i Key Management Service Developer Guide}.\n "];
  mac_algorithms: mac_algorithm_spec list option
    [@ocaml.doc
      "The message authentication code (MAC) algorithm that the HMAC KMS key supports.\n\n This value is present only when the [KeyUsage] of the KMS key is [GENERATE_VERIFY_MAC].\n "];
  pending_deletion_window_in_days: int option
    [@ocaml.doc
      "The waiting period before the primary key in a multi-Region key is deleted. This waiting period begins when the last of its replica keys is deleted. This value is present only when the [KeyState] of the KMS key is [PendingReplicaDeletion]. That indicates that the KMS key is the primary key in a multi-Region key, it is scheduled for deletion, and it still has existing replica keys.\n\n When a single-Region KMS key or a multi-Region replica key is scheduled for deletion, its deletion date is displayed in the [DeletionDate] field. However, when the primary key in a multi-Region key is scheduled for deletion, its waiting period doesn't begin until all of its replica keys are deleted. This value displays that waiting period. When the last replica key in the multi-Region key is deleted, the [KeyState] of the scheduled primary key changes from [PendingReplicaDeletion] to [PendingDeletion] and the deletion date appears in the [DeletionDate] field.\n "];
  multi_region_configuration: multi_region_configuration option
    [@ocaml.doc
      "Lists the primary and replica keys in same multi-Region key. This field is present only when the value of the [MultiRegion] field is [True].\n\n For more information about any listed KMS key, use the [DescribeKey] operation.\n \n  {ul\n        {-   [MultiRegionKeyType] indicates whether the KMS key is a [PRIMARY] or [REPLICA] key.\n            \n             }\n        {-   [PrimaryKey] displays the key ARN and Region of the primary key. This field displays the current KMS key if it is the primary key.\n            \n             }\n        {-   [ReplicaKeys] displays the key ARNs and Regions of all replica keys. This field includes the current KMS key if it is a replica key.\n            \n             }\n        }\n  "];
  multi_region: bool option
    [@ocaml.doc
      "Indicates whether the KMS key is a multi-Region ([True]) or regional ([False]) key. This value is [True] for multi-Region primary and replica keys and [False] for regional KMS keys.\n\n For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n "];
  key_agreement_algorithms: key_agreement_algorithm_spec list option
    [@ocaml.doc
      "The key agreement algorithm used to derive a shared secret.\n"];
  signing_algorithms: signing_algorithm_spec list option
    [@ocaml.doc
      "The signing algorithms that the KMS key supports. You cannot use the KMS key with other signing algorithms within KMS.\n\n This field appears only when the [KeyUsage] of the KMS key is [SIGN_VERIFY].\n "];
  encryption_algorithms: encryption_algorithm_spec list option
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
  cloud_hsm_cluster_id: string option
    [@ocaml.doc
      "The cluster ID of the CloudHSM cluster that contains the key material for the KMS key. When you create a KMS key in an CloudHSM {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}, KMS creates the key material for the KMS key in the associated CloudHSM cluster. This field is present only when the KMS key is created in an CloudHSM key store.\n"];
  custom_key_store_id: string option
    [@ocaml.doc
      "A unique identifier for the {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store} that contains the KMS key. This field is present only when the KMS key is created in a custom key store.\n"];
  origin: origin_type option
    [@ocaml.doc
      "The source of the key material for the KMS key. When this value is [AWS_KMS], KMS created the key material. When this value is [EXTERNAL], the key material was imported or the KMS key doesn't have any key material. When this value is [AWS_CLOUDHSM], the key material was created in the CloudHSM cluster associated with a custom key store.\n"];
  valid_to: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time at which the imported key material expires. When the key material expires, KMS deletes the key material and the KMS key becomes unusable. This value is present only for KMS keys whose [Origin] is [EXTERNAL] and whose [ExpirationModel] is [KEY_MATERIAL_EXPIRES], otherwise this value is omitted.\n"];
  deletion_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time after which KMS deletes this KMS key. This value is present only when the KMS key is scheduled for deletion, that is, when its [KeyState] is [PendingDeletion].\n\n When the primary key in a multi-Region key is scheduled for deletion but still has replica keys, its key state is [PendingReplicaDeletion] and the length of its waiting period is displayed in the [PendingDeletionWindowInDays] field.\n "];
  key_state: key_state option
    [@ocaml.doc
      "The current status of the KMS key.\n\n For more information about how key state affects the use of a KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys} in the {i Key Management Service Developer Guide}.\n "];
  key_usage: key_usage_type option
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} for which you can use the KMS key.\n"];
  description: string option [@ocaml.doc "The description of the KMS key.\n"];
  enabled: bool option
    [@ocaml.doc
      "Specifies whether the KMS key is enabled. When [KeyState] is [Enabled] this value is true, otherwise it is false.\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time when the KMS key was created.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the KMS key. For examples, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms}Key Management Service (KMS)} in the Example ARNs section of the {i Amazon Web Services General Reference}.\n"];
  key_id: string
    [@ocaml.doc "The globally unique identifier for the KMS key.\n"];
  aws_account_id: string option
    [@ocaml.doc
      "The twelve-digit account ID of the Amazon Web Services account that owns the KMS key.\n"]}
[@@ocaml.doc
  "Contains metadata about a KMS key.\n\n This data type is used as a response element for the [CreateKey], [DescribeKey], and [ReplicateKey] operations.\n "]
type nonrec replicate_key_response =
  {
  replica_tags: tag list option
    [@ocaml.doc
      "The tags on the new replica key. The value is a list of tag key and tag value pairs.\n"];
  replica_policy: string option
    [@ocaml.doc
      "The key policy of the new replica key. The value is a key policy document in JSON format.\n"];
  replica_key_metadata: key_metadata option
    [@ocaml.doc
      "Displays details about the new replica key, including its Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) and {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of KMS keys}. It also includes the ARN and Amazon Web Services Region of its primary key and other replica keys.\n"]}
[@@ocaml.doc ""]
type nonrec replicate_key_request =
  {
  tags: tag list option
    [@ocaml.doc
      "Assigns one or more tags to the replica key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the [TagResource] operation.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n     \n       To use this parameter, you must have {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} permission in an IAM policy.\n       \n        Tags are not a shared property of multi-Region keys. You can specify the same tags or different tags for each key in a set of related multi-Region keys. KMS does not synchronize this property.\n        \n         Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.\n         \n          When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging Keys}.\n          "];
  description: string option
    [@ocaml.doc
      "A description of the KMS key. The default value is an empty string (no description).\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    The description is not a shared property of multi-Region keys. You can specify the same description or a different description for each key in a set of related multi-Region keys. KMS does not synchronize this property.\n    "];
  bypass_policy_lockout_safety_check: bool option
    [@ocaml.doc
      "Skips (\"bypasses\") the key policy lockout safety check. The default value is false.\n\n  Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.\n   \n     Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.\n     "];
  policy: string option
    [@ocaml.doc
      "The key policy to attach to the KMS key. This parameter is optional. If you do not provide a key policy, KMS attaches the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default}default key policy} to the KMS key.\n\n The key policy is not a shared property of multi-Region keys. You can specify the same key policy or a different key policy for each key in a set of related multi-Region keys. KMS does not synchronize this property.\n \n  If you provide a key policy, it must meet the following criteria:\n  \n   {ul\n         {-  The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)\n             \n              }\n         {-  Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.\n             \n              }\n         }\n   A key policy document can include only the following characters:\n   \n    {ul\n          {-  Printable ASCII characters from the space character ([\\u0020]) through the end of the ASCII character range.\n              \n               }\n          {-  Printable characters in the Basic Latin and Latin-1 Supplement character set (through [\\u00FF]).\n              \n               }\n          {-  The tab ([\\u0009]), line feed ([\\u000A]), and carriage return ([\\u000D]) special characters\n              \n               }\n          }\n   For information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key policies in KMS} in the {i Key Management Service Developer Guide}. For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }.\n   "];
  replica_region: string
    [@ocaml.doc
      "The Region ID of the Amazon Web Services Region for this replica key. \n\n Enter the Region ID, such as [us-east-1] or [ap-southeast-2]. For a list of Amazon Web Services Regions in which KMS is supported, see {{:https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region}KMS service endpoints} in the {i Amazon Web Services General Reference}.\n \n   HMAC KMS keys are not supported in all Amazon Web Services Regions. If you try to replicate an HMAC KMS key in an Amazon Web Services Region in which HMAC keys are not supported, the [ReplicateKey] operation returns an [UnsupportedOperationException]. For a list of Regions in which HMAC KMS keys are supported, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC keys in KMS} in the {i Key Management Service Developer Guide}.\n   \n     The replica must be in a different Amazon Web Services Region than its primary key and other replicas of that primary key, but in the same Amazon Web Services partition. KMS must be available in the replica Region. If the Region is not enabled by default, the Amazon Web Services account must be enabled in the Region. For information about Amazon Web Services partitions, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs)} in the {i Amazon Web Services General Reference}. For information about enabling and disabling Regions, see {{:https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable}Enabling a Region} and {{:https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable}Disabling a Region} in the {i Amazon Web Services General Reference}.\n     "];
  key_id: string
    [@ocaml.doc
      "Identifies the multi-Region primary key that is being replicated. To determine whether a KMS key is a multi-Region primary key, use the [DescribeKey] operation to check the value of the [MultiRegionKeyType] property.\n\n Specify the key ID or key ARN of a multi-Region primary key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_ciphertext_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "From the [Decrypt] or [ReEncrypt] operation, the request was rejected because the specified ciphertext, or additional authenticated data incorporated into the ciphertext, such as the encryption context, is corrupted, missing, or otherwise invalid.\n\n From the [ImportKeyMaterial] operation, the request was rejected because KMS could not decrypt the encrypted (wrapped) key material. \n "]
type nonrec incorrect_key_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified KMS key cannot decrypt the data. The [KeyId] in a [Decrypt] request and the [SourceKeyId] in a [ReEncrypt] request must identify the same KMS key that was used to encrypt the ciphertext.\n"]
type nonrec re_encrypt_response =
  {
  destination_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to reencrypt the data.\n"];
  source_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to decrypt the ciphertext before it was reencrypted.\n"];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to reencrypt the data.\n"];
  source_key_id: string option
    [@ocaml.doc
      "Unique identifier of the KMS key used to originally encrypt the data.\n"];
  ciphertext_blob: bytes option
    [@ocaml.doc
      "The reencrypted data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec encryption_context_type = (string * string) list[@@ocaml.doc ""]
type nonrec re_encrypt_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  destination_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that KMS will use to reecrypt the data after it has decrypted it. The default value, [SYMMETRIC_DEFAULT], represents the encryption algorithm used for symmetric encryption KMS keys.\n\n This parameter is required only when the destination KMS key is an asymmetric KMS key.\n "];
  source_encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that KMS will use to decrypt the ciphertext before it is reencrypted. The default value, [SYMMETRIC_DEFAULT], represents the algorithm used for symmetric encryption KMS keys.\n\n Specify the same algorithm that was used to encrypt the ciphertext. If you specify a different algorithm, the decrypt attempt fails.\n \n  This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key.\n  "];
  destination_encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies that encryption context to use when the reencrypting the data.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    A destination encryption context is valid only when the destination KMS key is a symmetric encryption KMS key. The standard ciphertext format for asymmetric KMS keys does not include fields for metadata.\n    \n     An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n     \n      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n      "];
  destination_key_id: string
    [@ocaml.doc
      "A unique identifier for the KMS key that is used to reencrypt the data. Specify a symmetric encryption KMS key or an asymmetric KMS key with a [KeyUsage] value of [ENCRYPT_DECRYPT]. To find the [KeyUsage] value of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  source_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key that KMS will use to decrypt the ciphertext before it is re-encrypted.\n\n Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the [ReEncrypt] operation throws an [IncorrectKeyException].\n \n  This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.\n  \n   To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n   \n    For example:\n    \n     {ul\n           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Alias name: [alias/ExampleAlias] \n               \n                }\n           {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n               \n                }\n           }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  source_encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context to use to decrypt the ciphertext. Enter the same encryption context that was used to encrypt the ciphertext.\n\n An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n \n  For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n  "];
  ciphertext_blob: bytes
    [@ocaml.doc "Ciphertext of the data to reencrypt.\n"]}[@@ocaml.doc ""]
type nonrec put_key_policy_request =
  {
  bypass_policy_lockout_safety_check: bool option
    [@ocaml.doc
      "Skips (\"bypasses\") the key policy lockout safety check. The default value is false.\n\n  Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.\n   \n     Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.\n     "];
  policy: string
    [@ocaml.doc
      "The key policy to attach to the KMS key.\n\n The key policy must meet the following criteria:\n \n  {ul\n        {-  The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)\n            \n             }\n        {-  Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.\n            \n             }\n        }\n   A key policy document can include only the following characters:\n   \n    {ul\n          {-  Printable ASCII characters from the space character ([\\u0020]) through the end of the ASCII character range.\n              \n               }\n          {-  Printable characters in the Basic Latin and Latin-1 Supplement character set (through [\\u00FF]).\n              \n               }\n          {-  The tab ([\\u0009]), line feed ([\\u000A]), and carriage return ([\\u000D]) special characters\n              \n               }\n          }\n   For information about key policies, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html}Key policies in KMS} in the {i Key Management Service Developer Guide}.For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }.\n   "];
  policy_name: string option
    [@ocaml.doc
      "The name of the key policy. If no policy name is specified, the default value is [default]. The only valid value is [default].\n"];
  key_id: string
    [@ocaml.doc
      "Sets the key policy on the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_marker_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the marker that specifies where pagination should next begin is not valid.\n"]
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
type nonrec grant_constraints =
  {
  encryption_context_equals: encryption_context_type option
    [@ocaml.doc
      "A list of key-value pairs that must match the encryption context in the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operation} request. The grant allows the operation only when the encryption context in the request is the same as the encryption context specified in this constraint.\n"];
  encryption_context_subset: encryption_context_type option
    [@ocaml.doc
      "A list of key-value pairs that must be included in the encryption context of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operation} request. The grant allows the cryptographic operation only when the encryption context in the request includes the key-value pairs specified in this constraint, although it can include additional key-value pairs.\n"]}
[@@ocaml.doc
  "Use this structure to allow {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} in the grant only when the operation request includes the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}encryption context}. \n\n KMS applies the grant constraints only to cryptographic operations that support an encryption context, that is, all cryptographic operations with a {{:https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks}symmetric KMS key}. Grant constraints are not applied to operations that do not support an encryption context, such as cryptographic operations with asymmetric KMS keys and management operations, such as [DescribeKey] or [RetireGrant].\n \n   In a cryptographic operation, the encryption context in the decryption operation must be an exact, case-sensitive match for the keys and values in the encryption context of the encryption operation. Only the order of the pairs can vary.\n   \n    However, in a grant constraint, the key in each key-value pair is not case sensitive, but the value is case sensitive.\n    \n     To avoid confusion, do not use multiple encryption context pairs that differ only by case. To require a fully case-sensitive encryption context, use the [kms:EncryptionContext:] and [kms:EncryptionContextKeys] conditions in an IAM or key policy. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context}kms:EncryptionContext:} in the {i  {i Key Management Service Developer Guide} }.\n     \n      "]
type nonrec grant_list_entry =
  {
  constraints: grant_constraints option
    [@ocaml.doc
      "A list of key-value pairs that must be present in the encryption context of certain subsequent operations that the grant allows.\n"];
  operations: grant_operation list option
    [@ocaml.doc "The list of operations permitted by the grant.\n"];
  issuing_account: string option
    [@ocaml.doc
      "The Amazon Web Services account under which the grant was issued.\n"];
  retiring_principal: string option
    [@ocaml.doc "The principal that can retire the grant.\n"];
  grantee_principal: string option
    [@ocaml.doc
      "The identity that gets the permissions in the grant.\n\n The [GranteePrincipal] field in the [ListGrants] response usually contains the user or role designated as the grantee principal in the grant. However, when the grantee principal in the grant is an Amazon Web Services service, the [GranteePrincipal] field contains the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services}service principal}, which might represent several different grantee principals.\n "];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time when the grant was created.\n"];
  name: string option
    [@ocaml.doc
      "The friendly name that identifies the grant. If a name was provided in the [CreateGrant] request, that name is returned. Otherwise this value is null.\n"];
  grant_id: string option
    [@ocaml.doc "The unique identifier for the grant.\n"];
  key_id: string option
    [@ocaml.doc
      "The unique identifier for the KMS key to which the grant applies.\n"]}
[@@ocaml.doc "Contains information about a grant.\n"]
type nonrec list_grants_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  grants: grant_list_entry list option [@ocaml.doc "A list of grants.\n"]}
[@@ocaml.doc ""]
type nonrec list_retirable_grants_request =
  {
  retiring_principal: string
    [@ocaml.doc
      "The retiring principal for which to list grants. Enter a principal in your Amazon Web Services account.\n\n To specify the retiring principal, use the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i  {i Identity and Access Management User Guide} }.\n "];
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.\n "]}
[@@ocaml.doc ""]
type nonrec list_resource_tags_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n\n Do not assume or infer any information from this value.\n "];
  tags: tag list option
    [@ocaml.doc
      "A list of tags. Each tag consists of a tag key and a tag value.\n\n  Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec list_resource_tags_request =
  {
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n\n Do not attempt to construct this value. Use only the value of [NextMarker] from the truncated response you just received.\n "];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 50, inclusive. If you do not include a value, it defaults to 50.\n "];
  key_id: string
    [@ocaml.doc
      "Gets tags on the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec key_list_entry =
  {
  key_arn: string option [@ocaml.doc "ARN of the key.\n"];
  key_id: string option [@ocaml.doc "Unique identifier of the key.\n"]}
[@@ocaml.doc "Contains information about each entry in the key list.\n"]
type nonrec list_keys_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  keys: key_list_entry list option [@ocaml.doc "A list of KMS keys.\n"]}
[@@ocaml.doc ""]
type nonrec list_keys_request =
  {
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.\n "]}
[@@ocaml.doc ""]
type nonrec rotation_type =
  | ON_DEMAND [@ocaml.doc ""]
  | AUTOMATIC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec rotations_list_entry =
  {
  rotation_type: rotation_type option
    [@ocaml.doc
      "Identifies whether the key material rotation was a scheduled {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-enable-disable}automatic rotation} or an {{:https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotating-keys-on-demand}on-demand rotation}.\n"];
  rotation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Date and time that the key material rotation completed. Formatted as Unix time.\n"];
  key_id: string option [@ocaml.doc "Unique identifier of the key.\n"]}
[@@ocaml.doc
  "Contains information about completed key material rotations.\n"]
type nonrec list_key_rotations_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  rotations: rotations_list_entry list option
    [@ocaml.doc "A list of completed key material rotations.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec list_key_rotations_request =
  {
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.\n "];
  key_id: string
    [@ocaml.doc
      "Gets the key rotations for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec list_key_policies_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  policy_names: string list option
    [@ocaml.doc
      "A list of key policy names. The only valid value is [default].\n"]}
[@@ocaml.doc ""]
type nonrec list_key_policies_request =
  {
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 1000, inclusive. If you do not include a value, it defaults to 100.\n \n  Only one policy can be attached to a key.\n  "];
  key_id: string
    [@ocaml.doc
      "Gets the names of key policies for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec list_grants_request =
  {
  grantee_principal: string option
    [@ocaml.doc
      "Returns only grants where the specified principal is the grantee principal for the grant.\n"];
  grant_id: string option
    [@ocaml.doc
      "Returns only the grant with the specified grant ID. The grant ID uniquely identifies the grant. \n"];
  key_id: string
    [@ocaml.doc
      "Returns only grants for the specified KMS key. This parameter is required.\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "];
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.\n "]}
[@@ocaml.doc ""]
type nonrec alias_list_entry =
  {
  last_updated_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Date and time that the alias was most recently associated with a KMS key in the account and Region. Formatted as Unix time.\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Date and time that the alias was most recently created in the account and Region. Formatted as Unix time.\n"];
  target_key_id: string option
    [@ocaml.doc
      "String that contains the key identifier of the KMS key associated with the alias.\n"];
  alias_arn: string option [@ocaml.doc "String that contains the key ARN.\n"];
  alias_name: string option
    [@ocaml.doc
      "String that contains the alias. This value begins with [alias/].\n"]}
[@@ocaml.doc "Contains information about an alias.\n"]
type nonrec list_aliases_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  aliases: alias_list_entry list option [@ocaml.doc "A list of aliases.\n"]}
[@@ocaml.doc ""]
type nonrec list_aliases_request =
  {
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n\n This value is optional. If you include a value, it must be between 1 and 100, inclusive. If you do not include a value, it defaults to 50.\n "];
  key_id: string option
    [@ocaml.doc
      "Lists only aliases that are associated with the specified KMS key. Enter a KMS key in your Amazon Web Services account. \n\n This parameter is optional. If you omit it, [ListAliases] returns all aliases in the account and Region.\n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec invalid_import_token_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the provided import token is invalid or is associated with a different KMS key.\n"]
type nonrec incorrect_key_material_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the key material in the request is, expired, invalid, or is not the same key material that was previously imported into this KMS key.\n"]
type nonrec expired_import_token_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified import token is expired. Use [GetParametersForImport] to get a new import token and public key, use the new public key to encrypt the key material, and then try the request again.\n"]
type nonrec import_key_material_request =
  {
  expiration_model: expiration_model_type option
    [@ocaml.doc
      "Specifies whether the key material expires. The default is [KEY_MATERIAL_EXPIRES]. For help with this choice, see {{:https://docs.aws.amazon.com/en_us/kms/latest/developerguide/importing-keys.html#importing-keys-expiration}Setting an expiration time} in the {i Key Management Service Developer Guide}.\n\n When the value of [ExpirationModel] is [KEY_MATERIAL_EXPIRES], you must specify a value for the [ValidTo] parameter. When value is [KEY_MATERIAL_DOES_NOT_EXPIRE], you must omit the [ValidTo] parameter.\n \n  You cannot change the [ExpirationModel] or [ValidTo] values for the current import after the request completes. To change either value, you must reimport the key material.\n  "];
  valid_to: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the imported key material expires. This parameter is required when the value of the [ExpirationModel] parameter is [KEY_MATERIAL_EXPIRES]. Otherwise it is not valid.\n\n The value of this parameter must be a future date and time. The maximum value is 365 days from the request date.\n \n  When the key material expires, KMS deletes the key material from the KMS key. Without its key material, the KMS key is unusable. To use the KMS key in cryptographic operations, you must reimport the same key material.\n  \n   You cannot change the [ExpirationModel] or [ValidTo] values for the current import after the request completes. To change either value, you must delete ([DeleteImportedKeyMaterial]) and reimport the key material.\n   "];
  encrypted_key_material: bytes
    [@ocaml.doc
      "The encrypted key material to import. The key material must be encrypted under the public wrapping key that [GetParametersForImport] returned, using the wrapping algorithm that you specified in the same [GetParametersForImport] request.\n"];
  import_token: bytes
    [@ocaml.doc
      "The import token that you received in the response to a previous [GetParametersForImport] request. It must be from the same response that contained the public key that you used to encrypt the key material.\n"];
  key_id: string
    [@ocaml.doc
      "The identifier of the KMS key that will be associated with the imported key material. This must be the same KMS key specified in the [KeyID] parameter of the corresponding [GetParametersForImport] request. The [Origin] of the KMS key must be [EXTERNAL] and its [KeyState] must be [PendingImport]. \n\n The KMS key can be a symmetric encryption KMS key, HMAC KMS key, asymmetric encryption KMS key, or asymmetric signing KMS key, including a {{:kms/latest/developerguide/multi-region-keys-overview.html}multi-Region key} of any supported type. You cannot perform this operation on a KMS key in a custom key store, or on a KMS key in a different Amazon Web Services account.\n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec get_public_key_response =
  {
  key_agreement_algorithms: key_agreement_algorithm_spec list option
    [@ocaml.doc
      "The key agreement algorithm used to derive a shared secret. This field is present only when the KMS key has a [KeyUsage] value of [KEY_AGREEMENT].\n"];
  signing_algorithms: signing_algorithm_spec list option
    [@ocaml.doc
      "The signing algorithms that KMS supports for this key.\n\n This field appears in the response only when the [KeyUsage] of the public key is [SIGN_VERIFY].\n "];
  encryption_algorithms: encryption_algorithm_spec list option
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
  public_key: bytes option
    [@ocaml.doc
      "The exported public key. \n\n The value is a DER-encoded X.509 public key, also known as [SubjectPublicKeyInfo] (SPKI), as defined in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n \n  \n  "];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the asymmetric KMS key from which the public key was downloaded.\n"]}
[@@ocaml.doc ""]
type nonrec get_public_key_request =
  {
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_id: string
    [@ocaml.doc
      "Identifies the asymmetric KMS key that includes the public key.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec get_parameters_for_import_response =
  {
  parameters_valid_to: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time at which the import token and public key are no longer valid. After this time, you cannot use them to make an [ImportKeyMaterial] request and you must send another [GetParametersForImport] request to get new ones.\n"];
  public_key: bytes option
    [@ocaml.doc
      "The public key to use to encrypt the key material before importing it with [ImportKeyMaterial].\n"];
  import_token: bytes option
    [@ocaml.doc
      "The import token to send in a subsequent [ImportKeyMaterial] request.\n"];
  key_id: string option
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
      "The algorithm you will use with the RSA public key ([PublicKey]) in the response to protect your key material during import. For more information, see {{:kms/latest/developerguide/importing-keys-get-public-key-and-token.html#select-wrapping-algorithm}Select a wrapping algorithm} in the {i Key Management Service Developer Guide}.\n\n For RSA_AES wrapping algorithms, you encrypt your key material with an AES key that you generate, then encrypt your AES key with the RSA public key from KMS. For RSAES wrapping algorithms, you encrypt your key material directly with the RSA public key from KMS.\n \n  The wrapping algorithms that you can use depend on the type of key material that you are importing. To import an RSA private key, you must use an RSA_AES wrapping algorithm.\n  \n   {ul\n         {-   {b RSA_AES_KEY_WRAP_SHA_256} \226\128\148 Supported for wrapping RSA and ECC key material.\n             \n              }\n         {-   {b RSA_AES_KEY_WRAP_SHA_1} \226\128\148 Supported for wrapping RSA and ECC key material.\n             \n              }\n         {-   {b RSAES_OAEP_SHA_256} \226\128\148 Supported for all types of key material, except RSA key material (private key).\n             \n              You cannot use the RSAES_OAEP_SHA_256 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.\n              \n               }\n         {-   {b RSAES_OAEP_SHA_1} \226\128\148 Supported for all types of key material, except RSA key material (private key).\n             \n              You cannot use the RSAES_OAEP_SHA_1 wrapping algorithm with the RSA_2048 wrapping key spec to wrap ECC_NIST_P521 key material.\n              \n               }\n         {-   {b RSAES_PKCS1_V1_5} (Deprecated) \226\128\148 As of October 10, 2023, KMS does not support the RSAES_PKCS1_V1_5 wrapping algorithm.\n             \n              }\n         }\n  "];
  key_id: string
    [@ocaml.doc
      "The identifier of the KMS key that will be associated with the imported key material. The [Origin] of the KMS key must be [EXTERNAL].\n\n All KMS key types are supported, including multi-Region keys. However, you cannot import key material into a KMS key in a custom key store.\n \n  Specify the key ID or key ARN of the KMS key.\n  \n   For example:\n   \n    {ul\n          {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n              \n               }\n          }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec get_key_rotation_status_response =
  {
  on_demand_rotation_start_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Identifies the date and time that an in progress on-demand rotation was initiated.\n\n The KMS API follows an {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-eventual-consistency.html}eventual consistency} model due to the distributed nature of the system. As a result, there might be a slight delay between initiating on-demand key rotation and the rotation's completion. Once the on-demand rotation is complete, use [ListKeyRotations] to view the details of the on-demand rotation.\n "];
  next_rotation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The next date that KMS will automatically rotate the key material.\n"];
  rotation_period_in_days: int option
    [@ocaml.doc
      "The number of days between each automatic rotation. The default value is 365 days.\n"];
  key_id: string option
    [@ocaml.doc "Identifies the specified symmetric encryption KMS key.\n"];
  key_rotation_enabled: bool option
    [@ocaml.doc
      "A Boolean value that specifies whether key rotation is enabled.\n"]}
[@@ocaml.doc ""]
type nonrec get_key_rotation_status_request =
  {
  key_id: string
    [@ocaml.doc
      "Gets the rotation status for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec get_key_policy_response =
  {
  policy_name: string option
    [@ocaml.doc
      "The name of the key policy. The only valid value is [default].\n"];
  policy: string option
    [@ocaml.doc "A key policy document in JSON format.\n"]}[@@ocaml.doc ""]
type nonrec get_key_policy_request =
  {
  policy_name: string option
    [@ocaml.doc
      "Specifies the name of the key policy. If no policy name is specified, the default value is [default]. The only valid name is [default]. To get the names of key policies, use [ListKeyPolicies].\n"];
  key_id: string
    [@ocaml.doc
      "Gets the key policy for the specified KMS key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec generate_random_response =
  {
  ciphertext_for_recipient: bytes option
    [@ocaml.doc
      "The plaintext random bytes encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  plaintext: bytes option
    [@ocaml.doc
      "The random byte string. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n\n If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.\n "]}
[@@ocaml.doc ""]
type nonrec key_encryption_mechanism =
  | RSAES_OAEP_SHA_256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec recipient_info =
  {
  attestation_document: bytes option
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
  custom_key_store_id: string option
    [@ocaml.doc
      "Generates the random byte string in the CloudHSM cluster that is associated with the specified CloudHSM key store. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n\n External key store IDs are not valid for this parameter. If you specify the ID of an external key store, [GenerateRandom] throws an [UnsupportedOperationException].\n "];
  number_of_bytes: int option
    [@ocaml.doc
      "The length of the random byte string. This parameter is required.\n"]}
[@@ocaml.doc ""]
type nonrec generate_mac_response =
  {
  key_id: string option
    [@ocaml.doc "The HMAC KMS key used in the operation.\n"];
  mac_algorithm: mac_algorithm_spec option
    [@ocaml.doc "The MAC algorithm that was used to generate the HMAC.\n"];
  mac: bytes option
    [@ocaml.doc
      "The hash-based message authentication code (HMAC) that was generated for the specified message, HMAC KMS key, and MAC algorithm.\n\n This is the standard, raw HMAC defined in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.\n "]}
[@@ocaml.doc ""]
type nonrec generate_mac_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  mac_algorithm: mac_algorithm_spec
    [@ocaml.doc
      "The MAC algorithm used in the operation.\n\n  The algorithm must be compatible with the HMAC KMS key that you specify. To find the MAC algorithms that your HMAC KMS key supports, use the [DescribeKey] operation and see the [MacAlgorithms] field in the [DescribeKey] response.\n "];
  key_id: string
    [@ocaml.doc
      "The HMAC KMS key to use in the operation. The MAC algorithm computes the HMAC for the message and the key as described in {{:https://datatracker.ietf.org/doc/html/rfc2104}RFC 2104}.\n\n To identify an HMAC KMS key, use the [DescribeKey] operation and see the [KeySpec] field in the response.\n "];
  message: bytes
    [@ocaml.doc
      "The message to be hashed. Specify a message of up to 4,096 bytes. \n\n  [GenerateMac] and [VerifyMac] do not provide special handling for message digests. If you generate an HMAC for a hash digest of a message, you must verify the HMAC of the same hash digest.\n "]}
[@@ocaml.doc ""]
type nonrec generate_data_key_without_plaintext_response =
  {
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the data key.\n"];
  ciphertext_blob: bytes option
    [@ocaml.doc
      "The encrypted data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec data_key_spec =
  | AES_128 [@ocaml.doc ""]
  | AES_256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec generate_data_key_without_plaintext_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  number_of_bytes: int option
    [@ocaml.doc
      "The length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common key lengths (128-bit and 256-bit symmetric keys), we recommend that you use the [KeySpec] field instead of this one.\n"];
  key_spec: data_key_spec option
    [@ocaml.doc
      "The length of the data key. Use [AES_128] to generate a 128-bit symmetric key, or [AES_256] to generate a 256-bit symmetric key.\n"];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the data key.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n     "];
  key_id: string
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
  key_pair_spec: data_key_pair_spec option
    [@ocaml.doc "The type of data key pair that was generated.\n"];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the private key.\n"];
  public_key: bytes option
    [@ocaml.doc
      "The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"];
  private_key_ciphertext_blob: bytes option
    [@ocaml.doc
      "The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec generate_data_key_pair_without_plaintext_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_pair_spec: data_key_pair_spec
    [@ocaml.doc
      "Determines the type of data key pair that is generated.\n\n The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.\n "];
  key_id: string
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation. \n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the private key in the data key pair.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n     "]}
[@@ocaml.doc ""]
type nonrec generate_data_key_pair_response =
  {
  ciphertext_for_recipient: bytes option
    [@ocaml.doc
      "The plaintext private data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  key_pair_spec: data_key_pair_spec option
    [@ocaml.doc "The type of data key pair that was generated.\n"];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the private key.\n"];
  public_key: bytes option
    [@ocaml.doc
      "The public key (in plaintext). When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"];
  private_key_plaintext: bytes option
    [@ocaml.doc
      "The plaintext copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n\n If the response includes the [CiphertextForRecipient] field, the [PrivateKeyPlaintext] field is null or empty.\n "];
  private_key_ciphertext_blob: bytes option
    [@ocaml.doc
      "The encrypted copy of the private key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec generate_data_key_pair_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To call DeriveSharedSecret for an Amazon Web Services Nitro Enclaves, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} to generate the attestation document and then use the Recipient parameter from any Amazon Web Services SDK to provide the attestation document for the enclave.\n \n  When you use this parameter, instead of returning a plaintext copy of the private data key, KMS encrypts the plaintext private data key under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains a copy of the private data key encrypted under the KMS key specified by the [KeyId] parameter. The [PrivateKeyPlaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_pair_spec: data_key_pair_spec
    [@ocaml.doc
      "Determines the type of data key pair that is generated. \n\n The KMS rule that restricts the use of asymmetric RSA and SM2 KMS keys to encrypt and decrypt or to sign and verify (but not both), and the rule that permits you to use ECC KMS keys only to sign and verify, are not effective on data key pairs, which are used outside of KMS. The SM2 key spec is only available in China Regions.\n "];
  key_id: string
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the private key in the data key pair. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the private key in the data key pair.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n     "]}
[@@ocaml.doc ""]
type nonrec generate_data_key_response =
  {
  ciphertext_for_recipient: bytes option
    [@ocaml.doc
      "The plaintext data key encrypted with the public key from the Nitro enclave. This ciphertext can be decrypted only by using a private key in the Nitro enclave. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that encrypted the data key.\n"];
  plaintext: bytes option
    [@ocaml.doc
      "The plaintext data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to encrypt your data outside of KMS. Then, remove it from memory as soon as possible.\n\n If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.\n "];
  ciphertext_blob: bytes option
    [@ocaml.doc
      "The encrypted copy of the data key. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec generate_data_key_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.\n \n  When you use this parameter, instead of returning the plaintext data key, KMS encrypts the plaintext data key under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains a copy of the data key encrypted under the KMS key specified by the [KeyId] parameter. The [Plaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_spec: data_key_spec option
    [@ocaml.doc
      "Specifies the length of the data key. Use [AES_128] to generate a 128-bit symmetric key, or [AES_256] to generate a 256-bit symmetric key.\n\n You must specify either the [KeySpec] or the [NumberOfBytes] parameter (but not both) in every [GenerateDataKey] request.\n "];
  number_of_bytes: int option
    [@ocaml.doc
      "Specifies the length of the data key in bytes. For example, use the value 64 to generate a 512-bit data key (64 bytes is 512 bits). For 128-bit (16-byte) and 256-bit (32-byte) data keys, use the [KeySpec] parameter.\n\n You must specify either the [KeySpec] or the [NumberOfBytes] parameter (but not both) in every [GenerateDataKey] request.\n "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used when encrypting the data key.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n     "];
  key_id: string
    [@ocaml.doc
      "Specifies the symmetric encryption KMS key that encrypts the data key. You cannot specify an asymmetric KMS key or a KMS key in a custom key store. To get the type and origin of your KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec encrypt_response =
  {
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to encrypt the plaintext.\n"];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to encrypt the plaintext.\n"];
  ciphertext_blob: bytes option
    [@ocaml.doc
      "The encrypted plaintext. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n"]}
[@@ocaml.doc ""]
type nonrec encrypt_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that KMS will use to encrypt the plaintext message. The algorithm must be compatible with the KMS key that you specify.\n\n This parameter is required only for asymmetric KMS keys. The default value, [SYMMETRIC_DEFAULT], is the algorithm used for symmetric encryption KMS keys. If you are using an asymmetric KMS key, we recommend RSAES_OAEP_SHA_256.\n \n  The SM2PKE algorithm is only available in China Regions.\n  "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context that will be used to encrypt the data. An encryption context is valid only for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context. \n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n    \n     For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n     "];
  plaintext: bytes [@ocaml.doc "Data to be encrypted.\n"];
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key to use in the encryption operation. The KMS key must have a [KeyUsage] of [ENCRYPT_DECRYPT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec enable_key_rotation_request =
  {
  rotation_period_in_days: int option
    [@ocaml.doc
      "Use this parameter to specify a custom period of time between each rotation date. If no value is specified, the default value is 365 days.\n\n The rotation period defines the number of days after you enable automatic key rotation that KMS will rotate your key material, and the number of days between each automatic rotation thereafter.\n \n  You can use the {{:https://docs.aws.amazon.com/kms/latest/developerguide/conditions-kms.html#conditions-kms-rotation-period-in-days} [kms:RotationPeriodInDays] } condition key to further constrain the values that principals can specify in the [RotationPeriodInDays] parameter.\n  \n    \n   "];
  key_id: string
    [@ocaml.doc
      "Identifies a symmetric encryption KMS key. You cannot enable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. To enable or disable automatic rotation of a set of related {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-rotate}multi-Region keys}, set the property on the primary key.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec enable_key_request =
  {
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key to enable.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec disconnect_custom_key_store_request =
  {
  custom_key_store_id: string
    [@ocaml.doc
      "Enter the ID of the custom key store you want to disconnect. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec disable_key_rotation_request =
  {
  key_id: string
    [@ocaml.doc
      "Identifies a symmetric encryption KMS key. You cannot enable or disable automatic rotation of {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks}asymmetric KMS keys}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/hmac.html}HMAC KMS keys}, KMS keys with {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}imported key material}, or KMS keys in a {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec disable_key_request =
  {
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key to disable.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec describe_key_response =
  {
  key_metadata: key_metadata option
    [@ocaml.doc "Metadata associated with the key.\n"]}[@@ocaml.doc ""]
type nonrec describe_key_request =
  {
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  key_id: string
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
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time when the custom key store was created.\n"];
  connection_error_code: connection_error_code_type option
    [@ocaml.doc
      "Describes the connection error. This field appears in the response only when the [ConnectionState] is [FAILED].\n\n Many failures can be resolved by updating the properties of the custom key store. To update a custom key store, disconnect it ([DisconnectCustomKeyStore]), correct the errors ([UpdateCustomKeyStore]), and try to connect again ([ConnectCustomKeyStore]). For additional help resolving these errors, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in {i Key Management Service Developer Guide}.\n \n   {b All custom key stores:} \n  \n   {ul\n         {-   [INTERNAL_ERROR] \226\128\148 KMS could not complete the request due to an internal error. Retry the request. For [ConnectCustomKeyStore] requests, disconnect the custom key store before trying to connect again.\n             \n              }\n         {-   [NETWORK_ERRORS] \226\128\148 Network errors are preventing KMS from connecting the custom key store to its backing key store.\n             \n              }\n         }\n    {b CloudHSM key stores:} \n   \n    {ul\n          {-   [CLUSTER_NOT_FOUND] \226\128\148 KMS cannot find the CloudHSM cluster with the specified cluster ID.\n              \n               }\n          {-   [INSUFFICIENT_CLOUDHSM_HSMS] \226\128\148 The associated CloudHSM cluster does not contain any active HSMs. To connect a custom key store to its CloudHSM cluster, the cluster must contain at least one active HSM.\n              \n               }\n          {-   [INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET] \226\128\148 At least one private subnet associated with the CloudHSM cluster doesn't have any available IP addresses. A CloudHSM key store connection requires one free IP address in each of the associated private subnets, although two are preferable. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-   [INVALID_CREDENTIALS] \226\128\148 The [KeyStorePassword] for the custom key store doesn't match the current password of the [kmsuser] crypto user in the CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must change the [kmsuser] account password and update the [KeyStorePassword] value for the custom key store.\n              \n               }\n          {-   [SUBNET_NOT_FOUND] \226\128\148 A subnet in the CloudHSM cluster configuration was deleted. If KMS cannot find all of the subnets in the cluster configuration, attempts to connect the custom key store to the CloudHSM cluster fail. To fix this error, create a cluster from a recent backup and associate it with your custom key store. (This process creates a new cluster configuration with a VPC and private subnets.) For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed}How to Fix a Connection Failure} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-   [USER_LOCKED_OUT] \226\128\148 The [kmsuser] CU account is locked out of the associated CloudHSM cluster due to too many failed password attempts. Before you can connect your custom key store to its CloudHSM cluster, you must change the [kmsuser] account password and update the key store password value for the custom key store.\n              \n               }\n          {-   [USER_LOGGED_IN] \226\128\148 The [kmsuser] CU account is logged into the associated CloudHSM cluster. This prevents KMS from rotating the [kmsuser] account password and logging into the cluster. Before you can connect your custom key store to its CloudHSM cluster, you must log the [kmsuser] CU out of the cluster. If you changed the [kmsuser] password to log into the cluster, you must also and update the key store password value for the custom key store. For help, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2}How to Log Out and Reconnect} in the {i Key Management Service Developer Guide}.\n              \n               }\n          {-   [USER_NOT_FOUND] \226\128\148 KMS cannot find a [kmsuser] CU account in the associated CloudHSM cluster. Before you can connect your custom key store to its CloudHSM cluster, you must create a [kmsuser] CU account in the cluster, and then update the key store password value for the custom key store.\n              \n               }\n          }\n    {b External key stores:} \n   \n    {ul\n          {-   [INVALID_CREDENTIALS] \226\128\148 One or both of the [XksProxyAuthenticationCredential] values is not valid on the specified external key store proxy.\n              \n               }\n          {-   [XKS_PROXY_ACCESS_DENIED] \226\128\148 KMS requests are denied access to the external key store proxy. If the external key store proxy has authorization rules, verify that they permit KMS to communicate with the proxy on your behalf.\n              \n               }\n          {-   [XKS_PROXY_INVALID_CONFIGURATION] \226\128\148 A configuration error is preventing the external key store from connecting to its proxy. Verify the value of the [XksProxyUriPath].\n              \n               }\n          {-   [XKS_PROXY_INVALID_RESPONSE] \226\128\148 KMS cannot interpret the response from the external key store proxy. If you see this connection error code repeatedly, notify your external key store proxy vendor.\n              \n               }\n          {-   [XKS_PROXY_INVALID_TLS_CONFIGURATION] \226\128\148 KMS cannot connect to the external key store proxy because the TLS configuration is invalid. Verify that the XKS proxy supports TLS 1.2 or 1.3. Also, verify that the TLS certificate is not expired, and that it matches the hostname in the [XksProxyUriEndpoint] value, and that it is signed by a certificate authority included in the {{:https://github.com/aws/aws-kms-xksproxy-api-spec/blob/main/TrustedCertificateAuthorities}Trusted Certificate Authorities} list.\n              \n               }\n          {-   [XKS_PROXY_NOT_REACHABLE] \226\128\148 KMS can't communicate with your external key store proxy. Verify that the [XksProxyUriEndpoint] and [XksProxyUriPath] are correct. Use the tools for your external key store proxy to verify that the proxy is active and available on its network. Also, verify that your external key manager instances are operating properly. Connection attempts fail with this connection error code if the proxy reports that all external key manager instances are unavailable.\n              \n               }\n          {-   [XKS_PROXY_TIMED_OUT] \226\128\148 KMS can connect to the external key store proxy, but the proxy does not respond to KMS in the time allotted. If you see this connection error code repeatedly, notify your external key store proxy vendor.\n              \n               }\n          {-   [XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION] \226\128\148 The Amazon VPC endpoint service configuration doesn't conform to the requirements for an KMS external key store.\n              \n               {ul\n                     {-  The VPC endpoint service must be an endpoint service for interface endpoints in the caller's Amazon Web Services account.\n                         \n                          }\n                     {-  It must have a network load balancer (NLB) connected to at least two subnets, each in a different Availability Zone.\n                         \n                          }\n                     {-  The [Allow principals] list must include the KMS service principal for the Region, \n                         {[\n                         cks.kms..amazonaws.com\n                         ]}\n                         , such as [cks.kms.us-east-1.amazonaws.com].\n                         \n                          }\n                     {-  It must {i not} require {{:https://docs.aws.amazon.com/vpc/latest/privatelink/create-endpoint-service.html}acceptance} of connection requests.\n                         \n                          }\n                     {-  It must have a private DNS name. The private DNS name for an external key store with [VPC_ENDPOINT_SERVICE] connectivity must be unique in its Amazon Web Services Region.\n                         \n                          }\n                     {-  The domain of the private DNS name must have a {{:https://docs.aws.amazon.com/vpc/latest/privatelink/verify-domains.html}verification status} of [verified].\n                         \n                          }\n                     {-  The {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html}TLS certificate} specifies the private DNS hostname at which the endpoint is reachable.\n                         \n                          }\n                     \n           }\n            }\n          {-   [XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND] \226\128\148 KMS can't find the VPC endpoint service that it uses to communicate with the external key store proxy. Verify that the [XksProxyVpcEndpointServiceName] is correct and the KMS service principal has service consumer permissions on the Amazon VPC endpoint service.\n              \n               }\n          }\n  "];
  connection_state: connection_state_type option
    [@ocaml.doc
      "Indicates whether the custom key store is connected to its backing key store. For an CloudHSM key store, the [ConnectionState] indicates whether it is connected to its CloudHSM cluster. For an external key store, the [ConnectionState] indicates whether it is connected to the external key store proxy that communicates with your external key manager.\n\n You can create and use KMS keys in your custom key stores only when its [ConnectionState] is [CONNECTED].\n \n  The [ConnectionState] value is [DISCONNECTED] only if the key store has never been connected or you use the [DisconnectCustomKeyStore] operation to disconnect it. If the value is [CONNECTED] but you are having trouble using the custom key store, make sure that the backing key store is reachable and active. For an CloudHSM key store, verify that its associated CloudHSM cluster is active and contains at least one active HSM. For an external key store, verify that the external key store proxy and external key manager are connected and enabled.\n  \n   A value of [FAILED] indicates that an attempt to connect was unsuccessful. The [ConnectionErrorCode] field in the response indicates the cause of the failure. For help resolving a connection failure, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html}Troubleshooting a custom key store} in the {i Key Management Service Developer Guide}.\n   "];
  trust_anchor_certificate: string option
    [@ocaml.doc
      "The trust anchor certificate of the CloudHSM cluster associated with an CloudHSM key store. When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the cluster}, you create this certificate and save it in the [customerCA.crt] file.\n\n This field appears only when the [CustomKeyStoreType] is [AWS_CLOUDHSM].\n "];
  cloud_hsm_cluster_id: string option
    [@ocaml.doc
      "A unique identifier for the CloudHSM cluster that is associated with an CloudHSM key store. This field appears only when the [CustomKeyStoreType] is [AWS_CLOUDHSM].\n"];
  custom_key_store_name: string option
    [@ocaml.doc
      "The user-specified friendly name for the custom key store.\n"];
  custom_key_store_id: string option
    [@ocaml.doc "A unique identifier for the custom key store.\n"]}[@@ocaml.doc
                                                                    "Contains information about each custom key store in the custom key store list.\n"]
type nonrec describe_custom_key_stores_response =
  {
  truncated: bool option
    [@ocaml.doc
      "A flag that indicates whether there are more items in the list. When this value is true, the list in this response is truncated. To get more items, pass the value of the [NextMarker] element in this response to the [Marker] parameter in a subsequent request.\n"];
  next_marker: string option
    [@ocaml.doc
      "When [Truncated] is true, this element is present and contains the value to use for the [Marker] parameter in a subsequent request.\n"];
  custom_key_stores: custom_key_stores_list_entry list option
    [@ocaml.doc "Contains metadata about each custom key store.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_custom_key_stores_request =
  {
  marker: string option
    [@ocaml.doc
      "Use this parameter in a subsequent request after you receive a response with truncated results. Set it to the value of [NextMarker] from the truncated response you just received.\n"];
  limit: int option
    [@ocaml.doc
      "Use this parameter to specify the maximum number of items to return. When this value is present, KMS does not return more than the specified number of items, but it might return fewer.\n"];
  custom_key_store_name: string option
    [@ocaml.doc
      "Gets only information about the specified custom key store. Enter the friendly name of the custom key store.\n\n By default, this operation gets information about all custom key stores in the account and Region. To limit the output to a particular custom key store, provide either the [CustomKeyStoreId] or [CustomKeyStoreName] parameter, but not both.\n "];
  custom_key_store_id: string option
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
  ciphertext_for_recipient: bytes option
    [@ocaml.doc
      "The plaintext shared secret encrypted with the public key in the attestation document.\n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  shared_secret: bytes option
    [@ocaml.doc
      "The raw secret derived from the specified key agreement algorithm, private key in the asymmetric KMS key, and your peer's public key.\n\n If the response includes the [CiphertextForRecipient] field, the [SharedSecret] field is null or empty.\n "];
  key_id: string option
    [@ocaml.doc "Identifies the KMS key used to derive the shared secret.\n"]}
[@@ocaml.doc ""]
type nonrec derive_shared_secret_request =
  {
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nitro-enclave-how.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To call DeriveSharedSecret for an Amazon Web Services Nitro Enclaves, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} to generate the attestation document and then use the Recipient parameter from any Amazon Web Services SDK to provide the attestation document for the enclave.\n \n  When you use this parameter, instead of returning a plaintext copy of the shared secret, KMS encrypts the plaintext shared secret under the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [CiphertextBlob] field in the response contains the encrypted shared secret derived from the KMS key specified by the [KeyId] parameter and public key specified by the [PublicKey] parameter. The [SharedSecret] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  public_key: bytes
    [@ocaml.doc
      "Specifies the public key in your peer's NIST-recommended elliptic curve (ECC) or SM2 (China Regions only) key pair.\n\n The public key must be a DER-encoded X.509 public key, also known as [SubjectPublicKeyInfo] (SPKI), as defined in {{:https://tools.ietf.org/html/rfc5280}RFC 5280}.\n \n   [GetPublicKey] returns the public key of an asymmetric KMS key pair in the required DER-encoded format.\n  \n    If you use {{:https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-welcome.html}Amazon Web Services CLI version 1}, you must provide the DER-encoded X.509 public key in a file. Otherwise, the Amazon Web Services CLI Base64-encodes the public key a second time, resulting in a [ValidationException].\n    \n      You can specify the public key as binary data in a file using fileb (\n      {[\n      fileb://\n      ]}\n      ) or in-line using a Base64 encoded string.\n      "];
  key_agreement_algorithm: key_agreement_algorithm_spec
    [@ocaml.doc
      "Specifies the key agreement algorithm used to derive the shared secret. The only valid value is [ECDH].\n"];
  key_id: string
    [@ocaml.doc
      "Identifies an asymmetric NIST-recommended ECC or SM2 (China Regions only) KMS key. KMS uses the private key in the specified key pair to derive the shared secret. The key usage of the KMS key must be [KEY_AGREEMENT]. To find the [KeyUsage] of a KMS key, use the [DescribeKey] operation.\n\n To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Alias name: [alias/ExampleAlias] \n             \n              }\n         {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "]}
[@@ocaml.doc ""]
type nonrec delete_imported_key_material_request =
  {
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key from which you are deleting imported key material. The [Origin] of the KMS key must be [EXTERNAL].\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec custom_key_store_has_cm_ks_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the custom key store contains KMS keys. After verifying that you do not need to use the KMS keys, use the [ScheduleKeyDeletion] operation to delete the KMS keys. After they are deleted, you can delete the custom key store.\n"]
type nonrec delete_custom_key_store_request =
  {
  custom_key_store_id: string
    [@ocaml.doc
      "Enter the ID of the custom key store you want to delete. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec delete_alias_request =
  {
  alias_name: string
    [@ocaml.doc
      "The alias to be deleted. The alias name must begin with [alias/] followed by the alias name, such as [alias/ExampleAlias].\n"]}
[@@ocaml.doc ""]
type nonrec decrypt_response =
  {
  ciphertext_for_recipient: bytes option
    [@ocaml.doc
      "The plaintext data encrypted with the public key in the attestation document. \n\n This field is included in the response only when the [Recipient] parameter in the request includes a valid attestation document from an Amazon Web Services Nitro enclave. For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n "];
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "The encryption algorithm that was used to decrypt the ciphertext.\n"];
  plaintext: bytes option
    [@ocaml.doc
      "Decrypted plaintext data. When you use the HTTP API or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.\n\n If the response includes the [CiphertextForRecipient] field, the [Plaintext] field is null or empty.\n "];
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key that was used to decrypt the ciphertext.\n"]}
[@@ocaml.doc ""]
type nonrec decrypt_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  recipient: recipient_info option
    [@ocaml.doc
      "A signed {{:https://docs.aws.amazon.com/enclaves/latest/user/nitro-enclave-concepts.html#term-attestdoc}attestation document} from an Amazon Web Services Nitro enclave and the encryption algorithm to use with the enclave's public key. The only valid encryption algorithm is [RSAES_OAEP_SHA_256]. \n\n This parameter only supports attestation documents for Amazon Web Services Nitro Enclaves. To include this parameter, use the {{:https://docs.aws.amazon.com/enclaves/latest/user/developing-applications.html#sdk}Amazon Web Services Nitro Enclaves SDK} or any Amazon Web Services SDK.\n \n  When you use this parameter, instead of returning the plaintext data, KMS encrypts the plaintext data with the public key in the attestation document, and returns the resulting ciphertext in the [CiphertextForRecipient] field in the response. This ciphertext can be decrypted only with the private key in the enclave. The [Plaintext] field in the response is null or empty.\n  \n   For information about the interaction between KMS and Amazon Web Services Nitro Enclaves, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html}How Amazon Web Services Nitro Enclaves uses KMS} in the {i Key Management Service Developer Guide}.\n   "];
  encryption_algorithm: encryption_algorithm_spec option
    [@ocaml.doc
      "Specifies the encryption algorithm that will be used to decrypt the ciphertext. Specify the same algorithm that was used to encrypt the data. If you specify a different algorithm, the [Decrypt] operation fails.\n\n This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. The default value, [SYMMETRIC_DEFAULT], represents the only supported algorithm that is valid for symmetric encryption KMS keys.\n "];
  key_id: string option
    [@ocaml.doc
      "Specifies the KMS key that KMS uses to decrypt the ciphertext.\n\n Enter a key ID of the KMS key that was used to encrypt the ciphertext. If you identify a different KMS key, the [Decrypt] operation throws an [IncorrectKeyException].\n \n  This parameter is required only when the ciphertext was encrypted under an asymmetric KMS key. If you used a symmetric encryption KMS key, KMS can get the KMS key from metadata that it adds to the symmetric ciphertext blob. However, it is always recommended as a best practice. This practice ensures that you use the KMS key that you intend.\n  \n   To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN. When using an alias name, prefix it with [\"alias/\"]. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n   \n    For example:\n    \n     {ul\n           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Alias name: [alias/ExampleAlias] \n               \n                }\n           {-  Alias ARN: [arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias] \n               \n                }\n           }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey]. To get the alias name and alias ARN, use [ListAliases].\n   "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens. \n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  encryption_context: encryption_context_type option
    [@ocaml.doc
      "Specifies the encryption context to use when decrypting the data. An encryption context is valid only for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} with a symmetric encryption KMS key. The standard asymmetric encryption algorithms and HMAC algorithms that KMS uses do not support an encryption context.\n\n An {i encryption context} is a collection of non-secret key-value pairs that represent additional authenticated data. When you use an encryption context to encrypt data, you must specify the same (an exact case-sensitive match) encryption context to decrypt the data. An encryption context is supported only on operations with symmetric encryption KMS keys. On operations with symmetric encryption KMS keys, an encryption context is optional, but it is strongly recommended.\n \n  For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i Key Management Service Developer Guide}.\n  "];
  ciphertext_blob: bytes
    [@ocaml.doc "Ciphertext to be decrypted. The blob includes metadata.\n"]}
[@@ocaml.doc ""]
type nonrec create_key_response =
  {
  key_metadata: key_metadata option
    [@ocaml.doc "Metadata associated with the KMS key.\n"]}[@@ocaml.doc ""]
type nonrec create_key_request =
  {
  xks_key_id: string option
    [@ocaml.doc
      "Identifies the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-external-key}external key} that serves as key material for the KMS key in an {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html}external key store}. Specify the ID that the {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-xks-proxy}external key store proxy} uses to refer to the external key. For help, see the documentation for your external key store proxy.\n\n This parameter is required for a KMS key with an [Origin] value of [EXTERNAL_KEY_STORE]. It is not valid for KMS keys with any other [Origin] value.\n \n  The external key must be an existing 256-bit AES symmetric encryption key hosted outside of Amazon Web Services in an external key manager associated with the external key store specified by the [CustomKeyStoreId] parameter. This key must be enabled and configured to perform encryption and decryption. Each KMS key in an external key store must use a different external key. For details, see {{:https://docs.aws.amazon.com/create-xks-keys.html#xks-key-requirements}Requirements for a KMS key in an external key store} in the {i Key Management Service Developer Guide}.\n  \n   Each KMS key in an external key store is associated two backing keys. One is key material that KMS generates. The other is the external key specified by this parameter. When you use the KMS key in an external key store to encrypt data, the encryption operation is performed first by KMS using the KMS key material, and then by the external key manager using the specified external key, a process known as {i double encryption}. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/keystore-external.html#concept-double-encryption}Double encryption} in the {i Key Management Service Developer Guide}.\n   "];
  multi_region: bool option
    [@ocaml.doc
      "Creates a multi-Region primary key that you can replicate into other Amazon Web Services Regions. You cannot change this value after you create the KMS key. \n\n For a multi-Region key, set this parameter to [True]. For a single-Region KMS key, omit this parameter or set it to [False]. The default value is [False].\n \n  This operation supports {i multi-Region keys}, an KMS feature that lets you create multiple interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Multi-Region keys in KMS} in the {i Key Management Service Developer Guide}.\n  \n   This value creates a {i primary key}, not a replica. To create a {i replica key}, use the [ReplicateKey] operation. \n   \n    You can create a symmetric or asymmetric multi-Region key, and you can create a multi-Region key with imported key material. However, you cannot create a multi-Region key in a custom key store.\n    "];
  tags: tag list option
    [@ocaml.doc
      "Assigns one or more tags to the KMS key. Use this parameter to tag the KMS key when it is created. To tag an existing KMS key, use the [TagResource] operation.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n     Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/abac.html}ABAC for KMS} in the {i Key Management Service Developer Guide}.\n     \n       To use this parameter, you must have {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html}kms:TagResource} permission in an IAM policy.\n       \n        Each tag consists of a tag key and a tag value. Both the tag key and the tag value are required, but the tag value can be an empty (null) string. You cannot have more than one tag on a KMS key with the same tag key. If you specify an existing tag key with a different tag value, KMS replaces the current tag value with the specified one.\n        \n         When you add tags to an Amazon Web Services resource, Amazon Web Services generates a cost allocation report with usage and costs aggregated by tags. Tags can also be used to control access to a KMS key. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html}Tagging Keys}.\n         "];
  bypass_policy_lockout_safety_check: bool option
    [@ocaml.doc
      "Skips (\"bypasses\") the key policy lockout safety check. The default value is false.\n\n  Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}.\n   \n     Use this parameter only when you intend to prevent the principal that is making the request from making a subsequent {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html}PutKeyPolicy} request on the KMS key.\n     "];
  custom_key_store_id: string option
    [@ocaml.doc
      "Creates the KMS key in the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html}custom key store}. The [ConnectionState] of the custom key store must be [CONNECTED]. To find the CustomKeyStoreID and ConnectionState use the [DescribeCustomKeyStores] operation.\n\n This parameter is valid only for symmetric encryption KMS keys in a single Region. You cannot create any other type of KMS key in a custom key store.\n \n  When you create a KMS key in an CloudHSM key store, KMS generates a non-exportable 256-bit symmetric key in its associated CloudHSM cluster and associates it with the KMS key. When you create a KMS key in an external key store, you must use the [XksKeyId] parameter to specify an external key that serves as key material for the KMS key.\n  "];
  origin: origin_type option
    [@ocaml.doc
      "The source of the key material for the KMS key. You cannot change the origin after you create the KMS key. The default is [AWS_KMS], which means that KMS creates the key material.\n\n To {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-create-cmk.html}create a KMS key with no key material} (for imported key material), set this value to [EXTERNAL]. For more information about importing key material into KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html}Importing Key Material} in the {i Key Management Service Developer Guide}. The [EXTERNAL] origin value is valid only for symmetric KMS keys.\n \n  To {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-cmk-keystore.html}create a KMS key in an CloudHSM key store} and create its key material in the associated CloudHSM cluster, set this value to [AWS_CLOUDHSM]. You must also use the [CustomKeyStoreId] parameter to identify the CloudHSM key store. The [KeySpec] value must be [SYMMETRIC_DEFAULT].\n  \n   To {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keys.html}create a KMS key in an external key store}, set this value to [EXTERNAL_KEY_STORE]. You must also use the [CustomKeyStoreId] parameter to identify the external key store and the [XksKeyId] parameter to identify the associated external key. The [KeySpec] value must be [SYMMETRIC_DEFAULT].\n   "];
  key_spec: key_spec option
    [@ocaml.doc
      "Specifies the type of KMS key to create. The default value, [SYMMETRIC_DEFAULT], creates a KMS key with a 256-bit AES-GCM key that is used for encryption and decryption, except in China Regions, where it creates a 128-bit symmetric key that uses SM4 encryption. For help choosing a key spec for your KMS key, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-types.html#symm-asymm-choose}Choosing a KMS key type} in the {i  {i Key Management Service Developer Guide} }.\n\n The [KeySpec] determines whether the KMS key contains a symmetric key or an asymmetric key pair. It also determines the algorithms that the KMS key supports. You can't change the [KeySpec] after the KMS key is created. To further restrict the algorithms that can be used with the KMS key, use a condition key in its key policy or IAM policy. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-algorithm}kms:EncryptionAlgorithm}, {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-mac-algorithm}kms:MacAlgorithm} or {{:https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-signing-algorithm}kms:Signing Algorithm} in the {i  {i Key Management Service Developer Guide} }.\n \n    {{:http://aws.amazon.com/kms/features/#AWS_Service_Integration}Amazon Web Services services that are integrated with KMS} use symmetric encryption KMS keys to protect your data. These services do not support asymmetric KMS keys or HMAC KMS keys.\n   \n     KMS supports the following key specs for KMS keys:\n     \n      {ul\n            {-  Symmetric encryption key (default)\n                \n                 {ul\n                       {-   [SYMMETRIC_DEFAULT] \n                           \n                            }\n                       \n             }\n              }\n            {-  HMAC keys (symmetric)\n                \n                 {ul\n                       {-   [HMAC_224] \n                           \n                            }\n                       {-   [HMAC_256] \n                           \n                            }\n                       {-   [HMAC_384] \n                           \n                            }\n                       {-   [HMAC_512] \n                           \n                            }\n                       \n             }\n              }\n            {-  Asymmetric RSA key pairs (encryption and decryption -or- signing and verification)\n                \n                 {ul\n                       {-   [RSA_2048] \n                           \n                            }\n                       {-   [RSA_3072] \n                           \n                            }\n                       {-   [RSA_4096] \n                           \n                            }\n                       \n             }\n              }\n            {-  Asymmetric NIST-recommended elliptic curve key pairs (signing and verification -or- deriving shared secrets)\n                \n                 {ul\n                       {-   [ECC_NIST_P256] (secp256r1)\n                           \n                            }\n                       {-   [ECC_NIST_P384] (secp384r1)\n                           \n                            }\n                       {-   [ECC_NIST_P521] (secp521r1)\n                           \n                            }\n                       \n             }\n              }\n            {-  Other asymmetric elliptic curve key pairs (signing and verification)\n                \n                 {ul\n                       {-   [ECC_SECG_P256K1] (secp256k1), commonly used for cryptocurrencies.\n                           \n                            }\n                       \n             }\n              }\n            {-  SM2 key pairs (encryption and decryption -or- signing and verification -or- deriving shared secrets)\n                \n                 {ul\n                       {-   [SM2] (China Regions only)\n                           \n                            }\n                       \n             }\n              }\n            }\n  "];
  customer_master_key_spec: customer_master_key_spec option
    [@ocaml.doc
      "Instead, use the [KeySpec] parameter.\n\n The [KeySpec] and [CustomerMasterKeySpec] parameters work the same way. Only the names differ. We recommend that you use [KeySpec] parameter in your code. However, to avoid breaking changes, KMS supports both parameters.\n "];
  key_usage: key_usage_type option
    [@ocaml.doc
      "Determines the {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations}cryptographic operations} for which you can use the KMS key. The default value is [ENCRYPT_DECRYPT]. This parameter is optional when you are creating a symmetric encryption KMS key; otherwise, it is required. You can't change the [KeyUsage] value after the KMS key is created.\n\n Select only one valid value.\n \n  {ul\n        {-  For symmetric encryption KMS keys, omit the parameter or specify [ENCRYPT_DECRYPT].\n            \n             }\n        {-  For HMAC KMS keys (symmetric), specify [GENERATE_VERIFY_MAC].\n            \n             }\n        {-  For asymmetric KMS keys with RSA key pairs, specify [ENCRYPT_DECRYPT] or [SIGN_VERIFY].\n            \n             }\n        {-  For asymmetric KMS keys with NIST-recommended elliptic curve key pairs, specify [SIGN_VERIFY] or [KEY_AGREEMENT].\n            \n             }\n        {-  For asymmetric KMS keys with [ECC_SECG_P256K1] key pairs specify [SIGN_VERIFY].\n            \n             }\n        {-  For asymmetric KMS keys with SM2 key pairs (China Regions only), specify [ENCRYPT_DECRYPT], [SIGN_VERIFY], or [KEY_AGREEMENT].\n            \n             }\n        }\n  "];
  description: string option
    [@ocaml.doc
      "A description of the KMS key. Use a description that helps you decide whether the KMS key is appropriate for a task. The default value is an empty string (no description).\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    To set or change the description after the key is created, use [UpdateKeyDescription].\n    "];
  policy: string option
    [@ocaml.doc
      "The key policy to attach to the KMS key.\n\n If you provide a key policy, it must meet the following criteria:\n \n  {ul\n        {-  The key policy must allow the calling principal to make a subsequent [PutKeyPolicy] request on the KMS key. This reduces the risk that the KMS key becomes unmanageable. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#prevent-unmanageable-key}Default key policy} in the {i Key Management Service Developer Guide}. (To omit this condition, set [BypassPolicyLockoutSafetyCheck] to true.)\n            \n             }\n        {-  Each statement in the key policy must contain one or more principals. The principals in the key policy must exist and be visible to KMS. When you create a new Amazon Web Services principal, you might need to enforce a delay before including the new principal in a key policy because the new principal might not be immediately visible to KMS. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency}Changes that I make are not always immediately visible} in the {i Amazon Web Services Identity and Access Management User Guide}.\n            \n             }\n        }\n   If you do not provide a key policy, KMS attaches a default key policy to the KMS key. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default}Default key policy} in the {i Key Management Service Developer Guide}. \n   \n    The key policy size quota is 32 kilobytes (32768 bytes).\n    \n     For help writing and formatting a JSON policy document, see the {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html}IAM JSON Policy Reference} in the {i  {i Identity and Access Management User Guide} }.\n     "]}
[@@ocaml.doc ""]
type nonrec create_grant_response =
  {
  grant_id: string option
    [@ocaml.doc
      "The unique identifier for the grant.\n\n You can use the [GrantId] in a [ListGrants], [RetireGrant], or [RevokeGrant] operation.\n "];
  grant_token: string option
    [@ocaml.doc
      "The grant token.\n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "]}
[@@ocaml.doc ""]
type nonrec create_grant_request =
  {
  dry_run: bool option
    [@ocaml.doc
      "Checks if your request will succeed. [DryRun] is an optional parameter. \n\n To learn more about how to use this parameter, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/programming-dryrun.html}Testing your KMS API calls} in the {i Key Management Service Developer Guide}.\n "];
  name: string option
    [@ocaml.doc
      "A friendly name for the grant. Use this value to prevent the unintended creation of duplicate grants when retrying this request.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    When this value is absent, all [CreateGrant] requests result in a new grant with a unique [GrantId] even if all the supplied parameters are identical. This can result in unintended duplicates when you retry the [CreateGrant] request.\n    \n     When this value is present, you can retry a [CreateGrant] request with identical parameters; if the grant already exists, the original [GrantId] is returned without creating a new grant. Note that the returned grant token is unique with every [CreateGrant] request, even when a duplicate [GrantId] is returned. All grant tokens for the same grant ID can be used interchangeably.\n     "];
  grant_tokens: string list option
    [@ocaml.doc
      "A list of grant tokens. \n\n Use a grant token when your permission to call this operation comes from a new grant that has not yet achieved {i eventual consistency}. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token}Grant token} and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token}Using a grant token} in the {i Key Management Service Developer Guide}.\n "];
  constraints: grant_constraints option
    [@ocaml.doc
      "Specifies a grant constraint.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    KMS supports the [EncryptionContextEquals] and [EncryptionContextSubset] grant constraints, which allow the permissions in the grant only when the encryption context in the request matches ([EncryptionContextEquals]) or includes ([EncryptionContextSubset]) the encryption context specified in the constraint. \n    \n     The encryption context grant constraints are supported only on {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations}grant operations} that include an [EncryptionContext] parameter, such as cryptographic operations on symmetric encryption KMS keys. Grants with grant constraints can include the [DescribeKey] and [RetireGrant] operations, but the constraint doesn't apply to these operations. If a grant with a grant constraint includes the [CreateGrant] operation, the constraint requires that any grants created with the [CreateGrant] permission have an equally strict or stricter encryption context constraint.\n     \n      You cannot use an encryption context grant constraint for cryptographic operations with asymmetric KMS keys or HMAC KMS keys. Operations with these keys don't support an encryption context.\n      \n       Each constraint value can include up to 8 encryption context pairs. The encryption context value in each constraint cannot exceed 384 characters. For information about grant constraints, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints}Using grant constraints} in the {i Key Management Service Developer Guide}. For more information about encryption context, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption context} in the {i  {i Key Management Service Developer Guide} }. \n       "];
  operations: grant_operation list
    [@ocaml.doc
      "A list of operations that the grant permits. \n\n This list must include only operations that are permitted in a grant. Also, the operation must be supported on the KMS key. For example, you cannot create a grant for a symmetric encryption KMS key that allows the [Sign] operation, or a grant for an asymmetric KMS key that allows the [GenerateDataKey] operation. If you try, KMS returns a [ValidationError] exception. For details, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations}Grant operations} in the {i Key Management Service Developer Guide}.\n "];
  retiring_principal: string option
    [@ocaml.doc
      "The principal that has permission to use the [RetireGrant] operation to retire the grant. \n\n To specify the principal, use the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i  {i Identity and Access Management User Guide} }.\n \n  The grant determines the retiring principal. Other principals might have permission to retire the grant or revoke the grant. For details, see [RevokeGrant] and {{:https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete}Retiring and revoking grants} in the {i Key Management Service Developer Guide}. \n  "];
  grantee_principal: string
    [@ocaml.doc
      "The identity that gets the permissions specified in the grant.\n\n To specify the grantee principal, use the Amazon Resource Name (ARN) of an Amazon Web Services principal. Valid principals include Amazon Web Services accounts, IAM users, IAM roles, federated users, and assumed role users. For help with the ARN syntax for a principal, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns}IAM ARNs} in the {i  {i Identity and Access Management User Guide} }.\n "];
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key for the grant. The grant gives principals permission to use this KMS key.\n\n Specify the key ID or key ARN of the KMS key. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]
type nonrec incorrect_trust_anchor_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the trust anchor certificate in the request to create an CloudHSM key store is not the trust anchor certificate for the specified CloudHSM cluster.\n\n When you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr}initialize the CloudHSM cluster}, you create the trust anchor certificate and save it in the [customerCA.crt] file.\n "]
type nonrec cloud_hsm_cluster_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified CloudHSM cluster is already associated with an CloudHSM key store in the account, or it shares a backup history with an CloudHSM key store in the account. Each CloudHSM key store in the account must be associated with a different CloudHSM cluster.\n\n CloudHSM clusters that share a backup history have the same cluster certificate. To view the cluster certificate of an CloudHSM cluster, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n "]
type nonrec create_custom_key_store_response =
  {
  custom_key_store_id: string option
    [@ocaml.doc "A unique identifier for the new custom key store.\n"]}
[@@ocaml.doc ""]
type nonrec create_custom_key_store_request =
  {
  xks_proxy_connectivity: xks_proxy_connectivity_type option
    [@ocaml.doc
      "Indicates how KMS communicates with the external key store proxy. This parameter is required for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n If the external key store proxy uses a public endpoint, specify [PUBLIC_ENDPOINT]. If the external key store proxy uses a Amazon VPC endpoint service for communication with KMS, specify [VPC_ENDPOINT_SERVICE]. For help making this choice, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/plan-xks-keystore.html#choose-xks-connectivity}Choosing a connectivity option} in the {i Key Management Service Developer Guide}.\n \n  An Amazon VPC endpoint service keeps your communication with KMS in a private address space entirely within Amazon Web Services, but it requires more configuration, including establishing a Amazon VPC with multiple subnets, a VPC endpoint service, a network load balancer, and a verified private DNS name. A public endpoint is simpler to set up, but it might be slower and might not fulfill your security requirements. You might consider testing with a public endpoint, and then establishing a VPC endpoint service for production tasks. Note that this choice does not determine the location of the external key store proxy. Even if you choose a VPC endpoint service, the proxy can be hosted within the VPC or outside of Amazon Web Services such as in your corporate data center.\n  "];
  xks_proxy_authentication_credential:
    xks_proxy_authentication_credential_type option
    [@ocaml.doc
      "Specifies an authentication credential for the external key store proxy (XKS proxy). This parameter is required for all custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The [XksProxyAuthenticationCredential] has two required elements: [RawSecretAccessKey], a secret key, and [AccessKeyId], a unique identifier for the [RawSecretAccessKey]. For character requirements, see {{:kms/latest/APIReference/API_XksProxyAuthenticationCredentialType.html}XksProxyAuthenticationCredentialType}.\n \n  KMS uses this authentication credential to sign requests to the external key store proxy on your behalf. This credential is unrelated to Identity and Access Management (IAM) and Amazon Web Services credentials.\n  \n   This parameter doesn't set or change the authentication credentials on the XKS proxy. It just tells KMS the credential that you established on your external key store proxy. If you rotate your proxy authentication credential, use the [UpdateCustomKeyStore] operation to provide the new credential to KMS.\n   "];
  xks_proxy_vpc_endpoint_service_name: string option
    [@ocaml.doc
      "Specifies the name of the Amazon VPC endpoint service for interface endpoints that is used to communicate with your external key store proxy (XKS proxy). This parameter is required when the value of [CustomKeyStoreType] is [EXTERNAL_KEY_STORE] and the value of [XksProxyConnectivity] is [VPC_ENDPOINT_SERVICE].\n\n The Amazon VPC endpoint service must {{:https://docs.aws.amazon.com/kms/latest/developerguide/create-xks-keystore.html#xks-requirements}fulfill all requirements} for use with an external key store. \n \n   {b Uniqueness requirements:} \n  \n   {ul\n         {-  External key stores with [VPC_ENDPOINT_SERVICE] connectivity can share an Amazon VPC, but each external key store must have its own VPC endpoint service and private DNS name.\n             \n              }\n         }\n  "];
  xks_proxy_uri_path: string option
    [@ocaml.doc
      "Specifies the base path to the proxy APIs for this external key store. To find this value, see the documentation for your external key store proxy. This parameter is required for all custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The value must start with [/] and must end with [/kms/xks/v1] where [v1] represents the version of the KMS external key store proxy API. This path can include an optional prefix between the required elements such as \n {[\n /{i prefix}/kms/xks/v1\n ]}\n .\n \n   {b Uniqueness requirements: } \n  \n   {ul\n         {-  The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n             \n              }\n         }\n  "];
  xks_proxy_uri_endpoint: string option
    [@ocaml.doc
      "Specifies the endpoint that KMS uses to send requests to the external key store proxy (XKS proxy). This parameter is required for custom key stores with a [CustomKeyStoreType] of [EXTERNAL_KEY_STORE].\n\n The protocol must be HTTPS. KMS communicates on port 443. Do not specify the port in the [XksProxyUriEndpoint] value.\n \n  For external key stores with [XksProxyConnectivity] value of [VPC_ENDPOINT_SERVICE], specify [https://] followed by the private DNS name of the VPC endpoint service.\n  \n   For external key stores with [PUBLIC_ENDPOINT] connectivity, this endpoint must be reachable before you create the custom key store. KMS connects to the external key store proxy while creating the custom key store. For external key stores with [VPC_ENDPOINT_SERVICE] connectivity, KMS connects when you call the [ConnectCustomKeyStore] operation.\n   \n    The value of this parameter must begin with [https://]. The remainder can contain upper and lower case letters (A-Z and a-z), numbers (0-9), dots ([.]), and hyphens ([-]). Additional slashes ([/] and [\\]) are not permitted.\n    \n      {b Uniqueness requirements: } \n     \n      {ul\n            {-  The combined [XksProxyUriEndpoint] and [XksProxyUriPath] values must be unique in the Amazon Web Services account and Region.\n                \n                 }\n            {-  An external key store with [PUBLIC_ENDPOINT] connectivity cannot use the same [XksProxyUriEndpoint] value as an external key store with [VPC_ENDPOINT_SERVICE] connectivity in this Amazon Web Services Region.\n                \n                 }\n            {-  Each external key store with [VPC_ENDPOINT_SERVICE] connectivity must have its own private DNS name. The [XksProxyUriEndpoint] value for external key stores with [VPC_ENDPOINT_SERVICE] connectivity (private DNS name) must be unique in the Amazon Web Services account and Region.\n                \n                 }\n            }\n  "];
  custom_key_store_type: custom_key_store_type option
    [@ocaml.doc
      "Specifies the type of custom key store. The default value is [AWS_CLOUDHSM].\n\n For a custom key store backed by an CloudHSM cluster, omit the parameter or enter [AWS_CLOUDHSM]. For a custom key store backed by an external key manager outside of Amazon Web Services, enter [EXTERNAL_KEY_STORE]. You cannot change this property after the key store is created.\n "];
  key_store_password: string option
    [@ocaml.doc
      "Specifies the [kmsuser] password for an CloudHSM key store. This parameter is required for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the password of the {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser} [kmsuser] crypto user (CU) account} in the specified CloudHSM cluster. KMS logs into the cluster as this user to manage key material on your behalf.\n \n  The password must be a string of 7 to 32 characters. Its value is case sensitive.\n  \n   This parameter tells KMS the [kmsuser] account password; it does not change the password in the CloudHSM cluster.\n   "];
  trust_anchor_certificate: string option
    [@ocaml.doc
      "Specifies the certificate for an CloudHSM key store. This parameter is required for custom key stores with a [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the content of the trust anchor certificate for the CloudHSM cluster. This is the content of the [customerCA.crt] file that you created when you {{:https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html}initialized the cluster}.\n "];
  cloud_hsm_cluster_id: string option
    [@ocaml.doc
      "Identifies the CloudHSM cluster for an CloudHSM key store. This parameter is required for custom key stores with [CustomKeyStoreType] of [AWS_CLOUDHSM].\n\n Enter the cluster ID of any active CloudHSM cluster that is not already associated with a custom key store. To find the cluster ID, use the {{:https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html}DescribeClusters} operation.\n "];
  custom_key_store_name: string
    [@ocaml.doc
      "Specifies a friendly name for the custom key store. The name must be unique in your Amazon Web Services account and Region. This parameter is required for all custom key stores.\n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec invalid_alias_name_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified alias name is not valid.\n"]
type nonrec create_alias_request =
  {
  target_key_id: string
    [@ocaml.doc
      "Associates the alias with the specified {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer managed key}. The KMS key must be in the same Amazon Web Services Region. \n\n A valid key ID is required. If you supply a null or empty string value, this operation returns an error.\n \n  For help finding the key ID and ARN, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn}Finding the Key ID and ARN} in the {i  {i Key Management Service Developer Guide} }.\n  \n   Specify the key ID or key ARN of the KMS key.\n   \n    For example:\n    \n     {ul\n           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n               \n                }\n           }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "];
  alias_name: string
    [@ocaml.doc
      "Specifies the alias name. This value must begin with [alias/] followed by a name, such as [alias/ExampleAlias]. \n\n  Do not include confidential or sensitive information in this field. This field may be displayed in plaintext in CloudTrail logs and other output.\n  \n    The [AliasName] value must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-). The alias name cannot begin with [alias/aws/]. The [alias/aws/] prefix is reserved for {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon Web Services managed keys}.\n    "]}
[@@ocaml.doc ""]
type nonrec connect_custom_key_store_request =
  {
  custom_key_store_id: string
    [@ocaml.doc
      "Enter the key store ID of the custom key store that you want to connect. To find the ID of a custom key store, use the [DescribeCustomKeyStores] operation.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_key_deletion_response =
  {
  key_id: string option
    [@ocaml.doc
      "The Amazon Resource Name ({{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN}key ARN}) of the KMS key whose deletion is canceled.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_key_deletion_request =
  {
  key_id: string
    [@ocaml.doc
      "Identifies the KMS key whose deletion is being canceled.\n\n Specify the key ID or key ARN of the KMS key.\n \n  For example:\n  \n   {ul\n         {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         {-  Key ARN: [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n             \n              }\n         }\n   To get the key ID and key ARN for a KMS key, use [ListKeys] or [DescribeKey].\n   "]}
[@@ocaml.doc ""]