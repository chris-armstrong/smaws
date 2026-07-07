open Smaws_Lib.Json.DeserializeHelpers
open Types

let wrapping_key_spec_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_OAEP_SHA_256" -> RSA_OAEP_SHA_256
    | `String "RSA_OAEP_SHA_512" -> RSA_OAEP_SHA_512
    | `String value -> raise (deserialize_unknown_enum_value_error path "WrappingKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "WrappingKeySpec")
     : wrapping_key_spec)
    : wrapping_key_spec)

let wrapped_key_material_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEY_CRYPTOGRAM" -> KEY_CRYPTOGRAM
    | `String "TR31_KEY_BLOCK" -> TR31_KEY_BLOCK
    | `String "TR34_KEY_BLOCK" -> TR34_KEY_BLOCK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WrappedKeyMaterialFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "WrappedKeyMaterialFormat")
     : wrapped_key_material_format)
    : wrapped_key_material_format)

let wrapped_key_cryptogram_of_yojson = string_of_yojson
let key_arn_of_yojson = string_of_yojson
let key_material_of_yojson = string_of_yojson
let key_check_value_of_yojson = string_of_yojson

let key_check_value_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "CMAC" -> CMAC
    | `String "ANSI_X9_24" -> ANSI_X9_24
    | `String "HMAC" -> HMAC
    | `String "SHA_1" -> SHA_1
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyCheckValueAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyCheckValueAlgorithm")
     : key_check_value_algorithm)
    : key_check_value_algorithm)

let wrapped_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_check_value_algorithm =
       option_of_yojson
         (value_for_key key_check_value_algorithm_of_yojson "KeyCheckValueAlgorithm")
         _list path;
     key_check_value =
       option_of_yojson (value_for_key key_check_value_of_yojson "KeyCheckValue") _list path;
     key_material = value_for_key key_material_of_yojson "KeyMaterial" _list path;
     wrapped_key_material_format =
       value_for_key wrapped_key_material_format_of_yojson "WrappedKeyMaterialFormat" _list path;
     wrapping_key_arn = value_for_key key_arn_of_yojson "WrappingKeyArn" _list path;
   }
    : wrapped_key)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : validation_exception)

let alias_name_of_yojson = string_of_yojson

let alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_arn = option_of_yojson (value_for_key key_arn_of_yojson "KeyArn") _list path;
     alias_name = value_for_key alias_name_of_yojson "AliasName" _list path;
   }
    : alias)

let update_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias = value_for_key alias_of_yojson "Alias" _list path } : update_alias_output)

let update_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_arn = option_of_yojson (value_for_key key_arn_of_yojson "KeyArn") _list path;
     alias_name = value_for_key alias_name_of_yojson "AliasName" _list path;
   }
    : update_alias_input)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : throttling_exception)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : service_unavailable_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId")
         _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : access_denied_exception)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_input)

let key_usage_of_yojson (tree : t) path =
  ((match tree with
    | `String "TR31_B0_BASE_DERIVATION_KEY" -> TR31_B0_BASE_DERIVATION_KEY
    | `String "TR31_C0_CARD_VERIFICATION_KEY" -> TR31_C0_CARD_VERIFICATION_KEY
    | `String "TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY" -> TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY
    | `String "TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION" ->
        TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION
    | `String "TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS" -> TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS
    | `String "TR31_E1_EMV_MKEY_CONFIDENTIALITY" -> TR31_E1_EMV_MKEY_CONFIDENTIALITY
    | `String "TR31_E2_EMV_MKEY_INTEGRITY" -> TR31_E2_EMV_MKEY_INTEGRITY
    | `String "TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS" -> TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS
    | `String "TR31_E5_EMV_MKEY_CARD_PERSONALIZATION" -> TR31_E5_EMV_MKEY_CARD_PERSONALIZATION
    | `String "TR31_E6_EMV_MKEY_OTHER" -> TR31_E6_EMV_MKEY_OTHER
    | `String "TR31_K0_KEY_ENCRYPTION_KEY" -> TR31_K0_KEY_ENCRYPTION_KEY
    | `String "TR31_K1_KEY_BLOCK_PROTECTION_KEY" -> TR31_K1_KEY_BLOCK_PROTECTION_KEY
    | `String "TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT" -> TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT
    | `String "TR31_M0_ISO_16609_MAC_KEY" -> TR31_M0_ISO_16609_MAC_KEY
    | `String "TR31_M3_ISO_9797_3_MAC_KEY" -> TR31_M3_ISO_9797_3_MAC_KEY
    | `String "TR31_M1_ISO_9797_1_MAC_KEY" -> TR31_M1_ISO_9797_1_MAC_KEY
    | `String "TR31_M6_ISO_9797_5_CMAC_KEY" -> TR31_M6_ISO_9797_5_CMAC_KEY
    | `String "TR31_M7_HMAC_KEY" -> TR31_M7_HMAC_KEY
    | `String "TR31_P0_PIN_ENCRYPTION_KEY" -> TR31_P0_PIN_ENCRYPTION_KEY
    | `String "TR31_P1_PIN_GENERATION_KEY" -> TR31_P1_PIN_GENERATION_KEY
    | `String "TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE" ->
        TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE
    | `String "TR31_V1_IBM3624_PIN_VERIFICATION_KEY" -> TR31_V1_IBM3624_PIN_VERIFICATION_KEY
    | `String "TR31_V2_VISA_PIN_VERIFICATION_KEY" -> TR31_V2_VISA_PIN_VERIFICATION_KEY
    | `String "TR31_K2_TR34_ASYMMETRIC_KEY" -> TR31_K2_TR34_ASYMMETRIC_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyUsage" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyUsage")
     : key_usage)
    : key_usage)

let key_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYMMETRIC_KEY" -> SYMMETRIC_KEY
    | `String "ASYMMETRIC_KEY_PAIR" -> ASYMMETRIC_KEY_PAIR
    | `String "PRIVATE_KEY" -> PRIVATE_KEY
    | `String "PUBLIC_KEY" -> PUBLIC_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyClass" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyClass")
     : key_class)
    : key_class)

