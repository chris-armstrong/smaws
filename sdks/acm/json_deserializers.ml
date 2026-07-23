open Smaws_Lib.Json.DeserializeHelpers
open Types

let service_error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key service_error_message_of_yojson "Message") _list path;
   }
    : access_denied_exception)

let acme_account_id_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson

let certificate_key_pair_origin_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_MANAGED" -> AWS_MANAGED
    | `String "ACME" -> ACME
    | `String "CUSTOMER_PROVIDED" -> CUSTOMER_PROVIDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateKeyPairOrigin" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateKeyPairOrigin")
     : certificate_key_pair_origin)
    : certificate_key_pair_origin)

let validation_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMAIL" -> EMAIL
    | `String "DNS" -> DNS
    | `String "HTTP" -> HTTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationMethod")
     : validation_method)
    : validation_method)

let certificate_managed_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLOUDFRONT" -> CLOUDFRONT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateManagedBy" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateManagedBy")
     : certificate_managed_by)
    : certificate_managed_by)

let certificate_export_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateExport" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateExport")
     : certificate_export)
    : certificate_export)

let certificate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORTED" -> IMPORTED
    | `String "AMAZON_ISSUED" -> AMAZON_ISSUED
    | `String "PRIVATE" -> PRIVATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")
     : certificate_type)
    : certificate_type)

let renewal_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_AUTO_RENEWAL" -> PENDING_AUTO_RENEWAL
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String "SUCCESS" -> SUCCESS
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalStatus")
     : renewal_status)
    : renewal_status)

let certificate_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String "ISSUED" -> ISSUED
    | `String "INACTIVE" -> INACTIVE
    | `String "EXPIRED" -> EXPIRED
    | `String "VALIDATION_TIMED_OUT" -> VALIDATION_TIMED_OUT
    | `String "REVOKED" -> REVOKED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateStatus")
     : certificate_status)
    : certificate_status)

let t_stamp_of_yojson = timestamp_epoch_seconds_of_yojson

let renewal_eligibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "ELIGIBLE" -> ELIGIBLE
    | `String "INELIGIBLE" -> INELIGIBLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalEligibility" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalEligibility")
     : renewal_eligibility)
    : renewal_eligibility)

let nullable_boolean_of_yojson = bool_of_yojson

let acm_certificate_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     exported = option_of_yojson (value_for_key nullable_boolean_of_yojson "Exported") _list path;
     imported_at = option_of_yojson (value_for_key t_stamp_of_yojson "ImportedAt") _list path;
     in_use = option_of_yojson (value_for_key nullable_boolean_of_yojson "InUse") _list path;
     issued_at = option_of_yojson (value_for_key t_stamp_of_yojson "IssuedAt") _list path;
     renewal_eligibility =
       option_of_yojson
         (value_for_key renewal_eligibility_of_yojson "RenewalEligibility")
         _list path;
     revoked_at = option_of_yojson (value_for_key t_stamp_of_yojson "RevokedAt") _list path;
     status = option_of_yojson (value_for_key certificate_status_of_yojson "Status") _list path;
     renewal_status =
       option_of_yojson (value_for_key renewal_status_of_yojson "RenewalStatus") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     export_option =
       option_of_yojson (value_for_key certificate_export_of_yojson "ExportOption") _list path;
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
     validation_method =
       option_of_yojson (value_for_key validation_method_of_yojson "ValidationMethod") _list path;
     certificate_key_pair_origin =
       option_of_yojson
         (value_for_key certificate_key_pair_origin_of_yojson "CertificateKeyPairOrigin")
         _list path;
     acme_endpoint_arn = option_of_yojson (value_for_key arn_of_yojson "AcmeEndpointArn") _list path;
     acme_account_id =
       option_of_yojson (value_for_key acme_account_id_of_yojson "AcmeAccountId") _list path;
   }
    : acm_certificate_metadata)

let acm_certificate_metadata_filter_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Status" -> Status (certificate_status_of_yojson value_ path)
   | "RenewalStatus" -> RenewalStatus (renewal_status_of_yojson value_ path)
   | "Type" -> Type (certificate_type_of_yojson value_ path)
   | "InUse" -> InUse (nullable_boolean_of_yojson value_ path)
   | "Exported" -> Exported (nullable_boolean_of_yojson value_ path)
   | "ExportOption" -> ExportOption (certificate_export_of_yojson value_ path)
   | "ManagedBy" -> ManagedBy (certificate_managed_by_of_yojson value_ path)
   | "ValidationMethod" -> ValidationMethod (validation_method_of_yojson value_ path)
   | "CertificateKeyPairOrigin" ->
       CertificateKeyPairOrigin (certificate_key_pair_origin_of_yojson value_ path)
   | "AcmeEndpointArn" -> AcmeEndpointArn (arn_of_yojson value_ path)
   | "AcmeAccountId" -> AcmeAccountId (acme_account_id_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "AcmCertificateMetadataFilter" unknown)
    : acm_certificate_metadata_filter)

let contact_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let acme_external_account_binding_arn_of_yojson = string_of_yojson

let acme_account_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALID" -> VALID
    | `String "DEACTIVATED" -> DEACTIVATED
    | `String "REVOKED" -> REVOKED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcmeAccountStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AcmeAccountStatus")
     : acme_account_status)
    : acme_account_status)

let acme_account_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AccountUrl")
         _list path;
     public_key_thumbprint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PublicKeyThumbprint")
         _list path;
     status = option_of_yojson (value_for_key acme_account_status_of_yojson "Status") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     acme_external_account_binding_arn =
       option_of_yojson
         (value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn")
         _list path;
     contacts = option_of_yojson (value_for_key contact_list_of_yojson "Contacts") _list path;
   }
    : acme_account)

let acme_account_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AccountUrl")
         _list path;
     public_key_thumbprint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "PublicKeyThumbprint")
         _list path;
     status = option_of_yojson (value_for_key acme_account_status_of_yojson "Status") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     acme_external_account_binding_arn =
       option_of_yojson
         (value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn")
         _list path;
     contacts = option_of_yojson (value_for_key contact_list_of_yojson "Contacts") _list path;
   }
    : acme_account_summary)

let acme_account_list_of_yojson tree path = list_of_yojson acme_account_summary_of_yojson tree path

let acme_authorization_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRE_APPROVED" -> PRE_APPROVED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AcmeAuthorizationBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "AcmeAuthorizationBehavior")
     : acme_authorization_behavior)
    : acme_authorization_behavior)

let acme_contact_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUIRED" -> REQUIRED
    | `String "NOT_REQUIRED" -> NOT_REQUIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcmeContact" value)
    | _ -> raise (deserialize_wrong_type_error path "AcmeContact")
     : acme_contact)
    : acme_contact)

