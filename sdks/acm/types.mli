type nonrec string_ = string [@@ocaml.doc ""]

type nonrec domain_component_list = string_ list [@@ocaml.doc ""]

type nonrec custom_attribute = {
  value : string_ option;
      [@ocaml.doc "Specifies the attribute value of relative distinguished name (RDN).\n"]
  object_identifier : string_ option;
      [@ocaml.doc
        "Specifies the object identifier (OID) of the attribute type of the relative distinguished \
         name (RDN).\n"]
}
[@@ocaml.doc "Defines the X.500 relative distinguished name (RDN).\n"]

type nonrec custom_attribute_list = custom_attribute list [@@ocaml.doc ""]

type nonrec distinguished_name = {
  title : string_ option; [@ocaml.doc "The title attribute.\n"]
  surname : string_ option; [@ocaml.doc "The surname attribute.\n"]
  state : string_ option; [@ocaml.doc "The state or province (ST) attribute.\n"]
  serial_number : string_ option; [@ocaml.doc "The serial number attribute.\n"]
  pseudonym : string_ option; [@ocaml.doc "The pseudonym attribute.\n"]
  organizational_unit : string_ option; [@ocaml.doc "The organizational unit (OU) attribute.\n"]
  organization : string_ option; [@ocaml.doc "The organization (O) attribute.\n"]
  locality : string_ option; [@ocaml.doc "The locality (L) attribute.\n"]
  initials : string_ option; [@ocaml.doc "The initials attribute.\n"]
  given_name : string_ option; [@ocaml.doc "The given name attribute.\n"]
  generation_qualifier : string_ option; [@ocaml.doc "The generation qualifier attribute.\n"]
  distinguished_name_qualifier : string_ option;
      [@ocaml.doc "The distinguished name qualifier attribute.\n"]
  custom_attributes : custom_attribute_list option;
      [@ocaml.doc
        "A list of custom attributes in the distinguished name. Each custom attribute contains an \
         object identifier (OID) and its corresponding value.\n"]
  country : string_ option; [@ocaml.doc "The country (C) attribute.\n"]
  domain_components : domain_component_list option;
      [@ocaml.doc "The domain component attributes.\n"]
  common_name : string_ option; [@ocaml.doc "The common name (CN) attribute.\n"]
}
[@@ocaml.doc "Contains X.500 distinguished name information.\n"]

type nonrec other_name = {
  value : string_ option; [@ocaml.doc "Specifies an OID value.\n"]
  object_identifier : string_ option; [@ocaml.doc "Specifies an OID.\n"]
}
[@@ocaml.doc
  "Defines a custom ASN.1 X.400 [GeneralName] using an object identifier (OID) and value. For more \
   information, see NIST's definition of \
   {{:https://csrc.nist.gov/glossary/term/Object_Identifier}Object Identifier (OID)}.\n"]

type nonrec general_name =
  | UniformResourceIdentifier of string_ [@ocaml.doc "Represents [GeneralName] as a URI.\n"]
  | Rfc822Name of string_
      [@ocaml.doc
        "Represents [GeneralName] as an {{:https://datatracker.ietf.org/doc/html/rfc822}RFC 822} \
         email address.\n"]
  | RegisteredId of string_ [@ocaml.doc "Represents [GeneralName] as an object identifier (OID).\n"]
  | OtherName of other_name [@ocaml.doc "Represents [GeneralName] using an [OtherName] object.\n"]
  | IpAddress of string_ [@ocaml.doc "Represents [GeneralName] as an IPv4 or IPv6 address.\n"]
  | DnsName of string_ [@ocaml.doc "Represents [GeneralName] as a DNS name.\n"]
  | DirectoryName of distinguished_name
      [@ocaml.doc
        "Contains information about the certificate subject. The [Subject] field in the \
         certificate identifies the entity that owns or controls the public key in the \
         certificate. The entity can be a user, computer, device, or service. The [Subject] must \
         contain an X.500 distinguished name (DN). A DN is a sequence of relative distinguished \
         names (RDNs). The RDNs are separated by commas in the certificate.\n"]
[@@ocaml.doc
  "Describes an ASN.1 X.400 [GeneralName] as defined in \
   {{:https://datatracker.ietf.org/doc/html/rfc5280}RFC 5280}. Only one of the following naming \
   options should be provided.\n"]

type nonrec general_name_list = general_name list [@@ocaml.doc ""]

type nonrec extended_key_usage_name =
  | CUSTOM [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
  | ANY [@ocaml.doc ""]
  | IPSEC_USER [@ocaml.doc ""]
  | IPSEC_TUNNEL [@ocaml.doc ""]
  | IPSEC_END_SYSTEM [@ocaml.doc ""]
  | OCSP_SIGNING [@ocaml.doc ""]
  | TIME_STAMPING [@ocaml.doc ""]
  | EMAIL_PROTECTION [@ocaml.doc ""]
  | CODE_SIGNING [@ocaml.doc ""]
  | TLS_WEB_CLIENT_AUTHENTICATION [@ocaml.doc ""]
  | TLS_WEB_SERVER_AUTHENTICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec extended_key_usage_names = extended_key_usage_name list [@@ocaml.doc ""]

type nonrec key_algorithm =
  | EC_secp521r1 [@ocaml.doc ""]
  | EC_secp384r1 [@ocaml.doc ""]
  | EC_prime256v1 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""]
  | RSA_1024 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_usage_name =
  | CUSTOM [@ocaml.doc ""]
  | ANY [@ocaml.doc ""]
  | DECIPHER_ONLY [@ocaml.doc ""]
  | ENCHIPER_ONLY [@ocaml.doc ""]
  | CRL_SIGNING [@ocaml.doc ""]
  | CERTIFICATE_SIGNING [@ocaml.doc ""]
  | KEY_AGREEMENT [@ocaml.doc ""]
  | DATA_ENCIPHERMENT [@ocaml.doc ""]
  | KEY_ENCIPHERMENT [@ocaml.doc ""]
  | NON_REPUDATION [@ocaml.doc ""]
  | DIGITAL_SIGNATURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_usage_names = key_usage_name list [@@ocaml.doc ""]

type nonrec serial_number = string [@@ocaml.doc ""]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec x509_attributes = {
  not_before : t_stamp option; [@ocaml.doc "The time before which the certificate is not valid.\n"]
  not_after : t_stamp option; [@ocaml.doc "The time after which the certificate is not valid.\n"]
  serial_number : serial_number option;
      [@ocaml.doc "The serial number assigned by the certificate authority.\n"]
  key_usages : key_usage_names option;
      [@ocaml.doc
        "A list of Key Usage X.509 v3 extension objects. Each object is a string value that \
         identifies the purpose of the public key contained in the certificate. Possible extension \
         values include DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.\n"]
  key_algorithm : key_algorithm option;
      [@ocaml.doc "The algorithm that was used to generate the public-private key pair.\n"]
  extended_key_usages : extended_key_usage_names option;
      [@ocaml.doc
        "Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a \
         purpose for which the certificate public key can be used and consists of a name and an \
         object identifier (OID). \n"]
  subject_alternative_names : general_name_list option;
      [@ocaml.doc
        "One or more domain names (subject alternative names) included in the certificate. This \
         list contains the domain names that are bound to the public key that is contained in the \
         certificate. The subject alternative names include the canonical domain name (CN) of the \
         certificate and additional domain names that can be used to connect to the website. \n"]
  subject : distinguished_name option;
      [@ocaml.doc "The distinguished name of the certificate subject.\n"]
  issuer : distinguished_name option;
      [@ocaml.doc "The distinguished name of the certificate issuer.\n"]
}
[@@ocaml.doc "Contains X.509 certificate attributes extracted from the certificate.\n"]

type nonrec filter_string = string [@@ocaml.doc ""]

type nonrec comparison_operator = EQUALS [@ocaml.doc ""] | CONTAINS [@ocaml.doc ""]
[@@ocaml.doc
  "The comparison operator to use for string filters. Valid values are [CONTAINS] and [EQUALS].\n"]

type nonrec common_name_filter = {
  comparison_operator : comparison_operator; [@ocaml.doc "The comparison operator to use.\n"]
  value : filter_string; [@ocaml.doc "The value to match against.\n"]
}
[@@ocaml.doc "Filters certificates by common name.\n"]

type nonrec subject_filter =
  | CommonName of common_name_filter [@ocaml.doc "Filter by common name in the subject.\n"]
[@@ocaml.doc "Filters certificates by subject attributes.\n"]

type nonrec dns_name_filter = {
  comparison_operator : comparison_operator; [@ocaml.doc "The comparison operator to use.\n"]
  value : filter_string; [@ocaml.doc "The DNS name value to match against.\n"]
}
[@@ocaml.doc "Filters certificates by DNS name.\n"]

type nonrec subject_alternative_name_filter =
  | DnsName of dns_name_filter [@ocaml.doc "Filter by DNS name in subject alternative names.\n"]
[@@ocaml.doc "Filters certificates by subject alternative name attributes.\n"]

type nonrec timestamp_range = {
  end_ : t_stamp option; [@ocaml.doc "The end of the time range. This value is inclusive.\n"]
  start : t_stamp option; [@ocaml.doc "The start of the time range. This value is inclusive.\n"]
}
[@@ocaml.doc "Specifies a time range for filtering certificates.\n"]