let key_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "TDES_2KEY" -> TDES_2KEY
    | `String "TDES_3KEY" -> TDES_3KEY
    | `String "AES_128" -> AES_128
    | `String "AES_192" -> AES_192
    | `String "AES_256" -> AES_256
    | `String "HMAC_SHA256" -> HMAC_SHA256
    | `String "HMAC_SHA384" -> HMAC_SHA384
    | `String "HMAC_SHA512" -> HMAC_SHA512
    | `String "HMAC_SHA224" -> HMAC_SHA224
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_4096" -> RSA_4096
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAlgorithm")
     : key_algorithm)
    : key_algorithm)

let key_modes_of_use_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     no_restrictions =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "NoRestrictions")
         _list path;
     derive_key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "DeriveKey")
         _list path;
     verify =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "Verify")
         _list path;
     sign =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "Sign")
         _list path;
     generate =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "Generate")
         _list path;
     unwrap =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "Unwrap")
         _list path;
     wrap =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "Wrap")
         _list path;
     decrypt =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "Decrypt")
         _list path;
     encrypt =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "Encrypt")
         _list path;
   }
    : key_modes_of_use)

let key_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_modes_of_use = value_for_key key_modes_of_use_of_yojson "KeyModesOfUse" _list path;
     key_algorithm = value_for_key key_algorithm_of_yojson "KeyAlgorithm" _list path;
     key_class = value_for_key key_class_of_yojson "KeyClass" _list path;
     key_usage = value_for_key key_usage_of_yojson "KeyUsage" _list path;
   }
    : key_attributes)

let certificate_type_of_yojson = string_of_yojson
let key_arn_or_key_alias_type_of_yojson = string_of_yojson

let trusted_certificate_public_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority_public_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "CertificateAuthorityPublicKeyIdentifier"
         _list path;
     public_key_certificate =
       value_for_key certificate_type_of_yojson "PublicKeyCertificate" _list path;
     key_attributes = value_for_key key_attributes_of_yojson "KeyAttributes" _list path;
   }
    : trusted_certificate_public_key)

let tr34_wrapped_key_block_of_yojson = string_of_yojson

let tr34_key_block_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "X9_TR34_2012" -> X9_TR34_2012
    | `String value -> raise (deserialize_unknown_enum_value_error path "Tr34KeyBlockFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "Tr34KeyBlockFormat")
     : tr34_key_block_format)
    : tr34_key_block_format)

let tr31_wrapped_key_block_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "Tags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_input)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : service_quota_exceeded_exception)

let symmetric_key_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "HMAC_SHA224" -> HMAC_SHA224
    | `String "HMAC_SHA512" -> HMAC_SHA512
    | `String "HMAC_SHA384" -> HMAC_SHA384
    | `String "HMAC_SHA256" -> HMAC_SHA256
    | `String "AES_256" -> AES_256
    | `String "AES_192" -> AES_192
    | `String "AES_128" -> AES_128
    | `String "TDES_3KEY" -> TDES_3KEY
    | `String "TDES_2KEY" -> TDES_2KEY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SymmetricKeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "SymmetricKeyAlgorithm")
     : symmetric_key_algorithm)
    : symmetric_key_algorithm)

let key_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
    | `String "DELETE_PENDING" -> DELETE_PENDING
    | `String "DELETE_COMPLETE" -> DELETE_COMPLETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyState" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyState")
     : key_state)
    : key_state)

let key_origin_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXTERNAL" -> EXTERNAL
    | `String "AWS_PAYMENT_CRYPTOGRAPHY" -> AWS_PAYMENT_CRYPTOGRAPHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyOrigin" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyOrigin")
     : key_origin)
    : key_origin)