let acme_domain_validation_failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "DOMAIN_MISMATCH" -> DOMAIN_MISMATCH
    | `String "DOMAIN_NOT_ALLOWED" -> DOMAIN_NOT_ALLOWED
    | `String "ENDPOINT_NOT_ACTIVE" -> ENDPOINT_NOT_ACTIVE
    | `String "HOSTED_ZONE_NOT_FOUND" -> HOSTED_ZONE_NOT_FOUND
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String "INVALID_CHANGE_BATCH" -> INVALID_CHANGE_BATCH
    | `String "INVALID_PUBLIC_DOMAIN" -> INVALID_PUBLIC_DOMAIN
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AcmeDomainValidationFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AcmeDomainValidationFailureReason")
     : acme_domain_validation_failure_reason)
    : acme_domain_validation_failure_reason)

let failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson
         (value_for_key acme_domain_validation_failure_reason_of_yojson "Reason")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : failure_details)

let acme_domain_validation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATING" -> VALIDATING
    | `String "VALID" -> VALID
    | `String "INVALID" -> INVALID
    | `String "DELETING" -> DELETING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AcmeDomainValidationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AcmeDomainValidationStatus")
     : acme_domain_validation_status)
    : acme_domain_validation_status)

let string__of_yojson = string_of_yojson

let record_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CNAME" -> CNAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordType")
     : record_type)
    : record_type)

let resource_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "Name" _list path;
     type_ = value_for_key record_type_of_yojson "Type" _list path;
     value = value_for_key string__of_yojson "Value" _list path;
   }
    : resource_record)

let hosted_zone_id_of_yojson = string_of_yojson

let domain_scope_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainScopeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainScopeOption")
     : domain_scope_option)
    : domain_scope_option)

let domain_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exact_domain =
       option_of_yojson (value_for_key domain_scope_option_of_yojson "ExactDomain") _list path;
     subdomains =
       option_of_yojson (value_for_key domain_scope_option_of_yojson "Subdomains") _list path;
     wildcards =
       option_of_yojson (value_for_key domain_scope_option_of_yojson "Wildcards") _list path;
   }
    : domain_scope)

let dns_prevalidation_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_scope = option_of_yojson (value_for_key domain_scope_of_yojson "DomainScope") _list path;
     hosted_zone_id =
       option_of_yojson (value_for_key hosted_zone_id_of_yojson "HostedZoneId") _list path;
     resource_record =
       option_of_yojson (value_for_key resource_record_of_yojson "ResourceRecord") _list path;
   }
    : dns_prevalidation_details)

let prevalidation_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "DnsPrevalidation" -> DnsPrevalidation (dns_prevalidation_details_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "PrevalidationDetails" unknown)
    : prevalidation_details)

let prevalidation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DNS_PREVALIDATION" -> DNS_PREVALIDATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrevalidationType" value)
    | _ -> raise (deserialize_wrong_type_error path "PrevalidationType")
     : prevalidation_type)
    : prevalidation_type)

let domain_name_of_yojson = string_of_yojson
let acme_endpoint_arn_of_yojson = string_of_yojson
let acme_domain_validation_arn_of_yojson = string_of_yojson

let acme_domain_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation_arn =
       option_of_yojson
         (value_for_key acme_domain_validation_arn_of_yojson "AcmeDomainValidationArn")
         _list path;
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     prevalidation_type =
       option_of_yojson (value_for_key prevalidation_type_of_yojson "PrevalidationType") _list path;
     prevalidation_details =
       option_of_yojson
         (value_for_key prevalidation_details_of_yojson "PrevalidationDetails")
         _list path;
     status =
       option_of_yojson (value_for_key acme_domain_validation_status_of_yojson "Status") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
   }
    : acme_domain_validation)

let acme_domain_validation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation_arn =
       option_of_yojson
         (value_for_key acme_domain_validation_arn_of_yojson "AcmeDomainValidationArn")
         _list path;
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     prevalidation_type =
       option_of_yojson (value_for_key prevalidation_type_of_yojson "PrevalidationType") _list path;
     prevalidation_details =
       option_of_yojson
         (value_for_key prevalidation_details_of_yojson "PrevalidationDetails")
         _list path;
     status =
       option_of_yojson (value_for_key acme_domain_validation_status_of_yojson "Status") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
   }
    : acme_domain_validation_summary)

let acme_domain_validation_list_of_yojson tree path =
  list_of_yojson acme_domain_validation_summary_of_yojson tree path

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let public_key_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_2048" -> RSA_2048
    | `String "EC_prime256v1" -> EC_PRIME256_V1
    | `String "EC_secp384r1" -> EC_SECP384_R1
    | `String value -> raise (deserialize_unknown_enum_value_error path "PublicKeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "PublicKeyAlgorithm")
     : public_key_algorithm)
    : public_key_algorithm)

let public_key_algorithm_list_of_yojson tree path =
  list_of_yojson public_key_algorithm_of_yojson tree path

let public_certificate_authority_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_key_algorithms =
       option_of_yojson
         (value_for_key public_key_algorithm_list_of_yojson "AllowedKeyAlgorithms")
         _list path;
   }
    : public_certificate_authority)

let certificate_authority_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "PublicCertificateAuthority" ->
       PublicCertificateAuthority (public_certificate_authority_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "CertificateAuthority" unknown)
    : certificate_authority)

let acme_endpoint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcmeEndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AcmeEndpointStatus")
     : acme_endpoint_status)
    : acme_endpoint_status)

let acme_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
     endpoint_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "EndpointUrl")
         _list path;
     status = option_of_yojson (value_for_key acme_endpoint_status_of_yojson "Status") _list path;
     failure_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FailureReason")
         _list path;
     authorization_behavior =
       option_of_yojson
         (value_for_key acme_authorization_behavior_of_yojson "AuthorizationBehavior")
         _list path;
     contact = option_of_yojson (value_for_key acme_contact_of_yojson "Contact") _list path;
     certificate_authority =
       option_of_yojson
         (value_for_key certificate_authority_of_yojson "CertificateAuthority")
         _list path;
     certificate_tags =
       option_of_yojson (value_for_key tag_list_of_yojson "CertificateTags") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
   }
    : acme_endpoint)

