open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let domain_component_list_to_yojson tree = list_to_yojson string__to_yojson tree

let custom_attribute_to_yojson (x : custom_attribute) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("ObjectIdentifier", option_to_yojson string__to_yojson x.object_identifier);
    ]

let custom_attribute_list_to_yojson tree = list_to_yojson custom_attribute_to_yojson tree

let distinguished_name_to_yojson (x : distinguished_name) =
  assoc_to_yojson
    [
      ("Title", option_to_yojson string__to_yojson x.title);
      ("Surname", option_to_yojson string__to_yojson x.surname);
      ("State", option_to_yojson string__to_yojson x.state);
      ("SerialNumber", option_to_yojson string__to_yojson x.serial_number);
      ("Pseudonym", option_to_yojson string__to_yojson x.pseudonym);
      ("OrganizationalUnit", option_to_yojson string__to_yojson x.organizational_unit);
      ("Organization", option_to_yojson string__to_yojson x.organization);
      ("Locality", option_to_yojson string__to_yojson x.locality);
      ("Initials", option_to_yojson string__to_yojson x.initials);
      ("GivenName", option_to_yojson string__to_yojson x.given_name);
      ("GenerationQualifier", option_to_yojson string__to_yojson x.generation_qualifier);
      ( "DistinguishedNameQualifier",
        option_to_yojson string__to_yojson x.distinguished_name_qualifier );
      ("CustomAttributes", option_to_yojson custom_attribute_list_to_yojson x.custom_attributes);
      ("Country", option_to_yojson string__to_yojson x.country);
      ("DomainComponents", option_to_yojson domain_component_list_to_yojson x.domain_components);
      ("CommonName", option_to_yojson string__to_yojson x.common_name);
    ]

let other_name_to_yojson (x : other_name) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("ObjectIdentifier", option_to_yojson string__to_yojson x.object_identifier);
    ]

let general_name_to_yojson (x : general_name) =
  match x with
  | UniformResourceIdentifier arg ->
      assoc_to_yojson [ ("UniformResourceIdentifier", Some (string__to_yojson arg)) ]
  | Rfc822Name arg -> assoc_to_yojson [ ("Rfc822Name", Some (string__to_yojson arg)) ]
  | RegisteredId arg -> assoc_to_yojson [ ("RegisteredId", Some (string__to_yojson arg)) ]
  | OtherName arg -> assoc_to_yojson [ ("OtherName", Some (other_name_to_yojson arg)) ]
  | IpAddress arg -> assoc_to_yojson [ ("IpAddress", Some (string__to_yojson arg)) ]
  | DnsName arg -> assoc_to_yojson [ ("DnsName", Some (string__to_yojson arg)) ]
  | DirectoryName arg ->
      assoc_to_yojson [ ("DirectoryName", Some (distinguished_name_to_yojson arg)) ]

let general_name_list_to_yojson tree = list_to_yojson general_name_to_yojson tree

let extended_key_usage_name_to_yojson (x : extended_key_usage_name) =
  match x with
  | CUSTOM -> `String "CUSTOM"
  | NONE -> `String "NONE"
  | ANY -> `String "ANY"
  | IPSEC_USER -> `String "IPSEC_USER"
  | IPSEC_TUNNEL -> `String "IPSEC_TUNNEL"
  | IPSEC_END_SYSTEM -> `String "IPSEC_END_SYSTEM"
  | OCSP_SIGNING -> `String "OCSP_SIGNING"
  | TIME_STAMPING -> `String "TIME_STAMPING"
  | EMAIL_PROTECTION -> `String "EMAIL_PROTECTION"
  | CODE_SIGNING -> `String "CODE_SIGNING"
  | TLS_WEB_CLIENT_AUTHENTICATION -> `String "TLS_WEB_CLIENT_AUTHENTICATION"
  | TLS_WEB_SERVER_AUTHENTICATION -> `String "TLS_WEB_SERVER_AUTHENTICATION"

let extended_key_usage_names_to_yojson tree = list_to_yojson extended_key_usage_name_to_yojson tree

let key_algorithm_to_yojson (x : key_algorithm) =
  match x with
  | EC_secp521r1 -> `String "EC_secp521r1"
  | EC_secp384r1 -> `String "EC_secp384r1"
  | EC_prime256v1 -> `String "EC_prime256v1"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"
  | RSA_1024 -> `String "RSA_1024"

