type nonrec string_ = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "A resource such as a private CA, S3 bucket, certificate, audit report, or policy cannot be found.\n"]

type nonrec invalid_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The state of the private CA does not allow this action to occur.\n"]

type nonrec invalid_policy_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource policy is invalid or is missing a required statement. For general information \
   about IAM policy and statement structure, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policies-json}Overview \
   of JSON Policies}.\n"]

type nonrec invalid_arn_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The requested Amazon Resource Name (ARN) does not refer to an existing resource.\n"]

type nonrec invalid_args_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "One or more of the specified arguments was not valid.\n"]

type nonrec concurrent_modification_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "A previous update to your private CA is still ongoing.\n"]

type nonrec certificate_authority_status =
  | CREATING [@ocaml.doc ""]
  | PENDING_CERTIFICATE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cname_string = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec ocsp_configuration = {
  enabled : boolean_;
      [@ocaml.doc
        "Flag enabling use of the Online Certificate Status Protocol (OCSP) for validating \
         certificate revocation status.\n"]
  ocsp_custom_cname : cname_string option;
      [@ocaml.doc
        "By default, Amazon Web Services Private CA injects an Amazon Web Services domain into \
         certificates being validated by the Online Certificate Status Protocol (OCSP). A customer \
         can alternatively use this object to define a CNAME specifying a customized OCSP domain.\n\n\
        \  The content of a Canonical Name (CNAME) record must conform to \
         {{:https://www.ietf.org/rfc/rfc2396.txt}RFC2396} restrictions on the use of special \
         characters in URIs. Additionally, the value of the CNAME must not include a protocol \
         prefix such as \"http://\" or \"https://\".\n\
        \  \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/ocsp-customize.html}Customizing \
         Online Certificate Status Protocol (OCSP) } in the {i Amazon Web Services Private \
         Certificate Authority User Guide}.\n\
        \    "]
}
[@@ocaml.doc
  "Contains information to enable and configure Online Certificate Status Protocol (OCSP) for \
   validating certificate revocation status.\n\n\
  \ When you revoke a certificate, OCSP responses may take up to 60 minutes to reflect the new \
   status.\n\
  \ "]

type nonrec crl_path_string = string [@@ocaml.doc ""]

