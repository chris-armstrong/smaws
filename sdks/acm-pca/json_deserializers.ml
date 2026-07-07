open Smaws_Lib.Json.DeserializeHelpers
open Types

let validity_period_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "YEARS" -> YEARS
    | `String "MONTHS" -> MONTHS
    | `String "DAYS" -> DAYS
    | `String "ABSOLUTE" -> ABSOLUTE
    | `String "END_DATE" -> END_DATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidityPeriodType" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidityPeriodType")
     : validity_period_type)
    : validity_period_type)

let positive_long_of_yojson = long_of_yojson

let validity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key validity_period_type_of_yojson "Type" _list path;
     value = value_for_key positive_long_of_yojson "Value" _list path;
   }
    : validity)

let arn_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson
let integer1_to5000_of_yojson = int_of_yojson
let cname_string_of_yojson = string_of_yojson
let s3_bucket_name3_to255_of_yojson = string_of_yojson

let s3_object_acl_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUCKET_OWNER_FULL_CONTROL" -> BUCKET_OWNER_FULL_CONTROL
    | `String "PUBLIC_READ" -> PUBLIC_READ
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3ObjectAcl" value)
    | _ -> raise (deserialize_wrong_type_error path "S3ObjectAcl")
     : s3_object_acl)
    : s3_object_acl)

let crl_distribution_point_extension_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ omit_extension = value_for_key boolean__of_yojson "OmitExtension" _list path }
    : crl_distribution_point_extension_configuration)

let crl_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARTITIONED" -> PARTITIONED
    | `String "COMPLETE" -> COMPLETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CrlType" value)
    | _ -> raise (deserialize_wrong_type_error path "CrlType")
     : crl_type)
    : crl_type)

let crl_path_string_of_yojson = string_of_yojson

let crl_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_path =
       option_of_yojson (value_for_key crl_path_string_of_yojson "CustomPath") _list path;
     crl_type = option_of_yojson (value_for_key crl_type_of_yojson "CrlType") _list path;
     crl_distribution_point_extension_configuration =
       option_of_yojson
         (value_for_key crl_distribution_point_extension_configuration_of_yojson
            "CrlDistributionPointExtensionConfiguration")
         _list path;
     s3_object_acl =
       option_of_yojson (value_for_key s3_object_acl_of_yojson "S3ObjectAcl") _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name3_to255_of_yojson "S3BucketName") _list path;
     custom_cname = option_of_yojson (value_for_key cname_string_of_yojson "CustomCname") _list path;
     expiration_in_days =
       option_of_yojson (value_for_key integer1_to5000_of_yojson "ExpirationInDays") _list path;
     enabled = value_for_key boolean__of_yojson "Enabled" _list path;
   }
    : crl_configuration)

let ocsp_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ocsp_custom_cname =
       option_of_yojson (value_for_key cname_string_of_yojson "OcspCustomCname") _list path;
     enabled = value_for_key boolean__of_yojson "Enabled" _list path;
   }
    : ocsp_configuration)

let revocation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ocsp_configuration =
       option_of_yojson (value_for_key ocsp_configuration_of_yojson "OcspConfiguration") _list path;
     crl_configuration =
       option_of_yojson (value_for_key crl_configuration_of_yojson "CrlConfiguration") _list path;
   }
    : revocation_configuration)