let key_usage_name_to_yojson (x : key_usage_name) =
  match x with
  | CUSTOM -> `String "CUSTOM"
  | ANY -> `String "ANY"
  | DECIPHER_ONLY -> `String "DECIPHER_ONLY"
  | ENCHIPER_ONLY -> `String "ENCIPHER_ONLY"
  | CRL_SIGNING -> `String "CRL_SIGNING"
  | CERTIFICATE_SIGNING -> `String "CERTIFICATE_SIGNING"
  | KEY_AGREEMENT -> `String "KEY_AGREEMENT"
  | DATA_ENCIPHERMENT -> `String "DATA_ENCIPHERMENT"
  | KEY_ENCIPHERMENT -> `String "KEY_ENCIPHERMENT"
  | NON_REPUDATION -> `String "NON_REPUDIATION"
  | DIGITAL_SIGNATURE -> `String "DIGITAL_SIGNATURE"

let key_usage_names_to_yojson tree = list_to_yojson key_usage_name_to_yojson tree
let serial_number_to_yojson = string_to_yojson
let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let x509_attributes_to_yojson (x : x509_attributes) =
  assoc_to_yojson
    [
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("SerialNumber", option_to_yojson serial_number_to_yojson x.serial_number);
      ("KeyUsages", option_to_yojson key_usage_names_to_yojson x.key_usages);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ( "ExtendedKeyUsages",
        option_to_yojson extended_key_usage_names_to_yojson x.extended_key_usages );
      ( "SubjectAlternativeNames",
        option_to_yojson general_name_list_to_yojson x.subject_alternative_names );
      ("Subject", option_to_yojson distinguished_name_to_yojson x.subject);
      ("Issuer", option_to_yojson distinguished_name_to_yojson x.issuer);
    ]

let filter_string_to_yojson = string_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with EQUALS -> `String "EQUALS" | CONTAINS -> `String "CONTAINS"

let common_name_filter_to_yojson (x : common_name_filter) =
  assoc_to_yojson
    [
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("Value", Some (filter_string_to_yojson x.value));
    ]

let subject_filter_to_yojson (x : subject_filter) =
  match x with
  | CommonName arg -> assoc_to_yojson [ ("CommonName", Some (common_name_filter_to_yojson arg)) ]

let dns_name_filter_to_yojson (x : dns_name_filter) =
  assoc_to_yojson
    [
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("Value", Some (filter_string_to_yojson x.value));
    ]

let subject_alternative_name_filter_to_yojson (x : subject_alternative_name_filter) =
  match x with
  | DnsName arg -> assoc_to_yojson [ ("DnsName", Some (dns_name_filter_to_yojson arg)) ]

let timestamp_range_to_yojson (x : timestamp_range) =
  assoc_to_yojson
    [
      ("End", option_to_yojson t_stamp_to_yojson x.end_);
      ("Start", option_to_yojson t_stamp_to_yojson x.start);
    ]

let x509_attribute_filter_to_yojson (x : x509_attribute_filter) =
  match x with
  | NotBefore arg -> assoc_to_yojson [ ("NotBefore", Some (timestamp_range_to_yojson arg)) ]
  | NotAfter arg -> assoc_to_yojson [ ("NotAfter", Some (timestamp_range_to_yojson arg)) ]
  | SerialNumber arg -> assoc_to_yojson [ ("SerialNumber", Some (serial_number_to_yojson arg)) ]
  | KeyAlgorithm arg -> assoc_to_yojson [ ("KeyAlgorithm", Some (key_algorithm_to_yojson arg)) ]
  | KeyUsage arg -> assoc_to_yojson [ ("KeyUsage", Some (key_usage_name_to_yojson arg)) ]
  | ExtendedKeyUsage arg ->
      assoc_to_yojson [ ("ExtendedKeyUsage", Some (extended_key_usage_name_to_yojson arg)) ]
  | SubjectAlternativeName arg ->
      assoc_to_yojson
        [ ("SubjectAlternativeName", Some (subject_alternative_name_filter_to_yojson arg)) ]
  | Subject arg -> assoc_to_yojson [ ("Subject", Some (subject_filter_to_yojson arg)) ]

let validation_method_to_yojson (x : validation_method) =
  match x with HTTP -> `String "HTTP" | DNS -> `String "DNS" | EMAIL -> `String "EMAIL"

let validation_exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson validation_exception_message_to_yojson x.message) ]

let validation_email_list_to_yojson tree = list_to_yojson string__to_yojson tree
let arn_to_yojson = string_to_yojson

let certificate_transparency_logging_preference_to_yojson
    (x : certificate_transparency_logging_preference) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let certificate_export_to_yojson (x : certificate_export) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let certificate_options_to_yojson (x : certificate_options) =
  assoc_to_yojson
    [
      ("Export", option_to_yojson certificate_export_to_yojson x.export_);
      ( "CertificateTransparencyLoggingPreference",
        option_to_yojson certificate_transparency_logging_preference_to_yojson
          x.certificate_transparency_logging_preference );
    ]

let update_certificate_options_request_to_yojson (x : update_certificate_options_request) =
  assoc_to_yojson
    [
      ("Options", Some (certificate_options_to_yojson x.options));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let acme_endpoint_arn_to_yojson = string_to_yojson

let acme_authorization_behavior_to_yojson (x : acme_authorization_behavior) =
  match x with PRE_APPROVED -> `String "PRE_APPROVED"

let acme_contact_to_yojson (x : acme_contact) =
  match x with NOT_REQUIRED -> `String "NOT_REQUIRED" | REQUIRED -> `String "REQUIRED"

let public_key_algorithm_to_yojson (x : public_key_algorithm) =
  match x with
  | EC_SECP384_R1 -> `String "EC_secp384r1"
  | EC_PRIME256_V1 -> `String "EC_prime256v1"
  | RSA_2048 -> `String "RSA_2048"

let public_key_algorithm_list_to_yojson tree = list_to_yojson public_key_algorithm_to_yojson tree

let public_certificate_authority_to_yojson (x : public_certificate_authority) =
  assoc_to_yojson
    [
      ( "AllowedKeyAlgorithms",
        option_to_yojson public_key_algorithm_list_to_yojson x.allowed_key_algorithms );
    ]

let certificate_authority_to_yojson (x : certificate_authority) =
  match x with
  | PublicCertificateAuthority arg ->
      assoc_to_yojson
        [ ("PublicCertificateAuthority", Some (public_certificate_authority_to_yojson arg)) ]

let update_acme_endpoint_request_to_yojson (x : update_acme_endpoint_request) =
  assoc_to_yojson
    [
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "AuthorizationBehavior",
        option_to_yojson acme_authorization_behavior_to_yojson x.authorization_behavior );
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
    ]

let availability_error_message_to_yojson = string_to_yojson
let coral_availability_throttling_reason_to_yojson = string_to_yojson
let coral_availability_throttled_resource_to_yojson = string_to_yojson

let throttling_reason_to_yojson (x : throttling_reason) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson coral_availability_throttled_resource_to_yojson x.resource);
      ("reason", option_to_yojson coral_availability_throttling_reason_to_yojson x.reason);
    ]