type nonrec crl_type = COMPLETE [@ocaml.doc ""] | PARTITIONED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec crl_distribution_point_extension_configuration = {
  omit_extension : boolean_;
      [@ocaml.doc
        "Configures whether the CRL Distribution Point extension should be populated with the \
         default URL to the CRL. If set to [true], then the CDP extension will not be present in \
         any certificates issued by that CA unless otherwise specified through CSR or API \
         passthrough.\n\n\
        \  Only set this if you have another way to distribute the CRL Distribution Points ffor \
         certificates issued by your CA, such as the Matter Distributed Compliance Ledger\n\
        \  \n\
        \   This configuration cannot be enabled with a custom CNAME set.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc
  "Contains configuration information for the default behavior of the CRL Distribution Point (CDP) \
   extension in certificates issued by your CA. This extension contains a link to download the \
   CRL, so you can check whether a certificate has been revoked. To choose whether you want this \
   extension omitted or not in certificates issued by your CA, you can set the {b OmitExtension} \
   parameter.\n"]

type nonrec s3_object_acl =
  | PUBLIC_READ [@ocaml.doc ""]
  | BUCKET_OWNER_FULL_CONTROL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_bucket_name3_to255 = string [@@ocaml.doc ""]

type nonrec integer1_to5000 = int [@@ocaml.doc ""]

type nonrec crl_configuration = {
  enabled : boolean_;
      [@ocaml.doc
        "Boolean value that specifies whether certificate revocation lists (CRLs) are enabled. You \
         can use this value to enable certificate revocation for a new CA when you call the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
         action or for an existing CA when you call the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html}UpdateCertificateAuthority} \
         action. \n"]
  expiration_in_days : integer1_to5000 option; [@ocaml.doc "Validity period of the CRL in days.\n"]
  custom_cname : cname_string option;
      [@ocaml.doc
        "Name inserted into the certificate {b CRL Distribution Points} extension that enables the \
         use of an alias for the CRL distribution point. Use this value if you don't want the name \
         of your S3 bucket to be public.\n\n\
        \  The content of a Canonical Name (CNAME) record must conform to \
         {{:https://www.ietf.org/rfc/rfc2396.txt}RFC2396} restrictions on the use of special \
         characters in URIs. Additionally, the value of the CNAME must not include a protocol \
         prefix such as \"http://\" or \"https://\".\n\
        \  \n\
        \   "]
  s3_bucket_name : s3_bucket_name3_to255 option;
      [@ocaml.doc
        "Name of the S3 bucket that contains the CRL. If you do not provide a value for the {b \
         CustomCname} argument, the name of your S3 bucket is placed into the {b CRL Distribution \
         Points} extension of the issued certificate. You can change the name of your bucket by \
         calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html}UpdateCertificateAuthority} \
         operation. You must specify a \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaCreateCa.html#s3-policies}bucket \
         policy} that allows Amazon Web Services Private CA to write the CRL to your bucket.\n\n\
        \  The [S3BucketName] parameter must conform to the \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}S3 bucket \
         naming rules}.\n\
        \  \n\
        \   "]
  s3_object_acl : s3_object_acl option;
      [@ocaml.doc
        "Determines whether the CRL will be publicly readable or privately held in the CRL Amazon \
         S3 bucket. If you choose PUBLIC_READ, the CRL will be accessible over the public \
         internet. If you choose BUCKET_OWNER_FULL_CONTROL, only the owner of the CRL S3 bucket \
         can access the CRL, and your PKI clients may need an alternative method of access. \n\n\
        \ If no value is specified, the default is [PUBLIC_READ].\n\
        \ \n\
        \   {i Note:} This default can cause CA creation to fail in some circumstances. If you \
         have have enabled the Block Public Access (BPA) feature in your S3 account, then you must \
         specify the value of this parameter as [BUCKET_OWNER_FULL_CONTROL], and not doing so \
         results in an error. If you have disabled BPA in S3, then you can specify either \
         [BUCKET_OWNER_FULL_CONTROL] or [PUBLIC_READ] as the value.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaCreateCa.html#s3-bpa}Blocking \
         public access to the S3 bucket}.\n\
        \   "]
  crl_distribution_point_extension_configuration :
    crl_distribution_point_extension_configuration option;
      [@ocaml.doc
        "Configures the behavior of the CRL Distribution Point extension for certificates issued \
         by your certificate authority. If this field is not provided, then the CRl Distribution \
         Point Extension will be present and contain the default CRL URL.\n"]
  crl_type : crl_type option;
      [@ocaml.doc
        "Specifies whether to create a complete or partitioned CRL. This setting determines the \
         maximum number of certificates that the certificate authority can issue and revoke. For \
         more information, see {{:privateca/latest/userguide/pca.html#limits_pca}Amazon Web \
         Services Private CA quotas}.\n\n\
        \ {ul\n\
        \       {-   [COMPLETE] - The default setting. Amazon Web Services Private CA maintains a \
         single CRL \239\172\129le for all unexpired certi\239\172\129cates issued by a CA that \
         have been revoked for any reason. Each certi\239\172\129cate that Amazon Web Services \
         Private CA issues is bound to a speci\239\172\129c CRL through its CRL distribution point \
         (CDP) extension, de\239\172\129ned in \
         {{:https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.9} RFC 5280}.\n\
        \           \n\
        \            }\n\
        \       {-   [PARTITIONED] - Compared to complete CRLs, partitioned CRLs dramatically \
         increase the number of certi\239\172\129cates your private CA can issue. \n\
        \           \n\
        \              When using partitioned CRLs, you must validate that the CRL's associated \
         issuing distribution point (IDP) URI matches the certi\239\172\129cate's CDP URI to \
         ensure the right CRL has been fetched. Amazon Web Services Private CA marks the IDP \
         extension as critical, which your client must be able to process. \n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  custom_path : crl_path_string option;
      [@ocaml.doc
        "Designates a custom \239\172\129le path in S3 for CRL(s). For example, \
         [http://<CustomName>/ <CustomPath>/<CrlPartition_GUID>.crl]. \n"]
}
[@@ocaml.doc
  "Contains configuration information for a certificate revocation list (CRL). Your private \
   certificate authority (CA) creates base CRLs. Delta CRLs are not supported. You can enable CRLs \
   for your new or an existing private CA by setting the {b Enabled} parameter to [true]. Your \
   private CA writes CRLs to an S3 bucket that you specify in the {b S3BucketName} parameter. You \
   can hide the name of your bucket by specifying a value for the {b CustomCname} parameter. Your \
   private CA by default copies the CNAME or the S3 bucket name to the {b CRL Distribution Points} \
   extension of each certificate it issues. If you want to configure this default behavior to be \
   something different, you can set the {b CrlDistributionPointExtensionConfiguration} parameter. \
   Your S3 bucket policy must give write permission to Amazon Web Services Private CA. \n\n\
  \ Amazon Web Services Private CA assets that are stored in Amazon S3 can be protected with \
   encryption. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#crl-encryption}Encrypting \
   Your CRLs}.\n\
  \ \n\
  \  Your private CA uses the value in the {b ExpirationInDays} parameter to calculate the {b \
   nextUpdate} field in the CRL. The CRL is refreshed prior to a certificate's expiration date or \
   when a certificate is revoked. When a certificate is revoked, it appears in the CRL until the \
   certificate expires, and then in one additional CRL after expiration, and it always appears in \
   the audit report.\n\
  \  \n\
  \   A CRL is typically updated approximately 30 minutes after a certificate is revoked. If for \
   any reason a CRL update fails, Amazon Web Services Private CA makes further attempts every 15 \
   minutes.\n\
  \   \n\
  \    CRLs contain the following fields:\n\
  \    \n\
  \     {ul\n\
  \           {-   {b Version}: The current version number defined in RFC 5280 is V2. The integer \
   value is 0x1. \n\
  \               \n\
  \                }\n\
  \           {-   {b Signature Algorithm}: The name of the algorithm used to sign the CRL.\n\
  \               \n\
  \                }\n\
  \           {-   {b Issuer}: The X.500 distinguished name of your private CA that issued the CRL.\n\
  \               \n\
  \                }\n\
  \           {-   {b Last Update}: The issue date and time of this CRL.\n\
  \               \n\
  \                }\n\
  \           {-   {b Next Update}: The day and time by which the next CRL will be issued.\n\
  \               \n\
  \                }\n\
  \           {-   {b Revoked Certificates}: List of revoked certificates. Each list item contains \
   the following information.\n\
  \               \n\
  \                {ul\n\
  \                      {-   {b Serial Number}: The serial number, in hexadecimal format, of the \
   revoked certificate.\n\
  \                          \n\
  \                           }\n\
  \                      {-   {b Revocation Date}: Date and time the certificate was revoked.\n\
  \                          \n\
  \                           }\n\
  \                      {-   {b CRL Entry Extensions}: Optional extensions for the CRL entry.\n\
  \                          \n\
  \                           {ul\n\
  \                                 {-   {b X509v3 CRL Reason Code}: Reason the certificate was \
   revoked.\n\
  \                                     \n\
  \                                      }\n\
  \                                 \n\
  \                       }\n\
  \                        }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           {-   {b CRL Extensions}: Optional extensions for the CRL.\n\
  \               \n\
  \                {ul\n\
  \                      {-   {b X509v3 Authority Key Identifier}: Identifies the public key \
   associated with the private key used to sign the certificate.\n\
  \                          \n\
  \                           }\n\
  \                      {-   {b X509v3 CRL Number:}: Decimal sequence number for the CRL.\n\
  \                          \n\
  \                           }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           {-   {b Signature Algorithm}: Algorithm used by your private CA to sign the CRL.\n\
  \               \n\
  \                }\n\
  \           {-   {b Signature Value}: Signature computed over the CRL.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Certificate revocation lists created by Amazon Web Services Private CA are DER-encoded. You \
   can use the following OpenSSL command to list a CRL.\n\
  \   \n\
  \     \n\
  \    {[\n\
  \    openssl crl -inform DER -text -in {i crl_path} -noout\n\
  \    ]}\n\
  \     \n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html}Planning a \
   certificate revocation list (CRL)} in the {i Amazon Web Services Private Certificate Authority \
   User Guide} \n\
  \     "]

type nonrec revocation_configuration = {
  crl_configuration : crl_configuration option;
      [@ocaml.doc
        "Configuration of the certificate revocation list (CRL), if any, maintained by your \
         private CA. A CRL is typically updated approximately 30 minutes after a certificate is \
         revoked. If for any reason a CRL update fails, Amazon Web Services Private CA makes \
         further attempts every 15 minutes.\n"]
  ocsp_configuration : ocsp_configuration option;
      [@ocaml.doc
        "Configuration of Online Certificate Status Protocol (OCSP) support, if any, maintained by \
         your private CA. When you revoke a certificate, OCSP responses may take up to 60 minutes \
         to reflect the new status.\n"]
}
[@@ocaml.doc
  "Certificate revocation information used by the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
   and \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html}UpdateCertificateAuthority} \
   actions. Your private certificate authority (CA) can configure Online Certificate Status \
   Protocol (OCSP) support and/or maintain a certificate revocation list (CRL). OCSP returns \
   validation information about certificates as requested by clients, and a CRL contains an \
   updated list of certificates revoked by your CA. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_RevokeCertificate.html}RevokeCertificate} \
   and {{:https://docs.aws.amazon.com/privateca/latest/userguide/revocation-setup.html}Setting up \
   a certificate revocation method} in the {i Amazon Web Services Private Certificate Authority \
   User Guide}.\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec update_certificate_authority_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the private CA that issued the certificate to be revoked. \
         This must be of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
  revocation_configuration : revocation_configuration option;
      [@ocaml.doc
        "Contains information to enable support for Online Certificate Status Protocol (OCSP), \
         certificate revocation list (CRL), both protocols, or neither. If you don't supply this \
         parameter, existing capibilites remain unchanged. For more information, see the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_OcspConfiguration.html}OcspConfiguration} \
         and \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CrlConfiguration.html}CrlConfiguration} \
         types.\n\n\
        \ The following requirements apply to revocation configurations.\n\
        \ \n\
        \  {ul\n\
        \        {-  A configuration disabling CRLs or OCSP must contain only the [Enabled=False] \
         parameter, and will fail if other parameters such as [CustomCname] or [ExpirationInDays] \
         are included.\n\
        \            \n\
        \             }\n\
        \        {-  In a CRL configuration, the [S3BucketName] parameter must conform to \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Amazon S3 \
         bucket naming rules}.\n\
        \            \n\
        \             }\n\
        \        {-  A configuration containing a custom Canonical Name (CNAME) parameter for CRLs \
         or OCSP must conform to {{:https://www.ietf.org/rfc/rfc2396.txt}RFC2396} restrictions on \
         the use of special characters in a CNAME. \n\
        \            \n\
        \             }\n\
        \        {-  In a CRL or OCSP configuration, the value of a CNAME parameter must not \
         include a protocol prefix such as \"http://\" or \"https://\".\n\
        \            \n\
        \             }\n\
        \        }\n\
        \     If you update the [S3BucketName] of \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CrlConfiguration.html}CrlConfiguration}, \
         you can break revocation for existing certificates. In other words, if you call \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html}UpdateCertificateAuthority} \
         to update the CRL configuration's S3 bucket name, Amazon Web Services Private CA only \
         writes CRLs to the new S3 bucket. Certificates issued prior to this point will have the \
         old S3 bucket name in your CRL Distribution Point (CDP) extension, essentially breaking \
         revocation. If you must update the S3 bucket, you'll need to reissue old certificates to \
         keep the revocation working. Alternatively, you can use a \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CrlConfiguration.html#privateca-Type-CrlConfiguration-CustomCname}CustomCname} \
         in your CRL configuration if you might need to change the S3 bucket name in the future.\n\
        \    \n\
        \     "]
  status : certificate_authority_status option; [@ocaml.doc "Status of your private CA.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_tag_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The tag associated with the CA is not valid. The invalid argument is contained in the message \
   field.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "Key (name) of the tag.\n"]
  value : tag_value option; [@ocaml.doc "Value of the tag.\n"]
}
[@@ocaml.doc
  "Tags are labels that you can use to identify and organize your private CAs. Each tag consists \
   of a key and an optional value. You can associate up to 50 tags with a private CA. To add one \
   or more tags to a private CA, call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_TagCertificateAuthority.html}TagCertificateAuthority} \
   action. To remove a tag, call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UntagCertificateAuthority.html}UntagCertificateAuthority} \
   action. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec untag_certificate_authority_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
  tags : tag_list; [@ocaml.doc "List of tags to be removed from the CA.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "You can associate up to 50 tags with a private CA. Exception information is contained in the \
   exception message field.\n"]

type nonrec tag_certificate_authority_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
  tags : tag_list; [@ocaml.doc "List of tags to be associated with the CA.\n"]
}
[@@ocaml.doc ""]

type nonrec request_in_progress_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Your request is already in progress.\n"]

type nonrec request_failed_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The request has failed for an unspecified reason.\n"]

type nonrec request_already_processed_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Your request has already been completed.\n"]

type nonrec limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "An Amazon Web Services Private CA quota has been exceeded. See the exception message returned \
   to determine the quota that was exceeded.\n"]

type nonrec invalid_request_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The request action cannot be performed or is prohibited.\n"]

type nonrec revocation_reason =
  | UNSPECIFIED [@ocaml.doc ""]
  | KEY_COMPROMISE [@ocaml.doc ""]
  | CERTIFICATE_AUTHORITY_COMPROMISE [@ocaml.doc ""]
  | AFFILIATION_CHANGED [@ocaml.doc ""]
  | SUPERSEDED [@ocaml.doc ""]
  | CESSATION_OF_OPERATION [@ocaml.doc ""]
  | PRIVILEGE_WITHDRAWN [@ocaml.doc ""]
  | A_A_COMPROMISE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string128 = string [@@ocaml.doc ""]

type nonrec revoke_certificate_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the private CA that issued the certificate to be revoked. \
         This must be of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
  certificate_serial : string128;
      [@ocaml.doc
        "Serial number of the certificate to be revoked. This must be in hexadecimal format. You \
         can retrieve the serial number by calling \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificate.html}GetCertificate} \
         with the Amazon Resource Name (ARN) of the certificate you want and the ARN of your \
         private CA. The {b GetCertificate} action retrieves the certificate in the PEM format. \
         You can use the following OpenSSL command to list the certificate in text format and copy \
         the hexadecimal serial number. \n\n\
        \  \n\
        \ {[\n\
        \ openssl x509 -in {i file_path} -text -noout\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  You can also copy the serial number from the console or use the \
         {{:https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html}DescribeCertificate} \
         action in the {i Certificate Manager API Reference}. \n\
        \  "]
  revocation_reason : revocation_reason; [@ocaml.doc "Specifies why you revoked the certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_certificate_authority_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
         action. This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec lockout_prevented_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The current action was prevented because it would lock the caller out from performing \
   subsequent actions. Verify that the specified parameters would not result in the caller being \
   denied access to the resource. \n"]

type nonrec aws_policy = string [@@ocaml.doc ""]

type nonrec put_policy_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the private CA to associate with the policy. The ARN \
         of the CA can be found by calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
         action.\n\n\
        \ \n\
        \ "]
  policy : aws_policy;
      [@ocaml.doc
        "The path and file name of a JSON-formatted IAM policy to attach to the specified private \
         CA resource. If this policy does not contain all required statements or if it includes \
         any statement that is not allowed, the [PutPolicy] action returns an \
         [InvalidPolicyException]. For information about IAM policy and statement structure, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policies-json}Overview \
         of JSON Policies}.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_tags_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When the list is truncated, this value is present and should be used for the {b \
         NextToken} parameter in a subsequent pagination request. \n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with your private CA.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Use this parameter when paginating results to specify the maximum number of items to \
         return in the response. If additional items exist beyond the number you specify, the {b \
         NextToken} element is sent in the response. Use this {b NextToken} value in a subsequent \
         request to retrieve additional items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter when paginating results in a subsequent request after you receive a \
         response with truncated results. Set it to the value of {b NextToken} from the response \
         you just received.\n"]
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
         action. This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The token specified in the [NextToken] argument is not valid. Use the token returned from your \
   previous call to \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities}.\n"]

type nonrec action_type =
  | IssueCertificate [@ocaml.doc ""]
  | GetCertificate [@ocaml.doc ""]
  | ListPermissions [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_list = action_type list [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec principal = string [@@ocaml.doc ""]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec permission = {
  certificate_authority_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the private CA from which the permission was issued.\n"]
  created_at : t_stamp option; [@ocaml.doc "The time at which the permission was created.\n"]
  principal : principal option;
      [@ocaml.doc
        "The Amazon Web Services service or entity that holds the permission. At this time, the \
         only valid principal is [acm.amazonaws.com].\n"]
  source_account : account_id option;
      [@ocaml.doc "The ID of the account that assigned the permission.\n"]
  actions : action_list option;
      [@ocaml.doc
        "The private CA actions that can be performed by the designated Amazon Web Services service.\n"]
  policy : aws_policy option;
      [@ocaml.doc "The name of the policy that is associated with the permission.\n"]
}
[@@ocaml.doc
  "Permissions designate which private CA actions can be performed by an Amazon Web Services \
   service or entity. In order for ACM to automatically renew private certificates, you must give \
   the ACM service principal all available permissions ([IssueCertificate], [GetCertificate], and \
   [ListPermissions]). Permissions can be assigned with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreatePermission.html}CreatePermission} \
   action, removed with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePermission.html}DeletePermission} \
   action, and listed with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListPermissions.html}ListPermissions} \
   action.\n"]

type nonrec permission_list = permission list [@@ocaml.doc ""]

type nonrec list_permissions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When the list is truncated, this value is present and should be used for the {b \
         NextToken} parameter in a subsequent pagination request. \n"]
  permissions : permission_list option;
      [@ocaml.doc
        "Summary information about each permission assigned by the specified private CA, including \
         the action enabled, the policy provided, and the time of creation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_permissions_request = {
  max_results : max_results option;
      [@ocaml.doc
        "When paginating results, use this parameter to specify the maximum number of items to \
         return in the response. If additional items exist beyond the number you specify, the {b \
         NextToken} element is sent in the response. Use this {b NextToken} value in a subsequent \
         request to retrieve additional items.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "When paginating results, use this parameter in a subsequent request after you receive a \
         response with truncated results. Set it to the value of {b NextToken} from the response \
         you just received.\n"]
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the private CA to inspect. You can find the ARN by \
         calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
         action. This must be of the form: \
         [arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012] \
         You can get a private CA's ARN by running the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
         action.\n"]
}
[@@ocaml.doc ""]

type nonrec certificate_authority_usage_mode =
  | GENERAL_PURPOSE [@ocaml.doc ""]
  | SHORT_LIVED_CERTIFICATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_storage_security_standard =
  | FIPS_140_2_LEVEL_2_OR_HIGHER [@ocaml.doc ""]
  | FIPS_140_2_LEVEL_3_OR_HIGHER [@ocaml.doc ""]
  | CCPC_LEVEL_1_OR_HIGHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec custom_object_identifier = string [@@ocaml.doc ""]

type nonrec string39 = string [@@ocaml.doc ""]

type nonrec string253 = string [@@ocaml.doc ""]

type nonrec string256 = string [@@ocaml.doc ""]

type nonrec edi_party_name = {
  party_name : string256; [@ocaml.doc "Specifies the party name.\n"]
  name_assigner : string256 option; [@ocaml.doc "Specifies the name assigner.\n"]
}
[@@ocaml.doc
  "Describes an Electronic Data Interchange (EDI) entity as described in as defined in \
   {{:https://datatracker.ietf.org/doc/html/rfc5280}Subject Alternative Name} in RFC 5280.\n"]

type nonrec string1_to256 = string [@@ocaml.doc ""]

type nonrec custom_attribute = {
  object_identifier : custom_object_identifier;
      [@ocaml.doc
        "Specifies the object identifier (OID) of the attribute type of the relative distinguished \
         name (RDN).\n"]
  value : string1_to256;
      [@ocaml.doc " \n\nSpecifies the attribute value of relative distinguished name (RDN).\n"]
}
[@@ocaml.doc "Defines the X.500 relative distinguished name (RDN).\n"]

type nonrec custom_attribute_list = custom_attribute list [@@ocaml.doc ""]

type nonrec string3 = string [@@ocaml.doc ""]

type nonrec string5 = string [@@ocaml.doc ""]

type nonrec string16 = string [@@ocaml.doc ""]

type nonrec string40 = string [@@ocaml.doc ""]

type nonrec string64 = string [@@ocaml.doc ""]

type nonrec asn1_printable_string64 = string [@@ocaml.doc ""]

type nonrec country_code_string = string [@@ocaml.doc ""]

type nonrec asn1_subject = {
  country : country_code_string option;
      [@ocaml.doc
        "Two-digit code that specifies the country in which the certificate subject located.\n"]
  organization : string64 option;
      [@ocaml.doc
        "Legal name of the organization with which the certificate subject is affiliated. \n"]
  organizational_unit : string64 option;
      [@ocaml.doc
        "A subdivision or unit of the organization (such as sales or finance) with which the \
         certificate subject is affiliated.\n"]
  distinguished_name_qualifier : asn1_printable_string64 option;
      [@ocaml.doc "Disambiguating information for the certificate subject.\n"]
  state : string128 option;
      [@ocaml.doc "State in which the subject of the certificate is located.\n"]
  common_name : string64 option;
      [@ocaml.doc
        "For CA and end-entity certificates in a private PKI, the common name (CN) can be any \
         string within the length limit. \n\n\
        \ Note: In publicly trusted certificates, the common name must be a fully qualified domain \
         name (FQDN) associated with the certificate subject.\n\
        \ "]
  serial_number : asn1_printable_string64 option; [@ocaml.doc "The certificate serial number.\n"]
  locality : string128 option;
      [@ocaml.doc
        "The locality (such as a city or town) in which the certificate subject is located.\n"]
  title : string64 option;
      [@ocaml.doc
        "A title such as Mr. or Ms., which is pre-pended to the name to refer formally to the \
         certificate subject.\n"]
  surname : string40 option;
      [@ocaml.doc
        "Family name. In the US and the UK, for example, the surname of an individual is ordered \
         last. In Asian cultures the surname is typically ordered first.\n"]
  given_name : string16 option; [@ocaml.doc "First name.\n"]
  initials : string5 option;
      [@ocaml.doc
        "Concatenation that typically contains the first letter of the {b GivenName}, the first \
         letter of the middle name if one exists, and the first letter of the {b Surname}.\n"]
  pseudonym : string128 option;
      [@ocaml.doc
        "Typically a shortened version of a longer {b GivenName}. For example, Jonathan is often \
         shortened to John. Elizabeth is often shortened to Beth, Liz, or Eliza.\n"]
  generation_qualifier : string3 option;
      [@ocaml.doc
        "Typically a qualifier appended to the name of an individual. Examples include Jr. for \
         junior, Sr. for senior, and III for third.\n"]
  custom_attributes : custom_attribute_list option;
      [@ocaml.doc
        " \n\n\
         Contains a sequence of one or more X.500 relative distinguished names (RDNs), each of \
         which consists of an object identifier (OID) and a value. For more information, see \
         NIST\226\128\153s definition of \
         {{:https://csrc.nist.gov/glossary/term/Object_Identifier}Object Identifier (OID)}.\n\n\
        \  Custom attributes cannot be used in combination with standard attributes.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Contains information about the certificate subject. The [Subject] field in the certificate \
   identifies the entity that owns or controls the public key in the certificate. The entity can \
   be a user, computer, device, or service. The [Subject ]must contain an X.500 distinguished name \
   (DN). A DN is a sequence of relative distinguished names (RDNs). The RDNs are separated by \
   commas in the certificate.\n"]

type nonrec other_name = {
  type_id : custom_object_identifier; [@ocaml.doc "Specifies an OID. \n"]
  value : string256; [@ocaml.doc "Specifies an OID value.\n"]
}
[@@ocaml.doc
  "Defines a custom ASN.1 X.400 [GeneralName] using an object identifier (OID) and value. The OID \
   must satisfy the regular expression shown below. For more information, see NIST's definition of \
   {{:https://csrc.nist.gov/glossary/term/Object_Identifier}Object Identifier (OID)}.\n"]

type nonrec general_name = {
  other_name : other_name option;
      [@ocaml.doc "Represents [GeneralName] using an [OtherName] object.\n"]
  rfc822_name : string256 option;
      [@ocaml.doc
        "Represents [GeneralName] as an {{:https://datatracker.ietf.org/doc/html/rfc822}RFC 822} \
         email address.\n"]
  dns_name : string253 option; [@ocaml.doc "Represents [GeneralName] as a DNS name.\n"]
  directory_name : asn1_subject option; [@ocaml.doc ""]
  edi_party_name : edi_party_name option;
      [@ocaml.doc "Represents [GeneralName] as an [EdiPartyName] object.\n"]
  uniform_resource_identifier : string253 option;
      [@ocaml.doc "Represents [GeneralName] as a URI.\n"]
  ip_address : string39 option;
      [@ocaml.doc "Represents [GeneralName] as an IPv4 or IPv6 address.\n"]
  registered_id : custom_object_identifier option;
      [@ocaml.doc " Represents [GeneralName] as an object identifier (OID).\n"]
}
[@@ocaml.doc
  "Describes an ASN.1 X.400 [GeneralName] as defined in \
   {{:https://datatracker.ietf.org/doc/html/rfc5280}RFC 5280}. Only one of the following naming \
   options should be provided. Providing more than one option results in an [InvalidArgsException] \
   error.\n"]

type nonrec access_method_type =
  | CA_REPOSITORY [@ocaml.doc ""]
  | RESOURCE_PKI_MANIFEST [@ocaml.doc ""]
  | RESOURCE_PKI_NOTIFY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_method = {
  custom_object_identifier : custom_object_identifier option;
      [@ocaml.doc
        "An object identifier (OID) specifying the [AccessMethod]. The OID must satisfy the \
         regular expression shown below. For more information, see NIST's definition of \
         {{:https://csrc.nist.gov/glossary/term/Object_Identifier}Object Identifier (OID)}.\n"]
  access_method_type : access_method_type option; [@ocaml.doc "Specifies the [AccessMethod].\n"]
}
[@@ocaml.doc
  "Describes the type and format of extension access. Only one of [CustomObjectIdentifier] or \
   [AccessMethodType] may be provided. Providing both results in [InvalidArgsException].\n"]

type nonrec access_description = {
  access_method : access_method;
      [@ocaml.doc "The type and format of [AccessDescription] information.\n"]
  access_location : general_name; [@ocaml.doc "The location of [AccessDescription] information.\n"]
}
[@@ocaml.doc
  "Provides access information used by the [authorityInfoAccess] and [subjectInfoAccess] \
   extensions described in {{:https://datatracker.ietf.org/doc/html/rfc5280}RFC 5280}.\n"]

type nonrec access_description_list = access_description list [@@ocaml.doc ""]

type nonrec key_usage = {
  digital_signature : boolean_ option; [@ocaml.doc " Key can be used for digital signing.\n"]
  non_repudiation : boolean_ option; [@ocaml.doc "Key can be used for non-repudiation.\n"]
  key_encipherment : boolean_ option; [@ocaml.doc "Key can be used to encipher data.\n"]
  data_encipherment : boolean_ option; [@ocaml.doc "Key can be used to decipher data.\n"]
  key_agreement : boolean_ option; [@ocaml.doc "Key can be used in a key-agreement protocol.\n"]
  key_cert_sign : boolean_ option; [@ocaml.doc "Key can be used to sign certificates.\n"]
  crl_sign : boolean_ option; [@ocaml.doc "Key can be used to sign CRLs.\n"]
  encipher_only : boolean_ option; [@ocaml.doc "Key can be used only to encipher data.\n"]
  decipher_only : boolean_ option; [@ocaml.doc "Key can be used only to decipher data.\n"]
}
[@@ocaml.doc
  "Defines one or more purposes for which the key contained in the certificate can be used. \
   Default value for each option is false.\n"]

type nonrec csr_extensions = {
  key_usage : key_usage option;
      [@ocaml.doc
        "Indicates the purpose of the certificate and of the key contained in the certificate.\n"]
  subject_information_access : access_description_list option;
      [@ocaml.doc
        "For CA certificates, provides a path to additional information pertaining to the CA, such \
         as revocation and policy. For more information, see \
         {{:https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.2.2}Subject Information \
         Access} in RFC 5280.\n"]
}
[@@ocaml.doc
  "Describes the certificate extensions to be added to the certificate signing request (CSR).\n"]

type nonrec signing_algorithm =
  | SHA256WITHECDSA [@ocaml.doc ""]
  | SHA384WITHECDSA [@ocaml.doc ""]
  | SHA512WITHECDSA [@ocaml.doc ""]
  | SHA256WITHRSA [@ocaml.doc ""]
  | SHA384WITHRSA [@ocaml.doc ""]
  | SHA512WITHRSA [@ocaml.doc ""]
  | SM3WITHSM2 [@ocaml.doc ""]
  | ML_DSA_44 [@ocaml.doc ""]
  | ML_DSA_65 [@ocaml.doc ""]
  | ML_DSA_87 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_algorithm =
  | RSA_2048 [@ocaml.doc ""]
  | RSA_3072 [@ocaml.doc ""]
  | RSA_4096 [@ocaml.doc ""]
  | EC_prime256v1 [@ocaml.doc ""]
  | EC_secp384r1 [@ocaml.doc ""]
  | EC_secp521r1 [@ocaml.doc ""]
  | ML_DSA_44 [@ocaml.doc ""]
  | ML_DSA_65 [@ocaml.doc ""]
  | ML_DSA_87 [@ocaml.doc ""]
  | SM2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_authority_configuration = {
  key_algorithm : key_algorithm;
      [@ocaml.doc
        "Type of the public key algorithm and size, in bits, of the key pair that your CA creates \
         when it issues a certificate. When you create a subordinate CA, you must use a key \
         algorithm supported by the parent CA.\n"]
  signing_algorithm : signing_algorithm;
      [@ocaml.doc
        "Name of the algorithm your private CA uses to sign certificate requests.\n\n\
        \ This parameter should not be confused with the [SigningAlgorithm] parameter used to sign \
         certificates when they are issued.\n\
        \ "]
  subject : asn1_subject;
      [@ocaml.doc
        "Structure that contains X.500 distinguished name information for your private CA.\n"]
  csr_extensions : csr_extensions option;
      [@ocaml.doc
        "Specifies information to be added to the extension section of the certificate signing \
         request (CSR).\n"]
}
[@@ocaml.doc
  "Contains configuration information for your private certificate authority (CA). This includes \
   information about the class of public key algorithm and the key pair that your private CA \
   creates when it issues a certificate. It also includes the signature algorithm that it uses \
   when issuing certificates, and its X.500 distinguished name. You must specify this information \
   when you call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
   action. \n"]

type nonrec failure_reason =
  | REQUEST_TIMED_OUT [@ocaml.doc ""]
  | UNSUPPORTED_ALGORITHM [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_authority_type = ROOT [@ocaml.doc ""] | SUBORDINATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_authority = {
  arn : arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) for your private certificate authority (CA). The format is \n\
         {[\n\
        \ {i 12345678-1234-1234-1234-123456789012} \n\
         ]}\n\
         .\n"]
  owner_account : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID that owns the certificate authority.\n"]
  created_at : t_stamp option; [@ocaml.doc "Date and time at which your private CA was created.\n"]
  last_state_change_at : t_stamp option;
      [@ocaml.doc "Date and time at which your private CA was last updated.\n"]
  type_ : certificate_authority_type option; [@ocaml.doc "Type of your private CA.\n"]
  serial : string_ option; [@ocaml.doc "Serial number of your private CA.\n"]
  status : certificate_authority_status option; [@ocaml.doc "Status of your private CA.\n"]
  not_before : t_stamp option;
      [@ocaml.doc "Date and time before which your private CA certificate is not valid.\n"]
  not_after : t_stamp option;
      [@ocaml.doc "Date and time after which your private CA certificate is not valid.\n"]
  failure_reason : failure_reason option;
      [@ocaml.doc "Reason the request to create your private CA failed.\n"]
  certificate_authority_configuration : certificate_authority_configuration option;
      [@ocaml.doc "Your private CA configuration.\n"]
  revocation_configuration : revocation_configuration option;
      [@ocaml.doc
        "Information about the Online Certificate Status Protocol (OCSP) configuration or \
         certificate revocation list (CRL) created and maintained by your private CA. \n"]
  restorable_until : t_stamp option;
      [@ocaml.doc
        "The period during which a deleted CA can be restored. For more information, see the \
         [PermanentDeletionTimeInDays] parameter of the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeleteCertificateAuthorityRequest.html}DeleteCertificateAuthorityRequest} \
         action. \n"]
  key_storage_security_standard : key_storage_security_standard option;
      [@ocaml.doc
        "Defines a cryptographic key management compliance standard for handling and protecting CA \
         keys.\n\n\
        \ Default: FIPS_140_2_LEVEL_3_OR_HIGHER\n\
        \ \n\
        \   Starting January 26, 2023, Amazon Web Services Private CA protects all CA private keys \
         in non-China regions using hardware security modules (HSMs) that comply with FIPS PUB \
         140-2 Level 3.\n\
        \   \n\
        \    For information about security standard support in different Amazon Web Services \
         Regions, see \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/data-protection.html#private-keys}Storage \
         and security compliance of Amazon Web Services Private CA private keys}.\n\
        \    \n\
        \     "]
  usage_mode : certificate_authority_usage_mode option;
      [@ocaml.doc
        "Specifies whether the CA issues general-purpose certificates that typically require a \
         revocation mechanism, or short-lived certificates that may optionally omit revocation \
         because they expire quickly. Short-lived certificate validity is limited to seven days.\n\n\
        \ The default value is GENERAL_PURPOSE.\n\
        \ "]
}
[@@ocaml.doc
  "Contains information about your private certificate authority (CA). Your private CA can issue \
   and revoke X.509 digital certificates. Digital certificates verify that the entity named in the \
   certificate {b Subject} field owns or controls the public key contained in the {b Subject \
   Public Key Info} field. Call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
   action to create your private CA. You must then call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificateAuthorityCertificate.html}GetCertificateAuthorityCertificate} \
   action to retrieve a private CA certificate signing request (CSR). Sign the CSR with your \
   Amazon Web Services Private CA-hosted or on-premises root or subordinate CA certificate. Call \
   the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html}ImportCertificateAuthorityCertificate} \
   action to import the signed certificate into Certificate Manager (ACM). \n"]

type nonrec certificate_authorities = certificate_authority list [@@ocaml.doc ""]

type nonrec list_certificate_authorities_response = {
  next_token : next_token option;
      [@ocaml.doc
        "When the list is truncated, this value is present and should be used for the [NextToken] \
         parameter in a subsequent pagination request.\n"]
  certificate_authorities : certificate_authorities option;
      [@ocaml.doc "Summary information about each certificate authority you have created.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_owner = SELF [@ocaml.doc ""] | OTHER_ACCOUNTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_certificate_authorities_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Use this parameter when paginating results to specify the maximum number of items to \
         return in the response on each page. If additional items exist beyond the number you \
         specify, the [NextToken] element is sent in the response. Use this [NextToken] value in a \
         subsequent request to retrieve additional items.\n\n\
        \ Although the maximum value is 1000, the action only returns a maximum of 100 items.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "Use this parameter when paginating results in a subsequent request after you receive a \
         response with truncated results. Set it to the value of the [NextToken] parameter from \
         the response you just received.\n"]
  resource_owner : resource_owner option;
      [@ocaml.doc
        "Use this parameter to filter the returned set of certificate authorities based on their \
         owner. The default is SELF.\n"]
}
[@@ocaml.doc ""]

type nonrec malformed_csr_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The certificate signing request is invalid.\n"]

type nonrec issue_certificate_response = {
  certificate_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the issued certificate and the certificate serial \
         number. This is of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012}/certificate/{i \
         286535153982981100925020015808220737245} \n\
        \ ]}\n\
        \  \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec validity_period_type =
  | END_DATE [@ocaml.doc ""]
  | ABSOLUTE [@ocaml.doc ""]
  | DAYS [@ocaml.doc ""]
  | MONTHS [@ocaml.doc ""]
  | YEARS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec positive_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec validity = {
  value : positive_long;
      [@ocaml.doc "A long integer interpreted according to the value of [Type], below.\n"]
  type_ : validity_period_type;
      [@ocaml.doc
        "Determines how {i Amazon Web Services Private CA} interprets the [Value] parameter, an \
         integer. Supported validity types include those listed below. Type definitions with \
         values include a sample input value and the resulting output. \n\n\
        \  [END_DATE]: The specific date and time when the certificate will expire, expressed \
         using UTCTime (YYMMDDHHMMSS) or GeneralizedTime (YYYYMMDDHHMMSS) format. When UTCTime is \
         used, if the year field (YY) is greater than or equal to 50, the year is interpreted as \
         19YY. If the year field is less than 50, the year is interpreted as 20YY.\n\
        \ \n\
        \  {ul\n\
        \        {-  Sample input value: 491231235959 (UTCTime format)\n\
        \            \n\
        \             }\n\
        \        {-  Output expiration date/time: 12/31/2049 23:59:59\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    [ABSOLUTE]: The specific date and time when the validity of a certificate will start \
         or expire, expressed in seconds since the Unix Epoch. \n\
        \   \n\
        \    {ul\n\
        \          {-  Sample input value: 2524608000\n\
        \              \n\
        \               }\n\
        \          {-  Output expiration date/time: 01/01/2050 00:00:00\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    [DAYS], [MONTHS], [YEARS]: The relative time from the moment of issuance until the \
         certificate will expire, expressed in days, months, or years. \n\
        \   \n\
        \    Example if [DAYS], issued on 10/12/2020 at 12:34:54 UTC:\n\
        \    \n\
        \     {ul\n\
        \           {-  Sample input value: 90\n\
        \               \n\
        \                }\n\
        \           {-  Output expiration date: 01/10/2020 12:34:54 UTC\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   The minimum validity duration for a certificate using relative time ([DAYS]) is one \
         day. The minimum validity for a certificate using absolute time ([ABSOLUTE] or \
         [END_DATE]) is one second.\n\
        \   "]
}
[@@ocaml.doc
  "Validity specifies the period of time during which a certificate is valid. Validity can be \
   expressed as an explicit date and time when the validity of a certificate starts or expires, or \
   as a span of time after issuance, stated in days, months, or years. For more information, see \
   {{:https://tools.ietf.org/html/rfc5280#section-4.1.2.5}Validity} in RFC 5280.\n\n\
  \ Amazon Web Services Private CA API consumes the [Validity] data type differently in two \
   distinct parameters of the [IssueCertificate] action. The required parameter \
   [IssueCertificate]:[Validity] specifies the end of a certificate's validity period. The \
   optional parameter [IssueCertificate]:[ValidityNotBefore] specifies a customized starting time \
   for the validity period.\n\
  \ "]

type nonrec csr_blob = bytes [@@ocaml.doc ""]

type nonrec base64_string1_to4096 = string [@@ocaml.doc ""]

type nonrec custom_extension = {
  object_identifier : custom_object_identifier;
      [@ocaml.doc
        " \n\n\
         Specifies the object identifier (OID) of the X.509 extension. For more information, see \
         the {{:https://oidref.com/2.5.29}Global OID reference database.} \n"]
  value : base64_string1_to4096;
      [@ocaml.doc " \n\nSpecifies the base64-encoded value of the X.509 extension.\n"]
  critical : boolean_ option;
      [@ocaml.doc " \n\nSpecifies the critical flag of the X.509 extension.\n"]
}
[@@ocaml.doc
  " \n\n\
   Specifies the X.509 extension information for a certificate.\n\n\
  \ Extensions present in [CustomExtensions] follow the [ApiPassthrough] \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html#template-order-of-operations}template \
   rules}. \n\
  \ "]

type nonrec custom_extension_list = custom_extension list [@@ocaml.doc ""]

type nonrec general_name_list = general_name list [@@ocaml.doc ""]

type nonrec extended_key_usage_type =
  | SERVER_AUTH [@ocaml.doc ""]
  | CLIENT_AUTH [@ocaml.doc ""]
  | CODE_SIGNING [@ocaml.doc ""]
  | EMAIL_PROTECTION [@ocaml.doc ""]
  | TIME_STAMPING [@ocaml.doc ""]
  | OCSP_SIGNING [@ocaml.doc ""]
  | SMART_CARD_LOGIN [@ocaml.doc ""]
  | DOCUMENT_SIGNING [@ocaml.doc ""]
  | CERTIFICATE_TRANSPARENCY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec extended_key_usage = {
  extended_key_usage_type : extended_key_usage_type option;
      [@ocaml.doc
        "Specifies a standard [ExtendedKeyUsage] as defined as in \
         {{:https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.12}RFC 5280}.\n"]
  extended_key_usage_object_identifier : custom_object_identifier option;
      [@ocaml.doc "Specifies a custom [ExtendedKeyUsage] with an object identifier (OID).\n"]
}
[@@ocaml.doc
  "Specifies additional purposes for which the certified public key may be used other than basic \
   purposes indicated in the [KeyUsage] extension.\n"]

type nonrec extended_key_usage_list = extended_key_usage list [@@ocaml.doc ""]

type nonrec qualifier = {
  cps_uri : string256;
      [@ocaml.doc
        "Contains a pointer to a certification practice statement (CPS) published by the CA.\n"]
}
[@@ocaml.doc
  "Defines a [PolicyInformation] qualifier. Amazon Web Services Private CA supports the \
   {{:https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.4}certification practice \
   statement (CPS) qualifier} defined in RFC 5280. \n"]

type nonrec policy_qualifier_id = CPS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec policy_qualifier_info = {
  policy_qualifier_id : policy_qualifier_id;
      [@ocaml.doc "Identifies the qualifier modifying a [CertPolicyId].\n"]
  qualifier : qualifier;
      [@ocaml.doc
        "Defines the qualifier type. Amazon Web Services Private CA supports the use of a URI for \
         a CPS qualifier in this field.\n"]
}
[@@ocaml.doc
  "Modifies the [CertPolicyId] of a [PolicyInformation] object with a qualifier. Amazon Web \
   Services Private CA supports the certification practice statement (CPS) qualifier.\n"]

type nonrec policy_qualifier_info_list = policy_qualifier_info list [@@ocaml.doc ""]

type nonrec policy_information = {
  cert_policy_id : custom_object_identifier;
      [@ocaml.doc
        "Specifies the object identifier (OID) of the certificate policy under which the \
         certificate was issued. For more information, see NIST's definition of \
         {{:https://csrc.nist.gov/glossary/term/Object_Identifier}Object Identifier (OID)}.\n"]
  policy_qualifiers : policy_qualifier_info_list option;
      [@ocaml.doc
        "Modifies the given [CertPolicyId] with a qualifier. Amazon Web Services Private CA \
         supports the certification practice statement (CPS) qualifier.\n"]
}
[@@ocaml.doc "Defines the X.509 [CertificatePolicies] extension.\n"]

type nonrec certificate_policy_list = policy_information list [@@ocaml.doc ""]

type nonrec extensions = {
  certificate_policies : certificate_policy_list option;
      [@ocaml.doc
        "Contains a sequence of one or more policy information terms, each of which consists of an \
         object identifier (OID) and optional qualifiers. For more information, see NIST's \
         definition of {{:https://csrc.nist.gov/glossary/term/Object_Identifier}Object Identifier \
         (OID)}.\n\n\
        \ In an end-entity certificate, these terms indicate the policy under which the \
         certificate was issued and the purposes for which it may be used. In a CA certificate, \
         these terms limit the set of policies for certification paths that include this \
         certificate.\n\
        \ "]
  extended_key_usage : extended_key_usage_list option;
      [@ocaml.doc
        "Specifies additional purposes for which the certified public key may be used other than \
         basic purposes indicated in the [KeyUsage] extension.\n"]
  key_usage : key_usage option; [@ocaml.doc ""]
  subject_alternative_names : general_name_list option;
      [@ocaml.doc
        "The subject alternative name extension allows identities to be bound to the subject of \
         the certificate. These identities may be included in addition to or in place of the \
         identity in the subject field of the certificate.\n"]
  custom_extensions : custom_extension_list option;
      [@ocaml.doc
        " \n\n\
         Contains a sequence of one or more X.509 extensions, each of which consists of an object \
         identifier (OID), a base64-encoded value, and the critical flag. For more information, \
         see the {{:https://oidref.com/2.5.29}Global OID reference database.} \n"]
}
[@@ocaml.doc "Contains X.509 extension information for a certificate.\n"]

type nonrec api_passthrough = {
  extensions : extensions option;
      [@ocaml.doc "Specifies X.509 extension information for a certificate.\n"]
  subject : asn1_subject option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Contains X.509 certificate information to be placed in an issued certificate. An \
   [APIPassthrough] or [APICSRPassthrough] template variant must be selected, or else this \
   parameter is ignored. \n\n\
  \ If conflicting or duplicate certificate information is supplied from other sources, Amazon Web \
   Services Private CA applies \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html#template-order-of-operations}order \
   of operation rules} to determine what information is used.\n\
  \ "]

type nonrec issue_certificate_request = {
  api_passthrough : api_passthrough option;
      [@ocaml.doc
        "Specifies X.509 certificate information to be included in the issued certificate. An \
         [APIPassthrough] or [APICSRPassthrough] template variant must be selected, or else this \
         parameter is ignored. For more information about using these templates, see \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html}Understanding \
         Certificate Templates}.\n\n\
        \ If conflicting or duplicate certificate information is supplied during certificate \
         issuance, Amazon Web Services Private CA applies \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html#template-order-of-operations}order \
         of operation rules} to determine what information is used.\n\
        \ "]
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must be of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
  csr : csr_blob;
      [@ocaml.doc
        "The certificate signing request (CSR) for the certificate you want to issue. As an \
         example, you can use the following OpenSSL command to create the CSR and a 2048 bit RSA \
         private key. \n\n\
        \  [openssl req -new -newkey rsa:2048 -days 365 -keyout private/test_cert_priv_key.pem \
         -out csr/test_cert_.csr] \n\
        \ \n\
        \  If you have a configuration file, you can then use the following OpenSSL command. The \
         [usr_cert] block in the configuration file contains your X509 version 3 extensions. \n\
        \  \n\
        \    [openssl req -new -config openssl_rsa.cnf -extensions usr_cert -newkey rsa:2048 -days \
         365 -keyout private/test_cert_priv_key.pem -out csr/test_cert_.csr] \n\
        \   \n\
        \    Note: A CSR must provide either a {i subject name} or a {i subject alternative name} \
         or the request will be rejected. \n\
        \    "]
  signing_algorithm : signing_algorithm;
      [@ocaml.doc
        "The name of the algorithm that will be used to sign the certificate to be issued. \n\n\
        \ This parameter should not be confused with the [SigningAlgorithm] parameter used to sign \
         a CSR in the [CreateCertificateAuthority] action.\n\
        \ \n\
        \   The specified signing algorithm family (RSA or ECDSA) must match the algorithm family \
         of the CA's secret key.\n\
        \   \n\
        \    "]
  template_arn : arn option;
      [@ocaml.doc
        "Specifies a custom configuration template to use when issuing a certificate. If this \
         parameter is not provided, Amazon Web Services Private CA defaults to the \
         [EndEntityCertificate/V1] template. For CA certificates, you should choose the shortest \
         path length that meets your needs. The path length is indicated by the PathLen{i N} \
         portion of the ARN, where {i N} is the \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaTerms.html#terms-cadepth}CA \
         depth}.\n\n\
        \ Note: The CA depth configured on a subordinate CA certificate must not exceed the limit \
         set by its parents in the CA hierarchy.\n\
        \ \n\
        \  For a list of [TemplateArn] values supported by Amazon Web Services Private CA, see \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html}Understanding \
         Certificate Templates}.\n\
        \  "]
  validity : validity;
      [@ocaml.doc
        "Information describing the end of the validity period of the certificate. This parameter \
         sets the \226\128\156Not After\226\128\157 date for the certificate.\n\n\
        \ Certificate validity is the period of time during which a certificate is valid. Validity \
         can be expressed as an explicit date and time when the certificate expires, or as a span \
         of time after issuance, stated in days, months, or years. For more information, see \
         {{:https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.5}Validity} in RFC 5280. \n\
        \ \n\
        \  This value is unaffected when [ValidityNotBefore] is also specified. For example, if \
         [Validity] is set to 20 days in the future, the certificate will expire 20 days from \
         issuance time regardless of the [ValidityNotBefore] value.\n\
        \  \n\
        \   The end of the validity period configured on a certificate must not exceed the limit \
         set on its parents in the CA hierarchy.\n\
        \   "]
  validity_not_before : validity option;
      [@ocaml.doc
        "Information describing the start of the validity period of the certificate. This \
         parameter sets the \226\128\156Not Before\" date for the certificate.\n\n\
        \ By default, when issuing a certificate, Amazon Web Services Private CA sets the \"Not \
         Before\" date to the issuance time minus 60 minutes. This compensates for clock \
         inconsistencies across computer systems. The [ValidityNotBefore] parameter can be used to \
         customize the \226\128\156Not Before\226\128\157 value. \n\
        \ \n\
        \  Unlike the [Validity] parameter, the [ValidityNotBefore] parameter is optional.\n\
        \  \n\
        \   The [ValidityNotBefore] value is expressed as an explicit date and time, using the \
         [Validity] type value [ABSOLUTE]. For more information, see \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_Validity.html}Validity} \
         in this API reference and \
         {{:https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.5}Validity} in RFC 5280.\n\
        \   "]
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "Alphanumeric string that can be used to distinguish between calls to the {b \
         IssueCertificate} action. Idempotency tokens for {b IssueCertificate} time out after five \
         minutes. Therefore, if you call {b IssueCertificate} multiple times with the same \
         idempotency token within five minutes, Amazon Web Services Private CA recognizes that you \
         are requesting only one certificate and will issue only one. If you change the \
         idempotency token for each call, Amazon Web Services Private CA recognizes that you are \
         requesting multiple certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec malformed_certificate_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "One or more fields in the certificate are invalid.\n"]

type nonrec certificate_mismatch_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The certificate authority certificate you are importing does not comply with conditions \
   specified in the certificate that signed it.\n"]

type nonrec certificate_chain_blob = bytes [@@ocaml.doc ""]

type nonrec certificate_body_blob = bytes [@@ocaml.doc ""]

type nonrec import_certificate_authority_certificate_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
  certificate : certificate_body_blob;
      [@ocaml.doc
        "The PEM-encoded certificate for a private CA. This may be a self-signed certificate in \
         the case of a root CA, or it may be signed by another CA that you control.\n"]
  certificate_chain : certificate_chain_blob option;
      [@ocaml.doc
        "A PEM-encoded file that contains all of your certificates, other than the certificate \
         you're importing, chaining up to your root CA. Your Amazon Web Services Private CA-hosted \
         or on-premises root certificate is the last in the chain, and each certificate in the \
         chain signs the one preceding. \n\n\
        \ This parameter must be supplied when you import a subordinate CA. When you import a root \
         CA, there is no chain.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_policy_response = {
  policy : aws_policy option;
      [@ocaml.doc "The policy attached to the private CA as a JSON document.\n"]
}
[@@ocaml.doc ""]

type nonrec get_policy_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the private CA that will have its policy retrieved. \
         You can find the CA's ARN by calling the ListCertificateAuthorities action. \n"]
}
[@@ocaml.doc ""]

type nonrec csr_body = string [@@ocaml.doc ""]

type nonrec get_certificate_authority_csr_response = {
  csr : csr_body option;
      [@ocaml.doc
        "The base64 PEM-encoded certificate signing request (CSR) for your private CA certificate.\n"]
}
[@@ocaml.doc ""]

type nonrec get_certificate_authority_csr_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
         action. This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \  \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec certificate_chain = string [@@ocaml.doc ""]

type nonrec certificate_body = string [@@ocaml.doc ""]

type nonrec get_certificate_authority_certificate_response = {
  certificate : certificate_body option;
      [@ocaml.doc "Base64-encoded certificate authority (CA) certificate.\n"]
  certificate_chain : certificate_chain option;
      [@ocaml.doc
        "Base64-encoded certificate chain that includes any intermediate certificates and chains \
         up to root certificate that you used to sign your private CA certificate. The chain does \
         not include your private CA certificate. If this is a root CA, the value will be null.\n"]
}
[@@ocaml.doc ""]

type nonrec get_certificate_authority_certificate_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of your private CA. This is of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_certificate_response = {
  certificate : certificate_body option;
      [@ocaml.doc
        "The base64 PEM-encoded certificate specified by the [CertificateArn] parameter.\n"]
  certificate_chain : certificate_chain option;
      [@ocaml.doc
        "The base64 PEM-encoded certificate chain that chains up to the root CA certificate that \
         you used to sign your private CA certificate. \n"]
}
[@@ocaml.doc ""]

type nonrec get_certificate_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
  certificate_arn : arn;
      [@ocaml.doc
        "The ARN of the issued certificate. The ARN contains the certificate serial number and \
         must be in the following form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012}/certificate/{i \
         286535153982981100925020015808220737245} \n\
        \ ]}\n\
        \  \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec audit_report_status =
  | CREATING [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_certificate_authority_audit_report_response = {
  audit_report_status : audit_report_status option;
      [@ocaml.doc
        "Specifies whether report creation is in progress, has succeeded, or has failed.\n"]
  s3_bucket_name : s3_bucket_name option;
      [@ocaml.doc "Name of the S3 bucket that contains the report.\n"]
  s3_key : s3_key option;
      [@ocaml.doc "S3 {b key} that uniquely identifies the report file in your S3 bucket.\n"]
  created_at : t_stamp option; [@ocaml.doc "The date and time at which the report was created.\n"]
}
[@@ocaml.doc ""]

type nonrec audit_report_id = string [@@ocaml.doc ""]

type nonrec describe_certificate_authority_audit_report_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the private CA. This must be of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
  audit_report_id : audit_report_id;
      [@ocaml.doc
        "The report ID returned by calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html}CreateCertificateAuthorityAuditReport} \
         action.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_certificate_authority_response = {
  certificate_authority : certificate_authority option;
      [@ocaml.doc
        "A \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CertificateAuthority.html}CertificateAuthority} \
         structure that contains information about your private CA.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_certificate_authority_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must be of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_policy_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the private CA that will have its policy deleted. You \
         can find the CA's ARN by calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
         action. The ARN value must have the form \
         [arn:aws:acm-pca:region:account:certificate-authority/01234567-89ab-cdef-0123-0123456789ab]. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_permission_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the private CA that issued the permissions. You can \
         find the CA's ARN by calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
         action. This must have the following form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
  principal : principal;
      [@ocaml.doc
        "The Amazon Web Services service or identity that will have its CA permissions revoked. At \
         this time, the only valid service principal is [acm.amazonaws.com] \n"]
  source_account : account_id option;
      [@ocaml.doc "The Amazon Web Services account that calls this action.\n"]
}
[@@ocaml.doc ""]

type nonrec permanent_deletion_time_in_days = int [@@ocaml.doc ""]

type nonrec delete_certificate_authority_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that was returned when you called \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority}. \
         This must have the following form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
  permanent_deletion_time_in_days : permanent_deletion_time_in_days option;
      [@ocaml.doc
        "The number of days to make a CA restorable after it has been deleted. This can be \
         anywhere from 7 to 30 days, with 30 being the default.\n"]
}
[@@ocaml.doc ""]

type nonrec permission_already_exists_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The designated permission has already been given to the user.\n"]

type nonrec create_permission_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the CA that grants the permissions. You can find the \
         ARN by calling the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
         action. This must have the following form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
  principal : principal;
      [@ocaml.doc
        "The Amazon Web Services service or identity that receives the permission. At this time, \
         the only valid principal is [acm.amazonaws.com].\n"]
  source_account : account_id option; [@ocaml.doc "The ID of the calling account.\n"]
  actions : action_list;
      [@ocaml.doc
        "The actions that the specified Amazon Web Services service principal can use. These \
         include [IssueCertificate], [GetCertificate], and [ListPermissions].\n"]
}
[@@ocaml.doc ""]

type nonrec create_certificate_authority_audit_report_response = {
  audit_report_id : audit_report_id option;
      [@ocaml.doc "An alphanumeric string that contains a report identifier.\n"]
  s3_key : s3_key option;
      [@ocaml.doc "The {b key} that uniquely identifies the report file in your S3 bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec audit_report_response_format = JSON [@ocaml.doc ""] | CSV [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_certificate_authority_audit_report_request = {
  certificate_authority_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the CA to be audited. This is of the form:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ .\n\
        \ "]
  s3_bucket_name : s3_bucket_name;
      [@ocaml.doc "The name of the S3 bucket that will contain the audit report.\n"]
  audit_report_response_format : audit_report_response_format;
      [@ocaml.doc
        "The format in which to create the report. This can be either {b JSON} or {b CSV}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_certificate_authority_response = {
  certificate_authority_arn : arn option;
      [@ocaml.doc
        "If successful, the Amazon Resource Name (ARN) of the certificate authority (CA). This is \
         of the form: \n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:acm-pca:{i region}:{i account}:certificate-authority/{i \
         12345678-1234-1234-1234-123456789012} \n\
        \ ]}\n\
        \ . \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_certificate_authority_request = {
  certificate_authority_configuration : certificate_authority_configuration;
      [@ocaml.doc
        "Name and bit size of the private key algorithm, the name of the signing algorithm, and \
         X.500 certificate subject information.\n"]
  revocation_configuration : revocation_configuration option;
      [@ocaml.doc
        "Contains information to enable support for Online Certificate Status Protocol (OCSP), \
         certificate revocation list (CRL), both protocols, or neither. By default, both \
         certificate validation mechanisms are disabled.\n\n\
        \ The following requirements apply to revocation configurations.\n\
        \ \n\
        \  {ul\n\
        \        {-  A configuration disabling CRLs or OCSP must contain only the [Enabled=False] \
         parameter, and will fail if other parameters such as [CustomCname] or [ExpirationInDays] \
         are included.\n\
        \            \n\
        \             }\n\
        \        {-  In a CRL configuration, the [S3BucketName] parameter must conform to \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Amazon S3 \
         bucket naming rules}.\n\
        \            \n\
        \             }\n\
        \        {-  A configuration containing a custom Canonical Name (CNAME) parameter for CRLs \
         or OCSP must conform to {{:https://www.ietf.org/rfc/rfc2396.txt}RFC2396} restrictions on \
         the use of special characters in a CNAME. \n\
        \            \n\
        \             }\n\
        \        {-  In a CRL or OCSP configuration, the value of a CNAME parameter must not \
         include a protocol prefix such as \"http://\" or \"https://\".\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    For more information, see the \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_OcspConfiguration.html}OcspConfiguration} \
         and \
         {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CrlConfiguration.html}CrlConfiguration} \
         types.\n\
        \   "]
  certificate_authority_type : certificate_authority_type;
      [@ocaml.doc "The type of the certificate authority.\n"]
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "Custom string that can be used to distinguish between calls to the {b \
         CreateCertificateAuthority} action. Idempotency tokens for {b CreateCertificateAuthority} \
         time out after five minutes. Therefore, if you call {b CreateCertificateAuthority} \
         multiple times with the same idempotency token within five minutes, Amazon Web Services \
         Private CA recognizes that you are requesting only certificate authority and will issue \
         only one. If you change the idempotency token for each call, Amazon Web Services Private \
         CA recognizes that you are requesting multiple certificate authorities.\n"]
  key_storage_security_standard : key_storage_security_standard option;
      [@ocaml.doc
        "Specifies a cryptographic key management compliance standard for handling and protecting \
         CA keys.\n\n\
        \ Default: FIPS_140_2_LEVEL_3_OR_HIGHER\n\
        \ \n\
        \   Some Amazon Web Services Regions don't support the default value. When you create a CA \
         in these Regions, you must use [CCPC_LEVEL_1_OR_HIGHER] for the \
         [KeyStorageSecurityStandard] parameter. If you don't, the operation returns an \
         [InvalidArgsException] with this message: \"A certificate authority cannot be created in \
         this region with the specified security standard.\"\n\
        \   \n\
        \    For information about security standard support in different Amazon Web Services \
         Regions, see \
         {{:https://docs.aws.amazon.com/privateca/latest/userguide/data-protection.html#private-keys}Storage \
         and security compliance of Amazon Web Services Private CA private keys}.\n\
        \    \n\
        \     "]
  tags : tag_list option;
      [@ocaml.doc
        "Key-value pairs that will be attached to the new private CA. You can associate up to 50 \
         tags with a private CA. For information using tags with IAM to manage permissions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling \
         Access Using IAM Tags}.\n"]
  usage_mode : certificate_authority_usage_mode option;
      [@ocaml.doc
        "Specifies whether the CA issues general-purpose certificates that typically require a \
         revocation mechanism, or short-lived certificates that may optionally omit revocation \
         because they expire quickly. Short-lived certificate validity is limited to seven days.\n\n\
        \ The default value is GENERAL_PURPOSE.\n\
        \ "]
}
[@@ocaml.doc ""]
