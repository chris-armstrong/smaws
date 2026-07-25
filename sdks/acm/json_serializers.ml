open Smaws_Lib.Json.SerializeHelpers
open Types

let service_error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let acme_account_id_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson

let certificate_key_pair_origin_to_yojson (x : certificate_key_pair_origin) =
  match x with
  | AWS_MANAGED -> `String "AWS_MANAGED"
  | ACME -> `String "ACME"
  | CUSTOMER_PROVIDED -> `String "CUSTOMER_PROVIDED"

let validation_method_to_yojson (x : validation_method) =
  match x with EMAIL -> `String "EMAIL" | DNS -> `String "DNS" | HTTP -> `String "HTTP"

let certificate_managed_by_to_yojson (x : certificate_managed_by) =
  match x with CLOUDFRONT -> `String "CLOUDFRONT"

let certificate_export_to_yojson (x : certificate_export) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let certificate_type_to_yojson (x : certificate_type) =
  match x with
  | IMPORTED -> `String "IMPORTED"
  | AMAZON_ISSUED -> `String "AMAZON_ISSUED"
  | PRIVATE -> `String "PRIVATE"

let renewal_status_to_yojson (x : renewal_status) =
  match x with
  | PENDING_AUTO_RENEWAL -> `String "PENDING_AUTO_RENEWAL"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"

let certificate_status_to_yojson (x : certificate_status) =
  match x with
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
  | ISSUED -> `String "ISSUED"
  | INACTIVE -> `String "INACTIVE"
  | EXPIRED -> `String "EXPIRED"
  | VALIDATION_TIMED_OUT -> `String "VALIDATION_TIMED_OUT"
  | REVOKED -> `String "REVOKED"
  | FAILED -> `String "FAILED"

let t_stamp_to_yojson = timestamp_epoch_seconds_to_yojson

let renewal_eligibility_to_yojson (x : renewal_eligibility) =
  match x with ELIGIBLE -> `String "ELIGIBLE" | INELIGIBLE -> `String "INELIGIBLE"

let nullable_boolean_to_yojson = bool_to_yojson

let acm_certificate_metadata_to_yojson (x : acm_certificate_metadata) =
  assoc_to_yojson
    [
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("Exported", option_to_yojson nullable_boolean_to_yojson x.exported);
      ("ImportedAt", option_to_yojson t_stamp_to_yojson x.imported_at);
      ("InUse", option_to_yojson nullable_boolean_to_yojson x.in_use);
      ("IssuedAt", option_to_yojson t_stamp_to_yojson x.issued_at);
      ("RenewalEligibility", option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility);
      ("RevokedAt", option_to_yojson t_stamp_to_yojson x.revoked_at);
      ("Status", option_to_yojson certificate_status_to_yojson x.status);
      ("RenewalStatus", option_to_yojson renewal_status_to_yojson x.renewal_status);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("ExportOption", option_to_yojson certificate_export_to_yojson x.export_option);
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ("ValidationMethod", option_to_yojson validation_method_to_yojson x.validation_method);
      ( "CertificateKeyPairOrigin",
        option_to_yojson certificate_key_pair_origin_to_yojson x.certificate_key_pair_origin );
      ("AcmeEndpointArn", option_to_yojson arn_to_yojson x.acme_endpoint_arn);
      ("AcmeAccountId", option_to_yojson acme_account_id_to_yojson x.acme_account_id);
    ]

let acm_certificate_metadata_filter_to_yojson (x : acm_certificate_metadata_filter) =
  match x with
  | Status arg -> assoc_to_yojson [ ("Status", Some (certificate_status_to_yojson arg)) ]
  | RenewalStatus arg -> assoc_to_yojson [ ("RenewalStatus", Some (renewal_status_to_yojson arg)) ]
  | Type arg -> assoc_to_yojson [ ("Type", Some (certificate_type_to_yojson arg)) ]
  | InUse arg -> assoc_to_yojson [ ("InUse", Some (nullable_boolean_to_yojson arg)) ]
  | Exported arg -> assoc_to_yojson [ ("Exported", Some (nullable_boolean_to_yojson arg)) ]
  | ExportOption arg ->
      assoc_to_yojson [ ("ExportOption", Some (certificate_export_to_yojson arg)) ]
  | ManagedBy arg -> assoc_to_yojson [ ("ManagedBy", Some (certificate_managed_by_to_yojson arg)) ]
  | ValidationMethod arg ->
      assoc_to_yojson [ ("ValidationMethod", Some (validation_method_to_yojson arg)) ]
  | CertificateKeyPairOrigin arg ->
      assoc_to_yojson
        [ ("CertificateKeyPairOrigin", Some (certificate_key_pair_origin_to_yojson arg)) ]
  | AcmeEndpointArn arg -> assoc_to_yojson [ ("AcmeEndpointArn", Some (arn_to_yojson arg)) ]
  | AcmeAccountId arg -> assoc_to_yojson [ ("AcmeAccountId", Some (acme_account_id_to_yojson arg)) ]

let contact_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let acme_external_account_binding_arn_to_yojson = string_to_yojson

let acme_account_status_to_yojson (x : acme_account_status) =
  match x with
  | VALID -> `String "VALID"
  | DEACTIVATED -> `String "DEACTIVATED"
  | REVOKED -> `String "REVOKED"

