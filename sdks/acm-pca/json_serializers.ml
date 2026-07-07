open Smaws_Lib.Json.SerializeHelpers
open Types

let validity_period_type_to_yojson (x : validity_period_type) =
  match x with
  | YEARS -> `String "YEARS"
  | MONTHS -> `String "MONTHS"
  | DAYS -> `String "DAYS"
  | ABSOLUTE -> `String "ABSOLUTE"
  | END_DATE -> `String "END_DATE"

let positive_long_to_yojson = long_to_yojson

let validity_to_yojson (x : validity) =
  assoc_to_yojson
    [
      ("Type", Some (validity_period_type_to_yojson x.type_));
      ("Value", Some (positive_long_to_yojson x.value));
    ]

let arn_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let integer1_to5000_to_yojson = int_to_yojson
let cname_string_to_yojson = string_to_yojson
let s3_bucket_name3_to255_to_yojson = string_to_yojson

let s3_object_acl_to_yojson (x : s3_object_acl) =
  match x with
  | BUCKET_OWNER_FULL_CONTROL -> `String "BUCKET_OWNER_FULL_CONTROL"
  | PUBLIC_READ -> `String "PUBLIC_READ"

let crl_distribution_point_extension_configuration_to_yojson
    (x : crl_distribution_point_extension_configuration) =
  assoc_to_yojson [ ("OmitExtension", Some (boolean__to_yojson x.omit_extension)) ]

let crl_type_to_yojson (x : crl_type) =
  match x with PARTITIONED -> `String "PARTITIONED" | COMPLETE -> `String "COMPLETE"

let crl_path_string_to_yojson = string_to_yojson

let crl_configuration_to_yojson (x : crl_configuration) =
  assoc_to_yojson
    [
      ("CustomPath", option_to_yojson crl_path_string_to_yojson x.custom_path);
      ("CrlType", option_to_yojson crl_type_to_yojson x.crl_type);
      ( "CrlDistributionPointExtensionConfiguration",
        option_to_yojson crl_distribution_point_extension_configuration_to_yojson
          x.crl_distribution_point_extension_configuration );
      ("S3ObjectAcl", option_to_yojson s3_object_acl_to_yojson x.s3_object_acl);
      ("S3BucketName", option_to_yojson s3_bucket_name3_to255_to_yojson x.s3_bucket_name);
      ("CustomCname", option_to_yojson cname_string_to_yojson x.custom_cname);
      ("ExpirationInDays", option_to_yojson integer1_to5000_to_yojson x.expiration_in_days);
      ("Enabled", Some (boolean__to_yojson x.enabled));
    ]

let ocsp_configuration_to_yojson (x : ocsp_configuration) =
  assoc_to_yojson
    [
      ("OcspCustomCname", option_to_yojson cname_string_to_yojson x.ocsp_custom_cname);
      ("Enabled", Some (boolean__to_yojson x.enabled));
    ]

let revocation_configuration_to_yojson (x : revocation_configuration) =
  assoc_to_yojson
    [
      ("OcspConfiguration", option_to_yojson ocsp_configuration_to_yojson x.ocsp_configuration);
      ("CrlConfiguration", option_to_yojson crl_configuration_to_yojson x.crl_configuration);
    ]

let certificate_authority_status_to_yojson (x : certificate_authority_status) =
  match x with
  | FAILED -> `String "FAILED"
  | EXPIRED -> `String "EXPIRED"
  | DISABLED -> `String "DISABLED"
  | DELETED -> `String "DELETED"
  | ACTIVE -> `String "ACTIVE"
  | PENDING_CERTIFICATE -> `String "PENDING_CERTIFICATE"
  | CREATING -> `String "CREATING"