let certificate_authority_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "EXPIRED" -> EXPIRED
    | `String "DISABLED" -> DISABLED
    | `String "DELETED" -> DELETED
    | `String "ACTIVE" -> ACTIVE
    | `String "PENDING_CERTIFICATE" -> PENDING_CERTIFICATE
    | `String "CREATING" -> CREATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateAuthorityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateAuthorityStatus")
     : certificate_authority_status)
    : certificate_authority_status)

let update_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key certificate_authority_status_of_yojson "Status") _list path;
     revocation_configuration =
       option_of_yojson
         (value_for_key revocation_configuration_of_yojson "RevocationConfiguration")
         _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : update_certificate_authority_request)

let string__of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_not_found_exception)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_state_exception)

let invalid_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_policy_exception)

let invalid_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_arn_exception)

let invalid_args_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_args_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : concurrent_modification_exception)

let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let untag_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : untag_certificate_authority_request)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_tag_exception)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : too_many_tags_exception)

let tag_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : tag_certificate_authority_request)

let t_stamp_of_yojson = timestamp_epoch_seconds_of_yojson
let string64_of_yojson = string_of_yojson
let string5_of_yojson = string_of_yojson
let string40_of_yojson = string_of_yojson
let string39_of_yojson = string_of_yojson
let string3_of_yojson = string_of_yojson
let string256_of_yojson = string_of_yojson
let string253_of_yojson = string_of_yojson
let string1_to256_of_yojson = string_of_yojson
let string16_of_yojson = string_of_yojson
let string128_of_yojson = string_of_yojson

let signing_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "ML_DSA_87" -> ML_DSA_87
    | `String "ML_DSA_65" -> ML_DSA_65
    | `String "ML_DSA_44" -> ML_DSA_44
    | `String "SM3WITHSM2" -> SM3WITHSM2
    | `String "SHA512WITHRSA" -> SHA512WITHRSA
    | `String "SHA384WITHRSA" -> SHA384WITHRSA
    | `String "SHA256WITHRSA" -> SHA256WITHRSA
    | `String "SHA512WITHECDSA" -> SHA512WITHECDSA
    | `String "SHA384WITHECDSA" -> SHA384WITHECDSA
    | `String "SHA256WITHECDSA" -> SHA256WITHECDSA
    | `String value -> raise (deserialize_unknown_enum_value_error path "SigningAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningAlgorithm")
     : signing_algorithm)
    : signing_algorithm)

let s3_key_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson

let revocation_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "A_A_COMPROMISE" -> A_A_COMPROMISE
    | `String "PRIVILEGE_WITHDRAWN" -> PRIVILEGE_WITHDRAWN
    | `String "CESSATION_OF_OPERATION" -> CESSATION_OF_OPERATION
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "AFFILIATION_CHANGED" -> AFFILIATION_CHANGED
    | `String "CERTIFICATE_AUTHORITY_COMPROMISE" -> CERTIFICATE_AUTHORITY_COMPROMISE
    | `String "KEY_COMPROMISE" -> KEY_COMPROMISE
    | `String "UNSPECIFIED" -> UNSPECIFIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RevocationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "RevocationReason")
     : revocation_reason)
    : revocation_reason)

let revoke_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revocation_reason = value_for_key revocation_reason_of_yojson "RevocationReason" _list path;
     certificate_serial = value_for_key string128_of_yojson "CertificateSerial" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : revoke_certificate_request)

let request_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : request_in_progress_exception)

let request_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : request_failed_exception)

let request_already_processed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : request_already_processed_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_request_exception)

let restore_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path }
    : restore_certificate_authority_request)