let acme_account_to_yojson (x : acme_account) =
  assoc_to_yojson
    [
      ( "AccountUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url );
      ( "PublicKeyThumbprint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.public_key_thumbprint );
      ("Status", option_to_yojson acme_account_status_to_yojson x.status);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
      ("Contacts", option_to_yojson contact_list_to_yojson x.contacts);
    ]

let acme_account_summary_to_yojson (x : acme_account_summary) =
  assoc_to_yojson
    [
      ( "AccountUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url );
      ( "PublicKeyThumbprint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.public_key_thumbprint );
      ("Status", option_to_yojson acme_account_status_to_yojson x.status);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
      ("Contacts", option_to_yojson contact_list_to_yojson x.contacts);
    ]

let acme_account_list_to_yojson tree = list_to_yojson acme_account_summary_to_yojson tree

let acme_authorization_behavior_to_yojson (x : acme_authorization_behavior) =
  match x with PRE_APPROVED -> `String "PRE_APPROVED"

let acme_contact_to_yojson (x : acme_contact) =
  match x with REQUIRED -> `String "REQUIRED" | NOT_REQUIRED -> `String "NOT_REQUIRED"

let acme_domain_validation_failure_reason_to_yojson (x : acme_domain_validation_failure_reason) =
  match x with
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | DOMAIN_MISMATCH -> `String "DOMAIN_MISMATCH"
  | DOMAIN_NOT_ALLOWED -> `String "DOMAIN_NOT_ALLOWED"
  | ENDPOINT_NOT_ACTIVE -> `String "ENDPOINT_NOT_ACTIVE"
  | HOSTED_ZONE_NOT_FOUND -> `String "HOSTED_ZONE_NOT_FOUND"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | INVALID_CHANGE_BATCH -> `String "INVALID_CHANGE_BATCH"
  | INVALID_PUBLIC_DOMAIN -> `String "INVALID_PUBLIC_DOMAIN"
  | TIMED_OUT -> `String "TIMED_OUT"

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson acme_domain_validation_failure_reason_to_yojson x.reason);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let acme_domain_validation_status_to_yojson (x : acme_domain_validation_status) =
  match x with
  | VALIDATING -> `String "VALIDATING"
  | VALID -> `String "VALID"
  | INVALID -> `String "INVALID"
  | DELETING -> `String "DELETING"

let string__to_yojson = string_to_yojson
let record_type_to_yojson (x : record_type) = match x with CNAME -> `String "CNAME"

let resource_record_to_yojson (x : resource_record) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Type", Some (record_type_to_yojson x.type_));
      ("Value", Some (string__to_yojson x.value));
    ]

let hosted_zone_id_to_yojson = string_to_yojson

let domain_scope_option_to_yojson (x : domain_scope_option) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let domain_scope_to_yojson (x : domain_scope) =
  assoc_to_yojson
    [
      ("ExactDomain", option_to_yojson domain_scope_option_to_yojson x.exact_domain);
      ("Subdomains", option_to_yojson domain_scope_option_to_yojson x.subdomains);
      ("Wildcards", option_to_yojson domain_scope_option_to_yojson x.wildcards);
    ]

let dns_prevalidation_details_to_yojson (x : dns_prevalidation_details) =
  assoc_to_yojson
    [
      ("DomainScope", option_to_yojson domain_scope_to_yojson x.domain_scope);
      ("HostedZoneId", option_to_yojson hosted_zone_id_to_yojson x.hosted_zone_id);
      ("ResourceRecord", option_to_yojson resource_record_to_yojson x.resource_record);
    ]

let prevalidation_details_to_yojson (x : prevalidation_details) =
  match x with
  | DnsPrevalidation arg ->
      assoc_to_yojson [ ("DnsPrevalidation", Some (dns_prevalidation_details_to_yojson arg)) ]

let prevalidation_type_to_yojson (x : prevalidation_type) =
  match x with DNS_PREVALIDATION -> `String "DNS_PREVALIDATION"

let domain_name_to_yojson = string_to_yojson
let acme_endpoint_arn_to_yojson = string_to_yojson
let acme_domain_validation_arn_to_yojson = string_to_yojson

let acme_domain_validation_to_yojson (x : acme_domain_validation) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidationArn",
        option_to_yojson acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn );
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("PrevalidationType", option_to_yojson prevalidation_type_to_yojson x.prevalidation_type);
      ( "PrevalidationDetails",
        option_to_yojson prevalidation_details_to_yojson x.prevalidation_details );
      ("Status", option_to_yojson acme_domain_validation_status_to_yojson x.status);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let acme_domain_validation_summary_to_yojson (x : acme_domain_validation_summary) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidationArn",
        option_to_yojson acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn );
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("PrevalidationType", option_to_yojson prevalidation_type_to_yojson x.prevalidation_type);
      ( "PrevalidationDetails",
        option_to_yojson prevalidation_details_to_yojson x.prevalidation_details );
      ("Status", option_to_yojson acme_domain_validation_status_to_yojson x.status);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let acme_domain_validation_list_to_yojson tree =
  list_to_yojson acme_domain_validation_summary_to_yojson tree

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let public_key_algorithm_to_yojson (x : public_key_algorithm) =
  match x with
  | RSA_2048 -> `String "RSA_2048"
  | EC_PRIME256_V1 -> `String "EC_prime256v1"
  | EC_SECP384_R1 -> `String "EC_secp384r1"

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

let acme_endpoint_status_to_yojson (x : acme_endpoint_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let acme_endpoint_to_yojson (x : acme_endpoint) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ( "EndpointUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_url );
      ("Status", option_to_yojson acme_endpoint_status_to_yojson x.status);
      ( "FailureReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_reason );
      ( "AuthorizationBehavior",
        option_to_yojson acme_authorization_behavior_to_yojson x.authorization_behavior );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ("CertificateTags", option_to_yojson tag_list_to_yojson x.certificate_tags);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let acme_endpoint_summary_to_yojson (x : acme_endpoint_summary) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ( "EndpointUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.endpoint_url );
      ("Status", option_to_yojson acme_endpoint_status_to_yojson x.status);
      ( "FailureReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_reason );
      ( "AuthorizationBehavior",
        option_to_yojson acme_authorization_behavior_to_yojson x.authorization_behavior );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
      ("CertificateTags", option_to_yojson tag_list_to_yojson x.certificate_tags);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let acme_endpoint_list_to_yojson tree = list_to_yojson acme_endpoint_summary_to_yojson tree
let role_arn_to_yojson = string_to_yojson

let acme_external_account_binding_to_yojson (x : acme_external_account_binding) =
  assoc_to_yojson
    [
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ExpiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "RevokedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.revoked_at );
      ( "LastUsedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_used_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let acme_external_account_binding_summary_to_yojson (x : acme_external_account_binding_summary) =
  assoc_to_yojson
    [
      ( "AcmeExternalAccountBindingArn",
        option_to_yojson acme_external_account_binding_arn_to_yojson
          x.acme_external_account_binding_arn );
      ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ExpiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "RevokedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.revoked_at );
      ( "LastUsedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_used_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "UpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let acme_external_account_binding_list_to_yojson tree =
  list_to_yojson acme_external_account_binding_summary_to_yojson tree

let validation_exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson validation_exception_message_to_yojson x.message) ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let coral_availability_throttled_resource_to_yojson = string_to_yojson
let coral_availability_throttling_reason_to_yojson = string_to_yojson

let throttling_reason_to_yojson (x : throttling_reason) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson coral_availability_throttling_reason_to_yojson x.reason);
      ("resource", option_to_yojson coral_availability_throttled_resource_to_yojson x.resource);
    ]

let throttling_reason_list_to_yojson tree = list_to_yojson throttling_reason_to_yojson tree
let availability_error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson availability_error_message_to_yojson x.message);
      ("throttlingReasons", option_to_yojson throttling_reason_list_to_yojson x.throttling_reasons);
    ]

let tag_policy_exception_to_yojson (x : tag_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let add_tags_to_certificate_request_to_yojson (x : add_tags_to_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let certificate_body_to_yojson = string_to_yojson
let certificate_body_blob_to_yojson = blob_to_yojson
let certificate_chain_to_yojson = string_to_yojson
let certificate_chain_blob_to_yojson = blob_to_yojson

let certificate_transparency_logging_preference_to_yojson
    (x : certificate_transparency_logging_preference) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let certificate_options_to_yojson (x : certificate_options) =
  assoc_to_yojson
    [
      ( "CertificateTransparencyLoggingPreference",
        option_to_yojson certificate_transparency_logging_preference_to_yojson
          x.certificate_transparency_logging_preference );
      ("Export", option_to_yojson certificate_export_to_yojson x.export_);
    ]

let extended_key_usage_name_to_yojson (x : extended_key_usage_name) =
  match x with
  | TLS_WEB_SERVER_AUTHENTICATION -> `String "TLS_WEB_SERVER_AUTHENTICATION"
  | TLS_WEB_CLIENT_AUTHENTICATION -> `String "TLS_WEB_CLIENT_AUTHENTICATION"
  | CODE_SIGNING -> `String "CODE_SIGNING"
  | EMAIL_PROTECTION -> `String "EMAIL_PROTECTION"
  | TIME_STAMPING -> `String "TIME_STAMPING"
  | OCSP_SIGNING -> `String "OCSP_SIGNING"
  | IPSEC_END_SYSTEM -> `String "IPSEC_END_SYSTEM"
  | IPSEC_TUNNEL -> `String "IPSEC_TUNNEL"
  | IPSEC_USER -> `String "IPSEC_USER"
  | ANY -> `String "ANY"
  | NONE -> `String "NONE"
  | CUSTOM -> `String "CUSTOM"

let extended_key_usage_to_yojson (x : extended_key_usage) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson extended_key_usage_name_to_yojson x.name);
      ("OID", option_to_yojson string__to_yojson x.oi_d);
    ]

let extended_key_usage_list_to_yojson tree = list_to_yojson extended_key_usage_to_yojson tree

let key_usage_name_to_yojson (x : key_usage_name) =
  match x with
  | DIGITAL_SIGNATURE -> `String "DIGITAL_SIGNATURE"
  | NON_REPUDATION -> `String "NON_REPUDIATION"
  | KEY_ENCIPHERMENT -> `String "KEY_ENCIPHERMENT"
  | DATA_ENCIPHERMENT -> `String "DATA_ENCIPHERMENT"
  | KEY_AGREEMENT -> `String "KEY_AGREEMENT"
  | CERTIFICATE_SIGNING -> `String "CERTIFICATE_SIGNING"
  | CRL_SIGNING -> `String "CRL_SIGNING"
  | ENCHIPER_ONLY -> `String "ENCIPHER_ONLY"
  | DECIPHER_ONLY -> `String "DECIPHER_ONLY"
  | ANY -> `String "ANY"
  | CUSTOM -> `String "CUSTOM"

let key_usage_to_yojson (x : key_usage) =
  assoc_to_yojson [ ("Name", option_to_yojson key_usage_name_to_yojson x.name) ]

let key_usage_list_to_yojson tree = list_to_yojson key_usage_to_yojson tree

let failure_reason_to_yojson (x : failure_reason) =
  match x with
  | NO_AVAILABLE_CONTACTS -> `String "NO_AVAILABLE_CONTACTS"
  | ADDITIONAL_VERIFICATION_REQUIRED -> `String "ADDITIONAL_VERIFICATION_REQUIRED"
  | DOMAIN_NOT_ALLOWED -> `String "DOMAIN_NOT_ALLOWED"
  | INVALID_PUBLIC_DOMAIN -> `String "INVALID_PUBLIC_DOMAIN"
  | DOMAIN_VALIDATION_DENIED -> `String "DOMAIN_VALIDATION_DENIED"
  | CAA_ERROR -> `String "CAA_ERROR"
  | PCA_LIMIT_EXCEEDED -> `String "PCA_LIMIT_EXCEEDED"
  | PCA_INVALID_ARN -> `String "PCA_INVALID_ARN"
  | PCA_INVALID_STATE -> `String "PCA_INVALID_STATE"
  | PCA_REQUEST_FAILED -> `String "PCA_REQUEST_FAILED"
  | PCA_NAME_CONSTRAINTS_VALIDATION -> `String "PCA_NAME_CONSTRAINTS_VALIDATION"
  | PCA_RESOURCE_NOT_FOUND -> `String "PCA_RESOURCE_NOT_FOUND"
  | PCA_INVALID_ARGS -> `String "PCA_INVALID_ARGS"
  | PCA_INVALID_DURATION -> `String "PCA_INVALID_DURATION"
  | PCA_ACCESS_DENIED -> `String "PCA_ACCESS_DENIED"
  | SLR_NOT_FOUND -> `String "SLR_NOT_FOUND"
  | OTHER -> `String "OTHER"

let http_redirect_to_yojson (x : http_redirect) =
  assoc_to_yojson
    [
      ("RedirectFrom", option_to_yojson string__to_yojson x.redirect_from);
      ("RedirectTo", option_to_yojson string__to_yojson x.redirect_to);
    ]

let domain_status_to_yojson (x : domain_status) =
  match x with
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"

let domain_name_string_to_yojson = string_to_yojson
let validation_email_list_to_yojson tree = list_to_yojson string__to_yojson tree

let domain_validation_to_yojson (x : domain_validation) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_string_to_yojson x.domain_name));
      ("ValidationEmails", option_to_yojson validation_email_list_to_yojson x.validation_emails);
      ("ValidationDomain", option_to_yojson domain_name_string_to_yojson x.validation_domain);
      ("ValidationStatus", option_to_yojson domain_status_to_yojson x.validation_status);
      ("ResourceRecord", option_to_yojson resource_record_to_yojson x.resource_record);
      ("HttpRedirect", option_to_yojson http_redirect_to_yojson x.http_redirect);
      ("ValidationMethod", option_to_yojson validation_method_to_yojson x.validation_method);
    ]

let domain_validation_list_to_yojson tree = list_to_yojson domain_validation_to_yojson tree

let renewal_summary_to_yojson (x : renewal_summary) =
  assoc_to_yojson
    [
      ("RenewalStatus", Some (renewal_status_to_yojson x.renewal_status));
      ( "DomainValidationOptions",
        Some (domain_validation_list_to_yojson x.domain_validation_options) );
      ("RenewalStatusReason", option_to_yojson failure_reason_to_yojson x.renewal_status_reason);
      ("UpdatedAt", Some (t_stamp_to_yojson x.updated_at));
    ]

let in_use_list_to_yojson tree = list_to_yojson string__to_yojson tree

let key_algorithm_to_yojson (x : key_algorithm) =
  match x with
  | RSA_1024 -> `String "RSA_1024"
  | RSA_2048 -> `String "RSA_2048"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_4096 -> `String "RSA_4096"
  | EC_prime256v1 -> `String "EC_prime256v1"
  | EC_secp384r1 -> `String "EC_secp384r1"
  | EC_secp521r1 -> `String "EC_secp521r1"

let revocation_reason_to_yojson (x : revocation_reason) =
  match x with
  | UNSPECIFIED -> `String "UNSPECIFIED"
  | KEY_COMPROMISE -> `String "KEY_COMPROMISE"
  | CA_COMPROMISE -> `String "CA_COMPROMISE"
  | AFFILIATION_CHANGED -> `String "AFFILIATION_CHANGED"
  | SUPERCEDED -> `String "SUPERCEDED"
  | SUPERSEDED -> `String "SUPERSEDED"
  | CESSATION_OF_OPERATION -> `String "CESSATION_OF_OPERATION"
  | CERTIFICATE_HOLD -> `String "CERTIFICATE_HOLD"
  | REMOVE_FROM_CRL -> `String "REMOVE_FROM_CRL"
  | PRIVILEGE_WITHDRAWN -> `String "PRIVILEGE_WITHDRAWN"
  | A_A_COMPROMISE -> `String "A_A_COMPROMISE"

let domain_list_to_yojson tree = list_to_yojson domain_name_string_to_yojson tree

let certificate_detail_to_yojson (x : certificate_detail) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
      ("DomainName", option_to_yojson domain_name_string_to_yojson x.domain_name);
      ("SubjectAlternativeNames", option_to_yojson domain_list_to_yojson x.subject_alternative_names);
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ( "DomainValidationOptions",
        option_to_yojson domain_validation_list_to_yojson x.domain_validation_options );
      ("Serial", option_to_yojson string__to_yojson x.serial);
      ("Subject", option_to_yojson string__to_yojson x.subject);
      ("Issuer", option_to_yojson string__to_yojson x.issuer);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("IssuedAt", option_to_yojson t_stamp_to_yojson x.issued_at);
      ("ImportedAt", option_to_yojson t_stamp_to_yojson x.imported_at);
      ("Status", option_to_yojson certificate_status_to_yojson x.status);
      ("RevokedAt", option_to_yojson t_stamp_to_yojson x.revoked_at);
      ("RevocationReason", option_to_yojson revocation_reason_to_yojson x.revocation_reason);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("SignatureAlgorithm", option_to_yojson string__to_yojson x.signature_algorithm);
      ("InUseBy", option_to_yojson in_use_list_to_yojson x.in_use_by);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("RenewalSummary", option_to_yojson renewal_summary_to_yojson x.renewal_summary);
      ("KeyUsages", option_to_yojson key_usage_list_to_yojson x.key_usages);
      ("ExtendedKeyUsages", option_to_yojson extended_key_usage_list_to_yojson x.extended_key_usages);
      ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn);
      ("RenewalEligibility", option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility);
      ("Options", option_to_yojson certificate_options_to_yojson x.options);
      ( "CertificateKeyPairOrigin",
        option_to_yojson certificate_key_pair_origin_to_yojson x.certificate_key_pair_origin );
      ("AcmeEndpointArn", option_to_yojson arn_to_yojson x.acme_endpoint_arn);
      ("AcmeAccountId", option_to_yojson acme_account_id_to_yojson x.acme_account_id);
    ]