let throttling_reason_list_to_yojson tree = list_to_yojson throttling_reason_to_yojson tree

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("throttlingReasons", option_to_yojson throttling_reason_list_to_yojson x.throttling_reasons);
      ("message", option_to_yojson availability_error_message_to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let service_error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let acme_domain_validation_arn_to_yojson = string_to_yojson

let domain_scope_option_to_yojson (x : domain_scope_option) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let domain_scope_to_yojson (x : domain_scope) =
  assoc_to_yojson
    [
      ("Wildcards", option_to_yojson domain_scope_option_to_yojson x.wildcards);
      ("Subdomains", option_to_yojson domain_scope_option_to_yojson x.subdomains);
      ("ExactDomain", option_to_yojson domain_scope_option_to_yojson x.exact_domain);
    ]

let hosted_zone_id_to_yojson = string_to_yojson

let dns_prevalidation_options_to_yojson (x : dns_prevalidation_options) =
  assoc_to_yojson
    [
      ("HostedZoneId", option_to_yojson hosted_zone_id_to_yojson x.hosted_zone_id);
      ("DomainScope", option_to_yojson domain_scope_to_yojson x.domain_scope);
    ]

let prevalidation_options_to_yojson (x : prevalidation_options) =
  match x with
  | DnsPrevalidation arg ->
      assoc_to_yojson [ ("DnsPrevalidation", Some (dns_prevalidation_options_to_yojson arg)) ]

let update_acme_domain_validation_request_to_yojson (x : update_acme_domain_validation_request) =
  assoc_to_yojson
    [
      ( "PrevalidationOptions",
        option_to_yojson prevalidation_options_to_yojson x.prevalidation_options );
      ( "AcmeDomainValidationArn",
        Some (acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn) );
    ]

let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let time_type_to_yojson (x : time_type) =
  match x with DAYS -> `String "DAYS" | HOURS -> `String "HOURS" | MINUTES -> `String "MINUTES"

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let sort_by_to_yojson (x : sort_by) = match x with CREATED_AT -> `String "CREATED_AT"
let search_max_results_to_yojson = int_to_yojson

let search_certificates_sort_order_to_yojson (x : search_certificates_sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let search_certificates_sort_by_to_yojson (x : search_certificates_sort_by) =
  match x with
  | CERTIFICATE_KEY_PAIR_ORIGIN -> `String "CERTIFICATE_KEY_PAIR_ORIGIN"
  | ACME_ACCOUNT_ID -> `String "ACME_ACCOUNT_ID"
  | ACME_ENDPOINT_ARN -> `String "ACME_ENDPOINT_ARN"
  | IMPORTED_AT -> `String "IMPORTED_AT"
  | VALIDATION_METHOD -> `String "VALIDATION_METHOD"
  | EXPORT_OPTION -> `String "EXPORT_OPTION"
  | MANAGED_BY -> `String "MANAGED_BY"
  | ISSUED_AT -> `String "ISSUED_AT"
  | RENEWAL_ELIGIBILITY -> `String "RENEWAL_ELIGIBILITY"
  | REVOKED_AT -> `String "REVOKED_AT"
  | COMMON_NAME -> `String "COMMON_NAME"
  | CERTIFICATE_ARN -> `String "CERTIFICATE_ARN"
  | TYPE -> `String "TYPE"
  | KEY_ALGORITHM -> `String "KEY_ALGORITHM"
  | NOT_BEFORE -> `String "NOT_BEFORE"
  | IN_USE -> `String "IN_USE"
  | EXPORTED -> `String "EXPORTED"
  | RENEWAL_STATUS -> `String "RENEWAL_STATUS"
  | STATUS -> `String "STATUS"
  | NOT_AFTER -> `String "NOT_AFTER"
  | CREATED_AT -> `String "CREATED_AT"

let nullable_boolean_to_yojson = bool_to_yojson

let renewal_eligibility_to_yojson (x : renewal_eligibility) =
  match x with INELIGIBLE -> `String "INELIGIBLE" | ELIGIBLE -> `String "ELIGIBLE"

let certificate_status_to_yojson (x : certificate_status) =
  match x with
  | FAILED -> `String "FAILED"
  | REVOKED -> `String "REVOKED"
  | VALIDATION_TIMED_OUT -> `String "VALIDATION_TIMED_OUT"
  | EXPIRED -> `String "EXPIRED"
  | INACTIVE -> `String "INACTIVE"
  | ISSUED -> `String "ISSUED"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"

let renewal_status_to_yojson (x : renewal_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
  | PENDING_AUTO_RENEWAL -> `String "PENDING_AUTO_RENEWAL"

let certificate_type_to_yojson (x : certificate_type) =
  match x with
  | PRIVATE -> `String "PRIVATE"
  | AMAZON_ISSUED -> `String "AMAZON_ISSUED"
  | IMPORTED -> `String "IMPORTED"

let certificate_managed_by_to_yojson (x : certificate_managed_by) =
  match x with CLOUDFRONT -> `String "CLOUDFRONT"

let certificate_key_pair_origin_to_yojson (x : certificate_key_pair_origin) =
  match x with
  | CUSTOMER_PROVIDED -> `String "CUSTOMER_PROVIDED"
  | ACME -> `String "ACME"
  | AWS_MANAGED -> `String "AWS_MANAGED"

let acme_account_id_to_yojson = string_to_yojson

let acm_certificate_metadata_to_yojson (x : acm_certificate_metadata) =
  assoc_to_yojson
    [
      ("AcmeAccountId", option_to_yojson acme_account_id_to_yojson x.acme_account_id);
      ("AcmeEndpointArn", option_to_yojson arn_to_yojson x.acme_endpoint_arn);
      ( "CertificateKeyPairOrigin",
        option_to_yojson certificate_key_pair_origin_to_yojson x.certificate_key_pair_origin );
      ("ValidationMethod", option_to_yojson validation_method_to_yojson x.validation_method);
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ("ExportOption", option_to_yojson certificate_export_to_yojson x.export_option);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("RenewalStatus", option_to_yojson renewal_status_to_yojson x.renewal_status);
      ("Status", option_to_yojson certificate_status_to_yojson x.status);
      ("RevokedAt", option_to_yojson t_stamp_to_yojson x.revoked_at);
      ("RenewalEligibility", option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility);
      ("IssuedAt", option_to_yojson t_stamp_to_yojson x.issued_at);
      ("InUse", option_to_yojson nullable_boolean_to_yojson x.in_use);
      ("ImportedAt", option_to_yojson t_stamp_to_yojson x.imported_at);
      ("Exported", option_to_yojson nullable_boolean_to_yojson x.exported);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
    ]

let certificate_metadata_to_yojson (x : certificate_metadata) =
  match x with
  | AcmCertificateMetadata arg ->
      assoc_to_yojson [ ("AcmCertificateMetadata", Some (acm_certificate_metadata_to_yojson arg)) ]

let certificate_search_result_to_yojson (x : certificate_search_result) =
  assoc_to_yojson
    [
      ("CertificateMetadata", option_to_yojson certificate_metadata_to_yojson x.certificate_metadata);
      ("X509Attributes", option_to_yojson x509_attributes_to_yojson x.x509_attributes);
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
    ]

let certificate_search_result_list_to_yojson tree =
  list_to_yojson certificate_search_result_to_yojson tree

let next_token_to_yojson = string_to_yojson

let search_certificates_response_to_yojson (x : search_certificates_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Results", option_to_yojson certificate_search_result_list_to_yojson x.results);
    ]

let acm_certificate_metadata_filter_to_yojson (x : acm_certificate_metadata_filter) =
  match x with
  | AcmeAccountId arg -> assoc_to_yojson [ ("AcmeAccountId", Some (acme_account_id_to_yojson arg)) ]
  | AcmeEndpointArn arg -> assoc_to_yojson [ ("AcmeEndpointArn", Some (arn_to_yojson arg)) ]
  | CertificateKeyPairOrigin arg ->
      assoc_to_yojson
        [ ("CertificateKeyPairOrigin", Some (certificate_key_pair_origin_to_yojson arg)) ]
  | ValidationMethod arg ->
      assoc_to_yojson [ ("ValidationMethod", Some (validation_method_to_yojson arg)) ]
  | ManagedBy arg -> assoc_to_yojson [ ("ManagedBy", Some (certificate_managed_by_to_yojson arg)) ]
  | ExportOption arg ->
      assoc_to_yojson [ ("ExportOption", Some (certificate_export_to_yojson arg)) ]
  | Exported arg -> assoc_to_yojson [ ("Exported", Some (nullable_boolean_to_yojson arg)) ]
  | InUse arg -> assoc_to_yojson [ ("InUse", Some (nullable_boolean_to_yojson arg)) ]
  | Type arg -> assoc_to_yojson [ ("Type", Some (certificate_type_to_yojson arg)) ]
  | RenewalStatus arg -> assoc_to_yojson [ ("RenewalStatus", Some (renewal_status_to_yojson arg)) ]
  | Status arg -> assoc_to_yojson [ ("Status", Some (certificate_status_to_yojson arg)) ]

let certificate_filter_to_yojson (x : certificate_filter) =
  match x with
  | AcmCertificateMetadataFilter arg ->
      assoc_to_yojson
        [ ("AcmCertificateMetadataFilter", Some (acm_certificate_metadata_filter_to_yojson arg)) ]
  | X509AttributeFilter arg ->
      assoc_to_yojson [ ("X509AttributeFilter", Some (x509_attribute_filter_to_yojson arg)) ]
  | CertificateArn arg -> assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson arg)) ]

let rec certificate_filter_statement_to_yojson (x : certificate_filter_statement) =
  match x with
  | Filter arg -> assoc_to_yojson [ ("Filter", Some (certificate_filter_to_yojson arg)) ]
  | Not arg -> assoc_to_yojson [ ("Not", Some (certificate_filter_statement_to_yojson arg)) ]
  | Or arg -> assoc_to_yojson [ ("Or", Some (certificate_filter_statement_list_to_yojson arg)) ]
  | And arg -> assoc_to_yojson [ ("And", Some (certificate_filter_statement_list_to_yojson arg)) ]

and certificate_filter_statement_list_to_yojson tree =
  list_to_yojson certificate_filter_statement_to_yojson tree

let search_certificates_request_to_yojson (x : search_certificates_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson search_certificates_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson search_certificates_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson search_max_results_to_yojson x.max_results);
      ("FilterStatement", option_to_yojson certificate_filter_statement_to_yojson x.filter_statement);
    ]

let role_arn_to_yojson = string_to_yojson

let revoke_certificate_response_to_yojson (x : revoke_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let revocation_reason_to_yojson (x : revocation_reason) =
  match x with
  | A_A_COMPROMISE -> `String "A_A_COMPROMISE"
  | PRIVILEGE_WITHDRAWN -> `String "PRIVILEGE_WITHDRAWN"
  | REMOVE_FROM_CRL -> `String "REMOVE_FROM_CRL"
  | CERTIFICATE_HOLD -> `String "CERTIFICATE_HOLD"
  | CESSATION_OF_OPERATION -> `String "CESSATION_OF_OPERATION"
  | SUPERSEDED -> `String "SUPERSEDED"
  | SUPERCEDED -> `String "SUPERCEDED"
  | AFFILIATION_CHANGED -> `String "AFFILIATION_CHANGED"
  | CA_COMPROMISE -> `String "CA_COMPROMISE"
  | KEY_COMPROMISE -> `String "KEY_COMPROMISE"
  | UNSPECIFIED -> `String "UNSPECIFIED"

let revoke_certificate_request_to_yojson (x : revoke_certificate_request) =
  assoc_to_yojson
    [
      ("RevocationReason", Some (revocation_reason_to_yojson x.revocation_reason));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let acme_external_account_binding_arn_to_yojson = string_to_yojson

let revoke_acme_external_account_binding_request_to_yojson
    (x : revoke_acme_external_account_binding_request) =
  assoc_to_yojson
    [
      ( "AcmeExternalAccountBindingArn",
        Some (acme_external_account_binding_arn_to_yojson x.acme_external_account_binding_arn) );
    ]

let revoke_acme_account_request_to_yojson (x : revoke_acme_account_request) =
  assoc_to_yojson
    [
      ("AccountUrl", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url));
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
    ]

let record_type_to_yojson (x : record_type) = match x with CNAME -> `String "CNAME"

let resource_record_to_yojson (x : resource_record) =
  assoc_to_yojson
    [
      ("Value", Some (string__to_yojson x.value));
      ("Type", Some (record_type_to_yojson x.type_));
      ("Name", Some (string__to_yojson x.name));
    ]

let domain_name_string_to_yojson = string_to_yojson

let resend_validation_email_request_to_yojson (x : resend_validation_email_request) =
  assoc_to_yojson
    [
      ("ValidationDomain", Some (domain_name_string_to_yojson x.validation_domain));
      ("Domain", Some (domain_name_string_to_yojson x.domain));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]

let invalid_domain_validation_options_exception_to_yojson
    (x : invalid_domain_validation_options_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let request_in_progress_exception_to_yojson (x : request_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let request_certificate_response_to_yojson (x : request_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let domain_list_to_yojson tree = list_to_yojson domain_name_string_to_yojson tree
let idempotency_token_to_yojson = string_to_yojson

let domain_validation_option_to_yojson (x : domain_validation_option) =
  assoc_to_yojson
    [
      ("ValidationDomain", Some (domain_name_string_to_yojson x.validation_domain));
      ("DomainName", Some (domain_name_string_to_yojson x.domain_name));
    ]

let domain_validation_option_list_to_yojson tree =
  list_to_yojson domain_validation_option_to_yojson tree

let pca_arn_to_yojson = string_to_yojson

let request_certificate_request_to_yojson (x : request_certificate_request) =
  assoc_to_yojson
    [
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CertificateAuthorityArn", option_to_yojson pca_arn_to_yojson x.certificate_authority_arn);
      ("Options", option_to_yojson certificate_options_to_yojson x.options);
      ( "DomainValidationOptions",
        option_to_yojson domain_validation_option_list_to_yojson x.domain_validation_options );
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("SubjectAlternativeNames", option_to_yojson domain_list_to_yojson x.subject_alternative_names);
      ("ValidationMethod", option_to_yojson validation_method_to_yojson x.validation_method);
      ("DomainName", Some (domain_name_string_to_yojson x.domain_name));
    ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let domain_status_to_yojson (x : domain_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"

let http_redirect_to_yojson (x : http_redirect) =
  assoc_to_yojson
    [
      ("RedirectTo", option_to_yojson string__to_yojson x.redirect_to);
      ("RedirectFrom", option_to_yojson string__to_yojson x.redirect_from);
    ]

let domain_validation_to_yojson (x : domain_validation) =
  assoc_to_yojson
    [
      ("ValidationMethod", option_to_yojson validation_method_to_yojson x.validation_method);
      ("HttpRedirect", option_to_yojson http_redirect_to_yojson x.http_redirect);
      ("ResourceRecord", option_to_yojson resource_record_to_yojson x.resource_record);
      ("ValidationStatus", option_to_yojson domain_status_to_yojson x.validation_status);
      ("ValidationDomain", option_to_yojson domain_name_string_to_yojson x.validation_domain);
      ("ValidationEmails", option_to_yojson validation_email_list_to_yojson x.validation_emails);
      ("DomainName", Some (domain_name_string_to_yojson x.domain_name));
    ]

let domain_validation_list_to_yojson tree = list_to_yojson domain_validation_to_yojson tree

let failure_reason_to_yojson (x : failure_reason) =
  match x with
  | OTHER -> `String "OTHER"
  | SLR_NOT_FOUND -> `String "SLR_NOT_FOUND"
  | PCA_ACCESS_DENIED -> `String "PCA_ACCESS_DENIED"
  | PCA_INVALID_DURATION -> `String "PCA_INVALID_DURATION"
  | PCA_INVALID_ARGS -> `String "PCA_INVALID_ARGS"
  | PCA_RESOURCE_NOT_FOUND -> `String "PCA_RESOURCE_NOT_FOUND"
  | PCA_NAME_CONSTRAINTS_VALIDATION -> `String "PCA_NAME_CONSTRAINTS_VALIDATION"
  | PCA_REQUEST_FAILED -> `String "PCA_REQUEST_FAILED"
  | PCA_INVALID_STATE -> `String "PCA_INVALID_STATE"
  | PCA_INVALID_ARN -> `String "PCA_INVALID_ARN"
  | PCA_LIMIT_EXCEEDED -> `String "PCA_LIMIT_EXCEEDED"
  | CAA_ERROR -> `String "CAA_ERROR"
  | DOMAIN_VALIDATION_DENIED -> `String "DOMAIN_VALIDATION_DENIED"
  | INVALID_PUBLIC_DOMAIN -> `String "INVALID_PUBLIC_DOMAIN"
  | DOMAIN_NOT_ALLOWED -> `String "DOMAIN_NOT_ALLOWED"
  | ADDITIONAL_VERIFICATION_REQUIRED -> `String "ADDITIONAL_VERIFICATION_REQUIRED"
  | NO_AVAILABLE_CONTACTS -> `String "NO_AVAILABLE_CONTACTS"

let renewal_summary_to_yojson (x : renewal_summary) =
  assoc_to_yojson
    [
      ("UpdatedAt", Some (t_stamp_to_yojson x.updated_at));
      ("RenewalStatusReason", option_to_yojson failure_reason_to_yojson x.renewal_status_reason);
      ( "DomainValidationOptions",
        Some (domain_validation_list_to_yojson x.domain_validation_options) );
      ("RenewalStatus", Some (renewal_status_to_yojson x.renewal_status));
    ]

let renew_certificate_request_to_yojson (x : renew_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let remove_tags_from_certificate_request_to_yojson (x : remove_tags_from_certificate_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]

let positive_integer_to_yojson = int_to_yojson

let expiry_events_configuration_to_yojson (x : expiry_events_configuration) =
  assoc_to_yojson
    [ ("DaysBeforeExpiry", option_to_yojson positive_integer_to_yojson x.days_before_expiry) ]

let put_account_configuration_request_to_yojson (x : put_account_configuration_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("ExpiryEvents", option_to_yojson expiry_events_configuration_to_yojson x.expiry_events);
    ]

let private_key_blob_to_yojson = blob_to_yojson
let private_key_to_yojson = string_to_yojson

let prevalidation_type_to_yojson (x : prevalidation_type) =
  match x with DNS_PREVALIDATION -> `String "DNS_PREVALIDATION"

let dns_prevalidation_details_to_yojson (x : dns_prevalidation_details) =
  assoc_to_yojson
    [
      ("ResourceRecord", option_to_yojson resource_record_to_yojson x.resource_record);
      ("HostedZoneId", option_to_yojson hosted_zone_id_to_yojson x.hosted_zone_id);
      ("DomainScope", option_to_yojson domain_scope_to_yojson x.domain_scope);
    ]

let prevalidation_details_to_yojson (x : prevalidation_details) =
  match x with
  | DnsPrevalidation arg ->
      assoc_to_yojson [ ("DnsPrevalidation", Some (dns_prevalidation_details_to_yojson arg)) ]

let passphrase_blob_to_yojson = blob_to_yojson
let max_items_to_yojson = int_to_yojson
let mac_key_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_tags_for_certificate_response_to_yojson (x : list_tags_for_certificate_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_certificate_request_to_yojson (x : list_tags_for_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let certificate_summary_to_yojson (x : certificate_summary) =
  assoc_to_yojson
    [
      ( "CertificateKeyPairOrigin",
        option_to_yojson certificate_key_pair_origin_to_yojson x.certificate_key_pair_origin );
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ("RevokedAt", option_to_yojson t_stamp_to_yojson x.revoked_at);
      ("ImportedAt", option_to_yojson t_stamp_to_yojson x.imported_at);
      ("IssuedAt", option_to_yojson t_stamp_to_yojson x.issued_at);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("RenewalEligibility", option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility);
      ("Exported", option_to_yojson nullable_boolean_to_yojson x.exported);
      ("InUse", option_to_yojson nullable_boolean_to_yojson x.in_use);
      ("ExportOption", option_to_yojson certificate_export_to_yojson x.export_option);
      ( "ExtendedKeyUsages",
        option_to_yojson extended_key_usage_names_to_yojson x.extended_key_usages );
      ("KeyUsages", option_to_yojson key_usage_names_to_yojson x.key_usages);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("Status", option_to_yojson certificate_status_to_yojson x.status);
      ( "HasAdditionalSubjectAlternativeNames",
        option_to_yojson nullable_boolean_to_yojson x.has_additional_subject_alternative_names );
      ( "SubjectAlternativeNameSummaries",
        option_to_yojson domain_list_to_yojson x.subject_alternative_name_summaries );
      ("DomainName", option_to_yojson domain_name_string_to_yojson x.domain_name);
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
    ]

let certificate_summary_list_to_yojson tree = list_to_yojson certificate_summary_to_yojson tree

let list_certificates_response_to_yojson (x : list_certificates_response) =
  assoc_to_yojson
    [
      ( "CertificateSummaryList",
        option_to_yojson certificate_summary_list_to_yojson x.certificate_summary_list );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let certificate_statuses_to_yojson tree = list_to_yojson certificate_status_to_yojson tree

let certificate_key_pair_origins_to_yojson tree =
  list_to_yojson certificate_key_pair_origin_to_yojson tree

let extended_key_usage_filter_list_to_yojson tree =
  list_to_yojson extended_key_usage_name_to_yojson tree

let key_usage_filter_list_to_yojson tree = list_to_yojson key_usage_name_to_yojson tree
let key_algorithm_list_to_yojson tree = list_to_yojson key_algorithm_to_yojson tree

let filters_to_yojson (x : filters) =
  assoc_to_yojson
    [
      ("managedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ("exportOption", option_to_yojson certificate_export_to_yojson x.export_option);
      ("keyTypes", option_to_yojson key_algorithm_list_to_yojson x.key_types);
      ("keyUsage", option_to_yojson key_usage_filter_list_to_yojson x.key_usage);
      ( "extendedKeyUsage",
        option_to_yojson extended_key_usage_filter_list_to_yojson x.extended_key_usage );
    ]

let list_certificates_request_to_yojson (x : list_certificates_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("MaxItems", option_to_yojson max_items_to_yojson x.max_items);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Includes", option_to_yojson filters_to_yojson x.includes);
      ( "CertificateKeyPairOrigins",
        option_to_yojson certificate_key_pair_origins_to_yojson x.certificate_key_pair_origins );
      ("CertificateStatuses", option_to_yojson certificate_statuses_to_yojson x.certificate_statuses);
    ]

let invalid_args_exception_to_yojson (x : invalid_args_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let acme_external_account_binding_summary_to_yojson (x : acme_external_account_binding_summary) =
  assoc_to_yojson
    [
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "LastUsedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_used_at );
      ( "RevokedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.revoked_at );
      ( "ExpiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
    ]

let acme_external_account_binding_list_to_yojson tree =
  list_to_yojson acme_external_account_binding_summary_to_yojson tree

let list_acme_external_account_bindings_response_to_yojson
    (x : list_acme_external_account_bindings_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "ExternalAccountBindings",
        option_to_yojson acme_external_account_binding_list_to_yojson x.external_account_bindings );
    ]

let list_acme_external_account_bindings_request_to_yojson
    (x : list_acme_external_account_bindings_request) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let acme_endpoint_status_to_yojson (x : acme_endpoint_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let acme_endpoint_summary_to_yojson (x : acme_endpoint_summary) =
  assoc_to_yojson
    [
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("CertificateTags", option_to_yojson tag_list_to_yojson x.certificate_tags);
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "AuthorizationBehavior",
        option_to_yojson acme_authorization_behavior_to_yojson x.authorization_behavior );
      ( "FailureReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_reason );
      ("Status", option_to_yojson acme_endpoint_status_to_yojson x.status);
      ( "EndpointUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_url );
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
    ]

let acme_endpoint_list_to_yojson tree = list_to_yojson acme_endpoint_summary_to_yojson tree

let list_acme_endpoints_response_to_yojson (x : list_acme_endpoints_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("AcmeEndpoints", option_to_yojson acme_endpoint_list_to_yojson x.acme_endpoints);
    ]

let list_acme_endpoints_request_to_yojson (x : list_acme_endpoints_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let domain_name_to_yojson = string_to_yojson

let acme_domain_validation_status_to_yojson (x : acme_domain_validation_status) =
  match x with
  | DELETING -> `String "DELETING"
  | INVALID -> `String "INVALID"
  | VALID -> `String "VALID"
  | VALIDATING -> `String "VALIDATING"

let acme_domain_validation_failure_reason_to_yojson (x : acme_domain_validation_failure_reason) =
  match x with
  | TIMED_OUT -> `String "TIMED_OUT"
  | INVALID_PUBLIC_DOMAIN -> `String "INVALID_PUBLIC_DOMAIN"
  | INVALID_CHANGE_BATCH -> `String "INVALID_CHANGE_BATCH"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | HOSTED_ZONE_NOT_FOUND -> `String "HOSTED_ZONE_NOT_FOUND"
  | ENDPOINT_NOT_ACTIVE -> `String "ENDPOINT_NOT_ACTIVE"
  | DOMAIN_NOT_ALLOWED -> `String "DOMAIN_NOT_ALLOWED"
  | DOMAIN_MISMATCH -> `String "DOMAIN_MISMATCH"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Reason", option_to_yojson acme_domain_validation_failure_reason_to_yojson x.reason);
    ]

let acme_domain_validation_summary_to_yojson (x : acme_domain_validation_summary) =
  assoc_to_yojson
    [
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("Status", option_to_yojson acme_domain_validation_status_to_yojson x.status);
      ( "PrevalidationDetails",
        option_to_yojson prevalidation_details_to_yojson x.prevalidation_details );
      ("PrevalidationType", option_to_yojson prevalidation_type_to_yojson x.prevalidation_type);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ( "AcmeDomainValidationArn",
        option_to_yojson acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn );
    ]

let acme_domain_validation_list_to_yojson tree =
  list_to_yojson acme_domain_validation_summary_to_yojson tree

let list_acme_domain_validations_response_to_yojson (x : list_acme_domain_validations_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "AcmeDomainValidations",
        option_to_yojson acme_domain_validation_list_to_yojson x.acme_domain_validations );
    ]

let list_acme_domain_validations_request_to_yojson (x : list_acme_domain_validations_request) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let acme_account_status_to_yojson (x : acme_account_status) =
  match x with
  | REVOKED -> `String "REVOKED"
  | DEACTIVATED -> `String "DEACTIVATED"
  | VALID -> `String "VALID"

let contact_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let acme_account_summary_to_yojson (x : acme_account_summary) =
  assoc_to_yojson
    [
      ("Contacts", option_to_yojson contact_list_to_yojson x.contacts);
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("Status", option_to_yojson acme_account_status_to_yojson x.status);
      ( "PublicKeyThumbprint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.public_key_thumbprint );
      ( "AccountUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url );
    ]

let acme_account_list_to_yojson tree = list_to_yojson acme_account_summary_to_yojson tree

let list_acme_accounts_response_to_yojson (x : list_acme_accounts_response) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("AcmeAccounts", option_to_yojson acme_account_list_to_yojson x.acme_accounts);
    ]

let list_acme_accounts_request_to_yojson (x : list_acme_accounts_request) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let key_usage_to_yojson (x : key_usage) =
  assoc_to_yojson [ ("Name", option_to_yojson key_usage_name_to_yojson x.name) ]

let key_usage_list_to_yojson tree = list_to_yojson key_usage_to_yojson tree
let in_use_list_to_yojson tree = list_to_yojson string__to_yojson tree

let import_certificate_response_to_yojson (x : import_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let certificate_body_blob_to_yojson = blob_to_yojson
let certificate_chain_blob_to_yojson = blob_to_yojson

let import_certificate_request_to_yojson (x : import_certificate_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CertificateChain", option_to_yojson certificate_chain_blob_to_yojson x.certificate_chain);
      ("PrivateKey", Some (private_key_blob_to_yojson x.private_key));
      ("Certificate", Some (certificate_body_blob_to_yojson x.certificate));
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
    ]

let certificate_body_to_yojson = string_to_yojson
let certificate_chain_to_yojson = string_to_yojson

let get_certificate_response_to_yojson (x : get_certificate_response) =
  assoc_to_yojson
    [
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
    ]

let get_certificate_request_to_yojson (x : get_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let get_acme_external_account_binding_credentials_response_to_yojson
    (x : get_acme_external_account_binding_credentials_response) =
  assoc_to_yojson
    [
      ("MacKey", option_to_yojson mac_key_to_yojson x.mac_key);
      ("KeyId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key_id);
    ]

let get_acme_external_account_binding_credentials_request_to_yojson
    (x : get_acme_external_account_binding_credentials_request) =
  assoc_to_yojson
    [
      ( "AcmeExternalAccountBindingArn",
        Some (acme_external_account_binding_arn_to_yojson x.acme_external_account_binding_arn) );
    ]

let get_account_configuration_response_to_yojson (x : get_account_configuration_response) =
  assoc_to_yojson
    [ ("ExpiryEvents", option_to_yojson expiry_events_configuration_to_yojson x.expiry_events) ]

let extended_key_usage_to_yojson (x : extended_key_usage) =
  assoc_to_yojson
    [
      ("OID", option_to_yojson string__to_yojson x.oi_d);
      ("Name", option_to_yojson extended_key_usage_name_to_yojson x.name);
    ]

let extended_key_usage_list_to_yojson tree = list_to_yojson extended_key_usage_to_yojson tree

let export_certificate_response_to_yojson (x : export_certificate_response) =
  assoc_to_yojson
    [
      ("PrivateKey", option_to_yojson private_key_to_yojson x.private_key);
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
    ]

let export_certificate_request_to_yojson (x : export_certificate_request) =
  assoc_to_yojson
    [
      ("Passphrase", Some (passphrase_blob_to_yojson x.passphrase));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]

let expiration_to_yojson (x : expiration) =
  assoc_to_yojson
    [
      ("Type", Some (time_type_to_yojson x.type_));
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.value));
    ]

let certificate_detail_to_yojson (x : certificate_detail) =
  assoc_to_yojson
    [
      ("AcmeAccountId", option_to_yojson acme_account_id_to_yojson x.acme_account_id);
      ("AcmeEndpointArn", option_to_yojson arn_to_yojson x.acme_endpoint_arn);
      ( "CertificateKeyPairOrigin",
        option_to_yojson certificate_key_pair_origin_to_yojson x.certificate_key_pair_origin );
      ("Options", option_to_yojson certificate_options_to_yojson x.options);
      ("RenewalEligibility", option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility);
      ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn);
      ("ExtendedKeyUsages", option_to_yojson extended_key_usage_list_to_yojson x.extended_key_usages);
      ("KeyUsages", option_to_yojson key_usage_list_to_yojson x.key_usages);
      ("RenewalSummary", option_to_yojson renewal_summary_to_yojson x.renewal_summary);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("InUseBy", option_to_yojson in_use_list_to_yojson x.in_use_by);
      ("SignatureAlgorithm", option_to_yojson string__to_yojson x.signature_algorithm);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("RevocationReason", option_to_yojson revocation_reason_to_yojson x.revocation_reason);
      ("RevokedAt", option_to_yojson t_stamp_to_yojson x.revoked_at);
      ("Status", option_to_yojson certificate_status_to_yojson x.status);
      ("ImportedAt", option_to_yojson t_stamp_to_yojson x.imported_at);
      ("IssuedAt", option_to_yojson t_stamp_to_yojson x.issued_at);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("Issuer", option_to_yojson string__to_yojson x.issuer);
      ("Subject", option_to_yojson string__to_yojson x.subject);
      ("Serial", option_to_yojson string__to_yojson x.serial);
      ( "DomainValidationOptions",
        option_to_yojson domain_validation_list_to_yojson x.domain_validation_options );
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ("SubjectAlternativeNames", option_to_yojson domain_list_to_yojson x.subject_alternative_names);
      ("DomainName", option_to_yojson domain_name_string_to_yojson x.domain_name);
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
    ]

let describe_certificate_response_to_yojson (x : describe_certificate_response) =
  assoc_to_yojson [ ("Certificate", option_to_yojson certificate_detail_to_yojson x.certificate) ]

let describe_certificate_request_to_yojson (x : describe_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let acme_external_account_binding_to_yojson (x : acme_external_account_binding) =
  assoc_to_yojson
    [
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "LastUsedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_used_at );
      ( "RevokedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.revoked_at );
      ( "ExpiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
    ]

let describe_acme_external_account_binding_response_to_yojson
    (x : describe_acme_external_account_binding_response) =
  assoc_to_yojson
    [
      ( "ExternalAccountBinding",
        option_to_yojson acme_external_account_binding_to_yojson x.external_account_binding );
    ]

let describe_acme_external_account_binding_request_to_yojson
    (x : describe_acme_external_account_binding_request) =
  assoc_to_yojson
    [
      ( "AcmeExternalAccountBindingArn",
        Some (acme_external_account_binding_arn_to_yojson x.acme_external_account_binding_arn) );
    ]

let acme_endpoint_to_yojson (x : acme_endpoint) =
  assoc_to_yojson
    [
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("CertificateTags", option_to_yojson tag_list_to_yojson x.certificate_tags);
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "AuthorizationBehavior",
        option_to_yojson acme_authorization_behavior_to_yojson x.authorization_behavior );
      ( "FailureReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_reason );
      ("Status", option_to_yojson acme_endpoint_status_to_yojson x.status);
      ( "EndpointUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_url );
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
    ]

let describe_acme_endpoint_response_to_yojson (x : describe_acme_endpoint_response) =
  assoc_to_yojson [ ("AcmeEndpoint", option_to_yojson acme_endpoint_to_yojson x.acme_endpoint) ]

let describe_acme_endpoint_request_to_yojson (x : describe_acme_endpoint_request) =
  assoc_to_yojson [ ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn)) ]

let acme_domain_validation_to_yojson (x : acme_domain_validation) =
  assoc_to_yojson
    [
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("Status", option_to_yojson acme_domain_validation_status_to_yojson x.status);
      ( "PrevalidationDetails",
        option_to_yojson prevalidation_details_to_yojson x.prevalidation_details );
      ("PrevalidationType", option_to_yojson prevalidation_type_to_yojson x.prevalidation_type);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ( "AcmeDomainValidationArn",
        option_to_yojson acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn );
    ]

let describe_acme_domain_validation_response_to_yojson
    (x : describe_acme_domain_validation_response) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidation",
        option_to_yojson acme_domain_validation_to_yojson x.acme_domain_validation );
    ]

let describe_acme_domain_validation_request_to_yojson (x : describe_acme_domain_validation_request)
    =
  assoc_to_yojson
    [
      ( "AcmeDomainValidationArn",
        Some (acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn) );
    ]

let acme_account_to_yojson (x : acme_account) =
  assoc_to_yojson
    [
      ("Contacts", option_to_yojson contact_list_to_yojson x.contacts);
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("Status", option_to_yojson acme_account_status_to_yojson x.status);
      ( "PublicKeyThumbprint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.public_key_thumbprint );
      ( "AccountUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url );
    ]

let describe_acme_account_response_to_yojson (x : describe_acme_account_response) =
  assoc_to_yojson [ ("AcmeAccount", option_to_yojson acme_account_to_yojson x.acme_account) ]

let describe_acme_account_request_to_yojson (x : describe_acme_account_request) =
  assoc_to_yojson
    [
      ("AccountUrl", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url));
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
    ]

let delete_certificate_request_to_yojson (x : delete_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let delete_acme_external_account_binding_request_to_yojson
    (x : delete_acme_external_account_binding_request) =
  assoc_to_yojson
    [
      ( "AcmeExternalAccountBindingArn",
        Some (acme_external_account_binding_arn_to_yojson x.acme_external_account_binding_arn) );
    ]

let delete_acme_endpoint_request_to_yojson (x : delete_acme_endpoint_request) =
  assoc_to_yojson [ ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn)) ]

let delete_acme_domain_validation_request_to_yojson (x : delete_acme_domain_validation_request) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidationArn",
        Some (acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn) );
    ]

let create_acme_external_account_binding_response_to_yojson
    (x : create_acme_external_account_binding_response) =
  assoc_to_yojson
    [
      ( "ExternalAccountBinding",
        option_to_yojson acme_external_account_binding_to_yojson x.external_account_binding );
    ]

let create_acme_external_account_binding_request_to_yojson
    (x : create_acme_external_account_binding_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Expiration", option_to_yojson expiration_to_yojson x.expiration);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ( "IdempotencyToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_acme_endpoint_response_to_yojson (x : create_acme_endpoint_response) =
  assoc_to_yojson
    [ ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn) ]

let create_acme_endpoint_request_to_yojson (x : create_acme_endpoint_request) =
  assoc_to_yojson
    [
      ("CertificateTags", option_to_yojson tag_list_to_yojson x.certificate_tags);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CertificateAuthority", Some (certificate_authority_to_yojson x.certificate_authority));
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "AuthorizationBehavior",
        Some (acme_authorization_behavior_to_yojson x.authorization_behavior) );
      ( "IdempotencyToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_acme_domain_validation_response_to_yojson (x : create_acme_domain_validation_response) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidationArn",
        Some (acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn) );
    ]

let create_acme_domain_validation_request_to_yojson (x : create_acme_domain_validation_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("PrevalidationOptions", Some (prevalidation_options_to_yojson x.prevalidation_options));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ( "IdempotencyToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let add_tags_to_certificate_request_to_yojson (x : add_tags_to_certificate_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
    ]