let derive_key_usage_of_yojson (tree : t) path =
  ((match tree with
    | `String "TR31_B0_BASE_DERIVATION_KEY" -> TR31_B0_BASE_DERIVATION_KEY
    | `String "TR31_C0_CARD_VERIFICATION_KEY" -> TR31_C0_CARD_VERIFICATION_KEY
    | `String "TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY" -> TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY
    | `String "TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS" -> TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS
    | `String "TR31_E1_EMV_MKEY_CONFIDENTIALITY" -> TR31_E1_EMV_MKEY_CONFIDENTIALITY
    | `String "TR31_E2_EMV_MKEY_INTEGRITY" -> TR31_E2_EMV_MKEY_INTEGRITY
    | `String "TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS" -> TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS
    | `String "TR31_E5_EMV_MKEY_CARD_PERSONALIZATION" -> TR31_E5_EMV_MKEY_CARD_PERSONALIZATION
    | `String "TR31_E6_EMV_MKEY_OTHER" -> TR31_E6_EMV_MKEY_OTHER
    | `String "TR31_K0_KEY_ENCRYPTION_KEY" -> TR31_K0_KEY_ENCRYPTION_KEY
    | `String "TR31_K1_KEY_BLOCK_PROTECTION_KEY" -> TR31_K1_KEY_BLOCK_PROTECTION_KEY
    | `String "TR31_M3_ISO_9797_3_MAC_KEY" -> TR31_M3_ISO_9797_3_MAC_KEY
    | `String "TR31_M1_ISO_9797_1_MAC_KEY" -> TR31_M1_ISO_9797_1_MAC_KEY
    | `String "TR31_M6_ISO_9797_5_CMAC_KEY" -> TR31_M6_ISO_9797_5_CMAC_KEY
    | `String "TR31_M7_HMAC_KEY" -> TR31_M7_HMAC_KEY
    | `String "TR31_P0_PIN_ENCRYPTION_KEY" -> TR31_P0_PIN_ENCRYPTION_KEY
    | `String "TR31_P1_PIN_GENERATION_KEY" -> TR31_P1_PIN_GENERATION_KEY
    | `String "TR31_V1_IBM3624_PIN_VERIFICATION_KEY" -> TR31_V1_IBM3624_PIN_VERIFICATION_KEY
    | `String "TR31_V2_VISA_PIN_VERIFICATION_KEY" -> TR31_V2_VISA_PIN_VERIFICATION_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeriveKeyUsage" value)
    | _ -> raise (deserialize_wrong_type_error path "DeriveKeyUsage")
     : derive_key_usage)
    : derive_key_usage)

let multi_region_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIMARY" -> PRIMARY
    | `String "REPLICA" -> REPLICA
    | `String value -> raise (deserialize_unknown_enum_value_error path "MultiRegionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "MultiRegionKeyType")
     : multi_region_key_type)
    : multi_region_key_type)

let region_of_yojson = string_of_yojson

let key_replication_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SYNCHRONIZED" -> SYNCHRONIZED
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyReplicationState" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyReplicationState")
     : key_replication_state)
    : key_replication_state)

let replication_status_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "StatusMessage")
         _list path;
     status = value_for_key key_replication_state_of_yojson "Status" _list path;
   }
    : replication_status_type)

let replication_status_of_yojson tree path =
  map_of_yojson region_of_yojson replication_status_type_of_yojson tree path

let mpa_session_arn_of_yojson = string_of_yojson

let session_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "APPROVED" -> APPROVED
    | `String "FAILED" -> FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionStatus")
     : session_status)
    : session_status)

let mpa_status_message_of_yojson = string_of_yojson

let mpa_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson (value_for_key mpa_status_message_of_yojson "StatusMessage") _list path;
     initiation_date = value_for_key timestamp_of_yojson "InitiationDate" _list path;
     status = value_for_key session_status_of_yojson "Status" _list path;
     mpa_session_arn = value_for_key mpa_session_arn_of_yojson "MpaSessionArn" _list path;
   }
    : mpa_status)

let key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mpa_status = option_of_yojson (value_for_key mpa_status_of_yojson "MpaStatus") _list path;
     using_default_replication_regions =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "UsingDefaultReplicationRegions")
         _list path;
     replication_status =
       option_of_yojson (value_for_key replication_status_of_yojson "ReplicationStatus") _list path;
     primary_region = option_of_yojson (value_for_key region_of_yojson "PrimaryRegion") _list path;
     multi_region_key_type =
       option_of_yojson
         (value_for_key multi_region_key_type_of_yojson "MultiRegionKeyType")
         _list path;
     derive_key_usage =
       option_of_yojson (value_for_key derive_key_usage_of_yojson "DeriveKeyUsage") _list path;
     delete_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "DeleteTimestamp") _list path;
     delete_pending_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "DeletePendingTimestamp") _list path;
     usage_stop_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "UsageStopTimestamp") _list path;
     usage_start_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "UsageStartTimestamp") _list path;
     create_timestamp = value_for_key timestamp_of_yojson "CreateTimestamp" _list path;
     key_origin = value_for_key key_origin_of_yojson "KeyOrigin" _list path;
     key_state = value_for_key key_state_of_yojson "KeyState" _list path;
     exportable =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Exportable" _list
         path;
     enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled" _list path;
     key_check_value_algorithm =
       value_for_key key_check_value_algorithm_of_yojson "KeyCheckValueAlgorithm" _list path;
     key_check_value = value_for_key key_check_value_of_yojson "KeyCheckValue" _list path;
     key_attributes = value_for_key key_attributes_of_yojson "KeyAttributes" _list path;
     key_arn = value_for_key key_arn_of_yojson "KeyArn" _list path;
   }
    : key)