let acme_endpoint_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
     endpoint_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "EndpointUrl")
         _list path;
     status = option_of_yojson (value_for_key acme_endpoint_status_of_yojson "Status") _list path;
     failure_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FailureReason")
         _list path;
     authorization_behavior =
       option_of_yojson
         (value_for_key acme_authorization_behavior_of_yojson "AuthorizationBehavior")
         _list path;
     contact = option_of_yojson (value_for_key acme_contact_of_yojson "Contact") _list path;
     certificate_authority =
       option_of_yojson
         (value_for_key certificate_authority_of_yojson "CertificateAuthority")
         _list path;
     certificate_tags =
       option_of_yojson (value_for_key tag_list_of_yojson "CertificateTags") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
   }
    : acme_endpoint_summary)

let acme_endpoint_list_of_yojson tree path =
  list_of_yojson acme_endpoint_summary_of_yojson tree path

let role_arn_of_yojson = string_of_yojson

let acme_external_account_binding_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_external_account_binding_arn =
       option_of_yojson
         (value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn")
         _list path;
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ExpiresAt")
         _list path;
     revoked_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "RevokedAt")
         _list path;
     last_used_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastUsedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
   }
    : acme_external_account_binding)

let acme_external_account_binding_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_external_account_binding_arn =
       option_of_yojson
         (value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn")
         _list path;
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ExpiresAt")
         _list path;
     revoked_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "RevokedAt")
         _list path;
     last_used_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "LastUsedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UpdatedAt")
         _list path;
   }
    : acme_external_account_binding_summary)

let acme_external_account_binding_list_of_yojson tree path =
  list_of_yojson acme_external_account_binding_summary_of_yojson tree path

let validation_exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key validation_exception_message_of_yojson "message") _list path;
   }
    : validation_exception)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : too_many_tags_exception)

let coral_availability_throttled_resource_of_yojson = string_of_yojson
let coral_availability_throttling_reason_of_yojson = string_of_yojson

let throttling_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson
         (value_for_key coral_availability_throttling_reason_of_yojson "reason")
         _list path;
     resource =
       option_of_yojson
         (value_for_key coral_availability_throttled_resource_of_yojson "resource")
         _list path;
   }
    : throttling_reason)

let throttling_reason_list_of_yojson tree path =
  list_of_yojson throttling_reason_of_yojson tree path

let availability_error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key availability_error_message_of_yojson "message") _list path;
     throttling_reasons =
       option_of_yojson
         (value_for_key throttling_reason_list_of_yojson "throttlingReasons")
         _list path;
   }
    : throttling_exception)

let tag_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : tag_policy_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_not_found_exception)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_tag_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_parameter_exception)

let invalid_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_arn_exception)

let add_tags_to_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : add_tags_to_certificate_request)

let certificate_body_of_yojson = string_of_yojson
let certificate_body_blob_of_yojson = blob_of_yojson
let certificate_chain_of_yojson = string_of_yojson
let certificate_chain_blob_of_yojson = blob_of_yojson

let certificate_transparency_logging_preference_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CertificateTransparencyLoggingPreference"
             value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateTransparencyLoggingPreference")
     : certificate_transparency_logging_preference)
    : certificate_transparency_logging_preference)

let certificate_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_transparency_logging_preference =
       option_of_yojson
         (value_for_key certificate_transparency_logging_preference_of_yojson
            "CertificateTransparencyLoggingPreference")
         _list path;
     export_ = option_of_yojson (value_for_key certificate_export_of_yojson "Export") _list path;
   }
    : certificate_options)

let extended_key_usage_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS_WEB_SERVER_AUTHENTICATION" -> TLS_WEB_SERVER_AUTHENTICATION
    | `String "TLS_WEB_CLIENT_AUTHENTICATION" -> TLS_WEB_CLIENT_AUTHENTICATION
    | `String "CODE_SIGNING" -> CODE_SIGNING
    | `String "EMAIL_PROTECTION" -> EMAIL_PROTECTION
    | `String "TIME_STAMPING" -> TIME_STAMPING
    | `String "OCSP_SIGNING" -> OCSP_SIGNING
    | `String "IPSEC_END_SYSTEM" -> IPSEC_END_SYSTEM
    | `String "IPSEC_TUNNEL" -> IPSEC_TUNNEL
    | `String "IPSEC_USER" -> IPSEC_USER
    | `String "ANY" -> ANY
    | `String "NONE" -> NONE
    | `String "CUSTOM" -> CUSTOM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExtendedKeyUsageName" value)
    | _ -> raise (deserialize_wrong_type_error path "ExtendedKeyUsageName")
     : extended_key_usage_name)
    : extended_key_usage_name)

let extended_key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key extended_key_usage_name_of_yojson "Name") _list path;
     oi_d = option_of_yojson (value_for_key string__of_yojson "OID") _list path;
   }
    : extended_key_usage)

let extended_key_usage_list_of_yojson tree path =
  list_of_yojson extended_key_usage_of_yojson tree path

let key_usage_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "DIGITAL_SIGNATURE" -> DIGITAL_SIGNATURE
    | `String "NON_REPUDIATION" -> NON_REPUDATION
    | `String "KEY_ENCIPHERMENT" -> KEY_ENCIPHERMENT
    | `String "DATA_ENCIPHERMENT" -> DATA_ENCIPHERMENT
    | `String "KEY_AGREEMENT" -> KEY_AGREEMENT
    | `String "CERTIFICATE_SIGNING" -> CERTIFICATE_SIGNING
    | `String "CRL_SIGNING" -> CRL_SIGNING
    | `String "ENCIPHER_ONLY" -> ENCHIPER_ONLY
    | `String "DECIPHER_ONLY" -> DECIPHER_ONLY
    | `String "ANY" -> ANY
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyUsageName" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyUsageName")
     : key_usage_name)
    : key_usage_name)

let key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key key_usage_name_of_yojson "Name") _list path }
    : key_usage)

let key_usage_list_of_yojson tree path = list_of_yojson key_usage_of_yojson tree path

let failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_AVAILABLE_CONTACTS" -> NO_AVAILABLE_CONTACTS
    | `String "ADDITIONAL_VERIFICATION_REQUIRED" -> ADDITIONAL_VERIFICATION_REQUIRED
    | `String "DOMAIN_NOT_ALLOWED" -> DOMAIN_NOT_ALLOWED
    | `String "INVALID_PUBLIC_DOMAIN" -> INVALID_PUBLIC_DOMAIN
    | `String "DOMAIN_VALIDATION_DENIED" -> DOMAIN_VALIDATION_DENIED
    | `String "CAA_ERROR" -> CAA_ERROR
    | `String "PCA_LIMIT_EXCEEDED" -> PCA_LIMIT_EXCEEDED
    | `String "PCA_INVALID_ARN" -> PCA_INVALID_ARN
    | `String "PCA_INVALID_STATE" -> PCA_INVALID_STATE
    | `String "PCA_REQUEST_FAILED" -> PCA_REQUEST_FAILED
    | `String "PCA_NAME_CONSTRAINTS_VALIDATION" -> PCA_NAME_CONSTRAINTS_VALIDATION
    | `String "PCA_RESOURCE_NOT_FOUND" -> PCA_RESOURCE_NOT_FOUND
    | `String "PCA_INVALID_ARGS" -> PCA_INVALID_ARGS
    | `String "PCA_INVALID_DURATION" -> PCA_INVALID_DURATION
    | `String "PCA_ACCESS_DENIED" -> PCA_ACCESS_DENIED
    | `String "SLR_NOT_FOUND" -> SLR_NOT_FOUND
    | `String "OTHER" -> OTHER
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureReason")
     : failure_reason)
    : failure_reason)

let http_redirect_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redirect_from = option_of_yojson (value_for_key string__of_yojson "RedirectFrom") _list path;
     redirect_to = option_of_yojson (value_for_key string__of_yojson "RedirectTo") _list path;
   }
    : http_redirect)

let domain_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String "SUCCESS" -> SUCCESS
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainStatus")
     : domain_status)
    : domain_status)

let domain_name_string_of_yojson = string_of_yojson
let validation_email_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let domain_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_string_of_yojson "DomainName" _list path;
     validation_emails =
       option_of_yojson
         (value_for_key validation_email_list_of_yojson "ValidationEmails")
         _list path;
     validation_domain =
       option_of_yojson (value_for_key domain_name_string_of_yojson "ValidationDomain") _list path;
     validation_status =
       option_of_yojson (value_for_key domain_status_of_yojson "ValidationStatus") _list path;
     resource_record =
       option_of_yojson (value_for_key resource_record_of_yojson "ResourceRecord") _list path;
     http_redirect =
       option_of_yojson (value_for_key http_redirect_of_yojson "HttpRedirect") _list path;
     validation_method =
       option_of_yojson (value_for_key validation_method_of_yojson "ValidationMethod") _list path;
   }
    : domain_validation)

let domain_validation_list_of_yojson tree path =
  list_of_yojson domain_validation_of_yojson tree path

let renewal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     renewal_status = value_for_key renewal_status_of_yojson "RenewalStatus" _list path;
     domain_validation_options =
       value_for_key domain_validation_list_of_yojson "DomainValidationOptions" _list path;
     renewal_status_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "RenewalStatusReason") _list path;
     updated_at = value_for_key t_stamp_of_yojson "UpdatedAt" _list path;
   }
    : renewal_summary)

let in_use_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let key_algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "RSA_1024" -> RSA_1024
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_4096" -> RSA_4096
    | `String "EC_prime256v1" -> EC_prime256v1
    | `String "EC_secp384r1" -> EC_secp384r1
    | `String "EC_secp521r1" -> EC_secp521r1
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAlgorithm")
     : key_algorithm)
    : key_algorithm)

let revocation_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNSPECIFIED" -> UNSPECIFIED
    | `String "KEY_COMPROMISE" -> KEY_COMPROMISE
    | `String "CA_COMPROMISE" -> CA_COMPROMISE
    | `String "AFFILIATION_CHANGED" -> AFFILIATION_CHANGED
    | `String "SUPERCEDED" -> SUPERCEDED
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "CESSATION_OF_OPERATION" -> CESSATION_OF_OPERATION
    | `String "CERTIFICATE_HOLD" -> CERTIFICATE_HOLD
    | `String "REMOVE_FROM_CRL" -> REMOVE_FROM_CRL
    | `String "PRIVILEGE_WITHDRAWN" -> PRIVILEGE_WITHDRAWN
    | `String "A_A_COMPROMISE" -> A_A_COMPROMISE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RevocationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "RevocationReason")
     : revocation_reason)
    : revocation_reason)

let domain_list_of_yojson tree path = list_of_yojson domain_name_string_of_yojson tree path

let certificate_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
     domain_name =
       option_of_yojson (value_for_key domain_name_string_of_yojson "DomainName") _list path;
     subject_alternative_names =
       option_of_yojson (value_for_key domain_list_of_yojson "SubjectAlternativeNames") _list path;
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
     domain_validation_options =
       option_of_yojson
         (value_for_key domain_validation_list_of_yojson "DomainValidationOptions")
         _list path;
     serial = option_of_yojson (value_for_key string__of_yojson "Serial") _list path;
     subject = option_of_yojson (value_for_key string__of_yojson "Subject") _list path;
     issuer = option_of_yojson (value_for_key string__of_yojson "Issuer") _list path;
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     issued_at = option_of_yojson (value_for_key t_stamp_of_yojson "IssuedAt") _list path;
     imported_at = option_of_yojson (value_for_key t_stamp_of_yojson "ImportedAt") _list path;
     status = option_of_yojson (value_for_key certificate_status_of_yojson "Status") _list path;
     revoked_at = option_of_yojson (value_for_key t_stamp_of_yojson "RevokedAt") _list path;
     revocation_reason =
       option_of_yojson (value_for_key revocation_reason_of_yojson "RevocationReason") _list path;
     not_before = option_of_yojson (value_for_key t_stamp_of_yojson "NotBefore") _list path;
     not_after = option_of_yojson (value_for_key t_stamp_of_yojson "NotAfter") _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     signature_algorithm =
       option_of_yojson (value_for_key string__of_yojson "SignatureAlgorithm") _list path;
     in_use_by = option_of_yojson (value_for_key in_use_list_of_yojson "InUseBy") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     renewal_summary =
       option_of_yojson (value_for_key renewal_summary_of_yojson "RenewalSummary") _list path;
     key_usages = option_of_yojson (value_for_key key_usage_list_of_yojson "KeyUsages") _list path;
     extended_key_usages =
       option_of_yojson
         (value_for_key extended_key_usage_list_of_yojson "ExtendedKeyUsages")
         _list path;
     certificate_authority_arn =
       option_of_yojson (value_for_key arn_of_yojson "CertificateAuthorityArn") _list path;
     renewal_eligibility =
       option_of_yojson
         (value_for_key renewal_eligibility_of_yojson "RenewalEligibility")
         _list path;
     options = option_of_yojson (value_for_key certificate_options_of_yojson "Options") _list path;
     certificate_key_pair_origin =
       option_of_yojson
         (value_for_key certificate_key_pair_origin_of_yojson "CertificateKeyPairOrigin")
         _list path;
     acme_endpoint_arn = option_of_yojson (value_for_key arn_of_yojson "AcmeEndpointArn") _list path;
     acme_account_id =
       option_of_yojson (value_for_key acme_account_id_of_yojson "AcmeAccountId") _list path;
   }
    : certificate_detail)

let timestamp_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start = option_of_yojson (value_for_key t_stamp_of_yojson "Start") _list path;
     end_ = option_of_yojson (value_for_key t_stamp_of_yojson "End") _list path;
   }
    : timestamp_range)

let serial_number_of_yojson = string_of_yojson

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTAINS" -> CONTAINS
    | `String "EQUALS" -> EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let filter_string_of_yojson = string_of_yojson

