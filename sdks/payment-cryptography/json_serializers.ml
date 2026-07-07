open Smaws_Lib.Json.SerializeHelpers
open Types

let wrapping_key_spec_to_yojson (x : wrapping_key_spec) =
  match x with
  | RSA_OAEP_SHA_256 -> `String "RSA_OAEP_SHA_256"
  | RSA_OAEP_SHA_512 -> `String "RSA_OAEP_SHA_512"

let wrapped_key_material_format_to_yojson (x : wrapped_key_material_format) =
  match x with
  | KEY_CRYPTOGRAM -> `String "KEY_CRYPTOGRAM"
  | TR31_KEY_BLOCK -> `String "TR31_KEY_BLOCK"
  | TR34_KEY_BLOCK -> `String "TR34_KEY_BLOCK"

let wrapped_key_cryptogram_to_yojson = string_to_yojson
let key_arn_to_yojson = string_to_yojson
let key_material_to_yojson = string_to_yojson
let key_check_value_to_yojson = string_to_yojson

let key_check_value_algorithm_to_yojson (x : key_check_value_algorithm) =
  match x with
  | CMAC -> `String "CMAC"
  | ANSI_X9_24 -> `String "ANSI_X9_24"
  | HMAC -> `String "HMAC"
  | SHA_1 -> `String "SHA_1"

let wrapped_key_to_yojson (x : wrapped_key) =
  assoc_to_yojson
    [
      ( "KeyCheckValueAlgorithm",
        option_to_yojson key_check_value_algorithm_to_yojson x.key_check_value_algorithm );
      ("KeyCheckValue", option_to_yojson key_check_value_to_yojson x.key_check_value);
      ("KeyMaterial", Some (key_material_to_yojson x.key_material));
      ( "WrappedKeyMaterialFormat",
        Some (wrapped_key_material_format_to_yojson x.wrapped_key_material_format) );
      ("WrappingKeyArn", Some (key_arn_to_yojson x.wrapping_key_arn));
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let alias_name_to_yojson = string_to_yojson

let alias_to_yojson (x : alias) =
  assoc_to_yojson
    [
      ("KeyArn", option_to_yojson key_arn_to_yojson x.key_arn);
      ("AliasName", Some (alias_name_to_yojson x.alias_name));
    ]

let update_alias_output_to_yojson (x : update_alias_output) =
  assoc_to_yojson [ ("Alias", Some (alias_to_yojson x.alias)) ]

let update_alias_input_to_yojson (x : update_alias_input) =
  assoc_to_yojson
    [
      ("KeyArn", option_to_yojson key_arn_to_yojson x.key_arn);
      ("AliasName", Some (alias_name_to_yojson x.alias_name));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "ResourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let untag_resource_output_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let key_usage_to_yojson (x : key_usage) =
  match x with
  | TR31_B0_BASE_DERIVATION_KEY -> `String "TR31_B0_BASE_DERIVATION_KEY"
  | TR31_C0_CARD_VERIFICATION_KEY -> `String "TR31_C0_CARD_VERIFICATION_KEY"
  | TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY -> `String "TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY"
  | TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION ->
      `String "TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION"
  | TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS -> `String "TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS"
  | TR31_E1_EMV_MKEY_CONFIDENTIALITY -> `String "TR31_E1_EMV_MKEY_CONFIDENTIALITY"
  | TR31_E2_EMV_MKEY_INTEGRITY -> `String "TR31_E2_EMV_MKEY_INTEGRITY"
  | TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS -> `String "TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS"
  | TR31_E5_EMV_MKEY_CARD_PERSONALIZATION -> `String "TR31_E5_EMV_MKEY_CARD_PERSONALIZATION"
  | TR31_E6_EMV_MKEY_OTHER -> `String "TR31_E6_EMV_MKEY_OTHER"
  | TR31_K0_KEY_ENCRYPTION_KEY -> `String "TR31_K0_KEY_ENCRYPTION_KEY"
  | TR31_K1_KEY_BLOCK_PROTECTION_KEY -> `String "TR31_K1_KEY_BLOCK_PROTECTION_KEY"
  | TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT -> `String "TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT"
  | TR31_M0_ISO_16609_MAC_KEY -> `String "TR31_M0_ISO_16609_MAC_KEY"
  | TR31_M3_ISO_9797_3_MAC_KEY -> `String "TR31_M3_ISO_9797_3_MAC_KEY"
  | TR31_M1_ISO_9797_1_MAC_KEY -> `String "TR31_M1_ISO_9797_1_MAC_KEY"
  | TR31_M6_ISO_9797_5_CMAC_KEY -> `String "TR31_M6_ISO_9797_5_CMAC_KEY"
  | TR31_M7_HMAC_KEY -> `String "TR31_M7_HMAC_KEY"
  | TR31_P0_PIN_ENCRYPTION_KEY -> `String "TR31_P0_PIN_ENCRYPTION_KEY"
  | TR31_P1_PIN_GENERATION_KEY -> `String "TR31_P1_PIN_GENERATION_KEY"
  | TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE ->
      `String "TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE"
  | TR31_V1_IBM3624_PIN_VERIFICATION_KEY -> `String "TR31_V1_IBM3624_PIN_VERIFICATION_KEY"
  | TR31_V2_VISA_PIN_VERIFICATION_KEY -> `String "TR31_V2_VISA_PIN_VERIFICATION_KEY"
  | TR31_K2_TR34_ASYMMETRIC_KEY -> `String "TR31_K2_TR34_ASYMMETRIC_KEY"

let key_class_to_yojson (x : key_class) =
  match x with
  | SYMMETRIC_KEY -> `String "SYMMETRIC_KEY"
  | ASYMMETRIC_KEY_PAIR -> `String "ASYMMETRIC_KEY_PAIR"
  | PRIVATE_KEY -> `String "PRIVATE_KEY"
  | PUBLIC_KEY -> `String "PUBLIC_KEY"

let key_algorithm_to_yojson (x : key_algorithm) =
  match x with
  | TDES_2KEY -> `String "TDES_2KEY"
  | TDES_3KEY -> `String "TDES_3KEY"
  | AES_128 -> `String "AES_128"
  | AES_192 -> `String "AES_192"
  | AES_256 -> `String "AES_256"
  | HMAC_SHA256 -> `String "HMAC_SHA256"
  | HMAC_SHA384 -> `String "HMAC_SHA384"
  | HMAC_SHA512 -> `String "HMAC_SHA512"
  | HMAC_SHA224 -> `String "HMAC_SHA224"
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"

