open Smaws_Lib.Json.DeserializeHelpers
open Types

let base_unit_of_yojson = unit_of_yojson

let validation_method_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HTTP" -> HTTP
    | `String "DNS" -> DNS
    | `String "EMAIL" -> EMAIL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationMethod")
     : validation_method)
    : validation_method)

let validation_exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key validation_exception_message_of_yojson "message") _list path;
   }
    : validation_exception)

let string__of_yojson = string_of_yojson
let validation_email_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let arn_of_yojson = string_of_yojson

let certificate_transparency_logging_preference_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CertificateTransparencyLoggingPreference"
             value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateTransparencyLoggingPreference")
     : certificate_transparency_logging_preference)
    : certificate_transparency_logging_preference)

let certificate_export_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateExport" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateExport")
     : certificate_export)
    : certificate_export)

let certificate_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_ = option_of_yojson (value_for_key certificate_export_of_yojson "Export") _list path;
     certificate_transparency_logging_preference =
       option_of_yojson
         (value_for_key certificate_transparency_logging_preference_of_yojson
            "CertificateTransparencyLoggingPreference")
         _list path;
   }
    : certificate_options)

let update_certificate_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     options = value_for_key certificate_options_of_yojson "Options" _list path;
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
   }
    : update_certificate_options_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_state_exception)

let invalid_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_arn_exception)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : too_many_tags_exception)

let availability_error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key availability_error_message_of_yojson "message") _list path;
   }
    : throttling_exception)

let tag_value_of_yojson = string_of_yojson

let tag_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : tag_policy_exception)

let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let t_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let sort_order_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_by_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CREATED_AT" -> CREATED_AT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SortBy")
     : sort_by)
    : sort_by)

let service_error_message_of_yojson = string_of_yojson

let revoke_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : revoke_certificate_response)

let revocation_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "A_A_COMPROMISE" -> A_A_COMPROMISE
    | `String "PRIVILEGE_WITHDRAWN" -> PRIVILEGE_WITHDRAWN
    | `String "REMOVE_FROM_CRL" -> REMOVE_FROM_CRL
    | `String "CERTIFICATE_HOLD" -> CERTIFICATE_HOLD
    | `String "CESSATION_OF_OPERATION" -> CESSATION_OF_OPERATION
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "SUPERCEDED" -> SUPERCEDED
    | `String "AFFILIATION_CHANGED" -> AFFILIATION_CHANGED
    | `String "CA_COMPROMISE" -> CA_COMPROMISE
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
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
   }
    : revoke_certificate_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_in_use_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key service_error_message_of_yojson "Message") _list path;
   }
    : access_denied_exception)

let record_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CNAME" -> CNAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordType")
     : record_type)
    : record_type)

let resource_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "Value" _list path;
     type_ = value_for_key record_type_of_yojson "Type" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : resource_record)

let domain_name_string_of_yojson = string_of_yojson

let resend_validation_email_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validation_domain = value_for_key domain_name_string_of_yojson "ValidationDomain" _list path;
     domain = value_for_key domain_name_string_of_yojson "Domain" _list path;
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
   }
    : resend_validation_email_request)

let invalid_domain_validation_options_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_domain_validation_options_exception)

let request_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : request_in_progress_exception)

let request_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : request_certificate_response)

let domain_list_of_yojson tree path = list_of_yojson domain_name_string_of_yojson tree path
let idempotency_token_of_yojson = string_of_yojson

let domain_validation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validation_domain = value_for_key domain_name_string_of_yojson "ValidationDomain" _list path;
     domain_name = value_for_key domain_name_string_of_yojson "DomainName" _list path;
   }
    : domain_validation_option)

let domain_validation_option_list_of_yojson tree path =
  list_of_yojson domain_validation_option_of_yojson tree path

let pca_arn_of_yojson = string_of_yojson

let key_algorithm_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EC_secp521r1" -> EC_secp521r1
    | `String "EC_secp384r1" -> EC_secp384r1
    | `String "EC_prime256v1" -> EC_prime256v1
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_1024" -> RSA_1024
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAlgorithm")
     : key_algorithm)
    : key_algorithm)