let stop_key_usage_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : stop_key_usage_output)

let stop_key_usage_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path }
    : stop_key_usage_input)

let start_key_usage_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : start_key_usage_output)

let start_key_usage_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path }
    : start_key_usage_input)

let signing_algorithm_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHA224" -> SHA224
    | `String "SHA256" -> SHA256
    | `String "SHA384" -> SHA384
    | `String "SHA512" -> SHA512
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SigningAlgorithmType" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningAlgorithmType")
     : signing_algorithm_type)
    : signing_algorithm_type)

let shared_information_of_yojson = string_of_yojson

let root_certificate_public_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     public_key_certificate =
       value_for_key certificate_type_of_yojson "PublicKeyCertificate" _list path;
     key_attributes = value_for_key key_attributes_of_yojson "KeyAttributes" _list path;
   }
    : root_certificate_public_key)

let restore_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : restore_key_output)

let restore_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path }
    : restore_key_input)

let resource_policy_of_yojson = string_of_yojson

let remove_key_replication_regions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : remove_key_replication_regions_output)

let regions_of_yojson tree path = list_of_yojson region_of_yojson tree path

let remove_key_replication_regions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_regions = value_for_key regions_of_yojson "ReplicationRegions" _list path;
     key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path;
   }
    : remove_key_replication_regions_input)

let put_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key resource_policy_of_yojson "Policy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : put_resource_policy_output)

let put_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key resource_policy_of_yojson "Policy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : put_resource_policy_input)

let public_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : public_policy_exception)

let next_token_of_yojson = string_of_yojson

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : list_tags_for_resource_output)

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : list_tags_for_resource_input)

let import_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : import_key_output)

let import_tr31_key_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wrapped_key_block = value_for_key tr31_wrapped_key_block_of_yojson "WrappedKeyBlock" _list path;
     wrapping_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "WrappingKeyIdentifier" _list path;
   }
    : import_tr31_key_block)

let import_token_id_of_yojson = string_of_yojson
let even_hex_length_between16_and32_of_yojson = string_of_yojson

let import_tr34_key_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     random_nonce =
       option_of_yojson
         (value_for_key even_hex_length_between16_and32_of_yojson "RandomNonce")
         _list path;
     key_block_format = value_for_key tr34_key_block_format_of_yojson "KeyBlockFormat" _list path;
     wrapped_key_block = value_for_key tr34_wrapped_key_block_of_yojson "WrappedKeyBlock" _list path;
     wrapping_key_certificate =
       option_of_yojson
         (value_for_key certificate_type_of_yojson "WrappingKeyCertificate")
         _list path;
     wrapping_key_identifier =
       option_of_yojson
         (value_for_key key_arn_or_key_alias_type_of_yojson "WrappingKeyIdentifier")
         _list path;
     import_token =
       option_of_yojson (value_for_key import_token_id_of_yojson "ImportToken") _list path;
     signing_key_certificate =
       value_for_key certificate_type_of_yojson "SigningKeyCertificate" _list path;
     certificate_authority_public_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "CertificateAuthorityPublicKeyIdentifier"
         _list path;
   }
    : import_tr34_key_block)

let import_key_cryptogram_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wrapping_spec =
       option_of_yojson (value_for_key wrapping_key_spec_of_yojson "WrappingSpec") _list path;
     import_token = value_for_key import_token_id_of_yojson "ImportToken" _list path;
     wrapped_key_cryptogram =
       value_for_key wrapped_key_cryptogram_of_yojson "WrappedKeyCryptogram" _list path;
     exportable =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Exportable" _list
         path;
     key_attributes = value_for_key key_attributes_of_yojson "KeyAttributes" _list path;
   }
    : import_key_cryptogram)

let key_derivation_function_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANSI_X963" -> ANSI_X963
    | `String "NIST_SP800" -> NIST_SP800
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyDerivationFunction" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyDerivationFunction")
     : key_derivation_function)
    : key_derivation_function)

let key_derivation_hash_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHA_512" -> SHA_512
    | `String "SHA_384" -> SHA_384
    | `String "SHA_256" -> SHA_256
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyDerivationHashAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyDerivationHashAlgorithm")
     : key_derivation_hash_algorithm)
    : key_derivation_hash_algorithm)

let diffie_hellman_derivation_data_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "SharedInformation" -> SharedInformation (shared_information_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "DiffieHellmanDerivationData" unknown)
    : diffie_hellman_derivation_data)

