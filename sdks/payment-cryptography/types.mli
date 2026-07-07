type nonrec wrapping_key_spec =
  | RSA_OAEP_SHA_256 [@ocaml.doc ""]
  | RSA_OAEP_SHA_512 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec wrapped_key_material_format =
  | KEY_CRYPTOGRAM [@ocaml.doc ""]
  | TR31_KEY_BLOCK [@ocaml.doc ""]
  | TR34_KEY_BLOCK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec wrapped_key_cryptogram = string [@@ocaml.doc ""]

type nonrec key_arn = string [@@ocaml.doc ""]

type nonrec key_material = string [@@ocaml.doc ""]

type nonrec key_check_value = string [@@ocaml.doc ""]

type nonrec key_check_value_algorithm =
  | CMAC [@ocaml.doc ""]
  | ANSI_X9_24 [@ocaml.doc ""]
  | HMAC [@ocaml.doc ""]
  | SHA_1 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec wrapped_key = {
  key_check_value_algorithm : key_check_value_algorithm option;
      [@ocaml.doc
        "The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key \
         check value (KCV). It is used to validate the key integrity.\n\n\
        \ For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of zero, with \
         the key to be checked and retaining the 3 highest order bytes of the encrypted result. \
         For AES keys, the KCV is computed using a CMAC algorithm where the input data is 16 bytes \
         of zero and retaining the 3 highest order bytes of the encrypted result. For HMAC keys, \
         the KCV is computed using the hash selected at key creation on a zero-length message, \
         taking the leftmost 3 bytes.\n\
        \ "]
  key_check_value : key_check_value option;
      [@ocaml.doc
        "The key check value (KCV) is used to check if all parties holding a given key have the \
         same key or to detect that a key has changed.\n"]
  key_material : key_material;
      [@ocaml.doc
        "Parameter information for generating a wrapped key using TR-31 or TR-34 skey exchange \
         method.\n"]
  wrapped_key_material_format : wrapped_key_material_format;
      [@ocaml.doc "The key block format of a wrapped key.\n"]
  wrapping_key_arn : key_arn; [@ocaml.doc "The [KeyARN] of the wrapped key.\n"]
}
[@@ocaml.doc "Parameter information for generating a WrappedKeyBlock for key exchange.\n"]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was denied due to an invalid request error.\n\n\
  \ One or more parameters in your request are invalid. Check the parameter values, formats, and \
   constraints specified in the API documentation.\n\
  \ "]

type nonrec alias_name = string [@@ocaml.doc ""]

type nonrec alias = {
  key_arn : key_arn option; [@ocaml.doc "The [KeyARN] of the key associated with the alias.\n"]
  alias_name : alias_name;
      [@ocaml.doc
        "A friendly name that you can use to refer to a key. The value must begin with [alias/].\n\n\
        \  Do not include confidential or sensitive information in this field. This field may be \
         displayed in plaintext in CloudTrail logs and other output.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Contains information about an alias.\n"]

type nonrec update_alias_output = { alias : alias [@ocaml.doc "The alias name.\n"] }
[@@ocaml.doc ""]

type nonrec update_alias_input = {
  key_arn : key_arn option;
      [@ocaml.doc "The [KeyARN] for the key that you are updating or removing from the alias.\n"]
  alias_name : alias_name; [@ocaml.doc "The alias whose associated key is changing.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was denied due to request throttling.\n\n\
  \ You have exceeded the rate limits for Amazon Web Services Payment Cryptography API calls. \
   Implement exponential backoff and retry logic in your application to handle throttling \
   gracefully.\n\
  \ "]

type nonrec service_unavailable_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The service cannot complete the request.\n\n\
  \ The Amazon Web Services Payment Cryptography service is temporarily unavailable. This is \
   typically a temporary condition - retry your request after a brief delay.\n\
  \ "]

type nonrec resource_not_found_exception = {
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The identifier of the resource that was not found.\n\n\
        \ This field contains the specific resource identifier (such as a key ARN or alias name) \
         that could not be located.\n\
        \ "]
}
[@@ocaml.doc
  "The request was denied due to resource not found.\n\n\
  \ The specified key, alias, or other resource does not exist in your account or region. Verify \
   that the resource identifier is correct and that the resource exists in the expected region.\n\
  \ "]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception, or failure.\n\n\
  \ This indicates a server-side error within the Amazon Web Services Payment Cryptography \
   service. If this error persists, contact support for assistance.\n\
  \ "]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This request can cause an inconsistent state for the resource.\n\n\
  \ The requested operation conflicts with the current state of the resource. For example, \
   attempting to delete a key that is currently being used, or trying to create a resource that \
   already exists.\n\
  \ "]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You do not have sufficient access to perform this action.\n\n\
  \ This exception is thrown when the caller lacks the necessary IAM permissions to perform the \
   requested operation. Verify that your IAM policy includes the required permissions for the \
   specific Amazon Web Services Payment Cryptography action you're attempting.\n\
  \ "]

type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  tag_keys : tag_keys;
      [@ocaml.doc
        "One or more tag keys. Don't include the tag values.\n\n\
        \ If the Amazon Web Services Payment Cryptography key doesn't have the specified tag key, \
         Amazon Web Services Payment Cryptography doesn't throw an exception or return a response. \
         To confirm that the operation succeeded, use the \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource} \
         operation.\n\
        \ "]
  resource_arn : resource_arn; [@ocaml.doc "The [KeyARN] of the key whose tags are being removed.\n"]
}
[@@ocaml.doc ""]

type nonrec key_usage =
  | TR31_B0_BASE_DERIVATION_KEY [@ocaml.doc ""]
  | TR31_C0_CARD_VERIFICATION_KEY [@ocaml.doc ""]
  | TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY [@ocaml.doc ""]
  | TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION [@ocaml.doc ""]
  | TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS [@ocaml.doc ""]
  | TR31_E1_EMV_MKEY_CONFIDENTIALITY [@ocaml.doc ""]
  | TR31_E2_EMV_MKEY_INTEGRITY [@ocaml.doc ""]
  | TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS [@ocaml.doc ""]
  | TR31_E5_EMV_MKEY_CARD_PERSONALIZATION [@ocaml.doc ""]
  | TR31_E6_EMV_MKEY_OTHER [@ocaml.doc ""]
  | TR31_K0_KEY_ENCRYPTION_KEY [@ocaml.doc ""]
  | TR31_K1_KEY_BLOCK_PROTECTION_KEY [@ocaml.doc ""]
  | TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT [@ocaml.doc ""]
  | TR31_M0_ISO_16609_MAC_KEY [@ocaml.doc ""]
  | TR31_M3_ISO_9797_3_MAC_KEY [@ocaml.doc ""]
  | TR31_M1_ISO_9797_1_MAC_KEY [@ocaml.doc ""]
  | TR31_M6_ISO_9797_5_CMAC_KEY [@ocaml.doc ""]
  | TR31_M7_HMAC_KEY [@ocaml.doc ""]
  | TR31_P0_PIN_ENCRYPTION_KEY [@ocaml.doc ""]
  | TR31_P1_PIN_GENERATION_KEY [@ocaml.doc ""]
  | TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE [@ocaml.doc ""]
  | TR31_V1_IBM3624_PIN_VERIFICATION_KEY [@ocaml.doc ""]
  | TR31_V2_VISA_PIN_VERIFICATION_KEY [@ocaml.doc ""]
  | TR31_K2_TR34_ASYMMETRIC_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_class =
  | SYMMETRIC_KEY [@ocaml.doc ""]
  | ASYMMETRIC_KEY_PAIR [@ocaml.doc ""]
  | PRIVATE_KEY [@ocaml.doc ""]
  | PUBLIC_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_algorithm =
  | TDES_2KEY [@ocaml.doc ""]
  | TDES_3KEY [@ocaml.doc ""]
  | AES_128 [@ocaml.doc ""]
  | AES_192 [@ocaml.doc ""]
  | AES_256 [@ocaml.doc ""]
  | HMAC_SHA256 [@ocaml.doc ""]
  | HMAC_SHA384 [@ocaml.doc ""]
  | HMAC_SHA512 [@ocaml.doc ""]
  | HMAC_SHA224 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | ECC_NIST_P256 [@ocaml.doc ""]
  | ECC_NIST_P384 [@ocaml.doc ""]
  | ECC_NIST_P521 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_modes_of_use = {
  no_restrictions : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key has no \
         special restrictions other than the restrictions implied by [KeyUsage].\n"]
  derive_key : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to derive new keys.\n"]
  verify : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to verify signatures.\n"]
  sign : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         for signing.\n"]
  generate : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to generate and verify other card and PIN verification keys.\n"]
  unwrap : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to unwrap other keys.\n"]
  wrap : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to wrap other keys.\n"]
  decrypt : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to decrypt data.\n"]
  encrypt : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Speci\239\172\129es whether an Amazon Web Services Payment Cryptography key can be used \
         to encrypt data.\n"]
}
[@@ocaml.doc
  "The list of cryptographic operations that you can perform using the key. The modes of use are \
   de\239\172\129ned in section A.5.3 of the TR-31 spec.\n"]