let key_modes_of_use_to_yojson (x : key_modes_of_use) =
  assoc_to_yojson
    [
      ( "NoRestrictions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.no_restrictions );
      ( "DeriveKey",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.derive_key );
      ( "Verify",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.verify
      );
      ( "Sign",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.sign );
      ( "Generate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.generate );
      ( "Unwrap",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.unwrap
      );
      ( "Wrap",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.wrap );
      ( "Decrypt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.decrypt
      );
      ( "Encrypt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.encrypt
      );
    ]

let key_attributes_to_yojson (x : key_attributes) =
  assoc_to_yojson
    [
      ("KeyModesOfUse", Some (key_modes_of_use_to_yojson x.key_modes_of_use));
      ("KeyAlgorithm", Some (key_algorithm_to_yojson x.key_algorithm));
      ("KeyClass", Some (key_class_to_yojson x.key_class));
      ("KeyUsage", Some (key_usage_to_yojson x.key_usage));
    ]

let certificate_type_to_yojson = string_to_yojson
let key_arn_or_key_alias_type_to_yojson = string_to_yojson

let trusted_certificate_public_key_to_yojson (x : trusted_certificate_public_key) =
  assoc_to_yojson
    [
      ( "CertificateAuthorityPublicKeyIdentifier",
        Some (key_arn_or_key_alias_type_to_yojson x.certificate_authority_public_key_identifier) );
      ("PublicKeyCertificate", Some (certificate_type_to_yojson x.public_key_certificate));
      ("KeyAttributes", Some (key_attributes_to_yojson x.key_attributes));
    ]

let tr34_wrapped_key_block_to_yojson = string_to_yojson

let tr34_key_block_format_to_yojson (x : tr34_key_block_format) =
  match x with X9_TR34_2012 -> `String "X9_TR34_2012"

let tr31_wrapped_key_block_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_resource_output_to_yojson = unit_to_yojson

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_to_yojson x.tags));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let symmetric_key_algorithm_to_yojson (x : symmetric_key_algorithm) =
  match x with
  | HMAC_SHA224 -> `String "HMAC_SHA224"
  | HMAC_SHA512 -> `String "HMAC_SHA512"
  | HMAC_SHA384 -> `String "HMAC_SHA384"
  | HMAC_SHA256 -> `String "HMAC_SHA256"
  | AES_256 -> `String "AES_256"
  | AES_192 -> `String "AES_192"
  | AES_128 -> `String "AES_128"
  | TDES_3KEY -> `String "TDES_3KEY"
  | TDES_2KEY -> `String "TDES_2KEY"

let key_state_to_yojson (x : key_state) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | DELETE_PENDING -> `String "DELETE_PENDING"
  | DELETE_COMPLETE -> `String "DELETE_COMPLETE"

let key_origin_to_yojson (x : key_origin) =
  match x with
  | EXTERNAL -> `String "EXTERNAL"
  | AWS_PAYMENT_CRYPTOGRAPHY -> `String "AWS_PAYMENT_CRYPTOGRAPHY"

let derive_key_usage_to_yojson (x : derive_key_usage) =
  match x with
  | TR31_B0_BASE_DERIVATION_KEY -> `String "TR31_B0_BASE_DERIVATION_KEY"
  | TR31_C0_CARD_VERIFICATION_KEY -> `String "TR31_C0_CARD_VERIFICATION_KEY"
  | TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY -> `String "TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY"
  | TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS -> `String "TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS"
  | TR31_E1_EMV_MKEY_CONFIDENTIALITY -> `String "TR31_E1_EMV_MKEY_CONFIDENTIALITY"
  | TR31_E2_EMV_MKEY_INTEGRITY -> `String "TR31_E2_EMV_MKEY_INTEGRITY"
  | TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS -> `String "TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS"
  | TR31_E5_EMV_MKEY_CARD_PERSONALIZATION -> `String "TR31_E5_EMV_MKEY_CARD_PERSONALIZATION"
  | TR31_E6_EMV_MKEY_OTHER -> `String "TR31_E6_EMV_MKEY_OTHER"
  | TR31_K0_KEY_ENCRYPTION_KEY -> `String "TR31_K0_KEY_ENCRYPTION_KEY"
  | TR31_K1_KEY_BLOCK_PROTECTION_KEY -> `String "TR31_K1_KEY_BLOCK_PROTECTION_KEY"
  | TR31_M3_ISO_9797_3_MAC_KEY -> `String "TR31_M3_ISO_9797_3_MAC_KEY"
  | TR31_M1_ISO_9797_1_MAC_KEY -> `String "TR31_M1_ISO_9797_1_MAC_KEY"
  | TR31_M6_ISO_9797_5_CMAC_KEY -> `String "TR31_M6_ISO_9797_5_CMAC_KEY"
  | TR31_M7_HMAC_KEY -> `String "TR31_M7_HMAC_KEY"
  | TR31_P0_PIN_ENCRYPTION_KEY -> `String "TR31_P0_PIN_ENCRYPTION_KEY"
  | TR31_P1_PIN_GENERATION_KEY -> `String "TR31_P1_PIN_GENERATION_KEY"
  | TR31_V1_IBM3624_PIN_VERIFICATION_KEY -> `String "TR31_V1_IBM3624_PIN_VERIFICATION_KEY"
  | TR31_V2_VISA_PIN_VERIFICATION_KEY -> `String "TR31_V2_VISA_PIN_VERIFICATION_KEY"

let multi_region_key_type_to_yojson (x : multi_region_key_type) =
  match x with PRIMARY -> `String "PRIMARY" | REPLICA -> `String "REPLICA"

let region_to_yojson = string_to_yojson

let key_replication_state_to_yojson (x : key_replication_state) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SYNCHRONIZED -> `String "SYNCHRONIZED"

let replication_status_type_to_yojson (x : replication_status_type) =
  assoc_to_yojson
    [
      ( "StatusMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_message );
      ("Status", Some (key_replication_state_to_yojson x.status));
    ]

let replication_status_to_yojson tree =
  map_to_yojson region_to_yojson replication_status_type_to_yojson tree

let mpa_session_arn_to_yojson = string_to_yojson

let session_status_to_yojson (x : session_status) =
  match x with
  | PENDING -> `String "PENDING"
  | APPROVED -> `String "APPROVED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"

let mpa_status_message_to_yojson = string_to_yojson

let mpa_status_to_yojson (x : mpa_status) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson mpa_status_message_to_yojson x.status_message);
      ("InitiationDate", Some (timestamp_to_yojson x.initiation_date));
      ("Status", Some (session_status_to_yojson x.status));
      ("MpaSessionArn", Some (mpa_session_arn_to_yojson x.mpa_session_arn));
    ]

let key_to_yojson (x : key) =
  assoc_to_yojson
    [
      ("MpaStatus", option_to_yojson mpa_status_to_yojson x.mpa_status);
      ( "UsingDefaultReplicationRegions",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.using_default_replication_regions );
      ("ReplicationStatus", option_to_yojson replication_status_to_yojson x.replication_status);
      ("PrimaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ( "MultiRegionKeyType",
        option_to_yojson multi_region_key_type_to_yojson x.multi_region_key_type );
      ("DeriveKeyUsage", option_to_yojson derive_key_usage_to_yojson x.derive_key_usage);
      ("DeleteTimestamp", option_to_yojson timestamp_to_yojson x.delete_timestamp);
      ("DeletePendingTimestamp", option_to_yojson timestamp_to_yojson x.delete_pending_timestamp);
      ("UsageStopTimestamp", option_to_yojson timestamp_to_yojson x.usage_stop_timestamp);
      ("UsageStartTimestamp", option_to_yojson timestamp_to_yojson x.usage_start_timestamp);
      ("CreateTimestamp", Some (timestamp_to_yojson x.create_timestamp));
      ("KeyOrigin", Some (key_origin_to_yojson x.key_origin));
      ("KeyState", Some (key_state_to_yojson x.key_state));
      ("Exportable", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.exportable));
      ("Enabled", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled));
      ( "KeyCheckValueAlgorithm",
        Some (key_check_value_algorithm_to_yojson x.key_check_value_algorithm) );
      ("KeyCheckValue", Some (key_check_value_to_yojson x.key_check_value));
      ("KeyAttributes", Some (key_attributes_to_yojson x.key_attributes));
      ("KeyArn", Some (key_arn_to_yojson x.key_arn));
    ]

