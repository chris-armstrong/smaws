open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_policy_exception_to_yojson (x : invalid_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_args_exception_to_yojson (x : invalid_args_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let certificate_authority_status_to_yojson (x : certificate_authority_status) =
  match x with
  | CREATING -> `String "CREATING"
  | PENDING_CERTIFICATE -> `String "PENDING_CERTIFICATE"
  | ACTIVE -> `String "ACTIVE"
  | DELETED -> `String "DELETED"
  | DISABLED -> `String "DISABLED"
  | EXPIRED -> `String "EXPIRED"
  | FAILED -> `String "FAILED"

let cname_string_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let ocsp_configuration_to_yojson (x : ocsp_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean__to_yojson x.enabled));
      ("OcspCustomCname", option_to_yojson cname_string_to_yojson x.ocsp_custom_cname);
    ]

let crl_path_string_to_yojson = string_to_yojson

let crl_type_to_yojson (x : crl_type) =
  match x with COMPLETE -> `String "COMPLETE" | PARTITIONED -> `String "PARTITIONED"

let crl_distribution_point_extension_configuration_to_yojson
    (x : crl_distribution_point_extension_configuration) =
  assoc_to_yojson [ ("OmitExtension", Some (boolean__to_yojson x.omit_extension)) ]

let s3_object_acl_to_yojson (x : s3_object_acl) =
  match x with
  | PUBLIC_READ -> `String "PUBLIC_READ"
  | BUCKET_OWNER_FULL_CONTROL -> `String "BUCKET_OWNER_FULL_CONTROL"

let s3_bucket_name3_to255_to_yojson = string_to_yojson
let integer1_to5000_to_yojson = int_to_yojson

let crl_configuration_to_yojson (x : crl_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean__to_yojson x.enabled));
      ("ExpirationInDays", option_to_yojson integer1_to5000_to_yojson x.expiration_in_days);
      ("CustomCname", option_to_yojson cname_string_to_yojson x.custom_cname);
      ("S3BucketName", option_to_yojson s3_bucket_name3_to255_to_yojson x.s3_bucket_name);
      ("S3ObjectAcl", option_to_yojson s3_object_acl_to_yojson x.s3_object_acl);
      ( "CrlDistributionPointExtensionConfiguration",
        option_to_yojson crl_distribution_point_extension_configuration_to_yojson
          x.crl_distribution_point_extension_configuration );
      ("CrlType", option_to_yojson crl_type_to_yojson x.crl_type);
      ("CustomPath", option_to_yojson crl_path_string_to_yojson x.custom_path);
    ]

let revocation_configuration_to_yojson (x : revocation_configuration) =
  assoc_to_yojson
    [
      ("CrlConfiguration", option_to_yojson crl_configuration_to_yojson x.crl_configuration);
      ("OcspConfiguration", option_to_yojson ocsp_configuration_to_yojson x.ocsp_configuration);
    ]

let arn_to_yojson = string_to_yojson

let update_certificate_authority_request_to_yojson (x : update_certificate_authority_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ( "RevocationConfiguration",
        option_to_yojson revocation_configuration_to_yojson x.revocation_configuration );
      ("Status", option_to_yojson certificate_authority_status_to_yojson x.status);
    ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let untag_certificate_authority_request_to_yojson (x : untag_certificate_authority_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_certificate_authority_request_to_yojson (x : tag_certificate_authority_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let request_in_progress_exception_to_yojson (x : request_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let request_failed_exception_to_yojson (x : request_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let request_already_processed_exception_to_yojson (x : request_already_processed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let revocation_reason_to_yojson (x : revocation_reason) =
  match x with
  | UNSPECIFIED -> `String "UNSPECIFIED"
  | KEY_COMPROMISE -> `String "KEY_COMPROMISE"
  | CERTIFICATE_AUTHORITY_COMPROMISE -> `String "CERTIFICATE_AUTHORITY_COMPROMISE"
  | AFFILIATION_CHANGED -> `String "AFFILIATION_CHANGED"
  | SUPERSEDED -> `String "SUPERSEDED"
  | CESSATION_OF_OPERATION -> `String "CESSATION_OF_OPERATION"
  | PRIVILEGE_WITHDRAWN -> `String "PRIVILEGE_WITHDRAWN"
  | A_A_COMPROMISE -> `String "A_A_COMPROMISE"

let string128_to_yojson = string_to_yojson

let revoke_certificate_request_to_yojson (x : revoke_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("CertificateSerial", Some (string128_to_yojson x.certificate_serial));
      ("RevocationReason", Some (revocation_reason_to_yojson x.revocation_reason));
    ]

let restore_certificate_authority_request_to_yojson (x : restore_certificate_authority_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let lockout_prevented_exception_to_yojson (x : lockout_prevented_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let aws_policy_to_yojson = string_to_yojson

let put_policy_request_to_yojson (x : put_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("Policy", Some (aws_policy_to_yojson x.policy));
    ]

let next_token_to_yojson = string_to_yojson

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let action_type_to_yojson (x : action_type) =
  match x with
  | IssueCertificate -> `String "IssueCertificate"
  | GetCertificate -> `String "GetCertificate"
  | ListPermissions -> `String "ListPermissions"

let action_list_to_yojson tree = list_to_yojson action_type_to_yojson tree
let account_id_to_yojson = string_to_yojson
let principal_to_yojson = string_to_yojson
let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let permission_to_yojson (x : permission) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("Principal", option_to_yojson principal_to_yojson x.principal);
      ("SourceAccount", option_to_yojson account_id_to_yojson x.source_account);
      ("Actions", option_to_yojson action_list_to_yojson x.actions);
      ("Policy", option_to_yojson aws_policy_to_yojson x.policy);
    ]

let permission_list_to_yojson tree = list_to_yojson permission_to_yojson tree

let list_permissions_response_to_yojson (x : list_permissions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
    ]

let list_permissions_request_to_yojson (x : list_permissions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let certificate_authority_usage_mode_to_yojson (x : certificate_authority_usage_mode) =
  match x with
  | GENERAL_PURPOSE -> `String "GENERAL_PURPOSE"
  | SHORT_LIVED_CERTIFICATE -> `String "SHORT_LIVED_CERTIFICATE"

let key_storage_security_standard_to_yojson (x : key_storage_security_standard) =
  match x with
  | FIPS_140_2_LEVEL_2_OR_HIGHER -> `String "FIPS_140_2_LEVEL_2_OR_HIGHER"
  | FIPS_140_2_LEVEL_3_OR_HIGHER -> `String "FIPS_140_2_LEVEL_3_OR_HIGHER"
  | CCPC_LEVEL_1_OR_HIGHER -> `String "CCPC_LEVEL_1_OR_HIGHER"

let custom_object_identifier_to_yojson = string_to_yojson
let string39_to_yojson = string_to_yojson
let string253_to_yojson = string_to_yojson
let string256_to_yojson = string_to_yojson

let edi_party_name_to_yojson (x : edi_party_name) =
  assoc_to_yojson
    [
      ("PartyName", Some (string256_to_yojson x.party_name));
      ("NameAssigner", option_to_yojson string256_to_yojson x.name_assigner);
    ]

let string1_to256_to_yojson = string_to_yojson

let custom_attribute_to_yojson (x : custom_attribute) =
  assoc_to_yojson
    [
      ("ObjectIdentifier", Some (custom_object_identifier_to_yojson x.object_identifier));
      ("Value", Some (string1_to256_to_yojson x.value));
    ]

let custom_attribute_list_to_yojson tree = list_to_yojson custom_attribute_to_yojson tree
let string3_to_yojson = string_to_yojson
let string5_to_yojson = string_to_yojson
let string16_to_yojson = string_to_yojson
let string40_to_yojson = string_to_yojson
let string64_to_yojson = string_to_yojson
let asn1_printable_string64_to_yojson = string_to_yojson
let country_code_string_to_yojson = string_to_yojson

let asn1_subject_to_yojson (x : asn1_subject) =
  assoc_to_yojson
    [
      ("Country", option_to_yojson country_code_string_to_yojson x.country);
      ("Organization", option_to_yojson string64_to_yojson x.organization);
      ("OrganizationalUnit", option_to_yojson string64_to_yojson x.organizational_unit);
      ( "DistinguishedNameQualifier",
        option_to_yojson asn1_printable_string64_to_yojson x.distinguished_name_qualifier );
      ("State", option_to_yojson string128_to_yojson x.state);
      ("CommonName", option_to_yojson string64_to_yojson x.common_name);
      ("SerialNumber", option_to_yojson asn1_printable_string64_to_yojson x.serial_number);
      ("Locality", option_to_yojson string128_to_yojson x.locality);
      ("Title", option_to_yojson string64_to_yojson x.title);
      ("Surname", option_to_yojson string40_to_yojson x.surname);
      ("GivenName", option_to_yojson string16_to_yojson x.given_name);
      ("Initials", option_to_yojson string5_to_yojson x.initials);
      ("Pseudonym", option_to_yojson string128_to_yojson x.pseudonym);
      ("GenerationQualifier", option_to_yojson string3_to_yojson x.generation_qualifier);
      ("CustomAttributes", option_to_yojson custom_attribute_list_to_yojson x.custom_attributes);
    ]

let other_name_to_yojson (x : other_name) =
  assoc_to_yojson
    [
      ("TypeId", Some (custom_object_identifier_to_yojson x.type_id));
      ("Value", Some (string256_to_yojson x.value));
    ]

let general_name_to_yojson (x : general_name) =
  assoc_to_yojson
    [
      ("OtherName", option_to_yojson other_name_to_yojson x.other_name);
      ("Rfc822Name", option_to_yojson string256_to_yojson x.rfc822_name);
      ("DnsName", option_to_yojson string253_to_yojson x.dns_name);
      ("DirectoryName", option_to_yojson asn1_subject_to_yojson x.directory_name);
      ("EdiPartyName", option_to_yojson edi_party_name_to_yojson x.edi_party_name);
      ( "UniformResourceIdentifier",
        option_to_yojson string253_to_yojson x.uniform_resource_identifier );
      ("IpAddress", option_to_yojson string39_to_yojson x.ip_address);
      ("RegisteredId", option_to_yojson custom_object_identifier_to_yojson x.registered_id);
    ]

let access_method_type_to_yojson (x : access_method_type) =
  match x with
  | CA_REPOSITORY -> `String "CA_REPOSITORY"
  | RESOURCE_PKI_MANIFEST -> `String "RESOURCE_PKI_MANIFEST"
  | RESOURCE_PKI_NOTIFY -> `String "RESOURCE_PKI_NOTIFY"

let access_method_to_yojson (x : access_method) =
  assoc_to_yojson
    [
      ( "CustomObjectIdentifier",
        option_to_yojson custom_object_identifier_to_yojson x.custom_object_identifier );
      ("AccessMethodType", option_to_yojson access_method_type_to_yojson x.access_method_type);
    ]

let access_description_to_yojson (x : access_description) =
  assoc_to_yojson
    [
      ("AccessMethod", Some (access_method_to_yojson x.access_method));
      ("AccessLocation", Some (general_name_to_yojson x.access_location));
    ]

let access_description_list_to_yojson tree = list_to_yojson access_description_to_yojson tree

let key_usage_to_yojson (x : key_usage) =
  assoc_to_yojson
    [
      ("DigitalSignature", option_to_yojson boolean__to_yojson x.digital_signature);
      ("NonRepudiation", option_to_yojson boolean__to_yojson x.non_repudiation);
      ("KeyEncipherment", option_to_yojson boolean__to_yojson x.key_encipherment);
      ("DataEncipherment", option_to_yojson boolean__to_yojson x.data_encipherment);
      ("KeyAgreement", option_to_yojson boolean__to_yojson x.key_agreement);
      ("KeyCertSign", option_to_yojson boolean__to_yojson x.key_cert_sign);
      ("CRLSign", option_to_yojson boolean__to_yojson x.crl_sign);
      ("EncipherOnly", option_to_yojson boolean__to_yojson x.encipher_only);
      ("DecipherOnly", option_to_yojson boolean__to_yojson x.decipher_only);
    ]

let csr_extensions_to_yojson (x : csr_extensions) =
  assoc_to_yojson
    [
      ("KeyUsage", option_to_yojson key_usage_to_yojson x.key_usage);
      ( "SubjectInformationAccess",
        option_to_yojson access_description_list_to_yojson x.subject_information_access );
    ]

let signing_algorithm_to_yojson (x : signing_algorithm) =
  match x with
  | SHA256WITHECDSA -> `String "SHA256WITHECDSA"
  | SHA384WITHECDSA -> `String "SHA384WITHECDSA"
  | SHA512WITHECDSA -> `String "SHA512WITHECDSA"
  | SHA256WITHRSA -> `String "SHA256WITHRSA"
  | SHA384WITHRSA -> `String "SHA384WITHRSA"
  | SHA512WITHRSA -> `String "SHA512WITHRSA"
  | SM3WITHSM2 -> `String "SM3WITHSM2"
  | ML_DSA_44 -> `String "ML_DSA_44"
  | ML_DSA_65 -> `String "ML_DSA_65"
  | ML_DSA_87 -> `String "ML_DSA_87"

let key_algorithm_to_yojson (x : key_algorithm) =
  match x with
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | EC_prime256v1 -> `String "EC_prime256v1"
  | EC_secp384r1 -> `String "EC_secp384r1"
  | EC_secp521r1 -> `String "EC_secp521r1"
  | ML_DSA_44 -> `String "ML_DSA_44"
  | ML_DSA_65 -> `String "ML_DSA_65"
  | ML_DSA_87 -> `String "ML_DSA_87"
  | SM2 -> `String "SM2"

let certificate_authority_configuration_to_yojson (x : certificate_authority_configuration) =
  assoc_to_yojson
    [
      ("KeyAlgorithm", Some (key_algorithm_to_yojson x.key_algorithm));
      ("SigningAlgorithm", Some (signing_algorithm_to_yojson x.signing_algorithm));
      ("Subject", Some (asn1_subject_to_yojson x.subject));
      ("CsrExtensions", option_to_yojson csr_extensions_to_yojson x.csr_extensions);
    ]

let failure_reason_to_yojson (x : failure_reason) =
  match x with
  | REQUEST_TIMED_OUT -> `String "REQUEST_TIMED_OUT"
  | UNSUPPORTED_ALGORITHM -> `String "UNSUPPORTED_ALGORITHM"
  | OTHER -> `String "OTHER"

let certificate_authority_type_to_yojson (x : certificate_authority_type) =
  match x with ROOT -> `String "ROOT" | SUBORDINATE -> `String "SUBORDINATE"

let certificate_authority_to_yojson (x : certificate_authority) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("OwnerAccount", option_to_yojson account_id_to_yojson x.owner_account);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("LastStateChangeAt", option_to_yojson t_stamp_to_yojson x.last_state_change_at);
      ("Type", option_to_yojson certificate_authority_type_to_yojson x.type_);
      ("Serial", option_to_yojson string__to_yojson x.serial);
      ("Status", option_to_yojson certificate_authority_status_to_yojson x.status);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "CertificateAuthorityConfiguration",
        option_to_yojson certificate_authority_configuration_to_yojson
          x.certificate_authority_configuration );
      ( "RevocationConfiguration",
        option_to_yojson revocation_configuration_to_yojson x.revocation_configuration );
      ("RestorableUntil", option_to_yojson t_stamp_to_yojson x.restorable_until);
      ( "KeyStorageSecurityStandard",
        option_to_yojson key_storage_security_standard_to_yojson x.key_storage_security_standard );
      ("UsageMode", option_to_yojson certificate_authority_usage_mode_to_yojson x.usage_mode);
    ]