let import_diffie_hellman_tr31_key_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wrapped_key_block = value_for_key tr31_wrapped_key_block_of_yojson "WrappedKeyBlock" _list path;
     derivation_data =
       value_for_key diffie_hellman_derivation_data_of_yojson "DerivationData" _list path;
     key_derivation_hash_algorithm =
       value_for_key key_derivation_hash_algorithm_of_yojson "KeyDerivationHashAlgorithm" _list path;
     key_derivation_function =
       value_for_key key_derivation_function_of_yojson "KeyDerivationFunction" _list path;
     derive_key_algorithm =
       value_for_key symmetric_key_algorithm_of_yojson "DeriveKeyAlgorithm" _list path;
     public_key_certificate =
       value_for_key certificate_type_of_yojson "PublicKeyCertificate" _list path;
     certificate_authority_public_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "CertificateAuthorityPublicKeyIdentifier"
         _list path;
     private_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "PrivateKeyIdentifier" _list path;
   }
    : import_diffie_hellman_tr31_key_block)

let as2805_key_variant_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATA_ENCRYPTION_KEY_VARIANT_22" -> DATA_ENCRYPTION_KEY_VARIANT_22
    | `String "MESSAGE_AUTHENTICATION_KEY_VARIANT_24" -> MESSAGE_AUTHENTICATION_KEY_VARIANT_24
    | `String "PIN_ENCRYPTION_KEY_VARIANT_28" -> PIN_ENCRYPTION_KEY_VARIANT_28
    | `String "TERMINAL_MAJOR_KEY_VARIANT_00" -> TERMINAL_MAJOR_KEY_VARIANT_00
    | `String value -> raise (deserialize_unknown_enum_value_error path "As2805KeyVariant" value)
    | _ -> raise (deserialize_wrong_type_error path "As2805KeyVariant")
     : as2805_key_variant)
    : as2805_key_variant)

let import_as2805_key_cryptogram_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wrapped_key_cryptogram =
       value_for_key wrapped_key_cryptogram_of_yojson "WrappedKeyCryptogram" _list path;
     wrapping_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "WrappingKeyIdentifier" _list path;
     exportable =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Exportable" _list
         path;
     key_algorithm = value_for_key key_algorithm_of_yojson "KeyAlgorithm" _list path;
     key_modes_of_use = value_for_key key_modes_of_use_of_yojson "KeyModesOfUse" _list path;
     as2805_key_variant = value_for_key as2805_key_variant_of_yojson "As2805KeyVariant" _list path;
   }
    : import_as2805_key_cryptogram)

let import_key_material_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "As2805KeyCryptogram" ->
       As2805KeyCryptogram (import_as2805_key_cryptogram_of_yojson value_ path)
   | "DiffieHellmanTr31KeyBlock" ->
       DiffieHellmanTr31KeyBlock (import_diffie_hellman_tr31_key_block_of_yojson value_ path)
   | "KeyCryptogram" -> KeyCryptogram (import_key_cryptogram_of_yojson value_ path)
   | "Tr34KeyBlock" -> Tr34KeyBlock (import_tr34_key_block_of_yojson value_ path)
   | "Tr31KeyBlock" -> Tr31KeyBlock (import_tr31_key_block_of_yojson value_ path)
   | "TrustedCertificatePublicKey" ->
       TrustedCertificatePublicKey (trusted_certificate_public_key_of_yojson value_ path)
   | "RootCertificatePublicKey" ->
       RootCertificatePublicKey (root_certificate_public_key_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ImportKeyMaterial" unknown)
    : import_key_material)

let mpa_requester_comment_of_yojson = string_of_yojson

let import_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_comment =
       option_of_yojson
         (value_for_key mpa_requester_comment_of_yojson "RequesterComment")
         _list path;
     replication_regions =
       option_of_yojson (value_for_key regions_of_yojson "ReplicationRegions") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled")
         _list path;
     key_check_value_algorithm =
       option_of_yojson
         (value_for_key key_check_value_algorithm_of_yojson "KeyCheckValueAlgorithm")
         _list path;
     key_material = value_for_key import_key_material_of_yojson "KeyMaterial" _list path;
   }
    : import_key_input)

let get_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key resource_policy_of_yojson "Policy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : get_resource_policy_output)

let get_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_resource_policy_input)

let get_public_key_certificate_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_certificate_chain =
       value_for_key certificate_type_of_yojson "KeyCertificateChain" _list path;
     key_certificate = value_for_key certificate_type_of_yojson "KeyCertificate" _list path;
   }
    : get_public_key_certificate_output)

let get_public_key_certificate_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path }
    : get_public_key_certificate_input)

let get_parameters_for_import_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters_valid_until_timestamp =
       value_for_key timestamp_of_yojson "ParametersValidUntilTimestamp" _list path;
     import_token = value_for_key import_token_id_of_yojson "ImportToken" _list path;
     wrapping_key_algorithm =
       value_for_key key_algorithm_of_yojson "WrappingKeyAlgorithm" _list path;
     wrapping_key_certificate_chain =
       value_for_key certificate_type_of_yojson "WrappingKeyCertificateChain" _list path;
     wrapping_key_certificate =
       value_for_key certificate_type_of_yojson "WrappingKeyCertificate" _list path;
   }
    : get_parameters_for_import_output)