let dns_name_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key filter_string_of_yojson "Value" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
   }
    : dns_name_filter)

let subject_alternative_name_filter_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "DnsName" -> DnsName (dns_name_filter_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "SubjectAlternativeNameFilter" unknown)
    : subject_alternative_name_filter)

let common_name_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key filter_string_of_yojson "Value" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
   }
    : common_name_filter)

let subject_filter_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "CommonName" -> CommonName (common_name_filter_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SubjectFilter" unknown)
    : subject_filter)

let x509_attribute_filter_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Subject" -> Subject (subject_filter_of_yojson value_ path)
   | "SubjectAlternativeName" ->
       SubjectAlternativeName (subject_alternative_name_filter_of_yojson value_ path)
   | "ExtendedKeyUsage" -> ExtendedKeyUsage (extended_key_usage_name_of_yojson value_ path)
   | "KeyUsage" -> KeyUsage (key_usage_name_of_yojson value_ path)
   | "KeyAlgorithm" -> KeyAlgorithm (key_algorithm_of_yojson value_ path)
   | "SerialNumber" -> SerialNumber (serial_number_of_yojson value_ path)
   | "NotAfter" -> NotAfter (timestamp_range_of_yojson value_ path)
   | "NotBefore" -> NotBefore (timestamp_range_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "X509AttributeFilter" unknown)
    : x509_attribute_filter)

let certificate_filter_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "CertificateArn" -> CertificateArn (arn_of_yojson value_ path)
   | "X509AttributeFilter" -> X509AttributeFilter (x509_attribute_filter_of_yojson value_ path)
   | "AcmCertificateMetadataFilter" ->
       AcmCertificateMetadataFilter (acm_certificate_metadata_filter_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "CertificateFilter" unknown)
    : certificate_filter)

let rec certificate_filter_statement_list_of_yojson tree path =
  list_of_yojson certificate_filter_statement_of_yojson tree path

and certificate_filter_statement_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "And" -> And (certificate_filter_statement_list_of_yojson value_ path)
   | "Or" -> Or (certificate_filter_statement_list_of_yojson value_ path)
   | "Not" -> Not (certificate_filter_statement_of_yojson value_ path)
   | "Filter" -> Filter (certificate_filter_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "CertificateFilterStatement" unknown)
    : certificate_filter_statement)

let certificate_key_pair_origins_of_yojson tree path =
  list_of_yojson certificate_key_pair_origin_of_yojson tree path

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_state_exception)

let update_certificate_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     options = value_for_key certificate_options_of_yojson "Options" _list path;
   }
    : update_certificate_options_request)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : conflict_exception)

let update_acme_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
     authorization_behavior =
       option_of_yojson
         (value_for_key acme_authorization_behavior_of_yojson "AuthorizationBehavior")
         _list path;
     contact = option_of_yojson (value_for_key acme_contact_of_yojson "Contact") _list path;
     certificate_authority =
       option_of_yojson
         (value_for_key certificate_authority_of_yojson "CertificateAuthority")
         _list path;
   }
    : update_acme_endpoint_request)

let dns_prevalidation_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_scope = option_of_yojson (value_for_key domain_scope_of_yojson "DomainScope") _list path;
     hosted_zone_id =
       option_of_yojson (value_for_key hosted_zone_id_of_yojson "HostedZoneId") _list path;
   }
    : dns_prevalidation_options)

let prevalidation_options_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "DnsPrevalidation" -> DnsPrevalidation (dns_prevalidation_options_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "PrevalidationOptions" unknown)
    : prevalidation_options)

let update_acme_domain_validation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation_arn =
       value_for_key acme_domain_validation_arn_of_yojson "AcmeDomainValidationArn" _list path;
     prevalidation_options =
       option_of_yojson
         (value_for_key prevalidation_options_of_yojson "PrevalidationOptions")
         _list path;
   }
    : update_acme_domain_validation_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : service_quota_exceeded_exception)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let next_token_of_yojson = string_of_yojson

let certificate_metadata_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "AcmCertificateMetadata" ->
       AcmCertificateMetadata (acm_certificate_metadata_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "CertificateMetadata" unknown)
    : certificate_metadata)

let key_usage_names_of_yojson tree path = list_of_yojson key_usage_name_of_yojson tree path

let extended_key_usage_names_of_yojson tree path =
  list_of_yojson extended_key_usage_name_of_yojson tree path

let other_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     object_identifier =
       option_of_yojson (value_for_key string__of_yojson "ObjectIdentifier") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
   }
    : other_name)

let custom_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     object_identifier =
       option_of_yojson (value_for_key string__of_yojson "ObjectIdentifier") _list path;
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
   }
    : custom_attribute)