let certificate_authorities_to_yojson tree = list_to_yojson certificate_authority_to_yojson tree

let list_certificate_authorities_response_to_yojson (x : list_certificate_authorities_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CertificateAuthorities",
        option_to_yojson certificate_authorities_to_yojson x.certificate_authorities );
    ]

let resource_owner_to_yojson (x : resource_owner) =
  match x with SELF -> `String "SELF" | OTHER_ACCOUNTS -> `String "OTHER_ACCOUNTS"

let list_certificate_authorities_request_to_yojson (x : list_certificate_authorities_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceOwner", option_to_yojson resource_owner_to_yojson x.resource_owner);
    ]

let malformed_csr_exception_to_yojson (x : malformed_csr_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let issue_certificate_response_to_yojson (x : issue_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let idempotency_token_to_yojson = string_to_yojson

let validity_period_type_to_yojson (x : validity_period_type) =
  match x with
  | END_DATE -> `String "END_DATE"
  | ABSOLUTE -> `String "ABSOLUTE"
  | DAYS -> `String "DAYS"
  | MONTHS -> `String "MONTHS"
  | YEARS -> `String "YEARS"

let positive_long_to_yojson = long_to_yojson

let validity_to_yojson (x : validity) =
  assoc_to_yojson
    [
      ("Value", Some (positive_long_to_yojson x.value));
      ("Type", Some (validity_period_type_to_yojson x.type_));
    ]

let csr_blob_to_yojson = blob_to_yojson
let base64_string1_to4096_to_yojson = string_to_yojson

let custom_extension_to_yojson (x : custom_extension) =
  assoc_to_yojson
    [
      ("ObjectIdentifier", Some (custom_object_identifier_to_yojson x.object_identifier));
      ("Value", Some (base64_string1_to4096_to_yojson x.value));
      ("Critical", option_to_yojson boolean__to_yojson x.critical);
    ]

let custom_extension_list_to_yojson tree = list_to_yojson custom_extension_to_yojson tree
let general_name_list_to_yojson tree = list_to_yojson general_name_to_yojson tree

let extended_key_usage_type_to_yojson (x : extended_key_usage_type) =
  match x with
  | SERVER_AUTH -> `String "SERVER_AUTH"
  | CLIENT_AUTH -> `String "CLIENT_AUTH"
  | CODE_SIGNING -> `String "CODE_SIGNING"
  | EMAIL_PROTECTION -> `String "EMAIL_PROTECTION"
  | TIME_STAMPING -> `String "TIME_STAMPING"
  | OCSP_SIGNING -> `String "OCSP_SIGNING"
  | SMART_CARD_LOGIN -> `String "SMART_CARD_LOGIN"
  | DOCUMENT_SIGNING -> `String "DOCUMENT_SIGNING"
  | CERTIFICATE_TRANSPARENCY -> `String "CERTIFICATE_TRANSPARENCY"

let extended_key_usage_to_yojson (x : extended_key_usage) =
  assoc_to_yojson
    [
      ( "ExtendedKeyUsageType",
        option_to_yojson extended_key_usage_type_to_yojson x.extended_key_usage_type );
      ( "ExtendedKeyUsageObjectIdentifier",
        option_to_yojson custom_object_identifier_to_yojson x.extended_key_usage_object_identifier
      );
    ]

let extended_key_usage_list_to_yojson tree = list_to_yojson extended_key_usage_to_yojson tree

let qualifier_to_yojson (x : qualifier) =
  assoc_to_yojson [ ("CpsUri", Some (string256_to_yojson x.cps_uri)) ]

let policy_qualifier_id_to_yojson (x : policy_qualifier_id) = match x with CPS -> `String "CPS"

let policy_qualifier_info_to_yojson (x : policy_qualifier_info) =
  assoc_to_yojson
    [
      ("PolicyQualifierId", Some (policy_qualifier_id_to_yojson x.policy_qualifier_id));
      ("Qualifier", Some (qualifier_to_yojson x.qualifier));
    ]

let policy_qualifier_info_list_to_yojson tree = list_to_yojson policy_qualifier_info_to_yojson tree

let policy_information_to_yojson (x : policy_information) =
  assoc_to_yojson
    [
      ("CertPolicyId", Some (custom_object_identifier_to_yojson x.cert_policy_id));
      ("PolicyQualifiers", option_to_yojson policy_qualifier_info_list_to_yojson x.policy_qualifiers);
    ]

let certificate_policy_list_to_yojson tree = list_to_yojson policy_information_to_yojson tree

let extensions_to_yojson (x : extensions) =
  assoc_to_yojson
    [
      ( "CertificatePolicies",
        option_to_yojson certificate_policy_list_to_yojson x.certificate_policies );
      ("ExtendedKeyUsage", option_to_yojson extended_key_usage_list_to_yojson x.extended_key_usage);
      ("KeyUsage", option_to_yojson key_usage_to_yojson x.key_usage);
      ( "SubjectAlternativeNames",
        option_to_yojson general_name_list_to_yojson x.subject_alternative_names );
      ("CustomExtensions", option_to_yojson custom_extension_list_to_yojson x.custom_extensions);
    ]

let api_passthrough_to_yojson (x : api_passthrough) =
  assoc_to_yojson
    [
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
      ("Subject", option_to_yojson asn1_subject_to_yojson x.subject);
    ]

let issue_certificate_request_to_yojson (x : issue_certificate_request) =
  assoc_to_yojson
    [
      ("ApiPassthrough", option_to_yojson api_passthrough_to_yojson x.api_passthrough);
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("Csr", Some (csr_blob_to_yojson x.csr));
      ("SigningAlgorithm", Some (signing_algorithm_to_yojson x.signing_algorithm));
      ("TemplateArn", option_to_yojson arn_to_yojson x.template_arn);
      ("Validity", Some (validity_to_yojson x.validity));
      ("ValidityNotBefore", option_to_yojson validity_to_yojson x.validity_not_before);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
    ]

let malformed_certificate_exception_to_yojson (x : malformed_certificate_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let certificate_mismatch_exception_to_yojson (x : certificate_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let certificate_chain_blob_to_yojson = blob_to_yojson
let certificate_body_blob_to_yojson = blob_to_yojson

let import_certificate_authority_certificate_request_to_yojson
    (x : import_certificate_authority_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("Certificate", Some (certificate_body_blob_to_yojson x.certificate));
      ("CertificateChain", option_to_yojson certificate_chain_blob_to_yojson x.certificate_chain);
    ]

let get_policy_response_to_yojson (x : get_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson aws_policy_to_yojson x.policy) ]

let get_policy_request_to_yojson (x : get_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let csr_body_to_yojson = string_to_yojson

let get_certificate_authority_csr_response_to_yojson (x : get_certificate_authority_csr_response) =
  assoc_to_yojson [ ("Csr", option_to_yojson csr_body_to_yojson x.csr) ]

let get_certificate_authority_csr_request_to_yojson (x : get_certificate_authority_csr_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let certificate_chain_to_yojson = string_to_yojson
let certificate_body_to_yojson = string_to_yojson

let get_certificate_authority_certificate_response_to_yojson
    (x : get_certificate_authority_certificate_response) =
  assoc_to_yojson
    [
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
    ]

let get_certificate_authority_certificate_request_to_yojson
    (x : get_certificate_authority_certificate_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let get_certificate_response_to_yojson (x : get_certificate_response) =
  assoc_to_yojson
    [
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
    ]

let get_certificate_request_to_yojson (x : get_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]

let s3_key_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let audit_report_status_to_yojson (x : audit_report_status) =
  match x with
  | CREATING -> `String "CREATING"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"

let describe_certificate_authority_audit_report_response_to_yojson
    (x : describe_certificate_authority_audit_report_response) =
  assoc_to_yojson
    [
      ("AuditReportStatus", option_to_yojson audit_report_status_to_yojson x.audit_report_status);
      ("S3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
    ]

let audit_report_id_to_yojson = string_to_yojson

let describe_certificate_authority_audit_report_request_to_yojson
    (x : describe_certificate_authority_audit_report_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("AuditReportId", Some (audit_report_id_to_yojson x.audit_report_id));
    ]

let describe_certificate_authority_response_to_yojson (x : describe_certificate_authority_response)
    =
  assoc_to_yojson
    [
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
    ]

let describe_certificate_authority_request_to_yojson (x : describe_certificate_authority_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let delete_policy_request_to_yojson (x : delete_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let delete_permission_request_to_yojson (x : delete_permission_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("Principal", Some (principal_to_yojson x.principal));
      ("SourceAccount", option_to_yojson account_id_to_yojson x.source_account);
    ]

let permanent_deletion_time_in_days_to_yojson = int_to_yojson

let delete_certificate_authority_request_to_yojson (x : delete_certificate_authority_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ( "PermanentDeletionTimeInDays",
        option_to_yojson permanent_deletion_time_in_days_to_yojson x.permanent_deletion_time_in_days
      );
    ]

let permission_already_exists_exception_to_yojson (x : permission_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let create_permission_request_to_yojson (x : create_permission_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("Principal", Some (principal_to_yojson x.principal));
      ("SourceAccount", option_to_yojson account_id_to_yojson x.source_account);
      ("Actions", Some (action_list_to_yojson x.actions));
    ]

let create_certificate_authority_audit_report_response_to_yojson
    (x : create_certificate_authority_audit_report_response) =
  assoc_to_yojson
    [
      ("AuditReportId", option_to_yojson audit_report_id_to_yojson x.audit_report_id);
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
    ]

let audit_report_response_format_to_yojson (x : audit_report_response_format) =
  match x with JSON -> `String "JSON" | CSV -> `String "CSV"

let create_certificate_authority_audit_report_request_to_yojson
    (x : create_certificate_authority_audit_report_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("S3BucketName", Some (s3_bucket_name_to_yojson x.s3_bucket_name));
      ( "AuditReportResponseFormat",
        Some (audit_report_response_format_to_yojson x.audit_report_response_format) );
    ]

let create_certificate_authority_response_to_yojson (x : create_certificate_authority_response) =
  assoc_to_yojson
    [ ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn) ]

let create_certificate_authority_request_to_yojson (x : create_certificate_authority_request) =
  assoc_to_yojson
    [
      ( "CertificateAuthorityConfiguration",
        Some (certificate_authority_configuration_to_yojson x.certificate_authority_configuration)
      );
      ( "RevocationConfiguration",
        option_to_yojson revocation_configuration_to_yojson x.revocation_configuration );
      ( "CertificateAuthorityType",
        Some (certificate_authority_type_to_yojson x.certificate_authority_type) );
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ( "KeyStorageSecurityStandard",
        option_to_yojson key_storage_security_standard_to_yojson x.key_storage_security_standard );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UsageMode", option_to_yojson certificate_authority_usage_mode_to_yojson x.usage_mode);
    ]