type nonrec x509_attribute_filter =
  | NotBefore of timestamp_range
      [@ocaml.doc "Filter by certificate validity start date. The start date is inclusive.\n"]
  | NotAfter of timestamp_range
      [@ocaml.doc "Filter by certificate expiration date. The start date is inclusive.\n"]
  | SerialNumber of serial_number [@ocaml.doc "Filter by serial number.\n"]
  | KeyAlgorithm of key_algorithm [@ocaml.doc "Filter by key algorithm.\n"]
  | KeyUsage of key_usage_name [@ocaml.doc "Filter by key usage.\n"]
  | ExtendedKeyUsage of extended_key_usage_name [@ocaml.doc "Filter by extended key usage.\n"]
  | SubjectAlternativeName of subject_alternative_name_filter
      [@ocaml.doc "Filter by subject alternative names.\n"]
  | Subject of subject_filter [@ocaml.doc "Filter by certificate subject.\n"]
[@@ocaml.doc "Filters certificates by X.509 attributes.\n"]

type nonrec validation_method = HTTP [@ocaml.doc ""] | DNS [@ocaml.doc ""] | EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : validation_exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The supplied input failed to satisfy constraints of an Amazon Web Services service.\n"]

type nonrec validation_email_list = string_ list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec certificate_transparency_logging_preference =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_export = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_options = {
  export_ : certificate_export option;
      [@ocaml.doc
        "You can opt in to allow the export of your certificates by specifying [ENABLED]. You \
         cannot update the value of [Export] after the the certificate is created.\n"]
  certificate_transparency_logging_preference : certificate_transparency_logging_preference option;
      [@ocaml.doc
        "This parameter has been deprecated. Certificate transparency logging opt-out is no longer \
         available. All public certificates are recorded in a certificate transparency log.\n"]
}
[@@ocaml.doc
  "Structure that contains options for your certificate. You can use this structure to specify \
   whether to export your certificate.\n\n\
  \ Certificate transparency logging opt-out is no longer available. All public certificates are \
   recorded in a certificate transparency log. For general information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency}Certificate \
   Transparency Logging}.\n\
  \ \n\
  \  You can export public ACM certificates to use with Amazon Web Services services as well as \
   outside Amazon Web Services Cloud. For more information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html}Certificate \
   Manager exportable public certificate}.\n\
  \  "]

type nonrec update_certificate_options_request = {
  options : certificate_options;
      [@ocaml.doc
        "Use to update the options for your certificate. Currently, you can specify whether to \
         export your certificate. Certificate transparency logging opt-out is no longer available. \
         All public certificates are recorded in a certificate transparency log. For more \
         information, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency}Certificate \
         Transparency Logging}.\n"]
  certificate_arn : arn;
      [@ocaml.doc
        "ARN of the requested certificate to update. This must be of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm:us-east-1:{i account}:certificate/{i 12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified certificate cannot be found in the caller's account or the caller's account \
   cannot be found.\n"]

type nonrec limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "An ACM quota has been exceeded.\n"]

type nonrec invalid_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Processing has reached an invalid state.\n"]

type nonrec invalid_arn_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The requested Amazon Resource Name (ARN) does not refer to an existing resource.\n"]

type nonrec acme_endpoint_arn = string [@@ocaml.doc ""]

type nonrec acme_authorization_behavior = PRE_APPROVED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec acme_contact = NOT_REQUIRED [@ocaml.doc ""] | REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec public_key_algorithm =
  | EC_SECP384_R1 [@ocaml.doc ""]
  | EC_PRIME256_V1 [@ocaml.doc ""]
  | RSA_2048 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec public_key_algorithm_list = public_key_algorithm list [@@ocaml.doc ""]

type nonrec public_certificate_authority = {
  allowed_key_algorithms : public_key_algorithm_list option;
      [@ocaml.doc
        "The key algorithms allowed for certificates issued by this certificate authority.\n"]
}
[@@ocaml.doc "Configuration for a public certificate authority.\n"]

type nonrec certificate_authority =
  | PublicCertificateAuthority of public_certificate_authority
      [@ocaml.doc "Configuration for using a public certificate authority.\n"]
[@@ocaml.doc "Defines the certificate authority to use for an ACME endpoint.\n"]

type nonrec update_acme_endpoint_request = {
  certificate_authority : certificate_authority option;
      [@ocaml.doc "The updated certificate authority configuration.\n"]
  contact : acme_contact option; [@ocaml.doc "The updated contact requirement.\n"]
  authorization_behavior : acme_authorization_behavior option;
      [@ocaml.doc "The updated authorization behavior.\n"]
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint to update.\n"]
}
[@@ocaml.doc ""]

type nonrec availability_error_message = string [@@ocaml.doc ""]

type nonrec coral_availability_throttling_reason = string [@@ocaml.doc ""]

type nonrec coral_availability_throttled_resource = string [@@ocaml.doc ""]

type nonrec throttling_reason = {
  resource : coral_availability_throttled_resource option;
      [@ocaml.doc "The resource that causes the request to be throttled.\n"]
  reason : coral_availability_throttling_reason option;
      [@ocaml.doc "A description of why a request was throttled.\n"]
}
[@@ocaml.doc "A description of why a request was throttled.\n"]

type nonrec throttling_reason_list = throttling_reason list [@@ocaml.doc ""]

type nonrec throttling_exception = {
  throttling_reasons : throttling_reason_list option;
      [@ocaml.doc "One or more reasons why the request was throttled.\n"]
  message : availability_error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied because it exceeded a quota.\n"]

type nonrec internal_server_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception, or failure.\n"]

type nonrec conflict_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "You are trying to update a resource or configuration that is already being created or updated. \
   Wait for the previous operation to finish and try again.\n"]

type nonrec service_error_message = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : service_error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have access required to perform this action.\n"]

type nonrec acme_domain_validation_arn = string [@@ocaml.doc ""]

type nonrec domain_scope_option = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec domain_scope = {
  wildcards : domain_scope_option option;
      [@ocaml.doc "Whether validation applies to wildcard domains.\n"]
  subdomains : domain_scope_option option;
      [@ocaml.doc "Whether validation applies to subdomains.\n"]
  exact_domain : domain_scope_option option;
      [@ocaml.doc "Whether validation applies to the exact domain.\n"]
}
[@@ocaml.doc "Specifies the scope of domain validation.\n"]

type nonrec hosted_zone_id = string [@@ocaml.doc ""]

type nonrec dns_prevalidation_options = {
  hosted_zone_id : hosted_zone_id option;
      [@ocaml.doc "The Route 53 hosted zone ID for DNS validation.\n"]
  domain_scope : domain_scope option;
      [@ocaml.doc "The scope of domains covered by this prevalidation.\n"]
}
[@@ocaml.doc "DNS prevalidation options for domain validation.\n"]

type nonrec prevalidation_options =
  | DnsPrevalidation of dns_prevalidation_options [@ocaml.doc "DNS-based prevalidation options.\n"]
[@@ocaml.doc "Specifies prevalidation options for domain validation.\n"]