let timestamp_range_to_yojson (x : timestamp_range) =
  assoc_to_yojson
    [
      ("Start", option_to_yojson t_stamp_to_yojson x.start);
      ("End", option_to_yojson t_stamp_to_yojson x.end_);
    ]

let serial_number_to_yojson = string_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with CONTAINS -> `String "CONTAINS" | EQUALS -> `String "EQUALS"

let filter_string_to_yojson = string_to_yojson

let dns_name_filter_to_yojson (x : dns_name_filter) =
  assoc_to_yojson
    [
      ("Value", Some (filter_string_to_yojson x.value));
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
    ]

let subject_alternative_name_filter_to_yojson (x : subject_alternative_name_filter) =
  match x with
  | DnsName arg -> assoc_to_yojson [ ("DnsName", Some (dns_name_filter_to_yojson arg)) ]

let common_name_filter_to_yojson (x : common_name_filter) =
  assoc_to_yojson
    [
      ("Value", Some (filter_string_to_yojson x.value));
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
    ]

let subject_filter_to_yojson (x : subject_filter) =
  match x with
  | CommonName arg -> assoc_to_yojson [ ("CommonName", Some (common_name_filter_to_yojson arg)) ]

let x509_attribute_filter_to_yojson (x : x509_attribute_filter) =
  match x with
  | Subject arg -> assoc_to_yojson [ ("Subject", Some (subject_filter_to_yojson arg)) ]
  | SubjectAlternativeName arg ->
      assoc_to_yojson
        [ ("SubjectAlternativeName", Some (subject_alternative_name_filter_to_yojson arg)) ]
  | ExtendedKeyUsage arg ->
      assoc_to_yojson [ ("ExtendedKeyUsage", Some (extended_key_usage_name_to_yojson arg)) ]
  | KeyUsage arg -> assoc_to_yojson [ ("KeyUsage", Some (key_usage_name_to_yojson arg)) ]
  | KeyAlgorithm arg -> assoc_to_yojson [ ("KeyAlgorithm", Some (key_algorithm_to_yojson arg)) ]
  | SerialNumber arg -> assoc_to_yojson [ ("SerialNumber", Some (serial_number_to_yojson arg)) ]
  | NotAfter arg -> assoc_to_yojson [ ("NotAfter", Some (timestamp_range_to_yojson arg)) ]
  | NotBefore arg -> assoc_to_yojson [ ("NotBefore", Some (timestamp_range_to_yojson arg)) ]

