(** STS client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_tag : value:tag_value_type -> key:tag_key_type -> unit -> tag
val make_policy_descriptor_type : ?arn:arn_type -> unit -> policy_descriptor_type

val make_provided_context :
  ?context_assertion:context_assertion_type -> ?provider_arn:arn_type -> unit -> provided_context

val make_credentials :
  expiration:date_type ->
  session_token:token_type ->
  secret_access_key:access_key_secret_type ->
  access_key_id:access_key_id_type ->
  unit ->
  credentials

val make_get_session_token_response : ?credentials:credentials -> unit -> get_session_token_response

val make_get_session_token_request :
  ?token_code:token_code_type ->
  ?serial_number:serial_number_type ->
  ?duration_seconds:duration_seconds_type ->
  unit ->
  get_session_token_request

val make_federated_user :
  arn:arn_type -> federated_user_id:federated_id_type -> unit -> federated_user

val make_get_federation_token_response :
  ?packed_policy_size:non_negative_integer_type ->
  ?federated_user:federated_user ->
  ?credentials:credentials ->
  unit ->
  get_federation_token_response

val make_get_federation_token_request :
  ?tags:tag_list_type ->
  ?duration_seconds:duration_seconds_type ->
  ?policy_arns:policy_descriptor_list_type ->
  ?policy:session_policy_document_type ->
  name:user_name_type ->
  unit ->
  get_federation_token_request

val make_get_caller_identity_response :
  ?arn:arn_type ->
  ?account:account_type ->
  ?user_id:user_id_type ->
  unit ->
  get_caller_identity_response

val make_get_caller_identity_request : unit -> unit

val make_get_access_key_info_response :
  ?account:account_type -> unit -> get_access_key_info_response

val make_get_access_key_info_request :
  access_key_id:access_key_id_type -> unit -> get_access_key_info_request

val make_decode_authorization_message_response :
  ?decoded_message:decoded_message_type -> unit -> decode_authorization_message_response

val make_decode_authorization_message_request :
  encoded_message:encoded_message_type -> unit -> decode_authorization_message_request

val make_assumed_role_user :
  arn:arn_type -> assumed_role_id:assumed_role_id_type -> unit -> assumed_role_user

val make_assume_root_response :
  ?source_identity:source_identity_type -> ?credentials:credentials -> unit -> assume_root_response

val make_assume_root_request :
  ?duration_seconds:root_duration_seconds_type ->
  task_policy_arn:policy_descriptor_type ->
  target_principal:target_principal_type ->
  unit ->
  assume_root_request

val make_assume_role_with_web_identity_response :
  ?source_identity:source_identity_type ->
  ?audience:audience ->
  ?provider:issuer ->
  ?packed_policy_size:non_negative_integer_type ->
  ?assumed_role_user:assumed_role_user ->
  ?subject_from_web_identity_token:web_identity_subject_type ->
  ?credentials:credentials ->
  unit ->
  assume_role_with_web_identity_response

val make_assume_role_with_web_identity_request :
  ?duration_seconds:role_duration_seconds_type ->
  ?policy:session_policy_document_type ->
  ?policy_arns:policy_descriptor_list_type ->
  ?provider_id:url_type ->
  web_identity_token:client_token_type ->
  role_session_name:role_session_name_type ->
  role_arn:arn_type ->
  unit ->
  assume_role_with_web_identity_request

val make_assume_role_with_saml_response :
  ?source_identity:source_identity_type ->
  ?name_qualifier:name_qualifier ->
  ?audience:audience ->
  ?issuer:issuer ->
  ?subject_type:subject_type ->
  ?subject:subject ->
  ?packed_policy_size:non_negative_integer_type ->
  ?assumed_role_user:assumed_role_user ->
  ?credentials:credentials ->
  unit ->
  assume_role_with_saml_response

val make_assume_role_with_saml_request :
  ?duration_seconds:role_duration_seconds_type ->
  ?policy:session_policy_document_type ->
  ?policy_arns:policy_descriptor_list_type ->
  saml_assertion:saml_assertion_type ->
  principal_arn:arn_type ->
  role_arn:arn_type ->
  unit ->
  assume_role_with_saml_request

val make_assume_role_response :
  ?source_identity:source_identity_type ->
  ?packed_policy_size:non_negative_integer_type ->
  ?assumed_role_user:assumed_role_user ->
  ?credentials:credentials ->
  unit ->
  assume_role_response

val make_assume_role_request :
  ?provided_contexts:provided_contexts_list_type ->
  ?source_identity:source_identity_type ->
  ?token_code:token_code_type ->
  ?serial_number:serial_number_type ->
  ?external_id:external_id_type ->
  ?transitive_tag_keys:tag_key_list_type ->
  ?tags:tag_list_type ->
  ?duration_seconds:role_duration_seconds_type ->
  ?policy:unrestricted_session_policy_document_type ->
  ?policy_arns:policy_descriptor_list_type ->
  role_session_name:role_session_name_type ->
  role_arn:arn_type ->
  unit ->
  assume_role_request
(** {1:operations Operations} *)

module AssumeRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ExpiredTokenException of expired_token_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PackedPolicyTooLargeException of packed_policy_too_large_exception
    | `RegionDisabledException of region_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    assume_role_request ->
    ( assume_role_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExpiredTokenException of expired_token_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PackedPolicyTooLargeException of packed_policy_too_large_exception
      | `RegionDisabledException of region_disabled_exception ] )
    result