let stop_key_usage_output_to_yojson (x : stop_key_usage_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let stop_key_usage_input_to_yojson (x : stop_key_usage_input) =
  assoc_to_yojson [ ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier)) ]

let start_key_usage_output_to_yojson (x : start_key_usage_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let start_key_usage_input_to_yojson (x : start_key_usage_input) =
  assoc_to_yojson [ ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier)) ]

let signing_algorithm_type_to_yojson (x : signing_algorithm_type) =
  match x with
  | SHA224 -> `String "SHA224"
  | SHA256 -> `String "SHA256"
  | SHA384 -> `String "SHA384"
  | SHA512 -> `String "SHA512"

let shared_information_to_yojson = string_to_yojson

let root_certificate_public_key_to_yojson (x : root_certificate_public_key) =
  assoc_to_yojson
    [
      ("PublicKeyCertificate", Some (certificate_type_to_yojson x.public_key_certificate));
      ("KeyAttributes", Some (key_attributes_to_yojson x.key_attributes));
    ]

let restore_key_output_to_yojson (x : restore_key_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let restore_key_input_to_yojson (x : restore_key_input) =
  assoc_to_yojson [ ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier)) ]

let resource_policy_to_yojson = string_to_yojson

let remove_key_replication_regions_output_to_yojson (x : remove_key_replication_regions_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let regions_to_yojson tree = list_to_yojson region_to_yojson tree

let remove_key_replication_regions_input_to_yojson (x : remove_key_replication_regions_input) =
  assoc_to_yojson
    [
      ("ReplicationRegions", Some (regions_to_yojson x.replication_regions));
      ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier));
    ]