let certificate_filter_to_yojson (x : certificate_filter) =
  match x with
  | CertificateArn arg -> assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson arg)) ]
  | X509AttributeFilter arg ->
      assoc_to_yojson [ ("X509AttributeFilter", Some (x509_attribute_filter_to_yojson arg)) ]
  | AcmCertificateMetadataFilter arg ->
      assoc_to_yojson
        [ ("AcmCertificateMetadataFilter", Some (acm_certificate_metadata_filter_to_yojson arg)) ]

let rec certificate_filter_statement_list_to_yojson tree =
  list_to_yojson certificate_filter_statement_to_yojson tree

and certificate_filter_statement_to_yojson (x : certificate_filter_statement) =
  match x with
  | And arg -> assoc_to_yojson [ ("And", Some (certificate_filter_statement_list_to_yojson arg)) ]
  | Or arg -> assoc_to_yojson [ ("Or", Some (certificate_filter_statement_list_to_yojson arg)) ]
  | Not arg -> assoc_to_yojson [ ("Not", Some (certificate_filter_statement_to_yojson arg)) ]
  | Filter arg -> assoc_to_yojson [ ("Filter", Some (certificate_filter_to_yojson arg)) ]

let certificate_key_pair_origins_to_yojson tree =
  list_to_yojson certificate_key_pair_origin_to_yojson tree

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let update_certificate_options_request_to_yojson (x : update_certificate_options_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("Options", Some (certificate_options_to_yojson x.options));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let update_acme_endpoint_request_to_yojson (x : update_acme_endpoint_request) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ( "AuthorizationBehavior",
        option_to_yojson acme_authorization_behavior_to_yojson x.authorization_behavior );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ( "CertificateAuthority",
        option_to_yojson certificate_authority_to_yojson x.certificate_authority );
    ]