type nonrec update_acme_domain_validation_request = {
  prevalidation_options : prevalidation_options option;
      [@ocaml.doc "The updated prevalidation options.\n"]
  acme_domain_validation_arn : acme_domain_validation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME domain validation to update.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The key of each tag to remove.\n"]
  resource_arn : arn;
      [@ocaml.doc "The ARN of the ACM resource from which the tag is to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The request contains too many tags. Try the request again with fewer tags.\n"]

type nonrec time_type = DAYS [@ocaml.doc ""] | HOURS [@ocaml.doc ""] | MINUTES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "The value of the tag.\n"]
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
}
[@@ocaml.doc "A key-value pair that identifies or specifies metadata about an ACM resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "The key-value pair that defines the tag to apply.\n"]
  resource_arn : arn; [@ocaml.doc "The ARN of the ACM resource to which the tag is to be applied.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "A service quota has been exceeded.\n"]

type nonrec tag_policy_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "A specified tag did not comply with an existing tag policy and was rejected.\n"]

type nonrec sort_order = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_by = CREATED_AT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec search_max_results = int [@@ocaml.doc ""]

type nonrec search_certificates_sort_order =
  | DESCENDING [@ocaml.doc ""]
  | ASCENDING [@ocaml.doc ""]
[@@ocaml.doc "The order to sort search results.\n"]

type nonrec search_certificates_sort_by =
  | CERTIFICATE_KEY_PAIR_ORIGIN [@ocaml.doc ""]
  | ACME_ACCOUNT_ID [@ocaml.doc ""]
  | ACME_ENDPOINT_ARN [@ocaml.doc ""]
  | IMPORTED_AT [@ocaml.doc ""]
  | VALIDATION_METHOD [@ocaml.doc ""]
  | EXPORT_OPTION [@ocaml.doc ""]
  | MANAGED_BY [@ocaml.doc ""]
  | ISSUED_AT [@ocaml.doc ""]
  | RENEWAL_ELIGIBILITY [@ocaml.doc ""]
  | REVOKED_AT [@ocaml.doc ""]
  | COMMON_NAME [@ocaml.doc ""]
  | CERTIFICATE_ARN [@ocaml.doc ""]
  | TYPE [@ocaml.doc ""]
  | KEY_ALGORITHM [@ocaml.doc ""]
  | NOT_BEFORE [@ocaml.doc ""]
  | IN_USE [@ocaml.doc ""]
  | EXPORTED [@ocaml.doc ""]
  | RENEWAL_STATUS [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NOT_AFTER [@ocaml.doc ""]
  | CREATED_AT [@ocaml.doc ""]
[@@ocaml.doc "The field to sort search results by.\n"]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec renewal_eligibility = INELIGIBLE [@ocaml.doc ""] | ELIGIBLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_status =
  | FAILED [@ocaml.doc ""]
  | REVOKED [@ocaml.doc ""]
  | VALIDATION_TIMED_OUT [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ISSUED [@ocaml.doc ""]
  | PENDING_VALIDATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec renewal_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | PENDING_VALIDATION [@ocaml.doc ""]
  | PENDING_AUTO_RENEWAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_type =
  | PRIVATE [@ocaml.doc ""]
  | AMAZON_ISSUED [@ocaml.doc ""]
  | IMPORTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_managed_by = CLOUDFRONT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec certificate_key_pair_origin =
  | CUSTOMER_PROVIDED [@ocaml.doc ""]
  | ACME [@ocaml.doc ""]
  | AWS_MANAGED [@ocaml.doc ""]
[@@ocaml.doc "The origin of the certificate's key pair.\n"]

type nonrec acme_account_id = string [@@ocaml.doc ""]

type nonrec acm_certificate_metadata = {
  acme_account_id : acme_account_id option;
      [@ocaml.doc "The ACME account identifier associated with the certificate.\n"]
  acme_endpoint_arn : arn option;
      [@ocaml.doc "The ARN of the ACME endpoint used to issue the certificate.\n"]
  certificate_key_pair_origin : certificate_key_pair_origin option;
      [@ocaml.doc "The origin of the certificate's key pair.\n"]
  validation_method : validation_method option;
      [@ocaml.doc "Specifies the domain validation method.\n"]
  managed_by : certificate_managed_by option;
      [@ocaml.doc
        "Identifies the Amazon Web Services service that manages the certificate issued by ACM.\n"]
  export_option : certificate_export option;
      [@ocaml.doc "Indicates whether the certificate can be exported.\n"]
  type_ : certificate_type option;
      [@ocaml.doc
        "The source of the certificate. For certificates provided by ACM, this value is \
         [AMAZON_ISSUED]. For certificates that you imported with [ImportCertificate], this value \
         is [IMPORTED]. ACM does not provide \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for \
         imported certificates. For more information about the differences between certificates \
         that you import and those that ACM provides, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
         Certificates} in the {i Certificate Manager User Guide}. \n"]
  renewal_status : renewal_status option; [@ocaml.doc "The renewal status of the certificate.\n"]
  status : certificate_status option;
      [@ocaml.doc
        "The status of the certificate.\n\n\
        \ A certificate enters status PENDING_VALIDATION upon being requested, unless it fails for \
         any of the reasons given in the troubleshooting topic \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html}Certificate \
         request fails}. ACM makes repeated attempts to validate a certificate for 72 hours and \
         then times out. If a certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the \
         request, correct the issue with \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html}DNS validation} \
         or {{:https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html}Email \
         validation}, and try again. If validation succeeds, the certificate enters status ISSUED. \n\
        \ "]
  revoked_at : t_stamp option;
      [@ocaml.doc
        "The time at which the certificate was revoked. This value exists only when the \
         certificate status is [REVOKED]. \n"]
  renewal_eligibility : renewal_eligibility option;
      [@ocaml.doc
        "Specifies whether the certificate is eligible for renewal. At this time, only exported \
         private certificates can be renewed with the [RenewCertificate] command.\n"]
  issued_at : t_stamp option;
      [@ocaml.doc
        "The time at which the certificate was issued. This value exists only when the certificate \
         type is [AMAZON_ISSUED]. \n"]
  in_use : nullable_boolean option;
      [@ocaml.doc
        "Indicates whether the certificate is currently in use by an Amazon Web Services service.\n"]
  imported_at : t_stamp option;
      [@ocaml.doc
        "The date and time when the certificate was imported. This value exists only when the \
         certificate type is [IMPORTED]. \n"]
  exported : nullable_boolean option;
      [@ocaml.doc "Indicates whether the certificate has been exported.\n"]
  created_at : t_stamp option; [@ocaml.doc "The time at which the certificate was requested.\n"]
}
[@@ocaml.doc "Contains ACM-specific metadata about a certificate.\n"]

type nonrec certificate_metadata =
  | AcmCertificateMetadata of acm_certificate_metadata
      [@ocaml.doc "Metadata for an ACM certificate.\n"]
[@@ocaml.doc
  "Contains metadata about a certificate. Currently supports ACM certificate metadata.\n"]

type nonrec certificate_search_result = {
  certificate_metadata : certificate_metadata option;
      [@ocaml.doc "ACM-specific metadata about the certificate.\n"]
  x509_attributes : x509_attributes option;
      [@ocaml.doc "X.509 certificate attributes such as subject, issuer, and validity period.\n"]
  certificate_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate.\n"]
}
[@@ocaml.doc
  "Contains information about a certificate returned by the [SearchCertificates] action. This \
   structure includes the certificate ARN, X.509 attributes, and ACM metadata.\n"]

type nonrec certificate_search_result_list = certificate_search_result list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec search_certificates_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When the list is truncated, this value is present and contains the value to use for the \
         [NextToken] parameter in a subsequent pagination request.\n"]
  results : certificate_search_result_list option;
      [@ocaml.doc
        "A list of certificate search results containing certificate ARNs, X.509 attributes, and \
         ACM metadata.\n"]
}
[@@ocaml.doc ""]

type nonrec acm_certificate_metadata_filter =
  | AcmeAccountId of acme_account_id [@ocaml.doc "Filter by ACME account identifier.\n"]
  | AcmeEndpointArn of arn [@ocaml.doc "Filter by ACME endpoint ARN.\n"]
  | CertificateKeyPairOrigin of certificate_key_pair_origin
      [@ocaml.doc "Filter by certificate key pair origin.\n"]
  | ValidationMethod of validation_method [@ocaml.doc "Filter by validation method.\n"]
  | ManagedBy of certificate_managed_by
      [@ocaml.doc "Filter by the entity that manages the certificate.\n"]
  | ExportOption of certificate_export [@ocaml.doc "Filter by certificate export option.\n"]
  | Exported of nullable_boolean
      [@ocaml.doc "Filter by whether the certificate has been exported.\n"]
  | InUse of nullable_boolean [@ocaml.doc "Filter by whether the certificate is in use.\n"]
  | Type of certificate_type [@ocaml.doc "Filter by certificate type.\n"]
  | RenewalStatus of renewal_status [@ocaml.doc "Filter by certificate renewal status.\n"]
  | Status of certificate_status [@ocaml.doc "Filter by certificate status.\n"]
[@@ocaml.doc "Filters certificates by ACM metadata.\n"]

type nonrec certificate_filter =
  | AcmCertificateMetadataFilter of acm_certificate_metadata_filter
      [@ocaml.doc "Filter by ACM certificate metadata.\n"]
  | X509AttributeFilter of x509_attribute_filter
      [@ocaml.doc "Filter by X.509 certificate attributes.\n"]
  | CertificateArn of arn [@ocaml.doc "Filter by certificate ARN.\n"]
[@@ocaml.doc
  "Defines a filter for searching certificates by ARN, X.509 attributes, or ACM metadata.\n"]

type certificate_filter_statement =
  | Filter of certificate_filter [@ocaml.doc "A single certificate filter.\n"]
  | Not of certificate_filter_statement [@ocaml.doc "A filter statement that must not be true.\n"]
  | Or of certificate_filter_statement_list
      [@ocaml.doc "A list of filter statements where at least one must be true.\n"]
  | And of certificate_filter_statement_list
      [@ocaml.doc "A list of filter statements that must all be true.\n"]
[@@ocaml.doc
  "A filter statement used to search for certificates. Can contain AND, OR, NOT logical operators \
   or a single filter.\n"]

and certificate_filter_statement_list = certificate_filter_statement list [@@ocaml.doc ""]

type nonrec search_certificates_request = {
  sort_order : search_certificates_sort_order option;
      [@ocaml.doc
        "Specifies the order of sorted results. Valid values are ASCENDING or DESCENDING.\n"]
  sort_by : search_certificates_sort_by option;
      [@ocaml.doc
        "Specifies the field to sort results by. Valid values are CREATED_AT, NOT_AFTER, STATUS, \
         RENEWAL_STATUS, EXPORTED, IN_USE, NOT_BEFORE, KEY_ALGORITHM, TYPE, CERTIFICATE_ARN, \
         COMMON_NAME, REVOKED_AT, RENEWAL_ELIGIBILITY, ISSUED_AT, MANAGED_BY, EXPORT_OPTION, \
         VALIDATION_METHOD, and IMPORTED_AT.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only in a subsequent request after \
         you receive a response with truncated results. Set it to the value of [NextToken] from \
         the response you just received.\n"]
  max_results : search_max_results option;
      [@ocaml.doc "The maximum number of results to return in the response. Default is 100.\n"]
  filter_statement : certificate_filter_statement option;
      [@ocaml.doc
        "A filter statement that defines the search criteria. You can combine multiple filters \
         using AND, OR, and NOT logical operators to create complex queries.\n"]
}
[@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec revoke_certificate_response = {
  certificate_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the public or private certificate that was revoked.\n"]
}
[@@ocaml.doc ""]

type nonrec revocation_reason =
  | A_A_COMPROMISE [@ocaml.doc ""]
  | PRIVILEGE_WITHDRAWN [@ocaml.doc ""]
  | REMOVE_FROM_CRL [@ocaml.doc ""]
  | CERTIFICATE_HOLD [@ocaml.doc ""]
  | CESSATION_OF_OPERATION [@ocaml.doc ""]
  | SUPERSEDED [@ocaml.doc ""]
  | SUPERCEDED [@ocaml.doc ""]
  | AFFILIATION_CHANGED [@ocaml.doc ""]
  | CA_COMPROMISE [@ocaml.doc ""]
  | KEY_COMPROMISE [@ocaml.doc ""]
  | UNSPECIFIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec revoke_certificate_request = {
  revocation_reason : revocation_reason; [@ocaml.doc "Specifies why you revoked the certificate.\n"]
  certificate_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the public or private certificate that will be revoked. \
         The ARN must have the following form: \n\n\
        \  [arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The certificate is in use by another Amazon Web Services service in the caller's account. \
   Remove the association and try again.\n"]

type nonrec acme_external_account_binding_arn = string [@@ocaml.doc ""]

type nonrec revoke_acme_external_account_binding_request = {
  acme_external_account_binding_arn : acme_external_account_binding_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ACME external account binding to revoke.\n"]
}
[@@ocaml.doc ""]

type nonrec revoke_acme_account_request = {
  account_url : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The URL of the ACME account to revoke.\n"]
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec record_type = CNAME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resource_record = {
  value : string_;
      [@ocaml.doc
        "The value of the CNAME record to add to your DNS database. This is supplied by ACM.\n"]
  type_ : record_type; [@ocaml.doc "The type of DNS record. Currently this can be [CNAME].\n"]
  name : string_;
      [@ocaml.doc "The name of the DNS record to create in your domain. This is supplied by ACM.\n"]
}
[@@ocaml.doc
  "Contains a DNS record value that you can use to validate ownership or control of a domain. This \
   is used by the [DescribeCertificate] action. \n"]

type nonrec domain_name_string = string [@@ocaml.doc ""]

type nonrec resend_validation_email_request = {
  validation_domain : domain_name_string;
      [@ocaml.doc
        "The base validation domain that will act as the suffix of the email addresses that are \
         used to send the emails. This must be the same as the [Domain] value or a superdomain of \
         the [Domain] value. For example, if you requested a certificate for \
         [site.subdomain.example.com] and specify a {b ValidationDomain} of \
         [subdomain.example.com], ACM sends email to the the following five addresses:\n\n\
        \ {ul\n\
        \       {-  admin\\@subdomain.example.com\n\
        \           \n\
        \            }\n\
        \       {-  administrator\\@subdomain.example.com\n\
        \           \n\
        \            }\n\
        \       {-  hostmaster\\@subdomain.example.com\n\
        \           \n\
        \            }\n\
        \       {-  postmaster\\@subdomain.example.com\n\
        \           \n\
        \            }\n\
        \       {-  webmaster\\@subdomain.example.com\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  domain : domain_name_string;
      [@ocaml.doc
        "The fully qualified domain name (FQDN) of the certificate that needs to be validated.\n"]
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains the ARN of the requested certificate. The certificate ARN is \
         generated and returned by the [RequestCertificate] action as soon as the request is made. \
         By default, using this parameter causes email to be sent to all top-level domains you \
         specified in the certificate request. The ARN must be of the form: \n\n\
        \  [arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_domain_validation_options_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "One or more values in the [DomainValidationOption] structure is incorrect.\n"]

type nonrec request_in_progress_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The certificate request is in process and the certificate in your account has not yet been \
   issued.\n"]

type nonrec request_certificate_response = {
  certificate_arn : arn option;
      [@ocaml.doc
        "String that contains the ARN of the issued certificate. This must be of the form:\n\n\
        \  [arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec domain_list = domain_name_string list [@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec domain_validation_option = {
  validation_domain : domain_name_string;
      [@ocaml.doc
        "The domain name that you want ACM to use to send you validation emails. This domain name \
         is the suffix of the email addresses that you want ACM to use. This must be the same as \
         the [DomainName] value or a superdomain of the [DomainName] value. For example, if you \
         request a certificate for [testing.example.com], you can specify [example.com] for this \
         value. In that case, ACM sends domain validation emails to the following five addresses:\n\n\
        \ {ul\n\
        \       {-  admin\\@example.com\n\
        \           \n\
        \            }\n\
        \       {-  administrator\\@example.com\n\
        \           \n\
        \            }\n\
        \       {-  hostmaster\\@example.com\n\
        \           \n\
        \            }\n\
        \       {-  postmaster\\@example.com\n\
        \           \n\
        \            }\n\
        \       {-  webmaster\\@example.com\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  domain_name : domain_name_string;
      [@ocaml.doc "A fully qualified domain name (FQDN) in the certificate request.\n"]
}
[@@ocaml.doc
  "Contains information about the domain names that you want ACM to use to send you emails that \
   enable you to validate domain ownership.\n"]

type nonrec domain_validation_option_list = domain_validation_option list [@@ocaml.doc ""]

type nonrec pca_arn = string [@@ocaml.doc ""]

type nonrec request_certificate_request = {
  managed_by : certificate_managed_by option;
      [@ocaml.doc
        "Identifies the Amazon Web Services service that manages the certificate issued by ACM.\n"]
  key_algorithm : key_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm of the public and private key pair that your certificate uses to \
         encrypt data. RSA is the default key algorithm for ACM certificates. Elliptic Curve \
         Digital Signature Algorithm (ECDSA) keys are smaller, offering security comparable to RSA \
         keys but with greater computing efficiency. However, ECDSA is not supported by all \
         network clients. Some Amazon Web Services services may require RSA keys, or only support \
         ECDSA keys of a particular size, while others allow the use of either RSA and ECDSA keys \
         to ensure that compatibility is not broken. Check the requirements for the Amazon Web \
         Services service where you plan to deploy your certificate. For more information about \
         selecting an algorithm, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-certificate-characteristics.html#algorithms-term}Key \
         algorithms}.\n\n\
        \  Algorithms supported for an ACM certificate request include: \n\
        \  \n\
        \   {ul\n\
        \         {-   [RSA_2048] \n\
        \             \n\
        \              }\n\
        \         {-   [EC_prime256v1] \n\
        \             \n\
        \              }\n\
        \         {-   [EC_secp384r1] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   Other listed algorithms are for imported certificates only. \n\
        \   \n\
        \      When you request a private PKI certificate signed by a CA from Amazon Web Services \
         Private CA, the specified signing algorithm family (RSA or ECDSA) must match the \
         algorithm family of the CA's secret key.\n\
        \      \n\
        \        Default: RSA_2048\n\
        \        "]
  tags : tag_list option;
      [@ocaml.doc "One or more resource tags to associate with the certificate.\n"]
  certificate_authority_arn : pca_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the private certificate authority (CA) that will be \
         used to issue the certificate. If you do not provide an ARN and you are trying to request \
         a private certificate, ACM will attempt to issue a public certificate. For more \
         information about private CAs, see the \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html}Amazon Web \
         Services Private Certificate Authority} user guide. The ARN must have the following form: \
         \n\n\
        \  \
         [arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012] \n\
        \ "]
  options : certificate_options option;
      [@ocaml.doc
        "You can use this parameter to specify whether to export your certificate.\n\n\
        \ Certificate transparency logging opt-out is no longer available. All public certificates \
         are recorded in a certificate transparency log. For more information, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency}Certificate \
         Transparency Logging}.\n\
        \ \n\
        \  You can export public ACM certificates to use with Amazon Web Services services as well \
         as outside the Amazon Web Services Cloud. For more information, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html}Certificate \
         Manager exportable public certificate}.\n\
        \  "]
  domain_validation_options : domain_validation_option_list option;
      [@ocaml.doc
        "The domain name that you want ACM to use to send you emails so that you can validate \
         domain ownership.\n"]
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "Customer chosen string that can be used to distinguish between calls to \
         [RequestCertificate]. Idempotency tokens time out after one hour. Therefore, if you call \
         [RequestCertificate] multiple times with the same idempotency token within one hour, ACM \
         recognizes that you are requesting only one certificate and will issue only one. If you \
         change the idempotency token for each call, ACM recognizes that you are requesting \
         multiple certificates.\n"]
  subject_alternative_names : domain_list option;
      [@ocaml.doc
        "Additional FQDNs to be included in the Subject Alternative Name extension of the ACM \
         certificate. For example, add the name www.example.net to a certificate for which the \
         [DomainName] field is www.example.com if users can reach your site by using either name. \
         The maximum number of domain names that you can add to an ACM certificate is 100. \
         However, the initial quota is 10 domain names. If you need more than 10 names, you must \
         request a quota increase. For more information, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html}Quotas}.\n\n\
        \  The maximum length of a SAN DNS name is 253 octets. The name is made up of multiple \
         labels separated by periods. No label can be longer than 63 octets. Consider the \
         following examples: \n\
        \ \n\
        \  {ul\n\
        \        {-   [(63 octets).(63 octets).(63 octets).(61 octets)] is legal because the total \
         length is 253 octets (63+1+63+1+63+1+61) and no label exceeds 63 octets.\n\
        \            \n\
        \             }\n\
        \        {-   [(64 octets).(63 octets).(63 octets).(61 octets)] is not legal because the \
         total length exceeds 253 octets (64+1+63+1+63+1+61) and the first label exceeds 63 octets.\n\
        \            \n\
        \             }\n\
        \        {-   [(63 octets).(63 octets).(63 octets).(62 octets)] is not legal because the \
         total length of the DNS name (63+1+63+1+63+1+62) exceeds 253 octets.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  validation_method : validation_method option;
      [@ocaml.doc
        "The method you want to use if you are requesting a public certificate to validate that \
         you own or control domain. You can \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}validate \
         with DNS} or \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html}validate \
         with email}. We recommend that you use DNS validation. \n"]
  domain_name : domain_name_string;
      [@ocaml.doc
        "Fully qualified domain name (FQDN), such as www.example.com, that you want to secure with \
         an ACM certificate. Use an asterisk (*) to create a wildcard certificate that protects \
         several sites in the same domain. For example, *.example.com protects www.example.com, \
         site.example.com, and images.example.com. \n\n\
        \ In compliance with {{:https://datatracker.ietf.org/doc/html/rfc5280}RFC 5280}, the \
         length of the domain name (technically, the Common Name) that you provide cannot exceed \
         64 octets (characters), including periods. To add a longer domain name, specify it in the \
         Subject Alternative Name field, which supports names up to 253 octets in length. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_tag_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "One or both of the values that make up the key-value pair is not valid. For example, you cannot \
   specify a tag value that begins with [aws:].\n"]

type nonrec invalid_parameter_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "An input parameter was invalid.\n"]

type nonrec domain_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | PENDING_VALIDATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec http_redirect = {
  redirect_to : string_ option;
      [@ocaml.doc
        "The URL hosting the validation token. [RedirectFrom] must return this content or redirect \
         here.\n"]
  redirect_from : string_ option;
      [@ocaml.doc
        "The URL including the domain to be validated. The certificate authority sends [GET] \
         requests here during validation.\n"]
}
[@@ocaml.doc
  "Contains information for HTTP-based domain validation of certificates requested through Amazon \
   CloudFront and issued by ACM. This field exists only when the certificate type is \
   [AMAZON_ISSUED] and the validation method is [HTTP].\n"]

type nonrec domain_validation = {
  validation_method : validation_method option;
      [@ocaml.doc "Specifies the domain validation method.\n"]
  http_redirect : http_redirect option;
      [@ocaml.doc
        "Contains information for HTTP-based domain validation of certificates requested through \
         Amazon CloudFront and issued by ACM. This field exists only when the certificate type is \
         [AMAZON_ISSUED] and the validation method is [HTTP].\n"]
  resource_record : resource_record option;
      [@ocaml.doc
        "Contains the CNAME record that you add to your DNS database for domain validation. For \
         more information, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}Use DNS to \
         Validate Domain Ownership}.\n\n\
        \  The CNAME information that you need does not include the name of your domain. If you \
         include your domain name in the DNS database CNAME record, validation fails. For example, \
         if the name is [_a79865eb4cd1a6ab990a45779b4e0b96.yourdomain.com], only \
         [_a79865eb4cd1a6ab990a45779b4e0b96] must be used.\n\
        \  \n\
        \   "]
  validation_status : domain_status option;
      [@ocaml.doc
        "The validation status of the domain name. This can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [PENDING_VALIDATION] \n\
        \           \n\
        \            }\n\
        \       {-   [SUCCESS]\n\
        \           \n\
        \           [ ]}\n\
        \      \n\
        \      {[\n\
        \       {-   [FAILED]\n\
        \           \n\
        \           [ ]}\n\
        \      [ ]\n\
        \      ]}\n\
        \      }\n\
        \  "]
  validation_domain : domain_name_string option;
      [@ocaml.doc "The domain name that ACM used to send domain validation emails.\n"]
  validation_emails : validation_email_list option;
      [@ocaml.doc "A list of email addresses that ACM used to send domain validation emails.\n"]
  domain_name : domain_name_string;
      [@ocaml.doc
        "A fully qualified domain name (FQDN) in the certificate. For example, [www.example.com] \
         or [example.com]. \n"]
}
[@@ocaml.doc "Contains information about the validation of each domain name in the certificate.\n"]

type nonrec domain_validation_list = domain_validation list [@@ocaml.doc ""]

type nonrec failure_reason =
  | OTHER [@ocaml.doc ""]
  | SLR_NOT_FOUND [@ocaml.doc ""]
  | PCA_ACCESS_DENIED [@ocaml.doc ""]
  | PCA_INVALID_DURATION [@ocaml.doc ""]
  | PCA_INVALID_ARGS [@ocaml.doc ""]
  | PCA_RESOURCE_NOT_FOUND [@ocaml.doc ""]
  | PCA_NAME_CONSTRAINTS_VALIDATION [@ocaml.doc ""]
  | PCA_REQUEST_FAILED [@ocaml.doc ""]
  | PCA_INVALID_STATE [@ocaml.doc ""]
  | PCA_INVALID_ARN [@ocaml.doc ""]
  | PCA_LIMIT_EXCEEDED [@ocaml.doc ""]
  | CAA_ERROR [@ocaml.doc ""]
  | DOMAIN_VALIDATION_DENIED [@ocaml.doc ""]
  | INVALID_PUBLIC_DOMAIN [@ocaml.doc ""]
  | DOMAIN_NOT_ALLOWED [@ocaml.doc ""]
  | ADDITIONAL_VERIFICATION_REQUIRED [@ocaml.doc ""]
  | NO_AVAILABLE_CONTACTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec renewal_summary = {
  updated_at : t_stamp; [@ocaml.doc "The time at which the renewal summary was last updated.\n"]
  renewal_status_reason : failure_reason option;
      [@ocaml.doc "The reason that a renewal request was unsuccessful.\n"]
  domain_validation_options : domain_validation_list;
      [@ocaml.doc
        "Contains information about the validation of each domain name in the certificate, as it \
         pertains to ACM's \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal}. \
         This is different from the initial validation that occurs as a result of the \
         [RequestCertificate] request. This field exists only when the certificate type is \
         [AMAZON_ISSUED].\n"]
  renewal_status : renewal_status;
      [@ocaml.doc
        "The status of ACM's \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} of \
         the certificate.\n"]
}
[@@ocaml.doc
  "Contains information about the status of ACM's \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for the \
   certificate. This structure exists only when the certificate type is [AMAZON_ISSUED].\n"]

type nonrec renew_certificate_request = {
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains the ARN of the ACM certificate to be renewed. This must be of the \
         form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec remove_tags_from_certificate_request = {
  tags : tag_list; [@ocaml.doc "The key-value pair that defines the tag to remove.\n"]
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains the ARN of the ACM Certificate with one or more tags that you want \
         to remove. This must be of the form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec positive_integer = int [@@ocaml.doc ""]

type nonrec expiry_events_configuration = {
  days_before_expiry : positive_integer option;
      [@ocaml.doc
        "Specifies the number of days prior to certificate expiration when ACM starts generating \
         [EventBridge] events. ACM sends one event per day per certificate until the certificate \
         expires. By default, accounts receive events starting 45 days before certificate \
         expiration.\n"]
}
[@@ocaml.doc
  "Object containing expiration events options associated with an Amazon Web Services account.\n"]

type nonrec put_account_configuration_request = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "Customer-chosen string used to distinguish between calls to [PutAccountConfiguration]. \
         Idempotency tokens time out after one hour. If you call [PutAccountConfiguration] \
         multiple times with the same unexpired idempotency token, ACM treats it as the same \
         request and returns the original result. If you change the idempotency token for each \
         call, ACM treats each call as a new request.\n"]
  expiry_events : expiry_events_configuration option;
      [@ocaml.doc "Specifies expiration events associated with an account.\n"]
}
[@@ocaml.doc ""]

type nonrec private_key_blob = bytes [@@ocaml.doc ""]

type nonrec private_key = string [@@ocaml.doc ""]

type nonrec prevalidation_type = DNS_PREVALIDATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dns_prevalidation_details = {
  resource_record : resource_record option;
      [@ocaml.doc "The DNS resource record to create for domain validation.\n"]
  hosted_zone_id : hosted_zone_id option;
      [@ocaml.doc "The Route 53 hosted zone ID for DNS validation.\n"]
  domain_scope : domain_scope option;
      [@ocaml.doc "The scope of domains covered by this prevalidation.\n"]
}
[@@ocaml.doc "DNS prevalidation details including the resource record for validation.\n"]

type nonrec prevalidation_details =
  | DnsPrevalidation of dns_prevalidation_details [@ocaml.doc "DNS-based prevalidation details.\n"]
[@@ocaml.doc "Contains details about the prevalidation configuration.\n"]

type nonrec passphrase_blob = bytes [@@ocaml.doc ""]

type nonrec max_items = int [@@ocaml.doc ""]

type nonrec mac_key = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn; [@ocaml.doc "The ARN of the ACM resource for which to list tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_certificate_response = {
  tags : tag_list option; [@ocaml.doc "The key-value pairs that define the applied tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_certificate_request = {
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains the ARN of the ACM certificate for which you want to list the tags. \
         This must have the following form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec certificate_summary = {
  certificate_key_pair_origin : certificate_key_pair_origin option;
      [@ocaml.doc "The origin of the certificate's key pair.\n"]
  managed_by : certificate_managed_by option;
      [@ocaml.doc
        "Identifies the Amazon Web Services service that manages the certificate issued by ACM.\n"]
  revoked_at : t_stamp option;
      [@ocaml.doc
        "The time at which the certificate was revoked. This value exists only when the \
         certificate status is [REVOKED]. \n"]
  imported_at : t_stamp option;
      [@ocaml.doc
        "The date and time when the certificate was imported. This value exists only when the \
         certificate type is [IMPORTED]. \n"]
  issued_at : t_stamp option;
      [@ocaml.doc
        "The time at which the certificate was issued. This value exists only when the certificate \
         type is [AMAZON_ISSUED]. \n"]
  created_at : t_stamp option; [@ocaml.doc "The time at which the certificate was requested.\n"]
  not_after : t_stamp option; [@ocaml.doc "The time after which the certificate is not valid.\n"]
  not_before : t_stamp option; [@ocaml.doc "The time before which the certificate is not valid.\n"]
  renewal_eligibility : renewal_eligibility option;
      [@ocaml.doc
        "Specifies whether the certificate is eligible for renewal. At this time, only exported \
         private certificates can be renewed with the [RenewCertificate] command.\n"]
  exported : nullable_boolean option;
      [@ocaml.doc "Indicates whether the certificate has been exported.\n"]
  in_use : nullable_boolean option;
      [@ocaml.doc
        "Indicates whether the certificate is currently in use by any Amazon Web Services resources.\n"]
  export_option : certificate_export option;
      [@ocaml.doc "Indicates if export is enabled for the certificate.\n"]
  extended_key_usages : extended_key_usage_names option;
      [@ocaml.doc
        "Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a \
         purpose for which the certificate public key can be used and consists of a name and an \
         object identifier (OID). \n"]
  key_usages : key_usage_names option;
      [@ocaml.doc
        "A list of Key Usage X.509 v3 extension objects. Each object is a string value that \
         identifies the purpose of the public key contained in the certificate. Possible extension \
         values include DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.\n"]
  key_algorithm : key_algorithm option;
      [@ocaml.doc "The algorithm that was used to generate the public-private key pair.\n"]
  type_ : certificate_type option;
      [@ocaml.doc
        "The source of the certificate. For certificates provided by ACM, this value is \
         [AMAZON_ISSUED]. For certificates that you imported with [ImportCertificate], this value \
         is [IMPORTED]. ACM does not provide \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for \
         imported certificates. For more information about the differences between certificates \
         that you import and those that ACM provides, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
         Certificates} in the {i Certificate Manager User Guide}. \n"]
  status : certificate_status option;
      [@ocaml.doc
        "The status of the certificate.\n\n\
        \ A certificate enters status PENDING_VALIDATION upon being requested, unless it fails for \
         any of the reasons given in the troubleshooting topic \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html}Certificate \
         request fails}. ACM makes repeated attempts to validate a certificate for 72 hours and \
         then times out. If a certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the \
         request, correct the issue with \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html}DNS validation} \
         or {{:https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html}Email \
         validation}, and try again. If validation succeeds, the certificate enters status ISSUED. \n\
        \ "]
  has_additional_subject_alternative_names : nullable_boolean option;
      [@ocaml.doc
        "When called by \
         {{:https://docs.aws.amazon.com/acm/latest/APIReference/API_ListCertificates.html}ListCertificates}, \
         indicates whether the full list of subject alternative names has been included in the \
         response. If false, the response includes all of the subject alternative names included \
         in the certificate. If true, the response only includes the first 100 subject alternative \
         names included in the certificate. To display the full list of subject alternative names, \
         use \
         {{:https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html}DescribeCertificate}.\n"]
  subject_alternative_name_summaries : domain_list option;
      [@ocaml.doc
        "One or more domain names (subject alternative names) included in the certificate. This \
         list contains the domain names that are bound to the public key that is contained in the \
         certificate. The subject alternative names include the canonical domain name (CN) of the \
         certificate and additional domain names that can be used to connect to the website. \n\n\
        \ When called by \
         {{:https://docs.aws.amazon.com/acm/latest/APIReference/API_ListCertificates.html}ListCertificates}, \
         this parameter will only return the first 100 subject alternative names included in the \
         certificate. To display the full list of subject alternative names, use \
         {{:https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html}DescribeCertificate}.\n\
        \ "]
  domain_name : domain_name_string option;
      [@ocaml.doc
        "Fully qualified domain name (FQDN), such as www.example.com or example.com, for the \
         certificate.\n"]
  certificate_arn : arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the certificate. This is of the form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc "This structure is returned in the response object of [ListCertificates] action. \n"]

type nonrec certificate_summary_list = certificate_summary list [@@ocaml.doc ""]

type nonrec list_certificates_response = {
  certificate_summary_list : certificate_summary_list option;
      [@ocaml.doc "A list of ACM certificates.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When the list is truncated, this value is present and contains the value to use for the \
         [NextToken] parameter in a subsequent pagination request.\n"]
}
[@@ocaml.doc ""]

type nonrec certificate_statuses = certificate_status list [@@ocaml.doc ""]

type nonrec certificate_key_pair_origins = certificate_key_pair_origin list [@@ocaml.doc ""]

type nonrec extended_key_usage_filter_list = extended_key_usage_name list [@@ocaml.doc ""]

type nonrec key_usage_filter_list = key_usage_name list [@@ocaml.doc ""]

type nonrec key_algorithm_list = key_algorithm list [@@ocaml.doc ""]

type nonrec filters = {
  managed_by : certificate_managed_by option;
      [@ocaml.doc
        "Identifies the Amazon Web Services service that manages the certificate issued by ACM.\n"]
  export_option : certificate_export option;
      [@ocaml.doc
        "Specify [ENABLED] or [DISABLED] to identify certificates that can be exported.\n"]
  key_types : key_algorithm_list option;
      [@ocaml.doc
        "Specify one or more algorithms that can be used to generate key pairs.\n\n\
        \ Default filtering returns only [RSA_1024] and [RSA_2048] certificates that have at least \
         one domain. To return other certificate types, provide the desired type signatures in a \
         comma-separated list. For example, [\"keyTypes\": \\[\"RSA_2048\",\"RSA_4096\"\\]] \
         returns both [RSA_2048] and [RSA_4096] certificates.\n\
        \ "]
  key_usage : key_usage_filter_list option;
      [@ocaml.doc "Specify one or more [KeyUsage] extension values.\n"]
  extended_key_usage : extended_key_usage_filter_list option;
      [@ocaml.doc "Specify one or more [ExtendedKeyUsage] extension values.\n"]
}
[@@ocaml.doc
  "This structure can be used in the [ListCertificates] action to filter the output of the \
   certificate list. \n"]

type nonrec list_certificates_request = {
  sort_order : sort_order option;
      [@ocaml.doc
        "Specifies the order of sorted results. If you specify [SortOrder], you must also specify \
         [SortBy].\n"]
  sort_by : sort_by option;
      [@ocaml.doc
        "Specifies the field to sort results by. If you specify [SortBy], you must also specify \
         [SortOrder].\n"]
  max_items : max_items option;
      [@ocaml.doc
        "Use this parameter when paginating results to specify the maximum number of items to \
         return in the response. If additional items exist beyond the number you specify, the \
         [NextToken] element is sent in the response. Use this [NextToken] value in a subsequent \
         request to retrieve additional items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only in a subsequent request after \
         you receive a response with truncated results. Set it to the value of [NextToken] from \
         the response you just received.\n"]
  includes : filters option;
      [@ocaml.doc
        "Filter the certificate list. For more information, see the [Filters] structure.\n"]
  certificate_key_pair_origins : certificate_key_pair_origins option;
      [@ocaml.doc
        "Filter the certificate list by certificate key pair origin. Specify one or more \
         [CertificateKeyPairOrigin] values. Default filtering returns only certificates with key \
         pair origin of [AWS_MANAGED] and [CUSTOMER_PROVIDED].\n"]
  certificate_statuses : certificate_statuses option;
      [@ocaml.doc "Filter the certificate list by status value.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_args_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "One or more of request parameters specified is not valid.\n"]

type nonrec acme_external_account_binding_summary = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was last updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was created.\n"]
  last_used_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was last used.\n"]
  revoked_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was revoked.\n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding expires.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role associated with the external account \
         binding.\n"]
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  acme_external_account_binding_arn : acme_external_account_binding_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME external account binding.\n"]
}
[@@ocaml.doc "Contains summary information about an ACME external account binding.\n"]

type nonrec acme_external_account_binding_list = acme_external_account_binding_summary list
[@@ocaml.doc ""]

type nonrec list_acme_external_account_bindings_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
  external_account_bindings : acme_external_account_binding_list option;
      [@ocaml.doc "The list of external account bindings.\n"]
}
[@@ocaml.doc ""]

type nonrec list_acme_external_account_bindings_request = {
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec acme_endpoint_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec acme_endpoint_summary = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the ACME endpoint was last updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the ACME endpoint was created.\n"]
  certificate_tags : tag_list option;
      [@ocaml.doc "Tags applied to certificates issued through this ACME endpoint.\n"]
  certificate_authority : certificate_authority option;
      [@ocaml.doc "The certificate authority configuration for the ACME endpoint.\n"]
  contact : acme_contact option;
      [@ocaml.doc
        "Whether ACME clients must provide contact information during account registration.\n"]
  authorization_behavior : acme_authorization_behavior option;
      [@ocaml.doc "The authorization behavior of the ACME endpoint.\n"]
  failure_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason the ACME endpoint failed, if applicable.\n"]
  status : acme_endpoint_status option; [@ocaml.doc "The status of the ACME endpoint.\n"]
  endpoint_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the ACME endpoint.\n"]
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
}
[@@ocaml.doc "Contains summary information about an ACME endpoint.\n"]

type nonrec acme_endpoint_list = acme_endpoint_summary list [@@ocaml.doc ""]

type nonrec list_acme_endpoints_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
  acme_endpoints : acme_endpoint_list option; [@ocaml.doc "The list of ACME endpoints.\n"]
}
[@@ocaml.doc ""]

type nonrec list_acme_endpoints_request = {
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec acme_domain_validation_status =
  | DELETING [@ocaml.doc ""]
  | INVALID [@ocaml.doc ""]
  | VALID [@ocaml.doc ""]
  | VALIDATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec acme_domain_validation_failure_reason =
  | TIMED_OUT [@ocaml.doc ""]
  | INVALID_PUBLIC_DOMAIN [@ocaml.doc ""]
  | INVALID_CHANGE_BATCH [@ocaml.doc ""]
  | INTERNAL_FAILURE [@ocaml.doc ""]
  | HOSTED_ZONE_NOT_FOUND [@ocaml.doc ""]
  | ENDPOINT_NOT_ACTIVE [@ocaml.doc ""]
  | DOMAIN_NOT_ALLOWED [@ocaml.doc ""]
  | DOMAIN_MISMATCH [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failure_details = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A message describing the failure.\n"]
  reason : acme_domain_validation_failure_reason option; [@ocaml.doc "The reason for the failure.\n"]
}
[@@ocaml.doc "Contains details about a failure.\n"]

type nonrec acme_domain_validation_summary = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the domain validation was last updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the domain validation was created.\n"]
  failure_details : failure_details option;
      [@ocaml.doc "Details about the failure, if the validation failed.\n"]
  status : acme_domain_validation_status option;
      [@ocaml.doc "The status of the domain validation.\n"]
  prevalidation_details : prevalidation_details option;
      [@ocaml.doc "Details about the prevalidation configuration.\n"]
  prevalidation_type : prevalidation_type option; [@ocaml.doc "The type of prevalidation used.\n"]
  domain_name : domain_name option; [@ocaml.doc "The domain name being validated.\n"]
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  acme_domain_validation_arn : acme_domain_validation_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME domain validation.\n"]
}
[@@ocaml.doc "Contains summary information about an ACME domain validation.\n"]

type nonrec acme_domain_validation_list = acme_domain_validation_summary list [@@ocaml.doc ""]

type nonrec list_acme_domain_validations_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
  acme_domain_validations : acme_domain_validation_list option;
      [@ocaml.doc "The list of domain validations.\n"]
}
[@@ocaml.doc ""]

type nonrec list_acme_domain_validations_request = {
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec acme_account_status =
  | REVOKED [@ocaml.doc ""]
  | DEACTIVATED [@ocaml.doc ""]
  | VALID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec contact_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec acme_account_summary = {
  contacts : contact_list option; [@ocaml.doc "The contact information for the ACME account.\n"]
  acme_external_account_binding_arn : acme_external_account_binding_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the external account binding associated with this ACME \
         account.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the ACME account was created.\n"]
  status : acme_account_status option; [@ocaml.doc "The status of the ACME account.\n"]
  public_key_thumbprint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The thumbprint of the public key associated with the ACME account.\n"]
  account_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the ACME account.\n"]
}
[@@ocaml.doc "Contains summary information about an ACME account.\n"]

type nonrec acme_account_list = acme_account_summary list [@@ocaml.doc ""]

type nonrec list_acme_accounts_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
  acme_accounts : acme_account_list option; [@ocaml.doc "The list of ACME accounts.\n"]
}
[@@ocaml.doc ""]

type nonrec list_acme_accounts_request = {
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A token for pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec key_usage = {
  name : key_usage_name option;
      [@ocaml.doc "A string value that contains a Key Usage extension name.\n"]
}
[@@ocaml.doc
  "The Key Usage X.509 v3 extension defines the purpose of the public key contained in the \
   certificate.\n"]

type nonrec key_usage_list = key_usage list [@@ocaml.doc ""]

type nonrec in_use_list = string_ list [@@ocaml.doc ""]

type nonrec import_certificate_response = {
  certificate_arn : arn option;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of the imported certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec certificate_body_blob = bytes [@@ocaml.doc ""]

type nonrec certificate_chain_blob = bytes [@@ocaml.doc ""]

type nonrec import_certificate_request = {
  tags : tag_list option;
      [@ocaml.doc
        "One or more resource tags to associate with the imported certificate. \n\n\
        \ Note: You cannot apply tags when reimporting a certificate.\n\
        \ "]
  certificate_chain : certificate_chain_blob option;
      [@ocaml.doc "The PEM encoded certificate chain.\n"]
  private_key : private_key_blob;
      [@ocaml.doc "The private key that matches the public key in the certificate.\n"]
  certificate : certificate_body_blob; [@ocaml.doc "The certificate to import.\n"]
  certificate_arn : arn option;
      [@ocaml.doc
        "The {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Name (ARN)} of an imported certificate to replace. To import a new certificate, \
         omit this field. \n"]
}
[@@ocaml.doc ""]

type nonrec certificate_body = string [@@ocaml.doc ""]

type nonrec certificate_chain = string [@@ocaml.doc ""]

type nonrec get_certificate_response = {
  certificate_chain : certificate_chain option;
      [@ocaml.doc
        "Certificates forming the requested certificate's chain of trust. The chain consists of \
         the certificate of the issuing CA and the intermediate certificates of any other \
         subordinate CAs. \n"]
  certificate : certificate_body option;
      [@ocaml.doc "The ACM-issued certificate corresponding to the ARN specified as input.\n"]
}
[@@ocaml.doc ""]

type nonrec get_certificate_request = {
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains a certificate ARN in the following format:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_acme_external_account_binding_credentials_response = {
  mac_key : mac_key option;
      [@ocaml.doc "The MAC key for the external account binding credentials.\n"]
  key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The key identifier for the external account binding credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec get_acme_external_account_binding_credentials_request = {
  acme_external_account_binding_arn : acme_external_account_binding_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME external account binding.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_configuration_response = {
  expiry_events : expiry_events_configuration option;
      [@ocaml.doc
        "Expiration events configuration options associated with the Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec extended_key_usage = {
  oi_d : string_ option;
      [@ocaml.doc
        "An object identifier (OID) for the extension value. OIDs are strings of numbers separated \
         by periods. The following OIDs are defined in RFC 3280 and RFC 5280. \n\n\
        \ {ul\n\
        \       {-   [1.3.6.1.5.5.7.3.1 (TLS_WEB_SERVER_AUTHENTICATION)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.2 (TLS_WEB_CLIENT_AUTHENTICATION)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.3 (CODE_SIGNING)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.4 (EMAIL_PROTECTION)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.8 (TIME_STAMPING)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.9 (OCSP_SIGNING)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.5 (IPSEC_END_SYSTEM)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.6 (IPSEC_TUNNEL)] \n\
        \           \n\
        \            }\n\
        \       {-   [1.3.6.1.5.5.7.3.7 (IPSEC_USER)] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : extended_key_usage_name option; [@ocaml.doc "The name of an Extended Key Usage value.\n"]
}
[@@ocaml.doc
  "The Extended Key Usage X.509 v3 extension defines one or more purposes for which the public key \
   can be used. This is in addition to or in place of the basic purposes specified by the Key \
   Usage extension. \n"]

type nonrec extended_key_usage_list = extended_key_usage list [@@ocaml.doc ""]

type nonrec export_certificate_response = {
  private_key : private_key option;
      [@ocaml.doc
        "The encrypted private key associated with the public key in the certificate. The key is \
         output in PKCS #8 format and is base64 PEM-encoded. \n"]
  certificate_chain : certificate_chain option;
      [@ocaml.doc
        "The base64 PEM-encoded certificate chain. This does not include the certificate that you \
         are exporting.\n"]
  certificate : certificate_body option; [@ocaml.doc "The base64 PEM-encoded certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec export_certificate_request = {
  passphrase : passphrase_blob;
      [@ocaml.doc
        "Passphrase to associate with the encrypted exported private key. \n\n\
        \  When creating your passphrase, you can use any ASCII character except #, $, or %.\n\
        \  \n\
        \    If you want to later decrypt the private key, you must have the passphrase. You can \
         use the following OpenSSL command to decrypt a private key. After entering the command, \
         you are prompted for the passphrase.\n\
        \    \n\
        \      [openssl rsa -in encrypted_key.pem -out decrypted_key.pem] \n\
        \     "]
  certificate_arn : arn;
      [@ocaml.doc
        "An Amazon Resource Name (ARN) of the issued certificate. This must be of the form:\n\n\
        \  [arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec expiration = {
  type_ : time_type; [@ocaml.doc "The time unit for the expiration value.\n"]
  value : Smaws_Lib.Smithy_api.Types.long; [@ocaml.doc "The numeric value of the expiration.\n"]
}
[@@ocaml.doc "Specifies an expiration configuration.\n"]

type nonrec certificate_detail = {
  acme_account_id : acme_account_id option;
      [@ocaml.doc "The ACME account identifier associated with the certificate.\n"]
  acme_endpoint_arn : arn option;
      [@ocaml.doc "The ARN of the ACME endpoint used to issue the certificate.\n"]
  certificate_key_pair_origin : certificate_key_pair_origin option;
      [@ocaml.doc "The origin of the certificate's key pair.\n"]
  options : certificate_options option;
      [@ocaml.doc
        "Contains the certificate options. Certificate transparency logging opt-out is no longer \
         available. All public certificates are recorded in a certificate transparency log.\n"]
  renewal_eligibility : renewal_eligibility option;
      [@ocaml.doc
        "Specifies whether the certificate is eligible for renewal. At this time, only exported \
         private certificates can be renewed with the [RenewCertificate] command.\n"]
  certificate_authority_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the private certificate authority (CA) that issued the \
         certificate. This has the following format: \n\n\
        \  \
         [arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012] \n\
        \ "]
  extended_key_usages : extended_key_usage_list option;
      [@ocaml.doc
        "Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a \
         purpose for which the certificate public key can be used and consists of a name and an \
         object identifier (OID). \n"]
  key_usages : key_usage_list option;
      [@ocaml.doc
        "A list of Key Usage X.509 v3 extension objects. Each object is a string value that \
         identifies the purpose of the public key contained in the certificate. Possible extension \
         values include DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.\n"]
  renewal_summary : renewal_summary option;
      [@ocaml.doc
        "Contains information about the status of ACM's \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for \
         the certificate. This field exists only when the certificate type is [AMAZON_ISSUED].\n"]
  type_ : certificate_type option;
      [@ocaml.doc
        "The source of the certificate. For certificates provided by ACM, this value is \
         [AMAZON_ISSUED]. For certificates that you imported with [ImportCertificate], this value \
         is [IMPORTED]. ACM does not provide \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for \
         imported certificates. For more information about the differences between certificates \
         that you import and those that ACM provides, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
         Certificates} in the {i Certificate Manager User Guide}. \n"]
  failure_reason : failure_reason option;
      [@ocaml.doc
        "The reason the certificate request failed. This value exists only when the certificate \
         status is [FAILED]. For more information, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting.html#troubleshooting-failed}Certificate \
         Request Failed} in the {i Certificate Manager User Guide}. \n"]
  in_use_by : in_use_list option;
      [@ocaml.doc
        "A list of ARNs for the Amazon Web Services resources that are using the certificate. A \
         certificate can be used by multiple Amazon Web Services resources. \n"]
  signature_algorithm : string_ option;
      [@ocaml.doc "The algorithm that was used to sign the certificate.\n"]
  key_algorithm : key_algorithm option;
      [@ocaml.doc "The algorithm that was used to generate the public-private key pair.\n"]
  not_after : t_stamp option; [@ocaml.doc "The time after which the certificate is not valid.\n"]
  not_before : t_stamp option; [@ocaml.doc "The time before which the certificate is not valid.\n"]
  revocation_reason : revocation_reason option;
      [@ocaml.doc
        "The reason the certificate was revoked. This value exists only when the certificate \
         status is [REVOKED]. \n"]
  revoked_at : t_stamp option;
      [@ocaml.doc
        "The time at which the certificate was revoked. This value exists only when the \
         certificate status is [REVOKED]. \n"]
  status : certificate_status option;
      [@ocaml.doc
        "The status of the certificate.\n\n\
        \ A certificate enters status PENDING_VALIDATION upon being requested, unless it fails for \
         any of the reasons given in the troubleshooting topic \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html}Certificate \
         request fails}. ACM makes repeated attempts to validate a certificate for 72 hours and \
         then times out. If a certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the \
         request, correct the issue with \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html}DNS validation} \
         or {{:https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html}Email \
         validation}, and try again. If validation succeeds, the certificate enters status ISSUED. \n\
        \ "]
  imported_at : t_stamp option;
      [@ocaml.doc
        "The date and time when the certificate was imported. This value exists only when the \
         certificate type is [IMPORTED]. \n"]
  issued_at : t_stamp option;
      [@ocaml.doc
        "The time at which the certificate was issued. This value exists only when the certificate \
         type is [AMAZON_ISSUED]. \n"]
  created_at : t_stamp option; [@ocaml.doc "The time at which the certificate was requested.\n"]
  issuer : string_ option;
      [@ocaml.doc "The name of the certificate authority that issued and signed the certificate.\n"]
  subject : string_ option;
      [@ocaml.doc
        "The name of the entity that is associated with the public key contained in the certificate.\n"]
  serial : string_ option; [@ocaml.doc "The serial number of the certificate.\n"]
  domain_validation_options : domain_validation_list option;
      [@ocaml.doc
        "Contains information about the initial validation of each domain name that occurs as a \
         result of the [RequestCertificate] request. This field exists only when the certificate \
         type is [AMAZON_ISSUED]. \n"]
  managed_by : certificate_managed_by option;
      [@ocaml.doc
        "Identifies the Amazon Web Services service that manages the certificate issued by ACM.\n"]
  subject_alternative_names : domain_list option;
      [@ocaml.doc
        "One or more domain names (subject alternative names) included in the certificate. This \
         list contains the domain names that are bound to the public key that is contained in the \
         certificate. The subject alternative names include the canonical domain name (CN) of the \
         certificate and additional domain names that can be used to connect to the website. \n"]
  domain_name : domain_name_string option;
      [@ocaml.doc
        "The fully qualified domain name for the certificate, such as www.example.com or \
         example.com.\n"]
  certificate_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the certificate. For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n"]
}
[@@ocaml.doc
  "Contains metadata about an ACM certificate. This structure is returned in the response to a \
   [DescribeCertificate] request. \n"]

type nonrec describe_certificate_response = {
  certificate : certificate_detail option; [@ocaml.doc "Metadata about an ACM certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_certificate_request = {
  certificate_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ACM certificate. The ARN must have the following \
         form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec acme_external_account_binding = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was last updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was created.\n"]
  last_used_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was last used.\n"]
  revoked_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding was revoked.\n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the external account binding expires.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role associated with the external account \
         binding.\n"]
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  acme_external_account_binding_arn : acme_external_account_binding_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME external account binding.\n"]
}
[@@ocaml.doc "Contains detailed information about an ACME external account binding.\n"]

type nonrec describe_acme_external_account_binding_response = {
  external_account_binding : acme_external_account_binding option;
      [@ocaml.doc "The external account binding details.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_acme_external_account_binding_request = {
  acme_external_account_binding_arn : acme_external_account_binding_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME external account binding.\n"]
}
[@@ocaml.doc ""]

type nonrec acme_endpoint = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the ACME endpoint was last updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the ACME endpoint was created.\n"]
  certificate_tags : tag_list option;
      [@ocaml.doc "Tags applied to certificates issued through this ACME endpoint.\n"]
  certificate_authority : certificate_authority option;
      [@ocaml.doc "The certificate authority configuration for the ACME endpoint.\n"]
  contact : acme_contact option;
      [@ocaml.doc
        "Whether ACME clients must provide contact information during account registration.\n"]
  authorization_behavior : acme_authorization_behavior option;
      [@ocaml.doc "The authorization behavior of the ACME endpoint.\n"]
  failure_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason the ACME endpoint failed, if applicable.\n"]
  status : acme_endpoint_status option; [@ocaml.doc "The status of the ACME endpoint.\n"]
  endpoint_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the ACME endpoint.\n"]
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
}
[@@ocaml.doc "Contains detailed information about an ACME endpoint.\n"]

type nonrec describe_acme_endpoint_response = {
  acme_endpoint : acme_endpoint option; [@ocaml.doc "The ACME endpoint details.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_acme_endpoint_request = {
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec acme_domain_validation = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the domain validation was last updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the domain validation was created.\n"]
  failure_details : failure_details option;
      [@ocaml.doc "Details about the failure, if the validation failed.\n"]
  status : acme_domain_validation_status option;
      [@ocaml.doc "The status of the domain validation.\n"]
  prevalidation_details : prevalidation_details option;
      [@ocaml.doc "Details about the prevalidation configuration.\n"]
  prevalidation_type : prevalidation_type option; [@ocaml.doc "The type of prevalidation used.\n"]
  domain_name : domain_name option; [@ocaml.doc "The domain name being validated.\n"]
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  acme_domain_validation_arn : acme_domain_validation_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME domain validation.\n"]
}
[@@ocaml.doc "Contains detailed information about an ACME domain validation.\n"]

type nonrec describe_acme_domain_validation_response = {
  acme_domain_validation : acme_domain_validation option;
      [@ocaml.doc "The ACME domain validation details.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_acme_domain_validation_request = {
  acme_domain_validation_arn : acme_domain_validation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME domain validation.\n"]
}
[@@ocaml.doc ""]

type nonrec acme_account = {
  contacts : contact_list option; [@ocaml.doc "The contact information for the ACME account.\n"]
  acme_external_account_binding_arn : acme_external_account_binding_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the external account binding associated with this ACME \
         account.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time at which the ACME account was created.\n"]
  status : acme_account_status option; [@ocaml.doc "The status of the ACME account.\n"]
  public_key_thumbprint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The thumbprint of the public key associated with the ACME account.\n"]
  account_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the ACME account.\n"]
}
[@@ocaml.doc "Contains detailed information about an ACME account.\n"]

type nonrec describe_acme_account_response = {
  acme_account : acme_account option; [@ocaml.doc "The ACME account details.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_acme_account_request = {
  account_url : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The URL of the ACME account.\n"]
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_certificate_request = {
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains the ARN of the ACM certificate to be deleted. This must be of the \
         form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_acme_external_account_binding_request = {
  acme_external_account_binding_arn : acme_external_account_binding_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ACME external account binding to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_acme_endpoint_request = {
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_acme_domain_validation_request = {
  acme_domain_validation_arn : acme_domain_validation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME domain validation to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acme_external_account_binding_response = {
  external_account_binding : acme_external_account_binding option;
      [@ocaml.doc "The created external account binding.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acme_external_account_binding_request = {
  tags : tag_list option;
      [@ocaml.doc "One or more tags to associate with the external account binding.\n"]
  expiration : expiration option;
      [@ocaml.doc "The expiration configuration for the external account binding.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to associate with the external account \
         binding.\n"]
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  idempotency_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acme_endpoint_response = {
  acme_endpoint_arn : acme_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created ACME endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acme_endpoint_request = {
  certificate_tags : tag_list option;
      [@ocaml.doc "Tags to apply to certificates issued through this ACME endpoint.\n"]
  tags : tag_list option; [@ocaml.doc "One or more tags to associate with the ACME endpoint.\n"]
  certificate_authority : certificate_authority;
      [@ocaml.doc
        "The type of certificate authority to use for issuing certificates through this ACME \
         endpoint.\n"]
  contact : acme_contact option;
      [@ocaml.doc
        "Specifies whether ACME clients must provide contact information during account \
         registration.\n"]
  authorization_behavior : acme_authorization_behavior;
      [@ocaml.doc "The authorization behavior for the ACME endpoint.\n"]
  idempotency_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acme_domain_validation_response = {
  acme_domain_validation_arn : acme_domain_validation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created domain validation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_acme_domain_validation_request = {
  tags : tag_list option; [@ocaml.doc "One or more tags to associate with the domain validation.\n"]
  prevalidation_options : prevalidation_options;
      [@ocaml.doc "The prevalidation options for the domain.\n"]
  domain_name : domain_name; [@ocaml.doc "The domain name to validate.\n"]
  acme_endpoint_arn : acme_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ACME endpoint.\n"]
  idempotency_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A unique, case-sensitive identifier to ensure idempotency of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec add_tags_to_certificate_request = {
  tags : tag_list;
      [@ocaml.doc "The key-value pair that defines the tag. The tag value is optional.\n"]
  certificate_arn : arn;
      [@ocaml.doc
        "String that contains the ARN of the ACM certificate to which the tag is to be applied. \
         This must be of the form:\n\n\
        \  [arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012] \n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)}.\n\
        \  "]
}
[@@ocaml.doc ""]