let key_material_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TR34_KEY_BLOCK" -> TR34_KEY_BLOCK
    | `String "TR31_KEY_BLOCK" -> TR31_KEY_BLOCK
    | `String "ROOT_PUBLIC_KEY_CERTIFICATE" -> ROOT_PUBLIC_KEY_CERTIFICATE
    | `String "TRUSTED_PUBLIC_KEY_CERTIFICATE" -> TRUSTED_PUBLIC_KEY_CERTIFICATE
    | `String "KEY_CRYPTOGRAM" -> KEY_CRYPTOGRAM
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyMaterialType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyMaterialType")
     : key_material_type)
    : key_material_type)

let get_parameters_for_import_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reuse_last_generated_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "ReuseLastGeneratedToken")
         _list path;
     wrapping_key_algorithm =
       value_for_key key_algorithm_of_yojson "WrappingKeyAlgorithm" _list path;
     key_material_type = value_for_key key_material_type_of_yojson "KeyMaterialType" _list path;
   }
    : get_parameters_for_import_input)

let export_token_id_of_yojson = string_of_yojson

let get_parameters_for_export_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters_valid_until_timestamp =
       value_for_key timestamp_of_yojson "ParametersValidUntilTimestamp" _list path;
     export_token = value_for_key export_token_id_of_yojson "ExportToken" _list path;
     signing_key_algorithm = value_for_key key_algorithm_of_yojson "SigningKeyAlgorithm" _list path;
     signing_key_certificate_chain =
       value_for_key certificate_type_of_yojson "SigningKeyCertificateChain" _list path;
     signing_key_certificate =
       value_for_key certificate_type_of_yojson "SigningKeyCertificate" _list path;
   }
    : get_parameters_for_export_output)

let get_parameters_for_export_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reuse_last_generated_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "ReuseLastGeneratedToken")
         _list path;
     signing_key_algorithm = value_for_key key_algorithm_of_yojson "SigningKeyAlgorithm" _list path;
     key_material_type = value_for_key key_material_type_of_yojson "KeyMaterialType" _list path;
   }
    : get_parameters_for_export_input)

let mpa_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE" -> IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MpaOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "MpaOperation")
     : mpa_operation)
    : mpa_operation)

let mpa_team_arn_of_yojson = string_of_yojson