let dns_prevalidation_options_to_yojson (x : dns_prevalidation_options) =
  assoc_to_yojson
    [
      ("DomainScope", option_to_yojson domain_scope_to_yojson x.domain_scope);
      ("HostedZoneId", option_to_yojson hosted_zone_id_to_yojson x.hosted_zone_id);
    ]

let prevalidation_options_to_yojson (x : prevalidation_options) =
  match x with
  | DnsPrevalidation arg ->
      assoc_to_yojson [ ("DnsPrevalidation", Some (dns_prevalidation_options_to_yojson arg)) ]

let update_acme_domain_validation_request_to_yojson (x : update_acme_domain_validation_request) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidationArn",
        Some (acme_domain_validation_arn_to_yojson x.acme_domain_validation_arn) );
      ( "PrevalidationOptions",
        option_to_yojson prevalidation_options_to_yojson x.prevalidation_options );
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let next_token_to_yojson = string_to_yojson

let certificate_metadata_to_yojson (x : certificate_metadata) =
  match x with
  | AcmCertificateMetadata arg ->
      assoc_to_yojson [ ("AcmCertificateMetadata", Some (acm_certificate_metadata_to_yojson arg)) ]

let key_usage_names_to_yojson tree = list_to_yojson key_usage_name_to_yojson tree
let extended_key_usage_names_to_yojson tree = list_to_yojson extended_key_usage_name_to_yojson tree