let certificate_managed_by_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CLOUDFRONT" -> CLOUDFRONT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateManagedBy" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateManagedBy")
     : certificate_managed_by)
    : certificate_managed_by)

let request_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     certificate_authority_arn =
       option_of_yojson (value_for_key pca_arn_of_yojson "CertificateAuthorityArn") _list path;
     options = option_of_yojson (value_for_key certificate_options_of_yojson "Options") _list path;
     domain_validation_options =
       option_of_yojson
         (value_for_key domain_validation_option_list_of_yojson "DomainValidationOptions")
         _list path;
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     subject_alternative_names =
       option_of_yojson (value_for_key domain_list_of_yojson "SubjectAlternativeNames") _list path;
     validation_method =
       option_of_yojson (value_for_key validation_method_of_yojson "ValidationMethod") _list path;
     domain_name = value_for_key domain_name_string_of_yojson "DomainName" _list path;
   }
    : request_certificate_request)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_tag_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_parameter_exception)

let renewal_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String "PENDING_AUTO_RENEWAL" -> PENDING_AUTO_RENEWAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalStatus")
     : renewal_status)
    : renewal_status)

let domain_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainStatus")
     : domain_status)
    : domain_status)

let http_redirect_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redirect_to = option_of_yojson (value_for_key string__of_yojson "RedirectTo") _list path;
     redirect_from = option_of_yojson (value_for_key string__of_yojson "RedirectFrom") _list path;
   }
    : http_redirect)

let domain_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validation_method =
       option_of_yojson (value_for_key validation_method_of_yojson "ValidationMethod") _list path;
     http_redirect =
       option_of_yojson (value_for_key http_redirect_of_yojson "HttpRedirect") _list path;
     resource_record =
       option_of_yojson (value_for_key resource_record_of_yojson "ResourceRecord") _list path;
     validation_status =
       option_of_yojson (value_for_key domain_status_of_yojson "ValidationStatus") _list path;
     validation_domain =
       option_of_yojson (value_for_key domain_name_string_of_yojson "ValidationDomain") _list path;
     validation_emails =
       option_of_yojson
         (value_for_key validation_email_list_of_yojson "ValidationEmails")
         _list path;
     domain_name = value_for_key domain_name_string_of_yojson "DomainName" _list path;
   }
    : domain_validation)

let domain_validation_list_of_yojson tree path =
  list_of_yojson domain_validation_of_yojson tree path

let failure_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OTHER" -> OTHER
    | `String "SLR_NOT_FOUND" -> SLR_NOT_FOUND
    | `String "PCA_ACCESS_DENIED" -> PCA_ACCESS_DENIED
    | `String "PCA_INVALID_DURATION" -> PCA_INVALID_DURATION
    | `String "PCA_INVALID_ARGS" -> PCA_INVALID_ARGS
    | `String "PCA_RESOURCE_NOT_FOUND" -> PCA_RESOURCE_NOT_FOUND
    | `String "PCA_NAME_CONSTRAINTS_VALIDATION" -> PCA_NAME_CONSTRAINTS_VALIDATION
    | `String "PCA_REQUEST_FAILED" -> PCA_REQUEST_FAILED
    | `String "PCA_INVALID_STATE" -> PCA_INVALID_STATE
    | `String "PCA_INVALID_ARN" -> PCA_INVALID_ARN
    | `String "PCA_LIMIT_EXCEEDED" -> PCA_LIMIT_EXCEEDED
    | `String "CAA_ERROR" -> CAA_ERROR
    | `String "DOMAIN_VALIDATION_DENIED" -> DOMAIN_VALIDATION_DENIED
    | `String "INVALID_PUBLIC_DOMAIN" -> INVALID_PUBLIC_DOMAIN
    | `String "DOMAIN_NOT_ALLOWED" -> DOMAIN_NOT_ALLOWED
    | `String "ADDITIONAL_VERIFICATION_REQUIRED" -> ADDITIONAL_VERIFICATION_REQUIRED
    | `String "NO_AVAILABLE_CONTACTS" -> NO_AVAILABLE_CONTACTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureReason")
     : failure_reason)
    : failure_reason)