end
[@@ocaml.doc
  "Returns a set of temporary security credentials that you can use to access Amazon Web Services \
   resources. These temporary credentials consist of an access key ID, a secret access key, and a \
   security token. Typically, you use [AssumeRole] within your account or for cross-account \
   access. For a comparison of [AssumeRole] with other API operations that produce temporary \
   credentials, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html}Requesting \
   Temporary Security Credentials} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_sts-comparison.html}Compare \
   STS credentials} in the {i IAM User Guide}.\n\n\
  \  {b Permissions} \n\
  \ \n\
  \  The temporary security credentials created by [AssumeRole] can be used to make API calls to \
   any Amazon Web Services service with the following exception: You cannot call the Amazon Web \
   Services STS [GetFederationToken] or [GetSessionToken] API operations.\n\
  \  \n\
  \   (Optional) You can pass inline or managed session policies to this operation. You can pass a \
   single JSON policy document to use as an inline session policy. You can also specify up to 10 \
   managed policy Amazon Resource Names (ARNs) to use as managed session policies. The plaintext \
   that you use for both inline and managed session policies can't exceed 2,048 characters. \
   Passing policies to this operation returns new temporary credentials. The resulting session's \
   permissions are the intersection of the role's identity-based policy and the session policies. \
   You can use the role's temporary credentials in subsequent Amazon Web Services API calls to \
   access resources in the account that owns the role. You cannot use session policies to grant \
   more permissions than those allowed by the identity-based policy of the role that is being \
   assumed. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
   Policies} in the {i IAM User Guide}.\n\
  \   \n\
  \    When you create a role, you create two policies: a role trust policy that specifies {i who} \
   can assume the role, and a permissions policy that specifies {i what} can be done with the \
   role. You specify the trusted principal that is allowed to assume the role in the role trust \
   policy.\n\
  \    \n\
  \     To assume a role from a different account, your Amazon Web Services account must be \
   trusted by the role. The trust relationship is defined in the role's trust policy when the role \
   is created. That trust policy states which accounts are allowed to delegate that access to \
   users in the account. \n\
  \     \n\
  \      A user who wants to access a role in a different account must also have permissions that \
   are delegated from the account administrator. The administrator must attach a policy that \
   allows the user to call [AssumeRole] for the ARN of the role in the other account.\n\
  \      \n\
  \       To allow a user to assume a role in the same account, you can do either of the following:\n\
  \       \n\
  \        {ul\n\
  \              {-  Attach a policy to the user that allows the user to call [AssumeRole] (as \
   long as the role's trust policy trusts the account).\n\
  \                  \n\
  \                   }\n\
  \              {-  Add the user as a principal directly in the role's trust policy.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   You can do either because the role\226\128\153s trust policy acts as an IAM resource-based \
   policy. When a resource-based policy grants access to a principal in the same account, no \
   additional identity-based policy is required. For more information about trust policies and \
   resource-based policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies} in the \
   {i IAM User Guide}.\n\
  \   \n\
  \     {b Tags} \n\
  \    \n\
  \     (Optional) You can pass tag key-value pairs to your session. These tags are called session \
   tags. For more information about session tags, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Passing Session Tags \
   in STS} in the {i IAM User Guide}.\n\
  \     \n\
  \      An administrator must grant you the permissions necessary to pass session tags. The \
   administrator can also create granular permissions to allow you to pass only specific session \
   tags. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html}Tutorial: \
   Using Tags for Attribute-Based Access Control} in the {i IAM User Guide}.\n\
  \      \n\
  \       You can set the session tags as transitive. Transitive tags persist during role \
   chaining. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining}Chaining \
   Roles with Session Tags} in the {i IAM User Guide}.\n\
  \       \n\
  \         {b Using MFA with AssumeRole} \n\
  \        \n\
  \         (Optional) You can include multi-factor authentication (MFA) information when you call \
   [AssumeRole]. This is useful for cross-account scenarios to ensure that the user that assumes \
   the role has been authenticated with an Amazon Web Services MFA device. In that scenario, the \
   trust policy of the role being assumed includes a condition that tests for MFA authentication. \
   If the caller does not include valid MFA information, the request to assume the role is denied. \
   The condition in a trust policy that tests for MFA authentication might look like the following \
   example.\n\
  \         \n\
  \           [\"Condition\": {\"Bool\": {\"aws:MultiFactorAuthPresent\": true}}] \n\
  \          \n\
  \           For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/MFAProtectedAPI.html}Configuring \
   MFA-Protected API Access} in the {i IAM User Guide} guide.\n\
  \           \n\
  \            To use MFA with [AssumeRole], you pass values for the [SerialNumber] and \
   [TokenCode] parameters. The [SerialNumber] value identifies the user's hardware or virtual MFA \
   device. The [TokenCode] is the time-based one-time password (TOTP) that the MFA device \
   produces. \n\
  \            "]

module AssumeRoleWithSAML : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ExpiredTokenException of expired_token_exception
    | `IDPRejectedClaimException of idp_rejected_claim_exception
    | `InvalidIdentityTokenException of invalid_identity_token_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PackedPolicyTooLargeException of packed_policy_too_large_exception
    | `RegionDisabledException of region_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    assume_role_with_saml_request ->
    ( assume_role_with_saml_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExpiredTokenException of expired_token_exception
      | `IDPRejectedClaimException of idp_rejected_claim_exception
      | `InvalidIdentityTokenException of invalid_identity_token_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PackedPolicyTooLargeException of packed_policy_too_large_exception
      | `RegionDisabledException of region_disabled_exception ] )
    result