let other_name_to_yojson (x : other_name) =
  assoc_to_yojson
    [
      ("ObjectIdentifier", option_to_yojson string__to_yojson x.object_identifier);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let custom_attribute_to_yojson (x : custom_attribute) =
  assoc_to_yojson
    [
      ("ObjectIdentifier", option_to_yojson string__to_yojson x.object_identifier);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let custom_attribute_list_to_yojson tree = list_to_yojson custom_attribute_to_yojson tree
let domain_component_list_to_yojson tree = list_to_yojson string__to_yojson tree

let distinguished_name_to_yojson (x : distinguished_name) =
  assoc_to_yojson
    [
      ("CommonName", option_to_yojson string__to_yojson x.common_name);
      ("DomainComponents", option_to_yojson domain_component_list_to_yojson x.domain_components);
      ("Country", option_to_yojson string__to_yojson x.country);
      ("CustomAttributes", option_to_yojson custom_attribute_list_to_yojson x.custom_attributes);
      ( "DistinguishedNameQualifier",
        option_to_yojson string__to_yojson x.distinguished_name_qualifier );
      ("GenerationQualifier", option_to_yojson string__to_yojson x.generation_qualifier);
      ("GivenName", option_to_yojson string__to_yojson x.given_name);
      ("Initials", option_to_yojson string__to_yojson x.initials);
      ("Locality", option_to_yojson string__to_yojson x.locality);
      ("Organization", option_to_yojson string__to_yojson x.organization);
      ("OrganizationalUnit", option_to_yojson string__to_yojson x.organizational_unit);
      ("Pseudonym", option_to_yojson string__to_yojson x.pseudonym);
      ("SerialNumber", option_to_yojson string__to_yojson x.serial_number);
      ("State", option_to_yojson string__to_yojson x.state);
      ("Surname", option_to_yojson string__to_yojson x.surname);
      ("Title", option_to_yojson string__to_yojson x.title);
    ]

let general_name_to_yojson (x : general_name) =
  match x with
  | DirectoryName arg ->
      assoc_to_yojson [ ("DirectoryName", Some (distinguished_name_to_yojson arg)) ]
  | DnsName arg -> assoc_to_yojson [ ("DnsName", Some (string__to_yojson arg)) ]
  | IpAddress arg -> assoc_to_yojson [ ("IpAddress", Some (string__to_yojson arg)) ]
  | OtherName arg -> assoc_to_yojson [ ("OtherName", Some (other_name_to_yojson arg)) ]
  | RegisteredId arg -> assoc_to_yojson [ ("RegisteredId", Some (string__to_yojson arg)) ]
  | Rfc822Name arg -> assoc_to_yojson [ ("Rfc822Name", Some (string__to_yojson arg)) ]
  | UniformResourceIdentifier arg ->
      assoc_to_yojson [ ("UniformResourceIdentifier", Some (string__to_yojson arg)) ]

let general_name_list_to_yojson tree = list_to_yojson general_name_to_yojson tree

let x509_attributes_to_yojson (x : x509_attributes) =
  assoc_to_yojson
    [
      ("Issuer", option_to_yojson distinguished_name_to_yojson x.issuer);
      ("Subject", option_to_yojson distinguished_name_to_yojson x.subject);
      ( "SubjectAlternativeNames",
        option_to_yojson general_name_list_to_yojson x.subject_alternative_names );
      ( "ExtendedKeyUsages",
        option_to_yojson extended_key_usage_names_to_yojson x.extended_key_usages );
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("KeyUsages", option_to_yojson key_usage_names_to_yojson x.key_usages);
      ("SerialNumber", option_to_yojson serial_number_to_yojson x.serial_number);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
    ]

let certificate_search_result_to_yojson (x : certificate_search_result) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
      ("X509Attributes", option_to_yojson x509_attributes_to_yojson x.x509_attributes);
      ("CertificateMetadata", option_to_yojson certificate_metadata_to_yojson x.certificate_metadata);
    ]

let certificate_search_result_list_to_yojson tree =
  list_to_yojson certificate_search_result_to_yojson tree

let search_certificates_response_to_yojson (x : search_certificates_response) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson certificate_search_result_list_to_yojson x.results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let search_certificates_sort_order_to_yojson (x : search_certificates_sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let search_certificates_sort_by_to_yojson (x : search_certificates_sort_by) =
  match x with
  | CREATED_AT -> `String "CREATED_AT"
  | NOT_AFTER -> `String "NOT_AFTER"
  | STATUS -> `String "STATUS"
  | RENEWAL_STATUS -> `String "RENEWAL_STATUS"
  | EXPORTED -> `String "EXPORTED"
  | IN_USE -> `String "IN_USE"
  | NOT_BEFORE -> `String "NOT_BEFORE"
  | KEY_ALGORITHM -> `String "KEY_ALGORITHM"
  | TYPE -> `String "TYPE"
  | CERTIFICATE_ARN -> `String "CERTIFICATE_ARN"
  | COMMON_NAME -> `String "COMMON_NAME"
  | REVOKED_AT -> `String "REVOKED_AT"
  | RENEWAL_ELIGIBILITY -> `String "RENEWAL_ELIGIBILITY"
  | ISSUED_AT -> `String "ISSUED_AT"
  | MANAGED_BY -> `String "MANAGED_BY"
  | EXPORT_OPTION -> `String "EXPORT_OPTION"
  | VALIDATION_METHOD -> `String "VALIDATION_METHOD"
  | IMPORTED_AT -> `String "IMPORTED_AT"
  | ACME_ENDPOINT_ARN -> `String "ACME_ENDPOINT_ARN"
  | ACME_ACCOUNT_ID -> `String "ACME_ACCOUNT_ID"
  | CERTIFICATE_KEY_PAIR_ORIGIN -> `String "CERTIFICATE_KEY_PAIR_ORIGIN"

let search_max_results_to_yojson = int_to_yojson

let search_certificates_request_to_yojson (x : search_certificates_request) =
  assoc_to_yojson
    [
      ("FilterStatement", option_to_yojson certificate_filter_statement_to_yojson x.filter_statement);
      ("MaxResults", option_to_yojson search_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortBy", option_to_yojson search_certificates_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson search_certificates_sort_order_to_yojson x.sort_order);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let revoke_certificate_response_to_yojson (x : revoke_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let revoke_certificate_request_to_yojson (x : revoke_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("RevocationReason", Some (revocation_reason_to_yojson x.revocation_reason));
    ]

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
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ("AccountUrl", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url));
    ]

let invalid_domain_validation_options_exception_to_yojson
    (x : invalid_domain_validation_options_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resend_validation_email_request_to_yojson (x : resend_validation_email_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("Domain", Some (domain_name_string_to_yojson x.domain));
      ("ValidationDomain", Some (domain_name_string_to_yojson x.validation_domain));
    ]

let request_certificate_response_to_yojson (x : request_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let pca_arn_to_yojson = string_to_yojson

let domain_validation_option_to_yojson (x : domain_validation_option) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_string_to_yojson x.domain_name));
      ("ValidationDomain", Some (domain_name_string_to_yojson x.validation_domain));
    ]

let domain_validation_option_list_to_yojson tree =
  list_to_yojson domain_validation_option_to_yojson tree

let idempotency_token_to_yojson = string_to_yojson

let request_certificate_request_to_yojson (x : request_certificate_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_string_to_yojson x.domain_name));
      ("ValidationMethod", option_to_yojson validation_method_to_yojson x.validation_method);
      ("SubjectAlternativeNames", option_to_yojson domain_list_to_yojson x.subject_alternative_names);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ( "DomainValidationOptions",
        option_to_yojson domain_validation_option_list_to_yojson x.domain_validation_options );
      ("Options", option_to_yojson certificate_options_to_yojson x.options);
      ("CertificateAuthorityArn", option_to_yojson pca_arn_to_yojson x.certificate_authority_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
    ]

let request_in_progress_exception_to_yojson (x : request_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let renew_certificate_request_to_yojson (x : renew_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let remove_tags_from_certificate_request_to_yojson (x : remove_tags_from_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let positive_integer_to_yojson = int_to_yojson

let expiry_events_configuration_to_yojson (x : expiry_events_configuration) =
  assoc_to_yojson
    [ ("DaysBeforeExpiry", option_to_yojson positive_integer_to_yojson x.days_before_expiry) ]

let put_account_configuration_request_to_yojson (x : put_account_configuration_request) =
  assoc_to_yojson
    [
      ("ExpiryEvents", option_to_yojson expiry_events_configuration_to_yojson x.expiry_events);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_tags_for_certificate_response_to_yojson (x : list_tags_for_certificate_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_certificate_request_to_yojson (x : list_tags_for_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let invalid_args_exception_to_yojson (x : invalid_args_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let certificate_summary_to_yojson (x : certificate_summary) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
      ("DomainName", option_to_yojson domain_name_string_to_yojson x.domain_name);
      ( "SubjectAlternativeNameSummaries",
        option_to_yojson domain_list_to_yojson x.subject_alternative_name_summaries );
      ( "HasAdditionalSubjectAlternativeNames",
        option_to_yojson nullable_boolean_to_yojson x.has_additional_subject_alternative_names );
      ("Status", option_to_yojson certificate_status_to_yojson x.status);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("KeyAlgorithm", option_to_yojson key_algorithm_to_yojson x.key_algorithm);
      ("KeyUsages", option_to_yojson key_usage_names_to_yojson x.key_usages);
      ( "ExtendedKeyUsages",
        option_to_yojson extended_key_usage_names_to_yojson x.extended_key_usages );
      ("ExportOption", option_to_yojson certificate_export_to_yojson x.export_option);
      ("InUse", option_to_yojson nullable_boolean_to_yojson x.in_use);
      ("Exported", option_to_yojson nullable_boolean_to_yojson x.exported);
      ("RenewalEligibility", option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility);
      ("NotBefore", option_to_yojson t_stamp_to_yojson x.not_before);
      ("NotAfter", option_to_yojson t_stamp_to_yojson x.not_after);
      ("CreatedAt", option_to_yojson t_stamp_to_yojson x.created_at);
      ("IssuedAt", option_to_yojson t_stamp_to_yojson x.issued_at);
      ("ImportedAt", option_to_yojson t_stamp_to_yojson x.imported_at);
      ("RevokedAt", option_to_yojson t_stamp_to_yojson x.revoked_at);
      ("ManagedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
      ( "CertificateKeyPairOrigin",
        option_to_yojson certificate_key_pair_origin_to_yojson x.certificate_key_pair_origin );
    ]

let certificate_summary_list_to_yojson tree = list_to_yojson certificate_summary_to_yojson tree

let list_certificates_response_to_yojson (x : list_certificates_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CertificateSummaryList",
        option_to_yojson certificate_summary_list_to_yojson x.certificate_summary_list );
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let sort_by_to_yojson (x : sort_by) = match x with CREATED_AT -> `String "CREATED_AT"
let max_items_to_yojson = int_to_yojson
let key_algorithm_list_to_yojson tree = list_to_yojson key_algorithm_to_yojson tree
let key_usage_filter_list_to_yojson tree = list_to_yojson key_usage_name_to_yojson tree

let extended_key_usage_filter_list_to_yojson tree =
  list_to_yojson extended_key_usage_name_to_yojson tree

let filters_to_yojson (x : filters) =
  assoc_to_yojson
    [
      ( "extendedKeyUsage",
        option_to_yojson extended_key_usage_filter_list_to_yojson x.extended_key_usage );
      ("keyUsage", option_to_yojson key_usage_filter_list_to_yojson x.key_usage);
      ("keyTypes", option_to_yojson key_algorithm_list_to_yojson x.key_types);
      ("exportOption", option_to_yojson certificate_export_to_yojson x.export_option);
      ("managedBy", option_to_yojson certificate_managed_by_to_yojson x.managed_by);
    ]

let certificate_statuses_to_yojson tree = list_to_yojson certificate_status_to_yojson tree

let list_certificates_request_to_yojson (x : list_certificates_request) =
  assoc_to_yojson
    [
      ("CertificateStatuses", option_to_yojson certificate_statuses_to_yojson x.certificate_statuses);
      ( "CertificateKeyPairOrigins",
        option_to_yojson certificate_key_pair_origins_to_yojson x.certificate_key_pair_origins );
      ("Includes", option_to_yojson filters_to_yojson x.includes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxItems", option_to_yojson max_items_to_yojson x.max_items);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let list_acme_external_account_bindings_response_to_yojson
    (x : list_acme_external_account_bindings_response) =
  assoc_to_yojson
    [
      ( "ExternalAccountBindings",
        option_to_yojson acme_external_account_binding_list_to_yojson x.external_account_bindings );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_acme_external_account_bindings_request_to_yojson
    (x : list_acme_external_account_bindings_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
    ]

let list_acme_endpoints_response_to_yojson (x : list_acme_endpoints_response) =
  assoc_to_yojson
    [
      ("AcmeEndpoints", option_to_yojson acme_endpoint_list_to_yojson x.acme_endpoints);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_acme_endpoints_request_to_yojson (x : list_acme_endpoints_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_acme_domain_validations_response_to_yojson (x : list_acme_domain_validations_response) =
  assoc_to_yojson
    [
      ( "AcmeDomainValidations",
        option_to_yojson acme_domain_validation_list_to_yojson x.acme_domain_validations );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_acme_domain_validations_request_to_yojson (x : list_acme_domain_validations_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
    ]

let list_acme_accounts_response_to_yojson (x : list_acme_accounts_response) =
  assoc_to_yojson
    [
      ("AcmeAccounts", option_to_yojson acme_account_list_to_yojson x.acme_accounts);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_acme_accounts_request_to_yojson (x : list_acme_accounts_request) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
    ]

let import_certificate_response_to_yojson (x : import_certificate_response) =
  assoc_to_yojson [ ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn) ]

let private_key_blob_to_yojson = blob_to_yojson

let import_certificate_request_to_yojson (x : import_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateArn", option_to_yojson arn_to_yojson x.certificate_arn);
      ("Certificate", Some (certificate_body_blob_to_yojson x.certificate));
      ("PrivateKey", Some (private_key_blob_to_yojson x.private_key));
      ("CertificateChain", option_to_yojson certificate_chain_blob_to_yojson x.certificate_chain);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let get_certificate_response_to_yojson (x : get_certificate_response) =
  assoc_to_yojson
    [
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
    ]

let get_certificate_request_to_yojson (x : get_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

let mac_key_to_yojson = string_to_yojson

let get_acme_external_account_binding_credentials_response_to_yojson
    (x : get_acme_external_account_binding_credentials_response) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key_id);
      ("MacKey", option_to_yojson mac_key_to_yojson x.mac_key);
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

let private_key_to_yojson = string_to_yojson

let export_certificate_response_to_yojson (x : export_certificate_response) =
  assoc_to_yojson
    [
      ("Certificate", option_to_yojson certificate_body_to_yojson x.certificate);
      ("CertificateChain", option_to_yojson certificate_chain_to_yojson x.certificate_chain);
      ("PrivateKey", option_to_yojson private_key_to_yojson x.private_key);
    ]

let passphrase_blob_to_yojson = blob_to_yojson

let export_certificate_request_to_yojson (x : export_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_to_yojson x.certificate_arn));
      ("Passphrase", Some (passphrase_blob_to_yojson x.passphrase));
    ]

let describe_certificate_response_to_yojson (x : describe_certificate_response) =
  assoc_to_yojson [ ("Certificate", option_to_yojson certificate_detail_to_yojson x.certificate) ]

let describe_certificate_request_to_yojson (x : describe_certificate_request) =
  assoc_to_yojson [ ("CertificateArn", Some (arn_to_yojson x.certificate_arn)) ]

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

let describe_acme_endpoint_response_to_yojson (x : describe_acme_endpoint_response) =
  assoc_to_yojson [ ("AcmeEndpoint", option_to_yojson acme_endpoint_to_yojson x.acme_endpoint) ]

let describe_acme_endpoint_request_to_yojson (x : describe_acme_endpoint_request) =
  assoc_to_yojson [ ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn)) ]

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

let describe_acme_account_response_to_yojson (x : describe_acme_account_response) =
  assoc_to_yojson [ ("AcmeAccount", option_to_yojson acme_account_to_yojson x.acme_account) ]

let describe_acme_account_request_to_yojson (x : describe_acme_account_request) =
  assoc_to_yojson
    [
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ("AccountUrl", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_url));
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

let time_type_to_yojson (x : time_type) =
  match x with MINUTES -> `String "MINUTES" | HOURS -> `String "HOURS" | DAYS -> `String "DAYS"

let expiration_to_yojson (x : expiration) =
  assoc_to_yojson
    [
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.value));
      ("Type", Some (time_type_to_yojson x.type_));
    ]

let create_acme_external_account_binding_request_to_yojson
    (x : create_acme_external_account_binding_request) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Expiration", option_to_yojson expiration_to_yojson x.expiration);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_acme_endpoint_response_to_yojson (x : create_acme_endpoint_response) =
  assoc_to_yojson
    [ ("AcmeEndpointArn", option_to_yojson acme_endpoint_arn_to_yojson x.acme_endpoint_arn) ]

let create_acme_endpoint_request_to_yojson (x : create_acme_endpoint_request) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "AuthorizationBehavior",
        Some (acme_authorization_behavior_to_yojson x.authorization_behavior) );
      ("Contact", option_to_yojson acme_contact_to_yojson x.contact);
      ("CertificateAuthority", Some (certificate_authority_to_yojson x.certificate_authority));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CertificateTags", option_to_yojson tag_list_to_yojson x.certificate_tags);
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
      ( "IdempotencyToken",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AcmeEndpointArn", Some (acme_endpoint_arn_to_yojson x.acme_endpoint_arn));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("PrevalidationOptions", Some (prevalidation_options_to_yojson x.prevalidation_options));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