let renewal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = value_for_key t_stamp_of_yojson "UpdatedAt" _list path;
     renewal_status_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "RenewalStatusReason") _list path;
     domain_validation_options =
       value_for_key domain_validation_list_of_yojson "DomainValidationOptions" _list path;
     renewal_status = value_for_key renewal_status_of_yojson "RenewalStatus" _list path;
   }
    : renewal_summary)

let renewal_eligibility_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INELIGIBLE" -> INELIGIBLE
    | `String "ELIGIBLE" -> ELIGIBLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalEligibility" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalEligibility")
     : renewal_eligibility)
    : renewal_eligibility)

let renew_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : renew_certificate_request)

let remove_tags_from_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
   }
    : remove_tags_from_certificate_request)

let positive_integer_of_yojson = int_of_yojson

let expiry_events_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     days_before_expiry =
       option_of_yojson (value_for_key positive_integer_of_yojson "DaysBeforeExpiry") _list path;
   }
    : expiry_events_configuration)

let put_account_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     expiry_events =
       option_of_yojson
         (value_for_key expiry_events_configuration_of_yojson "ExpiryEvents")
         _list path;
   }
    : put_account_configuration_request)

let private_key_blob_of_yojson = blob_of_yojson
let private_key_of_yojson = string_of_yojson
let passphrase_blob_of_yojson = blob_of_yojson
let nullable_boolean_of_yojson = bool_of_yojson
let next_token_of_yojson = string_of_yojson
let max_items_of_yojson = int_of_yojson

let list_tags_for_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_certificate_response)

let list_tags_for_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : list_tags_for_certificate_request)

let certificate_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "REVOKED" -> REVOKED
    | `String "VALIDATION_TIMED_OUT" -> VALIDATION_TIMED_OUT
    | `String "EXPIRED" -> EXPIRED
    | `String "INACTIVE" -> INACTIVE
    | `String "ISSUED" -> ISSUED
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateStatus")
     : certificate_status)
    : certificate_status)

let certificate_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PRIVATE" -> PRIVATE
    | `String "AMAZON_ISSUED" -> AMAZON_ISSUED
    | `String "IMPORTED" -> IMPORTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")
     : certificate_type)
    : certificate_type)

let key_usage_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CUSTOM" -> CUSTOM
    | `String "ANY" -> ANY
    | `String "DECIPHER_ONLY" -> DECIPHER_ONLY
    | `String "ENCIPHER_ONLY" -> ENCHIPER_ONLY
    | `String "CRL_SIGNING" -> CRL_SIGNING
    | `String "CERTIFICATE_SIGNING" -> CERTIFICATE_SIGNING
    | `String "KEY_AGREEMENT" -> KEY_AGREEMENT
    | `String "DATA_ENCIPHERMENT" -> DATA_ENCIPHERMENT
    | `String "KEY_ENCIPHERMENT" -> KEY_ENCIPHERMENT
    | `String "NON_REPUDIATION" -> NON_REPUDATION
    | `String "DIGITAL_SIGNATURE" -> DIGITAL_SIGNATURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyUsageName" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyUsageName")
     : key_usage_name)
    : key_usage_name)

let key_usage_names_of_yojson tree path = list_of_yojson key_usage_name_of_yojson tree path

let extended_key_usage_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CUSTOM" -> CUSTOM
    | `String "NONE" -> NONE
    | `String "ANY" -> ANY
    | `String "IPSEC_USER" -> IPSEC_USER
    | `String "IPSEC_TUNNEL" -> IPSEC_TUNNEL
    | `String "IPSEC_END_SYSTEM" -> IPSEC_END_SYSTEM
    | `String "OCSP_SIGNING" -> OCSP_SIGNING
    | `String "TIME_STAMPING" -> TIME_STAMPING
    | `String "EMAIL_PROTECTION" -> EMAIL_PROTECTION
    | `String "CODE_SIGNING" -> CODE_SIGNING
    | `String "TLS_WEB_CLIENT_AUTHENTICATION" -> TLS_WEB_CLIENT_AUTHENTICATION
    | `String "TLS_WEB_SERVER_AUTHENTICATION" -> TLS_WEB_SERVER_AUTHENTICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExtendedKeyUsageName" value)
    | _ -> raise (deserialize_wrong_type_error path "ExtendedKeyUsageName")
     : extended_key_usage_name)
    : extended_key_usage_name)

