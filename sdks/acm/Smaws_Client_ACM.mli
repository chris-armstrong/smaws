(** 
    ACM client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  certificate_arn: string }(** {1:builders Builders} *)

val make_certificate_options :
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference
    -> unit -> certificate_options
val make_update_certificate_options_request :
  options:certificate_options ->
    certificate_arn:string -> unit -> update_certificate_options_request
val make_tag : ?value:string -> key:string -> unit -> tag
val make_resource_record :
  value:string -> type_:record_type -> name:string -> unit -> resource_record
val make_resend_validation_email_request :
  validation_domain:string ->
    domain:string ->
      certificate_arn:string -> unit -> resend_validation_email_request
val make_request_certificate_response :
  ?certificate_arn:string -> unit -> request_certificate_response
val make_domain_validation_option :
  validation_domain:string ->
    domain_name:string -> unit -> domain_validation_option
val make_request_certificate_request :
  ?key_algorithm:key_algorithm ->
    ?tags:tag list ->
      ?certificate_authority_arn:string ->
        ?options:certificate_options ->
          ?domain_validation_options:domain_validation_option list ->
            ?idempotency_token:string ->
              ?subject_alternative_names:string list ->
                ?validation_method:validation_method ->
                  domain_name:string -> unit -> request_certificate_request
val make_domain_validation :
  ?validation_method:validation_method ->
    ?resource_record:resource_record ->
      ?validation_status:domain_status ->
        ?validation_domain:string ->
          ?validation_emails:string list ->
            domain_name:string -> unit -> domain_validation
val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
    updated_at:CoreTypes.Timestamp.t ->
      domain_validation_options:domain_validation list ->
        renewal_status:renewal_status -> unit -> renewal_summary
val make_renew_certificate_request :
  certificate_arn:string -> unit -> renew_certificate_request
val make_remove_tags_from_certificate_request :
  tags:tag list ->
    certificate_arn:string -> unit -> remove_tags_from_certificate_request
val make_expiry_events_configuration :
  ?days_before_expiry:int -> unit -> expiry_events_configuration
val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
    idempotency_token:string -> unit -> put_account_configuration_request
val make_list_tags_for_certificate_response :
  ?tags:tag list -> unit -> list_tags_for_certificate_response
val make_list_tags_for_certificate_request :
  certificate_arn:string -> unit -> list_tags_for_certificate_request
val make_certificate_summary :
  ?revoked_at:CoreTypes.Timestamp.t ->
    ?imported_at:CoreTypes.Timestamp.t ->
      ?issued_at:CoreTypes.Timestamp.t ->
        ?created_at:CoreTypes.Timestamp.t ->
          ?not_after:CoreTypes.Timestamp.t ->
            ?not_before:CoreTypes.Timestamp.t ->
              ?renewal_eligibility:renewal_eligibility ->
                ?exported:bool ->
                  ?in_use:bool ->
                    ?extended_key_usages:extended_key_usage_name list ->
                      ?key_usages:key_usage_name list ->
                        ?key_algorithm:key_algorithm ->
                          ?type_:certificate_type ->
                            ?status:certificate_status ->
                              ?has_additional_subject_alternative_names:bool
                                ->
                                ?subject_alternative_name_summaries:string
                                  list ->
                                  ?domain_name:string ->
                                    ?certificate_arn:string ->
                                      unit -> certificate_summary
val make_list_certificates_response :
  ?certificate_summary_list:certificate_summary list ->
    ?next_token:string -> unit -> list_certificates_response
val make_filters :
  ?key_types:key_algorithm list ->
    ?key_usage:key_usage_name list ->
      ?extended_key_usage:extended_key_usage_name list -> unit -> filters
val make_list_certificates_request :
  ?sort_order:sort_order ->
    ?sort_by:sort_by ->
      ?max_items:int ->
        ?next_token:string ->
          ?includes:filters ->
            ?certificate_statuses:certificate_status list ->
              unit -> list_certificates_request
val make_key_usage : ?name:key_usage_name -> unit -> key_usage
val make_import_certificate_response :
  ?certificate_arn:string -> unit -> import_certificate_response
val make_import_certificate_request :
  ?tags:tag list ->
    ?certificate_chain:bytes ->
      ?certificate_arn:string ->
        private_key:bytes ->
          certificate:bytes -> unit -> import_certificate_request
val make_get_certificate_response :
  ?certificate_chain:string ->
    ?certificate:string -> unit -> get_certificate_response
val make_get_certificate_request :
  certificate_arn:string -> unit -> get_certificate_request
val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration ->
    unit -> get_account_configuration_response
val make_extended_key_usage :
  ?oi_d:string -> ?name:extended_key_usage_name -> unit -> extended_key_usage
val make_export_certificate_response :
  ?private_key:string ->
    ?certificate_chain:string ->
      ?certificate:string -> unit -> export_certificate_response
val make_export_certificate_request :
  passphrase:bytes ->
    certificate_arn:string -> unit -> export_certificate_request
