type nonrec virtual_mfa_device_name = string [@@ocaml.doc ""]

type nonrec serial_number_type = string [@@ocaml.doc ""]

type nonrec bootstrap_datum = bytes [@@ocaml.doc ""]

type nonrec path_type = string [@@ocaml.doc ""]

type nonrec user_name_type = string [@@ocaml.doc ""]

type nonrec id_type = string [@@ocaml.doc ""]

type nonrec arn_type = string [@@ocaml.doc ""]

type nonrec date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec permissions_boundary_attachment_type = Policy [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec attached_permissions_boundary = {
  permissions_boundary_arn : arn_type option;
      [@ocaml.doc
        " The ARN of the policy used to set the permissions boundary for the user or role.\n"]
  permissions_boundary_type : permissions_boundary_attachment_type option;
      [@ocaml.doc
        " The permissions boundary usage type that indicates what type of IAM resource is used as \
         the permissions boundary for an entity. This data type can only have a value of [Policy].\n"]
}
[@@ocaml.doc
  "Contains information about an attached permissions boundary.\n\n\
  \ An attached permissions boundary is a managed policy that has been attached to a user or role \
   to set the permissions boundary.\n\
  \ \n\
  \  For more information about permissions boundaries, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
   boundaries for IAM identities } in the {i IAM User Guide}.\n\
  \  "]

type nonrec tag_key_type = string [@@ocaml.doc ""]

type nonrec tag_value_type = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value_type;
      [@ocaml.doc
        "The value associated with this tag. For example, tags with a key name of [Department] \
         could have values such as [Human Resources], [Accounting], and [Support]. Tags with a key \
         name of [Cost\n\
        \        Center] might have values that consist of the number associated with the \
         different cost centers in your company. Typically, many resources have tags with the same \
         key name but with different values.\n"]
  key : tag_key_type;
      [@ocaml.doc
        "The key name that can be used to look up or retrieve the associated value. For example, \
         [Department] or [Cost Center] are common choices.\n"]
}
[@@ocaml.doc
  "A structure that represents user-provided metadata that can be associated with an IAM resource. \
   For more information about tagging, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} in the \
   {i IAM User Guide}.\n"]

type nonrec tag_list_type = tag list [@@ocaml.doc ""]

type nonrec user = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are associated with the user. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  permissions_boundary : attached_permissions_boundary option;
      [@ocaml.doc
        "For more information about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM identities } in the {i IAM User Guide}.\n"]
  password_last_used : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the user's password was last used to sign in to an Amazon Web Services website. For a \
         list of Amazon Web Services websites that capture a user's last sign-in time, see the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html}Credential \
         reports} topic in the {i IAM User Guide}. If a password is used more than once in a \
         five-minute span, only the first use is returned in this field. If the field is null (no \
         value), then it indicates that they never signed in with a password. This can be \
         because:\n\n\
        \ {ul\n\
        \       {-  The user never had a password.\n\
        \           \n\
        \            }\n\
        \       {-  A password exists but has not been used since IAM started tracking this \
         information on October 20, 2014.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   A null value does not mean that the user {i never} had a password. Also, if the user \
         does not currently have a password but had one in the past, then this field contains the \
         date and time the most recent password was used.\n\
        \   \n\
        \    This value is returned only in the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html}GetUser} and \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUsers.html}ListUsers} \
         operations. \n\
        \    "]
  create_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the user was created.\n"]
  arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs \
         and how to use ARNs in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}. \n"]
  user_id : id_type;
      [@ocaml.doc
        "The stable and unique string identifying the user. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  user_name : user_name_type; [@ocaml.doc "The friendly name identifying the user.\n"]
  path : path_type;
      [@ocaml.doc
        "The path to the user. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\n\
        \ The ARN of the policy used to set the permissions boundary for the user.\n\
        \ "]
}
[@@ocaml.doc
  "Contains information about an IAM user entity.\n\n\
  \ This data type is used as a response element in the following operations:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateUser.html}CreateUser} \n\
  \            \n\
  \             }\n\
  \        {-   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html}GetUser} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUsers.html}ListUsers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec virtual_mfa_device = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the virtual MFA device. For more information about \
         tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n"]
  enable_date : date_type option;
      [@ocaml.doc "The date and time on which the virtual MFA device was enabled.\n"]
  user : user option; [@ocaml.doc "The IAM user associated with this virtual MFA device.\n"]
  qr_code_pn_g : bootstrap_datum option;
      [@ocaml.doc
        " A QR code PNG image that encodes \
         [otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String] where \
         [$virtualMFADeviceName] is one of the create call arguments. [AccountName] is the user \
         name if set (otherwise, the account ID otherwise), and [Base32String] is the seed in \
         base32 format. The [Base32String] value is base64-encoded. \n"]
  base32_string_seed : bootstrap_datum option;
      [@ocaml.doc
        " The base32 seed defined as specified in \
         {{:https://tools.ietf.org/html/rfc3548.txt}RFC3548}. The [Base32StringSeed] is \
         base32-encoded. \n"]
  serial_number : serial_number_type;
      [@ocaml.doc "The serial number associated with [VirtualMFADevice].\n"]
}
[@@ocaml.doc "Contains information about a virtual MFA device.\n"]

type nonrec virtual_mfa_device_list_type = virtual_mfa_device list [@@ocaml.doc ""]

type nonrec user_list_type = user list [@@ocaml.doc ""]

type nonrec policy_name_type = string [@@ocaml.doc ""]

type nonrec policy_document_type = string [@@ocaml.doc ""]

type nonrec policy_detail = {
  policy_document : policy_document_type option; [@ocaml.doc "The policy document.\n"]
  policy_name : policy_name_type option; [@ocaml.doc "The name of the policy.\n"]
}
[@@ocaml.doc
  "Contains information about an IAM policy, including the policy document.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operation.\n\
  \ "]

type nonrec policy_detail_list_type = policy_detail list [@@ocaml.doc ""]

type nonrec group_name_type = string [@@ocaml.doc ""]

type nonrec group_name_list_type = group_name_type list [@@ocaml.doc ""]