let extended_key_usage_names_of_yojson tree path =
  list_of_yojson extended_key_usage_name_of_yojson tree path

let certificate_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
     revoked_at = option_of_yojson (value_for_key t_stamp_of_yojson "RevokedAt") _list path;
     imported_at = option_of_yojson (value_for_key t_stamp_of_yojson "ImportedAt") _list path;
     issued_at = option_of_yojson (value_for_key t_stamp_of_yojson "IssuedAt") _list path;
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     not_after = option_of_yojson (value_for_key t_stamp_of_yojson "NotAfter") _list path;
     not_before = option_of_yojson (value_for_key t_stamp_of_yojson "NotBefore") _list path;
     renewal_eligibility =
       option_of_yojson
         (value_for_key renewal_eligibility_of_yojson "RenewalEligibility")
         _list path;
     exported = option_of_yojson (value_for_key nullable_boolean_of_yojson "Exported") _list path;
     in_use = option_of_yojson (value_for_key nullable_boolean_of_yojson "InUse") _list path;
     export_option =
       option_of_yojson (value_for_key certificate_export_of_yojson "ExportOption") _list path;
     extended_key_usages =
       option_of_yojson
         (value_for_key extended_key_usage_names_of_yojson "ExtendedKeyUsages")
         _list path;
     key_usages = option_of_yojson (value_for_key key_usage_names_of_yojson "KeyUsages") _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key certificate_status_of_yojson "Status") _list path;
     has_additional_subject_alternative_names =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "HasAdditionalSubjectAlternativeNames")
         _list path;
     subject_alternative_name_summaries =
       option_of_yojson
         (value_for_key domain_list_of_yojson "SubjectAlternativeNameSummaries")
         _list path;
     domain_name =
       option_of_yojson (value_for_key domain_name_string_of_yojson "DomainName") _list path;
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
   }
    : certificate_summary)

let certificate_summary_list_of_yojson tree path =
  list_of_yojson certificate_summary_of_yojson tree path

let list_certificates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_summary_list =
       option_of_yojson
         (value_for_key certificate_summary_list_of_yojson "CertificateSummaryList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_certificates_response)

let certificate_statuses_of_yojson tree path = list_of_yojson certificate_status_of_yojson tree path

let extended_key_usage_filter_list_of_yojson tree path =
  list_of_yojson extended_key_usage_name_of_yojson tree path

let key_usage_filter_list_of_yojson tree path = list_of_yojson key_usage_name_of_yojson tree path
let key_algorithm_list_of_yojson tree path = list_of_yojson key_algorithm_of_yojson tree path

let filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "managedBy") _list path;
     export_option =
       option_of_yojson (value_for_key certificate_export_of_yojson "exportOption") _list path;
     key_types = option_of_yojson (value_for_key key_algorithm_list_of_yojson "keyTypes") _list path;
     key_usage =
       option_of_yojson (value_for_key key_usage_filter_list_of_yojson "keyUsage") _list path;
     extended_key_usage =
       option_of_yojson
         (value_for_key extended_key_usage_filter_list_of_yojson "extendedKeyUsage")
         _list path;
   }
    : filters)

let list_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "SortBy") _list path;
     max_items = option_of_yojson (value_for_key max_items_of_yojson "MaxItems") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     includes = option_of_yojson (value_for_key filters_of_yojson "Includes") _list path;
     certificate_statuses =
       option_of_yojson
         (value_for_key certificate_statuses_of_yojson "CertificateStatuses")
         _list path;
   }
    : list_certificates_request)

let invalid_args_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_args_exception)

let key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key key_usage_name_of_yojson "Name") _list path }
    : key_usage)

let key_usage_list_of_yojson tree path = list_of_yojson key_usage_of_yojson tree path
let in_use_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let import_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : import_certificate_response)

let certificate_body_blob_of_yojson = blob_of_yojson
let certificate_chain_blob_of_yojson = blob_of_yojson

let import_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     certificate_chain =
       option_of_yojson
         (value_for_key certificate_chain_blob_of_yojson "CertificateChain")
         _list path;
     private_key = value_for_key private_key_blob_of_yojson "PrivateKey" _list path;
     certificate = value_for_key certificate_body_blob_of_yojson "Certificate" _list path;
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
   }
    : import_certificate_request)

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
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : get_certificate_request)