end
[@@ocaml.doc
  "Returns a set of temporary security credentials for users who have been authenticated via a \
   SAML authentication response. This operation provides a mechanism for tying an enterprise \
   identity store or directory to role-based Amazon Web Services access without user-specific \
   credentials or configuration. For a comparison of [AssumeRoleWithSAML] with the other API \
   operations that produce temporary credentials, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html}Requesting \
   Temporary Security Credentials} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_sts-comparison.html}Compare \
   STS credentials} in the {i IAM User Guide}.\n\n\
  \ The temporary security credentials returned by this operation consist of an access key ID, a \
   secret access key, and a security token. Applications can use these temporary security \
   credentials to sign calls to Amazon Web Services services.\n\
  \ \n\
  \   {b Session Duration} \n\
  \  \n\
  \   By default, the temporary security credentials created by [AssumeRoleWithSAML] last for one \
   hour. However, you can use the optional [DurationSeconds] parameter to specify the duration of \
   your session. Your role session lasts for the duration that you specify, or until the time \
   specified in the SAML authentication response's [SessionNotOnOrAfter] value, whichever is \
   shorter. You can provide a [DurationSeconds] value from 900 seconds (15 minutes) up to the \
   maximum session duration setting for the role. This setting can have a value from 1 hour to 12 \
   hours. To learn how to view the maximum value for your role, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session}View \
   the Maximum Session Duration Setting for a Role} in the {i IAM User Guide}. The maximum session \
   duration limit applies when you use the [AssumeRole*] API operations or the [assume-role*] CLI \
   commands. However the limit does not apply when you use those operations to create a console \
   URL. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html}Using IAM Roles} in the \
   {i IAM User Guide}.\n\
  \   \n\
  \      \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-role-chaining}Role \
   chaining} limits your CLI or Amazon Web Services API role session to a maximum of one hour. \
   When you use the [AssumeRole] API operation to assume a role, you can specify the duration of \
   your role session with the [DurationSeconds] parameter. You can specify a parameter value of up \
   to 43200 seconds (12 hours), depending on the maximum session duration setting for your role. \
   However, if you assume a role using role chaining and provide a [DurationSeconds] parameter \
   value greater than one hour, the operation fails.\n\
  \     \n\
  \        {b Permissions} \n\
  \       \n\
  \        The temporary security credentials created by [AssumeRoleWithSAML] can be used to make \
   API calls to any Amazon Web Services service with the following exception: you cannot call the \
   STS [GetFederationToken] or [GetSessionToken] API operations.\n\
  \        \n\
  \         (Optional) You can pass inline or managed \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}session \
   policies} to this operation. You can pass a single JSON policy document to use as an inline \
   session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to \
   use as managed session policies. The plaintext that you use for both inline and managed session \
   policies can't exceed 2,048 characters. Passing policies to this operation returns new \
   temporary credentials. The resulting session's permissions are the intersection of the role's \
   identity-based policy and the session policies. You can use the role's temporary credentials in \
   subsequent Amazon Web Services API calls to access resources in the account that owns the role. \
   You cannot use session policies to grant more permissions than those allowed by the \
   identity-based policy of the role that is being assumed. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
   Policies} in the {i IAM User Guide}.\n\
  \         \n\
  \          Calling [AssumeRoleWithSAML] does not require the use of Amazon Web Services security \
   credentials. The identity of the caller is validated by using keys in the metadata document \
   that is uploaded for the SAML provider entity for your identity provider. \n\
  \          \n\
  \            Calling [AssumeRoleWithSAML] can result in an entry in your CloudTrail logs. The \
   entry includes the value in the [NameID] element of the SAML assertion. We recommend that you \
   use a [NameIDType] that is not associated with any personally identifiable information (PII). \
   For example, you could instead use the persistent identifier \
   ([urn:oasis:names:tc:SAML:2.0:nameid-format:persistent]).\n\
  \            \n\
  \               {b Tags} \n\
  \              \n\
  \               (Optional) You can configure your IdP to pass attributes into your SAML \
   assertion as session tags. Each session tag consists of a key name and an associated value. For \
   more information about session tags, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Passing Session Tags \
   in STS} in the {i IAM User Guide}.\n\
  \               \n\
  \                You can pass up to 50 session tags. The plaintext session tag keys \
   can\226\128\153t exceed 128 characters and the values can\226\128\153t exceed 256 characters. \
   For these and additional limits, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length}IAM \
   and STS Character Limits} in the {i IAM User Guide}.\n\
  \                \n\
  \                  An Amazon Web Services conversion compresses the passed inline session \
   policy, managed policy ARNs, and session tags into a packed binary format that has a separate \
   limit. Your request can fail for this limit even if your plaintext meets the other \
   requirements. The [PackedPolicySize] response element indicates by percentage how close the \
   policies and tags for your request are to the upper size limit.\n\
  \                  \n\
  \                    You can pass a session tag with the same key as a tag that is attached to \
   the role. When you do, session tags override the role's tags with the same key.\n\
  \                    \n\
  \                     An administrator must grant you the permissions necessary to pass session \
   tags. The administrator can also create granular permissions to allow you to pass only specific \
   session tags. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html}Tutorial: \
   Using Tags for Attribute-Based Access Control} in the {i IAM User Guide}.\n\
  \                     \n\
  \                      You can set the session tags as transitive. Transitive tags persist \
   during role chaining. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining}Chaining \
   Roles with Session Tags} in the {i IAM User Guide}.\n\
  \                      \n\
  \                        {b SAML Configuration} \n\
  \                       \n\
  \                        Before your application can call [AssumeRoleWithSAML], you must \
   configure your SAML identity provider (IdP) to issue the claims required by Amazon Web \
   Services. Additionally, you must use Identity and Access Management (IAM) to create a SAML \
   provider entity in your Amazon Web Services account that represents your identity provider. You \
   must also create an IAM role that specifies this SAML provider in its trust policy. \n\
  \                        \n\
  \                         For more information, see the following resources:\n\
  \                         \n\
  \                          {ul\n\
  \                                {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html}About SAML \
   2.0-based Federation} in the {i IAM User Guide}. \n\
  \                                    \n\
  \                                     }\n\
  \                                {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml.html}Creating \
   SAML Identity Providers} in the {i IAM User Guide}. \n\
  \                                    \n\
  \                                     }\n\
  \                                {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml_relying-party.html}Configuring \
   a Relying Party and Claims} in the {i IAM User Guide}. \n\
  \                                    \n\
  \                                     }\n\
  \                                {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_saml.html}Creating \
   a Role for SAML 2.0 Federation} in the {i IAM User Guide}. \n\
  \                                    \n\
  \                                     }\n\
  \                                }\n\
  \  "]