type nonrec attached_policy = {
  policy_arn : arn_type option; [@ocaml.doc ""]
  policy_name : policy_name_type option; [@ocaml.doc "The friendly name of the attached policy.\n"]
}
[@@ocaml.doc
  "Contains information about an attached policy.\n\n\
  \ An attached policy is a managed policy that has been attached to a user, group, or role. This \
   data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedGroupPolicies.html}ListAttachedGroupPolicies}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedRolePolicies.html}ListAttachedRolePolicies}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedUserPolicies.html}ListAttachedUserPolicies}, \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operations. \n\
  \ \n\
  \  For more information about managed policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec attached_policies_list_type = attached_policy list [@@ocaml.doc ""]

type nonrec user_detail = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are associated with the user. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  permissions_boundary : attached_permissions_boundary option;
      [@ocaml.doc
        "The ARN of the policy used to set the permissions boundary for the user.\n\n\
        \ For more information about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM identities } in the {i IAM User Guide}.\n\
        \ "]
  attached_managed_policies : attached_policies_list_type option;
      [@ocaml.doc "A list of the managed policies attached to the user.\n"]
  group_list : group_name_list_type option;
      [@ocaml.doc "A list of IAM groups that the user is in.\n"]
  user_policy_list : policy_detail_list_type option;
      [@ocaml.doc "A list of the inline policies embedded in the user.\n"]
  create_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the user was created.\n"]
  arn : arn_type option; [@ocaml.doc ""]
  user_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the user. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  user_name : user_name_type option; [@ocaml.doc "The friendly name identifying the user.\n"]
  path : path_type option;
      [@ocaml.doc
        "The path to the user. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
}
[@@ocaml.doc
  "Contains information about an IAM user, including all the user's policies and all the IAM \
   groups the user is in.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operation.\n\
  \ "]

type nonrec user_detail_list_type = user_detail list [@@ocaml.doc ""]

type nonrec unrecognized_public_key_encoding_message = string [@@ocaml.doc ""]

type nonrec unmodifiable_entity_message = string [@@ocaml.doc ""]

type nonrec thumbprint_type = string [@@ocaml.doc ""]

type nonrec thumbprint_list_type = thumbprint_type list [@@ocaml.doc ""]

type nonrec tag_key_list_type = tag_key_type list [@@ocaml.doc ""]

type nonrec summary_value_type = int [@@ocaml.doc ""]

type nonrec summary_state_type =
  | FAILED [@ocaml.doc ""]
  | NOT_SUPPORTED [@ocaml.doc ""]
  | NOT_AVAILABLE [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec summary_key_type =
  | RolesQuota [@ocaml.doc ""]
  | Roles [@ocaml.doc ""]
  | RolePolicySizeQuota [@ocaml.doc ""]
  | Providers [@ocaml.doc ""]
  | InstanceProfilesQuota [@ocaml.doc ""]
  | InstanceProfiles [@ocaml.doc ""]
  | AssumeRolePolicySizeQuota [@ocaml.doc ""]
  | GlobalEndpointTokenVersion [@ocaml.doc ""]
  | VersionsPerPolicyQuota [@ocaml.doc ""]
  | PolicyVersionsInUseQuota [@ocaml.doc ""]
  | PolicyVersionsInUse [@ocaml.doc ""]
  | PolicySizeQuota [@ocaml.doc ""]
  | PoliciesQuota [@ocaml.doc ""]
  | Policies [@ocaml.doc ""]
  | AttachedPoliciesPerUserQuota [@ocaml.doc ""]
  | AttachedPoliciesPerRoleQuota [@ocaml.doc ""]
  | AttachedPoliciesPerGroupQuota [@ocaml.doc ""]
  | AccountSigningCertificatesPresent [@ocaml.doc ""]
  | AccountPasswordPresent [@ocaml.doc ""]
  | AccountAccessKeysPresent [@ocaml.doc ""]
  | AccountMFAEnabled [@ocaml.doc ""]
  | MFADevicesInUse [@ocaml.doc ""]
  | MFADevices [@ocaml.doc ""]
  | AccessKeysPerUserQuota [@ocaml.doc ""]
  | SigningCertificatesPerUserQuota [@ocaml.doc ""]
  | GroupsPerUserQuota [@ocaml.doc ""]
  | GroupPolicySizeQuota [@ocaml.doc ""]
  | UserPolicySizeQuota [@ocaml.doc ""]
  | ServerCertificatesQuota [@ocaml.doc ""]
  | ServerCertificates [@ocaml.doc ""]
  | GroupsQuota [@ocaml.doc ""]
  | Groups [@ocaml.doc ""]
  | UsersQuota [@ocaml.doc ""]
  | Users [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec summary_map_type = (summary_key_type * summary_value_type) list [@@ocaml.doc ""]

type nonrec summary_content_type = string [@@ocaml.doc ""]

type nonrec string_type = string [@@ocaml.doc ""]

type nonrec status_type =
  | Expired [@ocaml.doc ""]
  | Inactive [@ocaml.doc ""]
  | Active [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec state_type =
  | EXPIRED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
  | FINALIZED [@ocaml.doc ""]
  | PENDING_APPROVAL [@ocaml.doc ""]
  | ASSIGNED [@ocaml.doc ""]
  | UNASSIGNED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_key_type =
  | LAST_AUTHENTICATED_TIME_DESCENDING [@ocaml.doc ""]
  | LAST_AUTHENTICATED_TIME_ASCENDING [@ocaml.doc ""]
  | SERVICE_NAMESPACE_DESCENDING [@ocaml.doc ""]
  | SERVICE_NAMESPACE_ASCENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec session_duration_type = int [@@ocaml.doc ""]

type nonrec service_user_name = string [@@ocaml.doc ""]

type nonrec service_specific_credential_id = string [@@ocaml.doc ""]

type nonrec service_password = string [@@ocaml.doc ""]

type nonrec service_not_supported_message = string [@@ocaml.doc ""]

type nonrec service_namespace_type = string [@@ocaml.doc ""]

type nonrec service_namespace_list_type = service_namespace_type list [@@ocaml.doc ""]

type nonrec service_name_type = string [@@ocaml.doc ""]

type nonrec service_name = string [@@ocaml.doc ""]

type nonrec service_failure_exception_message = string [@@ocaml.doc ""]

type nonrec service_credential_secret = string [@@ocaml.doc ""]

type nonrec service_credential_alias = string [@@ocaml.doc ""]

type nonrec server_certificate_name_type = string [@@ocaml.doc ""]

type nonrec server_certificate_metadata = {
  expiration : date_type option;
      [@ocaml.doc "The date on which the certificate is set to expire.\n"]
  upload_date : date_type option;
      [@ocaml.doc "The date when the server certificate was uploaded.\n"]
  arn : arn_type;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) specifying the server certificate. For more information \
         about ARNs and how to use them in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  server_certificate_id : id_type;
      [@ocaml.doc
        " The stable and unique string identifying the server certificate. For more information \
         about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc "The name that identifies the server certificate.\n"]
  path : path_type;
      [@ocaml.doc
        " The path to the server certificate. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
}
[@@ocaml.doc
  "Contains information about a server certificate without its certificate body, certificate \
   chain, and private key.\n\n\
  \  This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadServerCertificate.html}UploadServerCertificate} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListServerCertificates.html}ListServerCertificates} \
   operations. \n\
  \ "]

type nonrec server_certificate_metadata_list_type = server_certificate_metadata list
[@@ocaml.doc ""]

type nonrec role_permission_restriction_arn_list_type = arn_type list [@@ocaml.doc ""]

type nonrec role_name_type = string [@@ocaml.doc ""]

type nonrec role_max_session_duration_type = int [@@ocaml.doc ""]

type nonrec role_description_type = string [@@ocaml.doc ""]

type nonrec role_last_used = {
  region : string_type option;
      [@ocaml.doc "The name of the Amazon Web Services Region in which the role was last used.\n"]
  last_used_date : date_type option;
      [@ocaml.doc
        "The date and time, in\194\160{{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format} \
         that the role was last used.\n\n\
        \ This field is null if the role has not been used within the IAM tracking period. For \
         more information about the tracking period, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period}Regions \
         where data is tracked} in the {i IAM User Guide}. \n\
        \ "]
}
[@@ocaml.doc
  "Contains information about the last time that an IAM role was used. This includes the date and \
   time and the Region in which the role was last used. Activity is only reported for the trailing \
   400 days. This period can be shorter if your Region began supporting these features within the \
   last year. The role might have been used more than 400 days ago. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period}Regions \
   where data is tracked} in the {i IAM user Guide}.\n\n\
  \ This data type is returned as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html}GetRole} and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operations.\n\
  \ "]

type nonrec role = {
  role_last_used : role_last_used option;
      [@ocaml.doc
        "Contains information about the last time that an IAM role was used. This includes the \
         date and time and the Region in which the role was last used. Activity is only reported \
         for the trailing 400 days. This period can be shorter if your Region began supporting \
         these features within the last year. The role might have been used more than 400 days \
         ago. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period}Regions \
         where data is tracked} in the {i IAM user Guide}.\n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the role. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  permissions_boundary : attached_permissions_boundary option;
      [@ocaml.doc
        "The ARN of the policy used to set the permissions boundary for the role.\n\n\
        \ For more information about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM identities } in the {i IAM User Guide}.\n\
        \ "]
  max_session_duration : role_max_session_duration_type option;
      [@ocaml.doc
        "The maximum session duration (in seconds) for the specified role. Anyone who uses the \
         CLI, or API to assume the role can specify the duration using the optional \
         [DurationSeconds] API parameter or [duration-seconds] CLI parameter.\n"]
  description : role_description_type option;
      [@ocaml.doc "A description of the role that you provide.\n"]
  assume_role_policy_document : policy_document_type option;
      [@ocaml.doc "The policy that grants an entity permission to assume the role.\n"]
  create_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the role was created.\n"]
  arn : arn_type;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) specifying the role. For more information about ARNs and \
         how to use them in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide} guide. \n"]
  role_id : id_type;
      [@ocaml.doc
        " The stable and unique string identifying the role. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  role_name : role_name_type; [@ocaml.doc "The friendly name that identifies the role.\n"]
  path : path_type;
      [@ocaml.doc
        " The path to the role. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
}
[@@ocaml.doc
  "Contains information about an IAM role. This structure is returned as a response element in \
   several API operations that interact with roles.\n"]

type nonrec role_list_type = role list [@@ocaml.doc ""]

type nonrec instance_profile_name_type = string [@@ocaml.doc ""]

type nonrec instance_profile = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the instance profile. For more information about \
         tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n"]
  roles : role_list_type; [@ocaml.doc "The role associated with the instance profile.\n"]
  create_date : date_type; [@ocaml.doc "The date when the instance profile was created.\n"]
  arn : arn_type;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) specifying the instance profile. For more information \
         about ARNs and how to use them in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  instance_profile_id : id_type;
      [@ocaml.doc
        " The stable and unique string identifying the instance profile. For more information \
         about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc "The name identifying the instance profile.\n"]
  path : path_type;
      [@ocaml.doc
        " The path to the instance profile. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
}
[@@ocaml.doc
  "Contains information about an instance profile.\n\n\
  \ This data type is used as a response element in the following operations:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateInstanceProfile.html}CreateInstanceProfile} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetInstanceProfile.html}GetInstanceProfile} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListInstanceProfiles.html}ListInstanceProfiles} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListInstanceProfilesForRole.html}ListInstanceProfilesForRole} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec instance_profile_list_type = instance_profile list [@@ocaml.doc ""]

type nonrec role_detail = {
  role_last_used : role_last_used option;
      [@ocaml.doc
        "Contains information about the last time that an IAM role was used. This includes the \
         date and time and the Region in which the role was last used. Activity is only reported \
         for the trailing 400 days. This period can be shorter if your Region began supporting \
         these features within the last year. The role might have been used more than 400 days \
         ago. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period}Regions \
         where data is tracked} in the {i IAM User Guide}.\n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the role. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  permissions_boundary : attached_permissions_boundary option;
      [@ocaml.doc
        "The ARN of the policy used to set the permissions boundary for the role.\n\n\
        \ For more information about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM identities } in the {i IAM User Guide}.\n\
        \ "]
  attached_managed_policies : attached_policies_list_type option;
      [@ocaml.doc
        "A list of managed policies attached to the role. These policies are the role's access \
         (permissions) policies.\n"]
  role_policy_list : policy_detail_list_type option;
      [@ocaml.doc
        "A list of inline policies embedded in the role. These policies are the role's access \
         (permissions) policies.\n"]
  instance_profile_list : instance_profile_list_type option;
      [@ocaml.doc "A list of instance profiles that contain this role.\n"]
  assume_role_policy_document : policy_document_type option;
      [@ocaml.doc "The trust policy that grants permission to assume the role.\n"]
  create_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the role was created.\n"]
  arn : arn_type option; [@ocaml.doc ""]
  role_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the role. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  role_name : role_name_type option; [@ocaml.doc "The friendly name that identifies the role.\n"]
  path : path_type option;
      [@ocaml.doc
        "The path to the role. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
}
[@@ocaml.doc
  "Contains information about an IAM role, including all of the role's policies.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operation.\n\
  \ "]

type nonrec role_detail_list_type = role_detail list [@@ocaml.doc ""]

type nonrec response_marker_type = string [@@ocaml.doc ""]

type nonrec requestor_workflow_id_type = string [@@ocaml.doc ""]

type nonrec requestor_name_type = string [@@ocaml.doc ""]

type nonrec request_message_type = string [@@ocaml.doc ""]

type nonrec report_generation_limit_exceeded_message = string [@@ocaml.doc ""]

type nonrec redirect_url_type = string [@@ocaml.doc ""]

type nonrec public_key_material_type = string [@@ocaml.doc ""]

type nonrec public_key_id_type = string [@@ocaml.doc ""]

type nonrec public_key_fingerprint_type = string [@@ocaml.doc ""]

type nonrec private_key_type = string [@@ocaml.doc ""]

type nonrec private_key_id_type = string [@@ocaml.doc ""]

type nonrec saml_private_key = {
  timestamp : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time } format, when \
         the private key was uploaded.\n"]
  key_id : private_key_id_type option;
      [@ocaml.doc "The unique identifier for the SAML private key.\n"]
}
[@@ocaml.doc
  "Contains the private keys for the SAML provider.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html}GetSAMLProvider} \
   operation.\n\
  \ "]

type nonrec private_key_list = saml_private_key list [@@ocaml.doc ""]

type nonrec policy_version_id_type = string [@@ocaml.doc ""]

type nonrec policy_type = MANAGED [@ocaml.doc ""] | INLINE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec policy_scope_type = Local [@ocaml.doc ""] | AWS [@ocaml.doc ""] | All [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_path_type = string [@@ocaml.doc ""]

type nonrec policy_parameter_value_type = string [@@ocaml.doc ""]

type nonrec policy_parameter_values_list_type = policy_parameter_value_type list [@@ocaml.doc ""]

type nonrec policy_parameter_name_type = string [@@ocaml.doc ""]

type nonrec policy_parameter_type_enum = STRING_LIST [@ocaml.doc ""] | STRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_parameter = {
  type_ : policy_parameter_type_enum option;
      [@ocaml.doc "The data type of the policy parameter value.\n"]
  values : policy_parameter_values_list_type option;
      [@ocaml.doc "The allowed values for the policy parameter.\n"]
  name : policy_parameter_name_type option; [@ocaml.doc "The name of the policy parameter.\n"]
}
[@@ocaml.doc
  "Contains information about a policy parameter used to customize delegated permissions.\n"]

type nonrec policy_parameter_list_type = policy_parameter list [@@ocaml.doc ""]

type nonrec policy_owner_entity_type =
  | GROUP [@ocaml.doc ""]
  | ROLE [@ocaml.doc ""]
  | USER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_not_attachable_message = string [@@ocaml.doc ""]

type nonrec policy_name_list_type = policy_name_type list [@@ocaml.doc ""]

type nonrec attachment_count_type = int [@@ocaml.doc ""]

type nonrec boolean_type = bool [@@ocaml.doc ""]

type nonrec policy_description_type = string [@@ocaml.doc ""]

type nonrec policy = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the instance profile. For more information about \
         tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n"]
  update_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the policy was last updated.\n\n\
        \ When a policy has only one version, this field contains the date and time when the \
         policy was created. When a policy has more than one version, this field contains the date \
         and time when the most recent policy version was created.\n\
        \ "]
  create_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the policy was created.\n"]
  description : policy_description_type option;
      [@ocaml.doc
        "A friendly description of the policy.\n\n\
        \ This element is included in the response to the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy} \
         operation. It is not included in the response to the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicies.html}ListPolicies} \
         operation. \n\
        \ "]
  is_attachable : boolean_type option;
      [@ocaml.doc "Specifies whether the policy can be attached to an IAM user, group, or role.\n"]
  permissions_boundary_usage_count : attachment_count_type option;
      [@ocaml.doc
        "The number of entities (users and roles) for which the policy is used to set the \
         permissions boundary. \n\n\
        \ For more information about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM identities } in the {i IAM User Guide}.\n\
        \ "]
  attachment_count : attachment_count_type option;
      [@ocaml.doc
        "The number of entities (users, groups, and roles) that the policy is attached to.\n"]
  default_version_id : policy_version_id_type option;
      [@ocaml.doc
        "The identifier for the version of the policy that is set as the default version.\n"]
  path : policy_path_type option;
      [@ocaml.doc
        "The path to the policy.\n\n\
        \ For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\
        \ "]
  arn : arn_type option; [@ocaml.doc ""]
  policy_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the policy.\n\n\
        \ For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\
        \ "]
  policy_name : policy_name_type option;
      [@ocaml.doc "The friendly name (not ARN) identifying the policy.\n"]
}
[@@ocaml.doc
  "Contains information about a managed policy.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html}CreatePolicy}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy}, and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicies.html}ListPolicies} \
   operations. \n\
  \ \n\
  \  For more information about managed policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec policy_list_type = policy list [@@ocaml.doc ""]

type nonrec entity_name_type = string [@@ocaml.doc ""]

type nonrec policy_granting_service_access = {
  entity_name : entity_name_type option;
      [@ocaml.doc
        "The name of the entity (user or role) to which the inline policy is attached.\n\n\
        \ This field is null for managed policies. For more information about these policy types, \
         see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html}Managed \
         policies and inline policies} in the {i IAM User Guide}.\n\
        \ "]
  entity_type : policy_owner_entity_type option;
      [@ocaml.doc
        "The type of entity (user or role) that used the policy to access the service to which the \
         inline policy is attached.\n\n\
        \ This field is null for managed policies. For more information about these policy types, \
         see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html}Managed \
         policies and inline policies} in the {i IAM User Guide}.\n\
        \ "]
  policy_arn : arn_type option; [@ocaml.doc ""]
  policy_type : policy_type;
      [@ocaml.doc
        "The policy type. For more information about these policy types, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html}Managed \
         policies and inline policies} in the {i IAM User Guide}.\n"]
  policy_name : policy_name_type; [@ocaml.doc "The policy name.\n"]
}
[@@ocaml.doc
  "Contains details about the permissions policies that are attached to the specified identity \
   (user, group, or role).\n\n\
  \ This data type is an element of the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPoliciesGrantingServiceAccessEntry.html}ListPoliciesGrantingServiceAccessEntry} \
   object.\n\
  \ "]

type nonrec policy_granting_service_access_list_type = policy_granting_service_access list
[@@ocaml.doc ""]

type nonrec policy_evaluation_error_message = string [@@ocaml.doc ""]

type nonrec policy_version = {
  create_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the policy version was created.\n"]
  is_default_version : boolean_type option;
      [@ocaml.doc "Specifies whether the policy version is set as the policy's default version.\n"]
  version_id : policy_version_id_type option;
      [@ocaml.doc
        "The identifier for the policy version.\n\n\
        \ Policy version identifiers always begin with [v] (always lowercase). When a policy is \
         created, the first policy version is [v1]. \n\
        \ "]
  document : policy_document_type option;
      [@ocaml.doc
        "The policy document.\n\n\
        \ The policy document is returned in the response to the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion} \
         and \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
         operations. It is not returned in the response to the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicyVersion.html}CreatePolicyVersion} \
         or \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html}ListPolicyVersions} \
         operations. \n\
        \ \n\
        \  The policy document returned in this structure is URL-encoded compliant with \
         {{:https://tools.ietf.org/html/rfc3986}RFC 3986}. You can use a URL decoding method to \
         convert the policy back to plain JSON text. For example, if you use Java, you can use the \
         [decode] method of the [java.net.URLDecoder] utility class in the Java SDK. Other \
         languages and SDKs provide similar functionality.\n\
        \  "]
}
[@@ocaml.doc
  "Contains information about a version of a managed policy.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicyVersion.html}CreatePolicyVersion}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html}ListPolicyVersions}, \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operations. \n\
  \ \n\
  \  For more information about managed policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec policy_document_version_list_type = policy_version list [@@ocaml.doc ""]

type nonrec permission_type = string [@@ocaml.doc ""]

type nonrec permission_check_status_type =
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec permission_check_result_type =
  | UNSURE [@ocaml.doc ""]
  | DENIED [@ocaml.doc ""]
  | ALLOWED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec path_prefix_type = string [@@ocaml.doc ""]

type nonrec password_type = string [@@ocaml.doc ""]

type nonrec password_reuse_prevention_type = int [@@ocaml.doc ""]

type nonrec password_policy_violation_message = string [@@ocaml.doc ""]

type nonrec owner_id_type = string [@@ocaml.doc ""]

type nonrec organizations_policy_id_type = string [@@ocaml.doc ""]

type nonrec organizations_entity_path_type = string [@@ocaml.doc ""]

type nonrec open_id_idp_communication_error_exception_message = string [@@ocaml.doc ""]

type nonrec notification_channel_type = string [@@ocaml.doc ""]

type nonrec notes_type = string [@@ocaml.doc ""]

type nonrec no_such_entity_message = string [@@ocaml.doc ""]

type nonrec minimum_password_length_type = int [@@ocaml.doc ""]

type nonrec mfa_device = {
  enable_date : date_type; [@ocaml.doc "The date when the MFA device was enabled for the user.\n"]
  serial_number : serial_number_type;
      [@ocaml.doc
        "The serial number that uniquely identifies the MFA device. For virtual MFA devices, the \
         serial number is the device ARN.\n"]
  user_name : user_name_type; [@ocaml.doc "The user with whom the MFA device is associated.\n"]
}
[@@ocaml.doc
  "Contains information about an MFA device.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListMFADevices.html}ListMFADevices} \
   operation.\n\
  \ "]

type nonrec mfa_device_list_type = mfa_device list [@@ocaml.doc ""]

type nonrec max_password_age_type = int [@@ocaml.doc ""]

type nonrec max_items_type = int [@@ocaml.doc ""]

type nonrec marker_type = string [@@ocaml.doc ""]

type nonrec malformed_policy_document_message = string [@@ocaml.doc ""]

type nonrec malformed_certificate_message = string [@@ocaml.doc ""]

type nonrec locale_type = string [@@ocaml.doc ""]

type nonrec list_policies_granting_service_access_entry = {
  policies : policy_granting_service_access_list_type option;
      [@ocaml.doc
        "The\194\160[PoliciesGrantingServiceAccess] object that contains details about the policy.\n"]
  service_namespace : service_namespace_type option;
      [@ocaml.doc
        "The namespace of the service that was accessed.\n\n\
        \ To learn the service namespace of a service, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html}Actions, \
         resources, and condition keys for Amazon Web Services services} in the {i Service \
         Authorization Reference}. Choose the name of the service to view details for that \
         service. In the first paragraph, find the service prefix. For example, [(service prefix: \
         a4b)]. For more information about service namespaces, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon \
         Web Services service namespaces} in the\194\160{i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc
  "Contains details about the permissions policies that are attached to the specified identity \
   (user, group, or role).\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPoliciesGrantingServiceAccess.html}ListPoliciesGrantingServiceAccess} \
   operation.\n\
  \ "]

type nonrec list_policy_granting_service_access_response_list_type =
  list_policies_granting_service_access_entry list
[@@ocaml.doc ""]

type nonrec limit_exceeded_message = string [@@ocaml.doc ""]

type nonrec key_pair_mismatch_message = string [@@ocaml.doc ""]

type nonrec job_status_type =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec job_id_type = string [@@ocaml.doc ""]

type nonrec invalid_user_type_message = string [@@ocaml.doc ""]

type nonrec invalid_public_key_message = string [@@ocaml.doc ""]

type nonrec invalid_input_message = string [@@ocaml.doc ""]

type nonrec invalid_certificate_message = string [@@ocaml.doc ""]

type nonrec invalid_authentication_code_message = string [@@ocaml.doc ""]

type nonrec integer_type = int [@@ocaml.doc ""]

type nonrec group = {
  create_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the group was created.\n"]
  arn : arn_type;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) specifying the group. For more information about ARNs and \
         how to use them in policies, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  group_id : id_type;
      [@ocaml.doc
        " The stable and unique string identifying the group. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  group_name : group_name_type; [@ocaml.doc "The friendly name that identifies the group.\n"]
  path : path_type;
      [@ocaml.doc
        "The path to the group. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
}
[@@ocaml.doc
  "Contains information about an IAM group entity.\n\n\
  \ This data type is used as a response element in the following operations:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateGroup.html}CreateGroup} \n\
  \            \n\
  \             }\n\
  \        {-   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroup.html}GetGroup} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroups.html}ListGroups} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec group_list_type = group list [@@ocaml.doc ""]

type nonrec group_detail = {
  attached_managed_policies : attached_policies_list_type option;
      [@ocaml.doc "A list of the managed policies attached to the group.\n"]
  group_policy_list : policy_detail_list_type option;
      [@ocaml.doc "A list of the inline policies embedded in the group.\n"]
  create_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the group was created.\n"]
  arn : arn_type option; [@ocaml.doc ""]
  group_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the group. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  group_name : group_name_type option; [@ocaml.doc "The friendly name that identifies the group.\n"]
  path : path_type option;
      [@ocaml.doc
        "The path to the group. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
}
[@@ocaml.doc
  "Contains information about an IAM group, including all of the group's policies.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operation.\n\
  \ "]

type nonrec group_detail_list_type = group_detail list [@@ocaml.doc ""]

type nonrec global_endpoint_token_version = V2Token [@ocaml.doc ""] | V1Token [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec existing_user_name_type = string [@@ocaml.doc ""]

type nonrec entity_temporarily_unmodifiable_message = string [@@ocaml.doc ""]

type nonrec entity_type =
  | AWSManagedPolicy [@ocaml.doc ""]
  | LocalManagedPolicy [@ocaml.doc ""]
  | Group [@ocaml.doc ""]
  | Role [@ocaml.doc ""]
  | User [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_list_type = entity_type list [@@ocaml.doc ""]

type nonrec entity_info = {
  path : path_type option;
      [@ocaml.doc
        "The path to the entity (user or role). For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}. \n"]
  id : id_type; [@ocaml.doc "The identifier of the entity (user or role).\n"]
  type_ : policy_owner_entity_type; [@ocaml.doc "The type of entity (user or role).\n"]
  name : user_name_type; [@ocaml.doc "The name of the entity (user or role).\n"]
  arn : arn_type; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Contains details about the specified entity (user or role).\n\n\
  \ This data type is an element of the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_EntityDetails.html}EntityDetails} \
   object.\n\
  \ "]

type nonrec entity_details = {
  last_authenticated : date_type option;
      [@ocaml.doc
        "The date and time, in\194\160{{:http://www.iso.org/iso/iso8601}ISO 8601 date-time \
         format}, when the authenticated entity last attempted to access Amazon Web Services. \
         Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no IAM entities attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  entity_info : entity_info;
      [@ocaml.doc
        "The\194\160[EntityInfo] object that contains details about the entity (user or role).\n"]
}
[@@ocaml.doc
  "An object that contains details about when the IAM entities (users or roles) were last used in \
   an attempt to access the specified Amazon Web Services service.\n\n\
  \ This data type is a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html}GetServiceLastAccessedDetailsWithEntities} \
   operation.\n\
  \ "]

type nonrec entity_details_list_type = entity_details list [@@ocaml.doc ""]

type nonrec entity_already_exists_message = string [@@ocaml.doc ""]

type nonrec encoding_type = PEM [@ocaml.doc ""] | SSH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec duplicate_ssh_public_key_message = string [@@ocaml.doc ""]

type nonrec duplicate_certificate_message = string [@@ocaml.doc ""]

type nonrec delete_conflict_message = string [@@ocaml.doc ""]

type nonrec delegation_request_id_type = string [@@ocaml.doc ""]

type nonrec account_id_type = string [@@ocaml.doc ""]

type nonrec delegation_request_description_type = string [@@ocaml.doc ""]

type nonrec delegation_permission = {
  parameters : policy_parameter_list_type option;
      [@ocaml.doc
        "A list of policy parameters that define the scope and constraints of the delegated \
         permissions.\n"]
  policy_template_arn : arn_type option;
      [@ocaml.doc
        "This ARN maps to a pre-registered policy content for this partner. See the {{:}partner \
         onboarding documentation} to understand how to create a delegation template.\n"]
}
[@@ocaml.doc
  "Contains information about the permissions being delegated in a delegation request.\n"]

type nonrec delegation_request = {
  updated_time : date_type option; [@ocaml.doc "Last updated timestamp of the request.\n"]
  only_send_by_owner : boolean_type option;
      [@ocaml.doc
        "A flag indicating whether the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SendDelegationToken.html}SendDelegationToken} \
         must be called by the owner of this delegation request. This is set by the requesting \
         partner.\n"]
  rejection_reason : notes_type option;
      [@ocaml.doc
        "Reasons for rejecting this delegation request, if this request was rejected. See also \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_RejectDelegationRequest.html}RejectDelegationRequest} \
         API documentation. \n"]
  notes : notes_type option;
      [@ocaml.doc
        "Notes added to this delegation request, if this request was updated via the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateDelegationRequest.html}UpdateDelegationRequest} \
         API.\n"]
  redirect_url : redirect_url_type option;
      [@ocaml.doc
        "A URL to be redirected to once the delegation request is approved. Partners provide this \
         URL when creating the delegation request.\n"]
  session_duration : session_duration_type option;
      [@ocaml.doc "The life-time of the requested session credential.\n"]
  create_date : date_type option;
      [@ocaml.doc "Creation date (timestamp) of this delegation request.\n"]
  requestor_name : requestor_name_type option; [@ocaml.doc "A friendly name of the requestor.\n"]
  requestor_id : account_id_type option;
      [@ocaml.doc
        "Identity of the requestor of this delegation request. This will be an Amazon Web Services \
         account ID.\n"]
  expiration_time : date_type option;
      [@ocaml.doc
        "The expiry time of this delegation request\n\n\
        \ See the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/temporary-delegation-building-integration.html#temporary-delegation-request-lifecycle}Understanding \
         the Request Lifecycle} for details on the life time of a delegation request at each state.\n\
        \ "]
  state : state_type option;
      [@ocaml.doc
        "The state of this delegation request.\n\n\
        \ See the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/temporary-delegation-building-integration.html#temporary-delegation-request-lifecycle}Understanding \
         the Request Lifecycle} for an explanation of how these states are transitioned. \n\
        \ "]
  approver_id : arn_type option; [@ocaml.doc ""]
  owner_id : owner_id_type option; [@ocaml.doc "ARN of the owner of this delegation request.\n"]
  role_permission_restriction_arns : role_permission_restriction_arn_list_type option;
      [@ocaml.doc
        "If the [PermissionPolicy] includes role creation permissions, this element will include \
         the list of permissions boundary policies associated with the role creation. See \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} for more details about IAM permission boundaries. \n"]
  permission_policy : permission_type option;
      [@ocaml.doc "JSON content of the associated permission policy of this delegation request.\n"]
  permissions : delegation_permission option; [@ocaml.doc ""]
  request_message : request_message_type option;
      [@ocaml.doc
        "A custom message that is added to the delegation request by the partner.\n\n\
        \ This element is different from the [Description] element such that this is a request \
         specific message injected by the partner. The [Description] is typically a generic \
         explanation of what the delegation request is targeted to do.\n\
        \ "]
  description : delegation_request_description_type option;
      [@ocaml.doc
        "Description of the delegation request. This is a message that is provided by the Amazon \
         Web Services partner that filed the delegation request.\n"]
  owner_account_id : account_id_type option;
      [@ocaml.doc "Amazon Web Services account ID of the owner of the delegation request.\n"]
  delegation_request_id : delegation_request_id_type option;
      [@ocaml.doc "The unique identifier for the delegation request.\n"]
}
[@@ocaml.doc
  "Contains information about a delegation request, including its status, permissions, and \
   associated metadata.\n"]

type nonrec delegation_requests_list_type = delegation_request list [@@ocaml.doc ""]

type nonrec custom_suffix_type = string [@@ocaml.doc ""]

type nonrec credential_report_not_ready_exception_message = string [@@ocaml.doc ""]

type nonrec credential_report_not_present_exception_message = string [@@ocaml.doc ""]

type nonrec credential_report_expired_exception_message = string [@@ocaml.doc ""]

type nonrec credential_age_days = int [@@ocaml.doc ""]

type nonrec console_deep_link_type = string [@@ocaml.doc ""]

type nonrec client_id_type = string [@@ocaml.doc ""]

type nonrec client_id_list_type = client_id_type list [@@ocaml.doc ""]

type nonrec certificate_id_type = string [@@ocaml.doc ""]

type nonrec certificate_body_type = string [@@ocaml.doc ""]

type nonrec signing_certificate = {
  upload_date : date_type option;
      [@ocaml.doc "The date when the signing certificate was uploaded.\n"]
  status : status_type;
      [@ocaml.doc
        "The status of the signing certificate. [Active] means that the key is valid for API \
         calls, while [Inactive] means it is not.\n"]
  certificate_body : certificate_body_type;
      [@ocaml.doc "The contents of the signing certificate.\n"]
  certificate_id : certificate_id_type; [@ocaml.doc "The ID for the signing certificate.\n"]
  user_name : user_name_type;
      [@ocaml.doc "The name of the user the signing certificate is associated with.\n"]
}
[@@ocaml.doc
  "Contains information about an X.509 signing certificate.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSigningCertificate.html}UploadSigningCertificate} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSigningCertificates.html}ListSigningCertificates} \
   operations. \n\
  \ "]

type nonrec certificate_list_type = signing_certificate list [@@ocaml.doc ""]

type nonrec certificate_chain_type = string [@@ocaml.doc ""]

type nonrec boolean_object_type = bool [@@ocaml.doc ""]

type nonrec authentication_code_type = string [@@ocaml.doc ""]

type nonrec assignment_status_type =
  | Any [@ocaml.doc ""]
  | Unassigned [@ocaml.doc ""]
  | Assigned [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec assertion_encryption_mode_type = Allowed [@ocaml.doc ""] | Required [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec all_users = bool [@@ocaml.doc ""]

type nonrec account_alias_type = string [@@ocaml.doc ""]

type nonrec account_alias_list_type = account_alias_type list [@@ocaml.doc ""]

type nonrec access_key_secret_type = string [@@ocaml.doc ""]

type nonrec access_key_id_type = string [@@ocaml.doc ""]

type nonrec access_key_metadata = {
  create_date : date_type option; [@ocaml.doc "The date when the access key was created.\n"]
  status : status_type option;
      [@ocaml.doc
        "The status of the access key. [Active] means that the key is valid for API calls; \
         [Inactive] means it is not.\n"]
  access_key_id : access_key_id_type option; [@ocaml.doc "The ID for this access key.\n"]
  user_name : user_name_type option;
      [@ocaml.doc "The name of the IAM user that the key is associated with.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Web Services access key, without its secret key.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html}ListAccessKeys} \
   operation.\n\
  \ "]

type nonrec access_key_metadata_list_type = access_key_metadata list [@@ocaml.doc ""]

type nonrec upload_signing_certificate_response = {
  certificate : signing_certificate; [@ocaml.doc "Information about the certificate.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSigningCertificate.html}UploadSigningCertificate} \
   request. \n"]

type nonrec upload_signing_certificate_request = {
  certificate_body : certificate_body_type;
      [@ocaml.doc
        "The contents of the signing certificate.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user the signing certificate is for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec service_failure_exception = {
  message : service_failure_exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception or failure.\n"]

type nonrec no_such_entity_exception = { message : no_such_entity_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because it referenced a resource entity that does not exist. The error \
   message describes the resource.\n"]

type nonrec malformed_certificate_exception = {
  message : malformed_certificate_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the certificate was malformed or expired. The error message \
   describes the specific error.\n"]

type nonrec limit_exceeded_exception = { message : limit_exceeded_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because it attempted to create resources beyond the current Amazon Web \
   Services account limits. The error message describes the limit exceeded.\n"]

type nonrec invalid_certificate_exception = {
  message : invalid_certificate_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because the certificate is invalid.\n"]

type nonrec entity_already_exists_exception = {
  message : entity_already_exists_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because it attempted to create a resource that already exists.\n"]

type nonrec duplicate_certificate_exception = {
  message : duplicate_certificate_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the same certificate is associated with an IAM user in the \
   account.\n"]

type nonrec concurrent_modification_message = string [@@ocaml.doc ""]

type nonrec concurrent_modification_exception = {
  message : concurrent_modification_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because multiple requests to change this object were submitted \
   simultaneously. Wait a few minutes and submit your request again.\n"]

type nonrec upload_server_certificate_response = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the new IAM server certificate. The returned list of \
         tags is sorted by tag key. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  server_certificate_metadata : server_certificate_metadata option;
      [@ocaml.doc
        "The meta information of the uploaded server certificate without its certificate body, \
         certificate chain, and private key.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadServerCertificate.html}UploadServerCertificate} \
   request. \n"]

type nonrec upload_server_certificate_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new IAM server certificate resource. Each \
         tag consists of a key name and an associated value. For more information about tagging, \
         see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  certificate_chain : certificate_chain_type option;
      [@ocaml.doc
        "The contents of the certificate chain. This is typically a concatenation of the \
         PEM-encoded public key certificates of the chain.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  private_key : private_key_type;
      [@ocaml.doc
        "The contents of the private key in PEM-encoded format.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  certificate_body : certificate_body_type;
      [@ocaml.doc
        "The contents of the public key certificate in PEM-encoded format.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name for the server certificate. Do not include the path in this value. The name of \
         the certificate cannot contain any spaces.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  path : path_type option;
      [@ocaml.doc
        "The path for the server certificate. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/). This \
         parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a string \
         of characters consisting of either a forward slash (/) by itself or a string that must \
         begin and end with forward slashes. In addition, it can contain any ASCII character from \
         the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ \n\
        \    If you are uploading a server certificate specifically for use with Amazon CloudFront \
         distributions, you must specify a path using the [path] parameter. The path must begin \
         with [/cloudfront] and must include a trailing slash (for example, [/cloudfront/test/]).\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec key_pair_mismatch_exception = {
  message : key_pair_mismatch_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the public key certificate and the private key do not match.\n"]

type nonrec invalid_input_exception = { message : invalid_input_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because an invalid or out-of-range value was supplied for an input \
   parameter.\n"]

type nonrec ssh_public_key = {
  upload_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the SSH public key was uploaded.\n"]
  status : status_type;
      [@ocaml.doc
        "The status of the SSH public key. [Active] means that the key can be used for \
         authentication with an CodeCommit repository. [Inactive] means that the key cannot be \
         used.\n"]
  ssh_public_key_body : public_key_material_type; [@ocaml.doc "The SSH public key.\n"]
  fingerprint : public_key_fingerprint_type;
      [@ocaml.doc "The MD5 message digest of the SSH public key.\n"]
  ssh_public_key_id : public_key_id_type;
      [@ocaml.doc "The unique identifier for the SSH public key.\n"]
  user_name : user_name_type;
      [@ocaml.doc "The name of the IAM user associated with the SSH public key.\n"]
}
[@@ocaml.doc
  "Contains information about an SSH public key.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSSHPublicKey.html}GetSSHPublicKey} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSSHPublicKey.html}UploadSSHPublicKey} \
   operations. \n\
  \ "]

type nonrec upload_ssh_public_key_response = {
  ssh_public_key : ssh_public_key option;
      [@ocaml.doc "Contains information about the SSH public key.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSSHPublicKey.html}UploadSSHPublicKey} \
   request.\n"]

type nonrec upload_ssh_public_key_request = {
  ssh_public_key_body : public_key_material_type;
      [@ocaml.doc
        "The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. The \
         minimum bit-length of the public key is 2048 bits. For example, you can generate a \
         2048-bit key, and the resulting PEM file is 1679 bytes long.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the IAM user to associate the SSH public key with.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec unrecognized_public_key_encoding_exception = {
  message : unrecognized_public_key_encoding_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the public key encoding format is unsupported or unrecognized.\n"]

type nonrec invalid_public_key_exception = {
  message : invalid_public_key_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because the public key is malformed or otherwise invalid.\n"]

type nonrec duplicate_ssh_public_key_exception = {
  message : duplicate_ssh_public_key_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the SSH public key is already associated with the specified \
   IAM user.\n"]

type nonrec update_user_request = {
  new_user_name : user_name_type option;
      [@ocaml.doc
        "New name for the user. Include this parameter only if you're changing the user's name.\n\n\
        \ IAM user, group, role, and policy names must be unique within the account. Names are not \
         distinguished by case. For example, you cannot create resources named both \"MyResource\" \
         and \"myresource\".\n\
        \ "]
  new_path : path_type option;
      [@ocaml.doc
        "New path for the IAM user. Include this parameter only if you're changing the user's \
         path.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "Name of the user to update. If you're changing the name of the user, this is the original \
         user name.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec entity_temporarily_unmodifiable_exception = {
  message : entity_temporarily_unmodifiable_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because it referenced an entity that is temporarily unmodifiable, such \
   as a user name that was deleted and then recreated. The error indicates that the request is \
   likely to succeed if you try again after waiting several minutes. The error message describes \
   the entity.\n"]

type nonrec update_signing_certificate_request = {
  status : status_type;
      [@ocaml.doc
        " The status you want to assign to the certificate. [Active] means that the certificate \
         can be used for programmatic calls to Amazon Web Services [Inactive] means that the \
         certificate cannot be used.\n"]
  certificate_id : certificate_id_type;
      [@ocaml.doc
        "The ID of the signing certificate you want to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the IAM user the signing certificate belongs to.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_service_specific_credential_request = {
  status : status_type;
      [@ocaml.doc "The status to be assigned to the service-specific credential.\n"]
  service_specific_credential_id : service_specific_credential_id;
      [@ocaml.doc
        "The unique identifier of the service-specific credential.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the IAM user associated with the service-specific credential. If you do not \
         specify this value, then the operation assumes the user whose credentials are used to \
         call the operation.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_server_certificate_request = {
  new_server_certificate_name : server_certificate_name_type option;
      [@ocaml.doc
        "The new name for the server certificate. Include this only if you are updating the server \
         certificate's name. The name of the certificate cannot contain any spaces.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  new_path : path_type option;
      [@ocaml.doc
        "The new path for the server certificate. Include this only if you are updating the server \
         certificate's path.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name of the server certificate that you want to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_ssh_public_key_request = {
  status : status_type;
      [@ocaml.doc
        "The status to assign to the SSH public key. [Active] means that the key can be used for \
         authentication with an CodeCommit repository. [Inactive] means that the key cannot be \
         used.\n"]
  ssh_public_key_id : public_key_id_type;
      [@ocaml.doc
        "The unique identifier for the SSH public key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the IAM user associated with the SSH public key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_saml_provider_response = {
  saml_provider_arn : arn_type option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the SAML provider that was updated.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateSAMLProvider.html}UpdateSAMLProvider} \
   request. \n"]

type nonrec saml_metadata_document_type = string [@@ocaml.doc ""]

type nonrec update_saml_provider_request = {
  remove_private_key : private_key_id_type option;
      [@ocaml.doc "The Key ID of the private key to remove.\n"]
  add_private_key : private_key_type option;
      [@ocaml.doc
        "Specifies the new private key from your external identity provider. The private key must \
         be a .pem file that uses AES-GCM or AES-CBC encryption algorithm to decrypt SAML \
         assertions.\n"]
  assertion_encryption_mode : assertion_encryption_mode_type option;
      [@ocaml.doc "Specifies the encryption setting for the SAML provider.\n"]
  saml_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SAML provider to update.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  saml_metadata_document : saml_metadata_document_type option;
      [@ocaml.doc
        "An XML document generated by an identity provider (IdP) that supports SAML 2.0. The \
         document includes the issuer's name, expiration information, and keys that can be used to \
         validate the SAML authentication response (assertions) that are received from the IdP. \
         You must generate the metadata document using the identity management software that is \
         used as your IdP.\n"]
}
[@@ocaml.doc ""]

type nonrec update_role_response = unit [@@ocaml.doc ""]

type nonrec update_role_request = {
  max_session_duration : role_max_session_duration_type option;
      [@ocaml.doc
        "The maximum session duration (in seconds) that you want to set for the specified role. If \
         you do not specify a value for this setting, the default value of one hour is applied. \
         This setting can have a value from 1 hour to 12 hours.\n\n\
        \ Anyone who assumes the role from the CLI or API can use the [DurationSeconds] API \
         parameter or the [duration-seconds] CLI parameter to request a longer session. The \
         [MaxSessionDuration] setting determines the maximum duration that can be requested using \
         the [DurationSeconds] parameter. If users don't specify a value for the [DurationSeconds] \
         parameter, their security credentials are valid for one hour by default. This applies \
         when you use the [AssumeRole*] API operations or the [assume-role*] CLI operations but \
         does not apply when you use those operations to create a console URL. For more \
         information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html}Using IAM roles} in \
         the {i IAM User Guide}.\n\
        \ \n\
        \   IAM role credentials provided by Amazon EC2 instances assigned to the role are not \
         subject to the specified maximum session duration.\n\
        \   \n\
        \    "]
  description : role_description_type option;
      [@ocaml.doc "The new description that you want to apply to the specified role.\n"]
  role_name : role_name_type; [@ocaml.doc "The name of the role that you want to modify.\n"]
}
[@@ocaml.doc ""]

type nonrec update_role_description_response = {
  role : role option; [@ocaml.doc "A structure that contains details about the modified role.\n"]
}
[@@ocaml.doc ""]

type nonrec update_role_description_request = {
  description : role_description_type;
      [@ocaml.doc "The new description that you want to apply to the specified role.\n"]
  role_name : role_name_type; [@ocaml.doc "The name of the role that you want to modify.\n"]
}
[@@ocaml.doc ""]

type nonrec unmodifiable_entity_exception = {
  message : unmodifiable_entity_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because service-linked roles are protected Amazon Web Services \
   resources. Only the service that depends on the service-linked role can modify or delete the \
   role on your behalf. The error message includes the name of the service that depends on this \
   service-linked role. You must request the change through that service.\n"]

type nonrec update_open_id_connect_provider_thumbprint_request = {
  thumbprint_list : thumbprint_list_type;
      [@ocaml.doc
        "A list of certificate thumbprints that are associated with the specified IAM OpenID \
         Connect provider. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider}. \n"]
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM OIDC provider resource object for which you \
         want to update the thumbprint. You can get a list of OIDC provider ARNs by using the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html}ListOpenIDConnectProviders} \
         operation.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_login_profile_request = {
  password_reset_required : boolean_object_type option;
      [@ocaml.doc
        "Allows this new password to be used only once by requiring the specified IAM user to set \
         a new password on next sign-in.\n"]
  password : password_type option;
      [@ocaml.doc
        "The new password for the specified IAM user.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   However, the format can be further restricted by the account administrator by setting \
         a password policy on the Amazon Web Services account. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAccountPasswordPolicy.html}UpdateAccountPasswordPolicy}.\n\
        \   "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the user whose password you want to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec password_policy_violation_exception = {
  message : password_policy_violation_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the provided password did not meet the requirements imposed by \
   the account password policy.\n"]

type nonrec update_group_request = {
  new_group_name : group_name_type option;
      [@ocaml.doc
        "New name for the IAM group. Only include this if changing the group's name.\n\n\
        \ IAM user, group, role, and policy names must be unique within the account. Names are not \
         distinguished by case. For example, you cannot create resources named both \"MyResource\" \
         and \"myresource\".\n\
        \ "]
  new_path : path_type option;
      [@ocaml.doc
        "New path for the IAM group. Only include this if changing the group's path.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "Name of the IAM group to update. If you're changing the name of the group, this is the \
         original name.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_delegation_request_request = {
  notes : notes_type option;
      [@ocaml.doc "Additional notes or comments to add to the delegation request.\n"]
  delegation_request_id : delegation_request_id_type;
      [@ocaml.doc "The unique identifier of the delegation request to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_assume_role_policy_request = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy that grants an entity permission to assume the role.\n\n\
        \ You must provide policies in JSON format in IAM. However, for CloudFormation templates \
         formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation \
         always converts a YAML policy to JSON format before submitting it to IAM.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to update with the new policy.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec malformed_policy_document_exception = {
  message : malformed_policy_document_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the policy document was malformed. The error message describes \
   the specific error.\n"]

type nonrec update_account_password_policy_request = {
  hard_expiry : boolean_object_type option;
      [@ocaml.doc
        " Prevents IAM users who are accessing the account via the Amazon Web Services Management \
         Console from setting a new console password after their password has expired. The IAM \
         user cannot access the console until an administrator resets the password.\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [false]. The result is that IAM users can change their passwords after they \
         expire and continue to sign in as the user.\n\
        \ \n\
        \    In the Amazon Web Services Management Console, the custom password policy option {b \
         Allow users to change their own password} gives IAM users permissions to \
         [iam:ChangePassword] for only their user and to the [iam:GetAccountPasswordPolicy] \
         action. This option does not attach a permissions policy to each user, rather the \
         permissions are applied at the account-level for all users by IAM. IAM users with \
         [iam:ChangePassword] permission and active access keys can reset their own expired \
         console password using the CLI or API.\n\
        \   \n\
        \    "]
  password_reuse_prevention : password_reuse_prevention_type option;
      [@ocaml.doc
        "Specifies the number of previous passwords that IAM users are prevented from reusing.\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [0]. The result is that IAM users are not prevented from reusing previous \
         passwords.\n\
        \ "]
  max_password_age : max_password_age_type option;
      [@ocaml.doc
        "The number of days that an IAM user password is valid.\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [0]. The result is that IAM user passwords never expire.\n\
        \ "]
  allow_users_to_change_password : boolean_type option;
      [@ocaml.doc
        " Allows all IAM users in your account to use the Amazon Web Services Management Console \
         to change their own passwords. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_enable-user-change.html}Permitting \
         IAM users to change their own passwords} in the {i IAM User Guide}.\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [false]. The result is that IAM users in the account do not automatically have \
         permissions to change their own password.\n\
        \ "]
  require_lowercase_characters : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one lowercase character from \
         the ISO basic Latin alphabet (a to z).\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [false]. The result is that passwords do not require at least one lowercase \
         character.\n\
        \ "]
  require_uppercase_characters : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one uppercase character from \
         the ISO basic Latin alphabet (A to Z).\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [false]. The result is that passwords do not require at least one uppercase \
         character.\n\
        \ "]
  require_numbers : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one numeric character (0 to \
         9).\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [false]. The result is that passwords do not require at least one numeric \
         character.\n\
        \ "]
  require_symbols : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one of the following \
         non-alphanumeric characters:\n\n\
        \ ! \\@ # $ % ^ & * ( ) _ + - = \\[ \\] \\{ \\} | '\n\
        \ \n\
        \  If you do not specify a value for this parameter, then the operation uses the default \
         value of [false]. The result is that passwords do not require at least one symbol \
         character.\n\
        \  "]
  minimum_password_length : minimum_password_length_type option;
      [@ocaml.doc
        "The minimum number of characters allowed in an IAM user password.\n\n\
        \ If you do not specify a value for this parameter, then the operation uses the default \
         value of [6].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_access_key_request = {
  status : status_type;
      [@ocaml.doc
        " The status you want to assign to the secret access key. [Active] means that the key can \
         be used for programmatic calls to Amazon Web Services, while [Inactive] means that the \
         key cannot be used.\n"]
  access_key_id : access_key_id_type;
      [@ocaml.doc
        "The access key ID of the secret access key you want to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user whose key you want to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_user_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified user.\n"]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the IAM user from which you want to remove tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_server_certificate_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified IAM server certificate.\n"]
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name of the IAM server certificate from which you want to remove tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_saml_provider_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified SAML identity provider.\n"]
  saml_provider_arn : arn_type;
      [@ocaml.doc
        "The ARN of the SAML identity provider in IAM from which you want to remove tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_role_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified role.\n"]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the IAM role from which you want to remove tags.\n\n\
        \ This parameter accepts (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that consist of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_policy_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified policy.\n"]
  policy_arn : arn_type;
      [@ocaml.doc
        "The ARN of the IAM customer managed policy from which you want to remove tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_open_id_connect_provider_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified OIDC provider.\n"]
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The ARN of the OIDC provider in IAM from which you want to remove tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_mfa_device_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified instance profile.\n"]
  serial_number : serial_number_type;
      [@ocaml.doc
        "The unique identifier for the IAM virtual MFA device from which you want to remove tags. \
         For virtual MFA devices, the serial number is the same as the ARN.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_instance_profile_request = {
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of key names as a simple array of strings. The tags with matching keys are removed \
         from the specified instance profile.\n"]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the IAM instance profile from which you want to remove tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tracked_action_last_accessed = {
  last_accessed_region : string_type option;
      [@ocaml.doc
        "The Region from which the authenticated entity (user or role) last attempted to access \
         the tracked action. Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no IAM entities attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  last_accessed_time : date_type option;
      [@ocaml.doc
        "The date and time, in\194\160{{:http://www.iso.org/iso/iso8601}ISO 8601 date-time \
         format}, when an authenticated entity most recently attempted to access the tracked \
         service. Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no IAM entities attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  last_accessed_entity : arn_type option; [@ocaml.doc ""]
  action_name : string_type option;
      [@ocaml.doc
        "The name of the tracked action to which access was attempted. Tracked actions are actions \
         that report activity to IAM.\n"]
}
[@@ocaml.doc
  "Contains details about the most recent attempt to access an action within the service.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html}GetServiceLastAccessedDetails} \
   operation.\n\
  \ "]

type nonrec tracked_actions_last_accessed = tracked_action_last_accessed list [@@ocaml.doc ""]

type nonrec tag_user_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the IAM user. Each tag consists of a key name \
         and an associated value.\n"]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the IAM user to which you want to add tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_server_certificate_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the IAM server certificate. Each tag consists \
         of a key name and an associated value.\n"]
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name of the IAM server certificate to which you want to add tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_saml_provider_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the SAML identity provider in IAM. Each tag \
         consists of a key name and an associated value.\n"]
  saml_provider_arn : arn_type;
      [@ocaml.doc
        "The ARN of the SAML identity provider in IAM to which you want to add tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_role_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the IAM role. Each tag consists of a key name \
         and an associated value.\n"]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the IAM role to which you want to add tags.\n\n\
        \ This parameter accepts (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that consist of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_policy_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the IAM customer managed policy. Each tag \
         consists of a key name and an associated value.\n"]
  policy_arn : arn_type;
      [@ocaml.doc
        "The ARN of the IAM customer managed policy to which you want to add tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_open_id_connect_provider_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the OIDC identity provider in IAM. Each tag \
         consists of a key name and an associated value.\n"]
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The ARN of the OIDC identity provider in IAM to which you want to add tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_mfa_device_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the IAM virtual MFA device. Each tag consists \
         of a key name and an associated value.\n"]
  serial_number : serial_number_type;
      [@ocaml.doc
        "The unique identifier for the IAM virtual MFA device to which you want to add tags. For \
         virtual MFA devices, the serial number is the same as the ARN.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_instance_profile_request = {
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that you want to attach to the IAM instance profile. Each tag consists \
         of a key name and an associated value.\n"]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the IAM instance profile to which you want to add tags.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec policy_identifier_type = string [@@ocaml.doc ""]

type nonrec policy_source_type =
  | NONE [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
  | USER_MANAGED [@ocaml.doc ""]
  | AWS_MANAGED [@ocaml.doc ""]
  | ROLE [@ocaml.doc ""]
  | GROUP [@ocaml.doc ""]
  | USER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec line_number = int [@@ocaml.doc ""]

type nonrec column_number = int [@@ocaml.doc ""]

type nonrec position = {
  column : column_number option;
      [@ocaml.doc "The column in the line containing the specified position in the document.\n"]
  line : line_number option;
      [@ocaml.doc "The line containing the specified position in the document.\n"]
}
[@@ocaml.doc
  "Contains the row and column of a location of a [Statement] element in a policy document.\n\n\
  \ This data type is used as a member of the \n\
  \ {[\n\
  \  {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_Statement.html}Statement} \n\
  \ ]}\n\
  \  type.\n\
  \ "]

type nonrec statement = {
  end_position : position option;
      [@ocaml.doc "The row and column of the end of a [Statement] in an IAM policy.\n"]
  start_position : position option;
      [@ocaml.doc "The row and column of the beginning of the [Statement] in an IAM policy.\n"]
  source_policy_type : policy_source_type option; [@ocaml.doc "The type of the policy.\n"]
  source_policy_id : policy_identifier_type option;
      [@ocaml.doc "The identifier of the policy that was provided as an input.\n"]
}
[@@ocaml.doc
  "Contains a reference to a [Statement] element in a policy document that determines the result \
   of the simulation.\n\n\
  \ This data type is used by the [MatchedStatements] member of the \n\
  \ {[\n\
  \  \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_EvaluationResult.html}EvaluationResult} \n\
  \ ]}\n\
  \  type.\n\
  \ "]

type nonrec statement_list_type = statement list [@@ocaml.doc ""]

type nonrec simulation_policy_list_type = policy_document_type list [@@ocaml.doc ""]

type nonrec action_name_type = string [@@ocaml.doc ""]

type nonrec action_name_list_type = action_name_type list [@@ocaml.doc ""]

type nonrec resource_name_type = string [@@ocaml.doc ""]

type nonrec resource_name_list_type = resource_name_type list [@@ocaml.doc ""]

type nonrec context_key_name_type = string [@@ocaml.doc ""]

type nonrec context_key_value_type = string [@@ocaml.doc ""]

type nonrec context_key_value_list_type = context_key_value_type list [@@ocaml.doc ""]

type nonrec context_key_type_enum =
  | DATE_LIST [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | BINARY_LIST [@ocaml.doc ""]
  | BINARY [@ocaml.doc ""]
  | IP_LIST [@ocaml.doc ""]
  | IP [@ocaml.doc ""]
  | BOOLEAN_LIST [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | NUMERIC_LIST [@ocaml.doc ""]
  | NUMERIC [@ocaml.doc ""]
  | STRING_LIST [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec context_entry = {
  context_key_type : context_key_type_enum option;
      [@ocaml.doc
        "The data type of the value (or values) specified in the [ContextKeyValues] parameter.\n"]
  context_key_values : context_key_value_list_type option;
      [@ocaml.doc
        "The value (or values, if the condition context key supports multiple values) to provide \
         to the simulation when the key is referenced by a [Condition] element in an input policy.\n"]
  context_key_name : context_key_name_type option;
      [@ocaml.doc
        "The full name of a condition context key, including the service prefix. For example, \
         [aws:SourceIp] or [s3:VersionId].\n"]
}
[@@ocaml.doc
  "Contains information about a condition context key. It includes the name of the key and \
   specifies the value (or values, if the context key supports multiple values) to use in the \
   simulation. This information is used when evaluating the [Condition] elements of the input \
   policies.\n\n\
  \ This data type is used as an input parameter to \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html}SimulateCustomPolicy} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html}SimulatePrincipalPolicy}.\n\
  \ "]

type nonrec context_entry_list_type = context_entry list [@@ocaml.doc ""]

type nonrec resource_handling_option_type = string [@@ocaml.doc ""]

type nonrec simulate_principal_policy_request = {
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  resource_handling_option : resource_handling_option_type option;
      [@ocaml.doc
        "Specifies the type of simulation to run. Different API operations that support \
         resource-based policies require different combinations of resources. By specifying the \
         type of simulation to run, you enable the policy simulator to enforce the presence of the \
         required resources to ensure reliable simulation results. If your simulation does not \
         match one of the following scenarios, then you can omit this parameter. The following \
         list shows each of the supported scenario values and the resources that you must define \
         to run the simulation.\n\n\
        \ Each of the Amazon EC2 scenarios requires that you specify instance, image, and security \
         group resources. If your scenario includes an EBS volume, then you must specify that \
         volume as a resource. If the Amazon EC2 scenario includes VPC, then you must supply the \
         network interface resource. If it includes an IP subnet, then you must specify the subnet \
         resource. For more information on the Amazon EC2 scenario options, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html}Supported \
         platforms} in the {i Amazon EC2 User Guide}.\n\
        \ \n\
        \  {ul\n\
        \        {-   {b EC2-VPC-InstanceStore} \n\
        \            \n\
        \             instance, image, security group, network interface\n\
        \             \n\
        \              }\n\
        \        {-   {b EC2-VPC-InstanceStore-Subnet} \n\
        \            \n\
        \             instance, image, security group, network interface, subnet\n\
        \             \n\
        \              }\n\
        \        {-   {b EC2-VPC-EBS} \n\
        \            \n\
        \             instance, image, security group, network interface, volume\n\
        \             \n\
        \              }\n\
        \        {-   {b EC2-VPC-EBS-Subnet} \n\
        \            \n\
        \             instance, image, security group, network interface, subnet, volume\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  context_entries : context_entry_list_type option;
      [@ocaml.doc
        "A list of context keys and corresponding values for the simulation to use. Whenever a \
         context key is evaluated in one of the simulated IAM permissions policies, the \
         corresponding value is supplied.\n"]
  caller_arn : resource_name_type option;
      [@ocaml.doc
        "The ARN of the IAM user that you want to specify as the simulated caller of the API \
         operations. If you do not specify a [CallerArn], it defaults to the ARN of the user that \
         you specify in [PolicySourceArn], if you specified a user. If you include both a \
         [PolicySourceArn] (for example, [arn:aws:iam::123456789012:user/David]) and a [CallerArn] \
         (for example, [arn:aws:iam::123456789012:user/Bob]), the result is that you simulate \
         calling the API operations as Bob, as if Bob had David's policies.\n\n\
        \ You can specify only the ARN of an IAM user. You cannot specify the ARN of an assumed \
         role, federated user, or a service principal.\n\
        \ \n\
        \   [CallerArn] is required if you include a [ResourcePolicy] and the [PolicySourceArn] is \
         not the ARN for an IAM user. This is required so that the resource-based policy's \
         [Principal] element has a value to use in evaluating the policy.\n\
        \  \n\
        \   For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \   "]
  resource_owner : resource_name_type option;
      [@ocaml.doc
        "An Amazon Web Services account ID that specifies the owner of any simulated resource that \
         does not identify its owner in the resource ARN. Examples of resource ARNs include an S3 \
         bucket or object. If [ResourceOwner] is specified, it is also used as the account owner \
         of any [ResourcePolicy] included in the simulation. If the [ResourceOwner] parameter is \
         not specified, then the owner of the resources and the resource policy defaults to the \
         account of the identity provided in [CallerArn]. This parameter is required only if you \
         specify a resource-based policy and account that owns the resource is different from the \
         account that owns the simulated calling user [CallerArn].\n"]
  resource_policy : policy_document_type option;
      [@ocaml.doc
        "A resource-based policy to include in the simulation provided as a string. Each resource \
         in the simulation is treated as if it had this policy attached. You can include only one \
         resource-based policy in a simulation.\n\n\
        \ The maximum length of the policy document that you can pass in this operation, including \
         whitespace, is listed below. To view the maximum character counts of a managed policy \
         with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \    Simulation of resource-based policies isn't supported for IAM roles.\n\
        \    \n\
        \     "]
  resource_arns : resource_name_list_type option;
      [@ocaml.doc
        "A list of ARNs of Amazon Web Services resources to include in the simulation. If this \
         parameter is not provided, then the value defaults to [*] (all resources). Each API in \
         the [ActionNames] parameter is evaluated for each resource in this list. The simulation \
         determines the access result (allowed or denied) of each combination and reports it in \
         the response. You can simulate resources that don't exist in your account.\n\n\
        \ The simulation does not automatically retrieve policies for the specified resources. If \
         you want to include a resource policy in the simulation, then you must include the policy \
         as a string in the [ResourcePolicy] parameter.\n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \  \n\
        \    Simulation of resource-based policies isn't supported for IAM roles.\n\
        \    \n\
        \     "]
  action_names : action_name_list_type;
      [@ocaml.doc
        "A list of names of API operations to evaluate in the simulation. Each operation is \
         evaluated for each resource. Each operation must include the service identifier, such as \
         [iam:CreateUser].\n"]
  permissions_boundary_policy_input_list : simulation_policy_list_type option;
      [@ocaml.doc
        "The IAM permissions boundary policy to simulate. The permissions boundary sets the \
         maximum permissions that the entity can have. You can input only one permissions boundary \
         when you pass a policy to this operation. An IAM entity can only have one permissions \
         boundary in effect at a time. For example, if a permissions boundary is attached to an \
         entity and you pass in a different permissions boundary policy using this parameter, then \
         the new permissions boundary policy is used for the simulation. For more information \
         about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} in the {i IAM User Guide}. The policy input is specified as \
         a string containing the complete, valid JSON text of a permissions boundary policy.\n\n\
        \ The maximum length of the policy document that you can pass in this operation, including \
         whitespace, is listed below. To view the maximum character counts of a managed policy \
         with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  policy_input_list : simulation_policy_list_type option;
      [@ocaml.doc
        "An optional list of additional policy documents to include in the simulation. Each \
         document is specified as a string containing the complete, valid JSON text of an IAM \
         policy.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_source_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a user, group, or role whose policies you want to \
         include in the simulation. If you specify a user, group, or role, the simulation includes \
         all policies that are associated with that entity. If you specify a user, the simulation \
         also includes all policies that are attached to any groups the user belongs to.\n\n\
        \ The maximum length of the policy document that you can pass in this operation, including \
         whitespace, is listed below. To view the maximum character counts of a managed policy \
         with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \ \n\
        \  For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec policy_evaluation_exception = {
  message : policy_evaluation_error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because a provided policy could not be successfully evaluated. An additional \
   detailed message indicates the source of the failure.\n"]

type nonrec policy_evaluation_decision_type =
  | IMPLICIT_DENY [@ocaml.doc ""]
  | EXPLICIT_DENY [@ocaml.doc ""]
  | ALLOWED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec context_key_names_result_list_type = context_key_name_type list [@@ocaml.doc ""]

type nonrec organizations_decision_detail = {
  allowed_by_organizations : boolean_type option;
      [@ocaml.doc
        "Specifies whether the simulated operation is allowed by the Organizations service control \
         policies that impact the simulated user's account.\n"]
}
[@@ocaml.doc
  "Contains information about the effect that Organizations has on a policy simulation.\n"]

type nonrec permissions_boundary_decision_detail = {
  allowed_by_permissions_boundary : boolean_type option;
      [@ocaml.doc
        "Specifies whether an action is allowed by a permissions boundary that is applied to an \
         IAM entity (user or role). A value of [true] means that the permissions boundary does not \
         deny the action. This means that the policy includes an [Allow] statement that matches \
         the request. In this case, if an identity-based policy also allows the action, the \
         request is allowed. A value of [false] means that either the requested action is not \
         allowed (implicitly denied) or that the action is explicitly denied by the permissions \
         boundary. In both of these cases, the action is not allowed, regardless of the \
         identity-based policy.\n"]
}
[@@ocaml.doc
  "Contains information about the effect that a permissions boundary has on a policy simulation \
   when the boundary is applied to an IAM entity.\n"]

type nonrec eval_decision_source_type = string [@@ocaml.doc ""]

type nonrec eval_decision_details_type =
  (eval_decision_source_type * policy_evaluation_decision_type) list
[@@ocaml.doc ""]

type nonrec resource_specific_result = {
  permissions_boundary_decision_detail : permissions_boundary_decision_detail option;
      [@ocaml.doc
        "Contains information about the effect that a permissions boundary has on a policy \
         simulation when that boundary is applied to an IAM entity.\n"]
  eval_decision_details : eval_decision_details_type option;
      [@ocaml.doc
        "Additional details about the results of the evaluation decision on a single resource. \
         This parameter is returned only for cross-account simulations. This parameter explains \
         how each policy type contributes to the resource-specific evaluation decision.\n"]
  missing_context_values : context_key_names_result_list_type option;
      [@ocaml.doc
        "A list of context keys that are required by the included input policies but that were not \
         provided by one of the input parameters. This list is used when a list of ARNs is \
         included in the [ResourceArns] parameter instead of \"*\". If you do not specify \
         individual resources, by setting [ResourceArns] to \"*\" or by not including the \
         [ResourceArns] parameter, then any missing context values are instead included under the \
         [EvaluationResults] section. To discover the context keys used by a set of policies, you \
         can call \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html}GetContextKeysForCustomPolicy} \
         or \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html}GetContextKeysForPrincipalPolicy}.\n"]
  matched_statements : statement_list_type option;
      [@ocaml.doc
        "A list of the statements in the input policies that determine the result for this part of \
         the simulation. Remember that even if multiple statements allow the operation on the \
         resource, if {i any} statement denies that operation, then the explicit deny overrides \
         any allow. In addition, the deny statement is the only entry included in the result.\n"]
  eval_resource_decision : policy_evaluation_decision_type;
      [@ocaml.doc
        "The result of the simulation of the simulated API operation on the resource specified in \
         [EvalResourceName].\n"]
  eval_resource_name : resource_name_type;
      [@ocaml.doc "The name of the simulated resource, in Amazon Resource Name (ARN) format.\n"]
}
[@@ocaml.doc
  "Contains the result of the simulation of a single API operation call on a single resource.\n\n\
  \ This data type is used by a member of the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_EvaluationResult.html}EvaluationResult} \
   data type.\n\
  \ "]

type nonrec resource_specific_result_list_type = resource_specific_result list [@@ocaml.doc ""]

type nonrec evaluation_result = {
  resource_specific_results : resource_specific_result_list_type option;
      [@ocaml.doc
        "The individual results of the simulation of the API operation specified in EvalActionName \
         on each resource.\n"]
  eval_decision_details : eval_decision_details_type option;
      [@ocaml.doc
        "Additional details about the results of the cross-account evaluation decision. This \
         parameter is populated for only cross-account simulations. It contains a brief summary of \
         how each policy type contributes to the final evaluation decision.\n\n\
        \ If the simulation evaluates policies within the same account and includes a resource \
         ARN, then the parameter is present but the response is empty. If the simulation evaluates \
         policies within the same account and specifies all resources ([*]), then the parameter is \
         not returned.\n\
        \ \n\
        \  When you make a cross-account request, Amazon Web Services evaluates the request in the \
         trusting account and the trusted account. The request is allowed only if both evaluations \
         return [true]. For more information about how policies are evaluated, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics}Evaluating \
         policies within a single account}.\n\
        \  \n\
        \   If an Organizations SCP included in the evaluation denies access, the simulation ends. \
         In this case, policy evaluation does not proceed any further and this parameter is not \
         returned.\n\
        \   "]
  permissions_boundary_decision_detail : permissions_boundary_decision_detail option;
      [@ocaml.doc
        "Contains information about the effect that a permissions boundary has on a policy \
         simulation when the boundary is applied to an IAM entity.\n"]
  organizations_decision_detail : organizations_decision_detail option;
      [@ocaml.doc
        "A structure that details how Organizations and its service control policies affect the \
         results of the simulation. Only applies if the simulated user's account is part of an \
         organization.\n"]
  missing_context_values : context_key_names_result_list_type option;
      [@ocaml.doc
        "A list of context keys that are required by the included input policies but that were not \
         provided by one of the input parameters. This list is used when the resource in a \
         simulation is \"*\", either explicitly, or when the [ResourceArns] parameter blank. If \
         you include a list of resources, then any missing context values are instead included \
         under the [ResourceSpecificResults] section. To discover the context keys used by a set \
         of policies, you can call \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html}GetContextKeysForCustomPolicy} \
         or \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html}GetContextKeysForPrincipalPolicy}.\n"]
  matched_statements : statement_list_type option;
      [@ocaml.doc
        "A list of the statements in the input policies that determine the result for this \
         scenario. Remember that even if multiple statements allow the operation on the resource, \
         if only one statement denies that operation, then the explicit deny overrides any allow. \
         In addition, the deny statement is the only entry included in the result.\n"]
  eval_decision : policy_evaluation_decision_type; [@ocaml.doc "The result of the simulation.\n"]
  eval_resource_name : resource_name_type option;
      [@ocaml.doc "The ARN of the resource that the indicated API operation was tested on.\n"]
  eval_action_name : action_name_type;
      [@ocaml.doc "The name of the API operation tested on the indicated resource.\n"]
}
[@@ocaml.doc
  "Contains the results of a simulation.\n\n\
  \ This data type is used by the return parameter of \n\
  \ {[\n\
  \  \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html}SimulateCustomPolicy} \n\
  \ ]}\n\
  \  and \n\
  \ {[\n\
  \  \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html}SimulatePrincipalPolicy} \n\
  \ ]}\n\
  \ .\n\
  \ "]

type nonrec evaluation_results_list_type = evaluation_result list [@@ocaml.doc ""]

type nonrec simulate_policy_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  evaluation_results : evaluation_results_list_type option;
      [@ocaml.doc "The results of the simulation.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulatePrincipalPolicy.html}SimulatePrincipalPolicy} \
   or \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SimulateCustomPolicy.html}SimulateCustomPolicy} \
   request.\n"]

type nonrec simulate_custom_policy_request = {
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  resource_handling_option : resource_handling_option_type option;
      [@ocaml.doc
        "Specifies the type of simulation to run. Different API operations that support \
         resource-based policies require different combinations of resources. By specifying the \
         type of simulation to run, you enable the policy simulator to enforce the presence of the \
         required resources to ensure reliable simulation results. If your simulation does not \
         match one of the following scenarios, then you can omit this parameter. The following \
         list shows each of the supported scenario values and the resources that you must define \
         to run the simulation.\n\n\
        \ Each of the Amazon EC2 scenarios requires that you specify instance, image, and security \
         group resources. If your scenario includes an EBS volume, then you must specify that \
         volume as a resource. If the Amazon EC2 scenario includes VPC, then you must supply the \
         network interface resource. If it includes an IP subnet, then you must specify the subnet \
         resource. For more information on the Amazon EC2 scenario options, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html}Supported \
         platforms} in the {i Amazon EC2 User Guide}.\n\
        \ \n\
        \  {ul\n\
        \        {-   {b EC2-VPC-InstanceStore} \n\
        \            \n\
        \             instance, image, security group, network interface\n\
        \             \n\
        \              }\n\
        \        {-   {b EC2-VPC-InstanceStore-Subnet} \n\
        \            \n\
        \             instance, image, security group, network interface, subnet\n\
        \             \n\
        \              }\n\
        \        {-   {b EC2-VPC-EBS} \n\
        \            \n\
        \             instance, image, security group, network interface, volume\n\
        \             \n\
        \              }\n\
        \        {-   {b EC2-VPC-EBS-Subnet} \n\
        \            \n\
        \             instance, image, security group, network interface, subnet, volume\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  context_entries : context_entry_list_type option;
      [@ocaml.doc
        "A list of context keys and corresponding values for the simulation to use. Whenever a \
         context key is evaluated in one of the simulated IAM permissions policies, the \
         corresponding value is supplied.\n"]
  caller_arn : resource_name_type option;
      [@ocaml.doc
        "The ARN of the IAM user that you want to use as the simulated caller of the API \
         operations. [CallerArn] is required if you include a [ResourcePolicy] so that the \
         policy's [Principal] element has a value to use in evaluating the policy.\n\n\
        \ You can specify only the ARN of an IAM user. You cannot specify the ARN of an assumed \
         role, federated user, or a service principal.\n\
        \ "]
  resource_owner : resource_name_type option;
      [@ocaml.doc
        "An ARN representing the Amazon Web Services account ID that specifies the owner of any \
         simulated resource that does not identify its owner in the resource ARN. Examples of \
         resource ARNs include an S3 bucket or object. If [ResourceOwner] is specified, it is also \
         used as the account owner of any [ResourcePolicy] included in the simulation. If the \
         [ResourceOwner] parameter is not specified, then the owner of the resources and the \
         resource policy defaults to the account of the identity provided in [CallerArn]. This \
         parameter is required only if you specify a resource-based policy and account that owns \
         the resource is different from the account that owns the simulated calling user \
         [CallerArn].\n\n\
        \ The ARN for an account uses the following syntax: \n\
        \ {[\n\
        \ arn:aws:iam::{i AWS-account-ID}:root\n\
        \ ]}\n\
        \ . For example, to represent the account with the 112233445566 ID, use the following ARN: \
         [arn:aws:iam::112233445566-ID:root]. \n\
        \ "]
  resource_policy : policy_document_type option;
      [@ocaml.doc
        "A resource-based policy to include in the simulation provided as a string. Each resource \
         in the simulation is treated as if it had this policy attached. You can include only one \
         resource-based policy in a simulation.\n\n\
        \ The maximum length of the policy document that you can pass in this operation, including \
         whitespace, is listed below. To view the maximum character counts of a managed policy \
         with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \    Simulation of resource-based policies isn't supported for IAM roles.\n\
        \    \n\
        \     "]
  resource_arns : resource_name_list_type option;
      [@ocaml.doc
        "A list of ARNs of Amazon Web Services resources to include in the simulation. If this \
         parameter is not provided, then the value defaults to [*] (all resources). Each API in \
         the [ActionNames] parameter is evaluated for each resource in this list. The simulation \
         determines the access result (allowed or denied) of each combination and reports it in \
         the response. You can simulate resources that don't exist in your account.\n\n\
        \ The simulation does not automatically retrieve policies for the specified resources. If \
         you want to include a resource policy in the simulation, then you must include the policy \
         as a string in the [ResourcePolicy] parameter.\n\
        \ \n\
        \  If you include a [ResourcePolicy], then it must be applicable to all of the resources \
         included in the simulation or you receive an invalid input error.\n\
        \  \n\
        \   For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \   \n\
        \     Simulation of resource-based policies isn't supported for IAM roles.\n\
        \     \n\
        \      "]
  action_names : action_name_list_type;
      [@ocaml.doc
        "A list of names of API operations to evaluate in the simulation. Each operation is \
         evaluated against each resource. Each operation must include the service identifier, such \
         as [iam:CreateUser]. This operation does not support using wildcards (*) in an action \
         name.\n"]
  permissions_boundary_policy_input_list : simulation_policy_list_type option;
      [@ocaml.doc
        "The IAM permissions boundary policy to simulate. The permissions boundary sets the \
         maximum permissions that an IAM entity can have. You can input only one permissions \
         boundary when you pass a policy to this operation. For more information about permissions \
         boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} in the {i IAM User Guide}. The policy input is specified as \
         a string that contains the complete, valid JSON text of a permissions boundary policy.\n\n\
        \ The maximum length of the policy document that you can pass in this operation, including \
         whitespace, is listed below. To view the maximum character counts of a managed policy \
         with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  policy_input_list : simulation_policy_list_type;
      [@ocaml.doc
        "A list of policy documents to include in the simulation. Each document is specified as a \
         string containing the complete, valid JSON text of an IAM policy. Do not include any \
         resource-based policies in this parameter. Any resource-based policy must be submitted \
         with the [ResourcePolicy] parameter. The policies cannot be \"scope-down\" policies, such \
         as you could include in a call to \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetFederationToken.html}GetFederationToken} \
         or one of the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_AssumeRole.html}AssumeRole} \
         API operations. In other words, do not use policies designed to restrict what a user can \
         do while using the temporary credentials.\n\n\
        \ The maximum length of the policy document that you can pass in this operation, including \
         whitespace, is listed below. To view the maximum character counts of a managed policy \
         with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec set_security_token_service_preferences_request = {
  global_endpoint_token_version : global_endpoint_token_version;
      [@ocaml.doc
        "The version of the global endpoint token. Version 1 tokens are valid only in Amazon Web \
         Services Regions that are available by default. These tokens do not work in manually \
         enabled Regions, such as Asia Pacific (Hong Kong). Version 2 tokens are valid in all \
         Regions. However, version 2 tokens are longer and might affect systems where you \
         temporarily store tokens.\n\n\
        \ For information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html}Activating \
         and deactivating STS in an Amazon Web Services Region} in the {i IAM User Guide}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec set_default_policy_version_request = {
  version_id : policy_version_id_type;
      [@ocaml.doc
        "The version of the policy to set as the default (operative) version.\n\n\
        \ For more information about managed policy versions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
         for managed policies} in the {i IAM User Guide}.\n\
        \ "]
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy whose default version you want to set.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec service_last_accessed = {
  tracked_actions_last_accessed : tracked_actions_last_accessed option;
      [@ocaml.doc
        "An object that contains details about the most recent attempt to access a tracked action \
         within the service.\n\n\
        \ This field is null if there no tracked actions or if the principal did not use the \
         tracked actions within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}. This field is also null if the report was generated at the service level and not \
         the action level. For more information, see the [Granularity] field in \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateServiceLastAccessedDetails.html}GenerateServiceLastAccessedDetails}.\n\
        \ "]
  total_authenticated_entities : integer_type option;
      [@ocaml.doc
        "The total number of authenticated principals (root user, IAM users, or IAM roles) that \
         have attempted to access the service.\n\n\
        \ This field is null if no principals attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  last_authenticated_region : string_type option;
      [@ocaml.doc
        "The Region from which the authenticated entity (user or role) last attempted to access \
         the service. Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no IAM entities attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  last_authenticated_entity : arn_type option;
      [@ocaml.doc
        "The ARN of the authenticated entity (user or role) that last attempted to access the \
         service. Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no IAM entities attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  service_namespace : service_namespace_type;
      [@ocaml.doc
        "The namespace of the service in which access was attempted.\n\n\
        \ To learn the service namespace of a service, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html}Actions, \
         resources, and condition keys for Amazon Web Services services} in the {i Service \
         Authorization Reference}. Choose the name of the service to view details for that \
         service. In the first paragraph, find the service prefix. For example, [(service prefix: \
         a4b)]. For more information about service namespaces, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon \
         Web Services Service Namespaces} in the\194\160{i Amazon Web Services General Reference}.\n\
        \ "]
  last_authenticated : date_type option;
      [@ocaml.doc
        "The date and time, in\194\160{{:http://www.iso.org/iso/iso8601}ISO 8601 date-time \
         format}, when an authenticated entity most recently attempted to access the service. \
         Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no IAM entities attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  service_name : service_name_type;
      [@ocaml.doc "The name of the service in which access was attempted.\n"]
}
[@@ocaml.doc
  "Contains details about the most recent attempt to access the service.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html}GetServiceLastAccessedDetails} \
   operation.\n\
  \ "]

type nonrec services_last_accessed = service_last_accessed list [@@ocaml.doc ""]

type nonrec service_specific_credential_metadata = {
  service_name : service_name;
      [@ocaml.doc "The name of the service associated with the service-specific credential.\n"]
  service_specific_credential_id : service_specific_credential_id;
      [@ocaml.doc "The unique identifier for the service-specific credential.\n"]
  expiration_date : date_type option;
      [@ocaml.doc
        "The date and time when the service specific credential expires. This field is only \
         present for Bedrock API keys and CloudWatch Logs API keys that were created with an \
         expiration period.\n"]
  create_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the service-specific credential were created.\n"]
  service_credential_alias : service_credential_alias option;
      [@ocaml.doc
        "For Bedrock API keys and CloudWatch Logs API keys, this is the public portion of the \
         credential that includes the IAM user name and a suffix containing version and creation \
         information.\n"]
  service_user_name : service_user_name option;
      [@ocaml.doc "The generated user name for the service-specific credential.\n"]
  status : status_type;
      [@ocaml.doc
        "The status of the service-specific credential. [Active] means that the key is valid for \
         API calls, while [Inactive] means it is not.\n"]
  user_name : user_name_type;
      [@ocaml.doc "The name of the IAM user associated with the service-specific credential.\n"]
}
[@@ocaml.doc "Contains additional details about a service-specific credential.\n"]

type nonrec service_specific_credentials_list_type = service_specific_credential_metadata list
[@@ocaml.doc ""]

type nonrec service_specific_credential = {
  status : status_type;
      [@ocaml.doc
        "The status of the service-specific credential. [Active] means that the key is valid for \
         API calls, while [Inactive] means it is not.\n"]
  user_name : user_name_type;
      [@ocaml.doc "The name of the IAM user associated with the service-specific credential.\n"]
  service_specific_credential_id : service_specific_credential_id;
      [@ocaml.doc "The unique identifier for the service-specific credential.\n"]
  service_credential_secret : service_credential_secret option;
      [@ocaml.doc
        "For Bedrock API keys and CloudWatch Logs API keys, this is the secret portion of the \
         credential that should be used to authenticate API calls. This value is returned only \
         when the credential is created.\n"]
  service_credential_alias : service_credential_alias option;
      [@ocaml.doc
        "For Bedrock API keys and CloudWatch Logs API keys, this is the public portion of the \
         credential that includes the IAM user name and a suffix containing version and creation \
         information.\n"]
  service_password : service_password option;
      [@ocaml.doc "The generated password for the service-specific credential.\n"]
  service_user_name : service_user_name option;
      [@ocaml.doc
        "The generated user name for the service-specific credential. This value is generated by \
         combining the IAM user's name combined with the ID number of the Amazon Web Services \
         account, as in [jane-at-123456789012], for example. This value cannot be configured by \
         the user.\n"]
  service_name : service_name;
      [@ocaml.doc "The name of the service associated with the service-specific credential.\n"]
  expiration_date : date_type option;
      [@ocaml.doc
        "The date and time when the service specific credential expires. This field is only \
         present for Bedrock API keys and CloudWatch Logs API keys that were created with an \
         expiration period.\n"]
  create_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the service-specific credential were created.\n"]
}
[@@ocaml.doc "Contains the details of a service-specific credential.\n"]

type nonrec service_not_supported_exception = {
  message : service_not_supported_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified service does not support service-specific credentials.\n"]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec service_access_not_enabled_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because trusted access is not enabled for IAM in Organizations. For \
   details, see IAM and Organizations in the {i Organizations User Guide}.\n"]

type nonrec server_certificate = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the server certificate. For more information about \
         tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n"]
  certificate_chain : certificate_chain_type option;
      [@ocaml.doc "The contents of the public key certificate chain.\n"]
  certificate_body : certificate_body_type;
      [@ocaml.doc "The contents of the public key certificate.\n"]
  server_certificate_metadata : server_certificate_metadata;
      [@ocaml.doc
        "The meta information of the server certificate, such as its name, path, ID, and ARN.\n"]
}
[@@ocaml.doc
  "Contains information about a server certificate.\n\n\
  \  This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServerCertificate.html}GetServerCertificate} \
   operation. \n\
  \ "]

type nonrec send_delegation_token_request = {
  delegation_request_id : delegation_request_id_type;
      [@ocaml.doc "The unique identifier of the delegation request for which to send the token.\n"]
}
[@@ocaml.doc ""]

type nonrec ssh_public_key_metadata = {
  upload_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the SSH public key was uploaded.\n"]
  status : status_type;
      [@ocaml.doc
        "The status of the SSH public key. [Active] means that the key can be used for \
         authentication with an CodeCommit repository. [Inactive] means that the key cannot be \
         used.\n"]
  ssh_public_key_id : public_key_id_type;
      [@ocaml.doc "The unique identifier for the SSH public key.\n"]
  user_name : user_name_type;
      [@ocaml.doc "The name of the IAM user associated with the SSH public key.\n"]
}
[@@ocaml.doc
  "Contains information about an SSH public key, without the key's body or fingerprint.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSSHPublicKeys.html}ListSSHPublicKeys} \
   operation.\n\
  \ "]

type nonrec ssh_public_key_list_type = ssh_public_key_metadata list [@@ocaml.doc ""]

type nonrec saml_provider_name_type = string [@@ocaml.doc ""]

type nonrec saml_provider_list_entry = {
  create_date : date_type option;
      [@ocaml.doc "The date and time when the SAML provider was created.\n"]
  valid_until : date_type option;
      [@ocaml.doc "The expiration date and time for the SAML provider.\n"]
  arn : arn_type option; [@ocaml.doc "The Amazon Resource Name (ARN) of the SAML provider.\n"]
}
[@@ocaml.doc "Contains the list of SAML providers for this account.\n"]

type nonrec saml_provider_list_type = saml_provider_list_entry list [@@ocaml.doc ""]

type nonrec region_name_type = string [@@ocaml.doc ""]

type nonrec arn_list_type = arn_type list [@@ocaml.doc ""]

type nonrec role_usage_type = {
  resources : arn_list_type option;
      [@ocaml.doc "The name of the resource that is using the service-linked role.\n"]
  region : region_name_type option;
      [@ocaml.doc "The name of the Region where the service-linked role is being used.\n"]
}
[@@ocaml.doc
  "An object that contains details about how a service-linked role is used, if that information is \
   returned by the service.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLinkedRoleDeletionStatus.html}GetServiceLinkedRoleDeletionStatus} \
   operation.\n\
  \ "]

type nonrec role_usage_list_type = role_usage_type list [@@ocaml.doc ""]

type nonrec resync_mfa_device_request = {
  authentication_code2 : authentication_code_type;
      [@ocaml.doc
        "A subsequent authentication code emitted by the device.\n\n\
        \ The format for this parameter is a sequence of six digits.\n\
        \ "]
  authentication_code1 : authentication_code_type;
      [@ocaml.doc
        "An authentication code emitted by the device.\n\n\
        \ The format for this parameter is a sequence of six digits.\n\
        \ "]
  serial_number : serial_number_type;
      [@ocaml.doc
        "Serial number that uniquely identifies the MFA device.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user whose MFA device you want to resynchronize.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_authentication_code_exception = {
  message : invalid_authentication_code_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the authentication code was not recognized. The error message \
   describes the specific error.\n"]

type nonrec reset_service_specific_credential_response = {
  service_specific_credential : service_specific_credential option;
      [@ocaml.doc
        "A structure with details about the updated service-specific credential, including the new \
         password.\n\n\
        \  This is the {b only} time that you can access the password. You cannot recover the \
         password later, but you can reset it again.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec reset_service_specific_credential_request = {
  service_specific_credential_id : service_specific_credential_id;
      [@ocaml.doc
        "The unique identifier of the service-specific credential.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the IAM user associated with the service-specific credential. If this value \
         is not specified, then the operation assumes the user whose credentials are used to call \
         the operation.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec report_state_type =
  | COMPLETE [@ocaml.doc ""]
  | INPROGRESS [@ocaml.doc ""]
  | STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_state_description_type = string [@@ocaml.doc ""]

type nonrec report_generation_limit_exceeded_exception = {
  message : report_generation_limit_exceeded_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because the maximum number of concurrent requests for this account are \
   already running.\n"]

type nonrec report_format_type = Text_csv [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec report_content_type = bytes [@@ocaml.doc ""]

type nonrec remove_user_from_group_request = {
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user to remove.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec remove_role_from_instance_profile_request = {
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to remove.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the instance profile to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec remove_client_id_from_open_id_connect_provider_request = {
  client_i_d : client_id_type;
      [@ocaml.doc
        "The client ID (also known as audience) to remove from the IAM OIDC provider resource. For \
         more information about client IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider}.\n"]
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM OIDC provider resource to remove the client ID \
         from. You can get a list of OIDC provider ARNs by using the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html}ListOpenIDConnectProviders} \
         operation.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec reject_delegation_request_request = {
  notes : notes_type option;
      [@ocaml.doc "Optional notes explaining the reason for rejecting the delegation request.\n"]
  delegation_request_id : delegation_request_id_type;
      [@ocaml.doc "The unique identifier of the delegation request to reject.\n"]
}
[@@ocaml.doc ""]

type nonrec reason_type = string [@@ocaml.doc ""]

type nonrec put_user_policy_request = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy document.\n\n\
        \ You must provide policies in JSON format in IAM. However, for CloudFormation templates \
         formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation \
         always converts a YAML policy to JSON format before submitting it to IAM.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the policy document.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user to associate the policy with.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec put_user_permissions_boundary_request = {
  permissions_boundary : arn_type;
      [@ocaml.doc
        "The ARN of the managed policy that is used to set the permissions boundary for the user.\n\n\
        \ A permissions boundary policy defines the maximum permissions that identity-based \
         policies can grant to an entity, but does not grant permissions. Permissions boundaries \
         do not define the maximum permissions that a resource-based policy can grant to an \
         entity. To learn more, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} in the {i IAM User Guide}.\n\
        \ \n\
        \  For more information about policy types, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types}Policy \
         types } in the {i IAM User Guide}.\n\
        \  "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM user for which you want to set the \
         permissions boundary.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_not_attachable_exception = {
  message : policy_not_attachable_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because Amazon Web Services service role policies can only be attached to \
   the service-linked role for that service.\n"]

type nonrec put_role_policy_request = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy document.\n\n\
        \ You must provide policies in JSON format in IAM. However, for CloudFormation templates \
         formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation \
         always converts a YAML policy to JSON format before submitting it to IAM.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the policy document.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to associate the policy with.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec put_role_permissions_boundary_request = {
  permissions_boundary : arn_type;
      [@ocaml.doc
        "The ARN of the managed policy that is used to set the permissions boundary for the role.\n\n\
        \ A permissions boundary policy defines the maximum permissions that identity-based \
         policies can grant to an entity, but does not grant permissions. Permissions boundaries \
         do not define the maximum permissions that a resource-based policy can grant to an \
         entity. To learn more, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} in the {i IAM User Guide}.\n\
        \ \n\
        \  For more information about policy types, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types}Policy \
         types } in the {i IAM User Guide}.\n\
        \  "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM role for which you want to set the \
         permissions boundary.\n"]
}
[@@ocaml.doc ""]

type nonrec put_group_policy_request = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy document.\n\n\
        \ You must provide policies in JSON format in IAM. However, for CloudFormation templates \
         formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation \
         always converts a YAML policy to JSON format before submitting it to IAM.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the policy document.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group to associate the policy with.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec policy_user = {
  user_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the user. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  user_name : user_name_type option;
      [@ocaml.doc "The name (friendly name, not ARN) identifying the user.\n"]
}
[@@ocaml.doc
  "Contains information about a user that a managed policy is attached to.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy} \
   operation. \n\
  \ \n\
  \  For more information about managed policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec policy_user_list_type = policy_user list [@@ocaml.doc ""]

type nonrec policy_usage_type =
  | PermissionsBoundary [@ocaml.doc ""]
  | PermissionsPolicy [@ocaml.doc ""]
[@@ocaml.doc
  "The policy usage type that indicates whether the policy is used as a permissions policy or as \
   the permissions boundary for an entity.\n\n\
  \ For more information about permissions boundaries, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
   boundaries for IAM identities } in the {i IAM User Guide}.\n\
  \ "]

type nonrec policy_role = {
  role_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the role. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  role_name : role_name_type option;
      [@ocaml.doc "The name (friendly name, not ARN) identifying the role.\n"]
}
[@@ocaml.doc
  "Contains information about a role that a managed policy is attached to.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy} \
   operation. \n\
  \ \n\
  \  For more information about managed policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec policy_role_list_type = policy_role list [@@ocaml.doc ""]

type nonrec policy_group = {
  group_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the group. For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n"]
  group_name : group_name_type option;
      [@ocaml.doc "The name (friendly name, not ARN) identifying the group.\n"]
}
[@@ocaml.doc
  "Contains information about a group that a managed policy is attached to.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy} \
   operation. \n\
  \ \n\
  \  For more information about managed policies, refer to \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec policy_group_list_type = policy_group list [@@ocaml.doc ""]

type nonrec password_policy = {
  hard_expiry : boolean_object_type option;
      [@ocaml.doc
        "Specifies whether IAM users are prevented from setting a new password via the Amazon Web \
         Services Management Console after their password has expired. The IAM user cannot access \
         the console until an administrator resets the password. IAM users with \
         [iam:ChangePassword] permission and active access keys can reset their own expired \
         console password using the CLI or API.\n"]
  password_reuse_prevention : password_reuse_prevention_type option;
      [@ocaml.doc
        "Specifies the number of previous passwords that IAM users are prevented from reusing.\n"]
  max_password_age : max_password_age_type option;
      [@ocaml.doc "The number of days that an IAM user password is valid.\n"]
  expire_passwords : boolean_type option;
      [@ocaml.doc
        "Indicates whether passwords in the account expire. Returns true if [MaxPasswordAge] \
         contains a value greater than 0. Returns false if MaxPasswordAge is 0 or not present.\n"]
  allow_users_to_change_password : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM users are allowed to change their own password. Gives IAM users \
         permissions to [iam:ChangePassword] for only their user and to the \
         [iam:GetAccountPasswordPolicy] action. This option does not attach a permissions policy \
         to each user, rather the permissions are applied at the account-level for all users by \
         IAM.\n"]
  require_lowercase_characters : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one lowercase character (a to \
         z).\n"]
  require_uppercase_characters : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one uppercase character (A to \
         Z).\n"]
  require_numbers : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one numeric character (0 to 9).\n"]
  require_symbols : boolean_type option;
      [@ocaml.doc
        "Specifies whether IAM user passwords must contain at least one of the following symbols:\n\n\
        \ ! \\@ # $ % ^ & * ( ) _ + - = \\[ \\] \\{ \\} | '\n\
        \ "]
  minimum_password_length : minimum_password_length_type option;
      [@ocaml.doc "Minimum length to require for IAM user passwords.\n"]
}
[@@ocaml.doc
  "Contains information about the account password policy.\n\n\
  \  This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountPasswordPolicy.html}GetAccountPasswordPolicy} \
   operation. \n\
  \ "]

type nonrec organization_not_in_all_features_mode_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because your organization does not have All features enabled. For more \
   information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set}Available \
   feature sets} in the {i Organizations User Guide}.\n"]

type nonrec organization_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because no organization is associated with your account.\n"]

type nonrec organization_id_type = string [@@ocaml.doc ""]

type nonrec open_id_idp_communication_error_exception = {
  message : open_id_idp_communication_error_exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because IAM cannot connect to the OpenID Connect identity provider URL.\n"]

type nonrec open_id_connect_provider_url_type = string [@@ocaml.doc ""]

type nonrec open_id_connect_provider_list_entry = { arn : arn_type option [@ocaml.doc ""] }
[@@ocaml.doc "Contains the Amazon Resource Name (ARN) for an IAM OpenID Connect provider.\n"]

type nonrec open_id_connect_provider_list_type = open_id_connect_provider_list_entry list
[@@ocaml.doc ""]

type nonrec managed_policy_detail = {
  policy_version_list : policy_document_version_list_type option;
      [@ocaml.doc "A list containing information about the versions of the policy.\n"]
  update_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the policy was last updated.\n\n\
        \ When a policy has only one version, this field contains the date and time when the \
         policy was created. When a policy has more than one version, this field contains the date \
         and time when the most recent policy version was created.\n\
        \ "]
  create_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the policy was created.\n"]
  description : policy_description_type option;
      [@ocaml.doc "A friendly description of the policy.\n"]
  is_attachable : boolean_type option;
      [@ocaml.doc "Specifies whether the policy can be attached to an IAM user, group, or role.\n"]
  permissions_boundary_usage_count : attachment_count_type option;
      [@ocaml.doc
        "The number of entities (users and roles) for which the policy is used as the permissions \
         boundary. \n\n\
        \ For more information about permissions boundaries, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM identities } in the {i IAM User Guide}.\n\
        \ "]
  attachment_count : attachment_count_type option;
      [@ocaml.doc
        "The number of principal entities (users, groups, and roles) that the policy is attached to.\n"]
  default_version_id : policy_version_id_type option;
      [@ocaml.doc
        "The identifier for the version of the policy that is set as the default (operative) \
         version.\n\n\
        \ For more information about policy versions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
         for managed policies} in the {i IAM User Guide}. \n\
        \ "]
  path : policy_path_type option;
      [@ocaml.doc
        "The path to the policy.\n\n\
        \ For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\
        \ "]
  arn : arn_type option; [@ocaml.doc ""]
  policy_id : id_type option;
      [@ocaml.doc
        "The stable and unique string identifying the policy.\n\n\
        \ For more information about IDs, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\
        \ "]
  policy_name : policy_name_type option;
      [@ocaml.doc "The friendly name (not ARN) identifying the policy.\n"]
}
[@@ocaml.doc
  "Contains information about a managed policy, including the policy's ARN, versions, and the \
   number of principal entities (users, groups, and roles) that the policy is attached to.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   operation.\n\
  \ \n\
  \  For more information about managed policies, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html}Managed \
   policies and inline policies} in the {i IAM User Guide}. \n\
  \  "]

type nonrec managed_policy_detail_list_type = managed_policy_detail list [@@ocaml.doc ""]

type nonrec login_profile = {
  password_reset_required : boolean_type option;
      [@ocaml.doc "Specifies whether the user is required to set a new password on next sign-in.\n"]
  create_date : date_type; [@ocaml.doc "The date when the password for the user was created.\n"]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the user, which can be used for signing in to the Amazon Web Services \
         Management Console.\n"]
}
[@@ocaml.doc
  "Contains the user name and password create date for a user.\n\n\
  \  This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateLoginProfile.html}CreateLoginProfile} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetLoginProfile.html}GetLoginProfile} \
   operations. \n\
  \ "]

type nonrec list_virtual_mfa_devices_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  virtual_mfa_devices : virtual_mfa_device_list_type;
      [@ocaml.doc
        " The list of virtual MFA devices in the current account that match the [AssignmentStatus] \
         value that was passed in the request.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListVirtualMFADevices.html}ListVirtualMFADevices} \
   request. \n"]

type nonrec list_virtual_mfa_devices_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  assignment_status : assignment_status_type option;
      [@ocaml.doc
        " The status ([Unassigned] or [Assigned]) of the devices to list. If you do not specify an \
         [AssignmentStatus], the operation defaults to [Any], which lists both assigned and \
         unassigned virtual MFA devices.,\n"]
}
[@@ocaml.doc ""]

type nonrec list_users_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  users : user_list_type; [@ocaml.doc "A list of users.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUsers.html}ListUsers} request. \n"]

type nonrec list_users_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : path_prefix_type option;
      [@ocaml.doc
        " The path prefix for filtering the results. For example: \
         [/division_abc/subdivision_xyz/], which would get all user names whose path starts with \
         [/division_abc/subdivision_xyz/].\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/), listing \
         all user names. This parameter allows (through its \
         {{:http://wikipedia.org/wiki/regex}regex pattern}) a string of characters consisting of \
         either a forward slash (/) by itself or a string that must begin and end with forward \
         slashes. In addition, it can contain any ASCII character from the ! ([\\u0021]) through \
         the DEL character ([\\u007F]), including most punctuation characters, digits, and upper \
         and lowercased letters.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_user_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the user. Each tag consists of a key name \
         and an associated value. If no tags are attached to the specified resource, the response \
         contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_user_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the IAM user whose tags you want to see.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_user_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  policy_names : policy_name_list_type; [@ocaml.doc "A list of policy names.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListUserPolicies.html}ListUserPolicies} \
   request. \n"]

type nonrec list_user_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user to list policies for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_signing_certificates_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  certificates : certificate_list_type;
      [@ocaml.doc "A list of the user's signing certificate information.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSigningCertificates.html}ListSigningCertificates} \
   request. \n"]

type nonrec list_signing_certificates_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the IAM user whose signing certificates you want to examine.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_service_specific_credentials_response = {
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the Marker request \
         parameter to retrieve more items.\n"]
  marker : response_marker_type option;
      [@ocaml.doc
        "When IsTruncated is true, this element is present and contains the value to use for the \
         Marker parameter in a subsequent pagination request.\n"]
  service_specific_credentials : service_specific_credentials_list_type option;
      [@ocaml.doc
        "A list of structures that each contain details about a service-specific credential.\n"]
}
[@@ocaml.doc ""]

type nonrec list_service_specific_credentials_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the IsTruncated \
         response element is true.\n"]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the Marker from the \
         response that you received to indicate where the next call should start.\n"]
  all_users : all_users option;
      [@ocaml.doc
        "A flag indicating whether to list service specific credentials for all users. This \
         parameter cannot be specified together with UserName. When true, returns all credentials \
         associated with the specified service.\n"]
  service_name : service_name option;
      [@ocaml.doc
        "Filters the returned results to only those for the specified Amazon Web Services service. \
         If not specified, then Amazon Web Services returns service-specific credentials for all \
         services.\n"]
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the user whose service-specific credentials you want information about. If \
         this value is not specified, then the operation assumes the user whose credentials are \
         used to call the operation.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_server_certificates_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  server_certificate_metadata_list : server_certificate_metadata_list_type;
      [@ocaml.doc "A list of server certificates.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListServerCertificates.html}ListServerCertificates} \
   request. \n"]

type nonrec list_server_certificates_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : path_prefix_type option;
      [@ocaml.doc
        " The path prefix for filtering the results. For example: [/company/servercerts] would get \
         all server certificates for which the path starts with [/company/servercerts].\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/), listing \
         all server certificates. This parameter allows (through its \
         {{:http://wikipedia.org/wiki/regex}regex pattern}) a string of characters consisting of \
         either a forward slash (/) by itself or a string that must begin and end with forward \
         slashes. In addition, it can contain any ASCII character from the ! ([\\u0021]) through \
         the DEL character ([\\u007F]), including most punctuation characters, digits, and upper \
         and lowercased letters.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_server_certificate_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the IAM server certificate. Each tag \
         consists of a key name and an associated value. If no tags are attached to the specified \
         resource, the response contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_server_certificate_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name of the IAM server certificate whose tags you want to see.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_ssh_public_keys_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  ssh_public_keys : ssh_public_key_list_type option;
      [@ocaml.doc "A list of the SSH public keys assigned to IAM user.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSSHPublicKeys.html}ListSSHPublicKeys} \
   request.\n"]

type nonrec list_ssh_public_keys_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the IAM user to list SSH public keys for. If none is specified, the \
         [UserName] field is determined implicitly based on the Amazon Web Services access key \
         used to sign the request.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_saml_providers_response = {
  saml_provider_list : saml_provider_list_type option;
      [@ocaml.doc
        "The list of SAML provider resource objects defined in IAM for this Amazon Web Services \
         account.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListSAMLProviders.html}ListSAMLProviders} \
   request. \n"]

type nonrec list_saml_providers_request = unit [@@ocaml.doc ""]

type nonrec list_saml_provider_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the Security Assertion Markup Language \
         (SAML) identity provider. Each tag consists of a key name and an associated value. If no \
         tags are attached to the specified resource, the response contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_saml_provider_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  saml_provider_arn : arn_type;
      [@ocaml.doc
        "The ARN of the Security Assertion Markup Language (SAML) identity provider whose tags you \
         want to see.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_roles_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  roles : role_list_type; [@ocaml.doc "A list of roles.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListRoles.html}ListRoles} request. \n"]

type nonrec list_roles_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : path_prefix_type option;
      [@ocaml.doc
        " The path prefix for filtering the results. For example, the prefix \
         [/application_abc/component_xyz/] gets all roles whose path starts with \
         [/application_abc/component_xyz/].\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/), listing \
         all roles. This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex \
         pattern}) a string of characters consisting of either a forward slash (/) by itself or a \
         string that must begin and end with forward slashes. In addition, it can contain any \
         ASCII character from the ! ([\\u0021]) through the DEL character ([\\u007F]), including \
         most punctuation characters, digits, and upper and lowercased letters.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_role_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the role. Each tag consists of a key name \
         and an associated value. If no tags are attached to the specified resource, the response \
         contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_role_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the IAM role for which you want to see the list of tags.\n\n\
        \ This parameter accepts (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that consist of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_role_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  policy_names : policy_name_list_type; [@ocaml.doc "A list of policy names.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListRolePolicies.html}ListRolePolicies} \
   request. \n"]

type nonrec list_role_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to list policies for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_policy_versions_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  versions : policy_document_version_list_type option;
      [@ocaml.doc
        "A list of policy versions.\n\n\
        \ For more information about managed policy versions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
         for managed policies} in the {i IAM User Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicyVersions.html}ListPolicyVersions} \
   request. \n"]

type nonrec list_policy_versions_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy for which you want the versions.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_policy_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the IAM customer managed policy. Each tag \
         consists of a key name and an associated value. If no tags are attached to the specified \
         resource, the response contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policy_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  policy_arn : arn_type;
      [@ocaml.doc
        "The ARN of the IAM customer managed policy whose tags you want to see.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  policies : policy_list_type option; [@ocaml.doc "A list of policies.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListPolicies.html}ListPolicies} \
   request. \n"]

type nonrec list_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  policy_usage_filter : policy_usage_type option;
      [@ocaml.doc
        "The policy usage method to use for filtering the results.\n\n\
        \ To list only permissions policies, set [PolicyUsageFilter] to [PermissionsPolicy]. To \
         list only the policies used to set permissions boundaries, set the value to \
         [PermissionsBoundary].\n\
        \ \n\
        \  This parameter is optional. If it is not included, all policies are returned. \n\
        \  "]
  path_prefix : policy_path_type option;
      [@ocaml.doc
        "The path prefix for filtering the results. This parameter is optional. If it is not \
         included, it defaults to a slash (/), listing all policies. This parameter allows \
         (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a string of characters \
         consisting of either a forward slash (/) by itself or a string that must begin and end \
         with forward slashes. In addition, it can contain any ASCII character from the ! \
         ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation characters, \
         digits, and upper and lowercased letters.\n"]
  only_attached : boolean_type option;
      [@ocaml.doc
        "A flag to filter the results to only the attached policies.\n\n\
        \ When [OnlyAttached] is [true], the returned list contains only the policies that are \
         attached to an IAM user, group, or role. When [OnlyAttached] is [false], or when the \
         parameter is not included, all policies are returned.\n\
        \ "]
  scope : policy_scope_type option;
      [@ocaml.doc
        "The scope to use for filtering the results.\n\n\
        \ To list only Amazon Web Services managed policies, set [Scope] to [AWS]. To list only \
         the customer managed policies in your Amazon Web Services account, set [Scope] to [Local].\n\
        \ \n\
        \  This parameter is optional. If it is not included, or if it is set to [All], all \
         policies are returned.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_policies_granting_service_access_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. We recommend that you check [IsTruncated] after every \
         call to ensure that you receive all your results.\n"]
  policies_granting_service_access : list_policy_granting_service_access_response_list_type;
      [@ocaml.doc
        "A [ListPoliciesGrantingServiceAccess] object that contains details about the permissions \
         policies attached to the specified identity (user, group, or role).\n"]
}
[@@ocaml.doc ""]

type nonrec list_policies_granting_service_access_request = {
  service_namespaces : service_namespace_list_type;
      [@ocaml.doc
        "The service namespace for the Amazon Web Services services whose policies you want to \
         list.\n\n\
        \ To learn the service namespace for a service, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html}Actions, \
         resources, and condition keys for Amazon Web Services services} in the {i IAM User \
         Guide}. Choose the name of the service to view details for that service. In the first \
         paragraph, find the service prefix. For example, [(service prefix: a4b)]. For more \
         information about service namespaces, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon \
         Web Services service namespaces} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  arn : arn_type;
      [@ocaml.doc
        "The ARN of the IAM identity (user, group, or role) whose policies you want to list.\n"]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
}
[@@ocaml.doc ""]

type nonrec feature_type =
  | ROOT_SESSIONS [@ocaml.doc ""]
  | ROOT_CREDENTIALS_MANAGEMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec features_list_type = feature_type list [@@ocaml.doc ""]

type nonrec list_organizations_features_response = {
  enabled_features : features_list_type option;
      [@ocaml.doc "Specifies the features that are currently available in your organization.\n"]
  organization_id : organization_id_type option;
      [@ocaml.doc "The unique identifier (ID) of an organization.\n"]
}
[@@ocaml.doc ""]

type nonrec list_organizations_features_request = unit [@@ocaml.doc ""]

type nonrec account_not_management_or_delegated_administrator_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the account making the request is not the management account \
   or delegated administrator account for \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management}centralized \
   root access}.\n"]

type nonrec list_open_id_connect_providers_response = {
  open_id_connect_provider_list : open_id_connect_provider_list_type option;
      [@ocaml.doc
        "The list of IAM OIDC provider resource objects defined in the Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html}ListOpenIDConnectProviders} \
   request. \n"]

type nonrec list_open_id_connect_providers_request = unit [@@ocaml.doc ""]

type nonrec list_open_id_connect_provider_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the OpenID Connect (OIDC) identity \
         provider. Each tag consists of a key name and an associated value. If no tags are \
         attached to the specified resource, the response contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_open_id_connect_provider_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The ARN of the OpenID Connect (OIDC) identity provider whose tags you want to see.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_mfa_devices_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  mfa_devices : mfa_device_list_type; [@ocaml.doc "A list of MFA devices.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListMFADevices.html}ListMFADevices} \
   request. \n"]

type nonrec list_mfa_devices_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user whose MFA devices you want to list.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_mfa_device_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the virtual MFA device. Each tag consists \
         of a key name and an associated value. If no tags are attached to the specified resource, \
         the response contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mfa_device_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  serial_number : serial_number_type;
      [@ocaml.doc
        "The unique identifier for the IAM virtual MFA device whose tags you want to see. For \
         virtual MFA devices, the serial number is the same as the ARN.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_instance_profiles_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  instance_profiles : instance_profile_list_type; [@ocaml.doc "A list of instance profiles.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListInstanceProfiles.html}ListInstanceProfiles} \
   request. \n"]

type nonrec list_instance_profiles_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : path_prefix_type option;
      [@ocaml.doc
        " The path prefix for filtering the results. For example, the prefix \
         [/application_abc/component_xyz/] gets all instance profiles whose path starts with \
         [/application_abc/component_xyz/].\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/), listing \
         all instance profiles. This parameter allows (through its \
         {{:http://wikipedia.org/wiki/regex}regex pattern}) a string of characters consisting of \
         either a forward slash (/) by itself or a string that must begin and end with forward \
         slashes. In addition, it can contain any ASCII character from the ! ([\\u0021]) through \
         the DEL character ([\\u007F]), including most punctuation characters, digits, and upper \
         and lowercased letters.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_instance_profiles_for_role_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  instance_profiles : instance_profile_list_type; [@ocaml.doc "A list of instance profiles.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListInstanceProfilesForRole.html}ListInstanceProfilesForRole} \
   request. \n"]

type nonrec list_instance_profiles_for_role_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to list instance profiles for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_instance_profile_tags_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  tags : tag_list_type;
      [@ocaml.doc
        "The list of tags that are currently attached to the IAM instance profile. Each tag \
         consists of a key name and an associated value. If no tags are attached to the specified \
         resource, the response contains an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_instance_profile_tags_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the IAM instance profile whose tags you want to see.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_groups_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  groups : group_list_type; [@ocaml.doc "A list of groups.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroups.html}ListGroups} request. \n"]

type nonrec list_groups_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : path_prefix_type option;
      [@ocaml.doc
        " The path prefix for filtering the results. For example, the prefix \
         [/division_abc/subdivision_xyz/] gets all groups whose path starts with \
         [/division_abc/subdivision_xyz/].\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/), listing \
         all groups. This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex \
         pattern}) a string of characters consisting of either a forward slash (/) by itself or a \
         string that must begin and end with forward slashes. In addition, it can contain any \
         ASCII character from the ! ([\\u0021]) through the DEL character ([\\u007F]), including \
         most punctuation characters, digits, and upper and lowercased letters.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_groups_for_user_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  groups : group_list_type; [@ocaml.doc "A list of groups.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroupsForUser.html}ListGroupsForUser} \
   request. \n"]

type nonrec list_groups_for_user_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user to list groups for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_group_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  policy_names : policy_name_list_type;
      [@ocaml.doc
        "A list of policy names.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListGroupPolicies.html}ListGroupPolicies} \
   request. \n"]

type nonrec list_group_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group to list policies for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_entities_for_policy_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  policy_roles : policy_role_list_type option;
      [@ocaml.doc "A list of IAM roles that the policy is attached to.\n"]
  policy_users : policy_user_list_type option;
      [@ocaml.doc "A list of IAM users that the policy is attached to.\n"]
  policy_groups : policy_group_list_type option;
      [@ocaml.doc "A list of IAM groups that the policy is attached to.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListEntitiesForPolicy.html}ListEntitiesForPolicy} \
   request. \n"]

type nonrec list_entities_for_policy_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  policy_usage_filter : policy_usage_type option;
      [@ocaml.doc
        "The policy usage method to use for filtering the results.\n\n\
        \ To list only permissions policies, set [PolicyUsageFilter] to [PermissionsPolicy]. To \
         list only the policies used to set permissions boundaries, set the value to \
         [PermissionsBoundary].\n\
        \ \n\
        \  This parameter is optional. If it is not included, all policies are returned. \n\
        \  "]
  path_prefix : path_type option;
      [@ocaml.doc
        "The path prefix for filtering the results. This parameter is optional. If it is not \
         included, it defaults to a slash (/), listing all entities.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  entity_filter : entity_type option;
      [@ocaml.doc
        "The entity type to use for filtering the results.\n\n\
        \ For example, when [EntityFilter] is [Role], only the roles that are attached to the \
         specified policy are returned. This parameter is optional. If it is not included, all \
         attached entities (users, groups, and roles) are returned. The argument for this \
         parameter must be one of the valid values listed below.\n\
        \ "]
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy for which you want the versions.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_delegation_requests_response = {
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items.\n"]
  marker : marker_type option;
      [@ocaml.doc
        "When [isTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  delegation_requests : delegation_requests_list_type option;
      [@ocaml.doc "A list of delegation requests that match the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec list_delegation_requests_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true]. \n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         may return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from. \n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start. \n"]
  owner_id : owner_id_type option; [@ocaml.doc "The owner ID to filter delegation requests by.\n"]
}
[@@ocaml.doc ""]

type nonrec list_attached_user_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  attached_policies : attached_policies_list_type option;
      [@ocaml.doc "A list of the attached policies.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedUserPolicies.html}ListAttachedUserPolicies} \
   request. \n"]

type nonrec list_attached_user_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : policy_path_type option;
      [@ocaml.doc
        "The path prefix for filtering the results. This parameter is optional. If it is not \
         included, it defaults to a slash (/), listing all policies.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the user to list attached policies for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_attached_role_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  attached_policies : attached_policies_list_type option;
      [@ocaml.doc "A list of the attached policies.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedRolePolicies.html}ListAttachedRolePolicies} \
   request. \n"]

type nonrec list_attached_role_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : policy_path_type option;
      [@ocaml.doc
        "The path prefix for filtering the results. This parameter is optional. If it is not \
         included, it defaults to a slash (/), listing all policies.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the role to list attached policies for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_attached_group_policies_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  attached_policies : attached_policies_list_type option;
      [@ocaml.doc "A list of the attached policies.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAttachedGroupPolicies.html}ListAttachedGroupPolicies} \
   request. \n"]

type nonrec list_attached_group_policies_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  path_prefix : policy_path_type option;
      [@ocaml.doc
        "The path prefix for filtering the results. This parameter is optional. If it is not \
         included, it defaults to a slash (/), listing all policies.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the group to list attached policies for.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_account_aliases_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  account_aliases : account_alias_list_type;
      [@ocaml.doc
        "A list of aliases associated with the account. Amazon Web Services supports only one \
         alias per account.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccountAliases.html}ListAccountAliases} \
   request. \n"]

type nonrec list_account_aliases_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
}
[@@ocaml.doc ""]

type nonrec list_access_keys_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  access_key_metadata : access_key_metadata_list_type;
      [@ocaml.doc "A list of objects containing metadata about the access keys.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html}ListAccessKeys} \
   request. \n"]

type nonrec list_access_keys_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_user_type_exception = {
  message : invalid_user_type_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the type of user for the transaction was incorrect.\n"]

type nonrec get_user_response = {
  user : user;
      [@ocaml.doc
        "A structure containing details about the IAM user.\n\n\
        \  Due to a service issue, password last used data does not include password use from May \
         3, 2018 22:50 PDT to May 23, 2018 14:08 PDT. This affects \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_finding-unused.html}last \
         sign-in} dates shown in the IAM console and password last used dates in the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html}IAM \
         credential report}, and returned by this operation. If users signed in during the \
         affected time, the password last used date that is returned is the date the user last \
         signed in before May 3, 2018. For users that signed in after May 23, 2018 14:08 PDT, the \
         returned password last used date is accurate.\n\
        \  \n\
        \   You can use password last used information to identify unused credentials for \
         deletion. For example, you might delete users who did not sign in to Amazon Web Services \
         in the last 90 days. In cases like this, we recommend that you adjust your evaluation \
         window to include dates after May 23, 2018. Alternatively, if your users use access keys \
         to access Amazon Web Services programmatically you can refer to access key last used \
         information because it is accurate for all dates. \n\
        \   \n\
        \    "]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html}GetUser} request. \n"]

type nonrec get_user_request = {
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user to get information about.\n\n\
        \ This parameter is optional. If it is not included, it defaults to the user making the \
         request. This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex \
         pattern}) a string of characters consisting of upper and lowercase alphanumeric \
         characters with no spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_user_policy_response = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy document.\n\n\
        \ IAM stores policies in JSON format. However, resources that were created using \
         CloudFormation templates can be formatted in YAML. CloudFormation always converts a YAML \
         policy to JSON format before submitting it to IAM.\n\
        \ "]
  policy_name : policy_name_type; [@ocaml.doc "The name of the policy.\n"]
  user_name : existing_user_name_type; [@ocaml.doc "The user the policy is associated with.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUserPolicy.html}GetUserPolicy} \
   request. \n"]

type nonrec get_user_policy_request = {
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the policy document to get.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user who the policy is associated with.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec deletion_task_status_type =
  | NOT_STARTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deletion_task_failure_reason_type = {
  role_usage_list : role_usage_list_type option;
      [@ocaml.doc
        "A list of objects that contains details about the service-linked role deletion failure, \
         if that information is returned by the service. If the service-linked role has active \
         sessions or if any resources that were used by the role have not been deleted from the \
         linked service, the role can't be deleted. This parameter includes a list of the \
         resources that are associated with the role and the Region in which the resources are \
         being used.\n"]
  reason : reason_type option;
      [@ocaml.doc
        "A short description of the reason that the service-linked role deletion failed.\n"]
}
[@@ocaml.doc
  "The reason that the service-linked role deletion failed.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLinkedRoleDeletionStatus.html}GetServiceLinkedRoleDeletionStatus} \
   operation.\n\
  \ "]

type nonrec get_service_linked_role_deletion_status_response = {
  reason : deletion_task_failure_reason_type option;
      [@ocaml.doc "An object that contains details about the reason the deletion failed.\n"]
  status : deletion_task_status_type; [@ocaml.doc "The status of the deletion.\n"]
}
[@@ocaml.doc ""]

type nonrec deletion_task_id_type = string [@@ocaml.doc ""]

type nonrec get_service_linked_role_deletion_status_request = {
  deletion_task_id : deletion_task_id_type;
      [@ocaml.doc
        "The deletion task identifier. This identifier is returned by the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteServiceLinkedRole.html}DeleteServiceLinkedRole} \
         operation in the format \n\
         {[\n\
         task/aws-service-role///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec error_details = {
  code : string_type; [@ocaml.doc "The error code associated with the operation failure.\n"]
  message : string_type;
      [@ocaml.doc "Detailed information about the reason that the operation failed.\n"]
}
[@@ocaml.doc
  "Contains information about the reason that the operation failed.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html}GetOrganizationsAccessReport}, \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html}GetServiceLastAccessedDetails}, \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html}GetServiceLastAccessedDetailsWithEntities} \
   operations.\n\
  \ "]

type nonrec get_service_last_accessed_details_with_entities_response = {
  error : error_details option;
      [@ocaml.doc "An object that contains details about the reason the operation failed.\n"]
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  entity_details_list : entity_details_list_type;
      [@ocaml.doc
        "An [EntityDetailsList] object that contains details about when an IAM entity (user or \
         role) used group or policy permissions in an attempt to access the specified Amazon Web \
         Services service.\n"]
  job_completion_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the generated report job was completed or failed.\n\n\
        \ This field is null if the job is still in progress, as indicated by a job status value \
         of [IN_PROGRESS].\n\
        \ "]
  job_creation_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the report job was created.\n"]
  job_status : job_status_type; [@ocaml.doc "The status of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_last_accessed_details_with_entities_request = {
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  service_namespace : service_namespace_type;
      [@ocaml.doc
        "The service namespace for an Amazon Web Services service. Provide the service namespace \
         to learn when the IAM entity last attempted to access the specified service.\n\n\
        \ To learn the service namespace for a service, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html}Actions, \
         resources, and condition keys for Amazon Web Services services} in the {i IAM User \
         Guide}. Choose the name of the service to view details for that service. In the first \
         paragraph, find the service prefix. For example, [(service prefix: a4b)]. For more \
         information about service namespaces, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon \
         Web Services service namespaces} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  job_id : job_id_type;
      [@ocaml.doc
        "The ID of the request generated by the [GenerateServiceLastAccessedDetails] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec access_advisor_usage_granularity_type =
  | ACTION_LEVEL [@ocaml.doc ""]
  | SERVICE_LEVEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_service_last_accessed_details_response = {
  error : error_details option;
      [@ocaml.doc "An object that contains details about the reason the operation failed.\n"]
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  job_completion_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the generated report job was completed or failed.\n\n\
        \ This field is null if the job is still in progress, as indicated by a job status value \
         of [IN_PROGRESS].\n\
        \ "]
  services_last_accessed : services_last_accessed;
      [@ocaml.doc
        " A [ServiceLastAccessed] object that contains details about the most recent attempt to \
         access the service.\n"]
  job_creation_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the report job was created.\n"]
  job_type : access_advisor_usage_granularity_type option;
      [@ocaml.doc
        "The type of job. Service jobs return information about when each service was last \
         accessed. Action jobs also include information about when tracked actions within the \
         service were last accessed.\n"]
  job_status : job_status_type; [@ocaml.doc "The status of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_last_accessed_details_request = {
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  job_id : job_id_type;
      [@ocaml.doc
        "The ID of the request generated by the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateServiceLastAccessedDetails.html}GenerateServiceLastAccessedDetails} \
         operation. The [JobId] returned by [GenerateServiceLastAccessedDetail] must be used by \
         the same role within a session, or by the same user when used to call \
         [GetServiceLastAccessedDetail].\n"]
}
[@@ocaml.doc ""]

type nonrec get_server_certificate_response = {
  server_certificate : server_certificate;
      [@ocaml.doc "A structure containing details about the server certificate.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServerCertificate.html}GetServerCertificate} \
   request. \n"]

type nonrec get_server_certificate_request = {
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name of the server certificate you want to retrieve information about.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_ssh_public_key_response = {
  ssh_public_key : ssh_public_key option;
      [@ocaml.doc "A structure containing details about the SSH public key.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSSHPublicKey.html}GetSSHPublicKey} \
   request.\n"]

type nonrec get_ssh_public_key_request = {
  encoding : encoding_type;
      [@ocaml.doc
        "Specifies the public key encoding format to use in the response. To retrieve the public \
         key in ssh-rsa format, use [SSH]. To retrieve the public key in PEM format, use [PEM].\n"]
  ssh_public_key_id : public_key_id_type;
      [@ocaml.doc
        "The unique identifier for the SSH public key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the IAM user associated with the SSH public key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_saml_provider_response = {
  private_key_list : private_key_list option;
      [@ocaml.doc "The private key metadata for the SAML provider.\n"]
  assertion_encryption_mode : assertion_encryption_mode_type option;
      [@ocaml.doc "Specifies the encryption setting for the SAML provider.\n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the specified IAM SAML provider. The returned list of \
         tags is sorted by tag key. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  valid_until : date_type option;
      [@ocaml.doc "The expiration date and time for the SAML provider.\n"]
  create_date : date_type option;
      [@ocaml.doc "The date and time when the SAML provider was created.\n"]
  saml_metadata_document : saml_metadata_document_type option;
      [@ocaml.doc
        "The XML metadata document that includes information about an identity provider.\n"]
  saml_provider_uui_d : private_key_id_type option;
      [@ocaml.doc "The unique identifier assigned to the SAML provider.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSAMLProvider.html}GetSAMLProvider} \
   request. \n"]

type nonrec get_saml_provider_request = {
  saml_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SAML provider resource object in IAM to get \
         information about.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_role_response = {
  role : role; [@ocaml.doc "A structure containing details about the IAM role.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRole.html}GetRole} request. \n"]

type nonrec get_role_request = {
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the IAM role to get information about.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_role_policy_response = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy document.\n\n\
        \ IAM stores policies in JSON format. However, resources that were created using \
         CloudFormation templates can be formatted in YAML. CloudFormation always converts a YAML \
         policy to JSON format before submitting it to IAM.\n\
        \ "]
  policy_name : policy_name_type; [@ocaml.doc "The name of the policy.\n"]
  role_name : role_name_type; [@ocaml.doc "The role the policy is associated with.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetRolePolicy.html}GetRolePolicy} \
   request. \n"]

type nonrec get_role_policy_request = {
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the policy document to get.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role associated with the policy.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_policy_version_response = {
  policy_version : policy_version option;
      [@ocaml.doc "A structure containing details about the policy version.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicyVersion.html}GetPolicyVersion} \
   request. \n"]

type nonrec get_policy_version_request = {
  version_id : policy_version_id_type;
      [@ocaml.doc
        "Identifies the policy version to retrieve.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that consists of the lowercase letter 'v' followed by one or two \
         digits, and optionally followed by a period '.' and a string of letters and digits.\n\
        \ "]
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the managed policy that you want information about.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_policy_response = {
  policy : policy option; [@ocaml.doc "A structure containing details about the policy.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetPolicy.html}GetPolicy} request. \n"]

type nonrec get_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the managed policy that you want information about.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_outbound_web_identity_federation_info_response = {
  jwt_vending_enabled : boolean_type option;
      [@ocaml.doc
        "Indicates whether outbound identity federation is currently enabled for your Amazon Web \
         Services account. When true, IAM principals in the account can call the \
         [GetWebIdentityToken] API to obtain JSON Web Tokens (JWTs) for authentication with \
         external services. \n"]
  issuer_identifier : string_type option;
      [@ocaml.doc
        "A unique issuer URL for your Amazon Web Services account that hosts the OpenID Connect \
         (OIDC) discovery endpoints at [/.well-known/openid-configuration and \
         /.well-known/jwks.json]. The OpenID Connect (OIDC) discovery endpoints contain \
         verification keys and metadata necessary for token verification.\n"]
}
[@@ocaml.doc ""]

type nonrec feature_disabled_message = string [@@ocaml.doc ""]

type nonrec feature_disabled_exception = {
  message : feature_disabled_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because outbound identity federation is already disabled for your Amazon Web \
   Services account. You cannot disable the feature multiple times\n"]

type nonrec access_detail = {
  total_authenticated_entities : integer_type option;
      [@ocaml.doc
        "The number of accounts with authenticated principals (root user, IAM users, and IAM \
         roles) that attempted to access the service in the tracking period.\n"]
  last_authenticated_time : date_type option;
      [@ocaml.doc
        "The date and time, in\194\160{{:http://www.iso.org/iso/iso8601}ISO 8601 date-time \
         format}, when an authenticated principal most recently attempted to access the service. \
         Amazon Web Services does not report unauthenticated requests.\n\n\
        \ This field is null if no principals in the reported Organizations entity attempted to \
         access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  entity_path : organizations_entity_path_type option;
      [@ocaml.doc
        "The path of the Organizations entity (root, organizational unit, or account) from which \
         an authenticated principal last attempted to access the service. Amazon Web Services does \
         not report unauthenticated requests.\n\n\
        \ This field is null if no principals (IAM users, IAM roles, or root user) in the reported \
         Organizations entity attempted to access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  region : string_type option;
      [@ocaml.doc
        "The Region where the last service access attempt occurred.\n\n\
        \ This field is null if no principals in the reported Organizations entity attempted to \
         access the service within the \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period}tracking \
         period}.\n\
        \ "]
  service_namespace : service_namespace_type;
      [@ocaml.doc
        "The namespace of the service in which access was attempted.\n\n\
        \ To learn the service namespace of a service, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html}Actions, \
         resources, and condition keys for Amazon Web Services services} in the {i Service \
         Authorization Reference}. Choose the name of the service to view details for that \
         service. In the first paragraph, find the service prefix. For example, [(service prefix: \
         a4b)]. For more information about service namespaces, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon \
         Web Services service namespaces} in the\194\160{i Amazon Web Services General Reference}.\n\
        \ "]
  service_name : service_name_type;
      [@ocaml.doc "The name of the service in which access was attempted.\n"]
}
[@@ocaml.doc
  "An object that contains details about when a principal in the reported Organizations entity \
   last attempted to access an Amazon Web Services service. A principal can be an IAM user, an IAM \
   role, or the Amazon Web Services account root user within the reported Organizations entity.\n\n\
  \ This data type is a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html}GetOrganizationsAccessReport} \
   operation.\n\
  \ "]

type nonrec access_details = access_detail list [@@ocaml.doc ""]

type nonrec get_organizations_access_report_response = {
  error_details : error_details option; [@ocaml.doc ""]
  marker : marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  access_details : access_details option;
      [@ocaml.doc
        "An object that contains details about the most recent attempt to access the service.\n"]
  number_of_services_not_accessed : integer_type option;
      [@ocaml.doc
        "The number of services that account principals are allowed but did not attempt to access.\n"]
  number_of_services_accessible : integer_type option;
      [@ocaml.doc
        "The number of services that the applicable SCPs allow account principals to access.\n"]
  job_completion_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the generated report job was completed or failed.\n\n\
        \ This field is null if the job is still in progress, as indicated by a job status value \
         of [IN_PROGRESS].\n\
        \ "]
  job_creation_date : date_type;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the report job was created.\n"]
  job_status : job_status_type; [@ocaml.doc "The status of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec get_organizations_access_report_request = {
  sort_key : sort_key_type option;
      [@ocaml.doc
        "The key that is used to sort the results. If you choose the namespace key, the results \
         are returned in alphabetical order. If you choose the time key, the results are sorted \
         numerically by the date and time.\n"]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  job_id : job_id_type;
      [@ocaml.doc
        "The identifier of the request generated by the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateOrganizationsAccessReport.html}GenerateOrganizationsAccessReport} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_open_id_connect_provider_response = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the specified IAM OIDC provider. The returned list of \
         tags is sorted by tag key. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  create_date : date_type option;
      [@ocaml.doc
        "The date and time when the IAM OIDC provider resource object was created in the Amazon \
         Web Services account.\n"]
  thumbprint_list : thumbprint_list_type option;
      [@ocaml.doc
        "A list of certificate thumbprints that are associated with the specified IAM OIDC \
         provider resource object. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider}. \n"]
  client_id_list : client_id_list_type option;
      [@ocaml.doc
        "A list of client IDs (also known as audiences) that are associated with the specified IAM \
         OIDC provider resource object. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider}.\n"]
  url : open_id_connect_provider_url_type option;
      [@ocaml.doc
        "The URL that the IAM OIDC provider resource object is associated with. For more \
         information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider}.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html}GetOpenIDConnectProvider} \
   request. \n"]

type nonrec get_open_id_connect_provider_request = {
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the OIDC provider resource object in IAM to get \
         information for. You can get a list of OIDC provider resource ARNs by using the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html}ListOpenIDConnectProviders} \
         operation.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec certification_value_type = string [@@ocaml.doc ""]

type nonrec certification_key_type = string [@@ocaml.doc ""]

type nonrec certification_map_type = (certification_key_type * certification_value_type) list
[@@ocaml.doc ""]

type nonrec get_mfa_device_response = {
  certifications : certification_map_type option;
      [@ocaml.doc
        "The certifications of a specified user's MFA device. We currently provide FIPS-140-2, \
         FIPS-140-3, and FIDO certification levels obtained from \
         {{:https://fidoalliance.org/metadata/} FIDO Alliance Metadata Service (MDS)}.\n"]
  enable_date : date_type option;
      [@ocaml.doc "The date that a specified user's MFA device was first enabled.\n"]
  serial_number : serial_number_type;
      [@ocaml.doc
        "Serial number that uniquely identifies the MFA device. For this API, we only accept FIDO \
         security key \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html}ARNs}.\n"]
  user_name : user_name_type option; [@ocaml.doc "The friendly name identifying the user.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mfa_device_request = {
  user_name : user_name_type option; [@ocaml.doc "The friendly name identifying the user.\n"]
  serial_number : serial_number_type;
      [@ocaml.doc
        "Serial number that uniquely identifies the MFA device. For this API, we only accept FIDO \
         security key \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html}ARNs}.\n"]
}
[@@ocaml.doc ""]

type nonrec get_login_profile_response = {
  login_profile : login_profile;
      [@ocaml.doc
        "A structure containing the user name and the profile creation date for the user.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetLoginProfile.html}GetLoginProfile} \
   request. \n"]

type nonrec get_login_profile_request = {
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the user whose login profile you want to retrieve.\n\n\
        \ This parameter is optional. If no user name is included, it defaults to the principal \
         making the request. When you make this request with root user credentials, you must use \
         an {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html}AssumeRoot} \
         session to omit the user name.\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_instance_profile_response = {
  instance_profile : instance_profile;
      [@ocaml.doc "A structure containing details about the instance profile.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetInstanceProfile.html}GetInstanceProfile} \
   request. \n"]

type nonrec get_instance_profile_request = {
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the instance profile to get information about.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_human_readable_summary_response = {
  summary_state : summary_state_type option;
      [@ocaml.doc
        "State of summary generation. This generation process is asynchronous and this attribute \
         indicates the state of the generation process.\n"]
  locale : locale_type option;
      [@ocaml.doc
        "The locale that this response was generated for. This maps to the input locale.\n"]
  summary_content : summary_content_type option;
      [@ocaml.doc
        "Summary content in the specified locale. Summary content is non-empty only if the \
         [SummaryState] is [AVAILABLE].\n"]
}
[@@ocaml.doc ""]

type nonrec get_human_readable_summary_request = {
  locale : locale_type option;
      [@ocaml.doc
        "A string representing the locale to use for the summary generation. The supported locale \
         strings are based on the \
         {{:/awsconsolehelpdocs/latest/gsg/change-language.html#supported-languages} Supported \
         languages of the Amazon Web Services Management Console }.\n"]
  entity_arn : arn_type;
      [@ocaml.doc
        "Arn of the entity to be summarized. At this time, the only supported entity type is \
         [delegation-request] \n"]
}
[@@ocaml.doc ""]

type nonrec get_group_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  users : user_list_type; [@ocaml.doc "A list of users in the group.\n"]
  group : group; [@ocaml.doc "A structure that contains details about the group.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroup.html}GetGroup} request. \n"]

type nonrec get_group_request = {
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_group_policy_response = {
  policy_document : policy_document_type;
      [@ocaml.doc
        "The policy document.\n\n\
        \ IAM stores policies in JSON format. However, resources that were created using \
         CloudFormation templates can be formatted in YAML. CloudFormation always converts a YAML \
         policy to JSON format before submitting it to IAM.\n\
        \ "]
  policy_name : policy_name_type; [@ocaml.doc "The name of the policy.\n"]
  group_name : group_name_type; [@ocaml.doc "The group the policy is associated with.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroupPolicy.html}GetGroupPolicy} \
   request. \n"]

type nonrec get_group_policy_request = {
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the policy document to get.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group the policy is associated with.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_delegation_request_response = {
  permission_check_result : permission_check_result_type option;
      [@ocaml.doc
        "The result of the permission check, indicating whether the caller has sufficient \
         permissions to cover the requested permissions. This is an approximate result.\n\n\
        \ {ul\n\
        \       {-   [ALLOWED] : The caller has sufficient permissions cover all the requested \
         permissions.\n\
        \           \n\
        \            }\n\
        \       {-   [DENIED] : The caller does not have sufficient permissions to cover all the \
         requested permissions.\n\
        \           \n\
        \            }\n\
        \       {-   [UNSURE] : It is not possible to determine whether the caller has all the \
         permissions needed. This output is most likely for cases when the caller has permissions \
         with conditions.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  permission_check_status : permission_check_status_type option;
      [@ocaml.doc
        "The status of the permission check for the delegation request.\n\n\
        \ This value indicates the status of the process to check whether the caller has \
         sufficient permissions to cover the requested actions in the delegation request. Since \
         this is an asynchronous process, there are three potential values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [IN_PROGRESS] : The permission check process has started.\n\
        \            \n\
        \             }\n\
        \        {-   [COMPLETED] : The permission check process has completed. The \
         [PermissionCheckResult] will include the result.\n\
        \            \n\
        \             }\n\
        \        {-   [FAILED] : The permission check process has failed.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  delegation_request : delegation_request option;
      [@ocaml.doc "The delegation request object containing all details about the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delegation_request_request = {
  delegation_permission_check : boolean_type option;
      [@ocaml.doc
        "Specifies whether to perform a permission check for the delegation request.\n\n\
        \ If set to true, the [GetDelegationRequest] API call will start a permission check \
         process. This process calculates whether the caller has sufficient permissions to cover \
         the asks from this delegation request.\n\
        \ \n\
        \  Setting this parameter to true does not guarantee an answer in the response. See the \
         [PermissionCheckStatus] and the [PermissionCheckResult] response attributes for further \
         details.\n\
        \  "]
  delegation_request_id : delegation_request_id_type;
      [@ocaml.doc "The unique identifier of the delegation request to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_credential_report_response = {
  generated_time : date_type option;
      [@ocaml.doc
        " The date and time when the credential report was created, in \
         {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}.\n"]
  report_format : report_format_type option;
      [@ocaml.doc "The format (MIME type) of the credential report.\n"]
  content : report_content_type option;
      [@ocaml.doc "Contains the credential report. The report is Base64-encoded.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetCredentialReport.html}GetCredentialReport} \
   request. \n"]

type nonrec credential_report_not_ready_exception = {
  message : credential_report_not_ready_exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was rejected because the credential report is still being generated.\n"]

type nonrec credential_report_not_present_exception = {
  message : credential_report_not_present_exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the credential report does not exist. To generate a credential \
   report, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateCredentialReport.html}GenerateCredentialReport}.\n"]

type nonrec credential_report_expired_exception = {
  message : credential_report_expired_exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the most recent credential report has expired. To generate a \
   new credential report, use \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateCredentialReport.html}GenerateCredentialReport}. \
   For more information about credential report expiration, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html}Getting credential \
   reports} in the {i IAM User Guide}.\n"]

type nonrec get_context_keys_for_principal_policy_request = {
  policy_input_list : simulation_policy_list_type option;
      [@ocaml.doc
        "An optional list of additional policies for which you want the list of context keys that \
         are referenced.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  policy_source_arn : arn_type;
      [@ocaml.doc
        "The ARN of a user, group, or role whose policies contain the context keys that you want \
         listed. If you specify a user, the list includes context keys that are found in all \
         policies that are attached to the user. The list also includes all groups that the user \
         is a member of. If you pick a group or a role, then it includes only those context keys \
         that are found in policies attached to that entity. Note that all parameters are shown in \
         unencoded form here for clarity, but must be URL encoded to be included as a part of a \
         real HTML request.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_context_keys_for_policy_response = {
  context_key_names : context_key_names_result_list_type option;
      [@ocaml.doc "The list of context keys that are referenced in the input policies.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForPrincipalPolicy.html}GetContextKeysForPrincipalPolicy} \
   or \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetContextKeysForCustomPolicy.html}GetContextKeysForCustomPolicy} \
   request. \n"]

type nonrec get_context_keys_for_custom_policy_request = {
  policy_input_list : simulation_policy_list_type;
      [@ocaml.doc
        "A list of policies for which you want the list of context keys referenced in those \
         policies. Each document is specified as a string containing the complete, valid JSON text \
         of an IAM policy.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter is \
         a string of characters consisting of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \            \n\
        \             }\n\
        \        {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \            \n\
        \             }\n\
        \        {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_account_summary_response = {
  summary_map : summary_map_type option;
      [@ocaml.doc
        "A set of key\226\128\147value pairs containing information about IAM entity usage and IAM \
         quotas.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountSummary.html}GetAccountSummary} \
   request. \n"]

type nonrec get_account_password_policy_response = {
  password_policy : password_policy;
      [@ocaml.doc "A structure that contains details about the account's password policy.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountPasswordPolicy.html}GetAccountPasswordPolicy} \
   request. \n"]

type nonrec get_account_authorization_details_response = {
  marker : response_marker_type option;
      [@ocaml.doc
        "When [IsTruncated] is [true], this element is present and contains the value to use for \
         the [Marker] parameter in a subsequent pagination request.\n"]
  is_truncated : boolean_type option;
      [@ocaml.doc
        "A flag that indicates whether there are more items to return. If your results were \
         truncated, you can make a subsequent pagination request using the [Marker] request \
         parameter to retrieve more items. Note that IAM might return fewer than the [MaxItems] \
         number of results even when there are more results available. We recommend that you check \
         [IsTruncated] after every call to ensure that you receive all your results.\n"]
  policies : managed_policy_detail_list_type option;
      [@ocaml.doc "A list containing information about managed policies.\n"]
  role_detail_list : role_detail_list_type option;
      [@ocaml.doc "A list containing information about IAM roles.\n"]
  group_detail_list : group_detail_list_type option;
      [@ocaml.doc "A list containing information about IAM groups.\n"]
  user_detail_list : user_detail_list_type option;
      [@ocaml.doc "A list containing information about IAM users.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccountAuthorizationDetails.html}GetAccountAuthorizationDetails} \
   request. \n"]

type nonrec get_account_authorization_details_request = {
  marker : marker_type option;
      [@ocaml.doc
        "Use this parameter only when paginating results and only after you receive a response \
         indicating that the results are truncated. Set it to the value of the [Marker] element in \
         the response that you received to indicate where the next call should start.\n"]
  max_items : max_items_type option;
      [@ocaml.doc
        "Use this only when paginating results to indicate the maximum number of items you want in \
         the response. If additional items exist beyond the maximum you specify, the [IsTruncated] \
         response element is [true].\n\n\
        \ If you do not include this parameter, the number of items defaults to 100. Note that IAM \
         might return fewer results, even when there are more results available. In that case, the \
         [IsTruncated] response element returns [true], and [Marker] contains a value to include \
         in the subsequent call that tells the service where to continue from.\n\
        \ "]
  filter : entity_list_type option;
      [@ocaml.doc
        "A list of entity types used to filter the results. Only the entities that match the types \
         you specify are included in the output. Use the value [LocalManagedPolicy] to include \
         customer managed policies.\n\n\
        \ The format for this parameter is a comma-separated (if more than one) list of strings. \
         Each string value in the list must be one of the valid values listed below.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec access_key_last_used = {
  region : string_type;
      [@ocaml.doc
        "The Amazon Web Services Region where this access key was most recently used. The value \
         for this field is \"N/A\" in the following situations:\n\n\
        \ {ul\n\
        \       {-  The user does not have an access key.\n\
        \           \n\
        \            }\n\
        \       {-  An access key exists but has not been used since IAM began tracking this \
         information.\n\
        \           \n\
        \            }\n\
        \       {-  There is no sign-in data associated with the user.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information about Amazon Web Services Regions, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html}Regions and endpoints} in the \
         Amazon Web Services General Reference.\n\
        \   "]
  service_name : string_type;
      [@ocaml.doc
        "The name of the Amazon Web Services service with which this access key was most recently \
         used. The value of this field is \"N/A\" in the following situations:\n\n\
        \ {ul\n\
        \       {-  The user does not have an access key.\n\
        \           \n\
        \            }\n\
        \       {-  An access key exists but has not been used since IAM started tracking this \
         information.\n\
        \           \n\
        \            }\n\
        \       {-  There is no sign-in data associated with the user.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  last_used_date : date_type option;
      [@ocaml.doc
        "The date and time, in {{:http://www.iso.org/iso/iso8601}ISO 8601 date-time format}, when \
         the access key was most recently used. This field is null in the following situations:\n\n\
        \ {ul\n\
        \       {-  The user does not have an access key.\n\
        \           \n\
        \            }\n\
        \       {-  An access key exists but has not been used since IAM began tracking this \
         information.\n\
        \           \n\
        \            }\n\
        \       {-  There is no sign-in data associated with the user.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains information about the last time an Amazon Web Services access key was used since IAM \
   began tracking this information on April 22, 2015.\n\n\
  \ This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccessKeyLastUsed.html}GetAccessKeyLastUsed} \
   operation.\n\
  \ "]

type nonrec get_access_key_last_used_response = {
  access_key_last_used : access_key_last_used option;
      [@ocaml.doc "Contains information about the last time the access key was used.\n"]
  user_name : existing_user_name_type option;
      [@ocaml.doc "The name of the IAM user that owns this access key.\n\n \n "]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccessKeyLastUsed.html}GetAccessKeyLastUsed} \
   request. It is also returned as a member of the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_AccessKeyMetaData.html}AccessKeyMetaData} \
   structure returned by the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html}ListAccessKeys} \
   action.\n"]

type nonrec get_access_key_last_used_request = {
  access_key_id : access_key_id_type;
      [@ocaml.doc
        "The identifier of an access key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec generate_service_last_accessed_details_response = {
  job_id : job_id_type option;
      [@ocaml.doc
        "The [JobId] that you can use in the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetails.html}GetServiceLastAccessedDetails} \
         or \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLastAccessedDetailsWithEntities.html}GetServiceLastAccessedDetailsWithEntities} \
         operations. The [JobId] returned by [GenerateServiceLastAccessedDetail] must be used by \
         the same role within a session, or by the same user when used to call \
         [GetServiceLastAccessedDetail].\n"]
}
[@@ocaml.doc ""]

type nonrec generate_service_last_accessed_details_request = {
  granularity : access_advisor_usage_granularity_type option;
      [@ocaml.doc
        "The level of detail that you want to generate. You can specify whether you want to \
         generate information about the last attempt to access services or actions. If you specify \
         service-level granularity, this operation generates only service data. If you specify \
         action-level granularity, it generates service and action data. If you don't include this \
         optional parameter, the operation generates service data.\n"]
  arn : arn_type;
      [@ocaml.doc
        "The ARN of the IAM resource (user, group, role, or managed policy) used to generate \
         information about when the resource was last used in an attempt to access an Amazon Web \
         Services service.\n"]
}
[@@ocaml.doc ""]

type nonrec generate_organizations_access_report_response = {
  job_id : job_id_type option;
      [@ocaml.doc
        "The job identifier that you can use in the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOrganizationsAccessReport.html}GetOrganizationsAccessReport} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec generate_organizations_access_report_request = {
  organizations_policy_id : organizations_policy_id_type option;
      [@ocaml.doc
        "The identifier of the Organizations service control policy (SCP). This parameter is \
         optional.\n\n\
        \ This ID is used to generate information about when an account principal that is limited \
         by the SCP attempted to access an Amazon Web Services service.\n\
        \ "]
  entity_path : organizations_entity_path_type;
      [@ocaml.doc
        "The path of the Organizations entity (root, OU, or account). You can build an entity path \
         using the known structure of your organization. For example, assume that your account ID \
         is [123456789012] and its parent OU ID is [ou-rge0-awsabcde]. The organization root ID is \
         [r-f6g7h8i9j0example] and your organization ID is [o-a1b2c3d4e5]. Your entity path is \
         [o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012].\n"]
}
[@@ocaml.doc ""]

type nonrec generate_credential_report_response = {
  description : report_state_description_type option;
      [@ocaml.doc "Information about the credential report.\n"]
  state : report_state_type option;
      [@ocaml.doc "Information about the state of the credential report.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_GenerateCredentialReport.html}GenerateCredentialReport} \
   request. \n"]

type nonrec feature_enabled_message = string [@@ocaml.doc ""]

type nonrec feature_enabled_exception = { message : feature_enabled_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request failed because outbound identity federation is already enabled for your Amazon Web \
   Services account. You cannot enable the feature multiple times. To fetch the current \
   configuration (including the unique issuer URL), use the [GetOutboundWebIdentityFederationInfo] \
   operation.\n"]

type nonrec enable_outbound_web_identity_federation_response = {
  issuer_identifier : string_type option;
      [@ocaml.doc
        "A unique issuer URL for your Amazon Web Services account that hosts the OpenID Connect \
         (OIDC) discovery endpoints at [/.well-known/openid-configuration and \
         /.well-known/jwks.json]. The OpenID Connect (OIDC) discovery endpoints contain \
         verification keys and metadata necessary for token verification.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_organizations_root_sessions_response = {
  enabled_features : features_list_type option;
      [@ocaml.doc "The features you have enabled for centralized root access.\n"]
  organization_id : organization_id_type option;
      [@ocaml.doc "The unique identifier (ID) of an organization.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_organizations_root_sessions_request = unit [@@ocaml.doc ""]

type nonrec caller_is_not_management_account_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because the account making the request is not the management account \
   for the organization.\n"]

type nonrec enable_organizations_root_credentials_management_response = {
  enabled_features : features_list_type option;
      [@ocaml.doc "The features you have enabled for centralized root access.\n"]
  organization_id : organization_id_type option;
      [@ocaml.doc "The unique identifier (ID) of an organization.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_organizations_root_credentials_management_request = unit [@@ocaml.doc ""]

type nonrec enable_mfa_device_request = {
  authentication_code2 : authentication_code_type;
      [@ocaml.doc
        "A subsequent authentication code emitted by the device.\n\n\
        \ The format for this parameter is a string of six digits.\n\
        \ \n\
        \   Submit your request immediately after generating the authentication codes. If you \
         generate the codes and then wait too long to submit the request, the MFA device \
         successfully associates with the user but the MFA device becomes out of sync. This \
         happens because time-based one-time passwords (TOTP) expire after a short period of time. \
         If this happens, you can \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html}resync \
         the device}.\n\
        \   \n\
        \    "]
  authentication_code1 : authentication_code_type;
      [@ocaml.doc
        "An authentication code emitted by the device. \n\n\
        \ The format for this parameter is a string of six digits.\n\
        \ \n\
        \   Submit your request immediately after generating the authentication codes. If you \
         generate the codes and then wait too long to submit the request, the MFA device \
         successfully associates with the user but the MFA device becomes out of sync. This \
         happens because time-based one-time passwords (TOTP) expire after a short period of time. \
         If this happens, you can \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html}resync \
         the device}.\n\
        \   \n\
        \    "]
  serial_number : serial_number_type;
      [@ocaml.doc
        "The serial number that uniquely identifies the MFA device. For virtual MFA devices, the \
         serial number is the device ARN.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: =,.\\@:/-\n\
        \ "]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the IAM user for whom you want to enable the MFA device.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec disable_organizations_root_sessions_response = {
  enabled_features : features_list_type option;
      [@ocaml.doc
        "The features you have enabled for centralized root access of member accounts in your \
         organization.\n"]
  organization_id : organization_id_type option;
      [@ocaml.doc "The unique identifier (ID) of an organization.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_organizations_root_sessions_request = unit [@@ocaml.doc ""]

type nonrec disable_organizations_root_credentials_management_response = {
  enabled_features : features_list_type option;
      [@ocaml.doc
        "The features enabled for centralized root access for member accounts in your organization.\n"]
  organization_id : organization_id_type option;
      [@ocaml.doc "The unique identifier (ID) of an organization.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_organizations_root_credentials_management_request = unit [@@ocaml.doc ""]

type nonrec detach_user_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to detach.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM user to detach the policy from.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detach_role_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to detach.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM role to detach the policy from.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detach_group_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to detach.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM group to detach the policy from.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_virtual_mfa_device_request = {
  serial_number : serial_number_type;
      [@ocaml.doc
        "The serial number that uniquely identifies the MFA device. For virtual MFA devices, the \
         serial number is the same as the ARN.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: =,.\\@:/-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_conflict_exception = { message : delete_conflict_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because it attempted to delete a resource that has attached \
   subordinate entities. The error message describes these entities.\n"]

type nonrec delete_user_request = {
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_user_policy_request = {
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name identifying the policy document to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) identifying the user that the policy is embedded in.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_user_permissions_boundary_request = {
  user_name : user_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM user from which you want to remove the \
         permissions boundary.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_signing_certificate_request = {
  certificate_id : certificate_id_type;
      [@ocaml.doc
        "The ID of the signing certificate to delete.\n\n\
        \ The format of this parameter, as described by its \
         {{:http://wikipedia.org/wiki/regex}regex} pattern, is a string of characters that can be \
         upper- or lower-cased letters or digits.\n\
        \ "]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user the signing certificate belongs to.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_service_specific_credential_request = {
  service_specific_credential_id : service_specific_credential_id;
      [@ocaml.doc
        "The unique identifier of the service-specific credential. You can get this value by \
         calling \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListServiceSpecificCredentials.html}ListServiceSpecificCredentials}.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the IAM user associated with the service-specific credential. If this value \
         is not specified, then the operation assumes the user whose credentials are used to call \
         the operation.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_service_linked_role_response = {
  deletion_task_id : deletion_task_id_type;
      [@ocaml.doc
        "The deletion task identifier that you can use to check the status of the deletion. This \
         identifier is returned in the format \n\
         {[\n\
         task/aws-service-role///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec delete_service_linked_role_request = {
  role_name : role_name_type; [@ocaml.doc "The name of the service-linked role to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_server_certificate_request = {
  server_certificate_name : server_certificate_name_type;
      [@ocaml.doc
        "The name of the server certificate you want to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_ssh_public_key_request = {
  ssh_public_key_id : public_key_id_type;
      [@ocaml.doc
        "The unique identifier for the SSH public key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the IAM user associated with the SSH public key.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_saml_provider_request = {
  saml_provider_arn : arn_type;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the SAML provider to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_role_request = {
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_role_policy_request = {
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name of the inline policy to delete from the specified IAM role.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) identifying the role that the policy is embedded in.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_role_permissions_boundary_request = {
  role_name : role_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM role from which you want to remove the \
         permissions boundary.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_policy_version_request = {
  version_id : policy_version_id_type;
      [@ocaml.doc
        "The policy version to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that consists of the lowercase letter 'v' followed by one or two \
         digits, and optionally followed by a period '.' and a string of letters and digits.\n\
        \ \n\
        \  For more information about managed policy versions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
         for managed policies} in the {i IAM User Guide}.\n\
        \  "]
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy from which you want to delete a version.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to delete.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_open_id_connect_provider_request = {
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM OpenID Connect provider resource object to \
         delete. You can get a list of OpenID Connect provider resource ARNs by using the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html}ListOpenIDConnectProviders} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_login_profile_request = {
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the user whose password you want to delete.\n\n\
        \ This parameter is optional. If no user name is included, it defaults to the principal \
         making the request. When you make this request with root user credentials, you must use \
         an {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html}AssumeRoot} \
         session to omit the user name.\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_instance_profile_request = {
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the instance profile to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_group_request = {
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the IAM group to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_group_policy_request = {
  policy_name : policy_name_type;
      [@ocaml.doc
        "The name identifying the policy document to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) identifying the group that the policy is embedded in.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_account_alias_request = {
  account_alias : account_alias_type;
      [@ocaml.doc
        "The name of the account alias to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of lowercase letters, digits, and dashes. You cannot \
         start or finish with a dash, nor can you have two dashes in a row.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_access_key_request = {
  access_key_id : access_key_id_type;
      [@ocaml.doc
        "The access key ID for the access key ID and secret access key you want to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters that can consist of any upper or lowercased letter or digit.\n\
        \ "]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user whose access key pair you want to delete.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec deactivate_mfa_device_request = {
  serial_number : serial_number_type;
      [@ocaml.doc
        "The serial number that uniquely identifies the MFA device. For virtual MFA devices, the \
         serial number is the device ARN.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: =,.\\@:/-\n\
        \ "]
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the user whose MFA device you want to deactivate.\n\n\
        \ This parameter is optional. If no user name is included, it defaults to the principal \
         making the request. When you make this request with root user credentials, you must use \
         an {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html}AssumeRoot} \
         session to omit the user name.\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_virtual_mfa_device_response = {
  virtual_mfa_device : virtual_mfa_device;
      [@ocaml.doc "A structure containing details about the new virtual MFA device.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateVirtualMFADevice.html}CreateVirtualMFADevice} \
   request. \n"]

type nonrec create_virtual_mfa_device_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new IAM virtual MFA device. Each tag \
         consists of a key name and an associated value. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  virtual_mfa_device_name : virtual_mfa_device_name;
      [@ocaml.doc
        "The name of the virtual MFA device, which must be unique. Use with path to uniquely \
         identify a virtual MFA device.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  path : path_type option;
      [@ocaml.doc
        " The path for the virtual MFA device. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/).\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_user_response = {
  user : user option; [@ocaml.doc "A structure with details about the new IAM user.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateUser.html}CreateUser} request. \n"]

type nonrec create_user_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new user. Each tag consists of a key name \
         and an associated value. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  permissions_boundary : arn_type option;
      [@ocaml.doc
        "The ARN of the managed policy that is used to set the permissions boundary for the user.\n\n\
        \ A permissions boundary policy defines the maximum permissions that identity-based \
         policies can grant to an entity, but does not grant permissions. Permissions boundaries \
         do not define the maximum permissions that a resource-based policy can grant to an \
         entity. To learn more, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} in the {i IAM User Guide}.\n\
        \ \n\
        \  For more information about policy types, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types}Policy \
         types } in the {i IAM User Guide}.\n\
        \  "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the user to create.\n\n\
        \ IAM user, group, role, and policy names must be unique within the account. Names are not \
         distinguished by case. For example, you cannot create resources named both \"MyResource\" \
         and \"myresource\".\n\
        \ "]
  path : path_type option;
      [@ocaml.doc
        " The path for the user name. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/).\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_service_specific_credential_response = {
  service_specific_credential : service_specific_credential option;
      [@ocaml.doc
        "A structure that contains information about the newly created service-specific \
         credential.\n\n\
        \  This is the only time that the password for this credential set is available. It cannot \
         be recovered later. Instead, you must reset the password with \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ResetServiceSpecificCredential.html}ResetServiceSpecificCredential}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_service_specific_credential_request = {
  credential_age_days : credential_age_days option;
      [@ocaml.doc
        "The number of days until the service specific credential expires. This field is only \
         valid for services that support long-term API keys and must be a positive integer. When \
         not specified, the credential will not expire.\n\n\
        \ To see which services support long-term API keys, refer to \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_api_keys_for_aws_services.html}API \
         keys for Amazon Web Services services} in the {i IAM User Guide}.\n\
        \ "]
  service_name : service_name;
      [@ocaml.doc
        "The name of the Amazon Web Services service that is to be associated with the \
         credentials. The service you specify here is the only service that can be accessed using \
         these credentials.\n"]
  user_name : user_name_type;
      [@ocaml.doc
        "The name of the IAM user that is to be associated with the credentials. The new \
         service-specific credentials have the same permissions as the associated user except that \
         they can be used only to access the specified service.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_service_linked_role_response = {
  role : role option;
      [@ocaml.doc
        "A {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_Role.html}Role} object that \
         contains details about the newly created role.\n"]
}
[@@ocaml.doc ""]

type nonrec create_service_linked_role_request = {
  custom_suffix : custom_suffix_type option;
      [@ocaml.doc
        "\n\n\
        \ A string that you provide, which is combined with the service-provided prefix to form \
         the complete role name. If you make multiple requests for the same service, then you must \
         supply a different [CustomSuffix] for each request. Otherwise the request fails with a \
         duplicate role name error. For example, you could add [-1] or [-debug] to the suffix.\n\
        \ \n\
        \  Some services do not support the [CustomSuffix] parameter. If you provide an optional \
         suffix and the operation fails, try the operation again without the suffix.\n\
        \  "]
  description : role_description_type option; [@ocaml.doc "The description of the role.\n"]
  aws_service_name : group_name_type;
      [@ocaml.doc
        "The service principal for the Amazon Web Services service to which this role is attached. \
         You use a string similar to a URL but without the http:// in front. For example: \
         [elasticbeanstalk.amazonaws.com]. \n\n\
        \ Service principals are unique and case-sensitive. To find the exact service principal \
         for your service-linked role, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html}Amazon \
         Web Services services that work with IAM} in the {i IAM User Guide}. Look for the \
         services that have {b Yes }in the {b Service-Linked Role} column. Choose the {b Yes} link \
         to view the service-linked role documentation for that service.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_saml_provider_response = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the new IAM SAML provider. The returned list of tags \
         is sorted by tag key. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  saml_provider_arn : arn_type option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateSAMLProvider.html}CreateSAMLProvider} \
   request. \n"]

type nonrec create_saml_provider_request = {
  add_private_key : private_key_type option;
      [@ocaml.doc
        "The private key generated from your external identity provider. The private key must be a \
         .pem file that uses AES-GCM or AES-CBC encryption algorithm to decrypt SAML assertions.\n"]
  assertion_encryption_mode : assertion_encryption_mode_type option;
      [@ocaml.doc "Specifies the encryption setting for the SAML provider.\n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new IAM SAML provider. Each tag consists of \
         a key name and an associated value. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  name : saml_provider_name_type;
      [@ocaml.doc
        "The name of the provider to create.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  saml_metadata_document : saml_metadata_document_type;
      [@ocaml.doc
        "An XML document generated by an identity provider (IdP) that supports SAML 2.0. The \
         document includes the issuer's name, expiration information, and keys that can be used to \
         validate the SAML authentication response (assertions) that are received from the IdP. \
         You must generate the metadata document using the identity management software that is \
         used as your organization's IdP.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html}About \
         SAML 2.0-based federation} in the {i IAM User Guide} \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_role_response = {
  role : role; [@ocaml.doc "A structure containing details about the new role.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} request. \n"]

type nonrec create_role_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new role. Each tag consists of a key name \
         and an associated value. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  permissions_boundary : arn_type option;
      [@ocaml.doc
        "The ARN of the managed policy that is used to set the permissions boundary for the role.\n\n\
        \ A permissions boundary policy defines the maximum permissions that identity-based \
         policies can grant to an entity, but does not grant permissions. Permissions boundaries \
         do not define the maximum permissions that a resource-based policy can grant to an \
         entity. To learn more, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
         boundaries for IAM entities} in the {i IAM User Guide}.\n\
        \ \n\
        \  For more information about policy types, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types}Policy \
         types } in the {i IAM User Guide}.\n\
        \  "]
  max_session_duration : role_max_session_duration_type option;
      [@ocaml.doc
        "The maximum session duration (in seconds) that you want to set for the specified role. If \
         you do not specify a value for this setting, the default value of one hour is applied. \
         This setting can have a value from 1 hour to 12 hours.\n\n\
        \ Anyone who assumes the role from the CLI or API can use the [DurationSeconds] API \
         parameter or the [duration-seconds] CLI parameter to request a longer session. The \
         [MaxSessionDuration] setting determines the maximum duration that can be requested using \
         the [DurationSeconds] parameter. If users don't specify a value for the [DurationSeconds] \
         parameter, their security credentials are valid for one hour by default. This applies \
         when you use the [AssumeRole*] API operations or the [assume-role*] CLI operations but \
         does not apply when you use those operations to create a console URL. For more \
         information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html}Using IAM roles} in \
         the {i IAM User Guide}.\n\
        \ "]
  description : role_description_type option; [@ocaml.doc "A description of the role.\n"]
  assume_role_policy_document : policy_document_type;
      [@ocaml.doc
        "The trust relationship policy document that grants an entity permission to assume the \
         role.\n\n\
        \ In IAM, you must provide a JSON policy that has been converted to a string. However, for \
         CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML \
         format. CloudFormation always converts a YAML policy to JSON format before submitting it \
         to IAM.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \             \n\
        \              }\n\
        \         {-  The printable characters in the Basic Latin and Latin-1 Supplement character \
         set (through [\\u00FF])\n\
        \             \n\
        \              }\n\
        \         {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \             \n\
        \              }\n\
        \         }\n\
        \    Upon success, the response includes the same trust policy in JSON format.\n\
        \   "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to create.\n\n\
        \ IAM user, group, role, and policy names must be unique within the account. Names are not \
         distinguished by case. For example, you cannot create resources named both \"MyResource\" \
         and \"myresource\".\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \  "]
  path : path_type option;
      [@ocaml.doc
        " The path to the role. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/).\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_policy_version_response = {
  policy_version : policy_version option;
      [@ocaml.doc "A structure containing details about the new policy version.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicyVersion.html}CreatePolicyVersion} \
   request. \n"]

type nonrec create_policy_version_request = {
  set_as_default : boolean_type option;
      [@ocaml.doc
        "Specifies whether to set this version as the policy's default version.\n\n\
        \ When this parameter is [true], the new policy version becomes the operative version. \
         That is, it becomes the version that is in effect for the IAM users, groups, and roles \
         that the policy is attached to.\n\
        \ \n\
        \  For more information about managed policy versions, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html}Versioning \
         for managed policies} in the {i IAM User Guide}.\n\
        \  "]
  policy_document : policy_document_type;
      [@ocaml.doc
        "The JSON policy document that you want to use as the content for this new version of the \
         policy.\n\n\
        \ You must provide policies in JSON format in IAM. However, for CloudFormation templates \
         formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation \
         always converts a YAML policy to JSON format before submitting it to IAM.\n\
        \ \n\
        \  The maximum length of the policy document that you can pass in this operation, \
         including whitespace, is listed below. To view the maximum character counts of a managed \
         policy with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \  \n\
        \   The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \   \n\
        \    {ul\n\
        \          {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \              \n\
        \               }\n\
        \          {-  The printable characters in the Basic Latin and Latin-1 Supplement \
         character set (through [\\u00FF])\n\
        \              \n\
        \               }\n\
        \          {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and carriage \
         return ([\\u000D])\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy to which you want to add a new version.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_policy_response = {
  policy : policy option; [@ocaml.doc "A structure containing details about the new policy.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html}CreatePolicy} \
   request. \n"]

type nonrec create_policy_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new IAM customer managed policy. Each tag \
         consists of a key name and an associated value. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  description : policy_description_type option;
      [@ocaml.doc
        "A friendly description of the policy.\n\n\
        \ Typically used to store information about the permissions defined in the policy. For \
         example, \"Grants access to production DynamoDB tables.\"\n\
        \ \n\
        \  The policy description is immutable. After a value is assigned, it cannot be changed.\n\
        \  "]
  policy_document : policy_document_type;
      [@ocaml.doc
        "The JSON policy document that you want to use as the content for the new policy.\n\n\
        \ You must provide policies in JSON format in IAM. However, for CloudFormation templates \
         formatted in YAML, you can provide the policy in JSON or YAML format. CloudFormation \
         always converts a YAML policy to JSON format before submitting it to IAM.\n\
        \ \n\
        \  The maximum length of the policy document that you can pass in this operation, \
         including whitespace, is listed below. To view the maximum character counts of a managed \
         policy with no whitespaces, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length}IAM \
         and STS character quotas}.\n\
        \  \n\
        \   To learn more about JSON policy grammar, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_grammar.html}Grammar \
         of the IAM JSON policy language} in the {i IAM User Guide}. \n\
        \   \n\
        \    The {{:http://wikipedia.org/wiki/regex}regex pattern} used to validate this parameter \
         is a string of characters consisting of the following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Any printable ASCII character ranging from the space character ([\\u0020]) \
         through the end of the ASCII character range\n\
        \               \n\
        \                }\n\
        \           {-  The printable characters in the Basic Latin and Latin-1 Supplement \
         character set (through [\\u00FF])\n\
        \               \n\
        \                }\n\
        \           {-  The special characters tab ([\\u0009]), line feed ([\\u000A]), and \
         carriage return ([\\u000D])\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  path : policy_path_type option;
      [@ocaml.doc
        "The path for the policy.\n\n\
        \ For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\
        \ \n\
        \  This parameter is optional. If it is not included, it defaults to a slash (/).\n\
        \  \n\
        \   This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) \
         a string of characters consisting of either a forward slash (/) by itself or a string \
         that must begin and end with forward slashes. In addition, it can contain any ASCII \
         character from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most \
         punctuation characters, digits, and upper and lowercased letters.\n\
        \   \n\
        \     You cannot use an asterisk (*) in the path name.\n\
        \     \n\
        \      "]
  policy_name : policy_name_type;
      [@ocaml.doc
        "The friendly name of the policy.\n\n\
        \ IAM user, group, role, and policy names must be unique within the account. Names are not \
         distinguished by case. For example, you cannot create resources named both \"MyResource\" \
         and \"myresource\".\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_open_id_connect_provider_response = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that are attached to the new IAM OIDC provider. The returned list of tags \
         is sorted by tag key. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM resources} \
         in the {i IAM User Guide}.\n"]
  open_id_connect_provider_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that is created. \
         For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_OpenIDConnectProviderListEntry.html}OpenIDConnectProviderListEntry}. \n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html}CreateOpenIDConnectProvider} \
   request. \n"]

type nonrec create_open_id_connect_provider_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the new IAM OpenID Connect (OIDC) provider. \
         Each tag consists of a key name and an associated value. For more information about \
         tagging, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  thumbprint_list : thumbprint_list_type option;
      [@ocaml.doc
        "A list of server certificate thumbprints for the OpenID Connect (OIDC) identity \
         provider's server certificates. Typically this list includes only one entry. However, IAM \
         lets you have up to five thumbprints for an OIDC provider. This lets you maintain \
         multiple thumbprints if the identity provider is rotating certificates.\n\n\
        \ This parameter is optional. If it is not included, IAM will retrieve and use the top \
         intermediate certificate authority (CA) thumbprint of the OpenID Connect identity \
         provider server certificate.\n\
        \ \n\
        \  The server certificate thumbprint is the hex-encoded SHA-1 hash value of the X.509 \
         certificate used by the domain where the OpenID Connect provider makes its keys \
         available. It is always a 40-character string.\n\
        \  \n\
        \   For example, assume that the OIDC provider is [server.example.com] and the provider \
         stores its keys at https://keys.server.example.com/openid-connect. In that case, the \
         thumbprint string would be the hex-encoded SHA-1 hash value of the certificate used by \
         [https://keys.server.example.com.] \n\
        \   \n\
        \    For more information about obtaining the OIDC provider thumbprint, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/identity-providers-oidc-obtain-thumbprint.html}Obtaining \
         the thumbprint for an OpenID Connect provider} in the {i IAM user Guide}.\n\
        \    \n\
        \      If your OIDC provider's discovery endpoint and JWKS endpoint ([jwks_uri]) use \
         different certificates or hosts, include the thumbprints for both endpoints in this list.\n\
        \      \n\
        \       "]
  client_id_list : client_id_list_type option;
      [@ocaml.doc
        "Provides a list of client IDs, also known as audiences. When a mobile or web app \
         registers with an OpenID Connect provider, they establish a value that identifies the \
         application. This is the value that's sent as the [client_id] parameter on OAuth \
         requests.\n\n\
        \ You can register multiple client IDs with the same provider. For example, you might have \
         multiple applications that use the same OIDC provider. You cannot register more than 100 \
         client IDs with a single IAM OIDC provider.\n\
        \ \n\
        \  There is no defined format for a client ID. The [CreateOpenIDConnectProviderRequest] \
         operation accepts client IDs up to 255 characters long.\n\
        \  "]
  url : open_id_connect_provider_url_type;
      [@ocaml.doc
        "The URL of the identity provider. The URL must begin with [https://] and should \
         correspond to the [iss] claim in the provider's OpenID Connect ID tokens. Per the OIDC \
         standard, path components are allowed but query parameters are not. Typically the URL \
         consists of only a hostname, like [https://server.example.org] or [https://example.com]. \
         The URL should not contain a port number. \n\n\
        \ You cannot register the same provider multiple times in a single Amazon Web Services \
         account. If you try to submit a URL that has already been used for an OpenID Connect \
         provider in the Amazon Web Services account, you will get an error.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_login_profile_response = {
  login_profile : login_profile;
      [@ocaml.doc "A structure containing the user name and password create date.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateLoginProfile.html}CreateLoginProfile} \
   request. \n"]

type nonrec create_login_profile_request = {
  password_reset_required : boolean_type option;
      [@ocaml.doc "Specifies whether the user is required to set a new password on next sign-in.\n"]
  password : password_type option;
      [@ocaml.doc
        "The new password for the user.\n\n\
        \ This parameter must be omitted when you make the request with an \
         {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html}AssumeRoot} \
         session. It is required in all other cases.\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of characters. That string can include almost any printable ASCII \
         character from the space ([\\u0020]) through the end of the ASCII character range \
         ([\\u00FF]). You can also include the tab ([\\u0009]), line feed ([\\u000A]), and \
         carriage return ([\\u000D]) characters. Any of these characters are valid in a password. \
         However, many tools, such as the Amazon Web Services Management Console, might restrict \
         the ability to type certain characters because they have special meaning within that tool.\n\
        \  "]
  user_name : user_name_type option;
      [@ocaml.doc
        "The name of the IAM user to create a password for. The user must already exist.\n\n\
        \ This parameter is optional. If no user name is included, it defaults to the principal \
         making the request. When you make this request with root user credentials, you must use \
         an {{:https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoot.html}AssumeRoot} \
         session to omit the user name.\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_instance_profile_response = {
  instance_profile : instance_profile;
      [@ocaml.doc "A structure containing details about the new instance profile.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateInstanceProfile.html}CreateInstanceProfile} \
   request. \n"]

type nonrec create_instance_profile_request = {
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags that you want to attach to the newly created IAM instance profile. Each \
         tag consists of a key name and an associated value. For more information about tagging, \
         see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html}Tagging IAM \
         resources} in the {i IAM User Guide}.\n\n\
        \  If any one of the tags is invalid or if you exceed the allowed maximum number of tags, \
         then the entire request fails and the resource is not created.\n\
        \  \n\
        \   "]
  path : path_type option;
      [@ocaml.doc
        " The path to the instance profile. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         Identifiers} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/).\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \  "]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the instance profile to create.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_group_response = {
  group : group; [@ocaml.doc "A structure containing details about the new group.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateGroup.html}CreateGroup} \
   request. \n"]

type nonrec create_group_request = {
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group to create. Do not include the path in this value.\n\n\
        \ IAM user, group, role, and policy names must be unique within the account. Names are not \
         distinguished by case. For example, you cannot create resources named both \"MyResource\" \
         and \"myresource\".\n\
        \ "]
  path : path_type option;
      [@ocaml.doc
        " The path to the group. For more information about paths, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html}IAM \
         identifiers} in the {i IAM User Guide}.\n\n\
        \ This parameter is optional. If it is not included, it defaults to a slash (/).\n\
        \ \n\
        \  This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of either a forward slash (/) by itself or a string that \
         must begin and end with forward slashes. In addition, it can contain any ASCII character \
         from the ! ([\\u0021]) through the DEL character ([\\u007F]), including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_delegation_request_response = {
  delegation_request_id : delegation_request_id_type option;
      [@ocaml.doc "The unique identifier for the created delegation request.\n"]
  console_deep_link : console_deep_link_type option;
      [@ocaml.doc
        "A deep link URL to the Amazon Web Services Management Console for managing the delegation \
         request.\n\n\
        \ For a console based workflow, partners should redirect the customer to this URL. If the \
         customer is not logged in to any Amazon Web Services account, the Amazon Web Services \
         workflow will automatically direct the customer to log in and then display the delegation \
         request approval page.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_delegation_request_request = {
  only_send_by_owner : boolean_type option;
      [@ocaml.doc
        "Specifies whether the delegation token should only be sent by the owner.\n\n\
        \ This flag prevents any party other than the owner from calling [SendDelegationToken] API \
         for this delegation request. This behavior becomes useful when the delegation request \
         owner needs to be present for subsequent partner interactions, but the delegation request \
         was sent to a more privileged user for approval due to the owner lacking sufficient \
         delegation permissions. \n\
        \ "]
  session_duration : session_duration_type;
      [@ocaml.doc
        "The duration for which the delegated session should remain active, in seconds.\n\n\
        \ The active time window for the session starts when the customer calls the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_SendDelegationToken.html}SendDelegationToken} \
         API.\n\
        \ "]
  notification_channel : notification_channel_type;
      [@ocaml.doc
        "The notification channel for updates about the delegation request.\n\n\
        \ At this time,only SNS topic ARNs are accepted for notification. This topic ARN must have \
         a resource policy granting [SNS:Publish] permission to the IAM service principal \
         ([iam.amazonaws.com]). See \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation-partner-guide.html}partner \
         onboarding documentation} for more details. \n\
        \ "]
  redirect_url : redirect_url_type option;
      [@ocaml.doc
        "The URL to redirect to after the delegation request is processed.\n\n\
        \ This URL is used by the IAM console to show a link to the customer to re-load the \
         partner workflow.\n\
        \ "]
  requestor_workflow_id : requestor_workflow_id_type;
      [@ocaml.doc
        "The workflow ID associated with the requestor.\n\n\
        \ This is the unique identifier on the partner side that can be used to track the progress \
         of the request.\n\
        \ \n\
        \  IAM maintains a uniqueness check on this workflow id for each request - if a workflow \
         id for an existing request is passed, this API call will fail.\n\
        \  "]
  request_message : request_message_type option;
      [@ocaml.doc
        "A message explaining the reason for the delegation request.\n\n\
        \ Requesters can utilize this field to add a custom note to the delegation request. This \
         field is different from the description such that this is to be utilized for a custom \
         messaging on a case-by-case basis.\n\
        \ \n\
        \  For example, if the current delegation request is in response to a previous request \
         being rejected, this explanation can be added to the request via this field.\n\
        \  "]
  permissions : delegation_permission;
      [@ocaml.doc "The permissions to be delegated in this delegation request.\n"]
  description : delegation_request_description_type;
      [@ocaml.doc "A description of the delegation request.\n"]
  owner_account_id : account_id_type option;
      [@ocaml.doc
        "The Amazon Web Services account ID this delegation request is targeted to.\n\n\
        \ If the account ID is not known, this parameter can be omitted, resulting in a request \
         that can be associated by any account. If the account ID passed, then the created \
         delegation request can only be associated with an identity of that target account.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_account_alias_request = {
  account_alias : account_alias_type;
      [@ocaml.doc
        "The account alias to create.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of lowercase letters, digits, and dashes. You cannot \
         start or finish with a dash, nor can you have two dashes in a row.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec access_key = {
  create_date : date_type option; [@ocaml.doc "The date when the access key was created.\n"]
  secret_access_key : access_key_secret_type; [@ocaml.doc "The secret key used to sign requests.\n"]
  status : status_type;
      [@ocaml.doc
        "The status of the access key. [Active] means that the key is valid for API calls, while \
         [Inactive] means it is not. \n"]
  access_key_id : access_key_id_type; [@ocaml.doc "The ID for this access key.\n"]
  user_name : user_name_type;
      [@ocaml.doc "The name of the IAM user that the access key is associated with.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Web Services access key.\n\n\
  \  This data type is used as a response element in the \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateAccessKey.html}CreateAccessKey} \
   and \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html}ListAccessKeys} \
   operations. \n\
  \ \n\
  \   The [SecretAccessKey] value is returned only in response to \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateAccessKey.html}CreateAccessKey}. \
   You can get a secret access key only when you first create an access key; you cannot recover \
   the secret access key later. If you lose a secret access key, you must create a new access key.\n\
  \   \n\
  \    "]

type nonrec create_access_key_response = {
  access_key : access_key; [@ocaml.doc "A structure with details about the access key.\n"]
}
[@@ocaml.doc
  "Contains the response to a successful \
   {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateAccessKey.html}CreateAccessKey} \
   request. \n"]

type nonrec create_access_key_request = {
  user_name : existing_user_name_type option;
      [@ocaml.doc
        "The name of the IAM user that the new key will belong to.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec change_password_request = {
  new_password : password_type;
      [@ocaml.doc
        "The new password. The new password must conform to the Amazon Web Services account's \
         password policy, if one exists.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of characters. That string can include almost any printable ASCII \
         character from the space ([\\u0020]) through the end of the ASCII character range \
         ([\\u00FF]). You can also include the tab ([\\u0009]), line feed ([\\u000A]), and \
         carriage return ([\\u000D]) characters. Any of these characters are valid in a password. \
         However, many tools, such as the Amazon Web Services Management Console, might restrict \
         the ability to type certain characters because they have special meaning within that tool.\n\
        \ "]
  old_password : password_type; [@ocaml.doc "The IAM user's current password.\n"]
}
[@@ocaml.doc ""]

type nonrec attach_user_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to attach.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  user_name : user_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the IAM user to attach the policy to.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec attach_role_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to attach.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  role_name : role_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the role to attach the policy to.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec attach_group_policy_request = {
  policy_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM policy you want to attach.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name (friendly name, not ARN) of the group to attach the policy to.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec associate_delegation_request_request = {
  delegation_request_id : delegation_request_id_type;
      [@ocaml.doc "The unique identifier of the delegation request to associate.\n"]
}
[@@ocaml.doc ""]

type nonrec add_user_to_group_request = {
  user_name : existing_user_name_type;
      [@ocaml.doc
        "The name of the user to add.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec add_role_to_instance_profile_request = {
  role_name : role_name_type;
      [@ocaml.doc
        "The name of the role to add.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
  instance_profile_name : instance_profile_name_type;
      [@ocaml.doc
        "The name of the instance profile to update.\n\n\
        \ This parameter allows (through its {{:http://wikipedia.org/wiki/regex}regex pattern}) a \
         string of characters consisting of upper and lowercase alphanumeric characters with no \
         spaces. You can also include any of the following characters: _+=,.\\@-\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec add_client_id_to_open_id_connect_provider_request = {
  client_i_d : client_id_type;
      [@ocaml.doc
        "The client ID (also known as audience) to add to the IAM OpenID Connect provider resource.\n"]
  open_id_connect_provider_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM OpenID Connect (OIDC) provider resource to add \
         the client ID to. You can get a list of OIDC provider ARNs by using the \
         {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListOpenIDConnectProviders.html}ListOpenIDConnectProviders} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_delegation_request_request = {
  delegation_request_id : delegation_request_id_type;
      [@ocaml.doc "The unique identifier of the delegation request to accept.\n"]
}
[@@ocaml.doc ""]