let custom_attribute_list_of_yojson tree path = list_of_yojson custom_attribute_of_yojson tree path
let domain_component_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let distinguished_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     common_name = option_of_yojson (value_for_key string__of_yojson "CommonName") _list path;
     domain_components =
       option_of_yojson
         (value_for_key domain_component_list_of_yojson "DomainComponents")
         _list path;
     country = option_of_yojson (value_for_key string__of_yojson "Country") _list path;
     custom_attributes =
       option_of_yojson
         (value_for_key custom_attribute_list_of_yojson "CustomAttributes")
         _list path;
     distinguished_name_qualifier =
       option_of_yojson (value_for_key string__of_yojson "DistinguishedNameQualifier") _list path;
     generation_qualifier =
       option_of_yojson (value_for_key string__of_yojson "GenerationQualifier") _list path;
     given_name = option_of_yojson (value_for_key string__of_yojson "GivenName") _list path;
     initials = option_of_yojson (value_for_key string__of_yojson "Initials") _list path;
     locality = option_of_yojson (value_for_key string__of_yojson "Locality") _list path;
     organization = option_of_yojson (value_for_key string__of_yojson "Organization") _list path;
     organizational_unit =
       option_of_yojson (value_for_key string__of_yojson "OrganizationalUnit") _list path;
     pseudonym = option_of_yojson (value_for_key string__of_yojson "Pseudonym") _list path;
     serial_number = option_of_yojson (value_for_key string__of_yojson "SerialNumber") _list path;
     state = option_of_yojson (value_for_key string__of_yojson "State") _list path;
     surname = option_of_yojson (value_for_key string__of_yojson "Surname") _list path;
     title = option_of_yojson (value_for_key string__of_yojson "Title") _list path;
   }
    : distinguished_name)

let general_name_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "DirectoryName" -> DirectoryName (distinguished_name_of_yojson value_ path)
   | "DnsName" -> DnsName (string__of_yojson value_ path)
   | "IpAddress" -> IpAddress (string__of_yojson value_ path)
   | "OtherName" -> OtherName (other_name_of_yojson value_ path)
   | "RegisteredId" -> RegisteredId (string__of_yojson value_ path)
   | "Rfc822Name" -> Rfc822Name (string__of_yojson value_ path)
   | "UniformResourceIdentifier" -> UniformResourceIdentifier (string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "GeneralName" unknown)
    : general_name)

let general_name_list_of_yojson tree path = list_of_yojson general_name_of_yojson tree path

let x509_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuer = option_of_yojson (value_for_key distinguished_name_of_yojson "Issuer") _list path;
     subject = option_of_yojson (value_for_key distinguished_name_of_yojson "Subject") _list path;
     subject_alternative_names =
       option_of_yojson
         (value_for_key general_name_list_of_yojson "SubjectAlternativeNames")
         _list path;
     extended_key_usages =
       option_of_yojson
         (value_for_key extended_key_usage_names_of_yojson "ExtendedKeyUsages")
         _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     key_usages = option_of_yojson (value_for_key key_usage_names_of_yojson "KeyUsages") _list path;
     serial_number =
       option_of_yojson (value_for_key serial_number_of_yojson "SerialNumber") _list path;
     not_after = option_of_yojson (value_for_key t_stamp_of_yojson "NotAfter") _list path;
     not_before = option_of_yojson (value_for_key t_stamp_of_yojson "NotBefore") _list path;
   }
    : x509_attributes)

let certificate_search_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
     x509_attributes =
       option_of_yojson (value_for_key x509_attributes_of_yojson "X509Attributes") _list path;
     certificate_metadata =
       option_of_yojson
         (value_for_key certificate_metadata_of_yojson "CertificateMetadata")
         _list path;
   }
    : certificate_search_result)

let certificate_search_result_list_of_yojson tree path =
  list_of_yojson certificate_search_result_of_yojson tree path

let search_certificates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results =
       option_of_yojson
         (value_for_key certificate_search_result_list_of_yojson "Results")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : search_certificates_response)

let search_certificates_sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SearchCertificatesSortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SearchCertificatesSortOrder")
     : search_certificates_sort_order)
    : search_certificates_sort_order)

let search_certificates_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED_AT" -> CREATED_AT
    | `String "NOT_AFTER" -> NOT_AFTER
    | `String "STATUS" -> STATUS
    | `String "RENEWAL_STATUS" -> RENEWAL_STATUS
    | `String "EXPORTED" -> EXPORTED
    | `String "IN_USE" -> IN_USE
    | `String "NOT_BEFORE" -> NOT_BEFORE
    | `String "KEY_ALGORITHM" -> KEY_ALGORITHM
    | `String "TYPE" -> TYPE
    | `String "CERTIFICATE_ARN" -> CERTIFICATE_ARN
    | `String "COMMON_NAME" -> COMMON_NAME
    | `String "REVOKED_AT" -> REVOKED_AT
    | `String "RENEWAL_ELIGIBILITY" -> RENEWAL_ELIGIBILITY
    | `String "ISSUED_AT" -> ISSUED_AT
    | `String "MANAGED_BY" -> MANAGED_BY
    | `String "EXPORT_OPTION" -> EXPORT_OPTION
    | `String "VALIDATION_METHOD" -> VALIDATION_METHOD
    | `String "IMPORTED_AT" -> IMPORTED_AT
    | `String "ACME_ENDPOINT_ARN" -> ACME_ENDPOINT_ARN
    | `String "ACME_ACCOUNT_ID" -> ACME_ACCOUNT_ID
    | `String "CERTIFICATE_KEY_PAIR_ORIGIN" -> CERTIFICATE_KEY_PAIR_ORIGIN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SearchCertificatesSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SearchCertificatesSortBy")
     : search_certificates_sort_by)
    : search_certificates_sort_by)

let search_max_results_of_yojson = int_of_yojson

let search_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_statement =
       option_of_yojson
         (value_for_key certificate_filter_statement_of_yojson "FilterStatement")
         _list path;
     max_results =
       option_of_yojson (value_for_key search_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     sort_by =
       option_of_yojson (value_for_key search_certificates_sort_by_of_yojson "SortBy") _list path;
     sort_order =
       option_of_yojson
         (value_for_key search_certificates_sort_order_of_yojson "SortOrder")
         _list path;
   }
    : search_certificates_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_in_use_exception)

let revoke_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : revoke_certificate_response)

let revoke_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     revocation_reason = value_for_key revocation_reason_of_yojson "RevocationReason" _list path;
   }
    : revoke_certificate_request)

let revoke_acme_external_account_binding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_external_account_binding_arn =
       value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn"
         _list path;
   }
    : revoke_acme_external_account_binding_request)

let revoke_acme_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
     account_url =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AccountUrl" _list
         path;
   }
    : revoke_acme_account_request)

let invalid_domain_validation_options_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_domain_validation_options_exception)

let resend_validation_email_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     domain = value_for_key domain_name_string_of_yojson "Domain" _list path;
     validation_domain = value_for_key domain_name_string_of_yojson "ValidationDomain" _list path;
   }
    : resend_validation_email_request)