type nonrec key_attributes = {
  key_modes_of_use : key_modes_of_use;
      [@ocaml.doc "The list of cryptographic operations that you can perform using the key.\n"]
  key_algorithm : key_algorithm;
      [@ocaml.doc
        "The key algorithm to be use during creation of an Amazon Web Services Payment \
         Cryptography key.\n\n\
        \ For symmetric keys, Amazon Web Services Payment Cryptography supports [AES] and [TDES] \
         algorithms. For asymmetric keys, Amazon Web Services Payment Cryptography supports [RSA] \
         and [ECC_NIST] algorithms.\n\
        \ "]
  key_class : key_class;
      [@ocaml.doc
        "The type of Amazon Web Services Payment Cryptography key to create, which determines the \
         classi\239\172\129cation of the cryptographic method and whether Amazon Web Services \
         Payment Cryptography key contains a symmetric key or an asymmetric key pair.\n"]
  key_usage : key_usage;
      [@ocaml.doc
        "The cryptographic usage of an Amazon Web Services Payment Cryptography key as \
         de\239\172\129ned in section A.5.2 of the TR-31 spec.\n"]
}
[@@ocaml.doc
  "The role of the key, the algorithm it supports, and the cryptographic operations allowed with \
   the key. This data is immutable after the key is created.\n"]

type nonrec certificate_type = string [@@ocaml.doc ""]

type nonrec key_arn_or_key_alias_type = string [@@ocaml.doc ""]

type nonrec trusted_certificate_public_key = {
  certificate_authority_public_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the root public key certificate or certificate chain that signs the \
         trusted public key certificate import.\n"]
  public_key_certificate : certificate_type;
      [@ocaml.doc "Parameter information for trusted public key certificate import.\n"]
  key_attributes : key_attributes;
      [@ocaml.doc
        "The role of the key, the algorithm it supports, and the cryptographic operations allowed \
         with the key. This data is immutable after a trusted public key is imported.\n"]
}
[@@ocaml.doc "Parameter information for trusted public key certificate import.\n"]

type nonrec tr34_wrapped_key_block = string [@@ocaml.doc ""]

