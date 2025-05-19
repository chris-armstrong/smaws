open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "acm";
      endpointPrefix = "acm";
      version = "2015-12-08";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec validation_method =
  | DNS 
  | EMAIL [@@ocaml.doc ""]
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "The supplied input failed to satisfy constraints of an Amazon Web Services service.\n"]
type nonrec certificate_transparency_logging_preference =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec certificate_options =
  {
  certificate_transparency_logging_preference:
    certificate_transparency_logging_preference option }[@@ocaml.doc
                                                          "Structure that contains options for your certificate. Currently, you can use this only to specify whether to opt in to or out of certificate transparency logging. Some browsers require that public certificates issued for your domain be recorded in a log. Certificates that are not logged typically generate a browser error. Transparency makes it possible for you to detect SSL/TLS certificates that have been mistakenly or maliciously issued for your domain. For general information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency}Certificate Transparency Logging}. \n"]
type nonrec update_certificate_options_request =
  {
  options: certificate_options ;
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified certificate cannot be found in the caller's account or the caller's account cannot be found.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc "An ACM quota has been exceeded.\n"]
type nonrec invalid_state_exception = {
  message: string option }[@@ocaml.doc
                            "Processing has reached an invalid state.\n"]
type nonrec invalid_arn_exception = {
  message: string option }[@@ocaml.doc
                            "The requested Amazon Resource Name (ARN) does not refer to an existing resource.\n"]
type nonrec too_many_tags_exception = {
  message: string option }[@@ocaml.doc
                            "The request contains too many tags. Try the request again with fewer tags.\n"]
type nonrec throttling_exception = {
  message: string option }[@@ocaml.doc
                            "The request was denied because it exceeded a quota.\n"]
type nonrec tag_policy_exception = {
  message: string option }[@@ocaml.doc
                            "A specified tag did not comply with an existing tag policy and was rejected.\n"]
type nonrec tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "A key-value pair that identifies or specifies metadata about an ACM resource.\n"]
type nonrec sort_order =
  | DESCENDING 
  | ASCENDING [@@ocaml.doc ""]
type nonrec sort_by =
  | CREATED_AT [@@ocaml.doc ""]
type nonrec revocation_reason =
  | A_A_COMPROMISE 
  | PRIVILEGE_WITHDRAWN 
  | REMOVE_FROM_CRL 
  | CERTIFICATE_HOLD 
  | CESSATION_OF_OPERATION 
  | SUPERCEDED 
  | AFFILIATION_CHANGED 
  | CA_COMPROMISE 
  | KEY_COMPROMISE 
  | UNSPECIFIED [@@ocaml.doc ""]
type nonrec record_type =
  | CNAME [@@ocaml.doc ""]
type nonrec resource_record =
  {
  value: string ;
  type_: record_type ;
  name: string }[@@ocaml.doc
                  "Contains a DNS record value that you can use to validate ownership or control of a domain. This is used by the [DescribeCertificate] action. \n"]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The certificate is in use by another Amazon Web Services service in the caller's account. Remove the association and try again.\n"]