let request_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : request_certificate_response)

let pca_arn_of_yojson = string_of_yojson

let domain_validation_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_string_of_yojson "DomainName" _list path;
     validation_domain = value_for_key domain_name_string_of_yojson "ValidationDomain" _list path;
   }
    : domain_validation_option)

let domain_validation_option_list_of_yojson tree path =
  list_of_yojson domain_validation_option_of_yojson tree path

let idempotency_token_of_yojson = string_of_yojson

let request_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_string_of_yojson "DomainName" _list path;
     validation_method =
       option_of_yojson (value_for_key validation_method_of_yojson "ValidationMethod") _list path;
     subject_alternative_names =
       option_of_yojson (value_for_key domain_list_of_yojson "SubjectAlternativeNames") _list path;
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     domain_validation_options =
       option_of_yojson
         (value_for_key domain_validation_option_list_of_yojson "DomainValidationOptions")
         _list path;
     options = option_of_yojson (value_for_key certificate_options_of_yojson "Options") _list path;
     certificate_authority_arn =
       option_of_yojson (value_for_key pca_arn_of_yojson "CertificateAuthorityArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
   }
    : request_certificate_request)

let request_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : request_in_progress_exception)

let renew_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : renew_certificate_request)

let remove_tags_from_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
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
     expiry_events =
       option_of_yojson
         (value_for_key expiry_events_configuration_of_yojson "ExpiryEvents")
         _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
   }
    : put_account_configuration_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_tags_for_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_certificate_response)

let list_tags_for_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : list_tags_for_certificate_request)

let invalid_args_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_args_exception)

let certificate_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
     domain_name =
       option_of_yojson (value_for_key domain_name_string_of_yojson "DomainName") _list path;
     subject_alternative_name_summaries =
       option_of_yojson
         (value_for_key domain_list_of_yojson "SubjectAlternativeNameSummaries")
         _list path;
     has_additional_subject_alternative_names =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "HasAdditionalSubjectAlternativeNames")
         _list path;
     status = option_of_yojson (value_for_key certificate_status_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     key_algorithm =
       option_of_yojson (value_for_key key_algorithm_of_yojson "KeyAlgorithm") _list path;
     key_usages = option_of_yojson (value_for_key key_usage_names_of_yojson "KeyUsages") _list path;
     extended_key_usages =
       option_of_yojson
         (value_for_key extended_key_usage_names_of_yojson "ExtendedKeyUsages")
         _list path;
     export_option =
       option_of_yojson (value_for_key certificate_export_of_yojson "ExportOption") _list path;
     in_use = option_of_yojson (value_for_key nullable_boolean_of_yojson "InUse") _list path;
     exported = option_of_yojson (value_for_key nullable_boolean_of_yojson "Exported") _list path;
     renewal_eligibility =
       option_of_yojson
         (value_for_key renewal_eligibility_of_yojson "RenewalEligibility")
         _list path;
     not_before = option_of_yojson (value_for_key t_stamp_of_yojson "NotBefore") _list path;
     not_after = option_of_yojson (value_for_key t_stamp_of_yojson "NotAfter") _list path;
     created_at = option_of_yojson (value_for_key t_stamp_of_yojson "CreatedAt") _list path;
     issued_at = option_of_yojson (value_for_key t_stamp_of_yojson "IssuedAt") _list path;
     imported_at = option_of_yojson (value_for_key t_stamp_of_yojson "ImportedAt") _list path;
     revoked_at = option_of_yojson (value_for_key t_stamp_of_yojson "RevokedAt") _list path;
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "ManagedBy") _list path;
     certificate_key_pair_origin =
       option_of_yojson
         (value_for_key certificate_key_pair_origin_of_yojson "CertificateKeyPairOrigin")
         _list path;
   }
    : certificate_summary)

let certificate_summary_list_of_yojson tree path =
  list_of_yojson certificate_summary_of_yojson tree path

let list_certificates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     certificate_summary_list =
       option_of_yojson
         (value_for_key certificate_summary_list_of_yojson "CertificateSummaryList")
         _list path;
   }
    : list_certificates_response)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED_AT" -> CREATED_AT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SortBy")
     : sort_by)
    : sort_by)

let max_items_of_yojson = int_of_yojson
let key_algorithm_list_of_yojson tree path = list_of_yojson key_algorithm_of_yojson tree path
let key_usage_filter_list_of_yojson tree path = list_of_yojson key_usage_name_of_yojson tree path

let extended_key_usage_filter_list_of_yojson tree path =
  list_of_yojson extended_key_usage_name_of_yojson tree path

let filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extended_key_usage =
       option_of_yojson
         (value_for_key extended_key_usage_filter_list_of_yojson "extendedKeyUsage")
         _list path;
     key_usage =
       option_of_yojson (value_for_key key_usage_filter_list_of_yojson "keyUsage") _list path;
     key_types = option_of_yojson (value_for_key key_algorithm_list_of_yojson "keyTypes") _list path;
     export_option =
       option_of_yojson (value_for_key certificate_export_of_yojson "exportOption") _list path;
     managed_by =
       option_of_yojson (value_for_key certificate_managed_by_of_yojson "managedBy") _list path;
   }
    : filters)

let certificate_statuses_of_yojson tree path = list_of_yojson certificate_status_of_yojson tree path

let list_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_statuses =
       option_of_yojson
         (value_for_key certificate_statuses_of_yojson "CertificateStatuses")
         _list path;
     certificate_key_pair_origins =
       option_of_yojson
         (value_for_key certificate_key_pair_origins_of_yojson "CertificateKeyPairOrigins")
         _list path;
     includes = option_of_yojson (value_for_key filters_of_yojson "Includes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_items = option_of_yojson (value_for_key max_items_of_yojson "MaxItems") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "SortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : list_certificates_request)

let list_acme_external_account_bindings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_account_bindings =
       option_of_yojson
         (value_for_key acme_external_account_binding_list_of_yojson "ExternalAccountBindings")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_acme_external_account_bindings_response)

let list_acme_external_account_bindings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
   }
    : list_acme_external_account_bindings_request)

let list_acme_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoints =
       option_of_yojson (value_for_key acme_endpoint_list_of_yojson "AcmeEndpoints") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_acme_endpoints_response)

let list_acme_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
   }
    : list_acme_endpoints_request)

