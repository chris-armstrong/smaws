open Types

module AddTagsToCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an ACM certificate. Tags are labels that you can use to identify and \
   organize your Amazon Web Services resources. Each tag consists of a [key] and an optional \
   [value]. You specify the certificate on input by its Amazon Resource Name (ARN). You specify \
   the tag by using a key-value pair. \n\n\
  \ You can apply a tag to just one certificate if you want to identify a specific characteristic \
   of that certificate, or you can apply the same tag to multiple certificates if you want to \
   filter for a common relationship among those certificates. Similarly, you can apply the same \
   tag to multiple resources if you want to specify a relationship among those resources. For \
   example, you can add the same tag to an ACM certificate and an Elastic Load Balancing load \
   balancer to indicate that they are both used by the same website. For more information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/tags.html}Tagging ACM certificates}. \n\
  \ \n\
  \  To remove one or more tags, use the [RemoveTagsFromCertificate] action. To view all of the \
   tags that have been applied to the certificate, use the [ListTagsForCertificate] action. \n\
  \  "]

module DeleteCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InvalidArnException of invalid_arn_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a certificate and its associated private key. If this action succeeds, the certificate \
   no longer appears in the list that can be displayed by calling the [ListCertificates] action or \
   be retrieved by calling the [GetCertificate] action. The certificate will not be available for \
   use by Amazon Web Services services integrated with ACM. \n\n\
  \  You cannot delete an ACM certificate that is being used by another Amazon Web Services \
   service. To delete a certificate that is in use, the certificate association must first be \
   removed.\n\
  \  \n\
  \   "]

module DescribeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Returns detailed metadata about the specified ACM certificate.\n\n\
  \ If you have just created a certificate using the [RequestCertificate] action, there is a delay \
   of several seconds before you can retrieve information about it.\n\
  \ "]

module ExportCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_certificate_request ->
    ( export_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Exports a private certificate issued by a private certificate authority (CA) or public \
   certificate for use anywhere. The exported file contains the certificate, the certificate \
   chain, and the encrypted private key associated with the public key that is embedded in the \
   certificate. For security, you must assign a passphrase for the private key when exporting it. \
   \n\n\
  \ For information about exporting and formatting a certificate using the ACM console or CLI, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/export-private.html}Export a private \
   certificate} and \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/export-public-certificate}Export a public \
   certificate}.\n\
  \ "]

module GetAccountConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Returns the account configuration options associated with an Amazon Web Services account.\n"]

module GetCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_request ->
    ( get_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves a certificate and its certificate chain. The certificate may be either a public or \
   private certificate issued using the ACM [RequestCertificate] action, or a certificate imported \
   into ACM using the [ImportCertificate] action. The chain consists of the certificate of the \
   issuing CA and the intermediate certificates of any other subordinate CAs. All of the \
   certificates are base64 encoded. You can use \
   {{:https://wiki.openssl.org/index.php/Command_Line_Utilities}OpenSSL} to decode the \
   certificates and inspect individual fields.\n"]

module ImportCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_request ->
    ( import_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Imports a certificate into Certificate Manager (ACM) to use with services that are integrated \
   with ACM. Note that \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html}integrated services} \
   allow only certificate types and keys they support to be associated with their resources. \
   Further, their support differs depending on whether the certificate is imported into IAM or \
   into ACM. For more information, see the documentation for each service. For more information \
   about importing certificates into ACM, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
   Certificates} in the {i Certificate Manager User Guide}. \n\n\
  \  ACM does not provide \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html}managed renewal} for \
   certificates that you import.\n\
  \  \n\
  \    Note the following guidelines when importing third party certificates:\n\
  \    \n\
  \     {ul\n\
  \           {-  You must enter the private key that matches the certificate you are importing.\n\
  \               \n\
  \                }\n\
  \           {-  The private key must be unencrypted. You cannot import a private key that is \
   protected by a password or a passphrase.\n\
  \               \n\
  \                }\n\
  \           {-  The private key must be no larger than 5 KB (5,120 bytes).\n\
  \               \n\
  \                }\n\
  \           {-  The certificate, private key, and certificate chain must be PEM-encoded.\n\
  \               \n\
  \                }\n\
  \           {-  The current time must be between the [Not Before] and [Not After] certificate \
   fields.\n\
  \               \n\
  \                }\n\
  \           {-  The [Issuer] field must not be empty.\n\
  \               \n\
  \                }\n\
  \           {-  The OCSP authority URL, if present, must not exceed 1000 characters.\n\
  \               \n\
  \                }\n\
  \           {-  To import a new certificate, omit the [CertificateArn] argument. Include this \
   argument only when you want to replace a previously imported certificate.\n\
  \               \n\
  \                }\n\
  \           {-  When you import a certificate by using the CLI, you must specify the \
   certificate, the certificate chain, and the private key by their file names preceded by \
   [fileb://]. For example, you can specify a certificate saved in the [C:\\temp] folder as \
   [fileb://C:\\temp\\certificate_to_import.pem]. If you are making an HTTP or HTTPS Query \
   request, include these arguments as BLOBs. \n\
  \               \n\
  \                }\n\
  \           {-  When you import a certificate by using an SDK, you must specify the certificate, \
   the certificate chain, and the private key files in the manner required by the programming \
   language you're using. \n\
  \               \n\
  \                }\n\
  \           {-  The cryptographic algorithm of an imported certificate must match the algorithm \
   of the signing CA. For example, if the signing CA key type is RSA, then the certificate key \
   type must also be RSA.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   This operation returns the \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource \
   Name (ARN)} of the imported certificate.\n\
  \   "]

module ListCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgsException of invalid_args_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves a list of certificate ARNs and domain names. You can request that only certificates \
   that match a specific status be listed. You can also filter by specific attributes of the \
   certificate. Default filtering returns only [RSA_2048] certificates. For more information, see \
   [Filters].\n"]

module ListTagsForCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_certificate_request ->
    ( list_tags_for_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Lists the tags that have been applied to the ACM certificate. Use the certificate's Amazon \
   Resource Name (ARN) to specify the certificate. To add a tag to an ACM certificate, use the \
   [AddTagsToCertificate] action. To delete a tag, use the [RemoveTagsFromCertificate] action. \n"]

module PutAccountConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_account_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Adds or modifies account-level configurations in ACM. \n\n\
  \ The supported configuration option is [DaysBeforeExpiry]. This option specifies the number of \
   days prior to certificate expiration when ACM starts generating [EventBridge] events. ACM sends \
   one event per day per certificate until the certificate expires. By default, accounts receive \
   events starting 45 days before certificate expiration.\n\
  \ "]

module RemoveTagsFromCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Remove one or more tags from an ACM certificate. A tag consists of a key-value pair. If you do \
   not specify the value portion of the tag when calling this function, the tag will be removed \
   regardless of value. If you specify a value, the tag is removed only if it is associated with \
   the specified value. \n\n\
  \ To add tags to a certificate, use the [AddTagsToCertificate] action. To view all of the tags \
   that have been applied to a specific ACM certificate, use the [ListTagsForCertificate] action. \n\
  \ "]

module RenewCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    renew_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Renews an {{:https://docs.aws.amazon.com/acm/latest/userguide/managed-renewal.html}eligible ACM \
   certificate}. In order to renew your Amazon Web Services Private CA certificates with ACM, you \
   must first {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaPermissions.html}grant \
   the ACM service principal permission to do so}. For more information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/manual-renewal.html}Testing Managed \
   Renewal} in the ACM User Guide.\n"]

module RequestCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagException of invalid_tag_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    request_certificate_request ->
    ( request_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Requests an ACM certificate for use with other Amazon Web Services services. To request an ACM \
   certificate, you must specify a fully qualified domain name (FQDN) in the [DomainName] \
   parameter. You can also specify additional FQDNs in the [SubjectAlternativeNames] parameter. \n\n\
  \ If you are requesting a private certificate, domain validation is not required. If you are \
   requesting a public certificate, each domain name that you specify must be validated to verify \
   that you own or control the domain. You can use \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html}DNS validation} or \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html}email \
   validation}. We recommend that you use DNS validation.\n\
  \ \n\
  \   ACM behavior differs from the \
   {{:https://datatracker.ietf.org/doc/html/rfc6125#appendix-B.2}RFC 6125} specification of the \
   certificate validation process. ACM first checks for a Subject Alternative Name, and, if it \
   finds one, ignores the common name (CN).\n\
  \   \n\
  \     After successful completion of the [RequestCertificate] action, there is a delay of \
   several seconds before you can retrieve information about the new certificate.\n\
  \     "]

module ResendValidationEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resend_validation_email_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Resends the email that requests domain ownership validation. The domain owner or an authorized \
   representative must approve the ACM certificate before it can be issued. The certificate can be \
   approved by clicking a link in the mail to navigate to the Amazon certificate approval website \
   and then clicking {b I Approve}. However, the validation email can be blocked by spam filters. \
   Therefore, if you do not receive the original mail, you can request that the mail be resent \
   within 72 hours of requesting the ACM certificate. If more than 72 hours have elapsed since \
   your original request or since your last attempt to resend validation mail, you must request a \
   new certificate. For more information about setting up your contact email addresses, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/setup-email.html}Configure Email for your \
   Domain}. \n"]

module RevokeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InvalidArnException of invalid_arn_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_certificate_request ->
    ( revoke_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result
end
[@@ocaml.doc
  "Revokes a public ACM certificate. You can only revoke certificates that have been previously \
   exported.\n"]

module UpdateCertificateOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_options_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Updates a certificate. You can use this function to specify whether to opt in to or out of \
   recording your certificate in a certificate transparency log and exporting. For more \
   information, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency} \
   Opting Out of Certificate Transparency Logging} and \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html}Certificate \
   Manager Exportable Managed Certificates}.\n"]