module AssumeRoleWithWebIdentity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ExpiredTokenException of expired_token_exception
    | `IDPCommunicationErrorException of idp_communication_error_exception
    | `IDPRejectedClaimException of idp_rejected_claim_exception
    | `InvalidIdentityTokenException of invalid_identity_token_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PackedPolicyTooLargeException of packed_policy_too_large_exception
    | `RegionDisabledException of region_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    assume_role_with_web_identity_request ->
    ( assume_role_with_web_identity_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExpiredTokenException of expired_token_exception
      | `IDPCommunicationErrorException of idp_communication_error_exception
      | `IDPRejectedClaimException of idp_rejected_claim_exception
      | `InvalidIdentityTokenException of invalid_identity_token_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PackedPolicyTooLargeException of packed_policy_too_large_exception
      | `RegionDisabledException of region_disabled_exception ] )
    result
end
[@@ocaml.doc
  "Returns a set of temporary security credentials for users who have been authenticated in a \
   mobile or web application with a web identity provider. Example providers include the OAuth 2.0 \
   providers Login with Amazon and Facebook, or any OpenID Connect-compatible identity provider \
   such as Google or \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html}Amazon \
   Cognito federated identities}.\n\n\
  \  For mobile applications, we recommend that you use Amazon Cognito. You can use Amazon Cognito \
   with the {{:http://aws.amazon.com/sdkforios/}Amazon Web Services SDK for iOS Developer Guide} \
   and the {{:http://aws.amazon.com/sdkforandroid/}Amazon Web Services SDK for Android Developer \
   Guide} to uniquely identify a user. You can also supply the user with a consistent identity \
   throughout the lifetime of an application.\n\
  \  \n\
  \   To learn more about Amazon Cognito, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html}Amazon \
   Cognito identity pools} in {i Amazon Cognito Developer Guide}.\n\
  \   \n\
  \     Calling [AssumeRoleWithWebIdentity] does not require the use of Amazon Web Services \
   security credentials. Therefore, you can distribute an application (for example, on mobile \
   devices) that requests temporary security credentials without including long-term Amazon Web \
   Services credentials in the application. You also don't need to deploy server-based proxy \
   services that use long-term Amazon Web Services credentials. Instead, the identity of the \
   caller is validated by using a token from the web identity provider. For a comparison of \
   [AssumeRoleWithWebIdentity] with the other API operations that produce temporary credentials, \
   see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html}Requesting \
   Temporary Security Credentials} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_sts-comparison.html}Compare \
   STS credentials} in the {i IAM User Guide}.\n\
  \     \n\
  \      The temporary security credentials returned by this API consist of an access key ID, a \
   secret access key, and a security token. Applications can use these temporary security \
   credentials to sign calls to Amazon Web Services service API operations.\n\
  \      \n\
  \        {b Session Duration} \n\
  \       \n\
  \        By default, the temporary security credentials created by [AssumeRoleWithWebIdentity] \
   last for one hour. However, you can use the optional [DurationSeconds] parameter to specify the \
   duration of your session. You can provide a value from 900 seconds (15 minutes) up to the \
   maximum session duration setting for the role. This setting can have a value from 1 hour to 12 \
   hours. To learn how to view the maximum value for your role, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_update-role-settings.html#id_roles_update-session-duration}Update \
   the maximum session duration for a role } in the {i IAM User Guide}. The maximum session \
   duration limit applies when you use the [AssumeRole*] API operations or the [assume-role*] CLI \
   commands. However the limit does not apply when you use those operations to create a console \
   URL. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html}Using IAM Roles} in the \
   {i IAM User Guide}. \n\
  \        \n\
  \          {b Permissions} \n\
  \         \n\
  \          The temporary security credentials created by [AssumeRoleWithWebIdentity] can be used \
   to make API calls to any Amazon Web Services service with the following exception: you cannot \
   call the STS [GetFederationToken] or [GetSessionToken] API operations.\n\
  \          \n\
  \           (Optional) You can pass inline or managed \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}session \
   policies} to this operation. You can pass a single JSON policy document to use as an inline \
   session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to \
   use as managed session policies. The plaintext that you use for both inline and managed session \
   policies can't exceed 2,048 characters. Passing policies to this operation returns new \
   temporary credentials. The resulting session's permissions are the intersection of the role's \
   identity-based policy and the session policies. You can use the role's temporary credentials in \
   subsequent Amazon Web Services API calls to access resources in the account that owns the role. \
   You cannot use session policies to grant more permissions than those allowed by the \
   identity-based policy of the role that is being assumed. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
   Policies} in the {i IAM User Guide}.\n\
  \           \n\
  \             {b Tags} \n\
  \            \n\
  \             (Optional) You can configure your IdP to pass attributes into your web identity \
   token as session tags. Each session tag consists of a key name and an associated value. For \
   more information about session tags, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Passing Session Tags \
   in STS} in the {i IAM User Guide}.\n\
  \             \n\
  \              You can pass up to 50 session tags. The plaintext session tag keys \
   can\226\128\153t exceed 128 characters and the values can\226\128\153t exceed 256 characters. \
   For these and additional limits, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length}IAM \
   and STS Character Limits} in the {i IAM User Guide}.\n\
  \              \n\
  \                An Amazon Web Services conversion compresses the passed inline session policy, \
   managed policy ARNs, and session tags into a packed binary format that has a separate limit. \
   Your request can fail for this limit even if your plaintext meets the other requirements. The \
   [PackedPolicySize] response element indicates by percentage how close the policies and tags for \
   your request are to the upper size limit.\n\
  \                \n\
  \                  You can pass a session tag with the same key as a tag that is attached to the \
   role. When you do, the session tag overrides the role tag with the same key.\n\
  \                  \n\
  \                   An administrator must grant you the permissions necessary to pass session \
   tags. The administrator can also create granular permissions to allow you to pass only specific \
   session tags. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html}Tutorial: \
   Using Tags for Attribute-Based Access Control} in the {i IAM User Guide}.\n\
  \                   \n\
  \                    You can set the session tags as transitive. Transitive tags persist during \
   role chaining. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining}Chaining \
   Roles with Session Tags} in the {i IAM User Guide}.\n\
  \                    \n\
  \                      {b Identities} \n\
  \                     \n\
  \                      Before your application can call [AssumeRoleWithWebIdentity], you must \
   have an identity token from a supported identity provider and create a role that the \
   application can assume. The role that your application assumes must trust the identity provider \
   that is associated with the identity token. In other words, the identity provider must be \
   specified in the role's trust policy. \n\
  \                      \n\
  \                        Calling [AssumeRoleWithWebIdentity] can result in an entry in your \
   CloudTrail logs. The entry includes the \
   {{:http://openid.net/specs/openid-connect-core-1_0.html#Claims}Subject} of the provided web \
   identity token. We recommend that you avoid using any personally identifiable information (PII) \
   in this field. For example, you could instead use a GUID or a pairwise identifier, as \
   {{:http://openid.net/specs/openid-connect-core-1_0.html#SubjectIDTypes}suggested in the OIDC \
   specification}.\n\
  \                        \n\
  \                          For more information about how to use OIDC federation and the \
   [AssumeRoleWithWebIdentity] API, see the following resources: \n\
  \                          \n\
  \                           {ul\n\
  \                                 {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc_manual.html}Using \
   Web Identity Federation API Operations for Mobile Apps} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity}Federation \
   Through a Web-based Identity Provider}. \n\
  \                                     \n\
  \                                      }\n\
  \                                 {-   {{:http://aws.amazon.com/sdkforios/}Amazon Web Services \
   SDK for iOS Developer Guide} and {{:http://aws.amazon.com/sdkforandroid/}Amazon Web Services \
   SDK for Android Developer Guide}. These toolkits contain sample apps that show how to invoke \
   the identity providers. The toolkits then show how to use the information from these providers \
   to get and use temporary security credentials. \n\
  \                                     \n\
  \                                      }\n\
  \                                 }\n\
  \  "]