let get_account_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiry_events =
       option_of_yojson
         (value_for_key expiry_events_configuration_of_yojson "ExpiryEvents")
         _list path;
   }
    : get_account_configuration_response)

let extended_key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oi_d = option_of_yojson (value_for_key string__of_yojson "OID") _list path;
     name = option_of_yojson (value_for_key extended_key_usage_name_of_yojson "Name") _list path;
   }
    : extended_key_usage)

let extended_key_usage_list_of_yojson tree path =
  list_of_yojson extended_key_usage_of_yojson tree path

let export_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_key = option_of_yojson (value_for_key private_key_of_yojson "PrivateKey") _list path;
     certificate_chain =
       option_of_yojson (value_for_key certificate_chain_of_yojson "CertificateChain") _list path;
     certificate =
       option_of_yojson (value_for_key certificate_body_of_yojson "Certificate") _list path;
   }
    : export_certificate_response)

let export_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     passphrase = value_for_key passphrase_blob_of_yojson "Passphrase" _list path;
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
   }
    : export_certificate_request)

let certificate_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     options = option_of_yojson (value_for_key certificate_options_of_yojson "Options") _list path;
     renewal_eligibility =
       option_of_yojson
         (value_for_key renewal_eligibility_of_yojson "RenewalEligibility")
         _list path;
     certificate_authority_arn =
       option_of_yojson (value_for_key arn_of_yojson "CertificateAuthorityArn") _list path;
     extended_key_usages =
       option_of_yojson
         (value_for_key extended_key_usage_list_of_yojson "ExtendedKeyUsages")
         _list path;
     key_usages = option_of_yojson (value_for_key key_usage_list_of_yojson "KeyUsages") _list path;
     renewal_summary =
       option_of_yojson (value_for_key renewal_summary_of_yojson "RenewalSummary") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     in_use_by = option_of_yojson (value_for_key in_use_list_of_yojson "InUseBy") _list path;
     signature_algorithm =
       option_of_yojson (value_for_key string__of_yojson "SignatureAlgorithm") _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     not_after = option_of_yojson (value_for_key t_stamp_of_yojson "NotAfter") _list path;
     not_before = option_of_yojson (value_for_key t_stamp_of_yojson "NotBefore") _list path;
     revocation_reason =
       option_of_yojson (value_for_key revocation_reason_of_yojson "RevocationReason") _list path;
     revoked_at = option_of_yojson (value_for_key t_stamp_of_yojson "RevokedAt") _list path;
     status = option_of_yojson (value_for_key certificate_status_of_yojson "Status") _list path;
     imported_at = option_of_yojson (value_for_key t_stamp_of_yojson "ImportedAt") _list path;
     issued_at = option_of_yojson (value_for_key t_stamp_of_yojson "IssuedAt") _list path;
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     issuer = option_of_yojson (value_for_key string__of_yojson "Issuer") _list path;
     subject = option_of_yojson (value_for_key string__of_yojson "Subject") _list path;
     serial = option_of_yojson (value_for_key string__of_yojson "Serial") _list path;
     domain_validation_options =
       option_of_yojson
         (value_for_key domain_validation_list_of_yojson "DomainValidationOptions")
         _list path;
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
     subject_alternative_names =
       option_of_yojson (value_for_key domain_list_of_yojson "SubjectAlternativeNames") _list path;
     domain_name =
       option_of_yojson (value_for_key domain_name_string_of_yojson "DomainName") _list path;
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
   }
    : certificate_detail)

let describe_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate =
       option_of_yojson (value_for_key certificate_detail_of_yojson "Certificate") _list path;
   }
    : describe_certificate_response)

let describe_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : describe_certificate_request)

let delete_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : delete_certificate_request)

let add_tags_to_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
   }
    : add_tags_to_certificate_request)

let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson
let base_float_of_yojson = float_of_yojson
let base_double_of_yojson = double_of_yojson
let base_short_of_yojson = short_of_yojson
let base_blob_of_yojson = blob_of_yojson
let base_byte_of_yojson = byte_of_yojson