let association_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATE_PENDING" -> UPDATE_PENDING
    | `String "DELETE_PENDING" -> DELETE_PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationState" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationState")
     : association_state)
    : association_state)

let mpa_team_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mpa_status = option_of_yojson (value_for_key mpa_status_of_yojson "MpaStatus") _list path;
     association_state = value_for_key association_state_of_yojson "AssociationState" _list path;
     mpa_team_arn = value_for_key mpa_team_arn_of_yojson "MpaTeamArn" _list path;
     action = value_for_key mpa_operation_of_yojson "Action" _list path;
   }
    : mpa_team_association)

let get_mpa_team_association_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mpa_team_association =
       value_for_key mpa_team_association_of_yojson "MpaTeamAssociation" _list path;
   }
    : get_mpa_team_association_output)

let get_mpa_team_association_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ action = value_for_key mpa_operation_of_yojson "Action" _list path }
    : get_mpa_team_association_input)

let get_default_key_replication_regions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled_replication_regions =
       value_for_key regions_of_yojson "EnabledReplicationRegions" _list path;
   }
    : get_default_key_replication_regions_output)

let get_default_key_replication_regions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let certificate_signing_request_type_of_yojson = string_of_yojson

let get_certificate_signing_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_signing_request =
       value_for_key certificate_signing_request_type_of_yojson "CertificateSigningRequest" _list
         path;
   }
    : get_certificate_signing_request_output)

let certificate_subject_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "EmailAddress")
         _list path;
     state_or_province =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "StateOrProvince")
         _list path;
     country =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Country")
         _list path;
     city =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "City")
         _list path;
     organization =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Organization")
         _list path;
     organization_unit =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OrganizationUnit")
         _list path;
     common_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CommonName" _list
         path;
   }
    : certificate_subject_type)

let get_certificate_signing_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_subject =
       value_for_key certificate_subject_type_of_yojson "CertificateSubject" _list path;
     signing_algorithm =
       value_for_key signing_algorithm_type_of_yojson "SigningAlgorithm" _list path;
     key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path;
   }
    : get_certificate_signing_request_input)

let export_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ wrapped_key = option_of_yojson (value_for_key wrapped_key_of_yojson "WrappedKey") _list path }
    : export_key_output)

let key_exportability_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPORTABLE" -> EXPORTABLE
    | `String "NON_EXPORTABLE" -> NON_EXPORTABLE
    | `String "SENSITIVE" -> SENSITIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyExportability" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyExportability")
     : key_exportability)
    : key_exportability)

let key_version_of_yojson = string_of_yojson
let optional_block_value_of_yojson = string_of_yojson
let optional_block_id_of_yojson = string_of_yojson

let optional_blocks_of_yojson tree path =
  map_of_yojson optional_block_id_of_yojson optional_block_value_of_yojson tree path

let key_block_headers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     optional_blocks =
       option_of_yojson (value_for_key optional_blocks_of_yojson "OptionalBlocks") _list path;
     key_version = option_of_yojson (value_for_key key_version_of_yojson "KeyVersion") _list path;
     key_exportability =
       option_of_yojson (value_for_key key_exportability_of_yojson "KeyExportability") _list path;
     key_modes_of_use =
       option_of_yojson (value_for_key key_modes_of_use_of_yojson "KeyModesOfUse") _list path;
   }
    : key_block_headers)

let export_tr31_key_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_block_headers =
       option_of_yojson (value_for_key key_block_headers_of_yojson "KeyBlockHeaders") _list path;
     wrapping_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "WrappingKeyIdentifier" _list path;
   }
    : export_tr31_key_block)

let export_tr34_key_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_block_headers =
       option_of_yojson (value_for_key key_block_headers_of_yojson "KeyBlockHeaders") _list path;
     random_nonce =
       option_of_yojson
         (value_for_key even_hex_length_between16_and32_of_yojson "RandomNonce")
         _list path;
     key_block_format = value_for_key tr34_key_block_format_of_yojson "KeyBlockFormat" _list path;
     signing_key_certificate =
       option_of_yojson
         (value_for_key certificate_type_of_yojson "SigningKeyCertificate")
         _list path;
     signing_key_identifier =
       option_of_yojson
         (value_for_key key_arn_or_key_alias_type_of_yojson "SigningKeyIdentifier")
         _list path;
     export_token =
       option_of_yojson (value_for_key export_token_id_of_yojson "ExportToken") _list path;
     wrapping_key_certificate =
       value_for_key certificate_type_of_yojson "WrappingKeyCertificate" _list path;
     certificate_authority_public_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "CertificateAuthorityPublicKeyIdentifier"
         _list path;
   }
    : export_tr34_key_block)

let export_key_cryptogram_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     wrapping_spec =
       option_of_yojson (value_for_key wrapping_key_spec_of_yojson "WrappingSpec") _list path;
     wrapping_key_certificate =
       value_for_key certificate_type_of_yojson "WrappingKeyCertificate" _list path;
     certificate_authority_public_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "CertificateAuthorityPublicKeyIdentifier"
         _list path;
   }
    : export_key_cryptogram)

let export_diffie_hellman_tr31_key_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_block_headers =
       option_of_yojson (value_for_key key_block_headers_of_yojson "KeyBlockHeaders") _list path;
     derivation_data =
       value_for_key diffie_hellman_derivation_data_of_yojson "DerivationData" _list path;
     key_derivation_hash_algorithm =
       value_for_key key_derivation_hash_algorithm_of_yojson "KeyDerivationHashAlgorithm" _list path;
     key_derivation_function =
       value_for_key key_derivation_function_of_yojson "KeyDerivationFunction" _list path;
     derive_key_algorithm =
       value_for_key symmetric_key_algorithm_of_yojson "DeriveKeyAlgorithm" _list path;
     public_key_certificate =
       value_for_key certificate_type_of_yojson "PublicKeyCertificate" _list path;
     certificate_authority_public_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "CertificateAuthorityPublicKeyIdentifier"
         _list path;
     private_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "PrivateKeyIdentifier" _list path;
   }
    : export_diffie_hellman_tr31_key_block)

let export_as2805_key_cryptogram_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     as2805_key_variant = value_for_key as2805_key_variant_of_yojson "As2805KeyVariant" _list path;
     wrapping_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "WrappingKeyIdentifier" _list path;
   }
    : export_as2805_key_cryptogram)

let export_key_material_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "As2805KeyCryptogram" ->
       As2805KeyCryptogram (export_as2805_key_cryptogram_of_yojson value_ path)
   | "DiffieHellmanTr31KeyBlock" ->
       DiffieHellmanTr31KeyBlock (export_diffie_hellman_tr31_key_block_of_yojson value_ path)
   | "KeyCryptogram" -> KeyCryptogram (export_key_cryptogram_of_yojson value_ path)
   | "Tr34KeyBlock" -> Tr34KeyBlock (export_tr34_key_block_of_yojson value_ path)
   | "Tr31KeyBlock" -> Tr31KeyBlock (export_tr31_key_block_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ExportKeyMaterial" unknown)
    : export_key_material)

let hex_length20_or24_of_yojson = string_of_yojson

let export_dukpt_initial_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_serial_number = value_for_key hex_length20_or24_of_yojson "KeySerialNumber" _list path }
    : export_dukpt_initial_key)

let export_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_check_value_algorithm =
       option_of_yojson
         (value_for_key key_check_value_algorithm_of_yojson "KeyCheckValueAlgorithm")
         _list path;
     export_dukpt_initial_key =
       option_of_yojson
         (value_for_key export_dukpt_initial_key_of_yojson "ExportDukptInitialKey")
         _list path;
   }
    : export_attributes)

let export_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_attributes =
       option_of_yojson (value_for_key export_attributes_of_yojson "ExportAttributes") _list path;
     export_key_identifier =
       value_for_key key_arn_or_key_alias_type_of_yojson "ExportKeyIdentifier" _list path;
     key_material = value_for_key export_key_material_of_yojson "KeyMaterial" _list path;
   }
    : export_key_input)

let enable_default_key_replication_regions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled_replication_regions =
       value_for_key regions_of_yojson "EnabledReplicationRegions" _list path;
   }
    : enable_default_key_replication_regions_output)

let enable_default_key_replication_regions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_regions = value_for_key regions_of_yojson "ReplicationRegions" _list path }
    : enable_default_key_replication_regions_input)

let disassociate_mpa_team_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mpa_team_association =
       value_for_key mpa_team_association_of_yojson "MpaTeamAssociation" _list path;
   }
    : disassociate_mpa_team_output)

let disassociate_mpa_team_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_comment =
       option_of_yojson
         (value_for_key mpa_requester_comment_of_yojson "RequesterComment")
         _list path;
     action = value_for_key mpa_operation_of_yojson "Action" _list path;
   }
    : disassociate_mpa_team_input)

let disable_default_key_replication_regions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled_replication_regions =
       value_for_key regions_of_yojson "EnabledReplicationRegions" _list path;
   }
    : disable_default_key_replication_regions_output)

let disable_default_key_replication_regions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ replication_regions = value_for_key regions_of_yojson "ReplicationRegions" _list path }
    : disable_default_key_replication_regions_input)

let delete_resource_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : delete_resource_policy_input)

let associate_mpa_team_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mpa_team_association =
       value_for_key mpa_team_association_of_yojson "MpaTeamAssociation" _list path;
   }
    : associate_mpa_team_output)

let associate_mpa_team_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requester_comment =
       option_of_yojson
         (value_for_key mpa_requester_comment_of_yojson "RequesterComment")
         _list path;
     mpa_team_arn = value_for_key mpa_team_arn_of_yojson "MpaTeamArn" _list path;
     action = value_for_key mpa_operation_of_yojson "Action" _list path;
   }
    : associate_mpa_team_input)

let key_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     primary_region = option_of_yojson (value_for_key region_of_yojson "PrimaryRegion") _list path;
     multi_region_key_type =
       option_of_yojson
         (value_for_key multi_region_key_type_of_yojson "MultiRegionKeyType")
         _list path;
     enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled" _list path;
     exportable =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Exportable" _list
         path;
     key_check_value = value_for_key key_check_value_of_yojson "KeyCheckValue" _list path;
     key_attributes = value_for_key key_attributes_of_yojson "KeyAttributes" _list path;
     key_state = value_for_key key_state_of_yojson "KeyState" _list path;
     key_arn = value_for_key key_arn_of_yojson "KeyArn" _list path;
   }
    : key_summary)

let key_summary_list_of_yojson tree path = list_of_yojson key_summary_of_yojson tree path

let list_keys_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     keys = value_for_key key_summary_list_of_yojson "Keys" _list path;
   }
    : list_keys_output)

let list_keys_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     key_state = option_of_yojson (value_for_key key_state_of_yojson "KeyState") _list path;
   }
    : list_keys_input)

let aliases_of_yojson tree path = list_of_yojson alias_of_yojson tree path

let list_aliases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     aliases = value_for_key aliases_of_yojson "Aliases" _list path;
   }
    : list_aliases_output)

let list_aliases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     key_arn = option_of_yojson (value_for_key key_arn_of_yojson "KeyArn") _list path;
   }
    : list_aliases_input)

let get_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : get_key_output)

let get_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path }
    : get_key_input)

let get_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias = value_for_key alias_of_yojson "Alias" _list path } : get_alias_output)

let get_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_name = value_for_key alias_name_of_yojson "AliasName" _list path } : get_alias_input)

let delete_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : delete_key_output)

let delete_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_key_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "DeleteKeyInDays")
         _list path;
     key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path;
   }
    : delete_key_input)

let delete_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias_name = value_for_key alias_name_of_yojson "AliasName" _list path } : delete_alias_input)

let create_key_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : create_key_output)

let create_key_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_regions =
       option_of_yojson (value_for_key regions_of_yojson "ReplicationRegions") _list path;
     derive_key_usage =
       option_of_yojson (value_for_key derive_key_usage_of_yojson "DeriveKeyUsage") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled")
         _list path;
     exportable =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Exportable" _list
         path;
     key_check_value_algorithm =
       option_of_yojson
         (value_for_key key_check_value_algorithm_of_yojson "KeyCheckValueAlgorithm")
         _list path;
     key_attributes = value_for_key key_attributes_of_yojson "KeyAttributes" _list path;
   }
    : create_key_input)

let create_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ alias = value_for_key alias_of_yojson "Alias" _list path } : create_alias_output)

let create_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_arn = option_of_yojson (value_for_key key_arn_of_yojson "KeyArn") _list path;
     alias_name = value_for_key alias_name_of_yojson "AliasName" _list path;
   }
    : create_alias_input)

let add_key_replication_regions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ key = value_for_key key_of_yojson "Key" _list path } : add_key_replication_regions_output)

let add_key_replication_regions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replication_regions = value_for_key regions_of_yojson "ReplicationRegions" _list path;
     key_identifier = value_for_key key_arn_or_key_alias_type_of_yojson "KeyIdentifier" _list path;
   }
    : add_key_replication_regions_input)