module AssumeRoot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ExpiredTokenException of expired_token_exception
    | `RegionDisabledException of region_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    assume_root_request ->
    ( assume_root_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ExpiredTokenException of expired_token_exception
      | `RegionDisabledException of region_disabled_exception ] )
    result
end
[@@ocaml.doc
  "Returns a set of short term credentials you can use to perform privileged tasks on a member \
   account in your organization.\n\n\
  \ Before you can launch a privileged session, you must have centralized root access in your \
   organization. For steps to enable this feature, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-enable-root-access.html}Centralize \
   root access for member accounts} in the {i IAM User Guide}.\n\
  \ \n\
  \   The STS global endpoint is not supported for AssumeRoot. You must send this request to a \
   Regional STS endpoint. For more information, see \
   {{:https://docs.aws.amazon.com/STS/latest/APIReference/welcome.html#sts-endpoints}Endpoints}.\n\
  \   \n\
  \     You can track AssumeRoot in CloudTrail logs to determine what actions were performed in a \
   session. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-track-privileged-tasks.html}Track \
   privileged tasks in CloudTrail} in the {i IAM User Guide}.\n\
  \     "]

module DecodeAuthorizationMessage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidAuthorizationMessageException of invalid_authorization_message_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    decode_authorization_message_request ->
    ( decode_authorization_message_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidAuthorizationMessageException of invalid_authorization_message_exception ] )
    result
