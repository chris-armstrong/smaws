(** ACM PCA client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validity : type_:validity_period_type -> value:positive_long -> unit -> validity

val make_crl_distribution_point_extension_configuration :
  omit_extension:boolean_ -> unit -> crl_distribution_point_extension_configuration

val make_crl_configuration :
  ?custom_path:crl_path_string ->
  ?crl_type:crl_type ->
  ?crl_distribution_point_extension_configuration:crl_distribution_point_extension_configuration ->
  ?s3_object_acl:s3_object_acl ->
  ?s3_bucket_name:s3_bucket_name3_to255 ->
  ?custom_cname:cname_string ->
  ?expiration_in_days:integer1_to5000 ->
  enabled:boolean_ ->
  unit ->
  crl_configuration

val make_ocsp_configuration :
  ?ocsp_custom_cname:cname_string -> enabled:boolean_ -> unit -> ocsp_configuration

val make_revocation_configuration :
  ?ocsp_configuration:ocsp_configuration ->
  ?crl_configuration:crl_configuration ->
  unit ->
  revocation_configuration

val make_update_certificate_authority_request :
  ?status:certificate_authority_status ->
  ?revocation_configuration:revocation_configuration ->
  certificate_authority_arn:arn ->
  unit ->
  update_certificate_authority_request

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_untag_certificate_authority_request :
  tags:tag_list -> certificate_authority_arn:arn -> unit -> untag_certificate_authority_request

val make_tag_certificate_authority_request :
  tags:tag_list -> certificate_authority_arn:arn -> unit -> tag_certificate_authority_request

val make_revoke_certificate_request :
  revocation_reason:revocation_reason ->
  certificate_serial:string128 ->
  certificate_authority_arn:arn ->
  unit ->
  revoke_certificate_request

val make_restore_certificate_authority_request :
  certificate_authority_arn:arn -> unit -> restore_certificate_authority_request

val make_qualifier : cps_uri:string256 -> unit -> qualifier
val make_put_policy_request : policy:aws_policy -> resource_arn:arn -> unit -> put_policy_request

val make_policy_qualifier_info :
  qualifier:qualifier -> policy_qualifier_id:policy_qualifier_id -> unit -> policy_qualifier_info

val make_policy_information :
  ?policy_qualifiers:policy_qualifier_info_list ->
  cert_policy_id:custom_object_identifier ->
  unit ->
  policy_information

val make_permission :
  ?policy:aws_policy ->
  ?actions:action_list ->
  ?source_account:account_id ->
  ?principal:principal ->
  ?created_at:t_stamp ->
  ?certificate_authority_arn:arn ->
  unit ->
  permission

val make_other_name : value:string256 -> type_id:custom_object_identifier -> unit -> other_name
val make_list_tags_response : ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  certificate_authority_arn:arn ->
  unit ->
  list_tags_request

val make_list_permissions_response :
  ?permissions:permission_list -> ?next_token:next_token -> unit -> list_permissions_response

val make_list_permissions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  certificate_authority_arn:arn ->
  unit ->
  list_permissions_request

val make_custom_attribute :
  value:string1_to256 -> object_identifier:custom_object_identifier -> unit -> custom_attribute

val make_asn1_subject :
  ?custom_attributes:custom_attribute_list ->
  ?generation_qualifier:string3 ->
  ?pseudonym:string128 ->
  ?initials:string5 ->
  ?given_name:string16 ->
  ?surname:string40 ->
  ?title:string64 ->
  ?locality:string128 ->
  ?serial_number:asn1_printable_string64 ->
  ?common_name:string64 ->
  ?state:string128 ->
  ?distinguished_name_qualifier:asn1_printable_string64 ->
  ?organizational_unit:string64 ->
  ?organization:string64 ->
  ?country:country_code_string ->
  unit ->
  asn1_subject

val make_key_usage :
  ?decipher_only:boolean_ ->
  ?encipher_only:boolean_ ->
  ?crl_sign:boolean_ ->
  ?key_cert_sign:boolean_ ->
  ?key_agreement:boolean_ ->
  ?data_encipherment:boolean_ ->
  ?key_encipherment:boolean_ ->
  ?non_repudiation:boolean_ ->
  ?digital_signature:boolean_ ->
  unit ->
  key_usage

val make_access_method :
  ?access_method_type:access_method_type ->
  ?custom_object_identifier:custom_object_identifier ->
  unit ->
  access_method

val make_edi_party_name : ?name_assigner:string256 -> party_name:string256 -> unit -> edi_party_name

val make_general_name :
  ?registered_id:custom_object_identifier ->
  ?ip_address:string39 ->
  ?uniform_resource_identifier:string253 ->
  ?edi_party_name:edi_party_name ->
  ?directory_name:asn1_subject ->
  ?dns_name:string253 ->
  ?rfc822_name:string256 ->
  ?other_name:other_name ->
  unit ->
  general_name

val make_access_description :
  access_location:general_name -> access_method:access_method -> unit -> access_description

val make_csr_extensions :
  ?subject_information_access:access_description_list ->
  ?key_usage:key_usage ->
  unit ->
  csr_extensions

val make_certificate_authority_configuration :
  ?csr_extensions:csr_extensions ->
  subject:asn1_subject ->
  signing_algorithm:signing_algorithm ->
  key_algorithm:key_algorithm ->
  unit ->
  certificate_authority_configuration

val make_certificate_authority :
  ?usage_mode:certificate_authority_usage_mode ->
  ?key_storage_security_standard:key_storage_security_standard ->
  ?restorable_until:t_stamp ->
  ?revocation_configuration:revocation_configuration ->
  ?certificate_authority_configuration:certificate_authority_configuration ->
  ?failure_reason:failure_reason ->
  ?not_after:t_stamp ->
  ?not_before:t_stamp ->
  ?status:certificate_authority_status ->
  ?serial:string_ ->
  ?type_:certificate_authority_type ->
  ?last_state_change_at:t_stamp ->
  ?created_at:t_stamp ->
  ?owner_account:account_id ->
  ?arn:arn ->
  unit ->
  certificate_authority

val make_list_certificate_authorities_response :
  ?certificate_authorities:certificate_authorities ->
  ?next_token:next_token ->
  unit ->
  list_certificate_authorities_response

val make_list_certificate_authorities_request :
  ?resource_owner:resource_owner ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_certificate_authorities_request

val make_issue_certificate_response : ?certificate_arn:arn -> unit -> issue_certificate_response

val make_extended_key_usage :
  ?extended_key_usage_object_identifier:custom_object_identifier ->
  ?extended_key_usage_type:extended_key_usage_type ->
  unit ->
  extended_key_usage

val make_custom_extension :
  ?critical:boolean_ ->
  value:base64_string1_to4096 ->
  object_identifier:custom_object_identifier ->
  unit ->
  custom_extension

val make_extensions :
  ?custom_extensions:custom_extension_list ->
  ?subject_alternative_names:general_name_list ->
  ?key_usage:key_usage ->
  ?extended_key_usage:extended_key_usage_list ->
  ?certificate_policies:certificate_policy_list ->
  unit ->
  extensions

val make_api_passthrough :
  ?subject:asn1_subject -> ?extensions:extensions -> unit -> api_passthrough

val make_issue_certificate_request :
  ?idempotency_token:idempotency_token ->
  ?validity_not_before:validity ->
  ?template_arn:arn ->
  ?api_passthrough:api_passthrough ->
  validity:validity ->
  signing_algorithm:signing_algorithm ->
  csr:csr_blob ->
  certificate_authority_arn:arn ->
  unit ->
  issue_certificate_request

val make_import_certificate_authority_certificate_request :
  ?certificate_chain:certificate_chain_blob ->
  certificate:certificate_body_blob ->
  certificate_authority_arn:arn ->
  unit ->
  import_certificate_authority_certificate_request

val make_get_policy_response : ?policy:aws_policy -> unit -> get_policy_response
val make_get_policy_request : resource_arn:arn -> unit -> get_policy_request

val make_get_certificate_response :
  ?certificate_chain:certificate_chain ->
  ?certificate:certificate_body ->
  unit ->
  get_certificate_response

val make_get_certificate_request :
  certificate_arn:arn -> certificate_authority_arn:arn -> unit -> get_certificate_request

val make_get_certificate_authority_csr_response :
  ?csr:csr_body -> unit -> get_certificate_authority_csr_response

val make_get_certificate_authority_csr_request :
  certificate_authority_arn:arn -> unit -> get_certificate_authority_csr_request

val make_get_certificate_authority_certificate_response :
  ?certificate_chain:certificate_chain ->
  ?certificate:certificate_body ->
  unit ->
  get_certificate_authority_certificate_response

val make_get_certificate_authority_certificate_request :
  certificate_authority_arn:arn -> unit -> get_certificate_authority_certificate_request

val make_describe_certificate_authority_response :
  ?certificate_authority:certificate_authority -> unit -> describe_certificate_authority_response

val make_describe_certificate_authority_request :
  certificate_authority_arn:arn -> unit -> describe_certificate_authority_request

val make_describe_certificate_authority_audit_report_response :
  ?created_at:t_stamp ->
  ?s3_key:s3_key ->
  ?s3_bucket_name:s3_bucket_name ->
  ?audit_report_status:audit_report_status ->
  unit ->
  describe_certificate_authority_audit_report_response

val make_describe_certificate_authority_audit_report_request :
  audit_report_id:audit_report_id ->
  certificate_authority_arn:arn ->
  unit ->
  describe_certificate_authority_audit_report_request

val make_delete_policy_request : resource_arn:arn -> unit -> delete_policy_request

val make_delete_permission_request :
  ?source_account:account_id ->
  principal:principal ->
  certificate_authority_arn:arn ->
  unit ->
  delete_permission_request

val make_delete_certificate_authority_request :
  ?permanent_deletion_time_in_days:permanent_deletion_time_in_days ->
  certificate_authority_arn:arn ->
  unit ->
  delete_certificate_authority_request

val make_create_permission_request :
  ?source_account:account_id ->
  actions:action_list ->
  principal:principal ->
  certificate_authority_arn:arn ->
  unit ->
  create_permission_request

val make_create_certificate_authority_response :
  ?certificate_authority_arn:arn -> unit -> create_certificate_authority_response

val make_create_certificate_authority_request :
  ?usage_mode:certificate_authority_usage_mode ->
  ?tags:tag_list ->
  ?key_storage_security_standard:key_storage_security_standard ->
  ?idempotency_token:idempotency_token ->
  ?revocation_configuration:revocation_configuration ->
  certificate_authority_type:certificate_authority_type ->
  certificate_authority_configuration:certificate_authority_configuration ->
  unit ->
  create_certificate_authority_request

val make_create_certificate_authority_audit_report_response :
  ?s3_key:s3_key ->
  ?audit_report_id:audit_report_id ->
  unit ->
  create_certificate_authority_audit_report_response

val make_create_certificate_authority_audit_report_request :
  audit_report_response_format:audit_report_response_format ->
  s3_bucket_name:s3_bucket_name ->
  certificate_authority_arn:arn ->
  unit ->
  create_certificate_authority_audit_report_request
(** {1:operations Operations} *)

module CreateCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgsException of invalid_args_exception
    | `InvalidPolicyException of invalid_policy_exception
    | `InvalidTagException of invalid_tag_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_certificate_authority_request ->
    ( create_certificate_authority_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidPolicyException of invalid_policy_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_certificate_authority_request ->
    ( create_certificate_authority_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidPolicyException of invalid_policy_exception
      | `InvalidTagException of invalid_tag_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a root or subordinate private certificate authority (CA). You must specify the CA \
   configuration, an optional configuration for Online Certificate Status Protocol (OCSP) and/or a \
   certificate revocation list (CRL), the CA type, and an optional idempotency token to avoid \
   accidental creation of multiple CAs. The CA configuration specifies the name of the algorithm \
   and key size to be used to create the CA private key, the type of signing algorithm that the CA \
   uses, and X.500 subject information. The OCSP configuration can optionally specify a custom URL \
   for the OCSP responder. The CRL configuration specifies the CRL expiration period in days (the \
   validity period of the CRL), the Amazon S3 bucket that will contain the CRL, and a CNAME alias \
   for the S3 bucket that is included in certificates issued by the CA. If successful, this action \
   returns the Amazon Resource Name (ARN) of the CA.\n\n\
  \  Both Amazon Web Services Private CA and the IAM principal must have permission to write to \
   the S3 bucket that you specify. If the IAM principal making the call does not have permission \
   to write to the bucket, then an exception is thrown. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies}Access \
   policies for CRLs in Amazon S3}.\n\
  \  \n\
  \    Amazon Web Services Private CA assets that are stored in Amazon S3 can be protected with \
   encryption. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#crl-encryption}Encrypting \
   Your CRLs}.\n\
  \    "]

module CreateCertificateAuthorityAuditReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgsException of invalid_args_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_certificate_authority_audit_report_request ->
    ( create_certificate_authority_audit_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_certificate_authority_audit_report_request ->
    ( create_certificate_authority_audit_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an audit report that lists every time that your CA private key is used to issue a \
   certificate. The \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_IssueCertificate.html}IssueCertificate} \
   and \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_RevokeCertificate.html}RevokeCertificate} \
   actions use the private key.\n\n\
  \ To save the audit report to your designated Amazon S3 bucket, you must create a bucket policy \
   that grants Amazon Web Services Private CA permission to access and write to it. For an example \
   policy, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaAuditReport.html#s3-access}Prepare \
   an Amazon S3 bucket for audit reports}.\n\
  \ \n\
  \  Amazon Web Services Private CA assets that are stored in Amazon S3 can be protected with \
   encryption. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaAuditReport.html#audit-report-encryption}Encrypting \
   Your Audit Reports}.\n\
  \  \n\
  \    You can generate a maximum of one report every 30 minutes.\n\
  \    \n\
  \     "]

module CreatePermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PermissionAlreadyExistsException of permission_already_exists_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PermissionAlreadyExistsException of permission_already_exists_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PermissionAlreadyExistsException of permission_already_exists_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Grants one or more permissions on a private CA to the Certificate Manager (ACM) service \
   principal ([acm.amazonaws.com]). These permissions allow ACM to issue and renew ACM \
   certificates that reside in the same Amazon Web Services account as the CA.\n\n\
  \ You can list current permissions with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListPermissions.html}ListPermissions} \
   action and revoke them with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePermission.html}DeletePermission} \
   action.\n\
  \ \n\
  \   {b About Permissions} \n\
  \  \n\
  \   {ul\n\
  \         {-  If the private CA and the certificates it issues reside in the same account, you \
   can use [CreatePermission] to grant permissions for ACM to carry out automatic certificate \
   renewals.\n\
  \             \n\
  \              }\n\
  \         {-  For automatic certificate renewal to succeed, the ACM service principal needs \
   permissions to create, retrieve, and list certificates.\n\
  \             \n\
  \              }\n\
  \         {-  If the private CA and the ACM certificates reside in different accounts, then \
   permissions cannot be used to enable automatic renewals. Instead, the ACM certificate owner \
   must set up a resource-based policy to enable cross-account issuance and renewals. For more \
   information, see {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html}Using a \
   Resource Based Policy with Amazon Web Services Private CA}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DeleteCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a private certificate authority (CA). You must provide the Amazon Resource Name (ARN) \
   of the private CA that you want to delete. You can find the ARN by calling the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
   action. \n\n\
  \  Deleting a CA will invalidate other CAs and certificates below it in your CA hierarchy.\n\
  \  \n\
  \    Before you can delete a CA that you have created and activated, you must disable it. To do \
   this, call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html}UpdateCertificateAuthority} \
   action and set the {b CertificateAuthorityStatus} parameter to [DISABLED]. \n\
  \    \n\
  \     Additionally, you can delete a CA if you are waiting for it to be created (that is, the \
   status of the CA is [CREATING]). You can also delete it if the CA has been created but you \
   haven't yet imported the signed certificate into Amazon Web Services Private CA (that is, the \
   status of the CA is [PENDING_CERTIFICATE]). \n\
  \     \n\
  \      When you successfully call \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeleteCertificateAuthority.html}DeleteCertificateAuthority}, \
   the CA's status changes to [DELETED]. However, the CA won't be permanently deleted until the \
   restoration period has passed. By default, if you do not set the [PermanentDeletionTimeInDays] \
   parameter, the CA remains restorable for 30 days. You can set the parameter from 7 to 30 days. \
   The \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DescribeCertificateAuthority.html}DescribeCertificateAuthority} \
   action returns the time remaining in the restoration window of a private CA in the [DELETED] \
   state. To restore an eligible CA, call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_RestoreCertificateAuthority.html}RestoreCertificateAuthority} \
   action.\n\
  \      \n\
  \        A private CA can be deleted if it is in the [PENDING_CERTIFICATE], [CREATING], \
   [EXPIRED], [DISABLED], or [FAILED] state. To delete a CA in the [ACTIVE] state, you must first \
   disable it, or else the delete request results in an exception. If you are deleting a private \
   CA in the [PENDING_CERTIFICATE] or [DISABLED] state, you can set the length of its restoration \
   period to 7-30 days. The default is 30. During this time, the status is set to [DELETED] and \
   the CA can be restored. A private CA deleted in the [CREATING] or [FAILED] state has no \
   assigned restoration period and cannot be restored.\n\
  \        \n\
  \         "]

module DeletePermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes permissions on a private CA granted to the Certificate Manager (ACM) service principal \
   (acm.amazonaws.com). \n\n\
  \ These permissions allow ACM to issue and renew ACM certificates that reside in the same Amazon \
   Web Services account as the CA. If you revoke these permissions, ACM will no longer renew the \
   affected certificates automatically.\n\
  \ \n\
  \  Permissions can be granted with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreatePermission.html}CreatePermission} \
   action and listed with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListPermissions.html}ListPermissions} \
   action. \n\
  \  \n\
  \    {b About Permissions} \n\
  \   \n\
  \    {ul\n\
  \          {-  If the private CA and the certificates it issues reside in the same account, you \
   can use [CreatePermission] to grant permissions for ACM to carry out automatic certificate \
   renewals.\n\
  \              \n\
  \               }\n\
  \          {-  For automatic certificate renewal to succeed, the ACM service principal needs \
   permissions to create, retrieve, and list certificates.\n\
  \              \n\
  \               }\n\
  \          {-  If the private CA and the ACM certificates reside in different accounts, then \
   permissions cannot be used to enable automatic renewals. Instead, the ACM certificate owner \
   must set up a resource-based policy to enable cross-account issuance and renewals. For more \
   information, see {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html}Using a \
   Resource Based Policy with Amazon Web Services Private CA}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module DeletePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `LockoutPreventedException of lockout_prevented_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LockoutPreventedException of lockout_prevented_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LockoutPreventedException of lockout_prevented_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the resource-based policy attached to a private CA. Deletion will remove any access \
   that the policy has granted. If there is no policy attached to the private CA, this action will \
   return successful.\n\n\
  \ If you delete a policy that was applied through Amazon Web Services Resource Access Manager \
   (RAM), the CA will be removed from all shares in which it was included. \n\
  \ \n\
  \  The Certificate Manager Service Linked Role that the policy supports is not affected when you \
   delete the policy. \n\
  \  \n\
  \   The current policy can be shown with \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetPolicy.html}GetPolicy} and \
   updated with \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_PutPolicy.html}PutPolicy}.\n\
  \   \n\
  \     {b About Policies} \n\
  \    \n\
  \     {ul\n\
  \           {-  A policy grants access on a private CA to an Amazon Web Services customer \
   account, to Amazon Web Services Organizations, or to an Amazon Web Services Organizations unit. \
   Policies are under the control of a CA administrator. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html}Using a Resource Based \
   Policy with Amazon Web Services Private CA}.\n\
  \               \n\
  \                }\n\
  \           {-  A policy permits a user of Certificate Manager (ACM) to issue ACM certificates \
   signed by a CA in another account.\n\
  \               \n\
  \                }\n\
  \           {-  For ACM to manage automatic renewal of these certificates, the ACM user must \
   configure a Service Linked Role (SLR). The SLR allows the ACM service to assume the identity of \
   the user, subject to confirmation against the Amazon Web Services Private CA policy. For more \
   information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html}Using a \
   Service Linked Role with ACM}.\n\
  \               \n\
  \                }\n\
  \           {-  Updates made in Amazon Web Services Resource Manager (RAM) are reflected in \
   policies. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html}Attach a Policy for \
   Cross-Account Access}.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module DescribeCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_authority_request ->
    ( describe_certificate_authority_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_authority_request ->
    ( describe_certificate_authority_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists information about your private certificate authority (CA) or one that has been shared \
   with you. You specify the private CA on input by its ARN (Amazon Resource Name). The output \
   contains the status of your CA. This can be any of the following: \n\n\
  \ {ul\n\
  \       {-   [CREATING] - Amazon Web Services Private CA is creating your private certificate \
   authority.\n\
  \           \n\
  \            }\n\
  \       {-   [PENDING_CERTIFICATE] - The certificate is pending. You must use your Amazon Web \
   Services Private CA-hosted or on-premises root or subordinate CA to sign your private CA CSR \
   and then import it into Amazon Web Services Private CA. \n\
  \           \n\
  \            }\n\
  \       {-   [ACTIVE] - Your private CA is active.\n\
  \           \n\
  \            }\n\
  \       {-   [DISABLED] - Your private CA has been disabled.\n\
  \           \n\
  \            }\n\
  \       {-   [EXPIRED] - Your private CA certificate has expired.\n\
  \           \n\
  \            }\n\
  \       {-   [FAILED] - Your private CA has failed. Your CA can fail because of problems such a \
   network outage or back-end Amazon Web Services failure or other errors. A failed CA can never \
   return to the pending state. You must create a new CA. \n\
  \           \n\
  \            }\n\
  \       {-   [DELETED] - Your private CA is within the restoration period, after which it is \
   permanently deleted. The length of time remaining in the CA's restoration period is also \
   included in this action's output.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeCertificateAuthorityAuditReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgsException of invalid_args_exception
    | `InvalidArnException of invalid_arn_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_authority_audit_report_request ->
    ( describe_certificate_authority_audit_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_authority_audit_report_request ->
    ( describe_certificate_authority_audit_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists information about a specific audit report created by calling the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html}CreateCertificateAuthorityAuditReport} \
   action. Audit information is created every time the certificate authority (CA) private key is \
   used. The private key is used when you call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_IssueCertificate.html}IssueCertificate} \
   action or the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_RevokeCertificate.html}RevokeCertificate} \
   action. \n"]

module GetCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_request ->
    ( get_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_request ->
    ( get_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a certificate from your private CA or one that has been shared with you. The ARN of \
   the certificate is returned when you call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_IssueCertificate.html}IssueCertificate} \
   action. You must specify both the ARN of your private CA and the ARN of the issued certificate \
   when calling the {b GetCertificate} action. You can retrieve the certificate if it is in the {b \
   ISSUED}, {b EXPIRED}, or {b REVOKED} state. You can call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html}CreateCertificateAuthorityAuditReport} \
   action to create a report that contains information about all of the certificates issued and \
   revoked by your private CA. \n"]

module GetCertificateAuthorityCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_authority_certificate_request ->
    ( get_certificate_authority_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_authority_certificate_request ->
    ( get_certificate_authority_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the certificate and certificate chain for your private certificate authority (CA) or \
   one that has been shared with you. Both the certificate and the chain are base64 PEM-encoded. \
   The chain does not include the CA certificate. Each certificate in the chain signs the one \
   before it. \n"]

module GetCertificateAuthorityCsr : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_authority_csr_request ->
    ( get_certificate_authority_csr_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_authority_csr_request ->
    ( get_certificate_authority_csr_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the certificate signing request (CSR) for your private certificate authority (CA). \
   The CSR is created when you call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
   action. Sign the CSR with your Amazon Web Services Private CA-hosted or on-premises root or \
   subordinate CA. Then import the signed certificate back into Amazon Web Services Private CA by \
   calling the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html}ImportCertificateAuthorityCertificate} \
   action. The CSR is returned as a base64 PEM-encoded string. \n"]

module GetPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_request ->
    ( get_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_request ->
    ( get_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the resource-based policy attached to a private CA. If either the private CA resource \
   or the policy cannot be found, this action returns a [ResourceNotFoundException]. \n\n\
  \ The policy can be attached or updated with \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_PutPolicy.html}PutPolicy} and \
   removed with \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePolicy.html}DeletePolicy}.\n\
  \ \n\
  \   {b About Policies} \n\
  \  \n\
  \   {ul\n\
  \         {-  A policy grants access on a private CA to an Amazon Web Services customer account, \
   to Amazon Web Services Organizations, or to an Amazon Web Services Organizations unit. Policies \
   are under the control of a CA administrator. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html}Using a Resource Based \
   Policy with Amazon Web Services Private CA}.\n\
  \             \n\
  \              }\n\
  \         {-  A policy permits a user of Certificate Manager (ACM) to issue ACM certificates \
   signed by a CA in another account.\n\
  \             \n\
  \              }\n\
  \         {-  For ACM to manage automatic renewal of these certificates, the ACM user must \
   configure a Service Linked Role (SLR). The SLR allows the ACM service to assume the identity of \
   the user, subject to confirmation against the Amazon Web Services Private CA policy. For more \
   information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html}Using a \
   Service Linked Role with ACM}.\n\
  \             \n\
  \              }\n\
  \         {-  Updates made in Amazon Web Services Resource Manager (RAM) are reflected in \
   policies. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html}Attach a Policy for \
   Cross-Account Access}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module ImportCertificateAuthorityCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateMismatchException of certificate_mismatch_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `MalformedCertificateException of malformed_certificate_exception
    | `RequestFailedException of request_failed_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_authority_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateMismatchException of certificate_mismatch_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `MalformedCertificateException of malformed_certificate_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_authority_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateMismatchException of certificate_mismatch_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `MalformedCertificateException of malformed_certificate_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports a signed private CA certificate into Amazon Web Services Private CA. This action is \
   used when you are using a chain of trust whose root is located outside Amazon Web Services \
   Private CA. Before you can call this action, the following preparations must in place:\n\n\
  \ {ol\n\
  \       {-  In Amazon Web Services Private CA, call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
   action to create the private CA that you plan to back with the imported certificate.\n\
  \           \n\
  \            }\n\
  \       {-  Call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificateAuthorityCsr.html}GetCertificateAuthorityCsr} \
   action to generate a certificate signing request (CSR).\n\
  \           \n\
  \            }\n\
  \       {-  Sign the CSR using a root or intermediate CA hosted by either an on-premises PKI \
   hierarchy or by a commercial CA.\n\
  \           \n\
  \            }\n\
  \       {-  Create a certificate chain and copy the signed certificate and the certificate chain \
   to your working directory.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Amazon Web Services Private CA supports three scenarios for installing a CA certificate:\n\
  \   \n\
  \    {ul\n\
  \          {-  Installing a certificate for a root CA hosted by Amazon Web Services Private CA.\n\
  \              \n\
  \               }\n\
  \          {-  Installing a subordinate CA certificate whose parent authority is hosted by \
   Amazon Web Services Private CA.\n\
  \              \n\
  \               }\n\
  \          {-  Installing a subordinate CA certificate whose parent authority is externally \
   hosted.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   The following additional requirements apply when you import a CA certificate.\n\
  \   \n\
  \    {ul\n\
  \          {-  Only a self-signed certificate can be imported as a root CA.\n\
  \              \n\
  \               }\n\
  \          {-  A self-signed certificate cannot be imported as a subordinate CA.\n\
  \              \n\
  \               }\n\
  \          {-  Your certificate chain must not include the private CA certificate that you are \
   importing.\n\
  \              \n\
  \               }\n\
  \          {-  Your root CA must be the last certificate in your chain. The subordinate \
   certificate, if any, that your root CA signed must be next to last. The subordinate certificate \
   signed by the preceding subordinate CA must come next, and so on until your chain is built. \n\
  \              \n\
  \               }\n\
  \          {-  The chain must be PEM-encoded.\n\
  \              \n\
  \               }\n\
  \          {-  The maximum allowed size of a certificate is 32 KB.\n\
  \              \n\
  \               }\n\
  \          {-  The maximum allowed size of a certificate chain is 2 MB.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {i Enforcement of Critical Constraints} \n\
  \   \n\
  \    Amazon Web Services Private CA allows the following extensions to be marked critical in the \
   imported CA certificate or chain.\n\
  \    \n\
  \     {ul\n\
  \           {-  Authority key identifier\n\
  \               \n\
  \                }\n\
  \           {-  Basic constraints ({i must} be marked critical)\n\
  \               \n\
  \                }\n\
  \           {-  Certificate policies\n\
  \               \n\
  \                }\n\
  \           {-  Extended key usage\n\
  \               \n\
  \                }\n\
  \           {-  Inhibit anyPolicy\n\
  \               \n\
  \                }\n\
  \           {-  Issuer alternative name\n\
  \               \n\
  \                }\n\
  \           {-  Key usage\n\
  \               \n\
  \                }\n\
  \           {-  Name constraints\n\
  \               \n\
  \                }\n\
  \           {-  Policy mappings\n\
  \               \n\
  \                }\n\
  \           {-  Subject alternative name\n\
  \               \n\
  \                }\n\
  \           {-  Subject directory attributes\n\
  \               \n\
  \                }\n\
  \           {-  Subject key identifier\n\
  \               \n\
  \                }\n\
  \           {-  Subject information access\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Amazon Web Services Private CA rejects the following extensions when they are marked \
   critical in an imported CA certificate or chain.\n\
  \   \n\
  \    {ul\n\
  \          {-  Authority information access\n\
  \              \n\
  \               }\n\
  \          {-  CRL distribution points\n\
  \              \n\
  \               }\n\
  \          {-  Freshest CRL\n\
  \              \n\
  \               }\n\
  \          {-  Policy constraints\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Amazon Web Services Private Certificate Authority will also reject any other extension \
   marked as critical not contained on the preceding list of allowed extensions.\n\
  \   "]

module IssueCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgsException of invalid_args_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedCSRException of malformed_csr_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    issue_certificate_request ->
    ( issue_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedCSRException of malformed_csr_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    issue_certificate_request ->
    ( issue_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedCSRException of malformed_csr_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uses your private certificate authority (CA), or one that has been shared with you, to issue a \
   client certificate. This action returns the Amazon Resource Name (ARN) of the certificate. You \
   can retrieve the certificate by calling the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificate.html}GetCertificate} \
   action and specifying the ARN. \n\n\
  \  You cannot use the ACM {b ListCertificateAuthorities} action to retrieve the ARNs of the \
   certificates that you issue by using Amazon Web Services Private CA.\n\
  \  \n\
  \   "]

module ListCertificateAuthorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_certificate_authorities_request ->
    ( list_certificate_authorities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_certificate_authorities_request ->
    ( list_certificate_authorities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the private certificate authorities that you created by using the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html}CreateCertificateAuthority} \
   action.\n"]

module ListPermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_permissions_request ->
    ( list_permissions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_permissions_request ->
    ( list_permissions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all permissions on a private CA, if any, granted to the Certificate Manager (ACM) service \
   principal (acm.amazonaws.com). \n\n\
  \ These permissions allow ACM to issue and renew ACM certificates that reside in the same Amazon \
   Web Services account as the CA. \n\
  \ \n\
  \  Permissions can be granted with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreatePermission.html}CreatePermission} \
   action and revoked with the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePermission.html}DeletePermission} \
   action.\n\
  \  \n\
  \    {b About Permissions} \n\
  \   \n\
  \    {ul\n\
  \          {-  If the private CA and the certificates it issues reside in the same account, you \
   can use [CreatePermission] to grant permissions for ACM to carry out automatic certificate \
   renewals.\n\
  \              \n\
  \               }\n\
  \          {-  For automatic certificate renewal to succeed, the ACM service principal needs \
   permissions to create, retrieve, and list certificates.\n\
  \              \n\
  \               }\n\
  \          {-  If the private CA and the ACM certificates reside in different accounts, then \
   permissions cannot be used to enable automatic renewals. Instead, the ACM certificate owner \
   must set up a resource-based policy to enable cross-account issuance and renewals. For more \
   information, see {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html}Using a \
   Resource Based Policy with Amazon Web Services Private CA}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ListTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_request ->
    ( list_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags, if any, that are associated with your private CA or one that has been shared \
   with you. Tags are labels that you can use to identify and organize your CAs. Each tag consists \
   of a key and an optional value. Call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_TagCertificateAuthority.html}TagCertificateAuthority} \
   action to add one or more tags to your CA. Call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UntagCertificateAuthority.html}UntagCertificateAuthority} \
   action to remove tags. \n"]

module PutPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidPolicyException of invalid_policy_exception
    | `InvalidStateException of invalid_state_exception
    | `LockoutPreventedException of lockout_prevented_exception
    | `RequestFailedException of request_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidPolicyException of invalid_policy_exception
      | `InvalidStateException of invalid_state_exception
      | `LockoutPreventedException of lockout_prevented_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidPolicyException of invalid_policy_exception
      | `InvalidStateException of invalid_state_exception
      | `LockoutPreventedException of lockout_prevented_exception
      | `RequestFailedException of request_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a resource-based policy to a private CA. \n\n\
  \ A policy can also be applied by sharing a private CA through Amazon Web Services Resource \
   Access Manager (RAM). For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html}Attach a Policy for \
   Cross-Account Access}.\n\
  \ \n\
  \  The policy can be displayed with \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetPolicy.html}GetPolicy} and \
   removed with \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePolicy.html}DeletePolicy}.\n\
  \  \n\
  \    {b About Policies} \n\
  \   \n\
  \    {ul\n\
  \          {-  A policy grants access on a private CA to an Amazon Web Services customer \
   account, to Amazon Web Services Organizations, or to an Amazon Web Services Organizations unit. \
   Policies are under the control of a CA administrator. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html}Using a Resource Based \
   Policy with Amazon Web Services Private CA}.\n\
  \              \n\
  \               }\n\
  \          {-  A policy permits a user of Certificate Manager (ACM) to issue ACM certificates \
   signed by a CA in another account.\n\
  \              \n\
  \               }\n\
  \          {-  For ACM to manage automatic renewal of these certificates, the ACM user must \
   configure a Service Linked Role (SLR). The SLR allows the ACM service to assume the identity of \
   the user, subject to confirmation against the Amazon Web Services Private CA policy. For more \
   information, see {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html}Using a \
   Service Linked Role with ACM}.\n\
  \              \n\
  \               }\n\
  \          {-  Updates made in Amazon Web Services Resource Manager (RAM) are reflected in \
   policies. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html}Attach a Policy for \
   Cross-Account Access}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module RestoreCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a certificate authority (CA) that is in the [DELETED] state. You can restore a CA \
   during the period that you defined in the {b PermanentDeletionTimeInDays} parameter of the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeleteCertificateAuthority.html}DeleteCertificateAuthority} \
   action. Currently, you can specify 7 to 30 days. If you did not specify a {b \
   PermanentDeletionTimeInDays} value, by default you can restore the CA at any time in a 30 day \
   period. You can check the time remaining in the restoration period of a private CA in the \
   [DELETED] state by calling the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_DescribeCertificateAuthority.html}DescribeCertificateAuthority} \
   or \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html}ListCertificateAuthorities} \
   actions. The status of a restored CA is set to its pre-deletion status when the {b \
   RestoreCertificateAuthority} action returns. To change its status to [ACTIVE], call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html}UpdateCertificateAuthority} \
   action. If the private CA was in the [PENDING_CERTIFICATE] state at deletion, you must use the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html}ImportCertificateAuthorityCertificate} \
   action to import a certificate authority into the private CA before it can be activated. You \
   cannot restore a CA after the restoration period has ended.\n"]

module RevokeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RequestAlreadyProcessedException of request_already_processed_exception
    | `RequestFailedException of request_failed_exception
    | `RequestInProgressException of request_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestAlreadyProcessedException of request_already_processed_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RequestAlreadyProcessedException of request_already_processed_exception
      | `RequestFailedException of request_failed_exception
      | `RequestInProgressException of request_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes a certificate that was issued inside Amazon Web Services Private CA. If you enable a \
   certificate revocation list (CRL) when you create or update your private CA, information about \
   the revoked certificates will be included in the CRL. Amazon Web Services Private CA writes the \
   CRL to an S3 bucket that you specify. A CRL is typically updated approximately 30 minutes after \
   a certificate is revoked. If for any reason the CRL update fails, Amazon Web Services Private \
   CA attempts makes further attempts every 15 minutes. With Amazon CloudWatch, you can create \
   alarms for the metrics [CRLGenerated] and [MisconfiguredCRLBucket]. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/PcaCloudWatch.html}Supported \
   CloudWatch Metrics}.\n\n\
  \  Both Amazon Web Services Private CA and the IAM principal must have permission to write to \
   the S3 bucket that you specify. If the IAM principal making the call does not have permission \
   to write to the bucket, then an exception is thrown. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies}Access \
   policies for CRLs in Amazon S3}.\n\
  \  \n\
  \    Amazon Web Services Private CA also writes revocation information to the audit report. For \
   more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html}CreateCertificateAuthorityAuditReport}.\n\
  \    \n\
  \      You cannot revoke a root CA self-signed certificate.\n\
  \      \n\
  \       "]

module TagCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to your private CA. Tags are labels that you can use to identify and \
   organize your Amazon Web Services resources. Each tag consists of a key and an optional value. \
   You specify the private CA on input by its Amazon Resource Name (ARN). You specify the tag by \
   using a key-value pair. You can apply a tag to just one private CA if you want to identify a \
   specific characteristic of that CA, or you can apply the same tag to multiple private CAs if \
   you want to filter for a common relationship among those CAs. To remove one or more tags, use \
   the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_UntagCertificateAuthority.html}UntagCertificateAuthority} \
   action. Call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListTags.html}ListTags} action \
   to see what tags are associated with your CA. \n\n\
  \  To attach tags to a private CA during the creation procedure, a CA administrator must first \
   associate an inline IAM policy with the [CreateCertificateAuthority] action and explicitly \
   allow tagging. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/auth-InlinePolicies.html#policy-tag-ca}Attaching \
   tags to a CA at the time of creation}.\n\
  \  \n\
  \   "]

module UntagCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidStateException of invalid_state_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidStateException of invalid_state_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove one or more tags from your private CA. A tag consists of a key-value pair. If you do not \
   specify the value portion of the tag when calling this action, the tag will be removed \
   regardless of value. If you specify a value, the tag is removed only if it is associated with \
   the specified value. To add tags to a private CA, use the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_TagCertificateAuthority.html}TagCertificateAuthority}. \
   Call the \
   {{:https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListTags.html}ListTags} action \
   to see what tags are associated with your CA. \n"]

(** {1:Serialization and Deserialization} *)
module UpdateCertificateAuthority : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgsException of invalid_args_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidPolicyException of invalid_policy_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidPolicyException of invalid_policy_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_authority_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgsException of invalid_args_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidPolicyException of invalid_policy_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the status or configuration of a private certificate authority (CA). Your private CA \
   must be in the [ACTIVE] or [DISABLED] state before you can update it. You can disable a private \
   CA that is in the [ACTIVE] state or make a CA that is in the [DISABLED] state active again.\n\n\
  \  Both Amazon Web Services Private CA and the IAM principal must have permission to write to \
   the S3 bucket that you specify. If the IAM principal making the call does not have permission \
   to write to the bucket, then an exception is thrown. For more information, see \
   {{:https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies}Access \
   policies for CRLs in Amazon S3}.\n\
  \  \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