let list_acme_domain_validations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validations =
       option_of_yojson
         (value_for_key acme_domain_validation_list_of_yojson "AcmeDomainValidations")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_acme_domain_validations_response)

let list_acme_domain_validations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
   }
    : list_acme_domain_validations_request)

let list_acme_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_accounts =
       option_of_yojson (value_for_key acme_account_list_of_yojson "AcmeAccounts") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_acme_accounts_response)

let list_acme_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
   }
    : list_acme_accounts_request)

let import_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path }
    : import_certificate_response)

let private_key_blob_of_yojson = blob_of_yojson

let import_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = option_of_yojson (value_for_key arn_of_yojson "CertificateArn") _list path;
     certificate = value_for_key certificate_body_blob_of_yojson "Certificate" _list path;
     private_key = value_for_key private_key_blob_of_yojson "PrivateKey" _list path;
     certificate_chain =
       option_of_yojson
         (value_for_key certificate_chain_blob_of_yojson "CertificateChain")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : import_certificate_request)

let get_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate =
       option_of_yojson (value_for_key certificate_body_of_yojson "Certificate") _list path;
     certificate_chain =
       option_of_yojson (value_for_key certificate_chain_of_yojson "CertificateChain") _list path;
   }
    : get_certificate_response)

let get_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : get_certificate_request)

let mac_key_of_yojson = string_of_yojson

let get_acme_external_account_binding_credentials_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "KeyId")
         _list path;
     mac_key = option_of_yojson (value_for_key mac_key_of_yojson "MacKey") _list path;
   }
    : get_acme_external_account_binding_credentials_response)

let get_acme_external_account_binding_credentials_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_external_account_binding_arn =
       value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn"
         _list path;
   }
    : get_acme_external_account_binding_credentials_request)

let get_account_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiry_events =
       option_of_yojson
         (value_for_key expiry_events_configuration_of_yojson "ExpiryEvents")
         _list path;
   }
    : get_account_configuration_response)

let private_key_of_yojson = string_of_yojson

let export_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate =
       option_of_yojson (value_for_key certificate_body_of_yojson "Certificate") _list path;
     certificate_chain =
       option_of_yojson (value_for_key certificate_chain_of_yojson "CertificateChain") _list path;
     private_key = option_of_yojson (value_for_key private_key_of_yojson "PrivateKey") _list path;
   }
    : export_certificate_response)

let passphrase_blob_of_yojson = blob_of_yojson

let export_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path;
     passphrase = value_for_key passphrase_blob_of_yojson "Passphrase" _list path;
   }
    : export_certificate_request)

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

let describe_acme_external_account_binding_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_account_binding =
       option_of_yojson
         (value_for_key acme_external_account_binding_of_yojson "ExternalAccountBinding")
         _list path;
   }
    : describe_acme_external_account_binding_response)

let describe_acme_external_account_binding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_external_account_binding_arn =
       value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn"
         _list path;
   }
    : describe_acme_external_account_binding_request)

let describe_acme_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint =
       option_of_yojson (value_for_key acme_endpoint_of_yojson "AcmeEndpoint") _list path;
   }
    : describe_acme_endpoint_response)

let describe_acme_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path }
    : describe_acme_endpoint_request)

let describe_acme_domain_validation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation =
       option_of_yojson
         (value_for_key acme_domain_validation_of_yojson "AcmeDomainValidation")
         _list path;
   }
    : describe_acme_domain_validation_response)

let describe_acme_domain_validation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation_arn =
       value_for_key acme_domain_validation_arn_of_yojson "AcmeDomainValidationArn" _list path;
   }
    : describe_acme_domain_validation_request)

let describe_acme_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_account = option_of_yojson (value_for_key acme_account_of_yojson "AcmeAccount") _list path;
   }
    : describe_acme_account_response)

let describe_acme_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
     account_url =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AccountUrl" _list
         path;
   }
    : describe_acme_account_request)

let delete_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate_arn = value_for_key arn_of_yojson "CertificateArn" _list path }
    : delete_certificate_request)

let delete_acme_external_account_binding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_external_account_binding_arn =
       value_for_key acme_external_account_binding_arn_of_yojson "AcmeExternalAccountBindingArn"
         _list path;
   }
    : delete_acme_external_account_binding_request)

let delete_acme_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path }
    : delete_acme_endpoint_request)

let delete_acme_domain_validation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation_arn =
       value_for_key acme_domain_validation_arn_of_yojson "AcmeDomainValidationArn" _list path;
   }
    : delete_acme_domain_validation_request)

let create_acme_external_account_binding_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_account_binding =
       option_of_yojson
         (value_for_key acme_external_account_binding_of_yojson "ExternalAccountBinding")
         _list path;
   }
    : create_acme_external_account_binding_response)

let time_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MINUTES" -> MINUTES
    | `String "HOURS" -> HOURS
    | `String "DAYS" -> DAYS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeType" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeType")
     : time_type)
    : time_type)

let expiration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "Value" _list path;
     type_ = value_for_key time_type_of_yojson "Type" _list path;
   }
    : expiration)

let create_acme_external_account_binding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "IdempotencyToken")
         _list path;
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
     role_arn = value_for_key role_arn_of_yojson "RoleArn" _list path;
     expiration = option_of_yojson (value_for_key expiration_of_yojson "Expiration") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_acme_external_account_binding_request)

let create_acme_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_endpoint_arn =
       option_of_yojson (value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn") _list path;
   }
    : create_acme_endpoint_response)

let create_acme_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "IdempotencyToken")
         _list path;
     authorization_behavior =
       value_for_key acme_authorization_behavior_of_yojson "AuthorizationBehavior" _list path;
     contact = option_of_yojson (value_for_key acme_contact_of_yojson "Contact") _list path;
     certificate_authority =
       value_for_key certificate_authority_of_yojson "CertificateAuthority" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     certificate_tags =
       option_of_yojson (value_for_key tag_list_of_yojson "CertificateTags") _list path;
   }
    : create_acme_endpoint_request)

let create_acme_domain_validation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     acme_domain_validation_arn =
       value_for_key acme_domain_validation_arn_of_yojson "AcmeDomainValidationArn" _list path;
   }
    : create_acme_domain_validation_response)

let create_acme_domain_validation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "IdempotencyToken")
         _list path;
     acme_endpoint_arn = value_for_key acme_endpoint_arn_of_yojson "AcmeEndpointArn" _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     prevalidation_options =
       value_for_key prevalidation_options_of_yojson "PrevalidationOptions" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_acme_domain_validation_request)