end
[@@ocaml.doc
  "Decodes additional information about the authorization status of a request from an encoded \
   message returned in response to an Amazon Web Services request.\n\n\
  \ For example, if a user is not authorized to perform an operation that he or she has requested, \
   the request returns a [Client.UnauthorizedOperation] response (an HTTP 403 response). Some \
   Amazon Web Services operations additionally return an encoded message that can provide details \
   about this authorization failure. \n\
  \ \n\
  \   Only certain Amazon Web Services operations return an encoded authorization message. The \
   documentation for an individual operation indicates whether that operation returns an encoded \
   message in addition to returning an HTTP code.\n\
  \   \n\
  \     The message is encoded because the details of the authorization status can contain \
   privileged information that the user who requested the operation should not see. To decode an \
   authorization status message, a user must be granted permissions through an IAM \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}policy} to request the \
   [DecodeAuthorizationMessage] ([sts:DecodeAuthorizationMessage]) action. \n\
  \     \n\
  \      The decoded message includes the following type of information:\n\
  \      \n\
  \       {ul\n\
  \             {-  Whether the request was denied due to an explicit deny or due to the absence \
   of an explicit allow. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-denyallow}Determining \
   Whether a Request is Allowed or Denied} in the {i IAM User Guide}. \n\
  \                 \n\
  \                  }\n\
  \             {-  The principal who made the request.\n\
  \                 \n\
  \                  }\n\
  \             {-  The requested action.\n\
  \                 \n\
  \                  }\n\
  \             {-  The requested resource.\n\
  \                 \n\
  \                  }\n\
  \             {-  The values of condition keys in the context of the user's request.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module GetAccessKeyInfo : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_access_key_info_request ->
    (get_access_key_info_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result
end
[@@ocaml.doc
  "Returns the account identifier for the specified access key ID.\n\n\
  \ Access keys consist of two parts: an access key ID (for example, [AKIAIOSFODNN7EXAMPLE]) and a \
   secret access key (for example, [wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY]). For more \
   information about access keys, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html}Managing \
   Access Keys for IAM Users} in the {i IAM User Guide}.\n\
  \ \n\
  \  When you pass an access key ID to this operation, it returns the ID of the Amazon Web \
   Services account to which the keys belong. Access key IDs beginning with [AKIA] are long-term \
   credentials for an IAM user or the Amazon Web Services account root user. Access key IDs \
   beginning with [ASIA] are temporary credentials that are created using STS operations. If the \
   account in the response belongs to you, you can sign in as the root user and review your root \
   user access keys. Then, you can pull a \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html}credentials \
   report} to learn which IAM user owns the keys. To learn who requested the temporary credentials \
   for an [ASIA] access key, view the STS events in your \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html}CloudTrail \
   logs} in the {i IAM User Guide}.\n\
  \  \n\
  \   This operation does not indicate the state of the access key. The key might be active, \
   inactive, or deleted. Active keys might not have permissions to perform an operation. Providing \
   a deleted access key might return an error that the key doesn't exist.\n\
  \   "]

module GetCallerIdentity : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_caller_identity_request ->
    (get_caller_identity_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result
end
[@@ocaml.doc
  "Returns details about the IAM user or role whose credentials are used to call the operation.\n\n\
  \  No permissions are required to perform this operation. If an administrator attaches a policy \
   to your identity that explicitly denies access to the [sts:GetCallerIdentity] action, you can \
   still perform this operation. Permissions are not required because the same information is \
   returned when access is denied. To view an example response, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_access-denied-delete-mfa}I \
   Am Not Authorized to Perform: iam:DeleteVirtualMFADevice} in the {i IAM User Guide}.\n\
  \  \n\
  \   "]

module GetFederationToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PackedPolicyTooLargeException of packed_policy_too_large_exception
    | `RegionDisabledException of region_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_federation_token_request ->
    ( get_federation_token_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PackedPolicyTooLargeException of packed_policy_too_large_exception
      | `RegionDisabledException of region_disabled_exception ] )
    result
end
[@@ocaml.doc
  "Returns a set of temporary security credentials (consisting of an access key ID, a secret \
   access key, and a security token) for a user. A typical use is in a proxy application that gets \
   temporary security credentials on behalf of distributed applications inside a corporate \
   network.\n\n\
  \ You must call the [GetFederationToken] operation using the long-term security credentials of \
   an IAM user. As a result, this call is appropriate in contexts where those credentials can be \
   safeguarded, usually in a server-based application. For a comparison of [GetFederationToken] \
   with the other API operations that produce temporary credentials, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html}Requesting \
   Temporary Security Credentials} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_sts-comparison.html}Compare \
   STS credentials} in the {i IAM User Guide}.\n\
  \ \n\
  \  Although it is possible to call [GetFederationToken] using the security credentials of an \
   Amazon Web Services account root user rather than an IAM user that you create for the purpose \
   of a proxy application, we do not recommend it. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#lock-away-credentials}Safeguard \
   your root user credentials and don't use them for everyday tasks} in the {i IAM User Guide}. \n\
  \  \n\
  \    You can create a mobile-based or browser-based app that can authenticate users using a web \
   identity provider like Login with Amazon, Facebook, Google, or an OpenID Connect-compatible \
   identity provider. In this case, we recommend that you use \
   {{:http://aws.amazon.com/cognito/}Amazon Cognito} or [AssumeRoleWithWebIdentity]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity}Federation \
   Through a Web-based Identity Provider} in the {i IAM User Guide}.\n\
  \    \n\
  \       {b Session duration} \n\
  \      \n\
  \       The temporary credentials are valid for the specified duration, from 900 seconds (15 \
   minutes) up to a maximum of 129,600 seconds (36 hours). The default session duration is 43,200 \
   seconds (12 hours). Temporary credentials obtained by using the root user credentials have a \
   maximum duration of 3,600 seconds (1 hour).\n\
  \       \n\
  \         {b Permissions} \n\
  \        \n\
  \         You can use the temporary credentials created by [GetFederationToken] in any Amazon \
   Web Services service with the following exceptions:\n\
  \         \n\
  \          {ul\n\
  \                {-  You cannot call any IAM operations using the CLI or the Amazon Web Services \
   API. This limitation does not apply to console sessions.\n\
  \                    \n\
  \                     }\n\
  \                {-  You cannot call any STS operations except [GetCallerIdentity].\n\
  \                    \n\
  \                     }\n\
  \                }\n\
  \   You can use temporary credentials for single sign-on (SSO) to the console.\n\
  \   \n\
  \    You must pass an inline or managed \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}session \
   policy} to this operation. You can pass a single JSON policy document to use as an inline \
   session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) to \
   use as managed session policies. The plaintext that you use for both inline and managed session \
   policies can't exceed 2,048 characters.\n\
  \    \n\
  \     Though the session policy parameters are optional, if you do not pass a policy, then the \
   resulting federated user session has no permissions. When you pass session policies, the \
   session permissions are the intersection of the IAM user policies and the session policies that \
   you pass. This gives you a way to further restrict the permissions for a federated user. You \
   cannot use session policies to grant more permissions than those that are defined in the \
   permissions policy of the IAM user. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
   Policies} in the {i IAM User Guide}. For information about using [GetFederationToken] to create \
   temporary security credentials, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getfederationtoken}GetFederationToken\226\128\148Federation \
   Through a Custom Identity Broker}. \n\
  \     \n\
  \      You can use the credentials to access a resource that has a resource-based policy. If \
   that policy specifically references the federated user session in the [Principal] element of \
   the policy, the session has the permissions allowed by the policy. These permissions are \
   granted in addition to the permissions granted by the session policies.\n\
  \      \n\
  \        {b Tags} \n\
  \       \n\
  \        (Optional) You can pass tag key-value pairs to your session. These are called session \
   tags. For more information about session tags, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Passing Session Tags \
   in STS} in the {i IAM User Guide}.\n\
  \        \n\
  \          You can create a mobile-based or browser-based app that can authenticate users using \
   a web identity provider like Login with Amazon, Facebook, Google, or an OpenID \
   Connect-compatible identity provider. In this case, we recommend that you use \
   {{:http://aws.amazon.com/cognito/}Amazon Cognito} or [AssumeRoleWithWebIdentity]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity}Federation \
   Through a Web-based Identity Provider} in the {i IAM User Guide}.\n\
  \          \n\
  \            An administrator must grant you the permissions necessary to pass session tags. The \
   administrator can also create granular permissions to allow you to pass only specific session \
   tags. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html}Tutorial: \
   Using Tags for Attribute-Based Access Control} in the {i IAM User Guide}.\n\
  \            \n\
  \             Tag key\226\128\147value pairs are not case sensitive, but case is preserved. This \
   means that you cannot have separate [Department] and [department] tag keys. Assume that the \
   user that you are federating has the [Department]=[Marketing] tag and you pass the \
   [department]=[engineering] session tag. [Department] and [department] are not saved as separate \
   tags, and the session tag passed in the request takes precedence over the user tag.\n\
  \             "]