let update_certificate_authority_request_to_yojson (x : update_certificate_authority_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson certificate_authority_status_to_yojson x.status);
      ( "RevocationConfiguration",
        option_to_yojson revocation_configuration_to_yojson x.revocation_configuration );
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

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

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let untag_certificate_authority_request_to_yojson (x : untag_certificate_authority_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_certificate_authority_request_to_yojson (x : tag_certificate_authority_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let string64_to_yojson = string_to_yojson
let string5_to_yojson = string_to_yojson
let string40_to_yojson = string_to_yojson
let string39_to_yojson = string_to_yojson
let string3_to_yojson = string_to_yojson
let string256_to_yojson = string_to_yojson
let string253_to_yojson = string_to_yojson
let string1_to256_to_yojson = string_to_yojson
let string16_to_yojson = string_to_yojson
let string128_to_yojson = string_to_yojson

let signing_algorithm_to_yojson (x : signing_algorithm) =
  match x with
  | ML_DSA_87 -> `String "ML_DSA_87"
  | ML_DSA_65 -> `String "ML_DSA_65"
  | ML_DSA_44 -> `String "ML_DSA_44"
  | SM3WITHSM2 -> `String "SM3WITHSM2"
  | SHA512WITHRSA -> `String "SHA512WITHRSA"
  | SHA384WITHRSA -> `String "SHA384WITHRSA"
  | SHA256WITHRSA -> `String "SHA256WITHRSA"
  | SHA512WITHECDSA -> `String "SHA512WITHECDSA"
  | SHA384WITHECDSA -> `String "SHA384WITHECDSA"
  | SHA256WITHECDSA -> `String "SHA256WITHECDSA"

let s3_key_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let revocation_reason_to_yojson (x : revocation_reason) =
  match x with
  | A_A_COMPROMISE -> `String "A_A_COMPROMISE"
  | PRIVILEGE_WITHDRAWN -> `String "PRIVILEGE_WITHDRAWN"
  | CESSATION_OF_OPERATION -> `String "CESSATION_OF_OPERATION"
  | SUPERSEDED -> `String "SUPERSEDED"
  | AFFILIATION_CHANGED -> `String "AFFILIATION_CHANGED"
  | CERTIFICATE_AUTHORITY_COMPROMISE -> `String "CERTIFICATE_AUTHORITY_COMPROMISE"
  | KEY_COMPROMISE -> `String "KEY_COMPROMISE"
  | UNSPECIFIED -> `String "UNSPECIFIED"

let revoke_certificate_request_to_yojson (x : revoke_certificate_request) =
  assoc_to_yojson
    [
      ("RevocationReason", Some (revocation_reason_to_yojson x.revocation_reason));
      ("CertificateSerial", Some (string128_to_yojson x.certificate_serial));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
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

let restore_certificate_authority_request_to_yojson (x : restore_certificate_authority_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let resource_owner_to_yojson (x : resource_owner) =
  match x with OTHER_ACCOUNTS -> `String "OTHER_ACCOUNTS" | SELF -> `String "SELF"

let qualifier_to_yojson (x : qualifier) =
  assoc_to_yojson [ ("CpsUri", Some (string256_to_yojson x.cps_uri)) ]

let aws_policy_to_yojson = string_to_yojson

let put_policy_request_to_yojson (x : put_policy_request) =
  assoc_to_yojson
    [
      ("Policy", Some (aws_policy_to_yojson x.policy));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let lockout_prevented_exception_to_yojson (x : lockout_prevented_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let principal_to_yojson = string_to_yojson
let policy_qualifier_id_to_yojson (x : policy_qualifier_id) = match x with CPS -> `String "CPS"

let policy_qualifier_info_to_yojson (x : policy_qualifier_info) =
  assoc_to_yojson
    [
      ("Qualifier", Some (qualifier_to_yojson x.qualifier));
      ("PolicyQualifierId", Some (policy_qualifier_id_to_yojson x.policy_qualifier_id));
    ]

let policy_qualifier_info_list_to_yojson tree = list_to_yojson policy_qualifier_info_to_yojson tree
let custom_object_identifier_to_yojson = string_to_yojson

let policy_information_to_yojson (x : policy_information) =
  assoc_to_yojson
    [
      ("PolicyQualifiers", option_to_yojson policy_qualifier_info_list_to_yojson x.policy_qualifiers);
      ("CertPolicyId", Some (custom_object_identifier_to_yojson x.cert_policy_id));
    ]

let account_id_to_yojson = string_to_yojson

let action_type_to_yojson (x : action_type) =
  match x with
  | ListPermissions -> `String "ListPermissions"
  | GetCertificate -> `String "GetCertificate"
  | IssueCertificate -> `String "IssueCertificate"

let action_list_to_yojson tree = list_to_yojson action_type_to_yojson tree

let permission_to_yojson (x : permission) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson aws_policy_to_yojson x.policy);
      ("Actions", option_to_yojson action_list_to_yojson x.actions);
      ("SourceAccount", option_to_yojson account_id_to_yojson x.source_account);
      ("Principal", option_to_yojson principal_to_yojson x.principal);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn);
    ]

let permission_list_to_yojson tree = list_to_yojson permission_to_yojson tree

let permission_already_exists_exception_to_yojson (x : permission_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let permanent_deletion_time_in_days_to_yojson = int_to_yojson

let other_name_to_yojson (x : other_name) =
  assoc_to_yojson
    [
      ("Value", Some (string256_to_yojson x.value));
      ("TypeId", Some (custom_object_identifier_to_yojson x.type_id));
    ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let malformed_certificate_exception_to_yojson (x : malformed_certificate_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let malformed_csr_exception_to_yojson (x : malformed_csr_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_permissions_response_to_yojson (x : list_permissions_response) =
  assoc_to_yojson
    [
      ("Permissions", option_to_yojson permission_list_to_yojson x.permissions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_permissions_request_to_yojson (x : list_permissions_request) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let certificate_authority_type_to_yojson (x : certificate_authority_type) =
  match x with SUBORDINATE -> `String "SUBORDINATE" | ROOT -> `String "ROOT"

let failure_reason_to_yojson (x : failure_reason) =
  match x with
  | OTHER -> `String "OTHER"
  | UNSUPPORTED_ALGORITHM -> `String "UNSUPPORTED_ALGORITHM"
  | REQUEST_TIMED_OUT -> `String "REQUEST_TIMED_OUT"

let key_algorithm_to_yojson (x : key_algorithm) =
  match x with
  | SM2 -> `String "SM2"
  | ML_DSA_87 -> `String "ML_DSA_87"
  | ML_DSA_65 -> `String "ML_DSA_65"
  | ML_DSA_44 -> `String "ML_DSA_44"
  | EC_secp521r1 -> `String "EC_secp521r1"
  | EC_secp384r1 -> `String "EC_secp384r1"
  | EC_prime256v1 -> `String "EC_prime256v1"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"

let country_code_string_to_yojson = string_to_yojson
let asn1_printable_string64_to_yojson = string_to_yojson

let custom_attribute_to_yojson (x : custom_attribute) =
  assoc_to_yojson
    [
      ("Value", Some (string1_to256_to_yojson x.value));
      ("ObjectIdentifier", Some (custom_object_identifier_to_yojson x.object_identifier));
    ]

let custom_attribute_list_to_yojson tree = list_to_yojson custom_attribute_to_yojson tree

let asn1_subject_to_yojson (x : asn1_subject) =
  assoc_to_yojson
    [
      ("CustomAttributes", option_to_yojson custom_attribute_list_to_yojson x.custom_attributes);
      ("GenerationQualifier", option_to_yojson string3_to_yojson x.generation_qualifier);
      ("Pseudonym", option_to_yojson string128_to_yojson x.pseudonym);
      ("Initials", option_to_yojson string5_to_yojson x.initials);
      ("GivenName", option_to_yojson string16_to_yojson x.given_name);
      ("Surname", option_to_yojson string40_to_yojson x.surname);
      ("Title", option_to_yojson string64_to_yojson x.title);
      ("Locality", option_to_yojson string128_to_yojson x.locality);
      ("SerialNumber", option_to_yojson asn1_printable_string64_to_yojson x.serial_number);
      ("CommonName", option_to_yojson string64_to_yojson x.common_name);
      ("State", option_to_yojson string128_to_yojson x.state);
      ( "DistinguishedNameQualifier",
        option_to_yojson asn1_printable_string64_to_yojson x.distinguished_name_qualifier );
      ("OrganizationalUnit", option_to_yojson string64_to_yojson x.organizational_unit);
      ("Organization", option_to_yojson string64_to_yojson x.organization);
      ("Country", option_to_yojson country_code_string_to_yojson x.country);
    ]

let key_usage_to_yojson (x : key_usage) =
  assoc_to_yojson
    [
      ("DecipherOnly", option_to_yojson boolean__to_yojson x.decipher_only);
      ("EncipherOnly", option_to_yojson boolean__to_yojson x.encipher_only);
      ("CRLSign", option_to_yojson boolean__to_yojson x.crl_sign);
      ("KeyCertSign", option_to_yojson boolean__to_yojson x.key_cert_sign);
      ("KeyAgreement", option_to_yojson boolean__to_yojson x.key_agreement);
      ("DataEncipherment", option_to_yojson boolean__to_yojson x.data_encipherment);
      ("KeyEncipherment", option_to_yojson boolean__to_yojson x.key_encipherment);
      ("NonRepudiation", option_to_yojson boolean__to_yojson x.non_repudiation);
      ("DigitalSignature", option_to_yojson boolean__to_yojson x.digital_signature);
    ]

let access_method_type_to_yojson (x : access_method_type) =
  match x with
  | RESOURCE_PKI_NOTIFY -> `String "RESOURCE_PKI_NOTIFY"
  | RESOURCE_PKI_MANIFEST -> `String "RESOURCE_PKI_MANIFEST"
  | CA_REPOSITORY -> `String "CA_REPOSITORY"

let access_method_to_yojson (x : access_method) =
  assoc_to_yojson
    [
      ("AccessMethodType", option_to_yojson access_method_type_to_yojson x.access_method_type);
      ( "CustomObjectIdentifier",
        option_to_yojson custom_object_identifier_to_yojson x.custom_object_identifier );
    ]

let edi_party_name_to_yojson (x : edi_party_name) =
  assoc_to_yojson
    [
      ("NameAssigner", option_to_yojson string256_to_yojson x.name_assigner);
      ("PartyName", Some (string256_to_yojson x.party_name));
    ]

let general_name_to_yojson (x : general_name) =
  assoc_to_yojson
    [
      ("RegisteredId", option_to_yojson custom_object_identifier_to_yojson x.registered_id);
      ("IpAddress", option_to_yojson string39_to_yojson x.ip_address);
      ( "UniformResourceIdentifier",
        option_to_yojson string253_to_yojson x.uniform_resource_identifier );
      ("EdiPartyName", option_to_yojson edi_party_name_to_yojson x.edi_party_name);
      ("DirectoryName", option_to_yojson asn1_subject_to_yojson x.directory_name);
      ("DnsName", option_to_yojson string253_to_yojson x.dns_name);
      ("Rfc822Name", option_to_yojson string256_to_yojson x.rfc822_name);
      ("OtherName", option_to_yojson other_name_to_yojson x.other_name);
    ]

let access_description_to_yojson (x : access_description) =
  assoc_to_yojson
    [
      ("AccessLocation", Some (general_name_to_yojson x.access_location));
      ("AccessMethod", Some (access_method_to_yojson x.access_method));
    ]

let access_description_list_to_yojson tree = list_to_yojson access_description_to_yojson tree

let csr_extensions_to_yojson (x : csr_extensions) =
  assoc_to_yojson
    [
      ( "SubjectInformationAccess",
        option_to_yojson access_description_list_to_yojson x.subject_information_access );
      ("KeyUsage", option_to_yojson key_usage_to_yojson x.key_usage);
    ]

let certificate_authority_configuration_to_yojson (x : certificate_authority_configuration) =
  assoc_to_yojson
    [
      ("CsrExtensions", option_to_yojson csr_extensions_to_yojson x.csr_extensions);
      ("Subject", Some (asn1_subject_to_yojson x.subject));
      ("SigningAlgorithm", Some (signing_algorithm_to_yojson x.signing_algorithm));
      ("KeyAlgorithm", Some (key_algorithm_to_yojson x.key_algorithm));
    ]

let key_storage_security_standard_to_yojson (x : key_storage_security_standard) =
  match x with
  | CCPC_LEVEL_1_OR_HIGHER -> `String "CCPC_LEVEL_1_OR_HIGHER"
  | FIPS_140_2_LEVEL_3_OR_HIGHER -> `String "FIPS_140_2_LEVEL_3_OR_HIGHER"
  | FIPS_140_2_LEVEL_2_OR_HIGHER -> `String "FIPS_140_2_LEVEL_2_OR_HIGHER"

let certificate_authority_usage_mode_to_yojson (x : certificate_authority_usage_mode) =
  match x with
  | SHORT_LIVED_CERTIFICATE -> `String "SHORT_LIVED_CERTIFICATE"
  | GENERAL_PURPOSE -> `String "GENERAL_PURPOSE"

let certificate_authority_to_yojson (x : certificate_authority) =
  assoc_to_yojson
    [
      ("UsageMode", option_to_yojson certificate_authority_usage_mode_to_yojson x.usage_mode);
      ( "KeyStorageSecurityStandard",
        option_to_yojson key_storage_security_standard_to_yojson x.key_storage_security_standard );
      ("RestorableUntil", option_to_yojson t_stamp_to_yojson x.restorable_until);
      ( "RevocationConfiguration",
        option_to_yojson revocation_configuration_to_yojson x.revocation_configuration );
      ( "CertificateAuthorityConfiguration",
        option_to_yojson certificate_authority_configuration_to_yojson
          x.certificate_authority_configuration );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("Status", option_to_yojson certificate_authority_status_to_yojson x.status);
      ("Serial", option_to_yojson string__to_yojson x.serial);
      ("Type", option_to_yojson certificate_authority_type_to_yojson x.type_);
      ("LastStateChangeAt", option_to_yojson t_stamp_to_yojson x.last_state_change_at);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("OwnerAccount", option_to_yojson account_id_to_yojson x.owner_account);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let certificate_authorities_to_yojson tree = list_to_yojson certificate_authority_to_yojson tree

let list_certificate_authorities_response_to_yojson (x : list_certificate_authorities_response) =
  assoc_to_yojson
    [
      ( "CertificateAuthorities",
        option_to_yojson certificate_authorities_to_yojson x.certificate_authorities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_certificate_authorities_request_to_yojson (x : list_certificate_authorities_request) =
  assoc_to_yojson
    [
      ("ResourceOwner", option_to_yojson resource_owner_to_yojson x.resource_owner);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let issue_certificate_response_to_yojson (x : issue_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let certificate_policy_list_to_yojson tree = list_to_yojson policy_information_to_yojson tree

let extended_key_usage_type_to_yojson (x : extended_key_usage_type) =
  match x with
  | CERTIFICATE_TRANSPARENCY -> `String "CERTIFICATE_TRANSPARENCY"
  | DOCUMENT_SIGNING -> `String "DOCUMENT_SIGNING"
  | SMART_CARD_LOGIN -> `String "SMART_CARD_LOGIN"
  | OCSP_SIGNING -> `String "OCSP_SIGNING"
  | TIME_STAMPING -> `String "TIME_STAMPING"
  | EMAIL_PROTECTION -> `String "EMAIL_PROTECTION"
  | CODE_SIGNING -> `String "CODE_SIGNING"
  | CLIENT_AUTH -> `String "CLIENT_AUTH"
  | SERVER_AUTH -> `String "SERVER_AUTH"

let extended_key_usage_to_yojson (x : extended_key_usage) =
  assoc_to_yojson
    [
      ( "ExtendedKeyUsageObjectIdentifier",
        option_to_yojson custom_object_identifier_to_yojson x.extended_key_usage_object_identifier
      );
      ( "ExtendedKeyUsageType",
        option_to_yojson extended_key_usage_type_to_yojson x.extended_key_usage_type );
    ]

let extended_key_usage_list_to_yojson tree = list_to_yojson extended_key_usage_to_yojson tree
let general_name_list_to_yojson tree = list_to_yojson general_name_to_yojson tree
let base64_string1_to4096_to_yojson = string_to_yojson

let custom_extension_to_yojson (x : custom_extension) =
  assoc_to_yojson
    [
      ("Critical", option_to_yojson boolean__to_yojson x.critical);
      ("Value", Some (base64_string1_to4096_to_yojson x.value));
      ("ObjectIdentifier", Some (custom_object_identifier_to_yojson x.object_identifier));
    ]

let custom_extension_list_to_yojson tree = list_to_yojson custom_extension_to_yojson tree

let extensions_to_yojson (x : extensions) =
  assoc_to_yojson
    [
      ("CustomExtensions", option_to_yojson custom_extension_list_to_yojson x.custom_extensions);
      ( "SubjectAlternativeNames",
        option_to_yojson general_name_list_to_yojson x.subject_alternative_names );
      ("KeyUsage", option_to_yojson key_usage_to_yojson x.key_usage);
      ("ExtendedKeyUsage", option_to_yojson extended_key_usage_list_to_yojson x.extended_key_usage);
      ( "CertificatePolicies",
        option_to_yojson certificate_policy_list_to_yojson x.certificate_policies );
    ]

let api_passthrough_to_yojson (x : api_passthrough) =
  assoc_to_yojson
    [
      ("Subject", option_to_yojson asn1_subject_to_yojson x.subject);
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
    ]

let csr_blob_to_yojson = blob_to_yojson
let idempotency_token_to_yojson = string_to_yojson

let issue_certificate_request_to_yojson (x : issue_certificate_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("ValidityNotBefore", option_to_yojson validity_to_yojson x.validity_not_before);
      ("Validity", Some (validity_to_yojson x.validity));
      ("TemplateArn", option_to_yojson arn_to_yojson x.template_arn);
      ("SigningAlgorithm", Some (signing_algorithm_to_yojson x.signing_algorithm));
      ("Csr", Some (csr_blob_to_yojson x.csr));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
      ("ApiPassthrough", option_to_yojson api_passthrough_to_yojson x.api_passthrough);
    ]

let certificate_body_blob_to_yojson = blob_to_yojson
let certificate_chain_blob_to_yojson = blob_to_yojson

let import_certificate_authority_certificate_request_to_yojson
    (x : import_certificate_authority_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateChain", option_to_yojson certificate_chain_blob_to_yojson x.certificate_chain);
      ("Certificate", Some (certificate_body_blob_to_yojson x.certificate));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let certificate_mismatch_exception_to_yojson (x : certificate_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let get_policy_response_to_yojson (x : get_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson aws_policy_to_yojson x.policy) ]

let get_policy_request_to_yojson (x : get_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let certificate_body_to_yojson = string_to_yojson
let certificate_chain_to_yojson = string_to_yojson

let get_certificate_response_to_yojson (x : get_certificate_response) =
  assoc_to_yojson
    [
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
    ]

let get_certificate_request_to_yojson (x : get_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let csr_body_to_yojson = string_to_yojson

let get_certificate_authority_csr_response_to_yojson (x : get_certificate_authority_csr_response) =
  assoc_to_yojson [ ("Csr", option_to_yojson csr_body_to_yojson x.csr) ]

let get_certificate_authority_csr_request_to_yojson (x : get_certificate_authority_csr_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let get_certificate_authority_certificate_response_to_yojson
    (x : get_certificate_authority_certificate_response) =
  assoc_to_yojson
    [
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
    ]

let get_certificate_authority_certificate_request_to_yojson
    (x : get_certificate_authority_certificate_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let describe_certificate_authority_response_to_yojson (x : describe_certificate_authority_response)
    =
  assoc_to_yojson
    [
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
    ]

let describe_certificate_authority_request_to_yojson (x : describe_certificate_authority_request) =
  assoc_to_yojson [ ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn)) ]

let audit_report_status_to_yojson (x : audit_report_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | CREATING -> `String "CREATING"

let describe_certificate_authority_audit_report_response_to_yojson
    (x : describe_certificate_authority_audit_report_response) =
  assoc_to_yojson
    [
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
      ("S3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
      ("AuditReportStatus", option_to_yojson audit_report_status_to_yojson x.audit_report_status);
    ]

let audit_report_id_to_yojson = string_to_yojson

let describe_certificate_authority_audit_report_request_to_yojson
    (x : describe_certificate_authority_audit_report_request) =
  assoc_to_yojson
    [
      ("AuditReportId", Some (audit_report_id_to_yojson x.audit_report_id));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let delete_policy_request_to_yojson (x : delete_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let delete_permission_request_to_yojson (x : delete_permission_request) =
  assoc_to_yojson
    [
      ("SourceAccount", option_to_yojson account_id_to_yojson x.source_account);
      ("Principal", Some (principal_to_yojson x.principal));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let delete_certificate_authority_request_to_yojson (x : delete_certificate_authority_request) =
  assoc_to_yojson
    [
      ( "PermanentDeletionTimeInDays",
        option_to_yojson permanent_deletion_time_in_days_to_yojson x.permanent_deletion_time_in_days
      );
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let create_permission_request_to_yojson (x : create_permission_request) =
  assoc_to_yojson
    [
      ("Actions", Some (action_list_to_yojson x.actions));
      ("SourceAccount", option_to_yojson account_id_to_yojson x.source_account);
      ("Principal", Some (principal_to_yojson x.principal));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]

let create_certificate_authority_response_to_yojson (x : create_certificate_authority_response) =
  assoc_to_yojson
    [ ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn) ]

let create_certificate_authority_request_to_yojson (x : create_certificate_authority_request) =
  assoc_to_yojson
    [
      ("UsageMode", option_to_yojson certificate_authority_usage_mode_to_yojson x.usage_mode);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "KeyStorageSecurityStandard",
        option_to_yojson key_storage_security_standard_to_yojson x.key_storage_security_standard );
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ( "CertificateAuthorityType",
        Some (certificate_authority_type_to_yojson x.certificate_authority_type) );
      ( "RevocationConfiguration",
        option_to_yojson revocation_configuration_to_yojson x.revocation_configuration );
      ( "CertificateAuthorityConfiguration",
        Some (certificate_authority_configuration_to_yojson x.certificate_authority_configuration)
      );
    ]

let create_certificate_authority_audit_report_response_to_yojson
    (x : create_certificate_authority_audit_report_response) =
  assoc_to_yojson
    [
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
      ("AuditReportId", option_to_yojson audit_report_id_to_yojson x.audit_report_id);
    ]

let audit_report_response_format_to_yojson (x : audit_report_response_format) =
  match x with CSV -> `String "CSV" | JSON -> `String "JSON"

let create_certificate_authority_audit_report_request_to_yojson
    (x : create_certificate_authority_audit_report_request) =
  assoc_to_yojson
    [
      ( "AuditReportResponseFormat",
        Some (audit_report_response_format_to_yojson x.audit_report_response_format) );
      ("S3BucketName", Some (s3_bucket_name_to_yojson x.s3_bucket_name));
      ("CertificateAuthorityArn", Some (arn_to_yojson x.certificate_authority_arn));
    ]