type nonrec tr34_key_block_format = X9_TR34_2012 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec tr31_wrapped_key_block = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
}
[@@ocaml.doc "A structure that contains information about a tag.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  tags : tags;
      [@ocaml.doc
        "One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an \
         empty (null) string. You can't have more than one tag on an Amazon Web Services Payment \
         Cryptography key with the same tag key. If you specify an existing tag key with a \
         different tag value, Amazon Web Services Payment Cryptography replaces the current tag \
         value with the new one.\n\n\
        \  Don't include personal, confidential or sensitive information in this field. This field \
         may be displayed in plaintext in CloudTrail logs and other output.\n\
        \  \n\
        \    To use this parameter, you must have \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html}TagResource} \
         permission in an IAM policy.\n\
        \    \n\
        \      Don't include personal, confidential or sensitive information in this field. This \
         field may be displayed in plaintext in CloudTrail logs and other output.\n\
        \      \n\
        \       "]
  resource_arn : resource_arn; [@ocaml.doc "The [KeyARN] of the key whose tags are being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This request would cause a service quota to be exceeded.\n\n\
  \ You have reached the maximum number of keys, aliases, or other resources allowed in your \
   account. Review your current usage and consider deleting unused resources or requesting a quota \
   increase.\n\
  \ "]

type nonrec symmetric_key_algorithm =
  | HMAC_SHA224 [@ocaml.doc ""]
  | HMAC_SHA512 [@ocaml.doc ""]
  | HMAC_SHA384 [@ocaml.doc ""]
  | HMAC_SHA256 [@ocaml.doc ""]
  | AES_256 [@ocaml.doc ""]
  | AES_192 [@ocaml.doc ""]
  | AES_128 [@ocaml.doc ""]
  | TDES_3KEY [@ocaml.doc ""]
  | TDES_2KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_state =
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_COMPLETE [@ocaml.doc ""]
  | DELETE_PENDING [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_origin = EXTERNAL [@ocaml.doc ""] | AWS_PAYMENT_CRYPTOGRAPHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec derive_key_usage =
  | TR31_B0_BASE_DERIVATION_KEY [@ocaml.doc ""]
  | TR31_C0_CARD_VERIFICATION_KEY [@ocaml.doc ""]
  | TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY [@ocaml.doc ""]
  | TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS [@ocaml.doc ""]
  | TR31_E1_EMV_MKEY_CONFIDENTIALITY [@ocaml.doc ""]
  | TR31_E2_EMV_MKEY_INTEGRITY [@ocaml.doc ""]
  | TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS [@ocaml.doc ""]
  | TR31_E5_EMV_MKEY_CARD_PERSONALIZATION [@ocaml.doc ""]
  | TR31_E6_EMV_MKEY_OTHER [@ocaml.doc ""]
  | TR31_K0_KEY_ENCRYPTION_KEY [@ocaml.doc ""]
  | TR31_K1_KEY_BLOCK_PROTECTION_KEY [@ocaml.doc ""]
  | TR31_M3_ISO_9797_3_MAC_KEY [@ocaml.doc ""]
  | TR31_M1_ISO_9797_1_MAC_KEY [@ocaml.doc ""]
  | TR31_M6_ISO_9797_5_CMAC_KEY [@ocaml.doc ""]
  | TR31_M7_HMAC_KEY [@ocaml.doc ""]
  | TR31_P0_PIN_ENCRYPTION_KEY [@ocaml.doc ""]
  | TR31_P1_PIN_GENERATION_KEY [@ocaml.doc ""]
  | TR31_V1_IBM3624_PIN_VERIFICATION_KEY [@ocaml.doc ""]
  | TR31_V2_VISA_PIN_VERIFICATION_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec multi_region_key_type = PRIMARY [@ocaml.doc ""] | REPLICA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec key_replication_state =
  | IN_PROGRESS [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SYNCHRONIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replication_status_type = {
  status_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A message that provides additional information about the current replication status of \
         the key.\n\n\
        \ This field contains details about any issues or progress updates related to key \
         replication operations. It may include information about replication failures, \
         synchronization status, or other operational details.\n\
        \ "]
  status : key_replication_state;
      [@ocaml.doc
        "The current status of key replication in this Amazon Web Services Region.\n\n\
        \ This field indicates whether the key replication is in progress, completed successfully, \
         or has encountered an error. Possible values include states such as [SYNCRHONIZED], \
         [IN_PROGRESS], [DELETE_IN_PROGRESS], or [FAILED]. This provides visibility into the \
         replication process for monitoring and troubleshooting purposes.\n\
        \ "]
}
[@@ocaml.doc
  "Represents the replication status information for a key in a replication region for \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
   key replication}.\n\n\
  \ This structure contains details about the current state of key replication, including any \
   status messages and operational information about the replication process.\n\
  \ "]

type nonrec replication_status = (region * replication_status_type) list [@@ocaml.doc ""]

type nonrec mpa_session_arn = string [@@ocaml.doc ""]

type nonrec session_status =
  | PENDING [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mpa_status_message = string [@@ocaml.doc ""]

type nonrec mpa_status = {
  status_message : mpa_status_message option;
      [@ocaml.doc "The message providing additional information about the MPA session status.\n"]
  initiation_date : timestamp;
      [@ocaml.doc "The date and time when the MPA session was initiated.\n"]
  status : session_status; [@ocaml.doc "The current status of the MPA session.\n"]
  mpa_session_arn : mpa_session_arn; [@ocaml.doc "The ARN of the MPA session.\n"]
}
[@@ocaml.doc "The status of an MPA session.\n"]

type nonrec key = {
  mpa_status : mpa_status option;
      [@ocaml.doc "The Multi-Party Approval (MPA) status for the key, if applicable.\n"]
  using_default_replication_regions : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether this key is using the account's default replication regions \
         configuration for \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
         key replication}.\n\n\
        \ When set to [true], the key automatically replicates to the regions specified in the \
         account's default replication settings. When set to [false], the key has a custom \
         replication configuration that overrides the account defaults.\n\
        \ "]
  replication_status : replication_status option;
      [@ocaml.doc
        "Information about the replication status of the key across different Amazon Web Services \
         Regions.\n\n\
        \ This field provides details about the current state of key replication, including any \
         status messages or operational information. It helps track the progress and health of key \
         replication operations.\n\
        \ "]
  primary_region : region option; [@ocaml.doc ""]
  multi_region_key_type : multi_region_key_type option;
      [@ocaml.doc
        "Indicates whether this key is a Multi-Region key and its role in the Multi-Region key \
         hierarchy.\n\n\
        \ Multi-Region replication keys allow the same key material to be used across multiple \
         Amazon Web Services Regions. This field specifies whether the key is a Primary Region key \
         (PRK) (which can be replicated to other Amazon Web Services Regions) or a Replica Region \
         key (RRK) (which is a copy of a PRK in another Region). For more information, see \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
         key replication}.\n\
        \ "]
  derive_key_usage : derive_key_usage option;
      [@ocaml.doc
        "The cryptographic usage of an ECDH derived key as de\239\172\129ned in section A.5.2 of \
         the TR-31 spec.\n"]
  delete_timestamp : timestamp option;
      [@ocaml.doc
        "The date and time after which Amazon Web Services Payment Cryptography will delete the \
         key. This value is present only when when the [KeyState] is [DELETE_COMPLETE] and the \
         Amazon Web Services Payment Cryptography key is deleted.\n"]
  delete_pending_timestamp : timestamp option;
      [@ocaml.doc
        "The date and time after which Amazon Web Services Payment Cryptography will delete the \
         key. This value is present only when [KeyState] is [DELETE_PENDING] and the key is \
         scheduled for deletion.\n"]
  usage_stop_timestamp : timestamp option;
      [@ocaml.doc
        "The date and time after which Amazon Web Services Payment Cryptography will stop using \
         the key material for cryptographic operations.\n"]
  usage_start_timestamp : timestamp option;
      [@ocaml.doc
        "The date and time after which Amazon Web Services Payment Cryptography will start using \
         the key material for cryptographic operations.\n"]
  create_timestamp : timestamp; [@ocaml.doc "The date and time when the key was created.\n"]
  key_origin : key_origin;
      [@ocaml.doc
        "The source of the key material. For keys created within Amazon Web Services Payment \
         Cryptography, the value is [AWS_PAYMENT_CRYPTOGRAPHY]. For keys imported into Amazon Web \
         Services Payment Cryptography, the value is [EXTERNAL].\n"]
  key_state : key_state; [@ocaml.doc "The state of key that is being created or deleted.\n"]
  exportable : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Specifies whether the key is exportable. This data is immutable after the key is created.\n"]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Specifies whether the key is enabled. \n"]
  key_check_value_algorithm : key_check_value_algorithm;
      [@ocaml.doc
        "The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key \
         check value (KCV). It is used to validate the key integrity.\n\n\
        \ For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of zero, with \
         the key to be checked and retaining the 3 highest order bytes of the encrypted result. \
         For AES keys, the KCV is computed using a CMAC algorithm where the input data is 16 bytes \
         of zero and retaining the 3 highest order bytes of the encrypted result. For HMAC keys, \
         the KCV is computed using the hash selected at key creation on a zero-length message, \
         taking the leftmost 3 bytes.\n\
        \ "]
  key_check_value : key_check_value;
      [@ocaml.doc
        "The key check value (KCV) is used to check if all parties holding a given key have the \
         same key or to detect that a key has changed.\n"]
  key_attributes : key_attributes;
      [@ocaml.doc
        "The role of the key, the algorithm it supports, and the cryptographic operations allowed \
         with the key. This data is immutable after the key is created.\n"]
  key_arn : key_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the key.\n"]
}
[@@ocaml.doc "Metadata about an Amazon Web Services Payment Cryptography key.\n"]

type nonrec stop_key_usage_output = { key : key [@ocaml.doc "The [KeyARN] of the key.\n"] }
[@@ocaml.doc ""]

type nonrec stop_key_usage_input = {
  key_identifier : key_arn_or_key_alias_type; [@ocaml.doc "The [KeyArn] of the key.\n"]
}
[@@ocaml.doc ""]

type nonrec start_key_usage_output = {
  key : key;
      [@ocaml.doc
        "The [KeyARN] of the Amazon Web Services Payment Cryptography key activated for use.\n"]
}
[@@ocaml.doc ""]

type nonrec start_key_usage_input = {
  key_identifier : key_arn_or_key_alias_type; [@ocaml.doc "The [KeyArn] of the key.\n"]
}
[@@ocaml.doc ""]

type nonrec signing_algorithm_type =
  | SHA224 [@ocaml.doc ""]
  | SHA256 [@ocaml.doc ""]
  | SHA384 [@ocaml.doc ""]
  | SHA512 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec shared_information = string [@@ocaml.doc ""]

type nonrec root_certificate_public_key = {
  public_key_certificate : certificate_type;
      [@ocaml.doc "Parameter information for root public key certificate import.\n"]
  key_attributes : key_attributes;
      [@ocaml.doc
        "The role of the key, the algorithm it supports, and the cryptographic operations allowed \
         with the key. This data is immutable after the root public key is imported.\n"]
}
[@@ocaml.doc "Parameter information for root public key certificate import.\n"]

type nonrec restore_key_output = {
  key : key;
      [@ocaml.doc
        "The key material of the restored key. The [KeyState] will change to [CREATE_COMPLETE] and \
         value for [DeletePendingTimestamp] gets removed. \n"]
}
[@@ocaml.doc ""]

type nonrec restore_key_input = {
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the key to be restored within Amazon Web Services Payment Cryptography.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_policy = string [@@ocaml.doc ""]

type nonrec remove_key_replication_regions_output = {
  key : key;
      [@ocaml.doc
        "The updated key metadata after removing the replication regions.\n\n\
        \ This reflects the current state of the key and its updated replication configuration.\n\
        \ "]
}
[@@ocaml.doc "Output from removing replication regions from a key.\n"]

type nonrec regions = region list [@@ocaml.doc ""]

type nonrec remove_key_replication_regions_input = {
  replication_regions : regions;
      [@ocaml.doc
        "The list of Amazon Web Services Regions to remove from the key's replication \
         configuration.\n\n\
        \ The key will no longer be available for cryptographic operations in these regions after \
         removal. Ensure no active operations depend on the key in these regions before removal.\n\
        \ "]
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The key identifier (ARN or alias) of the key from which to remove replication regions.\n\n\
        \ This key must exist and have replication enabled in the specified regions.\n\
        \ "]
}
[@@ocaml.doc "Input parameters for removing replication regions from a specific key.\n"]

type nonrec put_resource_policy_output = {
  policy : resource_policy; [@ocaml.doc "The resource-based policy that was attached to the key.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc "The [KeyARN] of the key that the resource-based policy was attached to.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_input = {
  policy : resource_policy;
      [@ocaml.doc "The resource-based policy to attach to the key, in JSON format.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc "The [KeyARN] of the key to attach the resource-based policy to.\n"]
}
[@@ocaml.doc ""]

type nonrec public_policy_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The resource-based policy would grant public access to the key.\n\n\
  \ Modify the policy to restrict access to specific principals and resubmit the request.\n\
  \ "]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of results, or an empty or null value if there are no more \
         results.\n"]
  tags : tags;
      [@ocaml.doc
        "The list of tags associated with a [ResourceArn]. Each tag will list the key-value pair \
         contained within that tag.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  max_results : max_results option;
      [@ocaml.doc
        "Use this parameter to specify the maximum number of items to return. When this value is \
         present, Amazon Web Services Payment Cryptography does not return more than the specified \
         number of items, but it might return fewer.\n\n\
        \ This value is optional. If you include a value, it must be between 1 and 100, inclusive. \
         If you do not include a value, it defaults to 50.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter in a subsequent request after you receive a response with truncated \
         results. Set it to the value of [NextToken] from the truncated response you just received.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The [KeyARN] of the key whose tags you are getting.\n"]
}
[@@ocaml.doc ""]

type nonrec import_key_output = {
  key : key;
      [@ocaml.doc
        "The [KeyARN] of the key material imported within Amazon Web Services Payment Cryptography.\n"]
}
[@@ocaml.doc ""]

type nonrec import_tr31_key_block = {
  wrapped_key_block : tr31_wrapped_key_block;
      [@ocaml.doc "The TR-31 wrapped key block to import.\n"]
  wrapping_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the key that will decrypt or unwrap a TR-31 key block during import.\n"]
}
[@@ocaml.doc
  "Parameter information for key material import using symmetric TR-31 key exchange method.\n"]

type nonrec import_token_id = string [@@ocaml.doc ""]

type nonrec even_hex_length_between16_and32 = string [@@ocaml.doc ""]

type nonrec import_tr34_key_block = {
  random_nonce : even_hex_length_between16_and32 option;
      [@ocaml.doc
        "A random number value that is unique to the TR-34 key block generated using 2 pass. The \
         operation will fail, if a random nonce value is not provided for a TR-34 key block \
         generated using 2 pass.\n"]
  key_block_format : tr34_key_block_format;
      [@ocaml.doc
        "The key block format to use during key import. The only value allowed is [X9_TR34_2012].\n"]
  wrapped_key_block : tr34_wrapped_key_block;
      [@ocaml.doc "The TR-34 wrapped key block to import.\n"]
  wrapping_key_certificate : certificate_type option;
      [@ocaml.doc "The certificate used to wrap the TR-34 key block.\n"]
  wrapping_key_identifier : key_arn_or_key_alias_type option;
      [@ocaml.doc "Key Identifier used for unwrapping the import key\n"]
  import_token : import_token_id option;
      [@ocaml.doc
        "The import token that initiates key import using the asymmetric TR-34 key exchange method \
         into Amazon Web Services Payment Cryptography. It expires after 30 days. You can use the \
         same import token to import multiple keys to the same service account.\n"]
  signing_key_certificate : certificate_type;
      [@ocaml.doc
        "The public key component in PEM certificate format of the private key that signs the KDH \
         TR-34 WrappedKeyBlock.\n"]
  certificate_authority_public_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the certificate chain that signs the signing key certificate during TR-34 \
         key import.\n"]
}
[@@ocaml.doc
  "Parameter information for key material import using the asymmetric TR-34 key exchange method.\n"]

type nonrec import_key_cryptogram = {
  wrapping_spec : wrapping_key_spec option;
      [@ocaml.doc "The wrapping spec for the wrapped key cryptogram.\n"]
  import_token : import_token_id;
      [@ocaml.doc
        "The import token that initiates key import using the asymmetric RSA wrap and unwrap key \
         exchange method into AWS Payment Cryptography. It expires after 30 days. You can use the \
         same import token to import multiple keys to the same service account.\n"]
  wrapped_key_cryptogram : wrapped_key_cryptogram;
      [@ocaml.doc "The RSA wrapped key cryptogram under import.\n"]
  exportable : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Specifies whether the key is exportable from the service.\n"]
  key_attributes : key_attributes; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Parameter information for key material import using asymmetric RSA wrap and unwrap key exchange \
   method.\n"]

type nonrec key_derivation_function = ANSI_X963 [@ocaml.doc ""] | NIST_SP800 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_derivation_hash_algorithm =
  | SHA_512 [@ocaml.doc ""]
  | SHA_384 [@ocaml.doc ""]
  | SHA_256 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec diffie_hellman_derivation_data =
  | SharedInformation of shared_information
      [@ocaml.doc
        "A string containing information that binds the ECDH derived key to the two parties \
         involved or to the context of the key.\n\n\
        \ It may include details like identities of the two parties deriving the key, context of \
         the operation, session IDs, and optionally a nonce. It must not contain zero bytes. It is \
         not recommended to reuse shared information for multiple ECDH key derivations, as it \
         could result in derived key material being the same across different derivations.\n\
        \ "]
[@@ocaml.doc "The shared information used when deriving a key using ECDH.\n"]

type nonrec import_diffie_hellman_tr31_key_block = {
  wrapped_key_block : tr31_wrapped_key_block; [@ocaml.doc "The ECDH wrapped key block to import.\n"]
  derivation_data : diffie_hellman_derivation_data;
      [@ocaml.doc "The shared information used when deriving a key using ECDH.\n"]
  key_derivation_hash_algorithm : key_derivation_hash_algorithm;
      [@ocaml.doc "The hash type to use when deriving a key using ECDH.\n"]
  key_derivation_function : key_derivation_function;
      [@ocaml.doc "The key derivation function to use when deriving a key using ECDH.\n"]
  derive_key_algorithm : symmetric_key_algorithm;
      [@ocaml.doc "The key algorithm of the shared derived ECDH key.\n"]
  public_key_certificate : certificate_type;
      [@ocaml.doc
        "The public key certificate of the client's receiving ECC key pair, in PEM format (base64 \
         encoded), to use for ECDH key derivation.\n"]
  certificate_authority_public_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [keyARN] of the CA that signed the [PublicKeyCertificate] for the client's receiving \
         ECC key pair.\n"]
  private_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [keyARN] of the asymmetric ECC key created within Amazon Web Services Payment \
         Cryptography.\n"]
}
[@@ocaml.doc
  "Key derivation parameter information for key material import using asymmetric ECDH key exchange \
   method.\n"]

type nonrec as2805_key_variant =
  | DATA_ENCRYPTION_KEY_VARIANT_22 [@ocaml.doc ""]
  | MESSAGE_AUTHENTICATION_KEY_VARIANT_24 [@ocaml.doc ""]
  | PIN_ENCRYPTION_KEY_VARIANT_28 [@ocaml.doc ""]
  | TERMINAL_MAJOR_KEY_VARIANT_00 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_as2805_key_cryptogram = {
  wrapped_key_cryptogram : wrapped_key_cryptogram;
      [@ocaml.doc "The wrapped key cryptogram under import.\n"]
  wrapping_key_identifier : key_arn_or_key_alias_type; [@ocaml.doc ""]
  exportable : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Specified whether the key is exportable. This data is immutable after the key is imported.\n"]
  key_algorithm : key_algorithm; [@ocaml.doc "The key algorithm of the key under import.\n"]
  key_modes_of_use : key_modes_of_use; [@ocaml.doc ""]
  as2805_key_variant : as2805_key_variant;
      [@ocaml.doc "The cryptographic usage of the key under import.\n"]
}
[@@ocaml.doc "Parameter information for key material import using AS2805 key cryptogram format.\n"]

type nonrec import_key_material =
  | As2805KeyCryptogram of import_as2805_key_cryptogram
      [@ocaml.doc
        "Parameter information for key material import using AS2805 key cryptogram format.\n"]
  | DiffieHellmanTr31KeyBlock of import_diffie_hellman_tr31_key_block
      [@ocaml.doc
        "Key derivation parameter information for key material import using asymmetric ECDH key \
         exchange method.\n"]
  | KeyCryptogram of import_key_cryptogram
      [@ocaml.doc
        "Parameter information for key material import using asymmetric RSA wrap and unwrap key \
         exchange method.\n"]
  | Tr34KeyBlock of import_tr34_key_block
      [@ocaml.doc
        "Parameter information for key material import using the asymmetric TR-34 key exchange \
         method.\n"]
  | Tr31KeyBlock of import_tr31_key_block
      [@ocaml.doc
        "Parameter information for key material import using symmetric TR-31 key exchange method.\n"]
  | TrustedCertificatePublicKey of trusted_certificate_public_key
      [@ocaml.doc "Parameter information for trusted public key certificate import.\n"]
  | RootCertificatePublicKey of root_certificate_public_key
      [@ocaml.doc "Parameter information for root public key certificate import.\n"]
[@@ocaml.doc
  "Parameter information for key material import into Amazon Web Services Payment Cryptography \
   using TR-31 or TR-34 or RSA wrap and unwrap key exchange method.\n"]

type nonrec mpa_requester_comment = string [@@ocaml.doc ""]

type nonrec import_key_input = {
  requester_comment : mpa_requester_comment option;
      [@ocaml.doc
        "The comment from the requester explaining the reason for the import.\n\n\
        \  Don't include personal, confidential or sensitive information in this field. This field \
         may be displayed in plaintext in CloudTrail logs and other output.\n\
        \  \n\
        \   "]
  replication_regions : regions option; [@ocaml.doc ""]
  tags : tags option;
      [@ocaml.doc
        "Assigns one or more tags to the Amazon Web Services Payment Cryptography key. Use this \
         parameter to tag a key when it is imported. To tag an existing Amazon Web Services \
         Payment Cryptography key, use the \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html}TagResource} \
         operation.\n\n\
        \ Each tag consists of a tag key and a tag value. Both the tag key and the tag value are \
         required, but the tag value can be an empty (null) string. You can't have more than one \
         tag on an Amazon Web Services Payment Cryptography key with the same tag key. If you \
         specify an existing tag key with a different tag value, Amazon Web Services Payment \
         Cryptography replaces the current tag value with the specified one.\n\
        \ \n\
        \   Don't include personal, confidential or sensitive information in this field. This \
         field may be displayed in plaintext in CloudTrail logs and other output.\n\
        \   \n\
        \      Tagging or untagging an Amazon Web Services Payment Cryptography key can allow or \
         deny permission to the key.\n\
        \      \n\
        \       "]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Specifies whether import key is enabled.\n"]
  key_check_value_algorithm : key_check_value_algorithm option;
      [@ocaml.doc
        "The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key \
         check value (KCV). It is used to validate the key integrity.\n\n\
        \ For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of zero, with \
         the key to be checked and retaining the 3 highest order bytes of the encrypted result. \
         For AES keys, the KCV is computed using a CMAC algorithm where the input data is 16 bytes \
         of zero and retaining the 3 highest order bytes of the encrypted result. For HMAC keys, \
         the KCV is computed using the hash selected at key creation on a zero-length message, \
         taking the leftmost 3 bytes.\n\
        \ "]
  key_material : import_key_material;
      [@ocaml.doc
        "The key or public key certificate type to use during key material import, for example \
         TR-34 or RootCertificatePublicKey.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_output = {
  policy : resource_policy;
      [@ocaml.doc "The resource-based policy attached to the key, in JSON format.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The [KeyARN] of the key.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_input = {
  resource_arn : resource_arn;
      [@ocaml.doc "The [KeyARN] of the key whose resource-based policy you want to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_public_key_certificate_output = {
  key_certificate_chain : certificate_type;
      [@ocaml.doc
        "The root certificate authority (CA) that signed the public key certificate in PEM format \
         (base64 encoded) of the asymmetric key pair.\n"]
  key_certificate : certificate_type;
      [@ocaml.doc
        "The public key component of the asymmetric key pair in a certificate PEM format (base64 \
         encoded). It is signed by the root certificate authority (CA). The certificate is valid \
         for 90 days from the time it is issued. The service returns a cached certificate if one \
         exists with at least 30 days of remaining validity. Otherwise, a new 90-day certificate \
         is issued.\n"]
}
[@@ocaml.doc ""]

type nonrec get_public_key_certificate_input = {
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc "The [KeyARN] of the asymmetric key pair.\n"]
}
[@@ocaml.doc ""]

type nonrec get_parameters_for_import_output = {
  parameters_valid_until_timestamp : timestamp;
      [@ocaml.doc "The validity period of the import token.\n"]
  import_token : import_token_id;
      [@ocaml.doc
        "The import token to initiate key import into Amazon Web Services Payment Cryptography. \
         The import token expires after 30 days. You can use the same import token to import \
         multiple keys to the same service account.\n"]
  wrapping_key_algorithm : key_algorithm;
      [@ocaml.doc
        "The algorithm of the wrapping key for use within TR-34 WrappedKeyBlock or RSA \
         WrappedKeyCryptogram.\n"]
  wrapping_key_certificate_chain : certificate_type;
      [@ocaml.doc
        "The Amazon Web Services Payment Cryptography root certificate authority (CA) that signed \
         the wrapping key certificate in PEM format (base64 encoded).\n"]
  wrapping_key_certificate : certificate_type;
      [@ocaml.doc
        "The wrapping key certificate in PEM format (base64 encoded) of the wrapping key for use \
         within the TR-34 key block. The certificate expires in 30 days.\n"]
}
[@@ocaml.doc ""]

type nonrec key_material_type =
  | TR34_KEY_BLOCK [@ocaml.doc ""]
  | TR31_KEY_BLOCK [@ocaml.doc ""]
  | ROOT_PUBLIC_KEY_CERTIFICATE [@ocaml.doc ""]
  | TRUSTED_PUBLIC_KEY_CERTIFICATE [@ocaml.doc ""]
  | KEY_CRYPTOGRAM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_parameters_for_import_input = {
  reuse_last_generated_token : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to reuse the existing import token and wrapping key certificate. If set \
         to [true] and a valid import token exists for the same key material type and wrapping key \
         algorithm with at least 7 days of remaining validity, the existing token and wrapping key \
         certificate are returned. Otherwise, a new import token and wrapping key certificate are \
         generated. The default value is [false], which generates a new import token and wrapping \
         key certificate on every call.\n"]
  wrapping_key_algorithm : key_algorithm;
      [@ocaml.doc
        "The wrapping key algorithm to generate a wrapping key certificate. This certificate wraps \
         the key under import.\n\n\
        \ At this time, [RSA_2048] is the allowed algorithm for TR-34 WrappedKeyBlock import. \
         Additionally, [RSA_2048], [RSA_3072], [RSA_4096] are the allowed algorithms for RSA \
         WrappedKeyCryptogram import.\n\
        \ "]
  key_material_type : key_material_type;
      [@ocaml.doc
        "The method to use for key material import. Import token is only required for TR-34 \
         WrappedKeyBlock ([TR34_KEY_BLOCK]) and RSA WrappedKeyCryptogram ([KEY_CRYPTOGRAM]).\n\n\
        \ Import token is not required for TR-31, root public key cerificate or trusted public key \
         certificate.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_token_id = string [@@ocaml.doc ""]

type nonrec get_parameters_for_export_output = {
  parameters_valid_until_timestamp : timestamp;
      [@ocaml.doc "The validity period of the export token.\n"]
  export_token : export_token_id;
      [@ocaml.doc
        "The export token to initiate key export from Amazon Web Services Payment Cryptography. \
         The export token expires after 30 days. You can use the same export token to export \
         multiple keys from the same service account.\n"]
  signing_key_algorithm : key_algorithm;
      [@ocaml.doc
        "The algorithm of the signing key certificate for use in TR-34 key block generation. \
         [RSA_2048] is the only signing key algorithm allowed.\n"]
  signing_key_certificate_chain : certificate_type;
      [@ocaml.doc
        "The root certificate authority (CA) that signed the signing key certificate in PEM format \
         (base64 encoded).\n"]
  signing_key_certificate : certificate_type;
      [@ocaml.doc
        "The signing key certificate in PEM format (base64 encoded) of the public key for \
         signature within the TR-34 key block. The certificate expires after 30 days.\n"]
}
[@@ocaml.doc ""]

type nonrec get_parameters_for_export_input = {
  reuse_last_generated_token : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to reuse the existing export token and signing key certificate. If set \
         to [true] and a valid export token exists for the same key material type and signing key \
         algorithm with at least 7 days of remaining validity, the existing token and signing key \
         certificate are returned. Otherwise, a new export token and signing key certificate are \
         generated. The default value is [false], which generates a new export token and signing \
         key certificate on every call.\n"]
  signing_key_algorithm : key_algorithm;
      [@ocaml.doc
        "The signing key algorithm to generate a signing key certificate. This certificate signs \
         the wrapped key under export within the TR-34 key block. [RSA_2048] is the only signing \
         key algorithm allowed.\n"]
  key_material_type : key_material_type;
      [@ocaml.doc
        "The key block format type (for example, TR-34 or TR-31) to use during key material \
         export. Export token is only required for a TR-34 key export, [TR34_KEY_BLOCK]. Export \
         token is not required for TR-31 key export.\n"]
}
[@@ocaml.doc ""]

type nonrec mpa_operation = IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec mpa_team_arn = string [@@ocaml.doc ""]

type nonrec association_state =
  | ACTIVE [@ocaml.doc ""]
  | UPDATE_PENDING [@ocaml.doc ""]
  | DELETE_PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mpa_team_association = {
  mpa_status : mpa_status option;
      [@ocaml.doc "The MPA session status for the association, if applicable.\n"]
  association_state : association_state; [@ocaml.doc "The state of the MPA team association.\n"]
  mpa_team_arn : mpa_team_arn; [@ocaml.doc "The ARN of the MPA team.\n"]
  action : mpa_operation; [@ocaml.doc "The protected operation associated with the MPA team.\n"]
}
[@@ocaml.doc "The details of an MPA team association with a protected operation.\n"]

type nonrec get_mpa_team_association_output = {
  mpa_team_association : mpa_team_association;
      [@ocaml.doc "The details of the MPA team association.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mpa_team_association_input = {
  action : mpa_operation;
      [@ocaml.doc
        "The protected operation whose MPA team association you want to retrieve. Currently, the \
         only supported value is [IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE].\n"]
}
[@@ocaml.doc ""]

type nonrec get_default_key_replication_regions_output = {
  enabled_replication_regions : regions;
      [@ocaml.doc
        "The list of regions where default key replication is currently enabled for the account.\n\n\
        \ New keys created in this account will automatically be replicated to these regions \
         unless explicitly configured otherwise during key creation.\n\
        \ "]
}
[@@ocaml.doc "Output containing the account's current default key replication configuration.\n"]

type nonrec get_default_key_replication_regions_input = unit [@@ocaml.doc ""]

type nonrec certificate_signing_request_type = string [@@ocaml.doc ""]

type nonrec get_certificate_signing_request_output = {
  certificate_signing_request : certificate_signing_request_type;
      [@ocaml.doc
        "The certificate signing request generated using the key pair associated with the key \
         identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec certificate_subject_type = {
  email_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The email address you provide to create the certificate signing request.\n"]
  state_or_province : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The state or province you provide to create the certificate signing request.\n"]
  country : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The country you provide to create the certificate signing request.\n"]
  city : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The city you provide to create the certificate signing request.\n"]
  organization : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The organization you provide to create the certificate signing request.\n"]
  organization_unit : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The organization unit you provide to create the certificate signing request.\n"]
  common_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name you provide to create the certificate signing request.\n"]
}
[@@ocaml.doc "The metadata used to create the certificate signing request.\n"]

type nonrec get_certificate_signing_request_input = {
  certificate_subject : certificate_subject_type;
      [@ocaml.doc "The metadata used to create the CSR.\n"]
  signing_algorithm : signing_algorithm_type;
      [@ocaml.doc "The cryptographic algorithm used to sign your CSR.\n"]
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc "Asymmetric key used for generating the certificate signing request\n"]
}
[@@ocaml.doc ""]

type nonrec export_key_output = {
  wrapped_key : wrapped_key option;
      [@ocaml.doc
        "The key material under export as a TR-34 WrappedKeyBlock or a TR-31 WrappedKeyBlock. or a \
         RSA WrappedKeyCryptogram.\n"]
}
[@@ocaml.doc ""]

type nonrec key_exportability =
  | EXPORTABLE [@ocaml.doc ""]
  | NON_EXPORTABLE [@ocaml.doc ""]
  | SENSITIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_version = string [@@ocaml.doc ""]

type nonrec optional_block_value = string [@@ocaml.doc ""]

type nonrec optional_block_id = string [@@ocaml.doc ""]

type nonrec optional_blocks = (optional_block_id * optional_block_value) list [@@ocaml.doc ""]

type nonrec key_block_headers = {
  optional_blocks : optional_blocks option;
      [@ocaml.doc
        "Parameter used to indicate the type of optional data in key block headers. Refer to \
         {{:https://webstore.ansi.org/standards/ascx9/ansix91432022}ANSI X9.143-2022} for \
         information on allowed data type for optional blocks.\n\n\
        \ Optional block character limit is 112 characters. For each optional block, 2 characters \
         are reserved for optional block ID and 2 characters reserved for optional block length. \
         More than one optional blocks can be included as long as the combined length does not \
         increase 112 characters.\n\
        \ "]
  key_version : key_version option;
      [@ocaml.doc
        "Parameter used to indicate the version of the key carried in the key block or indicate \
         the value carried in the key block is a component of a key.\n"]
  key_exportability : key_exportability option;
      [@ocaml.doc
        "Specifies subsequent exportability of the key within the key block after it is received \
         by the receiving party. It can be used to further restrict exportability of the key after \
         export from Amazon Web Services Payment Cryptography.\n\n\
        \ When set to [EXPORTABLE], the key can be subsequently exported by the receiver under a \
         KEK using TR-31 or TR-34 key block export only. When set to [NON_EXPORTABLE], the key \
         cannot be subsequently exported by the receiver. When set to [SENSITIVE], the key can be \
         exported by the receiver under a KEK using TR-31, TR-34, RSA wrap and unwrap cryptogram \
         or using a symmetric cryptogram key export method. For further information refer to \
         {{:https://webstore.ansi.org/standards/ascx9/ansix91432022}ANSI X9.143-2022}.\n\
        \ "]
  key_modes_of_use : key_modes_of_use option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Optional metadata for export associated with the key material. This data is signed but \
   transmitted in clear text.\n"]

type nonrec export_tr31_key_block = {
  key_block_headers : key_block_headers option;
      [@ocaml.doc
        "Optional metadata for export associated with the key material. This data is signed but \
         transmitted in clear text.\n"]
  wrapping_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the the wrapping key. This key encrypts or wraps the key under export for \
         TR-31 key block generation.\n"]
}
[@@ocaml.doc
  "Parameter information for key material export using symmetric TR-31 key exchange method.\n"]

type nonrec export_tr34_key_block = {
  key_block_headers : key_block_headers option;
      [@ocaml.doc
        "Optional metadata for export associated with the key material. This data is signed but \
         transmitted in clear text.\n"]
  random_nonce : even_hex_length_between16_and32 option;
      [@ocaml.doc
        "A random number value that is unique to the TR-34 key block generated using 2 pass. The \
         operation will fail, if a random nonce value is not provided for a TR-34 key block \
         generated using 2 pass.\n"]
  key_block_format : tr34_key_block_format;
      [@ocaml.doc
        "The format of key block that Amazon Web Services Payment Cryptography will use during key \
         export.\n"]
  signing_key_certificate : certificate_type option;
      [@ocaml.doc "The certificate used to sign the TR-34 key block.\n"]
  signing_key_identifier : key_arn_or_key_alias_type option;
      [@ocaml.doc "Key Identifier used for signing the export key\n"]
  export_token : export_token_id option;
      [@ocaml.doc
        "The export token to initiate key export from Amazon Web Services Payment Cryptography. It \
         also contains the signing key certificate that will sign the wrapped key during TR-34 key \
         block generation. Call \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html}GetParametersForExport} \
         to receive an export token. It expires after 30 days. You can use the same export token \
         to export multiple keys from the same service account.\n"]
  wrapping_key_certificate : certificate_type;
      [@ocaml.doc
        "The [KeyARN] of the wrapping key certificate. Amazon Web Services Payment Cryptography \
         uses this certificate to wrap the key under export.\n"]
  certificate_authority_public_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the certificate chain that signs the wrapping key certificate during \
         TR-34 key export.\n"]
}
[@@ocaml.doc
  "Parameter information for key material export using the asymmetric TR-34 key exchange method.\n"]

type nonrec export_key_cryptogram = {
  wrapping_spec : wrapping_key_spec option;
      [@ocaml.doc "The wrapping spec for the key under export.\n"]
  wrapping_key_certificate : certificate_type;
      [@ocaml.doc
        "The wrapping key certificate in PEM format (base64 encoded). Amazon Web Services Payment \
         Cryptography uses this certificate to wrap the key under export.\n"]
  certificate_authority_public_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the certificate chain that signs the wrapping key certificate during RSA \
         wrap and unwrap key export.\n"]
}
[@@ocaml.doc
  "Parameter information for key material export using asymmetric RSA wrap and unwrap key exchange \
   method.\n"]

type nonrec export_diffie_hellman_tr31_key_block = {
  key_block_headers : key_block_headers option; [@ocaml.doc ""]
  derivation_data : diffie_hellman_derivation_data;
      [@ocaml.doc "The shared information used when deriving a key using ECDH.\n"]
  key_derivation_hash_algorithm : key_derivation_hash_algorithm;
      [@ocaml.doc "The hash type to use when deriving a key using ECDH.\n"]
  key_derivation_function : key_derivation_function;
      [@ocaml.doc "The key derivation function to use when deriving a key using ECDH.\n"]
  derive_key_algorithm : symmetric_key_algorithm;
      [@ocaml.doc "The key algorithm of the shared derived ECDH key.\n"]
  public_key_certificate : certificate_type;
      [@ocaml.doc
        "The public key certificate of the client's receiving ECC key pair, in PEM format (base64 \
         encoded), to use for ECDH key derivation.\n"]
  certificate_authority_public_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [keyARN] of the CA that signed the [PublicKeyCertificate] for the client's receiving \
         ECC key pair.\n"]
  private_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [keyARN] of the asymmetric ECC key created within Amazon Web Services Payment \
         Cryptography.\n"]
}
[@@ocaml.doc
  "Key derivation parameter information for key material export using asymmetric ECDH key exchange \
   method.\n"]

type nonrec export_as2805_key_cryptogram = {
  as2805_key_variant : as2805_key_variant;
      [@ocaml.doc "The cryptographic usage of the key under export.\n"]
  wrapping_key_identifier : key_arn_or_key_alias_type; [@ocaml.doc ""]
}
[@@ocaml.doc "Parameter information for key material export using AS2805 key cryptogram format.\n"]

type nonrec export_key_material =
  | As2805KeyCryptogram of export_as2805_key_cryptogram
      [@ocaml.doc
        "Parameter information for key material export using AS2805 key cryptogram format.\n"]
  | DiffieHellmanTr31KeyBlock of export_diffie_hellman_tr31_key_block
      [@ocaml.doc
        "Key derivation parameter information for key material export using asymmetric ECDH key \
         exchange method.\n"]
  | KeyCryptogram of export_key_cryptogram
      [@ocaml.doc
        "Parameter information for key material export using asymmetric RSA wrap and unwrap key \
         exchange method\n"]
  | Tr34KeyBlock of export_tr34_key_block
      [@ocaml.doc
        "Parameter information for key material export using the asymmetric TR-34 key exchange \
         method.\n"]
  | Tr31KeyBlock of export_tr31_key_block
      [@ocaml.doc
        "Parameter information for key material export using symmetric TR-31 key exchange method.\n"]
[@@ocaml.doc
  "Parameter information for key material export from Amazon Web Services Payment Cryptography \
   using TR-31 or TR-34 or RSA wrap and unwrap key exchange method.\n"]

type nonrec hex_length20_or24 = string [@@ocaml.doc ""]

type nonrec export_dukpt_initial_key = {
  key_serial_number : hex_length20_or24;
      [@ocaml.doc
        "The KSN for IPEK generation using DUKPT. \n\n\
        \ KSN must be padded before sending to Amazon Web Services Payment Cryptography. KSN hex \
         length should be 20 for a TDES_2KEY key or 24 for an AES key.\n\
        \ "]
}
[@@ocaml.doc "Parameter information for IPEK generation during export.\n"]

type nonrec export_attributes = {
  key_check_value_algorithm : key_check_value_algorithm option;
      [@ocaml.doc
        "The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key \
         check value (KCV). It is used to validate the key integrity. Specify KCV for IPEK export \
         only.\n\n\
        \ For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of zero, with \
         the key to be checked and retaining the 3 highest order bytes of the encrypted result. \
         For AES keys, the KCV is computed using a CMAC algorithm where the input data is 16 bytes \
         of zero and retaining the 3 highest order bytes of the encrypted result. For HMAC keys, \
         the KCV is computed using the hash selected at key creation on a zero-length message, \
         taking the leftmost 3 bytes.\n\
        \ "]
  export_dukpt_initial_key : export_dukpt_initial_key option;
      [@ocaml.doc "Parameter information for IPEK export.\n"]
}
[@@ocaml.doc "The attributes for IPEK generation during export.\n"]

type nonrec export_key_input = {
  export_attributes : export_attributes option;
      [@ocaml.doc "The attributes for IPEK generation during export.\n"]
  export_key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The [KeyARN] of the key under export from Amazon Web Services Payment Cryptography.\n"]
  key_material : export_key_material;
      [@ocaml.doc
        "The key block format type, for example, TR-34 or TR-31, to use during key material export.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_default_key_replication_regions_output = {
  enabled_replication_regions : regions;
      [@ocaml.doc
        "The complete list of regions where default key replication is now enabled for the \
         account.\n\n\
        \ This includes both previously enabled regions and the newly added regions from this \
         operation.\n\
        \ "]
}
[@@ocaml.doc "Output from enabling default key replication regions for the account.\n"]

type nonrec enable_default_key_replication_regions_input = {
  replication_regions : regions;
      [@ocaml.doc
        "The list of Amazon Web Services Regions to enable as default replication regions for the \
         Amazon Web Services account for \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
         key replication}.\n\n\
        \ New keys created in this account will automatically be replicated to these regions \
         unless explicitly overridden during key creation.\n\
        \ "]
}
[@@ocaml.doc "Input parameters for enabling default key replication regions for the account.\n"]

type nonrec disassociate_mpa_team_output = {
  mpa_team_association : mpa_team_association;
      [@ocaml.doc "The details of the MPA team association.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_mpa_team_input = {
  requester_comment : mpa_requester_comment option;
      [@ocaml.doc
        "The comment from the requester explaining the reason for the disassociation.\n\n\
        \  Don't include personal, confidential or sensitive information in this field. This field \
         may be displayed in plaintext in CloudTrail logs and other output.\n\
        \  \n\
        \   "]
  action : mpa_operation;
      [@ocaml.doc
        "The protected operation to disassociate from the MPA team. Currently, the only supported \
         value is [IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE].\n"]
}
[@@ocaml.doc ""]

type nonrec disable_default_key_replication_regions_output = {
  enabled_replication_regions : regions;
      [@ocaml.doc
        "The remaining list of regions where default key replication is still enabled for the \
         account.\n\n\
        \ This reflects the account's default replication configuration after removing the \
         specified regions.\n\
        \ "]
}
[@@ocaml.doc "Output from disabling default key replication regions for the account.\n"]

type nonrec disable_default_key_replication_regions_input = {
  replication_regions : regions;
      [@ocaml.doc
        "The list of Amazon Web Services Regions to remove from the account's default replication \
         regions.\n\n\
        \ New keys created after this operation will not automatically be replicated to these \
         regions, though existing keys with replication to these regions will be unaffected.\n\
        \ "]
}
[@@ocaml.doc "Input parameters for disabling default key replication regions for the account.\n"]

type nonrec delete_resource_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_resource_policy_input = {
  resource_arn : resource_arn;
      [@ocaml.doc "The [KeyARN] of the key whose resource-based policy you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_mpa_team_output = {
  mpa_team_association : mpa_team_association;
      [@ocaml.doc "The details of the MPA team association.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_mpa_team_input = {
  requester_comment : mpa_requester_comment option;
      [@ocaml.doc
        "The comment from the requester explaining the reason for the association.\n\n\
        \  Don't include personal, confidential or sensitive information in this field. This field \
         may be displayed in plaintext in CloudTrail logs and other output.\n\
        \  \n\
        \   "]
  mpa_team_arn : mpa_team_arn;
      [@ocaml.doc "The ARN of the MPA team to associate with the protected operation.\n"]
  action : mpa_operation;
      [@ocaml.doc
        "The protected operation to associate with the MPA team. Currently, the only supported \
         value is [IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE].\n"]
}
[@@ocaml.doc ""]

type nonrec key_summary = {
  primary_region : region option; [@ocaml.doc ""]
  multi_region_key_type : multi_region_key_type option;
      [@ocaml.doc
        "Indicates whether this key is a Multi-Region key and its role in the Multi-Region key \
         hierarchy.\n\n\
        \ Multi-Region replication keys allow the same key material to be used across multiple \
         Amazon Web Services Regions. This field specifies whether the key is a Primary Region key \
         (PRK) (which can be replicated to other Amazon Web Services Regions) or a Replica Region \
         key (RRK) (which is a copy of a PRK in another Region). For more information, see \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
         key replication}.\n\
        \ "]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Specifies whether the key is enabled. \n"]
  exportable : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Specifies whether the key is exportable. This data is immutable after the key is created.\n"]
  key_check_value : key_check_value;
      [@ocaml.doc
        "The key check value (KCV) is used to check if all parties holding a given key have the \
         same key or to detect that a key has changed.\n"]
  key_attributes : key_attributes;
      [@ocaml.doc
        "The role of the key, the algorithm it supports, and the cryptographic operations allowed \
         with the key. This data is immutable after the key is created.\n"]
  key_state : key_state;
      [@ocaml.doc
        "The state of an Amazon Web Services Payment Cryptography that is being created or deleted.\n"]
  key_arn : key_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the key.\n"]
}
[@@ocaml.doc "Metadata about an Amazon Web Services Payment Cryptography key.\n"]

type nonrec key_summary_list = key_summary list [@@ocaml.doc ""]

type nonrec list_keys_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of results, or an empty or null value if there are no more \
         results.\n"]
  keys : key_summary_list;
      [@ocaml.doc
        "The list of keys created within the caller's Amazon Web Services account and Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec list_keys_input = {
  max_results : max_results option;
      [@ocaml.doc
        "Use this parameter to specify the maximum number of items to return. When this value is \
         present, Amazon Web Services Payment Cryptography does not return more than the specified \
         number of items, but it might return fewer.\n\n\
        \ This value is optional. If you include a value, it must be between 1 and 100, inclusive. \
         If you do not include a value, it defaults to 50.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter in a subsequent request after you receive a response with truncated \
         results. Set it to the value of [NextToken] from the truncated response you just received.\n"]
  key_state : key_state option; [@ocaml.doc "The key state of the keys you want to list.\n"]
}
[@@ocaml.doc ""]

type nonrec aliases = alias list [@@ocaml.doc ""]

type nonrec list_aliases_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for the next set of results, or an empty or null value if there are no more \
         results.\n"]
  aliases : aliases;
      [@ocaml.doc "The list of aliases. Each alias describes the [KeyArn] contained within.\n"]
}
[@@ocaml.doc ""]

type nonrec list_aliases_input = {
  max_results : max_results option;
      [@ocaml.doc
        "Use this parameter to specify the maximum number of items to return. When this value is \
         present, Amazon Web Services Payment Cryptography does not return more than the specified \
         number of items, but it might return fewer.\n\n\
        \ This value is optional. If you include a value, it must be between 1 and 100, inclusive. \
         If you do not include a value, it defaults to 50.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter in a subsequent request after you receive a response with truncated \
         results. Set it to the value of [NextToken] from the truncated response you just received.\n"]
  key_arn : key_arn option; [@ocaml.doc "The [keyARN] for which you want to list all aliases.\n"]
}
[@@ocaml.doc ""]

type nonrec key_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec get_key_output = {
  key : key;
      [@ocaml.doc
        "Contains the key metadata, including both immutable and mutable attributes for the key, \
         but does not include actual cryptographic key material.\n"]
}
[@@ocaml.doc ""]

type nonrec get_key_input = {
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc "The [KeyARN] of the Amazon Web Services Payment Cryptography key.\n"]
}
[@@ocaml.doc ""]

type nonrec get_alias_output = {
  alias : alias; [@ocaml.doc "The alias of the Amazon Web Services Payment Cryptography key.\n"]
}
[@@ocaml.doc ""]

type nonrec get_alias_input = {
  alias_name : alias_name;
      [@ocaml.doc "The alias of the Amazon Web Services Payment Cryptography key.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_key_output = {
  key : key; [@ocaml.doc "The [KeyARN] of the key that is scheduled for deletion.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_key_input = {
  delete_key_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The waiting period for key deletion. The default value is seven days.\n"]
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc "The [KeyARN] of the key that is scheduled for deletion.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_alias_output = unit [@@ocaml.doc ""]

type nonrec delete_alias_input = {
  alias_name : alias_name;
      [@ocaml.doc
        "A friendly name that you can use to refer Amazon Web Services Payment Cryptography key. \
         This value must begin with [alias/] followed by a name, such as [alias/ExampleAlias].\n"]
}
[@@ocaml.doc ""]

type nonrec create_key_output = {
  key : key; [@ocaml.doc "The key material that contains all the key attributes.\n"]
}
[@@ocaml.doc ""]

type nonrec create_key_input = {
  replication_regions : regions option; [@ocaml.doc ""]
  derive_key_usage : derive_key_usage option;
      [@ocaml.doc
        "The intended cryptographic usage of keys derived from the ECC key pair to be created.\n\n\
        \ After creating an ECC key pair, you cannot change the intended cryptographic usage of \
         keys derived from it using ECDH.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "Assigns one or more tags to the Amazon Web Services Payment Cryptography key. Use this \
         parameter to tag a key when it is created. To tag an existing Amazon Web Services Payment \
         Cryptography key, use the \
         {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html}TagResource} \
         operation.\n\n\
        \ Each tag consists of a tag key and a tag value. Both the tag key and the tag value are \
         required, but the tag value can be an empty (null) string. You can't have more than one \
         tag on an Amazon Web Services Payment Cryptography key with the same tag key. \n\
        \ \n\
        \   Don't include personal, confidential or sensitive information in this field. This \
         field may be displayed in plaintext in CloudTrail logs and other output.\n\
        \   \n\
        \      Tagging or untagging an Amazon Web Services Payment Cryptography key can allow or \
         deny permission to the key.\n\
        \      \n\
        \       "]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable the key. If the key is enabled, it is activated for use \
         within the service. If the key is not enabled, then it is created but not activated. The \
         default value is enabled.\n"]
  exportable : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Specifies whether the key is exportable from the service.\n"]
  key_check_value_algorithm : key_check_value_algorithm option;
      [@ocaml.doc
        "The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key \
         check value (KCV). It is used to validate the key integrity.\n\n\
        \ For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of zero, with \
         the key to be checked and retaining the 3 highest order bytes of the encrypted result. \
         For AES keys, the KCV is computed using a CMAC algorithm where the input data is 16 bytes \
         of zero and retaining the 3 highest order bytes of the encrypted result. For HMAC keys, \
         the KCV is computed using the hash selected at key creation on a zero-length message, \
         taking the leftmost 3 bytes.\n\
        \ "]
  key_attributes : key_attributes;
      [@ocaml.doc
        "The role of the key, the algorithm it supports, and the cryptographic operations allowed \
         with the key. This data is immutable after the key is created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_alias_output = { alias : alias [@ocaml.doc "The alias for the key.\n"] }
[@@ocaml.doc ""]

type nonrec create_alias_input = {
  key_arn : key_arn option; [@ocaml.doc "The [KeyARN] of the key to associate with the alias.\n"]
  alias_name : alias_name;
      [@ocaml.doc
        "A friendly name that you can use to refer to a key. An alias must begin with [alias/] \
         followed by a name, for example [alias/ExampleAlias]. It can contain only alphanumeric \
         characters, forward slashes (/), underscores (_), and dashes (-).\n\n\
        \  Don't include personal, confidential or sensitive information in this field. This field \
         may be displayed in plaintext in CloudTrail logs and other output.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec alias_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec add_key_replication_regions_output = {
  key : key;
      [@ocaml.doc
        "The updated key metadata after adding the replication regions.\n\n\
        \ This includes the current state of the key and its replication configuration.\n\
        \ "]
}
[@@ocaml.doc "Output from adding replication regions to a key.\n"]

type nonrec add_key_replication_regions_input = {
  replication_regions : regions;
      [@ocaml.doc
        "The list of Amazon Web Services Regions to add to the key's replication configuration.\n\n\
        \ Each region must be a valid Amazon Web Services Region where Amazon Web Services Payment \
         Cryptography is available. The key will be replicated to these regions, allowing \
         cryptographic operations to be performed closer to your applications.\n\
        \ "]
  key_identifier : key_arn_or_key_alias_type;
      [@ocaml.doc
        "The key identifier (ARN or alias) of the key for which to add replication regions.\n\n\
        \ This key must exist and be in a valid state for replication operations.\n\
        \ "]
}
[@@ocaml.doc "Input parameters for adding replication regions to a specific key.\n"]