let resource_owner_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER_ACCOUNTS" -> OTHER_ACCOUNTS
    | `String "SELF" -> SELF
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceOwner" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceOwner")
     : resource_owner)
    : resource_owner)

let qualifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cps_uri = value_for_key string256_of_yojson "CpsUri" _list path } : qualifier)

let aws_policy_of_yojson = string_of_yojson

let put_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key aws_policy_of_yojson "Policy" _list path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
   }
    : put_policy_request)

let lockout_prevented_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : lockout_prevented_exception)

let principal_of_yojson = string_of_yojson

let policy_qualifier_id_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPS" -> CPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyQualifierId" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyQualifierId")
     : policy_qualifier_id)
    : policy_qualifier_id)

let policy_qualifier_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     qualifier = value_for_key qualifier_of_yojson "Qualifier" _list path;
     policy_qualifier_id =
       value_for_key policy_qualifier_id_of_yojson "PolicyQualifierId" _list path;
   }
    : policy_qualifier_info)

let policy_qualifier_info_list_of_yojson tree path =
  list_of_yojson policy_qualifier_info_of_yojson tree path

let custom_object_identifier_of_yojson = string_of_yojson

let policy_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_qualifiers =
       option_of_yojson
         (value_for_key policy_qualifier_info_list_of_yojson "PolicyQualifiers")
         _list path;
     cert_policy_id = value_for_key custom_object_identifier_of_yojson "CertPolicyId" _list path;
   }
    : policy_information)

let account_id_of_yojson = string_of_yojson

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ListPermissions" -> ListPermissions
    | `String "GetCertificate" -> GetCertificate
    | `String "IssueCertificate" -> IssueCertificate
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let action_list_of_yojson tree path = list_of_yojson action_type_of_yojson tree path

let permission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key aws_policy_of_yojson "Policy") _list path;
     actions = option_of_yojson (value_for_key action_list_of_yojson "Actions") _list path;
     source_account =
       option_of_yojson (value_for_key account_id_of_yojson "SourceAccount") _list path;
     principal = option_of_yojson (value_for_key principal_of_yojson "Principal") _list path;
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     certificate_authority_arn =
       option_of_yojson (value_for_key arn_of_yojson "CertificateAuthorityArn") _list path;
   }
    : permission)

let permission_list_of_yojson tree path = list_of_yojson permission_of_yojson tree path

let permission_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : permission_already_exists_exception)

let permanent_deletion_time_in_days_of_yojson = int_of_yojson

let other_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string256_of_yojson "Value" _list path;
     type_id = value_for_key custom_object_identifier_of_yojson "TypeId" _list path;
   }
    : other_name)

let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let malformed_certificate_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : malformed_certificate_exception)

let malformed_csr_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : malformed_csr_exception)

let list_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_response)

let list_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_tags_request)

let list_permissions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permissions =
       option_of_yojson (value_for_key permission_list_of_yojson "Permissions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_permissions_response)

let list_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_permissions_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_next_token_exception)

let certificate_authority_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBORDINATE" -> SUBORDINATE
    | `String "ROOT" -> ROOT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateAuthorityType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateAuthorityType")
     : certificate_authority_type)
    : certificate_authority_type)

let failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "UNSUPPORTED_ALGORITHM" -> UNSUPPORTED_ALGORITHM
    | `String "REQUEST_TIMED_OUT" -> REQUEST_TIMED_OUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureReason")
     : failure_reason)
    : failure_reason)

let key_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "SM2" -> SM2
    | `String "ML_DSA_87" -> ML_DSA_87
    | `String "ML_DSA_65" -> ML_DSA_65
    | `String "ML_DSA_44" -> ML_DSA_44
    | `String "EC_secp521r1" -> EC_secp521r1
    | `String "EC_secp384r1" -> EC_secp384r1
    | `String "EC_prime256v1" -> EC_prime256v1
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAlgorithm")
     : key_algorithm)
    : key_algorithm)

let country_code_string_of_yojson = string_of_yojson
let asn1_printable_string64_of_yojson = string_of_yojson

let custom_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string1_to256_of_yojson "Value" _list path;
     object_identifier =
       value_for_key custom_object_identifier_of_yojson "ObjectIdentifier" _list path;
   }
    : custom_attribute)

let custom_attribute_list_of_yojson tree path = list_of_yojson custom_attribute_of_yojson tree path

let asn1_subject_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_attributes =
       option_of_yojson
         (value_for_key custom_attribute_list_of_yojson "CustomAttributes")
         _list path;
     generation_qualifier =
       option_of_yojson (value_for_key string3_of_yojson "GenerationQualifier") _list path;
     pseudonym = option_of_yojson (value_for_key string128_of_yojson "Pseudonym") _list path;
     initials = option_of_yojson (value_for_key string5_of_yojson "Initials") _list path;
     given_name = option_of_yojson (value_for_key string16_of_yojson "GivenName") _list path;
     surname = option_of_yojson (value_for_key string40_of_yojson "Surname") _list path;
     title = option_of_yojson (value_for_key string64_of_yojson "Title") _list path;
     locality = option_of_yojson (value_for_key string128_of_yojson "Locality") _list path;
     serial_number =
       option_of_yojson (value_for_key asn1_printable_string64_of_yojson "SerialNumber") _list path;
     common_name = option_of_yojson (value_for_key string64_of_yojson "CommonName") _list path;
     state = option_of_yojson (value_for_key string128_of_yojson "State") _list path;
     distinguished_name_qualifier =
       option_of_yojson
         (value_for_key asn1_printable_string64_of_yojson "DistinguishedNameQualifier")
         _list path;
     organizational_unit =
       option_of_yojson (value_for_key string64_of_yojson "OrganizationalUnit") _list path;
     organization = option_of_yojson (value_for_key string64_of_yojson "Organization") _list path;
     country = option_of_yojson (value_for_key country_code_string_of_yojson "Country") _list path;
   }
    : asn1_subject)

let key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     decipher_only = option_of_yojson (value_for_key boolean__of_yojson "DecipherOnly") _list path;
     encipher_only = option_of_yojson (value_for_key boolean__of_yojson "EncipherOnly") _list path;
     crl_sign = option_of_yojson (value_for_key boolean__of_yojson "CRLSign") _list path;
     key_cert_sign = option_of_yojson (value_for_key boolean__of_yojson "KeyCertSign") _list path;
     key_agreement = option_of_yojson (value_for_key boolean__of_yojson "KeyAgreement") _list path;
     data_encipherment =
       option_of_yojson (value_for_key boolean__of_yojson "DataEncipherment") _list path;
     key_encipherment =
       option_of_yojson (value_for_key boolean__of_yojson "KeyEncipherment") _list path;
     non_repudiation =
       option_of_yojson (value_for_key boolean__of_yojson "NonRepudiation") _list path;
     digital_signature =
       option_of_yojson (value_for_key boolean__of_yojson "DigitalSignature") _list path;
   }
    : key_usage)

let access_method_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESOURCE_PKI_NOTIFY" -> RESOURCE_PKI_NOTIFY
    | `String "RESOURCE_PKI_MANIFEST" -> RESOURCE_PKI_MANIFEST
    | `String "CA_REPOSITORY" -> CA_REPOSITORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessMethodType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessMethodType")
     : access_method_type)
    : access_method_type)

let access_method_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_method_type =
       option_of_yojson (value_for_key access_method_type_of_yojson "AccessMethodType") _list path;
     custom_object_identifier =
       option_of_yojson
         (value_for_key custom_object_identifier_of_yojson "CustomObjectIdentifier")
         _list path;
   }
    : access_method)

let edi_party_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name_assigner = option_of_yojson (value_for_key string256_of_yojson "NameAssigner") _list path;
     party_name = value_for_key string256_of_yojson "PartyName" _list path;
   }
    : edi_party_name)

let general_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registered_id =
       option_of_yojson (value_for_key custom_object_identifier_of_yojson "RegisteredId") _list path;
     ip_address = option_of_yojson (value_for_key string39_of_yojson "IpAddress") _list path;
     uniform_resource_identifier =
       option_of_yojson (value_for_key string253_of_yojson "UniformResourceIdentifier") _list path;
     edi_party_name =
       option_of_yojson (value_for_key edi_party_name_of_yojson "EdiPartyName") _list path;
     directory_name =
       option_of_yojson (value_for_key asn1_subject_of_yojson "DirectoryName") _list path;
     dns_name = option_of_yojson (value_for_key string253_of_yojson "DnsName") _list path;
     rfc822_name = option_of_yojson (value_for_key string256_of_yojson "Rfc822Name") _list path;
     other_name = option_of_yojson (value_for_key other_name_of_yojson "OtherName") _list path;
   }
    : general_name)

let access_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_location = value_for_key general_name_of_yojson "AccessLocation" _list path;
     access_method = value_for_key access_method_of_yojson "AccessMethod" _list path;
   }
    : access_description)

let access_description_list_of_yojson tree path =
  list_of_yojson access_description_of_yojson tree path

let csr_extensions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subject_information_access =
       option_of_yojson
         (value_for_key access_description_list_of_yojson "SubjectInformationAccess")
         _list path;
     key_usage = option_of_yojson (value_for_key key_usage_of_yojson "KeyUsage") _list path;
   }
    : csr_extensions)

let certificate_authority_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csr_extensions =
       option_of_yojson (value_for_key csr_extensions_of_yojson "CsrExtensions") _list path;
     subject = value_for_key asn1_subject_of_yojson "Subject" _list path;
     signing_algorithm = value_for_key signing_algorithm_of_yojson "SigningAlgorithm" _list path;
     key_algorithm = value_for_key key_algorithm_of_yojson "KeyAlgorithm" _list path;
   }
    : certificate_authority_configuration)

let key_storage_security_standard_of_yojson (tree : t) path =
  ((match tree with
    | `String "CCPC_LEVEL_1_OR_HIGHER" -> CCPC_LEVEL_1_OR_HIGHER
    | `String "FIPS_140_2_LEVEL_3_OR_HIGHER" -> FIPS_140_2_LEVEL_3_OR_HIGHER
    | `String "FIPS_140_2_LEVEL_2_OR_HIGHER" -> FIPS_140_2_LEVEL_2_OR_HIGHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KeyStorageSecurityStandard" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyStorageSecurityStandard")
     : key_storage_security_standard)
    : key_storage_security_standard)