val make_certificate_detail :
  ?options:certificate_options ->
    ?renewal_eligibility:renewal_eligibility ->
      ?certificate_authority_arn:string ->
        ?extended_key_usages:extended_key_usage list ->
          ?key_usages:key_usage list ->
            ?renewal_summary:renewal_summary ->
              ?type_:certificate_type ->
                ?failure_reason:failure_reason ->
                  ?in_use_by:string list ->
                    ?signature_algorithm:string ->
                      ?key_algorithm:key_algorithm ->
                        ?not_after:CoreTypes.Timestamp.t ->
                          ?not_before:CoreTypes.Timestamp.t ->
                            ?revocation_reason:revocation_reason ->
                              ?revoked_at:CoreTypes.Timestamp.t ->
                                ?status:certificate_status ->
                                  ?imported_at:CoreTypes.Timestamp.t ->
                                    ?issued_at:CoreTypes.Timestamp.t ->
                                      ?created_at:CoreTypes.Timestamp.t ->
                                        ?issuer:string ->
                                          ?subject:string ->
                                            ?serial:string ->
                                              ?domain_validation_options:domain_validation
                                                list ->
                                                ?subject_alternative_names:string
                                                  list ->
                                                  ?domain_name:string ->
                                                    ?certificate_arn:string
                                                      ->
                                                      unit ->
                                                        certificate_detail
val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit -> describe_certificate_response
val make_describe_certificate_request :
  certificate_arn:string -> unit -> describe_certificate_request
val make_delete_certificate_request :
  certificate_arn:string -> unit -> delete_certificate_request
val make_add_tags_to_certificate_request :
  tags:tag list ->
    certificate_arn:string -> unit -> add_tags_to_certificate_request(** {1:operations Operations} *)

module AddTagsToCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to an ACM certificate. Tags are labels that you can use to identify and organize your Amazon Web Services resources. Each tag consists of a [key] and an optional [value]. You specify the certificate on input by its Amazon Resource Name (ARN). You specify the tag by using a key-value pair.
    
     You can apply a tag to just one certificate if you want to identify a specific characteristic of that certificate, or you can apply the same tag to multiple certificates if you want to filter for a common relationship among those certificates. Similarly, you can apply the same tag to multiple resources if you want to specify a relationship among those resources. For example, you can add the same tag to an ACM certificate and an Elastic Load Balancing load balancer to indicate that they are both used by the same website. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/tags.html}Tagging ACM certificates}.
     
      To remove one or more tags, use the [RemoveTagsFromCertificate] action. To view all of the tags that have been applied to the certificate, use the [ListTagsForCertificate] action.
       *)

  
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InvalidArnException of invalid_arn_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Deletes a certificate and its associated private key. If this action succeeds, the certificate no longer appears in the list that can be displayed by calling the [ListCertificates] action or be retrieved by calling the [GetCertificate] action. The certificate will not be available for use by Amazon Web Services services integrated with ACM.
    
     You cannot delete an ACM certificate that is being used by another Amazon Web Services service. To delete a certificate that is in use, the certificate association must first be removed.
     
      *)

  
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns detailed metadata about the specified ACM certificate.
    
     If you have just created a certificate using the [RequestCertificate] action, there is a delay of several seconds before you can retrieve information about it.
      *)

  
end

module ExportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      export_certificate_request ->
        (export_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Exports a private certificate issued by a private certificate authority (CA) for use anywhere. The exported file contains the certificate, the certificate chain, and the encrypted private 2048-bit RSA key associated with the public key that is embedded in the certificate. For security, you must assign a passphrase for the private key when exporting it.
    
     For information about exporting and formatting a certificate using the ACM console or CLI, see {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-export-private.html}Export a Private Certificate}.
      *)

  
end

module GetAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_account_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Returns the account configuration options associated with an Amazon Web Services account.
     *)

  
end

module GetCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificate_request ->
        (get_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves an Amazon-issued certificate and its certificate chain. The chain consists of the certificate of the issuing CA and the intermediate certificates of any other subordinate CAs. All of the certificates are base64 encoded. You can use {{:https://wiki.openssl.org/index.php/Command_Line_Utilities}OpenSSL} to decode the certificates and inspect individual fields.
     *)

  
end

module ImportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      import_certificate_request ->
        (import_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Imports a certificate into Certificate Manager (ACM) to use with services that are integrated with ACM. Note that {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html}integrated services} allow only certificate types and keys they support to be associated with their resources. Further, their support differs depending on whether the certificate is imported into IAM or into ACM. For more information, see the documentation for each service. For more information about importing certificates into ACM, see {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing Certificates} in the {i Certificate Manager User Guide}.
    
     ACM does not provide {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for certificates that you import.
     
      Note the following guidelines when importing third party certificates:
      
       {ul
            {- You must enter the private key that matches the certificate you are importing.
               
               }
             {- The private key must be unencrypted. You cannot import a private key that is protected by a password or a passphrase.
                
                }
             {- The private key must be no larger than 5 KB (5,120 bytes).
                
                }
             {- If the certificate you are importing is not self-signed, you must enter its certificate chain.
                
                }
             {- If a certificate chain is included, the issuer must be the subject of one of the certificates in the chain.
                
                }
             {- The certificate, private key, and certificate chain must be PEM-encoded.
                
                }
             {- The current time must be between the [Not Before] and [Not
            After] certificate fields.
                
                }
             {- The [Issuer] field must not be empty.
                
                }
             {- The OCSP authority URL, if present, must not exceed 1000 characters.
                
                }
             {- To import a new certificate, omit the [CertificateArn] argument. Include this argument only when you want to replace a previously imported certificate.
                
                }
             {- When you import a certificate by using the CLI, you must specify the certificate, the certificate chain, and the private key by their file names preceded by [fileb://]. For example, you can specify a certificate saved in the [C:\temp] folder as [fileb://C:\temp\certificate_to_import.pem]. If you are making an HTTP or HTTPS Query request, include these arguments as BLOBs.
                
                }
             {- When you import a certificate by using an SDK, you must specify the certificate, the certificate chain, and the private key files in the manner required by the programming language you're using.
                
                }
             {- The cryptographic algorithm of an imported certificate must match the algorithm of the signing CA. For example, if the signing CA key type is RSA, then the certificate key type must also be RSA.
                
                }
            
      }
       This operation returns the {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Name (ARN)} of the imported certificate.
        *)

  
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgsException of invalid_args_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Retrieves a list of certificate ARNs and domain names. You can request that only certificates that match a specific status be listed. You can also filter by specific attributes of the certificate. Default filtering returns only [RSA_2048] certificates. For more information, see [Filters].
     *)

  
end

module ListTagsForCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_certificate_request ->
        (list_tags_for_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists the tags that have been applied to the ACM certificate. Use the certificate's Amazon Resource Name (ARN) to specify the certificate. To add a tag to an ACM certificate, use the [AddTagsToCertificate] action. To delete a tag, use the [RemoveTagsFromCertificate] action.
     *)

  
end

module PutAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_account_configuration_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Adds or modifies account-level configurations in ACM.
    
     The supported configuration option is [DaysBeforeExpiry]. This option specifies the number of days prior to certificate expiration when ACM starts generating [EventBridge] events. ACM sends one event per day per certificate until the certificate expires. By default, accounts receive events starting 45 days before certificate expiration.
      *)

  
end

module RemoveTagsFromCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
  (** 
    Remove one or more tags from an ACM certificate. A tag consists of a key-value pair. If you do not specify the value portion of the tag when calling this function, the tag will be removed regardless of value. If you specify a value, the tag is removed only if it is associated with the specified value.
    
     To add tags to a certificate, use the [AddTagsToCertificate] action. To view all of the tags that have been applied to a specific ACM certificate, use the [ListTagsForCertificate] action.
      *)

  
end

module RenewCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      renew_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Renews an eligible ACM certificate. At this time, only exported private certificates can be renewed with this operation. In order to renew your Amazon Web Services Private CA certificates with ACM, you must first {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaPermissions.html}grant the ACM service principal permission to do so}. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/manual-renewal.html}Testing Managed Renewal} in the ACM User Guide.
     *)

  
end

module RequestCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      request_certificate_request ->
        (request_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Requests an ACM certificate for use with other Amazon Web Services services. To request an ACM certificate, you must specify a fully qualified domain name (FQDN) in the [DomainName] parameter. You can also specify additional FQDNs in the [SubjectAlternativeNames] parameter.
    
     If you are requesting a private certificate, domain validation is not required. If you are requesting a public certificate, each domain name that you specify must be validated to verify that you own or control the domain. You can use {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}DNS validation} or {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html}email validation}. We recommend that you use DNS validation. ACM issues public certificates after receiving approval from the domain owner.
     
      ACM behavior differs from the {{:https://datatracker.ietf.org/doc/html/rfc6125#appendix-B.2}RFC 6125} specification of the certificate validation process. ACM first checks for a Subject Alternative Name, and, if it finds one, ignores the common name (CN).
      
       After successful completion of the [RequestCertificate] action, there is a delay of several seconds before you can retrieve information about the new certificate.
        *)

  
end

module ResendValidationEmail : sig
  val request :
    Smaws_Lib.Context.t ->
      resend_validation_email_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Resends the email that requests domain ownership validation. The domain owner or an authorized representative must approve the ACM certificate before it can be issued. The certificate can be approved by clicking a link in the mail to navigate to the Amazon certificate approval website and then clicking {b I Approve}. However, the validation email can be blocked by spam filters. Therefore, if you do not receive the original mail, you can request that the mail be resent within 72 hours of requesting the ACM certificate. If more than 72 hours have elapsed since your original request or since your last attempt to resend validation mail, you must request a new certificate. For more information about setting up your contact email addresses, see {{:https://docs.aws.amazon.com/acm/latest/userguide/setup-email.html}Configure Email for your Domain}.
     *)

  
end

module UpdateCertificateOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_certificate_options_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates a certificate. Currently, you can use this function to specify whether to opt in to or out of recording your certificate in a certificate transparency log. For more information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency}Opting Out of Certificate Transparency Logging}.
     *)

  
end