let put_resource_policy_output_to_yojson (x : put_resource_policy_output) =
  assoc_to_yojson
    [
      ("Policy", Some (resource_policy_to_yojson x.policy));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let put_resource_policy_input_to_yojson (x : put_resource_policy_input) =
  assoc_to_yojson
    [
      ("Policy", Some (resource_policy_to_yojson x.policy));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let public_policy_exception_to_yojson (x : public_policy_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let next_token_to_yojson = string_to_yojson

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let import_key_output_to_yojson (x : import_key_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let import_tr31_key_block_to_yojson (x : import_tr31_key_block) =
  assoc_to_yojson
    [
      ("WrappedKeyBlock", Some (tr31_wrapped_key_block_to_yojson x.wrapped_key_block));
      ("WrappingKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.wrapping_key_identifier));
    ]

let import_token_id_to_yojson = string_to_yojson
let even_hex_length_between16_and32_to_yojson = string_to_yojson

let import_tr34_key_block_to_yojson (x : import_tr34_key_block) =
  assoc_to_yojson
    [
      ("RandomNonce", option_to_yojson even_hex_length_between16_and32_to_yojson x.random_nonce);
      ("KeyBlockFormat", Some (tr34_key_block_format_to_yojson x.key_block_format));
      ("WrappedKeyBlock", Some (tr34_wrapped_key_block_to_yojson x.wrapped_key_block));
      ( "WrappingKeyCertificate",
        option_to_yojson certificate_type_to_yojson x.wrapping_key_certificate );
      ( "WrappingKeyIdentifier",
        option_to_yojson key_arn_or_key_alias_type_to_yojson x.wrapping_key_identifier );
      ("ImportToken", option_to_yojson import_token_id_to_yojson x.import_token);
      ("SigningKeyCertificate", Some (certificate_type_to_yojson x.signing_key_certificate));
      ( "CertificateAuthorityPublicKeyIdentifier",
        Some (key_arn_or_key_alias_type_to_yojson x.certificate_authority_public_key_identifier) );
    ]

let import_key_cryptogram_to_yojson (x : import_key_cryptogram) =
  assoc_to_yojson
    [
      ("WrappingSpec", option_to_yojson wrapping_key_spec_to_yojson x.wrapping_spec);
      ("ImportToken", Some (import_token_id_to_yojson x.import_token));
      ("WrappedKeyCryptogram", Some (wrapped_key_cryptogram_to_yojson x.wrapped_key_cryptogram));
      ("Exportable", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.exportable));
      ("KeyAttributes", Some (key_attributes_to_yojson x.key_attributes));
    ]

let key_derivation_function_to_yojson (x : key_derivation_function) =
  match x with ANSI_X963 -> `String "ANSI_X963" | NIST_SP800 -> `String "NIST_SP800"

let key_derivation_hash_algorithm_to_yojson (x : key_derivation_hash_algorithm) =
  match x with
  | SHA_512 -> `String "SHA_512"
  | SHA_384 -> `String "SHA_384"
  | SHA_256 -> `String "SHA_256"

let diffie_hellman_derivation_data_to_yojson (x : diffie_hellman_derivation_data) =
  match x with
  | SharedInformation arg ->
      assoc_to_yojson [ ("SharedInformation", Some (shared_information_to_yojson arg)) ]

let import_diffie_hellman_tr31_key_block_to_yojson (x : import_diffie_hellman_tr31_key_block) =
  assoc_to_yojson
    [
      ("WrappedKeyBlock", Some (tr31_wrapped_key_block_to_yojson x.wrapped_key_block));
      ("DerivationData", Some (diffie_hellman_derivation_data_to_yojson x.derivation_data));
      ( "KeyDerivationHashAlgorithm",
        Some (key_derivation_hash_algorithm_to_yojson x.key_derivation_hash_algorithm) );
      ("KeyDerivationFunction", Some (key_derivation_function_to_yojson x.key_derivation_function));
      ("DeriveKeyAlgorithm", Some (symmetric_key_algorithm_to_yojson x.derive_key_algorithm));
      ("PublicKeyCertificate", Some (certificate_type_to_yojson x.public_key_certificate));
      ( "CertificateAuthorityPublicKeyIdentifier",
        Some (key_arn_or_key_alias_type_to_yojson x.certificate_authority_public_key_identifier) );
      ("PrivateKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.private_key_identifier));
    ]

let as2805_key_variant_to_yojson (x : as2805_key_variant) =
  match x with
  | DATA_ENCRYPTION_KEY_VARIANT_22 -> `String "DATA_ENCRYPTION_KEY_VARIANT_22"
  | MESSAGE_AUTHENTICATION_KEY_VARIANT_24 -> `String "MESSAGE_AUTHENTICATION_KEY_VARIANT_24"
  | PIN_ENCRYPTION_KEY_VARIANT_28 -> `String "PIN_ENCRYPTION_KEY_VARIANT_28"
  | TERMINAL_MAJOR_KEY_VARIANT_00 -> `String "TERMINAL_MAJOR_KEY_VARIANT_00"

let import_as2805_key_cryptogram_to_yojson (x : import_as2805_key_cryptogram) =
  assoc_to_yojson
    [
      ("WrappedKeyCryptogram", Some (wrapped_key_cryptogram_to_yojson x.wrapped_key_cryptogram));
      ("WrappingKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.wrapping_key_identifier));
      ("Exportable", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.exportable));
      ("KeyAlgorithm", Some (key_algorithm_to_yojson x.key_algorithm));
      ("KeyModesOfUse", Some (key_modes_of_use_to_yojson x.key_modes_of_use));
      ("As2805KeyVariant", Some (as2805_key_variant_to_yojson x.as2805_key_variant));
    ]

let import_key_material_to_yojson (x : import_key_material) =
  match x with
  | As2805KeyCryptogram arg ->
      assoc_to_yojson [ ("As2805KeyCryptogram", Some (import_as2805_key_cryptogram_to_yojson arg)) ]
  | DiffieHellmanTr31KeyBlock arg ->
      assoc_to_yojson
        [ ("DiffieHellmanTr31KeyBlock", Some (import_diffie_hellman_tr31_key_block_to_yojson arg)) ]
  | KeyCryptogram arg ->
      assoc_to_yojson [ ("KeyCryptogram", Some (import_key_cryptogram_to_yojson arg)) ]
  | Tr34KeyBlock arg ->
      assoc_to_yojson [ ("Tr34KeyBlock", Some (import_tr34_key_block_to_yojson arg)) ]
  | Tr31KeyBlock arg ->
      assoc_to_yojson [ ("Tr31KeyBlock", Some (import_tr31_key_block_to_yojson arg)) ]
  | TrustedCertificatePublicKey arg ->
      assoc_to_yojson
        [ ("TrustedCertificatePublicKey", Some (trusted_certificate_public_key_to_yojson arg)) ]
  | RootCertificatePublicKey arg ->
      assoc_to_yojson
        [ ("RootCertificatePublicKey", Some (root_certificate_public_key_to_yojson arg)) ]

let mpa_requester_comment_to_yojson = string_to_yojson

let import_key_input_to_yojson (x : import_key_input) =
  assoc_to_yojson
    [
      ("RequesterComment", option_to_yojson mpa_requester_comment_to_yojson x.requester_comment);
      ("ReplicationRegions", option_to_yojson regions_to_yojson x.replication_regions);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ( "KeyCheckValueAlgorithm",
        option_to_yojson key_check_value_algorithm_to_yojson x.key_check_value_algorithm );
      ("KeyMaterial", Some (import_key_material_to_yojson x.key_material));
    ]

let get_resource_policy_output_to_yojson (x : get_resource_policy_output) =
  assoc_to_yojson
    [
      ("Policy", Some (resource_policy_to_yojson x.policy));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let get_resource_policy_input_to_yojson (x : get_resource_policy_input) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let get_public_key_certificate_output_to_yojson (x : get_public_key_certificate_output) =
  assoc_to_yojson
    [
      ("KeyCertificateChain", Some (certificate_type_to_yojson x.key_certificate_chain));
      ("KeyCertificate", Some (certificate_type_to_yojson x.key_certificate));
    ]

let get_public_key_certificate_input_to_yojson (x : get_public_key_certificate_input) =
  assoc_to_yojson [ ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier)) ]

let get_parameters_for_import_output_to_yojson (x : get_parameters_for_import_output) =
  assoc_to_yojson
    [
      ( "ParametersValidUntilTimestamp",
        Some (timestamp_to_yojson x.parameters_valid_until_timestamp) );
      ("ImportToken", Some (import_token_id_to_yojson x.import_token));
      ("WrappingKeyAlgorithm", Some (key_algorithm_to_yojson x.wrapping_key_algorithm));
      ( "WrappingKeyCertificateChain",
        Some (certificate_type_to_yojson x.wrapping_key_certificate_chain) );
      ("WrappingKeyCertificate", Some (certificate_type_to_yojson x.wrapping_key_certificate));
    ]

let key_material_type_to_yojson (x : key_material_type) =
  match x with
  | TR34_KEY_BLOCK -> `String "TR34_KEY_BLOCK"
  | TR31_KEY_BLOCK -> `String "TR31_KEY_BLOCK"
  | ROOT_PUBLIC_KEY_CERTIFICATE -> `String "ROOT_PUBLIC_KEY_CERTIFICATE"
  | TRUSTED_PUBLIC_KEY_CERTIFICATE -> `String "TRUSTED_PUBLIC_KEY_CERTIFICATE"
  | KEY_CRYPTOGRAM -> `String "KEY_CRYPTOGRAM"

let get_parameters_for_import_input_to_yojson (x : get_parameters_for_import_input) =
  assoc_to_yojson
    [
      ( "ReuseLastGeneratedToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.reuse_last_generated_token );
      ("WrappingKeyAlgorithm", Some (key_algorithm_to_yojson x.wrapping_key_algorithm));
      ("KeyMaterialType", Some (key_material_type_to_yojson x.key_material_type));
    ]

let export_token_id_to_yojson = string_to_yojson

let get_parameters_for_export_output_to_yojson (x : get_parameters_for_export_output) =
  assoc_to_yojson
    [
      ( "ParametersValidUntilTimestamp",
        Some (timestamp_to_yojson x.parameters_valid_until_timestamp) );
      ("ExportToken", Some (export_token_id_to_yojson x.export_token));
      ("SigningKeyAlgorithm", Some (key_algorithm_to_yojson x.signing_key_algorithm));
      ( "SigningKeyCertificateChain",
        Some (certificate_type_to_yojson x.signing_key_certificate_chain) );
      ("SigningKeyCertificate", Some (certificate_type_to_yojson x.signing_key_certificate));
    ]

let get_parameters_for_export_input_to_yojson (x : get_parameters_for_export_input) =
  assoc_to_yojson
    [
      ( "ReuseLastGeneratedToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.reuse_last_generated_token );
      ("SigningKeyAlgorithm", Some (key_algorithm_to_yojson x.signing_key_algorithm));
      ("KeyMaterialType", Some (key_material_type_to_yojson x.key_material_type));
    ]

let mpa_operation_to_yojson (x : mpa_operation) =
  match x with IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE -> `String "IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE"

let mpa_team_arn_to_yojson = string_to_yojson

let association_state_to_yojson (x : association_state) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | UPDATE_PENDING -> `String "UPDATE_PENDING"
  | DELETE_PENDING -> `String "DELETE_PENDING"

let mpa_team_association_to_yojson (x : mpa_team_association) =
  assoc_to_yojson
    [
      ("MpaStatus", option_to_yojson mpa_status_to_yojson x.mpa_status);
      ("AssociationState", Some (association_state_to_yojson x.association_state));
      ("MpaTeamArn", Some (mpa_team_arn_to_yojson x.mpa_team_arn));
      ("Action", Some (mpa_operation_to_yojson x.action));
    ]

let get_mpa_team_association_output_to_yojson (x : get_mpa_team_association_output) =
  assoc_to_yojson
    [ ("MpaTeamAssociation", Some (mpa_team_association_to_yojson x.mpa_team_association)) ]

let get_mpa_team_association_input_to_yojson (x : get_mpa_team_association_input) =
  assoc_to_yojson [ ("Action", Some (mpa_operation_to_yojson x.action)) ]

let get_default_key_replication_regions_output_to_yojson
    (x : get_default_key_replication_regions_output) =
  assoc_to_yojson
    [ ("EnabledReplicationRegions", Some (regions_to_yojson x.enabled_replication_regions)) ]

let get_default_key_replication_regions_input_to_yojson = unit_to_yojson
let certificate_signing_request_type_to_yojson = string_to_yojson

let get_certificate_signing_request_output_to_yojson (x : get_certificate_signing_request_output) =
  assoc_to_yojson
    [
      ( "CertificateSigningRequest",
        Some (certificate_signing_request_type_to_yojson x.certificate_signing_request) );
    ]

let certificate_subject_type_to_yojson (x : certificate_subject_type) =
  assoc_to_yojson
    [
      ( "EmailAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.email_address );
      ( "StateOrProvince",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.state_or_province
      );
      ("Country", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.country);
      ("City", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.city);
      ( "Organization",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.organization );
      ( "OrganizationUnit",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.organization_unit
      );
      ("CommonName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.common_name));
    ]

let get_certificate_signing_request_input_to_yojson (x : get_certificate_signing_request_input) =
  assoc_to_yojson
    [
      ("CertificateSubject", Some (certificate_subject_type_to_yojson x.certificate_subject));
      ("SigningAlgorithm", Some (signing_algorithm_type_to_yojson x.signing_algorithm));
      ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier));
    ]

let export_key_output_to_yojson (x : export_key_output) =
  assoc_to_yojson [ ("WrappedKey", option_to_yojson wrapped_key_to_yojson x.wrapped_key) ]

let key_exportability_to_yojson (x : key_exportability) =
  match x with
  | EXPORTABLE -> `String "EXPORTABLE"
  | NON_EXPORTABLE -> `String "NON_EXPORTABLE"
  | SENSITIVE -> `String "SENSITIVE"

let key_version_to_yojson = string_to_yojson
let optional_block_value_to_yojson = string_to_yojson
let optional_block_id_to_yojson = string_to_yojson

let optional_blocks_to_yojson tree =
  map_to_yojson optional_block_id_to_yojson optional_block_value_to_yojson tree

let key_block_headers_to_yojson (x : key_block_headers) =
  assoc_to_yojson
    [
      ("OptionalBlocks", option_to_yojson optional_blocks_to_yojson x.optional_blocks);
      ("KeyVersion", option_to_yojson key_version_to_yojson x.key_version);
      ("KeyExportability", option_to_yojson key_exportability_to_yojson x.key_exportability);
      ("KeyModesOfUse", option_to_yojson key_modes_of_use_to_yojson x.key_modes_of_use);
    ]

let export_tr31_key_block_to_yojson (x : export_tr31_key_block) =
  assoc_to_yojson
    [
      ("KeyBlockHeaders", option_to_yojson key_block_headers_to_yojson x.key_block_headers);
      ("WrappingKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.wrapping_key_identifier));
    ]

let export_tr34_key_block_to_yojson (x : export_tr34_key_block) =
  assoc_to_yojson
    [
      ("KeyBlockHeaders", option_to_yojson key_block_headers_to_yojson x.key_block_headers);
      ("RandomNonce", option_to_yojson even_hex_length_between16_and32_to_yojson x.random_nonce);
      ("KeyBlockFormat", Some (tr34_key_block_format_to_yojson x.key_block_format));
      ( "SigningKeyCertificate",
        option_to_yojson certificate_type_to_yojson x.signing_key_certificate );
      ( "SigningKeyIdentifier",
        option_to_yojson key_arn_or_key_alias_type_to_yojson x.signing_key_identifier );
      ("ExportToken", option_to_yojson export_token_id_to_yojson x.export_token);
      ("WrappingKeyCertificate", Some (certificate_type_to_yojson x.wrapping_key_certificate));
      ( "CertificateAuthorityPublicKeyIdentifier",
        Some (key_arn_or_key_alias_type_to_yojson x.certificate_authority_public_key_identifier) );
    ]

let export_key_cryptogram_to_yojson (x : export_key_cryptogram) =
  assoc_to_yojson
    [
      ("WrappingSpec", option_to_yojson wrapping_key_spec_to_yojson x.wrapping_spec);
      ("WrappingKeyCertificate", Some (certificate_type_to_yojson x.wrapping_key_certificate));
      ( "CertificateAuthorityPublicKeyIdentifier",
        Some (key_arn_or_key_alias_type_to_yojson x.certificate_authority_public_key_identifier) );
    ]

let export_diffie_hellman_tr31_key_block_to_yojson (x : export_diffie_hellman_tr31_key_block) =
  assoc_to_yojson
    [
      ("KeyBlockHeaders", option_to_yojson key_block_headers_to_yojson x.key_block_headers);
      ("DerivationData", Some (diffie_hellman_derivation_data_to_yojson x.derivation_data));
      ( "KeyDerivationHashAlgorithm",
        Some (key_derivation_hash_algorithm_to_yojson x.key_derivation_hash_algorithm) );
      ("KeyDerivationFunction", Some (key_derivation_function_to_yojson x.key_derivation_function));
      ("DeriveKeyAlgorithm", Some (symmetric_key_algorithm_to_yojson x.derive_key_algorithm));
      ("PublicKeyCertificate", Some (certificate_type_to_yojson x.public_key_certificate));
      ( "CertificateAuthorityPublicKeyIdentifier",
        Some (key_arn_or_key_alias_type_to_yojson x.certificate_authority_public_key_identifier) );
      ("PrivateKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.private_key_identifier));
    ]

let export_as2805_key_cryptogram_to_yojson (x : export_as2805_key_cryptogram) =
  assoc_to_yojson
    [
      ("As2805KeyVariant", Some (as2805_key_variant_to_yojson x.as2805_key_variant));
      ("WrappingKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.wrapping_key_identifier));
    ]

let export_key_material_to_yojson (x : export_key_material) =
  match x with
  | As2805KeyCryptogram arg ->
      assoc_to_yojson [ ("As2805KeyCryptogram", Some (export_as2805_key_cryptogram_to_yojson arg)) ]
  | DiffieHellmanTr31KeyBlock arg ->
      assoc_to_yojson
        [ ("DiffieHellmanTr31KeyBlock", Some (export_diffie_hellman_tr31_key_block_to_yojson arg)) ]
  | KeyCryptogram arg ->
      assoc_to_yojson [ ("KeyCryptogram", Some (export_key_cryptogram_to_yojson arg)) ]
  | Tr34KeyBlock arg ->
      assoc_to_yojson [ ("Tr34KeyBlock", Some (export_tr34_key_block_to_yojson arg)) ]
  | Tr31KeyBlock arg ->
      assoc_to_yojson [ ("Tr31KeyBlock", Some (export_tr31_key_block_to_yojson arg)) ]

let hex_length20_or24_to_yojson = string_to_yojson

let export_dukpt_initial_key_to_yojson (x : export_dukpt_initial_key) =
  assoc_to_yojson [ ("KeySerialNumber", Some (hex_length20_or24_to_yojson x.key_serial_number)) ]

let export_attributes_to_yojson (x : export_attributes) =
  assoc_to_yojson
    [
      ( "KeyCheckValueAlgorithm",
        option_to_yojson key_check_value_algorithm_to_yojson x.key_check_value_algorithm );
      ( "ExportDukptInitialKey",
        option_to_yojson export_dukpt_initial_key_to_yojson x.export_dukpt_initial_key );
    ]

let export_key_input_to_yojson (x : export_key_input) =
  assoc_to_yojson
    [
      ("ExportAttributes", option_to_yojson export_attributes_to_yojson x.export_attributes);
      ("ExportKeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.export_key_identifier));
      ("KeyMaterial", Some (export_key_material_to_yojson x.key_material));
    ]

let enable_default_key_replication_regions_output_to_yojson
    (x : enable_default_key_replication_regions_output) =
  assoc_to_yojson
    [ ("EnabledReplicationRegions", Some (regions_to_yojson x.enabled_replication_regions)) ]

let enable_default_key_replication_regions_input_to_yojson
    (x : enable_default_key_replication_regions_input) =
  assoc_to_yojson [ ("ReplicationRegions", Some (regions_to_yojson x.replication_regions)) ]

let disassociate_mpa_team_output_to_yojson (x : disassociate_mpa_team_output) =
  assoc_to_yojson
    [ ("MpaTeamAssociation", Some (mpa_team_association_to_yojson x.mpa_team_association)) ]

let disassociate_mpa_team_input_to_yojson (x : disassociate_mpa_team_input) =
  assoc_to_yojson
    [
      ("RequesterComment", option_to_yojson mpa_requester_comment_to_yojson x.requester_comment);
      ("Action", Some (mpa_operation_to_yojson x.action));
    ]

let disable_default_key_replication_regions_output_to_yojson
    (x : disable_default_key_replication_regions_output) =
  assoc_to_yojson
    [ ("EnabledReplicationRegions", Some (regions_to_yojson x.enabled_replication_regions)) ]

let disable_default_key_replication_regions_input_to_yojson
    (x : disable_default_key_replication_regions_input) =
  assoc_to_yojson [ ("ReplicationRegions", Some (regions_to_yojson x.replication_regions)) ]

let delete_resource_policy_output_to_yojson = unit_to_yojson

let delete_resource_policy_input_to_yojson (x : delete_resource_policy_input) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let associate_mpa_team_output_to_yojson (x : associate_mpa_team_output) =
  assoc_to_yojson
    [ ("MpaTeamAssociation", Some (mpa_team_association_to_yojson x.mpa_team_association)) ]

let associate_mpa_team_input_to_yojson (x : associate_mpa_team_input) =
  assoc_to_yojson
    [
      ("RequesterComment", option_to_yojson mpa_requester_comment_to_yojson x.requester_comment);
      ("MpaTeamArn", Some (mpa_team_arn_to_yojson x.mpa_team_arn));
      ("Action", Some (mpa_operation_to_yojson x.action));
    ]

let key_summary_to_yojson (x : key_summary) =
  assoc_to_yojson
    [
      ("PrimaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ( "MultiRegionKeyType",
        option_to_yojson multi_region_key_type_to_yojson x.multi_region_key_type );
      ("Enabled", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled));
      ("Exportable", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.exportable));
      ("KeyCheckValue", Some (key_check_value_to_yojson x.key_check_value));
      ("KeyAttributes", Some (key_attributes_to_yojson x.key_attributes));
      ("KeyState", Some (key_state_to_yojson x.key_state));
      ("KeyArn", Some (key_arn_to_yojson x.key_arn));
    ]

let key_summary_list_to_yojson tree = list_to_yojson key_summary_to_yojson tree

let list_keys_output_to_yojson (x : list_keys_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Keys", Some (key_summary_list_to_yojson x.keys));
    ]

let list_keys_input_to_yojson (x : list_keys_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("KeyState", option_to_yojson key_state_to_yojson x.key_state);
    ]

let aliases_to_yojson tree = list_to_yojson alias_to_yojson tree

let list_aliases_output_to_yojson (x : list_aliases_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Aliases", Some (aliases_to_yojson x.aliases));
    ]

let list_aliases_input_to_yojson (x : list_aliases_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("KeyArn", option_to_yojson key_arn_to_yojson x.key_arn);
    ]

let get_key_output_to_yojson (x : get_key_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let get_key_input_to_yojson (x : get_key_input) =
  assoc_to_yojson [ ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier)) ]

let get_alias_output_to_yojson (x : get_alias_output) =
  assoc_to_yojson [ ("Alias", Some (alias_to_yojson x.alias)) ]

let get_alias_input_to_yojson (x : get_alias_input) =
  assoc_to_yojson [ ("AliasName", Some (alias_name_to_yojson x.alias_name)) ]

let delete_key_output_to_yojson (x : delete_key_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let delete_key_input_to_yojson (x : delete_key_input) =
  assoc_to_yojson
    [
      ( "DeleteKeyInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.delete_key_in_days );
      ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier));
    ]

let delete_alias_output_to_yojson = unit_to_yojson

let delete_alias_input_to_yojson (x : delete_alias_input) =
  assoc_to_yojson [ ("AliasName", Some (alias_name_to_yojson x.alias_name)) ]

let create_key_output_to_yojson (x : create_key_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let create_key_input_to_yojson (x : create_key_input) =
  assoc_to_yojson
    [
      ("ReplicationRegions", option_to_yojson regions_to_yojson x.replication_regions);
      ("DeriveKeyUsage", option_to_yojson derive_key_usage_to_yojson x.derive_key_usage);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ("Exportable", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.exportable));
      ( "KeyCheckValueAlgorithm",
        option_to_yojson key_check_value_algorithm_to_yojson x.key_check_value_algorithm );
      ("KeyAttributes", Some (key_attributes_to_yojson x.key_attributes));
    ]

let create_alias_output_to_yojson (x : create_alias_output) =
  assoc_to_yojson [ ("Alias", Some (alias_to_yojson x.alias)) ]

let create_alias_input_to_yojson (x : create_alias_input) =
  assoc_to_yojson
    [
      ("KeyArn", option_to_yojson key_arn_to_yojson x.key_arn);
      ("AliasName", Some (alias_name_to_yojson x.alias_name));
    ]

let add_key_replication_regions_output_to_yojson (x : add_key_replication_regions_output) =
  assoc_to_yojson [ ("Key", Some (key_to_yojson x.key)) ]

let add_key_replication_regions_input_to_yojson (x : add_key_replication_regions_input) =
  assoc_to_yojson
    [
      ("ReplicationRegions", Some (regions_to_yojson x.replication_regions));
      ("KeyIdentifier", Some (key_arn_or_key_alias_type_to_yojson x.key_identifier));
    ]