let certificate_authority_usage_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHORT_LIVED_CERTIFICATE" -> SHORT_LIVED_CERTIFICATE
    | `String "GENERAL_PURPOSE" -> GENERAL_PURPOSE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateAuthorityUsageMode" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateAuthorityUsageMode")
     : certificate_authority_usage_mode)
    : certificate_authority_usage_mode)

let certificate_authority_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_mode =
       option_of_yojson
         (value_for_key certificate_authority_usage_mode_of_yojson "UsageMode")
         _list path;
     key_storage_security_standard =
       option_of_yojson
         (value_for_key key_storage_security_standard_of_yojson "KeyStorageSecurityStandard")
         _list path;
     restorable_until =
       option_of_yojson (value_for_key t_stamp_of_yojson "RestorableUntil") _list path;
     revocation_configuration =
       option_of_yojson
         (value_for_key revocation_configuration_of_yojson "RevocationConfiguration")
         _list path;
     certificate_authority_configuration =
       option_of_yojson
         (value_for_key certificate_authority_configuration_of_yojson
            "CertificateAuthorityConfiguration")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     not_after = option_of_yojson (value_for_key t_stamp_of_yojson "NotAfter") _list path;
     not_before = option_of_yojson (value_for_key t_stamp_of_yojson "NotBefore") _list path;
     status =
       option_of_yojson (value_for_key certificate_authority_status_of_yojson "Status") _list path;
     serial = option_of_yojson (value_for_key string__of_yojson "Serial") _list path;
     type_ = option_of_yojson (value_for_key certificate_authority_type_of_yojson "Type") _list path;
     last_state_change_at =
       option_of_yojson (value_for_key t_stamp_of_yojson "LastStateChangeAt") _list path;
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     owner_account = option_of_yojson (value_for_key account_id_of_yojson "OwnerAccount") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : certificate_authority)

let certificate_authorities_of_yojson tree path =
  list_of_yojson certificate_authority_of_yojson tree path

let list_certificate_authorities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authorities =
       option_of_yojson
         (value_for_key certificate_authorities_of_yojson "CertificateAuthorities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_certificate_authorities_response)

let list_certificate_authorities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_owner =
       option_of_yojson (value_for_key resource_owner_of_yojson "ResourceOwner") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_certificate_authorities_request)

let issue_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : issue_certificate_response)

let certificate_policy_list_of_yojson tree path =
  list_of_yojson policy_information_of_yojson tree path

let extended_key_usage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CERTIFICATE_TRANSPARENCY" -> CERTIFICATE_TRANSPARENCY
    | `String "DOCUMENT_SIGNING" -> DOCUMENT_SIGNING
    | `String "SMART_CARD_LOGIN" -> SMART_CARD_LOGIN
    | `String "OCSP_SIGNING" -> OCSP_SIGNING
    | `String "TIME_STAMPING" -> TIME_STAMPING
    | `String "EMAIL_PROTECTION" -> EMAIL_PROTECTION
    | `String "CODE_SIGNING" -> CODE_SIGNING
    | `String "CLIENT_AUTH" -> CLIENT_AUTH
    | `String "SERVER_AUTH" -> SERVER_AUTH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExtendedKeyUsageType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExtendedKeyUsageType")
     : extended_key_usage_type)
    : extended_key_usage_type)

let extended_key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extended_key_usage_object_identifier =
       option_of_yojson
         (value_for_key custom_object_identifier_of_yojson "ExtendedKeyUsageObjectIdentifier")
         _list path;
     extended_key_usage_type =
       option_of_yojson
         (value_for_key extended_key_usage_type_of_yojson "ExtendedKeyUsageType")
         _list path;
   }
    : extended_key_usage)

let extended_key_usage_list_of_yojson tree path =
  list_of_yojson extended_key_usage_of_yojson tree path

let general_name_list_of_yojson tree path = list_of_yojson general_name_of_yojson tree path
let base64_string1_to4096_of_yojson = string_of_yojson

let custom_extension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     critical = option_of_yojson (value_for_key boolean__of_yojson "Critical") _list path;
     value = value_for_key base64_string1_to4096_of_yojson "Value" _list path;
     object_identifier =
       value_for_key custom_object_identifier_of_yojson "ObjectIdentifier" _list path;
   }
    : custom_extension)

let custom_extension_list_of_yojson tree path = list_of_yojson custom_extension_of_yojson tree path

let extensions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_extensions =
       option_of_yojson
         (value_for_key custom_extension_list_of_yojson "CustomExtensions")
         _list path;
     subject_alternative_names =
       option_of_yojson
         (value_for_key general_name_list_of_yojson "SubjectAlternativeNames")
         _list path;
     key_usage = option_of_yojson (value_for_key key_usage_of_yojson "KeyUsage") _list path;
     extended_key_usage =
       option_of_yojson
         (value_for_key extended_key_usage_list_of_yojson "ExtendedKeyUsage")
         _list path;
     certificate_policies =
       option_of_yojson
         (value_for_key certificate_policy_list_of_yojson "CertificatePolicies")
         _list path;
   }
    : extensions)

let api_passthrough_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subject = option_of_yojson (value_for_key asn1_subject_of_yojson "Subject") _list path;
     extensions = option_of_yojson (value_for_key extensions_of_yojson "Extensions") _list path;
   }
    : api_passthrough)

let csr_blob_of_yojson = blob_of_yojson
let idempotency_token_of_yojson = string_of_yojson

let issue_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     validity_not_before =
       option_of_yojson (value_for_key validity_of_yojson "ValidityNotBefore") _list path;
     validity = value_for_key validity_of_yojson "Validity" _list path;
     template_arn = option_of_yojson (value_for_key arn_of_yojson "TemplateArn") _list path;
     signing_algorithm = value_for_key signing_algorithm_of_yojson "SigningAlgorithm" _list path;
     csr = value_for_key csr_blob_of_yojson "Csr" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
     api_passthrough =
       option_of_yojson (value_for_key api_passthrough_of_yojson "ApiPassthrough") _list path;
   }
    : issue_certificate_request)

let certificate_body_blob_of_yojson = blob_of_yojson
let certificate_chain_blob_of_yojson = blob_of_yojson

let import_certificate_authority_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_chain =
       option_of_yojson
         (value_for_key certificate_chain_blob_of_yojson "CertificateChain")
         _list path;
     certificate = value_for_key certificate_body_blob_of_yojson "Certificate" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : import_certificate_authority_certificate_request)

let certificate_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : certificate_mismatch_exception)

let get_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key aws_policy_of_yojson "Policy") _list path }
    : get_policy_response)

let get_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path } : get_policy_request)

let certificate_body_of_yojson = string_of_yojson
let certificate_chain_of_yojson = string_of_yojson

let get_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_chain =
       option_of_yojson (value_for_key certificate_chain_of_yojson "CertificateChain") _list path;
     certificate =
       option_of_yojson (value_for_key certificate_body_of_yojson "Certificate") _list path;
   }
    : get_certificate_response)

let get_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : get_certificate_request)

let csr_body_of_yojson = string_of_yojson

let get_certificate_authority_csr_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ csr = option_of_yojson (value_for_key csr_body_of_yojson "Csr") _list path }
    : get_certificate_authority_csr_response)

let get_certificate_authority_csr_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path }
    : get_certificate_authority_csr_request)

let get_certificate_authority_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_chain =
       option_of_yojson (value_for_key certificate_chain_of_yojson "CertificateChain") _list path;
     certificate =
       option_of_yojson (value_for_key certificate_body_of_yojson "Certificate") _list path;
   }
    : get_certificate_authority_certificate_response)

let get_certificate_authority_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path }
    : get_certificate_authority_certificate_request)

let describe_certificate_authority_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority =
       option_of_yojson
         (value_for_key certificate_authority_of_yojson "CertificateAuthority")
         _list path;
   }
    : describe_certificate_authority_response)

let describe_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path }
    : describe_certificate_authority_request)

let audit_report_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuditReportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AuditReportStatus")
     : audit_report_status)
    : audit_report_status)

let describe_certificate_authority_audit_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     s3_key = option_of_yojson (value_for_key s3_key_of_yojson "S3Key") _list path;
     s3_bucket_name =
       option_of_yojson (value_for_key s3_bucket_name_of_yojson "S3BucketName") _list path;
     audit_report_status =
       option_of_yojson (value_for_key audit_report_status_of_yojson "AuditReportStatus") _list path;
   }
    : describe_certificate_authority_audit_report_response)

let audit_report_id_of_yojson = string_of_yojson

let describe_certificate_authority_audit_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_report_id = value_for_key audit_report_id_of_yojson "AuditReportId" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : describe_certificate_authority_audit_report_request)

let delete_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path } : delete_policy_request)

let delete_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_account =
       option_of_yojson (value_for_key account_id_of_yojson "SourceAccount") _list path;
     principal = value_for_key principal_of_yojson "Principal" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : delete_permission_request)

let delete_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permanent_deletion_time_in_days =
       option_of_yojson
         (value_for_key permanent_deletion_time_in_days_of_yojson "PermanentDeletionTimeInDays")
         _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : delete_certificate_authority_request)

let create_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key action_list_of_yojson "Actions" _list path;
     source_account =
       option_of_yojson (value_for_key account_id_of_yojson "SourceAccount") _list path;
     principal = value_for_key principal_of_yojson "Principal" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : create_permission_request)

let create_certificate_authority_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority_arn =
       option_of_yojson (value_for_key arn_of_yojson "CertificateAuthorityArn") _list path;
   }
    : create_certificate_authority_response)

let create_certificate_authority_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_mode =
       option_of_yojson
         (value_for_key certificate_authority_usage_mode_of_yojson "UsageMode")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     key_storage_security_standard =
       option_of_yojson
         (value_for_key key_storage_security_standard_of_yojson "KeyStorageSecurityStandard")
         _list path;
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     certificate_authority_type =
       value_for_key certificate_authority_type_of_yojson "CertificateAuthorityType" _list path;
     revocation_configuration =
       option_of_yojson
         (value_for_key revocation_configuration_of_yojson "RevocationConfiguration")
         _list path;
     certificate_authority_configuration =
       value_for_key certificate_authority_configuration_of_yojson
         "CertificateAuthorityConfiguration" _list path;
   }
    : create_certificate_authority_request)

let create_certificate_authority_audit_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_key = option_of_yojson (value_for_key s3_key_of_yojson "S3Key") _list path;
     audit_report_id =
       option_of_yojson (value_for_key audit_report_id_of_yojson "AuditReportId") _list path;
   }
    : create_certificate_authority_audit_report_response)

let audit_report_response_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String "JSON" -> JSON
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AuditReportResponseFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "AuditReportResponseFormat")
     : audit_report_response_format)
    : audit_report_response_format)

let create_certificate_authority_audit_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_report_response_format =
       value_for_key audit_report_response_format_of_yojson "AuditReportResponseFormat" _list path;
     s3_bucket_name = value_for_key s3_bucket_name_of_yojson "S3BucketName" _list path;
     certificate_authority_arn = value_for_key arn_of_yojson "CertificateAuthorityArn" _list path;
   }
    : create_certificate_authority_audit_report_request)
