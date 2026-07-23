type nonrec session_duration_escalation_exception2 = string [@@ocaml.doc ""]

type nonrec session_duration_escalation_exception = {
  message : session_duration_escalation_exception2 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested token duration would extend the session beyond its original expiration time. You \
   cannot use this operation to extend the lifetime of a session beyond what was granted when the \
   session was originally created.\n"]

type nonrec outbound_web_identity_federation_disabled_exception2 = string [@@ocaml.doc ""]

type nonrec outbound_web_identity_federation_disabled_exception = {
  message : outbound_web_identity_federation_disabled_exception2 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The outbound web identity federation feature is not enabled for this account. To use this \
   feature, you must first enable it through the Amazon Web Services Management Console or API.\n"]

type nonrec jwt_payload_size_exceeded_exception2 = string [@@ocaml.doc ""]

type nonrec jwt_payload_size_exceeded_exception = {
  message : jwt_payload_size_exceeded_exception2 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested token payload size exceeds the maximum allowed size. Reduce the number of request \
   tags included in the [GetWebIdentityToken] API call to reduce the token payload size.\n"]

type nonrec date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec web_identity_token_type = string [@@ocaml.doc ""]

type nonrec get_web_identity_token_response = {
  web_identity_token : web_identity_token_type option;
      [@ocaml.doc
        "A signed JSON Web Token (JWT) that represents the caller's Amazon Web Services identity. \
         The token contains standard JWT claims such as subject, audience, expiration time, and \
         additional identity attributes added by STS as custom claims. You can also add your own \
         custom claims to the token by passing tags as request parameters to the \
         [GetWebIdentityToken] API. The token is signed using the specified signing algorithm and \
         can be verified using the verification keys available at the issuer's JWKS endpoint.\n"]
  expiration : date_type option;
      [@ocaml.doc
        "The date and time when the web identity token expires, in UTC. The expiration is \
         determined by adding the [DurationSeconds] value to the time the token was issued. After \
         this time, the token should no longer be considered valid.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value_type = string [@@ocaml.doc ""]

type nonrec tag_key_type = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key_type;
      [@ocaml.doc
        "The key for a session tag.\n\n\
        \ You can pass up to 50 session tags. The plain text session tag keys can\226\128\153t \
         exceed 128 characters. For these and additional limits, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length}IAM \
         and STS Character Limits} in the {i IAM User Guide}.\n\
        \ "]
  value : tag_value_type;
      [@ocaml.doc
        "The value for a session tag.\n\n\
        \ You can pass up to 50 session tags. The plain text session tag values can\226\128\153t \
         exceed 256 characters. For these and additional limits, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length}IAM \
         and STS Character Limits} in the {i IAM User Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "You can pass custom key-value pair attributes when you assume a role or federate a user. These \
   are called session tags. You can then use the session tags to control access to resources. For \
   more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Tagging Amazon Web \
   Services STS Sessions} in the {i IAM User Guide}.\n"]

type nonrec tag_list_type = tag list [@@ocaml.doc ""]

type nonrec jwt_algorithm_type = string [@@ocaml.doc ""]

type nonrec web_identity_token_duration_seconds_type = int [@@ocaml.doc ""]

type nonrec web_identity_token_audience_string_type = string [@@ocaml.doc ""]

type nonrec web_identity_token_audience_list_type = web_identity_token_audience_string_type list
[@@ocaml.doc ""]

type nonrec get_web_identity_token_request = {
  audience : web_identity_token_audience_list_type;
      [@ocaml.doc
        "The intended recipient of the web identity token. This value populates the [aud] claim in \
         the JWT and should identify the service or application that will validate and use the \
         token. The external service should verify this claim to ensure the token was intended for \
         their use.\n"]
  duration_seconds : web_identity_token_duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, for which the JSON Web Token (JWT) will remain valid. The value \
         can range from 60 seconds (1 minute) to 3600 seconds (1 hour). If not specified, the \
         default duration is 300 seconds (5 minutes). The token is designed to be short-lived and \
         should be used for proof of identity, then exchanged for credentials or short-lived \
         tokens in the external service.\n"]
  signing_algorithm : jwt_algorithm_type;
      [@ocaml.doc
        "The cryptographic algorithm to use for signing the JSON Web Token (JWT). Valid values are \
         RS256 (RSA with SHA-256) and ES384 (ECDSA using P-384 curve with SHA-384). \n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "An optional list of tags to include in the JSON Web Token (JWT). These tags are added as \
         custom claims to the JWT and can be used by the downstream service for authorization \
         decisions. \n"]
}
[@@ocaml.doc ""]

type nonrec region_disabled_message = string [@@ocaml.doc ""]

type nonrec region_disabled_exception = { message : region_disabled_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "STS is not activated in the requested region for the account that is being asked to generate \
   credentials. The account administrator must use the IAM console to activate STS in that region. \
   For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html#sts-regions-activate-deactivate}Activating \
   and Deactivating STS in an Amazon Web Services Region} in the {i IAM User Guide}.\n"]

type nonrec token_type = string [@@ocaml.doc ""]

type nonrec access_key_secret_type = string [@@ocaml.doc ""]

type nonrec access_key_id_type = string [@@ocaml.doc ""]

type nonrec credentials = {
  access_key_id : access_key_id_type;
      [@ocaml.doc "The access key ID that identifies the temporary security credentials.\n"]
  secret_access_key : access_key_secret_type;
      [@ocaml.doc "The secret access key that can be used to sign requests.\n"]
  session_token : token_type;
      [@ocaml.doc
        "The token that users must pass to the service API to use the temporary credentials.\n"]
  expiration : date_type; [@ocaml.doc "The date on which the current credentials expire.\n"]
}
[@@ocaml.doc "Amazon Web Services credentials for API authentication.\n"]

type nonrec get_session_token_response = {
  credentials : credentials option;
      [@ocaml.doc
        "The temporary security credentials, which include an access key ID, a secret access key, \
         and a security (or session) token.\n\n\
        \  The size of the security token that STS API operations return is not fixed. We strongly \
         recommend that you make no assumptions about the maximum size.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Contains the response to a successful [GetSessionToken] request, including temporary Amazon Web \
   Services credentials that can be used to make Amazon Web Services requests. \n"]

type nonrec token_code_type = string [@@ocaml.doc ""]

type nonrec serial_number_type = string [@@ocaml.doc ""]

type nonrec duration_seconds_type = int [@@ocaml.doc ""]

type nonrec get_session_token_request = {
  duration_seconds : duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, that the credentials should remain valid. Acceptable durations \
         for IAM user sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), \
         with 43,200 seconds (12 hours) as the default. Sessions for Amazon Web Services account \
         owners are restricted to a maximum of 3,600 seconds (one hour). If the duration is longer \
         than one hour, the session for Amazon Web Services account owners defaults to one hour.\n"]
  serial_number : serial_number_type option;
      [@ocaml.doc
        "The identification number of the MFA device that is associated with the IAM user who is \
         making the [GetSessionToken] call. Specify this value if the IAM user has a policy that \
         requires MFA authentication. The value is either the serial number for a hardware device \
         (such as [GAHT12345678]) or an Amazon Resource Name (ARN) for a virtual device (such as \
         [arn:aws:iam::123456789012:mfa/user]). You can find the device for an IAM user by going \
         to the Amazon Web Services Management Console and viewing the user's security \
         credentials. \n\n\
        \ The regex used to validate this parameter is a string of characters consisting of upper- \
         and lower-case alphanumeric characters with no spaces. You can also include underscores \
         or any of the following characters: =,.\\@:/-\n\
        \ "]
  token_code : token_code_type option;
      [@ocaml.doc
        "The value provided by the MFA device, if MFA is required. If any policy requires the IAM \
         user to submit an MFA code, specify this value. If MFA authentication is required, the \
         user must provide a code when requesting a set of temporary security credentials. A user \
         who fails to provide the code receives an \"access denied\" response when requesting \
         resources that require MFA authentication.\n\n\
        \ The format for this parameter, as described by its regex pattern, is a sequence of six \
         numeric digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec packed_policy_too_large_message = string [@@ocaml.doc ""]

type nonrec packed_policy_too_large_exception = {
  message : packed_policy_too_large_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the total packed size of the session policies and session tags \
   combined was too large. An Amazon Web Services conversion compresses the session policy \
   document, session policy ARNs, and session tags into a packed binary format that has a separate \
   limit. The error message indicates by percentage how close the policies and tags are to the \
   upper size limit. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Passing Session Tags \
   in STS} in the {i IAM User Guide}.\n\n\
  \ You could receive this error even though you meet other defined session policy and session tag \
   limits. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-limits-entity-length}IAM \
   and STS Entity Character Limits} in the {i IAM User Guide}.\n\
  \ "]

type nonrec malformed_policy_document_message = string [@@ocaml.doc ""]

type nonrec malformed_policy_document_exception = {
  message : malformed_policy_document_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the policy document was malformed. The error message describes \
   the specific error.\n"]

type nonrec non_negative_integer_type = int [@@ocaml.doc ""]

type nonrec arn_type = string [@@ocaml.doc ""]

type nonrec federated_id_type = string [@@ocaml.doc ""]

type nonrec federated_user = {
  federated_user_id : federated_id_type;
      [@ocaml.doc
        "The string that identifies the federated user associated with the credentials, similar to \
         the unique ID of an IAM user.\n"]
  arn : arn_type;
      [@ocaml.doc
        "The ARN that specifies the federated user that is associated with the credentials. For \
         more information about ARNs and how to use them in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}. \n"]
}
[@@ocaml.doc "Identifiers for the federated user that is associated with the credentials.\n"]

type nonrec get_federation_token_response = {
  credentials : credentials option;
      [@ocaml.doc
        "The temporary security credentials, which include an access key ID, a secret access key, \
         and a security (or session) token.\n\n\
        \  The size of the security token that STS API operations return is not fixed. We strongly \
         recommend that you make no assumptions about the maximum size.\n\
        \  \n\
        \   "]
  federated_user : federated_user option;
      [@ocaml.doc
        "Identifiers for the federated user associated with the credentials (such as \
         [arn:aws:sts::123456789012:federated-user/Bob] or [123456789012:Bob]). You can use the \
         federated user's ARN in your resource-based policies, such as an Amazon S3 bucket policy. \n"]
  packed_policy_size : non_negative_integer_type option;
      [@ocaml.doc
        "A percentage value that indicates the packed size of the session policies and session \
         tags combined passed in the request. The request fails if the packed size is greater than \
         100 percent, which means the policies and tags exceeded the allowed space.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful [GetFederationToken] request, including temporary Amazon \
   Web Services credentials that can be used to make Amazon Web Services requests. \n"]

type nonrec policy_descriptor_type = {
  arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM managed policy to use as a session policy for \
         the role. For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web \
         Services General Reference}.\n"]
}
[@@ocaml.doc
  "A reference to the IAM managed policy that is passed as a session policy for a role session or \
   a federated user session.\n"]

type nonrec policy_descriptor_list_type = policy_descriptor_type list [@@ocaml.doc ""]

type nonrec session_policy_document_type = string [@@ocaml.doc ""]

type nonrec user_name_type = string [@@ocaml.doc ""]

type nonrec get_federation_token_request = {
  name : user_name_type;
      [@ocaml.doc
        "The name of the federated user. The name is used as an identifier for the temporary \
         security credentials (such as [Bob]). For example, you can reference the federated user \
         name in a resource-based policy, such as in an Amazon S3 bucket policy.\n\n\
        \ The regex used to validate this parameter is a string of characters consisting of upper- \
         and lower-case alphanumeric characters with no spaces. You can also include underscores \
         or any of the following characters: =,.\\@-\n\
        \ "]
  policy : session_policy_document_type option;
      [@ocaml.doc
        "An IAM policy in JSON format that you want to use as an inline session policy.\n\n\
        \ You must pass an inline or managed \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}session \
         policy} to this operation. You can pass a single JSON policy document to use as an inline \
         session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) \
         to use as managed session policies.\n\
        \ \n\
        \  This parameter is optional. However, if you do not pass any session policies, then the \
         resulting federated user session has no permissions.\n\
        \  \n\
        \   When you pass session policies, the session permissions are the intersection of the \
         IAM user policies and the session policies that you pass. This gives you a way to further \
         restrict the permissions for a federated user. You cannot use session policies to grant \
         more permissions than those that are defined in the permissions policy of the IAM user. \
         For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \   \n\
        \    The resulting credentials can be used to access a resource that has a resource-based \
         policy. If that policy specifically references the federated user session in the \
         [Principal] element of the policy, the session has the permissions allowed by the policy. \
         These permissions are granted in addition to the permissions that are granted by the \
         session policies.\n\
        \    \n\
        \     The plaintext that you use for both inline and managed session policies can't exceed \
         2,048 characters. The JSON policy characters can be any ASCII character from the space \
         character to the end of the valid character list (\\u0020 through \\u00FF). It can also \
         include the tab (\\u0009), linefeed (\\u000A), and carriage return (\\u000D) characters.\n\
        \     \n\
        \       An Amazon Web Services conversion compresses the passed inline session policy, \
         managed policy ARNs, and session tags into a packed binary format that has a separate \
         limit. Your request can fail for this limit even if your plaintext meets the other \
         requirements. The [PackedPolicySize] response element indicates by percentage how close \
         the policies and tags for your request are to the upper size limit.\n\
        \       \n\
        \        "]
  policy_arns : policy_descriptor_list_type option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as a \
         managed session policy. The policies must exist in the same account as the IAM user that \
         is requesting federated access.\n\n\
        \ You must pass an inline or managed \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}session \
         policy} to this operation. You can pass a single JSON policy document to use as an inline \
         session policy. You can also specify up to 10 managed policy Amazon Resource Names (ARNs) \
         to use as managed session policies. The plaintext that you use for both inline and \
         managed session policies can't exceed 2,048 characters. You can provide up to 10 managed \
         policy ARNs. For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the Amazon Web \
         Services General Reference.\n\
        \ \n\
        \  This parameter is optional. However, if you do not pass any session policies, then the \
         resulting federated user session has no permissions.\n\
        \  \n\
        \   When you pass session policies, the session permissions are the intersection of the \
         IAM user policies and the session policies that you pass. This gives you a way to further \
         restrict the permissions for a federated user. You cannot use session policies to grant \
         more permissions than those that are defined in the permissions policy of the IAM user. \
         For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \   \n\
        \    The resulting credentials can be used to access a resource that has a resource-based \
         policy. If that policy specifically references the federated user session in the \
         [Principal] element of the policy, the session has the permissions allowed by the policy. \
         These permissions are granted in addition to the permissions that are granted by the \
         session policies.\n\
        \    \n\
        \      An Amazon Web Services conversion compresses the passed inline session policy, \
         managed policy ARNs, and session tags into a packed binary format that has a separate \
         limit. Your request can fail for this limit even if your plaintext meets the other \
         requirements. The [PackedPolicySize] response element indicates by percentage how close \
         the policies and tags for your request are to the upper size limit.\n\
        \      \n\
        \       "]
  duration_seconds : duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, that the session should last. Acceptable durations for \
         federation sessions range from 900 seconds (15 minutes) to 129,600 seconds (36 hours), \
         with 43,200 seconds (12 hours) as the default. Sessions obtained using root user \
         credentials are restricted to a maximum of 3,600 seconds (one hour). If the specified \
         duration is longer than one hour, the session obtained by using root user credentials \
         defaults to one hour.\n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of session tags. Each session tag consists of a key name and an associated value. \
         For more information about session tags, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Passing Session \
         Tags in STS} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. You can pass up to 50 session tags. The plaintext session \
         tag keys can\226\128\153t exceed 128 characters and the values can\226\128\153t exceed \
         256 characters. For these and additional limits, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length}IAM \
         and STS Character Limits} in the {i IAM User Guide}.\n\
        \ \n\
        \   An Amazon Web Services conversion compresses the passed inline session policy, managed \
         policy ARNs, and session tags into a packed binary format that has a separate limit. Your \
         request can fail for this limit even if your plaintext meets the other requirements. The \
         [PackedPolicySize] response element indicates by percentage how close the policies and \
         tags for your request are to the upper size limit.\n\
        \   \n\
        \     You can pass a session tag with the same key as a tag that is already attached to \
         the user you are federating. When you do, session tags override a user tag with the same \
         key. \n\
        \     \n\
        \      Tag key\226\128\147value pairs are not case sensitive, but case is preserved. This \
         means that you cannot have separate [Department] and [department] tag keys. Assume that \
         the role has the [Department]=[Marketing] tag and you pass the [department]=[engineering] \
         session tag. [Department] and [department] are not saved as separate tags, and the \
         session tag passed in the request takes precedence over the role tag.\n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec expired_trade_in_token_exception_message = string [@@ocaml.doc ""]

type nonrec expired_trade_in_token_exception = {
  message : expired_trade_in_token_exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The trade-in token provided in the request has expired and can no longer be exchanged for \
   credentials. Request a new token and retry the operation.\n"]

type nonrec get_delegated_access_token_response = {
  credentials : credentials option; [@ocaml.doc ""]
  packed_policy_size : non_negative_integer_type option;
      [@ocaml.doc
        "The percentage of the maximum policy size that is used by the session policy. The policy \
         size is calculated as the sum of all the session policies and permission boundaries \
         attached to the session. If the packed size exceeds 100%, the request fails.\n"]
  assumed_principal : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the principal that was assumed when obtaining the \
         delegated access token. This ARN identifies the IAM entity whose permissions are granted \
         by the temporary credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec trade_in_token_type = string [@@ocaml.doc ""]

type nonrec get_delegated_access_token_request = {
  trade_in_token : trade_in_token_type;
      [@ocaml.doc
        "The token to exchange for temporary Amazon Web Services credentials. This token must be \
         valid and unexpired at the time of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec account_type = string [@@ocaml.doc ""]

type nonrec user_id_type = string [@@ocaml.doc ""]

type nonrec get_caller_identity_response = {
  user_id : user_id_type option;
      [@ocaml.doc
        "The unique identifier of the calling entity. The exact value depends on the type of \
         entity that is making the call. The values returned are those listed in the {b \
         aws:userid} column in the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#principaltable}Principal \
         table} found on the {b Policy Variables} reference page in the {i IAM User Guide}.\n"]
  account : account_type option;
      [@ocaml.doc
        "The Amazon Web Services account ID number of the account that owns or contains the \
         calling entity.\n"]
  arn : arn_type option;
      [@ocaml.doc "The Amazon Web Services ARN associated with the calling entity.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful [GetCallerIdentity] request, including information about \
   the entity making the request.\n"]

type nonrec get_caller_identity_request = unit [@@ocaml.doc ""]

type nonrec get_access_key_info_response = {
  account : account_type option;
      [@ocaml.doc "The number used to identify the Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_access_key_info_request = {
  access_key_id : access_key_id_type;
      [@ocaml.doc
        "The identifier of an access key.\n\n\
        \ This parameter allows (through its regex pattern) a string of characters that can \
         consist of any upper- or lowercase letter or digit.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_authorization_message = string [@@ocaml.doc ""]

type nonrec invalid_authorization_message_exception = {
  message : invalid_authorization_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The error returned if the message passed to [DecodeAuthorizationMessage] was invalid. This can \
   happen if the token contains invalid characters, such as line breaks, or if the message has \
   expired.\n"]

type nonrec decoded_message_type = string [@@ocaml.doc ""]

type nonrec decode_authorization_message_response = {
  decoded_message : decoded_message_type option;
      [@ocaml.doc "The API returns a response with the decoded message.\n"]
}
[@@ocaml.doc
  "A document that contains additional information about the authorization status of a request \
   from an encoded message that is returned in response to an Amazon Web Services request.\n"]

type nonrec encoded_message_type = string [@@ocaml.doc ""]

type nonrec decode_authorization_message_request = {
  encoded_message : encoded_message_type;
      [@ocaml.doc "The encoded message that was returned with the response.\n"]
}
[@@ocaml.doc ""]

type nonrec expired_identity_token_message = string [@@ocaml.doc ""]

type nonrec expired_token_exception = {
  message : expired_identity_token_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The web identity token that was passed is expired or is not valid. Get a new identity token \
   from the identity provider and then retry the request.\n"]

type nonrec source_identity_type = string [@@ocaml.doc ""]

type nonrec assume_root_response = {
  credentials : credentials option;
      [@ocaml.doc
        "The temporary security credentials, which include an access key ID, a secret access key, \
         and a security token.\n\n\
        \  The size of the security token that STS API operations return is not fixed. We strongly \
         recommend that you make no assumptions about the maximum size.\n\
        \  \n\
        \   "]
  source_identity : source_identity_type option;
      [@ocaml.doc
        "The source identity specified by the principal that is calling the [AssumeRoot] \
         operation.\n\n\
        \ You can use the [aws:SourceIdentity] condition key to control access based on the value \
         of source identity. For more information about using source identity, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html}Monitor \
         and control actions taken with assumed roles} in the {i IAM User Guide}.\n\
        \ \n\
        \  The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: =,.\\@-\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec root_duration_seconds_type = int [@@ocaml.doc ""]

type nonrec target_principal_type = string [@@ocaml.doc ""]

type nonrec assume_root_request = {
  target_principal : target_principal_type;
      [@ocaml.doc "The member account principal ARN or account ID.\n"]
  task_policy_arn : policy_descriptor_type;
      [@ocaml.doc
        "The identity based policy that scopes the session to the privileged tasks that can be \
         performed. You must use one of following Amazon Web Services managed policies to scope \
         root session actions:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-IAMAuditRootUserCredentials}IAMAuditRootUserCredentials} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-IAMCreateRootUserPassword}IAMCreateRootUserPassword} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-IAMDeleteRootUserCredentials}IAMDeleteRootUserCredentials} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-S3UnlockBucketPolicy}S3UnlockBucketPolicy} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam-awsmanpol.html#security-iam-awsmanpol-SQSUnlockQueuePolicy}SQSUnlockQueuePolicy} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  duration_seconds : root_duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, of the privileged session. The value can range from 0 seconds \
         up to the maximum session duration of 900 seconds (15 minutes). If you specify a value \
         higher than this setting, the operation fails.\n\n\
        \ By default, the value is set to [900] seconds.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_identity_token_message = string [@@ocaml.doc ""]

type nonrec invalid_identity_token_exception = {
  message : invalid_identity_token_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The web identity token that was passed could not be validated by Amazon Web Services. Get a new \
   identity token from the identity provider and then retry the request.\n"]

type nonrec idp_rejected_claim_message = string [@@ocaml.doc ""]

type nonrec idp_rejected_claim_exception = {
  message : idp_rejected_claim_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The identity provider (IdP) reported that authentication failed. This might be because the \
   claim is invalid.\n\n\
  \ If this error is returned for the [AssumeRoleWithWebIdentity] operation, it can also mean that \
   the claim has expired or has been explicitly revoked. \n\
  \ "]

type nonrec idp_communication_error_message = string [@@ocaml.doc ""]

type nonrec idp_communication_error_exception = {
  message : idp_communication_error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request could not be fulfilled because the identity provider (IDP) that was asked to verify \
   the incoming identity token could not be reached. This is often a transient error caused by \
   network conditions. Retry the request a limited number of times so that you don't exceed the \
   request rate. If the error persists, the identity provider might be down or not responding.\n"]

type nonrec audience = string [@@ocaml.doc ""]

type nonrec issuer = string [@@ocaml.doc ""]

type nonrec assumed_role_id_type = string [@@ocaml.doc ""]

type nonrec assumed_role_user = {
  assumed_role_id : assumed_role_id_type;
      [@ocaml.doc
        "A unique identifier that contains the role ID and the role session name of the role that \
         is being assumed. The role ID is generated by Amazon Web Services when the role is \
         created.\n"]
  arn : arn_type;
      [@ocaml.doc
        "The ARN of the temporary security credentials that are returned from the [AssumeRole] \
         action. For more information about ARNs and how to use them in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}.\n"]
}
[@@ocaml.doc "The identifiers for the temporary security credentials that the operation returns.\n"]

type nonrec web_identity_subject_type = string [@@ocaml.doc ""]

type nonrec assume_role_with_web_identity_response = {
  credentials : credentials option;
      [@ocaml.doc
        "The temporary security credentials, which include an access key ID, a secret access key, \
         and a security token.\n\n\
        \  The size of the security token that STS API operations return is not fixed. We strongly \
         recommend that you make no assumptions about the maximum size.\n\
        \  \n\
        \   "]
  subject_from_web_identity_token : web_identity_subject_type option;
      [@ocaml.doc
        "The unique user identifier that is returned by the identity provider. This identifier is \
         associated with the [WebIdentityToken] that was submitted with the \
         [AssumeRoleWithWebIdentity] call. The identifier is typically unique to the user and the \
         application that acquired the [WebIdentityToken] (pairwise identifier). For OpenID \
         Connect ID tokens, this field contains the value returned by the identity provider as the \
         token's [sub] (Subject) claim. \n"]
  assumed_role_user : assumed_role_user option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you \
         can use to refer to the resulting temporary security credentials. For example, you can \
         reference these credentials as a principal in a resource-based policy by using the ARN or \
         assumed role ID. The ARN and ID include the [RoleSessionName] that you specified when you \
         called [AssumeRole]. \n"]
  packed_policy_size : non_negative_integer_type option;
      [@ocaml.doc
        "A percentage value that indicates the packed size of the session policies and session \
         tags combined passed in the request. The request fails if the packed size is greater than \
         100 percent, which means the policies and tags exceeded the allowed space.\n"]
  provider : issuer option;
      [@ocaml.doc
        " The issuing authority of the web identity token presented. For OpenID Connect ID tokens, \
         this contains the value of the [iss] field. For OAuth 2.0 access tokens, this contains \
         the value of the [ProviderId] parameter that was passed in the \
         [AssumeRoleWithWebIdentity] request.\n"]
  audience : audience option;
      [@ocaml.doc
        "The intended audience (also known as client ID) of the web identity token. This is \
         traditionally the client identifier issued to the application that requested the web \
         identity token.\n"]
  source_identity : source_identity_type option;
      [@ocaml.doc
        "The value of the source identity that is returned in the JSON web token (JWT) from the \
         identity provider.\n\n\
        \ You can require users to set a source identity value when they assume a role. You do \
         this by using the [sts:SourceIdentity] condition key in a role trust policy. That way, \
         actions that are taken with the role are associated with that user. After the source \
         identity is set, the value cannot be changed. It is present in the request for all \
         actions that are taken by the role and persists across \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#id_roles_terms-and-concepts}chained \
         role} sessions. You can configure your identity provider to use an attribute associated \
         with your users, like user name or email, as the source identity when calling \
         [AssumeRoleWithWebIdentity]. You do this by adding a claim to the JSON web token. To \
         learn more about OIDC tokens and claims, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html}Using \
         Tokens with User Pools} in the {i Amazon Cognito Developer Guide}. For more information \
         about using source identity, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html}Monitor \
         and control actions taken with assumed roles} in the {i IAM User Guide}.\n\
        \ \n\
        \  The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: =,.\\@-\n\
        \  "]
}
[@@ocaml.doc
  "Contains the response to a successful [AssumeRoleWithWebIdentity] request, including temporary \
   Amazon Web Services credentials that can be used to make Amazon Web Services requests. \n"]

type nonrec role_duration_seconds_type = int [@@ocaml.doc ""]

type nonrec url_type = string [@@ocaml.doc ""]

type nonrec client_token_type = string [@@ocaml.doc ""]

type nonrec role_session_name_type = string [@@ocaml.doc ""]

type nonrec assume_role_with_web_identity_request = {
  role_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that the caller is assuming.\n\n\
        \  Additional considerations apply to Amazon Cognito identity pools that assume \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-cross-account-resource-access.html}cross-account \
         IAM roles}. The trust policies of these roles must accept the \
         [cognito-identity.amazonaws.com] service principal and must contain the \
         [cognito-identity.amazonaws.com:aud] condition key to restrict role assumption to users \
         from your intended identity pools. A policy that trusts Amazon Cognito identity pools \
         without this condition creates a risk that a user from an unintended identity pool can \
         assume the role. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/iam-roles.html#trust-policies} \
         Trust policies for IAM roles in Basic (Classic) authentication } in the {i Amazon Cognito \
         Developer Guide}.\n\
        \  \n\
        \   "]
  role_session_name : role_session_name_type;
      [@ocaml.doc
        "An identifier for the assumed role session. Typically, you pass the name or identifier \
         that is associated with the user who is using your application. That way, the temporary \
         security credentials that your application will use are associated with that user. This \
         session name is included as part of the ARN and assumed role ID in the [AssumedRoleUser] \
         response element.\n\n\
        \ For security purposes, administrators can view this field in \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html#cloudtrail-integration_signin-tempcreds}CloudTrail \
         logs} to help identify who performed an action in Amazon Web Services. Your administrator \
         might require that you specify your user name as the session name when you assume the \
         role. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_iam-condition-keys.html#ck_rolesessionname} \
         [sts:RoleSessionName] }.\n\
        \ \n\
        \  The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: =,.\\@-\n\
        \  "]
  web_identity_token : client_token_type;
      [@ocaml.doc
        "The OAuth 2.0 access token or OpenID Connect ID token that is provided by the identity \
         provider. Your application must get this token by authenticating the user who is using \
         your application with a web identity provider before the application makes an \
         [AssumeRoleWithWebIdentity] call. Timestamps in the token must be formatted as either an \
         integer or a long integer. Tokens must be signed using either RSA keys (RS256, RS384, or \
         RS512) or ECDSA keys (ES256, ES384, or ES512).\n"]
  provider_id : url_type option;
      [@ocaml.doc
        "The fully qualified host component of the domain name of the OAuth 2.0 identity provider. \
         Do not specify this value for an OpenID Connect identity provider.\n\n\
        \ Currently [www.amazon.com] and [graph.facebook.com] are the only supported identity \
         providers for OAuth 2.0 access tokens. Do not include URL schemes and port numbers.\n\
        \ \n\
        \  Do not specify this value for OpenID Connect ID tokens.\n\
        \  "]
  policy_arns : policy_descriptor_list_type option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as \
         managed session policies. The policies must exist in the same account as the role.\n\n\
        \ This parameter is optional. You can provide up to 10 managed policy ARNs. However, the \
         plaintext that you use for both inline and managed session policies can't exceed 2,048 \
         characters. For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the Amazon Web \
         Services General Reference.\n\
        \ \n\
        \   An Amazon Web Services conversion compresses the passed inline session policy, managed \
         policy ARNs, and session tags into a packed binary format that has a separate limit. Your \
         request can fail for this limit even if your plaintext meets the other requirements. The \
         [PackedPolicySize] response element indicates by percentage how close the policies and \
         tags for your request are to the upper size limit.\n\
        \   \n\
        \     Passing policies to this operation returns new temporary credentials. The resulting \
         session's permissions are the intersection of the role's identity-based policy and the \
         session policies. You can use the role's temporary credentials in subsequent Amazon Web \
         Services API calls to access resources in the account that owns the role. You cannot use \
         session policies to grant more permissions than those allowed by the identity-based \
         policy of the role that is being assumed. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \     "]
  policy : session_policy_document_type option;
      [@ocaml.doc
        "An IAM policy in JSON format that you want to use as an inline session policy.\n\n\
        \ This parameter is optional. Passing policies to this operation returns new temporary \
         credentials. The resulting session's permissions are the intersection of the role's \
         identity-based policy and the session policies. You can use the role's temporary \
         credentials in subsequent Amazon Web Services API calls to access resources in the \
         account that owns the role. You cannot use session policies to grant more permissions \
         than those allowed by the identity-based policy of the role that is being assumed. For \
         more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \ \n\
        \  The plaintext that you use for both inline and managed session policies can't exceed \
         2,048 characters. The JSON policy characters can be any ASCII character from the space \
         character to the end of the valid character list (\\u0020 through \\u00FF). It can also \
         include the tab (\\u0009), linefeed (\\u000A), and carriage return (\\u000D) characters.\n\
        \  \n\
        \   For more information about role session permissions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         policies}.\n\
        \   \n\
        \     An Amazon Web Services conversion compresses the passed inline session policy, \
         managed policy ARNs, and session tags into a packed binary format that has a separate \
         limit. Your request can fail for this limit even if your plaintext meets the other \
         requirements. The [PackedPolicySize] response element indicates by percentage how close \
         the policies and tags for your request are to the upper size limit.\n\
        \     \n\
        \      "]
  duration_seconds : role_duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, of the role session. The value can range from 900 seconds (15 \
         minutes) up to the maximum session duration setting for the role. This setting can have a \
         value from 1 hour to 12 hours. If you specify a value higher than this setting, the \
         operation fails. For example, if you specify a session duration of 12 hours, but your \
         administrator set the maximum session duration to 6 hours, your operation fails. To learn \
         how to view the maximum value for your role, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session}View \
         the Maximum Session Duration Setting for a Role} in the {i IAM User Guide}.\n\n\
        \ By default, the value is set to [3600] seconds. \n\
        \ \n\
        \   The [DurationSeconds] parameter is separate from the duration of a console session \
         that you might request using the returned credentials. The request to the federation \
         endpoint for a console sign-in token takes a [SessionDuration] parameter that specifies \
         the maximum length of the console session. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html}Creating \
         a URL that Enables Federated Users to Access the Amazon Web Services Management Console} \
         in the {i IAM User Guide}.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec name_qualifier = string [@@ocaml.doc ""]

type nonrec subject_type = string [@@ocaml.doc ""]

type nonrec subject = string [@@ocaml.doc ""]

type nonrec assume_role_with_saml_response = {
  credentials : credentials option;
      [@ocaml.doc
        "The temporary security credentials, which include an access key ID, a secret access key, \
         and a security (or session) token.\n\n\
        \  The size of the security token that STS API operations return is not fixed. We strongly \
         recommend that you make no assumptions about the maximum size.\n\
        \  \n\
        \   "]
  assumed_role_user : assumed_role_user option;
      [@ocaml.doc
        "The identifiers for the temporary security credentials that the operation returns.\n"]
  packed_policy_size : non_negative_integer_type option;
      [@ocaml.doc
        "A percentage value that indicates the packed size of the session policies and session \
         tags combined passed in the request. The request fails if the packed size is greater than \
         100 percent, which means the policies and tags exceeded the allowed space.\n"]
  subject : subject option;
      [@ocaml.doc
        "The value of the [NameID] element in the [Subject] element of the SAML assertion.\n"]
  subject_type : subject_type option;
      [@ocaml.doc
        " The format of the name ID, as defined by the [Format] attribute in the [NameID] element \
         of the SAML assertion. Typical examples of the format are [transient] or [persistent]. \n\n\
        \  If the format includes the prefix [urn:oasis:names:tc:SAML:2.0:nameid-format], that \
         prefix is removed. For example, [urn:oasis:names:tc:SAML:2.0:nameid-format:transient] is \
         returned as [transient]. If the format includes any other prefix, the format is returned \
         with no modifications.\n\
        \ "]
  issuer : issuer option; [@ocaml.doc "The value of the [Issuer] element of the SAML assertion.\n"]
  audience : audience option;
      [@ocaml.doc
        " The value of the [Recipient] attribute of the [SubjectConfirmationData] element of the \
         SAML assertion. \n"]
  name_qualifier : name_qualifier option;
      [@ocaml.doc
        "A hash value based on the concatenation of the following:\n\n\
        \ {ul\n\
        \       {-  The [Issuer] response value.\n\
        \           \n\
        \            }\n\
        \       {-  The Amazon Web Services account ID.\n\
        \           \n\
        \            }\n\
        \       {-  The friendly name (the last part of the ARN) of the SAML provider in IAM.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The combination of [NameQualifier] and [Subject] can be used to uniquely identify a \
         user.\n\
        \   \n\
        \    The following pseudocode shows how the hash value is calculated:\n\
        \    \n\
        \      [BASE64 ( SHA1 ( \"https://example.com/saml\" + \"123456789012\" + \"/MySAMLIdP\" ) \
         )] \n\
        \     "]
  source_identity : source_identity_type option;
      [@ocaml.doc
        "The value in the [SourceIdentity] attribute in the SAML assertion. The source identity \
         value persists across \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#iam-term-role-chaining}chained \
         role} sessions.\n\n\
        \ You can require users to set a source identity value when they assume a role. You do \
         this by using the [sts:SourceIdentity] condition key in a role trust policy. That way, \
         actions that are taken with the role are associated with that user. After the source \
         identity is set, the value cannot be changed. It is present in the request for all \
         actions that are taken by the role and persists across \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#id_roles_terms-and-concepts}chained \
         role} sessions. You can configure your SAML identity provider to use an attribute \
         associated with your users, like user name or email, as the source identity when calling \
         [AssumeRoleWithSAML]. You do this by adding an attribute to the SAML assertion. For more \
         information about using source identity, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html}Monitor \
         and control actions taken with assumed roles} in the {i IAM User Guide}.\n\
        \ \n\
        \  The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: =,.\\@-\n\
        \  "]
}
[@@ocaml.doc
  "Contains the response to a successful [AssumeRoleWithSAML] request, including temporary Amazon \
   Web Services credentials that can be used to make Amazon Web Services requests. \n"]

type nonrec saml_assertion_type = string [@@ocaml.doc ""]

type nonrec assume_role_with_saml_request = {
  role_arn : arn_type;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the role that the caller is assuming.\n"]
  principal_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SAML provider in IAM that describes the IdP.\n"]
  saml_assertion : saml_assertion_type;
      [@ocaml.doc
        "The base64 encoded SAML authentication response provided by the IdP.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html}Configuring \
         a Relying Party and Adding Claims} in the {i IAM User Guide}. \n\
        \ "]
  policy_arns : policy_descriptor_list_type option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as \
         managed session policies. The policies must exist in the same account as the role.\n\n\
        \ This parameter is optional. You can provide up to 10 managed policy ARNs. However, the \
         plaintext that you use for both inline and managed session policies can't exceed 2,048 \
         characters. For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the Amazon Web \
         Services General Reference.\n\
        \ \n\
        \   An Amazon Web Services conversion compresses the passed inline session policy, managed \
         policy ARNs, and session tags into a packed binary format that has a separate limit. Your \
         request can fail for this limit even if your plaintext meets the other requirements. The \
         [PackedPolicySize] response element indicates by percentage how close the policies and \
         tags for your request are to the upper size limit.\n\
        \   \n\
        \     Passing policies to this operation returns new temporary credentials. The resulting \
         session's permissions are the intersection of the role's identity-based policy and the \
         session policies. You can use the role's temporary credentials in subsequent Amazon Web \
         Services API calls to access resources in the account that owns the role. You cannot use \
         session policies to grant more permissions than those allowed by the identity-based \
         policy of the role that is being assumed. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \     "]
  policy : session_policy_document_type option;
      [@ocaml.doc
        "An IAM policy in JSON format that you want to use as an inline session policy.\n\n\
        \ This parameter is optional. Passing policies to this operation returns new temporary \
         credentials. The resulting session's permissions are the intersection of the role's \
         identity-based policy and the session policies. You can use the role's temporary \
         credentials in subsequent Amazon Web Services API calls to access resources in the \
         account that owns the role. You cannot use session policies to grant more permissions \
         than those allowed by the identity-based policy of the role that is being assumed. For \
         more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}. \n\
        \ \n\
        \  The plaintext that you use for both inline and managed session policies can't exceed \
         2,048 characters. The JSON policy characters can be any ASCII character from the space \
         character to the end of the valid character list (\\u0020 through \\u00FF). It can also \
         include the tab (\\u0009), linefeed (\\u000A), and carriage return (\\u000D) characters.\n\
        \  \n\
        \   For more information about role session permissions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         policies}.\n\
        \   \n\
        \     An Amazon Web Services conversion compresses the passed inline session policy, \
         managed policy ARNs, and session tags into a packed binary format that has a separate \
         limit. Your request can fail for this limit even if your plaintext meets the other \
         requirements. The [PackedPolicySize] response element indicates by percentage how close \
         the policies and tags for your request are to the upper size limit.\n\
        \     \n\
        \      "]
  duration_seconds : role_duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, of the role session. Your role session lasts for the duration \
         that you specify for the [DurationSeconds] parameter, or until the time specified in the \
         SAML authentication response's [SessionNotOnOrAfter] value, whichever is shorter. You can \
         provide a [DurationSeconds] value from 900 seconds (15 minutes) up to the maximum session \
         duration setting for the role. This setting can have a value from 1 hour to 12 hours. If \
         you specify a value higher than this setting, the operation fails. For example, if you \
         specify a session duration of 12 hours, but your administrator set the maximum session \
         duration to 6 hours, your operation fails. To learn how to view the maximum value for \
         your role, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session}View \
         the Maximum Session Duration Setting for a Role} in the {i IAM User Guide}.\n\n\
        \ By default, the value is set to [3600] seconds. \n\
        \ \n\
        \   The [DurationSeconds] parameter is separate from the duration of a console session \
         that you might request using the returned credentials. The request to the federation \
         endpoint for a console sign-in token takes a [SessionDuration] parameter that specifies \
         the maximum length of the console session. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html}Creating \
         a URL that Enables Federated Users to Access the Amazon Web Services Management Console} \
         in the {i IAM User Guide}.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec assume_role_response = {
  credentials : credentials option;
      [@ocaml.doc
        "The temporary security credentials, which include an access key ID, a secret access key, \
         and a security (or session) token.\n\n\
        \  The size of the security token that STS API operations return is not fixed. We strongly \
         recommend that you make no assumptions about the maximum size.\n\
        \  \n\
        \   "]
  assumed_role_user : assumed_role_user option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) and the assumed role ID, which are identifiers that you \
         can use to refer to the resulting temporary security credentials. For example, you can \
         reference these credentials as a principal in a resource-based policy by using the ARN or \
         assumed role ID. The ARN and ID include the [RoleSessionName] that you specified when you \
         called [AssumeRole]. \n"]
  packed_policy_size : non_negative_integer_type option;
      [@ocaml.doc
        "A percentage value that indicates the packed size of the session policies and session \
         tags combined passed in the request. The request fails if the packed size is greater than \
         100 percent, which means the policies and tags exceeded the allowed space.\n"]
  source_identity : source_identity_type option;
      [@ocaml.doc
        "The source identity specified by the principal that is calling the [AssumeRole] \
         operation.\n\n\
        \ You can require users to specify a source identity when they assume a role. You do this \
         by using the [sts:SourceIdentity] condition key in a role trust policy. You can use \
         source identity information in CloudTrail logs to determine who took actions with a role. \
         You can use the [aws:SourceIdentity] condition key to further control access to Amazon \
         Web Services resources based on the value of source identity. For more information about \
         using source identity, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html}Monitor \
         and control actions taken with assumed roles} in the {i IAM User Guide}.\n\
        \ \n\
        \  The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: =,.\\@-\n\
        \  "]
}
[@@ocaml.doc
  "Contains the response to a successful [AssumeRole] request, including temporary Amazon Web \
   Services credentials that can be used to make Amazon Web Services requests. \n"]

type nonrec context_assertion_type = string [@@ocaml.doc ""]

type nonrec provided_context = {
  provider_arn : arn_type option;
      [@ocaml.doc
        "The context provider ARN from which the trusted context assertion was generated.\n"]
  context_assertion : context_assertion_type option;
      [@ocaml.doc
        "The signed and encrypted trusted context assertion generated by the context provider. The \
         trusted context assertion is signed and encrypted by Amazon Web Services STS.\n"]
}
[@@ocaml.doc
  "Contains information about the provided context. This includes the signed and encrypted trusted \
   context assertion and the context provider ARN from which the trusted context assertion was \
   generated.\n"]

type nonrec provided_contexts_list_type = provided_context list [@@ocaml.doc ""]

type nonrec external_id_type = string [@@ocaml.doc ""]

type nonrec tag_key_list_type = tag_key_type list [@@ocaml.doc ""]

type nonrec unrestricted_session_policy_document_type = string [@@ocaml.doc ""]

type nonrec assume_role_request = {
  role_arn : arn_type; [@ocaml.doc "The Amazon Resource Name (ARN) of the role to assume.\n"]
  role_session_name : role_session_name_type;
      [@ocaml.doc
        "An identifier for the assumed role session.\n\n\
        \ Use the role session name to uniquely identify a session when the same role is assumed \
         by different principals or for different reasons. In cross-account scenarios, the role \
         session name is visible to, and can be logged by the account that owns the role. The role \
         session name is also used in the ARN of the assumed role principal. This means that \
         subsequent cross-account API requests that use the temporary security credentials will \
         expose the role session name to the external account in their CloudTrail logs.\n\
        \ \n\
        \  For security purposes, administrators can view this field in \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html#cloudtrail-integration_signin-tempcreds}CloudTrail \
         logs} to help identify who performed an action in Amazon Web Services. Your administrator \
         might require that you specify your user name as the session name when you assume the \
         role. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_iam-condition-keys.html#ck_rolesessionname} \
         [sts:RoleSessionName] }.\n\
        \  \n\
        \   The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: +=,.\\@-\n\
        \   "]
  policy_arns : policy_descriptor_list_type option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the IAM managed policies that you want to use as \
         managed session policies. The policies must exist in the same account as the role.\n\n\
        \ This parameter is optional. You can provide up to 10 managed policy ARNs. However, the \
         plaintext that you use for both inline and managed session policies can't exceed 2,048 \
         characters. For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the Amazon Web \
         Services General Reference.\n\
        \ \n\
        \   An Amazon Web Services conversion compresses the passed inline session policy, managed \
         policy ARNs, and session tags into a packed binary format that has a separate limit. Your \
         request can fail for this limit even if your plaintext meets the other requirements. The \
         [PackedPolicySize] response element indicates by percentage how close the policies and \
         tags for your request are to the upper size limit.\n\
        \   \n\
        \     Passing policies to this operation returns new temporary credentials. The resulting \
         session's permissions are the intersection of the role's identity-based policy and the \
         session policies. You can use the role's temporary credentials in subsequent Amazon Web \
         Services API calls to access resources in the account that owns the role. You cannot use \
         session policies to grant more permissions than those allowed by the identity-based \
         policy of the role that is being assumed. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \     "]
  policy : unrestricted_session_policy_document_type option;
      [@ocaml.doc
        "An IAM policy in JSON format that you want to use as an inline session policy.\n\n\
        \ This parameter is optional. Passing policies to this operation returns new temporary \
         credentials. The resulting session's permissions are the intersection of the role's \
         identity-based policy and the session policies. You can use the role's temporary \
         credentials in subsequent Amazon Web Services API calls to access resources in the \
         account that owns the role. You cannot use session policies to grant more permissions \
         than those allowed by the identity-based policy of the role that is being assumed. For \
         more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         Policies} in the {i IAM User Guide}.\n\
        \ \n\
        \  The plaintext that you use for both inline and managed session policies can't exceed \
         2,048 characters. The JSON policy characters can be any ASCII character from the space \
         character to the end of the valid character list (\\u0020 through \\u00FF). It can also \
         include the tab (\\u0009), linefeed (\\u000A), and carriage return (\\u000D) characters.\n\
        \  \n\
        \    An Amazon Web Services conversion compresses the passed inline session policy, \
         managed policy ARNs, and session tags into a packed binary format that has a separate \
         limit. Your request can fail for this limit even if your plaintext meets the other \
         requirements. The [PackedPolicySize] response element indicates by percentage how close \
         the policies and tags for your request are to the upper size limit.\n\
        \    \n\
        \      For more information about role session permissions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session}Session \
         policies}.\n\
        \      "]
  duration_seconds : role_duration_seconds_type option;
      [@ocaml.doc
        "The duration, in seconds, of the role session. The value specified can range from 900 \
         seconds (15 minutes) up to the maximum session duration set for the role. The maximum \
         session duration setting can have a value from 1 hour to 12 hours. If you specify a value \
         higher than this setting or the administrator setting (whichever is lower), the operation \
         fails. For example, if you specify a session duration of 12 hours, but your administrator \
         set the maximum session duration to 6 hours, your operation fails. \n\n\
        \ Role chaining limits your Amazon Web Services CLI or Amazon Web Services API role \
         session to a maximum of one hour. When you use the [AssumeRole] API operation to assume a \
         role, you can specify the duration of your role session with the [DurationSeconds] \
         parameter. You can specify a parameter value of up to 43200 seconds (12 hours), depending \
         on the maximum session duration setting for your role. However, if you assume a role \
         using role chaining and provide a [DurationSeconds] parameter value greater than one \
         hour, the operation fails. To learn how to view the maximum value for your role, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_update-role-settings.html#id_roles_update-session-duration}Update \
         the maximum session duration for a role}.\n\
        \ \n\
        \  By default, the value is set to [3600] seconds. \n\
        \  \n\
        \    The [DurationSeconds] parameter is separate from the duration of a console session \
         that you might request using the returned credentials. The request to the federation \
         endpoint for a console sign-in token takes a [SessionDuration] parameter that specifies \
         the maximum length of the console session. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html}Creating \
         a URL that Enables Federated Users to Access the Amazon Web Services Management Console} \
         in the {i IAM User Guide}.\n\
        \    \n\
        \     "]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of session tags that you want to pass. Each session tag consists of a key name and \
         an associated value. For more information about session tags, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html}Tagging Amazon \
         Web Services STS Sessions} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. You can pass up to 50 session tags. The plaintext session \
         tag keys can\226\128\153t exceed 128 characters, and the values can\226\128\153t exceed \
         256 characters. For these and additional limits, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length}IAM \
         and STS Character Limits} in the {i IAM User Guide}.\n\
        \ \n\
        \   An Amazon Web Services conversion compresses the passed inline session policy, managed \
         policy ARNs, and session tags into a packed binary format that has a separate limit. Your \
         request can fail for this limit even if your plaintext meets the other requirements. The \
         [PackedPolicySize] response element indicates by percentage how close the policies and \
         tags for your request are to the upper size limit.\n\
        \   \n\
        \     You can pass a session tag with the same key as a tag that is already attached to \
         the role. When you do, session tags override a role tag with the same key. \n\
        \     \n\
        \      Tag key\226\128\147value pairs are not case sensitive, but case is preserved. This \
         means that you cannot have separate [Department] and [department] tag keys. Assume that \
         the role has the [Department]=[Marketing] tag and you pass the [department]=[engineering] \
         session tag. [Department] and [department] are not saved as separate tags, and the \
         session tag passed in the request takes precedence over the role tag.\n\
        \      \n\
        \       Additionally, if you used temporary credentials to perform this operation, the new \
         session inherits any transitive session tags from the calling session. If you pass a \
         session tag with the same key as an inherited tag, the operation fails. To view the \
         inherited tags for a session, see the CloudTrail logs. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_ctlogs}Viewing \
         Session Tags in CloudTrail} in the {i IAM User Guide}.\n\
        \       "]
  transitive_tag_keys : tag_key_list_type option;
      [@ocaml.doc
        "A list of keys for session tags that you want to set as transitive. If you set a tag key \
         as transitive, the corresponding key and value passes to subsequent sessions in a role \
         chain. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining}Chaining \
         Roles with Session Tags} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. The transitive status of a session tag does not impact its \
         packed binary size.\n\
        \ \n\
        \  If you choose not to specify a transitive tag key, then no tags are passed from this \
         session to any subsequent sessions.\n\
        \  "]
  external_id : external_id_type option;
      [@ocaml.doc
        "A unique identifier that might be required when you assume a role in another account. If \
         the administrator of the account to which the role belongs provided you with an external \
         ID, then provide that value in the [ExternalId] parameter. This value can be any string, \
         such as a passphrase or account number. A cross-account role is usually set up to trust \
         everyone in an account. Therefore, the administrator of the trusting account might send \
         an external ID to the administrator of the trusted account. That way, only someone with \
         the ID can assume the role, rather than everyone in the account. For more information \
         about the external ID, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html}How \
         to Use an External ID When Granting Access to Your Amazon Web Services Resources to a \
         Third Party} in the {i IAM User Guide}.\n\n\
        \ The regex used to validate this parameter is a string of characters consisting of upper- \
         and lower-case alphanumeric characters with no spaces. You can also include underscores \
         or any of the following characters: +=,.\\@:\\/-\n\
        \ "]
  serial_number : serial_number_type option;
      [@ocaml.doc
        "The identification number of the MFA device that is associated with the user who is \
         making the [AssumeRole] call. Specify this value if the trust policy of the role being \
         assumed includes a condition that requires MFA authentication. The value is either the \
         serial number for a hardware device (such as [GAHT12345678]) or an Amazon Resource Name \
         (ARN) for a virtual device (such as [arn:aws:iam::123456789012:mfa/user]).\n\n\
        \ The regex used to validate this parameter is a string of characters consisting of upper- \
         and lower-case alphanumeric characters with no spaces. You can also include underscores \
         or any of the following characters: +=/:,.\\@-\n\
        \ "]
  token_code : token_code_type option;
      [@ocaml.doc
        "The value provided by the MFA device, if the trust policy of the role being assumed \
         requires MFA. (In other words, if the policy includes a condition that tests for MFA). If \
         the role being assumed requires MFA and if the [TokenCode] value is missing or expired, \
         the [AssumeRole] call returns an \"access denied\" error.\n\n\
        \ The format for this parameter, as described by its regex pattern, is a sequence of six \
         numeric digits.\n\
        \ "]
  source_identity : source_identity_type option;
      [@ocaml.doc
        "The source identity specified by the principal that is calling the [AssumeRole] \
         operation. The source identity value persists across \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html#iam-term-role-chaining}chained \
         role} sessions.\n\n\
        \ You can require users to specify a source identity when they assume a role. You do this \
         by using the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceidentity} \
         [sts:SourceIdentity] } condition key in a role trust policy. You can use source identity \
         information in CloudTrail logs to determine who took actions with a role. You can use the \
         [aws:SourceIdentity] condition key to further control access to Amazon Web Services \
         resources based on the value of source identity. For more information about using source \
         identity, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_control-access_monitor.html}Monitor \
         and control actions taken with assumed roles} in the {i IAM User Guide}.\n\
        \ \n\
        \  The regex used to validate this parameter is a string of characters consisting of \
         upper- and lower-case alphanumeric characters with no spaces. You can also include \
         underscores or any of the following characters: +=,.\\@-. You cannot use a value that \
         begins with the text [aws:]. This prefix is reserved for Amazon Web Services internal use.\n\
        \  "]
  provided_contexts : provided_contexts_list_type option;
      [@ocaml.doc
        "A list of previously acquired trusted context assertions in the format of a JSON array. \
         The trusted context assertion is signed and encrypted by Amazon Web Services STS.\n\n\
        \ The following is an example of a [ProvidedContext] value that includes a single trusted \
         context assertion and the ARN of the context provider from which the trusted context \
         assertion was generated.\n\
        \ \n\
        \   \
         [\\[{\"ProviderArn\":\"arn:aws:iam::aws:contextProvider/IdentityCenter\",\"ContextAssertion\":\"trusted-context-assertion\"}\\]] \n\
        \  "]
}
[@@ocaml.doc ""]
