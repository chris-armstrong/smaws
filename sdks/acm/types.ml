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
  | EMAIL 
type nonrec validation_exception = {
  message: string option }
type nonrec certificate_transparency_logging_preference =
  | DISABLED 
  | ENABLED 
type nonrec certificate_options =
  {
  certificate_transparency_logging_preference:
    certificate_transparency_logging_preference option }
type nonrec update_certificate_options_request =
  {
  options: certificate_options ;
  certificate_arn: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec invalid_state_exception = {
  message: string option }
type nonrec invalid_arn_exception = {
  message: string option }
type nonrec too_many_tags_exception = {
  message: string option }
type nonrec throttling_exception = {
  message: string option }
type nonrec tag_policy_exception = {
  message: string option }
type nonrec tag = {
  value: string option ;
  key: string }
type nonrec sort_order =
  | DESCENDING 
  | ASCENDING 
type nonrec sort_by =
  | CREATED_AT 
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
  | UNSPECIFIED 
type nonrec record_type =
  | CNAME 
type nonrec resource_record =
  {
  value: string ;
  type_: record_type ;
  name: string }
type nonrec resource_in_use_exception = {
  message: string option }
type nonrec resend_validation_email_request =
  {
  validation_domain: string ;
  domain: string ;
  certificate_arn: string }
type nonrec invalid_domain_validation_options_exception =
  {
  message: string option }
type nonrec request_in_progress_exception = {
  message: string option }
type nonrec request_certificate_response = {
  certificate_arn: string option }
type nonrec domain_validation_option =
  {
  validation_domain: string ;
  domain_name: string }
type nonrec key_algorithm =
  | EC_secp521r1 
  | EC_secp384r1 
  | EC_prime256v1 
  | RSA_4096 
  | RSA_3072 
  | RSA_2048 
  | RSA_1024 
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
  domain_name: string }
type nonrec invalid_tag_exception = {
  message: string option }
type nonrec invalid_parameter_exception = {
  message: string option }
type nonrec renewal_status =
  | FAILED 
  | SUCCESS 
  | PENDING_VALIDATION 
  | PENDING_AUTO_RENEWAL 
type nonrec domain_status =
  | FAILED 
  | SUCCESS 
  | PENDING_VALIDATION 
type nonrec domain_validation =
  {
  validation_method: validation_method option ;
  resource_record: resource_record option ;
  validation_status: domain_status option ;
  validation_domain: string option ;
  validation_emails: string list option ;
  domain_name: string }
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
  | NO_AVAILABLE_CONTACTS 
type nonrec renewal_summary =
  {
  updated_at: CoreTypes.Timestamp.t ;
  renewal_status_reason: failure_reason option ;
  domain_validation_options: domain_validation list ;
  renewal_status: renewal_status }
type nonrec renewal_eligibility =
  | INELIGIBLE 
  | ELIGIBLE 
type nonrec renew_certificate_request = {
  certificate_arn: string }
type nonrec remove_tags_from_certificate_request =
  {
  tags: tag list ;
  certificate_arn: string }
type nonrec expiry_events_configuration = {
  days_before_expiry: int option }
type nonrec put_account_configuration_request =
  {
  idempotency_token: string ;
  expiry_events: expiry_events_configuration option }
type nonrec conflict_exception = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec list_tags_for_certificate_response = {
  tags: tag list option }
type nonrec list_tags_for_certificate_request = {
  certificate_arn: string }
type nonrec certificate_status =
  | FAILED 
  | REVOKED 
  | VALIDATION_TIMED_OUT 
  | EXPIRED 
  | INACTIVE 
  | ISSUED 
  | PENDING_VALIDATION 
type nonrec certificate_type =
  | PRIVATE 
  | AMAZON_ISSUED 
  | IMPORTED 
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
  | DIGITAL_SIGNATURE 
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
  | TLS_WEB_SERVER_AUTHENTICATION 
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
  certificate_arn: string option }
type nonrec list_certificates_response =
  {
  certificate_summary_list: certificate_summary list option ;
  next_token: string option }
type nonrec filters =
  {
  key_types: key_algorithm list option ;
  key_usage: key_usage_name list option ;
  extended_key_usage: extended_key_usage_name list option }
type nonrec list_certificates_request =
  {
  sort_order: sort_order option ;
  sort_by: sort_by option ;
  max_items: int option ;
  next_token: string option ;
  includes: filters option ;
  certificate_statuses: certificate_status list option }
type nonrec invalid_args_exception = {
  message: string option }
type nonrec key_usage = {
  name: key_usage_name option }
type nonrec import_certificate_response = {
  certificate_arn: string option }
type nonrec import_certificate_request =
  {
  tags: tag list option ;
  certificate_chain: bytes option ;
  private_key: bytes ;
  certificate: bytes ;
  certificate_arn: string option }
type nonrec get_certificate_response =
  {
  certificate_chain: string option ;
  certificate: string option }
type nonrec get_certificate_request = {
  certificate_arn: string }
type nonrec get_account_configuration_response =
  {
  expiry_events: expiry_events_configuration option }
type nonrec extended_key_usage =
  {
  oi_d: string option ;
  name: extended_key_usage_name option }
type nonrec export_certificate_response =
  {
  private_key: string option ;
  certificate_chain: string option ;
  certificate: string option }
type nonrec export_certificate_request =
  {
  passphrase: bytes ;
  certificate_arn: string }
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
  certificate_arn: string option }
type nonrec describe_certificate_response =
  {
  certificate: certificate_detail option }
type nonrec describe_certificate_request = {
  certificate_arn: string }
type nonrec delete_certificate_request = {
  certificate_arn: string }
type nonrec add_tags_to_certificate_request =
  {
  tags: tag list ;
  certificate_arn: string }