type nonrec resend_validation_email_request =
  {
  validation_domain: string ;
  domain: string ;
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec invalid_domain_validation_options_exception =
  {
  message: string option }[@@ocaml.doc
                            "One or more values in the [DomainValidationOption] structure is incorrect.\n"]
type nonrec request_in_progress_exception = {
  message: string option }[@@ocaml.doc
                            "The certificate request is in process and the certificate in your account has not yet been issued.\n"]
type nonrec request_certificate_response = {
  certificate_arn: string option }[@@ocaml.doc ""]
type nonrec domain_validation_option =
  {
  validation_domain: string ;
  domain_name: string }[@@ocaml.doc
                         "Contains information about the domain names that you want ACM to use to send you emails that enable you to validate domain ownership.\n"]
type nonrec key_algorithm =
  | EC_secp521r1 
  | EC_secp384r1 
  | EC_prime256v1 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 
  | RSA_1024 [@@ocaml.doc ""]
type nonrec request_certificate_request =
  {
  key_algorithm: key_algorithm option ;
  tags: tag list option ;
  certificate_authority_arn: string option ;
  options: certificate_options option ;
  domain_validation_options: domain_validation_option list option ;
  idempotency_token: string option ;
  subject_alternative_names: string list option ;
  validation_method: validation_method option ;
  domain_name: string }[@@ocaml.doc ""]
type nonrec invalid_tag_exception = {
  message: string option }[@@ocaml.doc
                            "One or both of the values that make up the key-value pair is not valid. For example, you cannot specify a tag value that begins with [aws:].\n"]
type nonrec invalid_parameter_exception = {
  message: string option }[@@ocaml.doc "An input parameter was invalid.\n"]
type nonrec renewal_status =
  | FAILED 
  | SUCCESS 
  | PENDING_VALIDATION 
  | PENDING_AUTO_RENEWAL [@@ocaml.doc ""]
type nonrec domain_status =
  | FAILED 
  | SUCCESS 
  | PENDING_VALIDATION [@@ocaml.doc ""]
type nonrec domain_validation =
  {
  validation_method: validation_method option ;
  resource_record: resource_record option ;
  validation_status: domain_status option ;
  validation_domain: string option ;
  validation_emails: string list option ;
  domain_name: string }[@@ocaml.doc
                         "Contains information about the validation of each domain name in the certificate.\n"]
type nonrec failure_reason =
  | OTHER 
  | SLR_NOT_FOUND 
  | PCA_ACCESS_DENIED 
  | PCA_INVALID_DURATION 
  | PCA_INVALID_ARGS 
  | PCA_RESOURCE_NOT_FOUND 
  | PCA_NAME_CONSTRAINTS_VALIDATION 
  | PCA_REQUEST_FAILED 
  | PCA_INVALID_STATE 
  | PCA_INVALID_ARN 
  | PCA_LIMIT_EXCEEDED 
  | CAA_ERROR 
  | DOMAIN_VALIDATION_DENIED 
  | INVALID_PUBLIC_DOMAIN 
  | DOMAIN_NOT_ALLOWED 
  | ADDITIONAL_VERIFICATION_REQUIRED 
  | NO_AVAILABLE_CONTACTS [@@ocaml.doc ""]
type nonrec renewal_summary =
  {
  updated_at: CoreTypes.Timestamp.t ;
  renewal_status_reason: failure_reason option ;
  domain_validation_options: domain_validation list ;
  renewal_status: renewal_status }[@@ocaml.doc
                                    "Contains information about the status of ACM's {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for the certificate. This structure exists only when the certificate type is [AMAZON_ISSUED].\n"]
type nonrec renewal_eligibility =
  | INELIGIBLE 
  | ELIGIBLE [@@ocaml.doc ""]
type nonrec renew_certificate_request = {
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec remove_tags_from_certificate_request =
  {
  tags: tag list ;
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec expiry_events_configuration = {
  days_before_expiry: int option }[@@ocaml.doc
                                    "Object containing expiration events options associated with an Amazon Web Services account.\n"]
type nonrec put_account_configuration_request =
  {
  idempotency_token: string ;
  expiry_events: expiry_events_configuration option }[@@ocaml.doc ""]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "You are trying to update a resource or configuration that is already being created or updated. Wait for the previous operation to finish and try again.\n"]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "You do not have access required to perform this action.\n"]
type nonrec list_tags_for_certificate_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_certificate_request = {
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec certificate_status =
  | FAILED 
  | REVOKED 
  | VALIDATION_TIMED_OUT 
  | EXPIRED 
  | INACTIVE 
  | ISSUED 
  | PENDING_VALIDATION [@@ocaml.doc ""]
type nonrec certificate_type =
  | PRIVATE 
  | AMAZON_ISSUED 
  | IMPORTED [@@ocaml.doc ""]
type nonrec key_usage_name =
  | CUSTOM 
  | ANY 
  | DECIPHER_ONLY 
  | ENCHIPER_ONLY 
  | CRL_SIGNING 
  | CERTIFICATE_SIGNING 
  | KEY_AGREEMENT 
  | DATA_ENCIPHERMENT 
  | KEY_ENCIPHERMENT 
  | NON_REPUDATION 
  | DIGITAL_SIGNATURE [@@ocaml.doc ""]
type nonrec extended_key_usage_name =
  | CUSTOM 
  | NONE 
  | ANY 
  | IPSEC_USER 
  | IPSEC_TUNNEL 
  | IPSEC_END_SYSTEM 
  | OCSP_SIGNING 
  | TIME_STAMPING 
  | EMAIL_PROTECTION 
  | CODE_SIGNING 
  | TLS_WEB_CLIENT_AUTHENTICATION 
  | TLS_WEB_SERVER_AUTHENTICATION [@@ocaml.doc ""]
type nonrec certificate_summary =
  {
  revoked_at: CoreTypes.Timestamp.t option ;
  imported_at: CoreTypes.Timestamp.t option ;
  issued_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  not_after: CoreTypes.Timestamp.t option ;
  not_before: CoreTypes.Timestamp.t option ;
  renewal_eligibility: renewal_eligibility option ;
  exported: bool option ;
  in_use: bool option ;
  extended_key_usages: extended_key_usage_name list option ;
  key_usages: key_usage_name list option ;
  key_algorithm: key_algorithm option ;
  type_: certificate_type option ;
  status: certificate_status option ;
  has_additional_subject_alternative_names: bool option ;
  subject_alternative_name_summaries: string list option ;
  domain_name: string option ;
  certificate_arn: string option }[@@ocaml.doc
                                    "This structure is returned in the response object of [ListCertificates] action. \n"]
type nonrec list_certificates_response =
  {
  certificate_summary_list: certificate_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec filters =
  {
  key_types: key_algorithm list option ;
  key_usage: key_usage_name list option ;
  extended_key_usage: extended_key_usage_name list option }[@@ocaml.doc
                                                             "This structure can be used in the [ListCertificates] action to filter the output of the certificate list. \n"]
type nonrec list_certificates_request =
  {
  sort_order: sort_order option ;
  sort_by: sort_by option ;
  max_items: int option ;
  next_token: string option ;
  includes: filters option ;
  certificate_statuses: certificate_status list option }[@@ocaml.doc ""]
type nonrec invalid_args_exception = {
  message: string option }[@@ocaml.doc
                            "One or more of of request parameters specified is not valid.\n"]
type nonrec key_usage = {
  name: key_usage_name option }[@@ocaml.doc
                                 "The Key Usage X.509 v3 extension defines the purpose of the public key contained in the certificate.\n"]
type nonrec import_certificate_response = {
  certificate_arn: string option }[@@ocaml.doc ""]
type nonrec import_certificate_request =
  {
  tags: tag list option ;
  certificate_chain: bytes option ;
  private_key: bytes ;
  certificate: bytes ;
  certificate_arn: string option }[@@ocaml.doc ""]
type nonrec get_certificate_response =
  {
  certificate_chain: string option ;
  certificate: string option }[@@ocaml.doc ""]
type nonrec get_certificate_request = {
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec get_account_configuration_response =
  {
  expiry_events: expiry_events_configuration option }[@@ocaml.doc ""]
type nonrec extended_key_usage =
  {
  oi_d: string option ;
  name: extended_key_usage_name option }[@@ocaml.doc
                                          "The Extended Key Usage X.509 v3 extension defines one or more purposes for which the public key can be used. This is in addition to or in place of the basic purposes specified by the Key Usage extension. \n"]
type nonrec export_certificate_response =
  {
  private_key: string option ;
  certificate_chain: string option ;
  certificate: string option }[@@ocaml.doc ""]
type nonrec export_certificate_request =
  {
  passphrase: bytes ;
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec certificate_detail =
  {
  options: certificate_options option ;
  renewal_eligibility: renewal_eligibility option ;
  certificate_authority_arn: string option ;
  extended_key_usages: extended_key_usage list option ;
  key_usages: key_usage list option ;
  renewal_summary: renewal_summary option ;
  type_: certificate_type option ;
  failure_reason: failure_reason option ;
  in_use_by: string list option ;
  signature_algorithm: string option ;
  key_algorithm: key_algorithm option ;
  not_after: CoreTypes.Timestamp.t option ;
  not_before: CoreTypes.Timestamp.t option ;
  revocation_reason: revocation_reason option ;
  revoked_at: CoreTypes.Timestamp.t option ;
  status: certificate_status option ;
  imported_at: CoreTypes.Timestamp.t option ;
  issued_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  issuer: string option ;
  subject: string option ;
  serial: string option ;
  domain_validation_options: domain_validation list option ;
  subject_alternative_names: string list option ;
  domain_name: string option ;
  certificate_arn: string option }[@@ocaml.doc
                                    "Contains metadata about an ACM certificate. This structure is returned in the response to a [DescribeCertificate] request. \n"]
type nonrec describe_certificate_response =
  {
  certificate: certificate_detail option }[@@ocaml.doc ""]
type nonrec describe_certificate_request = {
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec delete_certificate_request = {
  certificate_arn: string }[@@ocaml.doc ""]
type nonrec add_tags_to_certificate_request =
  {
  tags: tag list ;
  certificate_arn: string }[@@ocaml.doc ""]