(** {1:Serialization and Deserialization} *)
module GetSessionToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `RegionDisabledException of region_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_token_request ->
    ( get_session_token_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `RegionDisabledException of region_disabled_exception ]
    )
    result
end
[@@ocaml.doc
  "Returns a set of temporary credentials for an Amazon Web Services account or IAM user. The \
   credentials consist of an access key ID, a secret access key, and a security token. Typically, \
   you use [GetSessionToken] if you want to use MFA to protect programmatic calls to specific \
   Amazon Web Services API operations like Amazon EC2 [StopInstances].\n\n\
  \ MFA-enabled IAM users must call [GetSessionToken] and submit an MFA code that is associated \
   with their MFA device. Using the temporary security credentials that the call returns, IAM \
   users can then make programmatic calls to API operations that require MFA authentication. An \
   incorrect MFA code causes the API to return an access denied error. For a comparison of \
   [GetSessionToken] with the other API operations that produce temporary credentials, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html}Requesting \
   Temporary Security Credentials} and \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_sts-comparison.html}Compare \
   STS credentials} in the {i IAM User Guide}.\n\
  \ \n\
  \   No permissions are required for users to perform this operation. The purpose of the \
   [sts:GetSessionToken] operation is to authenticate the user using MFA. You cannot use policies \
   to control authentication operations. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_getsessiontoken.html}Permissions \
   for GetSessionToken} in the {i IAM User Guide}.\n\
  \   \n\
  \      {b Session Duration} \n\
  \     \n\
  \      The [GetSessionToken] operation must be called by using the long-term Amazon Web Services \
   security credentials of an IAM user. Credentials that are created by IAM users are valid for \
   the duration that you specify. This duration can range from 900 seconds (15 minutes) up to a \
   maximum of 129,600 seconds (36 hours), with a default of 43,200 seconds (12 hours). Credentials \
   based on account credentials can range from 900 seconds (15 minutes) up to 3,600 seconds (1 \
   hour), with a default of 1 hour. \n\
  \      \n\
  \        {b Permissions} \n\
  \       \n\
  \        The temporary security credentials created by [GetSessionToken] can be used to make API \
   calls to any Amazon Web Services service with the following exceptions:\n\
  \        \n\
  \         {ul\n\
  \               {-  You cannot call any IAM API operations unless MFA authentication information \
   is included in the request.\n\
  \                   \n\
  \                    }\n\
  \               {-  You cannot call any STS API {i except} [AssumeRole] or [GetCallerIdentity].\n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \   The credentials that [GetSessionToken] returns are based on permissions associated with the \
   IAM user whose credentials were used to call the operation. The temporary credentials have the \
   same permissions as the IAM user.\n\
  \   \n\
  \     Although it is possible to call [GetSessionToken] using the security credentials of an \
   Amazon Web Services account root user rather than an IAM user, we do not recommend it. If \
   [GetSessionToken] is called using root user credentials, the temporary credentials have root \
   user permissions. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#lock-away-credentials}Safeguard \
   your root user credentials and don't use them for everyday tasks} in the {i IAM User Guide} \n\
  \     \n\
  \       For more information about using [GetSessionToken] to create temporary credentials, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getsessiontoken}Temporary \
   Credentials for Users in Untrusted Environments} in the {i IAM User Guide}. \n\
  \       "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
