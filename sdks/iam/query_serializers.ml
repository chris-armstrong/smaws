open Types

let virtual_mfa_device_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let serial_number_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let bootstrap_datum_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v
let path_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let user_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let arn_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let date_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let permissions_boundary_attachment_type_to_query path (x : permissions_boundary_attachment_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Policy -> "PermissionsBoundaryPolicy")

let attached_permissions_boundary_to_query path (x : attached_permissions_boundary) =
  List.concat
    [
      (match x.permissions_boundary_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "PermissionsBoundaryArn" ]) v);
      (match x.permissions_boundary_type with
      | None -> []
      | Some v ->
          permissions_boundary_attachment_type_to_query
            (List.append path [ "PermissionsBoundaryType" ])
            v);
    ]

let tag_key_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_value_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_value_type_to_query (List.append path [ "Value" ]) x.value;
      tag_key_type_to_query (List.append path [ "Key" ]) x.key;
    ]

let tag_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let user_to_query path (x : user) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.permissions_boundary with
      | None -> []
      | Some v ->
          attached_permissions_boundary_to_query (List.append path [ "PermissionsBoundary" ]) v);
      (match x.password_last_used with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "PasswordLastUsed" ]) v);
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
      id_type_to_query (List.append path [ "UserId" ]) x.user_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
      path_type_to_query (List.append path [ "Path" ]) x.path;
    ]

let virtual_mfa_device_to_query path (x : virtual_mfa_device) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.enable_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "EnableDate" ]) v);
      (match x.user with None -> [] | Some v -> user_to_query (List.append path [ "User" ]) v);
      (match x.qr_code_pn_g with
      | None -> []
      | Some v -> bootstrap_datum_to_query (List.append path [ "QRCodePNG" ]) v);
      (match x.base32_string_seed with
      | None -> []
      | Some v -> bootstrap_datum_to_query (List.append path [ "Base32StringSeed" ]) v);
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
    ]

let virtual_mfa_device_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" virtual_mfa_device_to_query path xs

let user_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_to_query path xs

let policy_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_document_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_detail_to_query path (x : policy_detail) =
  List.concat
    [
      (match x.policy_document with
      | None -> []
      | Some v -> policy_document_type_to_query (List.append path [ "PolicyDocument" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_type_to_query (List.append path [ "PolicyName" ]) v);
    ]

let policy_detail_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_detail_to_query path xs

let group_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let group_name_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" group_name_type_to_query path xs

let attached_policy_to_query path (x : attached_policy) =
  List.concat
    [
      (match x.policy_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "PolicyArn" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_type_to_query (List.append path [ "PolicyName" ]) v);
    ]

let attached_policies_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" attached_policy_to_query path xs

let user_detail_to_query path (x : user_detail) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.permissions_boundary with
      | None -> []
      | Some v ->
          attached_permissions_boundary_to_query (List.append path [ "PermissionsBoundary" ]) v);
      (match x.attached_managed_policies with
      | None -> []
      | Some v ->
          attached_policies_list_type_to_query (List.append path [ "AttachedManagedPolicies" ]) v);
      (match x.group_list with
      | None -> []
      | Some v -> group_name_list_type_to_query (List.append path [ "GroupList" ]) v);
      (match x.user_policy_list with
      | None -> []
      | Some v -> policy_detail_list_type_to_query (List.append path [ "UserPolicyList" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
      (match x.user_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "UserId" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let user_detail_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" user_detail_to_query path xs

let unrecognized_public_key_encoding_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let unmodifiable_entity_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let thumbprint_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let thumbprint_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" thumbprint_type_to_query path xs

let tag_key_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_type_to_query path xs

let summary_value_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let summary_state_type_to_query path (x : summary_state_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | FAILED -> "FAILED"
    | NOT_SUPPORTED -> "NOT_SUPPORTED"
    | NOT_AVAILABLE -> "NOT_AVAILABLE"
    | AVAILABLE -> "AVAILABLE")

let summary_key_type_to_query path (x : summary_key_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | RolesQuota -> "RolesQuota"
    | Roles -> "Roles"
    | RolePolicySizeQuota -> "RolePolicySizeQuota"
    | Providers -> "Providers"
    | InstanceProfilesQuota -> "InstanceProfilesQuota"
    | InstanceProfiles -> "InstanceProfiles"
    | AssumeRolePolicySizeQuota -> "AssumeRolePolicySizeQuota"
    | GlobalEndpointTokenVersion -> "GlobalEndpointTokenVersion"
    | VersionsPerPolicyQuota -> "VersionsPerPolicyQuota"
    | PolicyVersionsInUseQuota -> "PolicyVersionsInUseQuota"
    | PolicyVersionsInUse -> "PolicyVersionsInUse"
    | PolicySizeQuota -> "PolicySizeQuota"
    | PoliciesQuota -> "PoliciesQuota"
    | Policies -> "Policies"
    | AttachedPoliciesPerUserQuota -> "AttachedPoliciesPerUserQuota"
    | AttachedPoliciesPerRoleQuota -> "AttachedPoliciesPerRoleQuota"
    | AttachedPoliciesPerGroupQuota -> "AttachedPoliciesPerGroupQuota"
    | AccountSigningCertificatesPresent -> "AccountSigningCertificatesPresent"
    | AccountPasswordPresent -> "AccountPasswordPresent"
    | AccountAccessKeysPresent -> "AccountAccessKeysPresent"
    | AccountMFAEnabled -> "AccountMFAEnabled"
    | MFADevicesInUse -> "MFADevicesInUse"
    | MFADevices -> "MFADevices"
    | AccessKeysPerUserQuota -> "AccessKeysPerUserQuota"
    | SigningCertificatesPerUserQuota -> "SigningCertificatesPerUserQuota"
    | GroupsPerUserQuota -> "GroupsPerUserQuota"
    | GroupPolicySizeQuota -> "GroupPolicySizeQuota"
    | UserPolicySizeQuota -> "UserPolicySizeQuota"
    | ServerCertificatesQuota -> "ServerCertificatesQuota"
    | ServerCertificates -> "ServerCertificates"
    | GroupsQuota -> "GroupsQuota"
    | Groups -> "Groups"
    | UsersQuota -> "UsersQuota"
    | Users -> "Users")

let summary_map_type_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" summary_key_type_to_query
    summary_value_type_to_query path pairs

let summary_content_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let string_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let status_type_to_query path (x : status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Expired -> "Expired" | Inactive -> "Inactive" | Active -> "Active")

let state_type_to_query path (x : state_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | EXPIRED -> "EXPIRED"
    | REJECTED -> "REJECTED"
    | ACCEPTED -> "ACCEPTED"
    | FINALIZED -> "FINALIZED"
    | PENDING_APPROVAL -> "PENDING_APPROVAL"
    | ASSIGNED -> "ASSIGNED"
    | UNASSIGNED -> "UNASSIGNED")

let sort_key_type_to_query path (x : sort_key_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | LAST_AUTHENTICATED_TIME_DESCENDING -> "LAST_AUTHENTICATED_TIME_DESCENDING"
    | LAST_AUTHENTICATED_TIME_ASCENDING -> "LAST_AUTHENTICATED_TIME_ASCENDING"
    | SERVICE_NAMESPACE_DESCENDING -> "SERVICE_NAMESPACE_DESCENDING"
    | SERVICE_NAMESPACE_ASCENDING -> "SERVICE_NAMESPACE_ASCENDING")

let session_duration_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let service_user_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_specific_credential_id_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_password_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_not_supported_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_namespace_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_namespace_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" service_namespace_type_to_query path
    xs

let service_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let service_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_failure_exception_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_credential_secret_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_credential_alias_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let server_certificate_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let server_certificate_metadata_to_query path (x : server_certificate_metadata) =
  List.concat
    [
      (match x.expiration with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "Expiration" ]) v);
      (match x.upload_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "UploadDate" ]) v);
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
      id_type_to_query (List.append path [ "ServerCertificateId" ]) x.server_certificate_id;
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
      path_type_to_query (List.append path [ "Path" ]) x.path;
    ]

let server_certificate_metadata_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" server_certificate_metadata_to_query
    path xs

let role_permission_restriction_arn_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" arn_type_to_query path xs

let role_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let role_max_session_duration_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let role_description_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let role_last_used_to_query path (x : role_last_used) =
  List.concat
    [
      (match x.region with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "Region" ]) v);
      (match x.last_used_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "LastUsedDate" ]) v);
    ]

let role_to_query path (x : role) =
  List.concat
    [
      (match x.role_last_used with
      | None -> []
      | Some v -> role_last_used_to_query (List.append path [ "RoleLastUsed" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.permissions_boundary with
      | None -> []
      | Some v ->
          attached_permissions_boundary_to_query (List.append path [ "PermissionsBoundary" ]) v);
      (match x.max_session_duration with
      | None -> []
      | Some v ->
          role_max_session_duration_type_to_query (List.append path [ "MaxSessionDuration" ]) v);
      (match x.description with
      | None -> []
      | Some v -> role_description_type_to_query (List.append path [ "Description" ]) v);
      (match x.assume_role_policy_document with
      | None -> []
      | Some v -> policy_document_type_to_query (List.append path [ "AssumeRolePolicyDocument" ]) v);
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
      id_type_to_query (List.append path [ "RoleId" ]) x.role_id;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
      path_type_to_query (List.append path [ "Path" ]) x.path;
    ]

let role_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" role_to_query path xs

let instance_profile_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let instance_profile_to_query path (x : instance_profile) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      role_list_type_to_query (List.append path [ "Roles" ]) x.roles;
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
      id_type_to_query (List.append path [ "InstanceProfileId" ]) x.instance_profile_id;
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
      path_type_to_query (List.append path [ "Path" ]) x.path;
    ]

let instance_profile_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_profile_to_query path xs

let role_detail_to_query path (x : role_detail) =
  List.concat
    [
      (match x.role_last_used with
      | None -> []
      | Some v -> role_last_used_to_query (List.append path [ "RoleLastUsed" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.permissions_boundary with
      | None -> []
      | Some v ->
          attached_permissions_boundary_to_query (List.append path [ "PermissionsBoundary" ]) v);
      (match x.attached_managed_policies with
      | None -> []
      | Some v ->
          attached_policies_list_type_to_query (List.append path [ "AttachedManagedPolicies" ]) v);
      (match x.role_policy_list with
      | None -> []
      | Some v -> policy_detail_list_type_to_query (List.append path [ "RolePolicyList" ]) v);
      (match x.instance_profile_list with
      | None -> []
      | Some v -> instance_profile_list_type_to_query (List.append path [ "InstanceProfileList" ]) v);
      (match x.assume_role_policy_document with
      | None -> []
      | Some v -> policy_document_type_to_query (List.append path [ "AssumeRolePolicyDocument" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
      (match x.role_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "RoleId" ]) v);
      (match x.role_name with
      | None -> []
      | Some v -> role_name_type_to_query (List.append path [ "RoleName" ]) v);
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let role_detail_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" role_detail_to_query path xs

let response_marker_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let requestor_workflow_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let requestor_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let request_message_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let report_generation_limit_exceeded_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let redirect_url_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let public_key_material_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let public_key_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let public_key_fingerprint_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let private_key_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let private_key_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let saml_private_key_to_query path (x : saml_private_key) =
  List.concat
    [
      (match x.timestamp with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "Timestamp" ]) v);
      (match x.key_id with
      | None -> []
      | Some v -> private_key_id_type_to_query (List.append path [ "KeyId" ]) v);
    ]

let private_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" saml_private_key_to_query path xs

let policy_version_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_type_to_query path (x : policy_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with MANAGED -> "MANAGED" | INLINE -> "INLINE")

let policy_scope_type_to_query path (x : policy_scope_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Local -> "Local" | AWS -> "AWS" | All -> "All")

let policy_path_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_parameter_value_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_parameter_values_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_parameter_value_type_to_query
    path xs

let policy_parameter_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_parameter_type_enum_to_query path (x : policy_parameter_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with STRING_LIST -> "stringList" | STRING -> "string")

let policy_parameter_to_query path (x : policy_parameter) =
  List.concat
    [
      (match x.type_ with
      | None -> []
      | Some v -> policy_parameter_type_enum_to_query (List.append path [ "Type" ]) v);
      (match x.values with
      | None -> []
      | Some v -> policy_parameter_values_list_type_to_query (List.append path [ "Values" ]) v);
      (match x.name with
      | None -> []
      | Some v -> policy_parameter_name_type_to_query (List.append path [ "Name" ]) v);
    ]

let policy_parameter_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_parameter_to_query path xs

let policy_owner_entity_type_to_query path (x : policy_owner_entity_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with GROUP -> "GROUP" | ROLE -> "ROLE" | USER -> "USER")

let policy_not_attachable_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_name_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_name_type_to_query path xs

let attachment_count_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let boolean_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let policy_description_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_to_query path (x : policy) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.update_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "UpdateDate" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.description with
      | None -> []
      | Some v -> policy_description_type_to_query (List.append path [ "Description" ]) v);
      (match x.is_attachable with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsAttachable" ]) v);
      (match x.permissions_boundary_usage_count with
      | None -> []
      | Some v ->
          attachment_count_type_to_query (List.append path [ "PermissionsBoundaryUsageCount" ]) v);
      (match x.attachment_count with
      | None -> []
      | Some v -> attachment_count_type_to_query (List.append path [ "AttachmentCount" ]) v);
      (match x.default_version_id with
      | None -> []
      | Some v -> policy_version_id_type_to_query (List.append path [ "DefaultVersionId" ]) v);
      (match x.path with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "Path" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
      (match x.policy_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "PolicyId" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_type_to_query (List.append path [ "PolicyName" ]) v);
    ]

let policy_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_to_query path xs

let entity_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_granting_service_access_to_query path (x : policy_granting_service_access) =
  List.concat
    [
      (match x.entity_name with
      | None -> []
      | Some v -> entity_name_type_to_query (List.append path [ "EntityName" ]) v);
      (match x.entity_type with
      | None -> []
      | Some v -> policy_owner_entity_type_to_query (List.append path [ "EntityType" ]) v);
      (match x.policy_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "PolicyArn" ]) v);
      policy_type_to_query (List.append path [ "PolicyType" ]) x.policy_type;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
    ]

let policy_granting_service_access_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    policy_granting_service_access_to_query path xs

let policy_evaluation_error_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_version_to_query path (x : policy_version) =
  List.concat
    [
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.is_default_version with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsDefaultVersion" ]) v);
      (match x.version_id with
      | None -> []
      | Some v -> policy_version_id_type_to_query (List.append path [ "VersionId" ]) v);
      (match x.document with
      | None -> []
      | Some v -> policy_document_type_to_query (List.append path [ "Document" ]) v);
    ]

let policy_document_version_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_version_to_query path xs

let permission_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let permission_check_status_type_to_query path (x : permission_check_status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FAILED -> "FAILED" | IN_PROGRESS -> "IN_PROGRESS" | COMPLETE -> "COMPLETE")

let permission_check_result_type_to_query path (x : permission_check_result_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with UNSURE -> "UNSURE" | DENIED -> "DENIED" | ALLOWED -> "ALLOWED")

let path_prefix_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let password_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let password_reuse_prevention_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let password_policy_violation_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let owner_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let organizations_policy_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let organizations_entity_path_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let open_id_idp_communication_error_exception_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let notification_channel_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let notes_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let no_such_entity_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let minimum_password_length_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let mfa_device_to_query path (x : mfa_device) =
  List.concat
    [
      date_type_to_query (List.append path [ "EnableDate" ]) x.enable_date;
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let mfa_device_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" mfa_device_to_query path xs

let max_password_age_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let max_items_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let marker_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let malformed_policy_document_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let malformed_certificate_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let locale_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let list_policies_granting_service_access_entry_to_query path
    (x : list_policies_granting_service_access_entry) =
  List.concat
    [
      (match x.policies with
      | None -> []
      | Some v ->
          policy_granting_service_access_list_type_to_query (List.append path [ "Policies" ]) v);
      (match x.service_namespace with
      | None -> []
      | Some v -> service_namespace_type_to_query (List.append path [ "ServiceNamespace" ]) v);
    ]

let list_policy_granting_service_access_response_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    list_policies_granting_service_access_entry_to_query path xs

let limit_exceeded_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let key_pair_mismatch_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let job_status_type_to_query path (x : job_status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with FAILED -> "FAILED" | COMPLETED -> "COMPLETED" | IN_PROGRESS -> "IN_PROGRESS")

let job_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_user_type_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_public_key_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_input_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_certificate_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let invalid_authentication_code_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let integer_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let group_to_query path (x : group) =
  List.concat
    [
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
      id_type_to_query (List.append path [ "GroupId" ]) x.group_id;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
      path_type_to_query (List.append path [ "Path" ]) x.path;
    ]

let group_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" group_to_query path xs

let group_detail_to_query path (x : group_detail) =
  List.concat
    [
      (match x.attached_managed_policies with
      | None -> []
      | Some v ->
          attached_policies_list_type_to_query (List.append path [ "AttachedManagedPolicies" ]) v);
      (match x.group_policy_list with
      | None -> []
      | Some v -> policy_detail_list_type_to_query (List.append path [ "GroupPolicyList" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
      (match x.group_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "GroupId" ]) v);
      (match x.group_name with
      | None -> []
      | Some v -> group_name_type_to_query (List.append path [ "GroupName" ]) v);
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let group_detail_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" group_detail_to_query path xs

let global_endpoint_token_version_to_query path (x : global_endpoint_token_version) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with V2Token -> "v2Token" | V1Token -> "v1Token")

let existing_user_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let entity_temporarily_unmodifiable_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let entity_type_to_query path (x : entity_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | AWSManagedPolicy -> "AWSManagedPolicy"
    | LocalManagedPolicy -> "LocalManagedPolicy"
    | Group -> "Group"
    | Role -> "Role"
    | User -> "User")

let entity_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" entity_type_to_query path xs

let entity_info_to_query path (x : entity_info) =
  List.concat
    [
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
      id_type_to_query (List.append path [ "Id" ]) x.id;
      policy_owner_entity_type_to_query (List.append path [ "Type" ]) x.type_;
      user_name_type_to_query (List.append path [ "Name" ]) x.name;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
    ]

let entity_details_to_query path (x : entity_details) =
  List.concat
    [
      (match x.last_authenticated with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "LastAuthenticated" ]) v);
      entity_info_to_query (List.append path [ "EntityInfo" ]) x.entity_info;
    ]

let entity_details_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" entity_details_to_query path xs

let entity_already_exists_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let encoding_type_to_query path (x : encoding_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with PEM -> "PEM" | SSH -> "SSH")

let duplicate_ssh_public_key_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let duplicate_certificate_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delete_conflict_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delegation_request_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let account_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delegation_request_description_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delegation_permission_to_query path (x : delegation_permission) =
  List.concat
    [
      (match x.parameters with
      | None -> []
      | Some v -> policy_parameter_list_type_to_query (List.append path [ "Parameters" ]) v);
      (match x.policy_template_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "PolicyTemplateArn" ]) v);
    ]

let delegation_request_to_query path (x : delegation_request) =
  List.concat
    [
      (match x.updated_time with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "UpdatedTime" ]) v);
      (match x.only_send_by_owner with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "OnlySendByOwner" ]) v);
      (match x.rejection_reason with
      | None -> []
      | Some v -> notes_type_to_query (List.append path [ "RejectionReason" ]) v);
      (match x.notes with
      | None -> []
      | Some v -> notes_type_to_query (List.append path [ "Notes" ]) v);
      (match x.redirect_url with
      | None -> []
      | Some v -> redirect_url_type_to_query (List.append path [ "RedirectUrl" ]) v);
      (match x.session_duration with
      | None -> []
      | Some v -> session_duration_type_to_query (List.append path [ "SessionDuration" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.requestor_name with
      | None -> []
      | Some v -> requestor_name_type_to_query (List.append path [ "RequestorName" ]) v);
      (match x.requestor_id with
      | None -> []
      | Some v -> account_id_type_to_query (List.append path [ "RequestorId" ]) v);
      (match x.expiration_time with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "ExpirationTime" ]) v);
      (match x.state with
      | None -> []
      | Some v -> state_type_to_query (List.append path [ "State" ]) v);
      (match x.approver_id with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "ApproverId" ]) v);
      (match x.owner_id with
      | None -> []
      | Some v -> owner_id_type_to_query (List.append path [ "OwnerId" ]) v);
      (match x.role_permission_restriction_arns with
      | None -> []
      | Some v ->
          role_permission_restriction_arn_list_type_to_query
            (List.append path [ "RolePermissionRestrictionArns" ])
            v);
      (match x.permission_policy with
      | None -> []
      | Some v -> permission_type_to_query (List.append path [ "PermissionPolicy" ]) v);
      (match x.permissions with
      | None -> []
      | Some v -> delegation_permission_to_query (List.append path [ "Permissions" ]) v);
      (match x.request_message with
      | None -> []
      | Some v -> request_message_type_to_query (List.append path [ "RequestMessage" ]) v);
      (match x.description with
      | None -> []
      | Some v ->
          delegation_request_description_type_to_query (List.append path [ "Description" ]) v);
      (match x.owner_account_id with
      | None -> []
      | Some v -> account_id_type_to_query (List.append path [ "OwnerAccountId" ]) v);
      (match x.delegation_request_id with
      | None -> []
      | Some v -> delegation_request_id_type_to_query (List.append path [ "DelegationRequestId" ]) v);
    ]

let delegation_requests_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" delegation_request_to_query path xs

let custom_suffix_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let credential_report_not_ready_exception_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let credential_report_not_present_exception_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let credential_report_expired_exception_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let credential_age_days_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let console_deep_link_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let client_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let client_id_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" client_id_type_to_query path xs

let certificate_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let certificate_body_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let signing_certificate_to_query path (x : signing_certificate) =
  List.concat
    [
      (match x.upload_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "UploadDate" ]) v);
      status_type_to_query (List.append path [ "Status" ]) x.status;
      certificate_body_type_to_query (List.append path [ "CertificateBody" ]) x.certificate_body;
      certificate_id_type_to_query (List.append path [ "CertificateId" ]) x.certificate_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let certificate_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" signing_certificate_to_query path xs

let certificate_chain_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let boolean_object_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let authentication_code_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let assignment_status_type_to_query path (x : assignment_status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Any -> "Any" | Unassigned -> "Unassigned" | Assigned -> "Assigned")

let assertion_encryption_mode_type_to_query path (x : assertion_encryption_mode_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Allowed -> "Allowed" | Required -> "Required")

let all_users_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let account_alias_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let account_alias_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" account_alias_type_to_query path xs

let access_key_secret_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let access_key_id_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let access_key_metadata_to_query path (x : access_key_metadata) =
  List.concat
    [
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.status with
      | None -> []
      | Some v -> status_type_to_query (List.append path [ "Status" ]) v);
      (match x.access_key_id with
      | None -> []
      | Some v -> access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let access_key_metadata_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" access_key_metadata_to_query path xs

let upload_signing_certificate_response_to_query path (x : upload_signing_certificate_response) =
  List.concat [ signing_certificate_to_query (List.append path [ "Certificate" ]) x.certificate ]

let upload_signing_certificate_request_to_query path (x : upload_signing_certificate_request) =
  List.concat
    [
      certificate_body_type_to_query (List.append path [ "CertificateBody" ]) x.certificate_body;
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let service_failure_exception_to_query path (x : service_failure_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> service_failure_exception_message_to_query (List.append path [ "message" ]) v);
    ]

let no_such_entity_exception_to_query path (x : no_such_entity_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> no_such_entity_message_to_query (List.append path [ "message" ]) v);
    ]

let malformed_certificate_exception_to_query path (x : malformed_certificate_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> malformed_certificate_message_to_query (List.append path [ "message" ]) v);
    ]

let limit_exceeded_exception_to_query path (x : limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> limit_exceeded_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_certificate_exception_to_query path (x : invalid_certificate_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_certificate_message_to_query (List.append path [ "message" ]) v);
    ]

let entity_already_exists_exception_to_query path (x : entity_already_exists_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> entity_already_exists_message_to_query (List.append path [ "message" ]) v);
    ]

let duplicate_certificate_exception_to_query path (x : duplicate_certificate_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> duplicate_certificate_message_to_query (List.append path [ "message" ]) v);
    ]

let concurrent_modification_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let concurrent_modification_exception_to_query path (x : concurrent_modification_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> concurrent_modification_message_to_query (List.append path [ "message" ]) v);
    ]

let upload_server_certificate_response_to_query path (x : upload_server_certificate_response) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.server_certificate_metadata with
      | None -> []
      | Some v ->
          server_certificate_metadata_to_query (List.append path [ "ServerCertificateMetadata" ]) v);
    ]

let upload_server_certificate_request_to_query path (x : upload_server_certificate_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.certificate_chain with
      | None -> []
      | Some v -> certificate_chain_type_to_query (List.append path [ "CertificateChain" ]) v);
      private_key_type_to_query (List.append path [ "PrivateKey" ]) x.private_key;
      certificate_body_type_to_query (List.append path [ "CertificateBody" ]) x.certificate_body;
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let key_pair_mismatch_exception_to_query path (x : key_pair_mismatch_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> key_pair_mismatch_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_input_exception_to_query path (x : invalid_input_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_input_message_to_query (List.append path [ "message" ]) v);
    ]

let ssh_public_key_to_query path (x : ssh_public_key) =
  List.concat
    [
      (match x.upload_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "UploadDate" ]) v);
      status_type_to_query (List.append path [ "Status" ]) x.status;
      public_key_material_type_to_query
        (List.append path [ "SSHPublicKeyBody" ])
        x.ssh_public_key_body;
      public_key_fingerprint_type_to_query (List.append path [ "Fingerprint" ]) x.fingerprint;
      public_key_id_type_to_query (List.append path [ "SSHPublicKeyId" ]) x.ssh_public_key_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let upload_ssh_public_key_response_to_query path (x : upload_ssh_public_key_response) =
  List.concat
    [
      (match x.ssh_public_key with
      | None -> []
      | Some v -> ssh_public_key_to_query (List.append path [ "SSHPublicKey" ]) v);
    ]

let upload_ssh_public_key_request_to_query path (x : upload_ssh_public_key_request) =
  List.concat
    [
      public_key_material_type_to_query
        (List.append path [ "SSHPublicKeyBody" ])
        x.ssh_public_key_body;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let unrecognized_public_key_encoding_exception_to_query path
    (x : unrecognized_public_key_encoding_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          unrecognized_public_key_encoding_message_to_query (List.append path [ "message" ]) v);
    ]

let invalid_public_key_exception_to_query path (x : invalid_public_key_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_public_key_message_to_query (List.append path [ "message" ]) v);
    ]

let duplicate_ssh_public_key_exception_to_query path (x : duplicate_ssh_public_key_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> duplicate_ssh_public_key_message_to_query (List.append path [ "message" ]) v);
    ]

let update_user_request_to_query path (x : update_user_request) =
  List.concat
    [
      (match x.new_user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "NewUserName" ]) v);
      (match x.new_path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "NewPath" ]) v);
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let entity_temporarily_unmodifiable_exception_to_query path
    (x : entity_temporarily_unmodifiable_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          entity_temporarily_unmodifiable_message_to_query (List.append path [ "message" ]) v);
    ]

let update_signing_certificate_request_to_query path (x : update_signing_certificate_request) =
  List.concat
    [
      status_type_to_query (List.append path [ "Status" ]) x.status;
      certificate_id_type_to_query (List.append path [ "CertificateId" ]) x.certificate_id;
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let update_service_specific_credential_request_to_query path
    (x : update_service_specific_credential_request) =
  List.concat
    [
      status_type_to_query (List.append path [ "Status" ]) x.status;
      service_specific_credential_id_to_query
        (List.append path [ "ServiceSpecificCredentialId" ])
        x.service_specific_credential_id;
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let update_server_certificate_request_to_query path (x : update_server_certificate_request) =
  List.concat
    [
      (match x.new_server_certificate_name with
      | None -> []
      | Some v ->
          server_certificate_name_type_to_query (List.append path [ "NewServerCertificateName" ]) v);
      (match x.new_path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "NewPath" ]) v);
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
    ]

let update_ssh_public_key_request_to_query path (x : update_ssh_public_key_request) =
  List.concat
    [
      status_type_to_query (List.append path [ "Status" ]) x.status;
      public_key_id_type_to_query (List.append path [ "SSHPublicKeyId" ]) x.ssh_public_key_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let update_saml_provider_response_to_query path (x : update_saml_provider_response) =
  List.concat
    [
      (match x.saml_provider_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "SAMLProviderArn" ]) v);
    ]

let saml_metadata_document_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let update_saml_provider_request_to_query path (x : update_saml_provider_request) =
  List.concat
    [
      (match x.remove_private_key with
      | None -> []
      | Some v -> private_key_id_type_to_query (List.append path [ "RemovePrivateKey" ]) v);
      (match x.add_private_key with
      | None -> []
      | Some v -> private_key_type_to_query (List.append path [ "AddPrivateKey" ]) v);
      (match x.assertion_encryption_mode with
      | None -> []
      | Some v ->
          assertion_encryption_mode_type_to_query (List.append path [ "AssertionEncryptionMode" ]) v);
      arn_type_to_query (List.append path [ "SAMLProviderArn" ]) x.saml_provider_arn;
      (match x.saml_metadata_document with
      | None -> []
      | Some v ->
          saml_metadata_document_type_to_query (List.append path [ "SAMLMetadataDocument" ]) v);
    ]

let update_role_response_to_query path _x = []

let update_role_request_to_query path (x : update_role_request) =
  List.concat
    [
      (match x.max_session_duration with
      | None -> []
      | Some v ->
          role_max_session_duration_type_to_query (List.append path [ "MaxSessionDuration" ]) v);
      (match x.description with
      | None -> []
      | Some v -> role_description_type_to_query (List.append path [ "Description" ]) v);
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let update_role_description_response_to_query path (x : update_role_description_response) =
  List.concat
    [ (match x.role with None -> [] | Some v -> role_to_query (List.append path [ "Role" ]) v) ]

let update_role_description_request_to_query path (x : update_role_description_request) =
  List.concat
    [
      role_description_type_to_query (List.append path [ "Description" ]) x.description;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let unmodifiable_entity_exception_to_query path (x : unmodifiable_entity_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> unmodifiable_entity_message_to_query (List.append path [ "message" ]) v);
    ]

let update_open_id_connect_provider_thumbprint_request_to_query path
    (x : update_open_id_connect_provider_thumbprint_request) =
  List.concat
    [
      thumbprint_list_type_to_query (List.append path [ "ThumbprintList" ]) x.thumbprint_list;
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let update_login_profile_request_to_query path (x : update_login_profile_request) =
  List.concat
    [
      (match x.password_reset_required with
      | None -> []
      | Some v -> boolean_object_type_to_query (List.append path [ "PasswordResetRequired" ]) v);
      (match x.password with
      | None -> []
      | Some v -> password_type_to_query (List.append path [ "Password" ]) v);
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let password_policy_violation_exception_to_query path (x : password_policy_violation_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> password_policy_violation_message_to_query (List.append path [ "message" ]) v);
    ]

let update_group_request_to_query path (x : update_group_request) =
  List.concat
    [
      (match x.new_group_name with
      | None -> []
      | Some v -> group_name_type_to_query (List.append path [ "NewGroupName" ]) v);
      (match x.new_path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "NewPath" ]) v);
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let update_delegation_request_request_to_query path (x : update_delegation_request_request) =
  List.concat
    [
      (match x.notes with
      | None -> []
      | Some v -> notes_type_to_query (List.append path [ "Notes" ]) v);
      delegation_request_id_type_to_query
        (List.append path [ "DelegationRequestId" ])
        x.delegation_request_id;
    ]

let update_assume_role_policy_request_to_query path (x : update_assume_role_policy_request) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let malformed_policy_document_exception_to_query path (x : malformed_policy_document_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> malformed_policy_document_message_to_query (List.append path [ "message" ]) v);
    ]

let update_account_password_policy_request_to_query path
    (x : update_account_password_policy_request) =
  List.concat
    [
      (match x.hard_expiry with
      | None -> []
      | Some v -> boolean_object_type_to_query (List.append path [ "HardExpiry" ]) v);
      (match x.password_reuse_prevention with
      | None -> []
      | Some v ->
          password_reuse_prevention_type_to_query (List.append path [ "PasswordReusePrevention" ]) v);
      (match x.max_password_age with
      | None -> []
      | Some v -> max_password_age_type_to_query (List.append path [ "MaxPasswordAge" ]) v);
      (match x.allow_users_to_change_password with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "AllowUsersToChangePassword" ]) v);
      (match x.require_lowercase_characters with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireLowercaseCharacters" ]) v);
      (match x.require_uppercase_characters with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireUppercaseCharacters" ]) v);
      (match x.require_numbers with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireNumbers" ]) v);
      (match x.require_symbols with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireSymbols" ]) v);
      (match x.minimum_password_length with
      | None -> []
      | Some v ->
          minimum_password_length_type_to_query (List.append path [ "MinimumPasswordLength" ]) v);
    ]

let update_access_key_request_to_query path (x : update_access_key_request) =
  List.concat
    [
      status_type_to_query (List.append path [ "Status" ]) x.status;
      access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) x.access_key_id;
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let untag_user_request_to_query path (x : untag_user_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let untag_server_certificate_request_to_query path (x : untag_server_certificate_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
    ]

let untag_saml_provider_request_to_query path (x : untag_saml_provider_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      arn_type_to_query (List.append path [ "SAMLProviderArn" ]) x.saml_provider_arn;
    ]

let untag_role_request_to_query path (x : untag_role_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let untag_policy_request_to_query path (x : untag_policy_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let untag_open_id_connect_provider_request_to_query path
    (x : untag_open_id_connect_provider_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let untag_mfa_device_request_to_query path (x : untag_mfa_device_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
    ]

let untag_instance_profile_request_to_query path (x : untag_instance_profile_request) =
  List.concat
    [
      tag_key_list_type_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let tracked_action_last_accessed_to_query path (x : tracked_action_last_accessed) =
  List.concat
    [
      (match x.last_accessed_region with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "LastAccessedRegion" ]) v);
      (match x.last_accessed_time with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "LastAccessedTime" ]) v);
      (match x.last_accessed_entity with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "LastAccessedEntity" ]) v);
      (match x.action_name with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "ActionName" ]) v);
    ]

let tracked_actions_last_accessed_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    tracked_action_last_accessed_to_query path xs

let tag_user_request_to_query path (x : tag_user_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let tag_server_certificate_request_to_query path (x : tag_server_certificate_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
    ]

let tag_saml_provider_request_to_query path (x : tag_saml_provider_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      arn_type_to_query (List.append path [ "SAMLProviderArn" ]) x.saml_provider_arn;
    ]

let tag_role_request_to_query path (x : tag_role_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let tag_policy_request_to_query path (x : tag_policy_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let tag_open_id_connect_provider_request_to_query path (x : tag_open_id_connect_provider_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let tag_mfa_device_request_to_query path (x : tag_mfa_device_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
    ]

let tag_instance_profile_request_to_query path (x : tag_instance_profile_request) =
  List.concat
    [
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let policy_identifier_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_source_type_to_query path (x : policy_source_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NONE -> "none"
    | RESOURCE -> "resource"
    | USER_MANAGED -> "user-managed"
    | AWS_MANAGED -> "aws-managed"
    | ROLE -> "role"
    | GROUP -> "group"
    | USER -> "user")

let line_number_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let column_number_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let position_to_query path (x : position) =
  List.concat
    [
      (match x.column with
      | None -> []
      | Some v -> column_number_to_query (List.append path [ "Column" ]) v);
      (match x.line with
      | None -> []
      | Some v -> line_number_to_query (List.append path [ "Line" ]) v);
    ]

let statement_to_query path (x : statement) =
  List.concat
    [
      (match x.end_position with
      | None -> []
      | Some v -> position_to_query (List.append path [ "EndPosition" ]) v);
      (match x.start_position with
      | None -> []
      | Some v -> position_to_query (List.append path [ "StartPosition" ]) v);
      (match x.source_policy_type with
      | None -> []
      | Some v -> policy_source_type_to_query (List.append path [ "SourcePolicyType" ]) v);
      (match x.source_policy_id with
      | None -> []
      | Some v -> policy_identifier_type_to_query (List.append path [ "SourcePolicyId" ]) v);
    ]

let statement_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" statement_to_query path xs

let simulation_policy_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_document_type_to_query path
    xs

let action_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let action_name_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" action_name_type_to_query path xs

let resource_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let resource_name_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_name_type_to_query path xs

let context_key_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let context_key_value_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let context_key_value_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" context_key_value_type_to_query path
    xs

let context_key_type_enum_to_query path (x : context_key_type_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | DATE_LIST -> "dateList"
    | DATE -> "date"
    | BINARY_LIST -> "binaryList"
    | BINARY -> "binary"
    | IP_LIST -> "ipList"
    | IP -> "ip"
    | BOOLEAN_LIST -> "booleanList"
    | BOOLEAN -> "boolean"
    | NUMERIC_LIST -> "numericList"
    | NUMERIC -> "numeric"
    | STRING_LIST -> "stringList"
    | STRING -> "string")

let context_entry_to_query path (x : context_entry) =
  List.concat
    [
      (match x.context_key_type with
      | None -> []
      | Some v -> context_key_type_enum_to_query (List.append path [ "ContextKeyType" ]) v);
      (match x.context_key_values with
      | None -> []
      | Some v -> context_key_value_list_type_to_query (List.append path [ "ContextKeyValues" ]) v);
      (match x.context_key_name with
      | None -> []
      | Some v -> context_key_name_type_to_query (List.append path [ "ContextKeyName" ]) v);
    ]

let context_entry_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" context_entry_to_query path xs

let resource_handling_option_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let simulate_principal_policy_request_to_query path (x : simulate_principal_policy_request) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.resource_handling_option with
      | None -> []
      | Some v ->
          resource_handling_option_type_to_query (List.append path [ "ResourceHandlingOption" ]) v);
      (match x.context_entries with
      | None -> []
      | Some v -> context_entry_list_type_to_query (List.append path [ "ContextEntries" ]) v);
      (match x.caller_arn with
      | None -> []
      | Some v -> resource_name_type_to_query (List.append path [ "CallerArn" ]) v);
      (match x.resource_owner with
      | None -> []
      | Some v -> resource_name_type_to_query (List.append path [ "ResourceOwner" ]) v);
      (match x.resource_policy with
      | None -> []
      | Some v -> policy_document_type_to_query (List.append path [ "ResourcePolicy" ]) v);
      (match x.resource_arns with
      | None -> []
      | Some v -> resource_name_list_type_to_query (List.append path [ "ResourceArns" ]) v);
      action_name_list_type_to_query (List.append path [ "ActionNames" ]) x.action_names;
      (match x.permissions_boundary_policy_input_list with
      | None -> []
      | Some v ->
          simulation_policy_list_type_to_query
            (List.append path [ "PermissionsBoundaryPolicyInputList" ])
            v);
      (match x.policy_input_list with
      | None -> []
      | Some v -> simulation_policy_list_type_to_query (List.append path [ "PolicyInputList" ]) v);
      arn_type_to_query (List.append path [ "PolicySourceArn" ]) x.policy_source_arn;
    ]

let policy_evaluation_exception_to_query path (x : policy_evaluation_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> policy_evaluation_error_message_to_query (List.append path [ "message" ]) v);
    ]

let policy_evaluation_decision_type_to_query path (x : policy_evaluation_decision_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | IMPLICIT_DENY -> "implicitDeny"
    | EXPLICIT_DENY -> "explicitDeny"
    | ALLOWED -> "allowed")

let context_key_names_result_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" context_key_name_type_to_query path
    xs

let organizations_decision_detail_to_query path (x : organizations_decision_detail) =
  List.concat
    [
      (match x.allowed_by_organizations with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "AllowedByOrganizations" ]) v);
    ]

let permissions_boundary_decision_detail_to_query path (x : permissions_boundary_decision_detail) =
  List.concat
    [
      (match x.allowed_by_permissions_boundary with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "AllowedByPermissionsBoundary" ]) v);
    ]

let eval_decision_source_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let eval_decision_details_type_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    eval_decision_source_type_to_query policy_evaluation_decision_type_to_query path pairs

let resource_specific_result_to_query path (x : resource_specific_result) =
  List.concat
    [
      (match x.permissions_boundary_decision_detail with
      | None -> []
      | Some v ->
          permissions_boundary_decision_detail_to_query
            (List.append path [ "PermissionsBoundaryDecisionDetail" ])
            v);
      (match x.eval_decision_details with
      | None -> []
      | Some v -> eval_decision_details_type_to_query (List.append path [ "EvalDecisionDetails" ]) v);
      (match x.missing_context_values with
      | None -> []
      | Some v ->
          context_key_names_result_list_type_to_query
            (List.append path [ "MissingContextValues" ])
            v);
      (match x.matched_statements with
      | None -> []
      | Some v -> statement_list_type_to_query (List.append path [ "MatchedStatements" ]) v);
      policy_evaluation_decision_type_to_query
        (List.append path [ "EvalResourceDecision" ])
        x.eval_resource_decision;
      resource_name_type_to_query (List.append path [ "EvalResourceName" ]) x.eval_resource_name;
    ]

let resource_specific_result_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" resource_specific_result_to_query
    path xs

let evaluation_result_to_query path (x : evaluation_result) =
  List.concat
    [
      (match x.resource_specific_results with
      | None -> []
      | Some v ->
          resource_specific_result_list_type_to_query
            (List.append path [ "ResourceSpecificResults" ])
            v);
      (match x.eval_decision_details with
      | None -> []
      | Some v -> eval_decision_details_type_to_query (List.append path [ "EvalDecisionDetails" ]) v);
      (match x.permissions_boundary_decision_detail with
      | None -> []
      | Some v ->
          permissions_boundary_decision_detail_to_query
            (List.append path [ "PermissionsBoundaryDecisionDetail" ])
            v);
      (match x.organizations_decision_detail with
      | None -> []
      | Some v ->
          organizations_decision_detail_to_query
            (List.append path [ "OrganizationsDecisionDetail" ])
            v);
      (match x.missing_context_values with
      | None -> []
      | Some v ->
          context_key_names_result_list_type_to_query
            (List.append path [ "MissingContextValues" ])
            v);
      (match x.matched_statements with
      | None -> []
      | Some v -> statement_list_type_to_query (List.append path [ "MatchedStatements" ]) v);
      policy_evaluation_decision_type_to_query (List.append path [ "EvalDecision" ]) x.eval_decision;
      (match x.eval_resource_name with
      | None -> []
      | Some v -> resource_name_type_to_query (List.append path [ "EvalResourceName" ]) v);
      action_name_type_to_query (List.append path [ "EvalActionName" ]) x.eval_action_name;
    ]

let evaluation_results_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" evaluation_result_to_query path xs

let simulate_policy_response_to_query path (x : simulate_policy_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.evaluation_results with
      | None -> []
      | Some v -> evaluation_results_list_type_to_query (List.append path [ "EvaluationResults" ]) v);
    ]

let simulate_custom_policy_request_to_query path (x : simulate_custom_policy_request) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.resource_handling_option with
      | None -> []
      | Some v ->
          resource_handling_option_type_to_query (List.append path [ "ResourceHandlingOption" ]) v);
      (match x.context_entries with
      | None -> []
      | Some v -> context_entry_list_type_to_query (List.append path [ "ContextEntries" ]) v);
      (match x.caller_arn with
      | None -> []
      | Some v -> resource_name_type_to_query (List.append path [ "CallerArn" ]) v);
      (match x.resource_owner with
      | None -> []
      | Some v -> resource_name_type_to_query (List.append path [ "ResourceOwner" ]) v);
      (match x.resource_policy with
      | None -> []
      | Some v -> policy_document_type_to_query (List.append path [ "ResourcePolicy" ]) v);
      (match x.resource_arns with
      | None -> []
      | Some v -> resource_name_list_type_to_query (List.append path [ "ResourceArns" ]) v);
      action_name_list_type_to_query (List.append path [ "ActionNames" ]) x.action_names;
      (match x.permissions_boundary_policy_input_list with
      | None -> []
      | Some v ->
          simulation_policy_list_type_to_query
            (List.append path [ "PermissionsBoundaryPolicyInputList" ])
            v);
      simulation_policy_list_type_to_query
        (List.append path [ "PolicyInputList" ])
        x.policy_input_list;
    ]

let set_security_token_service_preferences_request_to_query path
    (x : set_security_token_service_preferences_request) =
  List.concat
    [
      global_endpoint_token_version_to_query
        (List.append path [ "GlobalEndpointTokenVersion" ])
        x.global_endpoint_token_version;
    ]

let set_default_policy_version_request_to_query path (x : set_default_policy_version_request) =
  List.concat
    [
      policy_version_id_type_to_query (List.append path [ "VersionId" ]) x.version_id;
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let service_last_accessed_to_query path (x : service_last_accessed) =
  List.concat
    [
      (match x.tracked_actions_last_accessed with
      | None -> []
      | Some v ->
          tracked_actions_last_accessed_to_query
            (List.append path [ "TrackedActionsLastAccessed" ])
            v);
      (match x.total_authenticated_entities with
      | None -> []
      | Some v -> integer_type_to_query (List.append path [ "TotalAuthenticatedEntities" ]) v);
      (match x.last_authenticated_region with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "LastAuthenticatedRegion" ]) v);
      (match x.last_authenticated_entity with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "LastAuthenticatedEntity" ]) v);
      service_namespace_type_to_query (List.append path [ "ServiceNamespace" ]) x.service_namespace;
      (match x.last_authenticated with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "LastAuthenticated" ]) v);
      service_name_type_to_query (List.append path [ "ServiceName" ]) x.service_name;
    ]

let services_last_accessed_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" service_last_accessed_to_query path
    xs

let service_specific_credential_metadata_to_query path (x : service_specific_credential_metadata) =
  List.concat
    [
      service_name_to_query (List.append path [ "ServiceName" ]) x.service_name;
      service_specific_credential_id_to_query
        (List.append path [ "ServiceSpecificCredentialId" ])
        x.service_specific_credential_id;
      (match x.expiration_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "ExpirationDate" ]) v);
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
      (match x.service_credential_alias with
      | None -> []
      | Some v ->
          service_credential_alias_to_query (List.append path [ "ServiceCredentialAlias" ]) v);
      (match x.service_user_name with
      | None -> []
      | Some v -> service_user_name_to_query (List.append path [ "ServiceUserName" ]) v);
      status_type_to_query (List.append path [ "Status" ]) x.status;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let service_specific_credentials_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    service_specific_credential_metadata_to_query path xs

let service_specific_credential_to_query path (x : service_specific_credential) =
  List.concat
    [
      status_type_to_query (List.append path [ "Status" ]) x.status;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
      service_specific_credential_id_to_query
        (List.append path [ "ServiceSpecificCredentialId" ])
        x.service_specific_credential_id;
      (match x.service_credential_secret with
      | None -> []
      | Some v ->
          service_credential_secret_to_query (List.append path [ "ServiceCredentialSecret" ]) v);
      (match x.service_credential_alias with
      | None -> []
      | Some v ->
          service_credential_alias_to_query (List.append path [ "ServiceCredentialAlias" ]) v);
      (match x.service_password with
      | None -> []
      | Some v -> service_password_to_query (List.append path [ "ServicePassword" ]) v);
      (match x.service_user_name with
      | None -> []
      | Some v -> service_user_name_to_query (List.append path [ "ServiceUserName" ]) v);
      service_name_to_query (List.append path [ "ServiceName" ]) x.service_name;
      (match x.expiration_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "ExpirationDate" ]) v);
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
    ]

let service_not_supported_exception_to_query path (x : service_not_supported_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> service_not_supported_message_to_query (List.append path [ "message" ]) v);
    ]

let exception_message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let service_access_not_enabled_exception_to_query path (x : service_access_not_enabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "Message" ]) v);
    ]

let server_certificate_to_query path (x : server_certificate) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.certificate_chain with
      | None -> []
      | Some v -> certificate_chain_type_to_query (List.append path [ "CertificateChain" ]) v);
      certificate_body_type_to_query (List.append path [ "CertificateBody" ]) x.certificate_body;
      server_certificate_metadata_to_query
        (List.append path [ "ServerCertificateMetadata" ])
        x.server_certificate_metadata;
    ]

let send_delegation_token_request_to_query path (x : send_delegation_token_request) =
  List.concat
    [
      delegation_request_id_type_to_query
        (List.append path [ "DelegationRequestId" ])
        x.delegation_request_id;
    ]

let ssh_public_key_metadata_to_query path (x : ssh_public_key_metadata) =
  List.concat
    [
      date_type_to_query (List.append path [ "UploadDate" ]) x.upload_date;
      status_type_to_query (List.append path [ "Status" ]) x.status;
      public_key_id_type_to_query (List.append path [ "SSHPublicKeyId" ]) x.ssh_public_key_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let ssh_public_key_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" ssh_public_key_metadata_to_query
    path xs

let saml_provider_name_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let saml_provider_list_entry_to_query path (x : saml_provider_list_entry) =
  List.concat
    [
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.valid_until with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "ValidUntil" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
    ]

let saml_provider_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" saml_provider_list_entry_to_query
    path xs

let region_name_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let arn_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" arn_type_to_query path xs

let role_usage_type_to_query path (x : role_usage_type) =
  List.concat
    [
      (match x.resources with
      | None -> []
      | Some v -> arn_list_type_to_query (List.append path [ "Resources" ]) v);
      (match x.region with
      | None -> []
      | Some v -> region_name_type_to_query (List.append path [ "Region" ]) v);
    ]

let role_usage_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" role_usage_type_to_query path xs

let resync_mfa_device_request_to_query path (x : resync_mfa_device_request) =
  List.concat
    [
      authentication_code_type_to_query
        (List.append path [ "AuthenticationCode2" ])
        x.authentication_code2;
      authentication_code_type_to_query
        (List.append path [ "AuthenticationCode1" ])
        x.authentication_code1;
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let invalid_authentication_code_exception_to_query path (x : invalid_authentication_code_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_authentication_code_message_to_query (List.append path [ "message" ]) v);
    ]

let reset_service_specific_credential_response_to_query path
    (x : reset_service_specific_credential_response) =
  List.concat
    [
      (match x.service_specific_credential with
      | None -> []
      | Some v ->
          service_specific_credential_to_query (List.append path [ "ServiceSpecificCredential" ]) v);
    ]

let reset_service_specific_credential_request_to_query path
    (x : reset_service_specific_credential_request) =
  List.concat
    [
      service_specific_credential_id_to_query
        (List.append path [ "ServiceSpecificCredentialId" ])
        x.service_specific_credential_id;
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let report_state_type_to_query path (x : report_state_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with COMPLETE -> "COMPLETE" | INPROGRESS -> "INPROGRESS" | STARTED -> "STARTED")

let report_state_description_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let report_generation_limit_exceeded_exception_to_query path
    (x : report_generation_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          report_generation_limit_exceeded_message_to_query (List.append path [ "message" ]) v);
    ]

let report_format_type_to_query path (x : report_format_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with Text_csv -> "text/csv")

let report_content_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v

let remove_user_from_group_request_to_query path (x : remove_user_from_group_request) =
  List.concat
    [
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let remove_role_from_instance_profile_request_to_query path
    (x : remove_role_from_instance_profile_request) =
  List.concat
    [
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let remove_client_id_from_open_id_connect_provider_request_to_query path
    (x : remove_client_id_from_open_id_connect_provider_request) =
  List.concat
    [
      client_id_type_to_query (List.append path [ "ClientID" ]) x.client_i_d;
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let reject_delegation_request_request_to_query path (x : reject_delegation_request_request) =
  List.concat
    [
      (match x.notes with
      | None -> []
      | Some v -> notes_type_to_query (List.append path [ "Notes" ]) v);
      delegation_request_id_type_to_query
        (List.append path [ "DelegationRequestId" ])
        x.delegation_request_id;
    ]

let reason_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let put_user_policy_request_to_query path (x : put_user_policy_request) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let put_user_permissions_boundary_request_to_query path (x : put_user_permissions_boundary_request)
    =
  List.concat
    [
      arn_type_to_query (List.append path [ "PermissionsBoundary" ]) x.permissions_boundary;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let policy_not_attachable_exception_to_query path (x : policy_not_attachable_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> policy_not_attachable_message_to_query (List.append path [ "message" ]) v);
    ]

let put_role_policy_request_to_query path (x : put_role_policy_request) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let put_role_permissions_boundary_request_to_query path (x : put_role_permissions_boundary_request)
    =
  List.concat
    [
      arn_type_to_query (List.append path [ "PermissionsBoundary" ]) x.permissions_boundary;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let put_group_policy_request_to_query path (x : put_group_policy_request) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let policy_user_to_query path (x : policy_user) =
  List.concat
    [
      (match x.user_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "UserId" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let policy_user_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_user_to_query path xs

let policy_usage_type_to_query path (x : policy_usage_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | PermissionsBoundary -> "PermissionsBoundary"
    | PermissionsPolicy -> "PermissionsPolicy")

let policy_role_to_query path (x : policy_role) =
  List.concat
    [
      (match x.role_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "RoleId" ]) v);
      (match x.role_name with
      | None -> []
      | Some v -> role_name_type_to_query (List.append path [ "RoleName" ]) v);
    ]

let policy_role_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_role_to_query path xs

let policy_group_to_query path (x : policy_group) =
  List.concat
    [
      (match x.group_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "GroupId" ]) v);
      (match x.group_name with
      | None -> []
      | Some v -> group_name_type_to_query (List.append path [ "GroupName" ]) v);
    ]

let policy_group_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_group_to_query path xs

let password_policy_to_query path (x : password_policy) =
  List.concat
    [
      (match x.hard_expiry with
      | None -> []
      | Some v -> boolean_object_type_to_query (List.append path [ "HardExpiry" ]) v);
      (match x.password_reuse_prevention with
      | None -> []
      | Some v ->
          password_reuse_prevention_type_to_query (List.append path [ "PasswordReusePrevention" ]) v);
      (match x.max_password_age with
      | None -> []
      | Some v -> max_password_age_type_to_query (List.append path [ "MaxPasswordAge" ]) v);
      (match x.expire_passwords with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "ExpirePasswords" ]) v);
      (match x.allow_users_to_change_password with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "AllowUsersToChangePassword" ]) v);
      (match x.require_lowercase_characters with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireLowercaseCharacters" ]) v);
      (match x.require_uppercase_characters with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireUppercaseCharacters" ]) v);
      (match x.require_numbers with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireNumbers" ]) v);
      (match x.require_symbols with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "RequireSymbols" ]) v);
      (match x.minimum_password_length with
      | None -> []
      | Some v ->
          minimum_password_length_type_to_query (List.append path [ "MinimumPasswordLength" ]) v);
    ]

let organization_not_in_all_features_mode_exception_to_query path
    (x : organization_not_in_all_features_mode_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "Message" ]) v);
    ]

let organization_not_found_exception_to_query path (x : organization_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "Message" ]) v);
    ]

let organization_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let open_id_idp_communication_error_exception_to_query path
    (x : open_id_idp_communication_error_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          open_id_idp_communication_error_exception_message_to_query
            (List.append path [ "message" ]) v);
    ]

let open_id_connect_provider_url_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let open_id_connect_provider_list_entry_to_query path (x : open_id_connect_provider_list_entry) =
  List.concat
    [ (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v) ]

let open_id_connect_provider_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    open_id_connect_provider_list_entry_to_query path xs

let managed_policy_detail_to_query path (x : managed_policy_detail) =
  List.concat
    [
      (match x.policy_version_list with
      | None -> []
      | Some v ->
          policy_document_version_list_type_to_query (List.append path [ "PolicyVersionList" ]) v);
      (match x.update_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "UpdateDate" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.description with
      | None -> []
      | Some v -> policy_description_type_to_query (List.append path [ "Description" ]) v);
      (match x.is_attachable with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsAttachable" ]) v);
      (match x.permissions_boundary_usage_count with
      | None -> []
      | Some v ->
          attachment_count_type_to_query (List.append path [ "PermissionsBoundaryUsageCount" ]) v);
      (match x.attachment_count with
      | None -> []
      | Some v -> attachment_count_type_to_query (List.append path [ "AttachmentCount" ]) v);
      (match x.default_version_id with
      | None -> []
      | Some v -> policy_version_id_type_to_query (List.append path [ "DefaultVersionId" ]) v);
      (match x.path with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "Path" ]) v);
      (match x.arn with None -> [] | Some v -> arn_type_to_query (List.append path [ "Arn" ]) v);
      (match x.policy_id with
      | None -> []
      | Some v -> id_type_to_query (List.append path [ "PolicyId" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_type_to_query (List.append path [ "PolicyName" ]) v);
    ]

let managed_policy_detail_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" managed_policy_detail_to_query path
    xs

let login_profile_to_query path (x : login_profile) =
  List.concat
    [
      (match x.password_reset_required with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "PasswordResetRequired" ]) v);
      date_type_to_query (List.append path [ "CreateDate" ]) x.create_date;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let list_virtual_mfa_devices_response_to_query path (x : list_virtual_mfa_devices_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      virtual_mfa_device_list_type_to_query
        (List.append path [ "VirtualMFADevices" ])
        x.virtual_mfa_devices;
    ]

let list_virtual_mfa_devices_request_to_query path (x : list_virtual_mfa_devices_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.assignment_status with
      | None -> []
      | Some v -> assignment_status_type_to_query (List.append path [ "AssignmentStatus" ]) v);
    ]

let list_users_response_to_query path (x : list_users_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      user_list_type_to_query (List.append path [ "Users" ]) x.users;
    ]

let list_users_request_to_query path (x : list_users_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> path_prefix_type_to_query (List.append path [ "PathPrefix" ]) v);
    ]

let list_user_tags_response_to_query path (x : list_user_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_user_tags_request_to_query path (x : list_user_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let list_user_policies_response_to_query path (x : list_user_policies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      policy_name_list_type_to_query (List.append path [ "PolicyNames" ]) x.policy_names;
    ]

let list_user_policies_request_to_query path (x : list_user_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let list_signing_certificates_response_to_query path (x : list_signing_certificates_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      certificate_list_type_to_query (List.append path [ "Certificates" ]) x.certificates;
    ]

let list_signing_certificates_request_to_query path (x : list_signing_certificates_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let list_service_specific_credentials_response_to_query path
    (x : list_service_specific_credentials_response) =
  List.concat
    [
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.service_specific_credentials with
      | None -> []
      | Some v ->
          service_specific_credentials_list_type_to_query
            (List.append path [ "ServiceSpecificCredentials" ])
            v);
    ]

let list_service_specific_credentials_request_to_query path
    (x : list_service_specific_credentials_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.all_users with
      | None -> []
      | Some v -> all_users_to_query (List.append path [ "AllUsers" ]) v);
      (match x.service_name with
      | None -> []
      | Some v -> service_name_to_query (List.append path [ "ServiceName" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let list_server_certificates_response_to_query path (x : list_server_certificates_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      server_certificate_metadata_list_type_to_query
        (List.append path [ "ServerCertificateMetadataList" ])
        x.server_certificate_metadata_list;
    ]

let list_server_certificates_request_to_query path (x : list_server_certificates_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> path_prefix_type_to_query (List.append path [ "PathPrefix" ]) v);
    ]

let list_server_certificate_tags_response_to_query path (x : list_server_certificate_tags_response)
    =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_server_certificate_tags_request_to_query path (x : list_server_certificate_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
    ]

let list_ssh_public_keys_response_to_query path (x : list_ssh_public_keys_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.ssh_public_keys with
      | None -> []
      | Some v -> ssh_public_key_list_type_to_query (List.append path [ "SSHPublicKeys" ]) v);
    ]

let list_ssh_public_keys_request_to_query path (x : list_ssh_public_keys_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let list_saml_providers_response_to_query path (x : list_saml_providers_response) =
  List.concat
    [
      (match x.saml_provider_list with
      | None -> []
      | Some v -> saml_provider_list_type_to_query (List.append path [ "SAMLProviderList" ]) v);
    ]

let list_saml_providers_request_to_query path _x = []

let list_saml_provider_tags_response_to_query path (x : list_saml_provider_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_saml_provider_tags_request_to_query path (x : list_saml_provider_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      arn_type_to_query (List.append path [ "SAMLProviderArn" ]) x.saml_provider_arn;
    ]

let list_roles_response_to_query path (x : list_roles_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      role_list_type_to_query (List.append path [ "Roles" ]) x.roles;
    ]

let list_roles_request_to_query path (x : list_roles_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> path_prefix_type_to_query (List.append path [ "PathPrefix" ]) v);
    ]

let list_role_tags_response_to_query path (x : list_role_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_role_tags_request_to_query path (x : list_role_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let list_role_policies_response_to_query path (x : list_role_policies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      policy_name_list_type_to_query (List.append path [ "PolicyNames" ]) x.policy_names;
    ]

let list_role_policies_request_to_query path (x : list_role_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let list_policy_versions_response_to_query path (x : list_policy_versions_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.versions with
      | None -> []
      | Some v -> policy_document_version_list_type_to_query (List.append path [ "Versions" ]) v);
    ]

let list_policy_versions_request_to_query path (x : list_policy_versions_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let list_policy_tags_response_to_query path (x : list_policy_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_policy_tags_request_to_query path (x : list_policy_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let list_policies_response_to_query path (x : list_policies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.policies with
      | None -> []
      | Some v -> policy_list_type_to_query (List.append path [ "Policies" ]) v);
    ]

let list_policies_request_to_query path (x : list_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.policy_usage_filter with
      | None -> []
      | Some v -> policy_usage_type_to_query (List.append path [ "PolicyUsageFilter" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "PathPrefix" ]) v);
      (match x.only_attached with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "OnlyAttached" ]) v);
      (match x.scope with
      | None -> []
      | Some v -> policy_scope_type_to_query (List.append path [ "Scope" ]) v);
    ]

let list_policies_granting_service_access_response_to_query path
    (x : list_policies_granting_service_access_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      list_policy_granting_service_access_response_list_type_to_query
        (List.append path [ "PoliciesGrantingServiceAccess" ])
        x.policies_granting_service_access;
    ]

let list_policies_granting_service_access_request_to_query path
    (x : list_policies_granting_service_access_request) =
  List.concat
    [
      service_namespace_list_type_to_query
        (List.append path [ "ServiceNamespaces" ])
        x.service_namespaces;
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
    ]

let feature_type_to_query path (x : feature_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | ROOT_SESSIONS -> "RootSessions"
    | ROOT_CREDENTIALS_MANAGEMENT -> "RootCredentialsManagement")

let features_list_type_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" feature_type_to_query path xs

let list_organizations_features_response_to_query path (x : list_organizations_features_response) =
  List.concat
    [
      (match x.enabled_features with
      | None -> []
      | Some v -> features_list_type_to_query (List.append path [ "EnabledFeatures" ]) v);
      (match x.organization_id with
      | None -> []
      | Some v -> organization_id_type_to_query (List.append path [ "OrganizationId" ]) v);
    ]

let list_organizations_features_request_to_query path _x = []

let account_not_management_or_delegated_administrator_exception_to_query path
    (x : account_not_management_or_delegated_administrator_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "Message" ]) v);
    ]

let list_open_id_connect_providers_response_to_query path
    (x : list_open_id_connect_providers_response) =
  List.concat
    [
      (match x.open_id_connect_provider_list with
      | None -> []
      | Some v ->
          open_id_connect_provider_list_type_to_query
            (List.append path [ "OpenIDConnectProviderList" ])
            v);
    ]

let list_open_id_connect_providers_request_to_query path _x = []

let list_open_id_connect_provider_tags_response_to_query path
    (x : list_open_id_connect_provider_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_open_id_connect_provider_tags_request_to_query path
    (x : list_open_id_connect_provider_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let list_mfa_devices_response_to_query path (x : list_mfa_devices_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      mfa_device_list_type_to_query (List.append path [ "MFADevices" ]) x.mfa_devices;
    ]

let list_mfa_devices_request_to_query path (x : list_mfa_devices_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let list_mfa_device_tags_response_to_query path (x : list_mfa_device_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_mfa_device_tags_request_to_query path (x : list_mfa_device_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
    ]

let list_instance_profiles_response_to_query path (x : list_instance_profiles_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      instance_profile_list_type_to_query
        (List.append path [ "InstanceProfiles" ])
        x.instance_profiles;
    ]

let list_instance_profiles_request_to_query path (x : list_instance_profiles_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> path_prefix_type_to_query (List.append path [ "PathPrefix" ]) v);
    ]

let list_instance_profiles_for_role_response_to_query path
    (x : list_instance_profiles_for_role_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      instance_profile_list_type_to_query
        (List.append path [ "InstanceProfiles" ])
        x.instance_profiles;
    ]

let list_instance_profiles_for_role_request_to_query path
    (x : list_instance_profiles_for_role_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let list_instance_profile_tags_response_to_query path (x : list_instance_profile_tags_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      tag_list_type_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let list_instance_profile_tags_request_to_query path (x : list_instance_profile_tags_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let list_groups_response_to_query path (x : list_groups_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      group_list_type_to_query (List.append path [ "Groups" ]) x.groups;
    ]

let list_groups_request_to_query path (x : list_groups_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> path_prefix_type_to_query (List.append path [ "PathPrefix" ]) v);
    ]

let list_groups_for_user_response_to_query path (x : list_groups_for_user_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      group_list_type_to_query (List.append path [ "Groups" ]) x.groups;
    ]

let list_groups_for_user_request_to_query path (x : list_groups_for_user_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let list_group_policies_response_to_query path (x : list_group_policies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      policy_name_list_type_to_query (List.append path [ "PolicyNames" ]) x.policy_names;
    ]

let list_group_policies_request_to_query path (x : list_group_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let list_entities_for_policy_response_to_query path (x : list_entities_for_policy_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.policy_roles with
      | None -> []
      | Some v -> policy_role_list_type_to_query (List.append path [ "PolicyRoles" ]) v);
      (match x.policy_users with
      | None -> []
      | Some v -> policy_user_list_type_to_query (List.append path [ "PolicyUsers" ]) v);
      (match x.policy_groups with
      | None -> []
      | Some v -> policy_group_list_type_to_query (List.append path [ "PolicyGroups" ]) v);
    ]

let list_entities_for_policy_request_to_query path (x : list_entities_for_policy_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.policy_usage_filter with
      | None -> []
      | Some v -> policy_usage_type_to_query (List.append path [ "PolicyUsageFilter" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "PathPrefix" ]) v);
      (match x.entity_filter with
      | None -> []
      | Some v -> entity_type_to_query (List.append path [ "EntityFilter" ]) v);
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let list_delegation_requests_response_to_query path (x : list_delegation_requests_response) =
  List.concat
    [
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "isTruncated" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.delegation_requests with
      | None -> []
      | Some v ->
          delegation_requests_list_type_to_query (List.append path [ "DelegationRequests" ]) v);
    ]

let list_delegation_requests_request_to_query path (x : list_delegation_requests_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.owner_id with
      | None -> []
      | Some v -> owner_id_type_to_query (List.append path [ "OwnerId" ]) v);
    ]

let list_attached_user_policies_response_to_query path (x : list_attached_user_policies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.attached_policies with
      | None -> []
      | Some v -> attached_policies_list_type_to_query (List.append path [ "AttachedPolicies" ]) v);
    ]

let list_attached_user_policies_request_to_query path (x : list_attached_user_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "PathPrefix" ]) v);
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let list_attached_role_policies_response_to_query path (x : list_attached_role_policies_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.attached_policies with
      | None -> []
      | Some v -> attached_policies_list_type_to_query (List.append path [ "AttachedPolicies" ]) v);
    ]

let list_attached_role_policies_request_to_query path (x : list_attached_role_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "PathPrefix" ]) v);
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let list_attached_group_policies_response_to_query path (x : list_attached_group_policies_response)
    =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.attached_policies with
      | None -> []
      | Some v -> attached_policies_list_type_to_query (List.append path [ "AttachedPolicies" ]) v);
    ]

let list_attached_group_policies_request_to_query path (x : list_attached_group_policies_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.path_prefix with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "PathPrefix" ]) v);
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let list_account_aliases_response_to_query path (x : list_account_aliases_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      account_alias_list_type_to_query (List.append path [ "AccountAliases" ]) x.account_aliases;
    ]

let list_account_aliases_request_to_query path (x : list_account_aliases_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
    ]

let list_access_keys_response_to_query path (x : list_access_keys_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      access_key_metadata_list_type_to_query
        (List.append path [ "AccessKeyMetadata" ])
        x.access_key_metadata;
    ]

let list_access_keys_request_to_query path (x : list_access_keys_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let invalid_user_type_exception_to_query path (x : invalid_user_type_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> invalid_user_type_message_to_query (List.append path [ "message" ]) v);
    ]

let get_user_response_to_query path (x : get_user_response) =
  List.concat [ user_to_query (List.append path [ "User" ]) x.user ]

let get_user_request_to_query path (x : get_user_request) =
  List.concat
    [
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let get_user_policy_response_to_query path (x : get_user_policy_response) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let get_user_policy_request_to_query path (x : get_user_policy_request) =
  List.concat
    [
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let deletion_task_status_type_to_query path (x : deletion_task_status_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | NOT_STARTED -> "NOT_STARTED"
    | FAILED -> "FAILED"
    | IN_PROGRESS -> "IN_PROGRESS"
    | SUCCEEDED -> "SUCCEEDED")

let deletion_task_failure_reason_type_to_query path (x : deletion_task_failure_reason_type) =
  List.concat
    [
      (match x.role_usage_list with
      | None -> []
      | Some v -> role_usage_list_type_to_query (List.append path [ "RoleUsageList" ]) v);
      (match x.reason with
      | None -> []
      | Some v -> reason_type_to_query (List.append path [ "Reason" ]) v);
    ]

let get_service_linked_role_deletion_status_response_to_query path
    (x : get_service_linked_role_deletion_status_response) =
  List.concat
    [
      (match x.reason with
      | None -> []
      | Some v -> deletion_task_failure_reason_type_to_query (List.append path [ "Reason" ]) v);
      deletion_task_status_type_to_query (List.append path [ "Status" ]) x.status;
    ]

let deletion_task_id_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let get_service_linked_role_deletion_status_request_to_query path
    (x : get_service_linked_role_deletion_status_request) =
  List.concat
    [ deletion_task_id_type_to_query (List.append path [ "DeletionTaskId" ]) x.deletion_task_id ]

let error_details_to_query path (x : error_details) =
  List.concat
    [
      string_type_to_query (List.append path [ "Code" ]) x.code;
      string_type_to_query (List.append path [ "Message" ]) x.message;
    ]

let get_service_last_accessed_details_with_entities_response_to_query path
    (x : get_service_last_accessed_details_with_entities_response) =
  List.concat
    [
      (match x.error with
      | None -> []
      | Some v -> error_details_to_query (List.append path [ "Error" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      entity_details_list_type_to_query
        (List.append path [ "EntityDetailsList" ])
        x.entity_details_list;
      date_type_to_query (List.append path [ "JobCompletionDate" ]) x.job_completion_date;
      date_type_to_query (List.append path [ "JobCreationDate" ]) x.job_creation_date;
      job_status_type_to_query (List.append path [ "JobStatus" ]) x.job_status;
    ]

let get_service_last_accessed_details_with_entities_request_to_query path
    (x : get_service_last_accessed_details_with_entities_request) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      service_namespace_type_to_query (List.append path [ "ServiceNamespace" ]) x.service_namespace;
      job_id_type_to_query (List.append path [ "JobId" ]) x.job_id;
    ]

let access_advisor_usage_granularity_type_to_query path (x : access_advisor_usage_granularity_type)
    =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with ACTION_LEVEL -> "ACTION_LEVEL" | SERVICE_LEVEL -> "SERVICE_LEVEL")

let get_service_last_accessed_details_response_to_query path
    (x : get_service_last_accessed_details_response) =
  List.concat
    [
      (match x.error with
      | None -> []
      | Some v -> error_details_to_query (List.append path [ "Error" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      date_type_to_query (List.append path [ "JobCompletionDate" ]) x.job_completion_date;
      services_last_accessed_to_query
        (List.append path [ "ServicesLastAccessed" ])
        x.services_last_accessed;
      date_type_to_query (List.append path [ "JobCreationDate" ]) x.job_creation_date;
      (match x.job_type with
      | None -> []
      | Some v -> access_advisor_usage_granularity_type_to_query (List.append path [ "JobType" ]) v);
      job_status_type_to_query (List.append path [ "JobStatus" ]) x.job_status;
    ]

let get_service_last_accessed_details_request_to_query path
    (x : get_service_last_accessed_details_request) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      job_id_type_to_query (List.append path [ "JobId" ]) x.job_id;
    ]

let get_server_certificate_response_to_query path (x : get_server_certificate_response) =
  List.concat
    [ server_certificate_to_query (List.append path [ "ServerCertificate" ]) x.server_certificate ]

let get_server_certificate_request_to_query path (x : get_server_certificate_request) =
  List.concat
    [
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
    ]

let get_ssh_public_key_response_to_query path (x : get_ssh_public_key_response) =
  List.concat
    [
      (match x.ssh_public_key with
      | None -> []
      | Some v -> ssh_public_key_to_query (List.append path [ "SSHPublicKey" ]) v);
    ]

let get_ssh_public_key_request_to_query path (x : get_ssh_public_key_request) =
  List.concat
    [
      encoding_type_to_query (List.append path [ "Encoding" ]) x.encoding;
      public_key_id_type_to_query (List.append path [ "SSHPublicKeyId" ]) x.ssh_public_key_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let get_saml_provider_response_to_query path (x : get_saml_provider_response) =
  List.concat
    [
      (match x.private_key_list with
      | None -> []
      | Some v -> private_key_list_to_query (List.append path [ "PrivateKeyList" ]) v);
      (match x.assertion_encryption_mode with
      | None -> []
      | Some v ->
          assertion_encryption_mode_type_to_query (List.append path [ "AssertionEncryptionMode" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.valid_until with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "ValidUntil" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.saml_metadata_document with
      | None -> []
      | Some v ->
          saml_metadata_document_type_to_query (List.append path [ "SAMLMetadataDocument" ]) v);
      (match x.saml_provider_uui_d with
      | None -> []
      | Some v -> private_key_id_type_to_query (List.append path [ "SAMLProviderUUID" ]) v);
    ]

let get_saml_provider_request_to_query path (x : get_saml_provider_request) =
  List.concat [ arn_type_to_query (List.append path [ "SAMLProviderArn" ]) x.saml_provider_arn ]

let get_role_response_to_query path (x : get_role_response) =
  List.concat [ role_to_query (List.append path [ "Role" ]) x.role ]

let get_role_request_to_query path (x : get_role_request) =
  List.concat [ role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name ]

let get_role_policy_response_to_query path (x : get_role_policy_response) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let get_role_policy_request_to_query path (x : get_role_policy_request) =
  List.concat
    [
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let get_policy_version_response_to_query path (x : get_policy_version_response) =
  List.concat
    [
      (match x.policy_version with
      | None -> []
      | Some v -> policy_version_to_query (List.append path [ "PolicyVersion" ]) v);
    ]

let get_policy_version_request_to_query path (x : get_policy_version_request) =
  List.concat
    [
      policy_version_id_type_to_query (List.append path [ "VersionId" ]) x.version_id;
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let get_policy_response_to_query path (x : get_policy_response) =
  List.concat
    [
      (match x.policy with
      | None -> []
      | Some v -> policy_to_query (List.append path [ "Policy" ]) v);
    ]

let get_policy_request_to_query path (x : get_policy_request) =
  List.concat [ arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn ]

let get_outbound_web_identity_federation_info_response_to_query path
    (x : get_outbound_web_identity_federation_info_response) =
  List.concat
    [
      (match x.jwt_vending_enabled with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "JwtVendingEnabled" ]) v);
      (match x.issuer_identifier with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "IssuerIdentifier" ]) v);
    ]

let feature_disabled_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let feature_disabled_exception_to_query path (x : feature_disabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> feature_disabled_message_to_query (List.append path [ "message" ]) v);
    ]

let access_detail_to_query path (x : access_detail) =
  List.concat
    [
      (match x.total_authenticated_entities with
      | None -> []
      | Some v -> integer_type_to_query (List.append path [ "TotalAuthenticatedEntities" ]) v);
      (match x.last_authenticated_time with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "LastAuthenticatedTime" ]) v);
      (match x.entity_path with
      | None -> []
      | Some v -> organizations_entity_path_type_to_query (List.append path [ "EntityPath" ]) v);
      (match x.region with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "Region" ]) v);
      service_namespace_type_to_query (List.append path [ "ServiceNamespace" ]) x.service_namespace;
      service_name_type_to_query (List.append path [ "ServiceName" ]) x.service_name;
    ]

let access_details_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" access_detail_to_query path xs

let get_organizations_access_report_response_to_query path
    (x : get_organizations_access_report_response) =
  List.concat
    [
      (match x.error_details with
      | None -> []
      | Some v -> error_details_to_query (List.append path [ "ErrorDetails" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.access_details with
      | None -> []
      | Some v -> access_details_to_query (List.append path [ "AccessDetails" ]) v);
      (match x.number_of_services_not_accessed with
      | None -> []
      | Some v -> integer_type_to_query (List.append path [ "NumberOfServicesNotAccessed" ]) v);
      (match x.number_of_services_accessible with
      | None -> []
      | Some v -> integer_type_to_query (List.append path [ "NumberOfServicesAccessible" ]) v);
      (match x.job_completion_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "JobCompletionDate" ]) v);
      date_type_to_query (List.append path [ "JobCreationDate" ]) x.job_creation_date;
      job_status_type_to_query (List.append path [ "JobStatus" ]) x.job_status;
    ]

let get_organizations_access_report_request_to_query path
    (x : get_organizations_access_report_request) =
  List.concat
    [
      (match x.sort_key with
      | None -> []
      | Some v -> sort_key_type_to_query (List.append path [ "SortKey" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      job_id_type_to_query (List.append path [ "JobId" ]) x.job_id;
    ]

let get_open_id_connect_provider_response_to_query path (x : get_open_id_connect_provider_response)
    =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      (match x.thumbprint_list with
      | None -> []
      | Some v -> thumbprint_list_type_to_query (List.append path [ "ThumbprintList" ]) v);
      (match x.client_id_list with
      | None -> []
      | Some v -> client_id_list_type_to_query (List.append path [ "ClientIDList" ]) v);
      (match x.url with
      | None -> []
      | Some v -> open_id_connect_provider_url_type_to_query (List.append path [ "Url" ]) v);
    ]

let get_open_id_connect_provider_request_to_query path (x : get_open_id_connect_provider_request) =
  List.concat
    [
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let certification_value_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let certification_key_type_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let certification_map_type_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" certification_key_type_to_query
    certification_value_type_to_query path pairs

let get_mfa_device_response_to_query path (x : get_mfa_device_response) =
  List.concat
    [
      (match x.certifications with
      | None -> []
      | Some v -> certification_map_type_to_query (List.append path [ "Certifications" ]) v);
      (match x.enable_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "EnableDate" ]) v);
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let get_mfa_device_request_to_query path (x : get_mfa_device_request) =
  List.concat
    [
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
    ]

let get_login_profile_response_to_query path (x : get_login_profile_response) =
  List.concat [ login_profile_to_query (List.append path [ "LoginProfile" ]) x.login_profile ]

let get_login_profile_request_to_query path (x : get_login_profile_request) =
  List.concat
    [
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let get_instance_profile_response_to_query path (x : get_instance_profile_response) =
  List.concat
    [ instance_profile_to_query (List.append path [ "InstanceProfile" ]) x.instance_profile ]

let get_instance_profile_request_to_query path (x : get_instance_profile_request) =
  List.concat
    [
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let get_human_readable_summary_response_to_query path (x : get_human_readable_summary_response) =
  List.concat
    [
      (match x.summary_state with
      | None -> []
      | Some v -> summary_state_type_to_query (List.append path [ "SummaryState" ]) v);
      (match x.locale with
      | None -> []
      | Some v -> locale_type_to_query (List.append path [ "Locale" ]) v);
      (match x.summary_content with
      | None -> []
      | Some v -> summary_content_type_to_query (List.append path [ "SummaryContent" ]) v);
    ]

let get_human_readable_summary_request_to_query path (x : get_human_readable_summary_request) =
  List.concat
    [
      (match x.locale with
      | None -> []
      | Some v -> locale_type_to_query (List.append path [ "Locale" ]) v);
      arn_type_to_query (List.append path [ "EntityArn" ]) x.entity_arn;
    ]

let get_group_response_to_query path (x : get_group_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      user_list_type_to_query (List.append path [ "Users" ]) x.users;
      group_to_query (List.append path [ "Group" ]) x.group;
    ]

let get_group_request_to_query path (x : get_group_request) =
  List.concat
    [
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let get_group_policy_response_to_query path (x : get_group_policy_response) =
  List.concat
    [
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let get_group_policy_request_to_query path (x : get_group_policy_request) =
  List.concat
    [
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let get_delegation_request_response_to_query path (x : get_delegation_request_response) =
  List.concat
    [
      (match x.permission_check_result with
      | None -> []
      | Some v ->
          permission_check_result_type_to_query (List.append path [ "PermissionCheckResult" ]) v);
      (match x.permission_check_status with
      | None -> []
      | Some v ->
          permission_check_status_type_to_query (List.append path [ "PermissionCheckStatus" ]) v);
      (match x.delegation_request with
      | None -> []
      | Some v -> delegation_request_to_query (List.append path [ "DelegationRequest" ]) v);
    ]

let get_delegation_request_request_to_query path (x : get_delegation_request_request) =
  List.concat
    [
      (match x.delegation_permission_check with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "DelegationPermissionCheck" ]) v);
      delegation_request_id_type_to_query
        (List.append path [ "DelegationRequestId" ])
        x.delegation_request_id;
    ]

let get_credential_report_response_to_query path (x : get_credential_report_response) =
  List.concat
    [
      (match x.generated_time with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "GeneratedTime" ]) v);
      (match x.report_format with
      | None -> []
      | Some v -> report_format_type_to_query (List.append path [ "ReportFormat" ]) v);
      (match x.content with
      | None -> []
      | Some v -> report_content_type_to_query (List.append path [ "Content" ]) v);
    ]

let credential_report_not_ready_exception_to_query path (x : credential_report_not_ready_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          credential_report_not_ready_exception_message_to_query (List.append path [ "message" ]) v);
    ]

let credential_report_not_present_exception_to_query path
    (x : credential_report_not_present_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          credential_report_not_present_exception_message_to_query (List.append path [ "message" ])
            v);
    ]

let credential_report_expired_exception_to_query path (x : credential_report_expired_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          credential_report_expired_exception_message_to_query (List.append path [ "message" ]) v);
    ]

let get_context_keys_for_principal_policy_request_to_query path
    (x : get_context_keys_for_principal_policy_request) =
  List.concat
    [
      (match x.policy_input_list with
      | None -> []
      | Some v -> simulation_policy_list_type_to_query (List.append path [ "PolicyInputList" ]) v);
      arn_type_to_query (List.append path [ "PolicySourceArn" ]) x.policy_source_arn;
    ]

let get_context_keys_for_policy_response_to_query path (x : get_context_keys_for_policy_response) =
  List.concat
    [
      (match x.context_key_names with
      | None -> []
      | Some v ->
          context_key_names_result_list_type_to_query (List.append path [ "ContextKeyNames" ]) v);
    ]

let get_context_keys_for_custom_policy_request_to_query path
    (x : get_context_keys_for_custom_policy_request) =
  List.concat
    [
      simulation_policy_list_type_to_query
        (List.append path [ "PolicyInputList" ])
        x.policy_input_list;
    ]

let get_account_summary_response_to_query path (x : get_account_summary_response) =
  List.concat
    [
      (match x.summary_map with
      | None -> []
      | Some v -> summary_map_type_to_query (List.append path [ "SummaryMap" ]) v);
    ]

let get_account_password_policy_response_to_query path (x : get_account_password_policy_response) =
  List.concat [ password_policy_to_query (List.append path [ "PasswordPolicy" ]) x.password_policy ]

let get_account_authorization_details_response_to_query path
    (x : get_account_authorization_details_response) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> response_marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.is_truncated with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "IsTruncated" ]) v);
      (match x.policies with
      | None -> []
      | Some v -> managed_policy_detail_list_type_to_query (List.append path [ "Policies" ]) v);
      (match x.role_detail_list with
      | None -> []
      | Some v -> role_detail_list_type_to_query (List.append path [ "RoleDetailList" ]) v);
      (match x.group_detail_list with
      | None -> []
      | Some v -> group_detail_list_type_to_query (List.append path [ "GroupDetailList" ]) v);
      (match x.user_detail_list with
      | None -> []
      | Some v -> user_detail_list_type_to_query (List.append path [ "UserDetailList" ]) v);
    ]

let get_account_authorization_details_request_to_query path
    (x : get_account_authorization_details_request) =
  List.concat
    [
      (match x.marker with
      | None -> []
      | Some v -> marker_type_to_query (List.append path [ "Marker" ]) v);
      (match x.max_items with
      | None -> []
      | Some v -> max_items_type_to_query (List.append path [ "MaxItems" ]) v);
      (match x.filter with
      | None -> []
      | Some v -> entity_list_type_to_query (List.append path [ "Filter" ]) v);
    ]

let access_key_last_used_to_query path (x : access_key_last_used) =
  List.concat
    [
      string_type_to_query (List.append path [ "Region" ]) x.region;
      string_type_to_query (List.append path [ "ServiceName" ]) x.service_name;
      (match x.last_used_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "LastUsedDate" ]) v);
    ]

let get_access_key_last_used_response_to_query path (x : get_access_key_last_used_response) =
  List.concat
    [
      (match x.access_key_last_used with
      | None -> []
      | Some v -> access_key_last_used_to_query (List.append path [ "AccessKeyLastUsed" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let get_access_key_last_used_request_to_query path (x : get_access_key_last_used_request) =
  List.concat [ access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) x.access_key_id ]

let generate_service_last_accessed_details_response_to_query path
    (x : generate_service_last_accessed_details_response) =
  List.concat
    [
      (match x.job_id with
      | None -> []
      | Some v -> job_id_type_to_query (List.append path [ "JobId" ]) v);
    ]

let generate_service_last_accessed_details_request_to_query path
    (x : generate_service_last_accessed_details_request) =
  List.concat
    [
      (match x.granularity with
      | None -> []
      | Some v ->
          access_advisor_usage_granularity_type_to_query (List.append path [ "Granularity" ]) v);
      arn_type_to_query (List.append path [ "Arn" ]) x.arn;
    ]

let generate_organizations_access_report_response_to_query path
    (x : generate_organizations_access_report_response) =
  List.concat
    [
      (match x.job_id with
      | None -> []
      | Some v -> job_id_type_to_query (List.append path [ "JobId" ]) v);
    ]

let generate_organizations_access_report_request_to_query path
    (x : generate_organizations_access_report_request) =
  List.concat
    [
      (match x.organizations_policy_id with
      | None -> []
      | Some v ->
          organizations_policy_id_type_to_query (List.append path [ "OrganizationsPolicyId" ]) v);
      organizations_entity_path_type_to_query (List.append path [ "EntityPath" ]) x.entity_path;
    ]

let generate_credential_report_response_to_query path (x : generate_credential_report_response) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> report_state_description_type_to_query (List.append path [ "Description" ]) v);
      (match x.state with
      | None -> []
      | Some v -> report_state_type_to_query (List.append path [ "State" ]) v);
    ]

let feature_enabled_message_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let feature_enabled_exception_to_query path (x : feature_enabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> feature_enabled_message_to_query (List.append path [ "message" ]) v);
    ]

let enable_outbound_web_identity_federation_response_to_query path
    (x : enable_outbound_web_identity_federation_response) =
  List.concat
    [
      (match x.issuer_identifier with
      | None -> []
      | Some v -> string_type_to_query (List.append path [ "IssuerIdentifier" ]) v);
    ]

let enable_organizations_root_sessions_response_to_query path
    (x : enable_organizations_root_sessions_response) =
  List.concat
    [
      (match x.enabled_features with
      | None -> []
      | Some v -> features_list_type_to_query (List.append path [ "EnabledFeatures" ]) v);
      (match x.organization_id with
      | None -> []
      | Some v -> organization_id_type_to_query (List.append path [ "OrganizationId" ]) v);
    ]

let enable_organizations_root_sessions_request_to_query path _x = []

let caller_is_not_management_account_exception_to_query path
    (x : caller_is_not_management_account_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> exception_message_to_query (List.append path [ "Message" ]) v);
    ]

let enable_organizations_root_credentials_management_response_to_query path
    (x : enable_organizations_root_credentials_management_response) =
  List.concat
    [
      (match x.enabled_features with
      | None -> []
      | Some v -> features_list_type_to_query (List.append path [ "EnabledFeatures" ]) v);
      (match x.organization_id with
      | None -> []
      | Some v -> organization_id_type_to_query (List.append path [ "OrganizationId" ]) v);
    ]

let enable_organizations_root_credentials_management_request_to_query path _x = []

let enable_mfa_device_request_to_query path (x : enable_mfa_device_request) =
  List.concat
    [
      authentication_code_type_to_query
        (List.append path [ "AuthenticationCode2" ])
        x.authentication_code2;
      authentication_code_type_to_query
        (List.append path [ "AuthenticationCode1" ])
        x.authentication_code1;
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let disable_organizations_root_sessions_response_to_query path
    (x : disable_organizations_root_sessions_response) =
  List.concat
    [
      (match x.enabled_features with
      | None -> []
      | Some v -> features_list_type_to_query (List.append path [ "EnabledFeatures" ]) v);
      (match x.organization_id with
      | None -> []
      | Some v -> organization_id_type_to_query (List.append path [ "OrganizationId" ]) v);
    ]

let disable_organizations_root_sessions_request_to_query path _x = []

let disable_organizations_root_credentials_management_response_to_query path
    (x : disable_organizations_root_credentials_management_response) =
  List.concat
    [
      (match x.enabled_features with
      | None -> []
      | Some v -> features_list_type_to_query (List.append path [ "EnabledFeatures" ]) v);
      (match x.organization_id with
      | None -> []
      | Some v -> organization_id_type_to_query (List.append path [ "OrganizationId" ]) v);
    ]

let disable_organizations_root_credentials_management_request_to_query path _x = []

let detach_user_policy_request_to_query path (x : detach_user_policy_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let detach_role_policy_request_to_query path (x : detach_role_policy_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let detach_group_policy_request_to_query path (x : detach_group_policy_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let delete_virtual_mfa_device_request_to_query path (x : delete_virtual_mfa_device_request) =
  List.concat [ serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number ]

let delete_conflict_exception_to_query path (x : delete_conflict_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> delete_conflict_message_to_query (List.append path [ "message" ]) v);
    ]

let delete_user_request_to_query path (x : delete_user_request) =
  List.concat [ existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name ]

let delete_user_policy_request_to_query path (x : delete_user_policy_request) =
  List.concat
    [
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let delete_user_permissions_boundary_request_to_query path
    (x : delete_user_permissions_boundary_request) =
  List.concat [ user_name_type_to_query (List.append path [ "UserName" ]) x.user_name ]

let delete_signing_certificate_request_to_query path (x : delete_signing_certificate_request) =
  List.concat
    [
      certificate_id_type_to_query (List.append path [ "CertificateId" ]) x.certificate_id;
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let delete_service_specific_credential_request_to_query path
    (x : delete_service_specific_credential_request) =
  List.concat
    [
      service_specific_credential_id_to_query
        (List.append path [ "ServiceSpecificCredentialId" ])
        x.service_specific_credential_id;
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let delete_service_linked_role_response_to_query path (x : delete_service_linked_role_response) =
  List.concat
    [ deletion_task_id_type_to_query (List.append path [ "DeletionTaskId" ]) x.deletion_task_id ]

let delete_service_linked_role_request_to_query path (x : delete_service_linked_role_request) =
  List.concat [ role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name ]

let delete_server_certificate_request_to_query path (x : delete_server_certificate_request) =
  List.concat
    [
      server_certificate_name_type_to_query
        (List.append path [ "ServerCertificateName" ])
        x.server_certificate_name;
    ]

let delete_ssh_public_key_request_to_query path (x : delete_ssh_public_key_request) =
  List.concat
    [
      public_key_id_type_to_query (List.append path [ "SSHPublicKeyId" ]) x.ssh_public_key_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let delete_saml_provider_request_to_query path (x : delete_saml_provider_request) =
  List.concat [ arn_type_to_query (List.append path [ "SAMLProviderArn" ]) x.saml_provider_arn ]

let delete_role_request_to_query path (x : delete_role_request) =
  List.concat [ role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name ]

let delete_role_policy_request_to_query path (x : delete_role_policy_request) =
  List.concat
    [
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let delete_role_permissions_boundary_request_to_query path
    (x : delete_role_permissions_boundary_request) =
  List.concat [ role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name ]

let delete_policy_version_request_to_query path (x : delete_policy_version_request) =
  List.concat
    [
      policy_version_id_type_to_query (List.append path [ "VersionId" ]) x.version_id;
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let delete_policy_request_to_query path (x : delete_policy_request) =
  List.concat [ arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn ]

let delete_open_id_connect_provider_request_to_query path
    (x : delete_open_id_connect_provider_request) =
  List.concat
    [
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let delete_login_profile_request_to_query path (x : delete_login_profile_request) =
  List.concat
    [
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let delete_instance_profile_request_to_query path (x : delete_instance_profile_request) =
  List.concat
    [
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let delete_group_request_to_query path (x : delete_group_request) =
  List.concat [ group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name ]

let delete_group_policy_request_to_query path (x : delete_group_policy_request) =
  List.concat
    [
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let delete_account_alias_request_to_query path (x : delete_account_alias_request) =
  List.concat [ account_alias_type_to_query (List.append path [ "AccountAlias" ]) x.account_alias ]

let delete_access_key_request_to_query path (x : delete_access_key_request) =
  List.concat
    [
      access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) x.access_key_id;
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let deactivate_mfa_device_request_to_query path (x : deactivate_mfa_device_request) =
  List.concat
    [
      serial_number_type_to_query (List.append path [ "SerialNumber" ]) x.serial_number;
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let create_virtual_mfa_device_response_to_query path (x : create_virtual_mfa_device_response) =
  List.concat
    [ virtual_mfa_device_to_query (List.append path [ "VirtualMFADevice" ]) x.virtual_mfa_device ]

let create_virtual_mfa_device_request_to_query path (x : create_virtual_mfa_device_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      virtual_mfa_device_name_to_query
        (List.append path [ "VirtualMFADeviceName" ])
        x.virtual_mfa_device_name;
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let create_user_response_to_query path (x : create_user_response) =
  List.concat
    [ (match x.user with None -> [] | Some v -> user_to_query (List.append path [ "User" ]) v) ]

let create_user_request_to_query path (x : create_user_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.permissions_boundary with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "PermissionsBoundary" ]) v);
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let create_service_specific_credential_response_to_query path
    (x : create_service_specific_credential_response) =
  List.concat
    [
      (match x.service_specific_credential with
      | None -> []
      | Some v ->
          service_specific_credential_to_query (List.append path [ "ServiceSpecificCredential" ]) v);
    ]

let create_service_specific_credential_request_to_query path
    (x : create_service_specific_credential_request) =
  List.concat
    [
      (match x.credential_age_days with
      | None -> []
      | Some v -> credential_age_days_to_query (List.append path [ "CredentialAgeDays" ]) v);
      service_name_to_query (List.append path [ "ServiceName" ]) x.service_name;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let create_service_linked_role_response_to_query path (x : create_service_linked_role_response) =
  List.concat
    [ (match x.role with None -> [] | Some v -> role_to_query (List.append path [ "Role" ]) v) ]

let create_service_linked_role_request_to_query path (x : create_service_linked_role_request) =
  List.concat
    [
      (match x.custom_suffix with
      | None -> []
      | Some v -> custom_suffix_type_to_query (List.append path [ "CustomSuffix" ]) v);
      (match x.description with
      | None -> []
      | Some v -> role_description_type_to_query (List.append path [ "Description" ]) v);
      group_name_type_to_query (List.append path [ "AWSServiceName" ]) x.aws_service_name;
    ]

let create_saml_provider_response_to_query path (x : create_saml_provider_response) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.saml_provider_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "SAMLProviderArn" ]) v);
    ]

let create_saml_provider_request_to_query path (x : create_saml_provider_request) =
  List.concat
    [
      (match x.add_private_key with
      | None -> []
      | Some v -> private_key_type_to_query (List.append path [ "AddPrivateKey" ]) v);
      (match x.assertion_encryption_mode with
      | None -> []
      | Some v ->
          assertion_encryption_mode_type_to_query (List.append path [ "AssertionEncryptionMode" ]) v);
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      saml_provider_name_type_to_query (List.append path [ "Name" ]) x.name;
      saml_metadata_document_type_to_query
        (List.append path [ "SAMLMetadataDocument" ])
        x.saml_metadata_document;
    ]

let create_role_response_to_query path (x : create_role_response) =
  List.concat [ role_to_query (List.append path [ "Role" ]) x.role ]

let create_role_request_to_query path (x : create_role_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.permissions_boundary with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "PermissionsBoundary" ]) v);
      (match x.max_session_duration with
      | None -> []
      | Some v ->
          role_max_session_duration_type_to_query (List.append path [ "MaxSessionDuration" ]) v);
      (match x.description with
      | None -> []
      | Some v -> role_description_type_to_query (List.append path [ "Description" ]) v);
      policy_document_type_to_query
        (List.append path [ "AssumeRolePolicyDocument" ])
        x.assume_role_policy_document;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let create_policy_version_response_to_query path (x : create_policy_version_response) =
  List.concat
    [
      (match x.policy_version with
      | None -> []
      | Some v -> policy_version_to_query (List.append path [ "PolicyVersion" ]) v);
    ]

let create_policy_version_request_to_query path (x : create_policy_version_request) =
  List.concat
    [
      (match x.set_as_default with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "SetAsDefault" ]) v);
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
    ]

let create_policy_response_to_query path (x : create_policy_response) =
  List.concat
    [
      (match x.policy with
      | None -> []
      | Some v -> policy_to_query (List.append path [ "Policy" ]) v);
    ]

let create_policy_request_to_query path (x : create_policy_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.description with
      | None -> []
      | Some v -> policy_description_type_to_query (List.append path [ "Description" ]) v);
      policy_document_type_to_query (List.append path [ "PolicyDocument" ]) x.policy_document;
      (match x.path with
      | None -> []
      | Some v -> policy_path_type_to_query (List.append path [ "Path" ]) v);
      policy_name_type_to_query (List.append path [ "PolicyName" ]) x.policy_name;
    ]

let create_open_id_connect_provider_response_to_query path
    (x : create_open_id_connect_provider_response) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.open_id_connect_provider_arn with
      | None -> []
      | Some v -> arn_type_to_query (List.append path [ "OpenIDConnectProviderArn" ]) v);
    ]

let create_open_id_connect_provider_request_to_query path
    (x : create_open_id_connect_provider_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.thumbprint_list with
      | None -> []
      | Some v -> thumbprint_list_type_to_query (List.append path [ "ThumbprintList" ]) v);
      (match x.client_id_list with
      | None -> []
      | Some v -> client_id_list_type_to_query (List.append path [ "ClientIDList" ]) v);
      open_id_connect_provider_url_type_to_query (List.append path [ "Url" ]) x.url;
    ]

let create_login_profile_response_to_query path (x : create_login_profile_response) =
  List.concat [ login_profile_to_query (List.append path [ "LoginProfile" ]) x.login_profile ]

let create_login_profile_request_to_query path (x : create_login_profile_request) =
  List.concat
    [
      (match x.password_reset_required with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "PasswordResetRequired" ]) v);
      (match x.password with
      | None -> []
      | Some v -> password_type_to_query (List.append path [ "Password" ]) v);
      (match x.user_name with
      | None -> []
      | Some v -> user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let create_instance_profile_response_to_query path (x : create_instance_profile_response) =
  List.concat
    [ instance_profile_to_query (List.append path [ "InstanceProfile" ]) x.instance_profile ]

let create_instance_profile_request_to_query path (x : create_instance_profile_request) =
  List.concat
    [
      (match x.tags with
      | None -> []
      | Some v -> tag_list_type_to_query (List.append path [ "Tags" ]) v);
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let create_group_response_to_query path (x : create_group_response) =
  List.concat [ group_to_query (List.append path [ "Group" ]) x.group ]

let create_group_request_to_query path (x : create_group_request) =
  List.concat
    [
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
      (match x.path with
      | None -> []
      | Some v -> path_type_to_query (List.append path [ "Path" ]) v);
    ]

let create_delegation_request_response_to_query path (x : create_delegation_request_response) =
  List.concat
    [
      (match x.delegation_request_id with
      | None -> []
      | Some v -> delegation_request_id_type_to_query (List.append path [ "DelegationRequestId" ]) v);
      (match x.console_deep_link with
      | None -> []
      | Some v -> console_deep_link_type_to_query (List.append path [ "ConsoleDeepLink" ]) v);
    ]

let create_delegation_request_request_to_query path (x : create_delegation_request_request) =
  List.concat
    [
      (match x.only_send_by_owner with
      | None -> []
      | Some v -> boolean_type_to_query (List.append path [ "OnlySendByOwner" ]) v);
      session_duration_type_to_query (List.append path [ "SessionDuration" ]) x.session_duration;
      notification_channel_type_to_query
        (List.append path [ "NotificationChannel" ])
        x.notification_channel;
      (match x.redirect_url with
      | None -> []
      | Some v -> redirect_url_type_to_query (List.append path [ "RedirectUrl" ]) v);
      requestor_workflow_id_type_to_query
        (List.append path [ "RequestorWorkflowId" ])
        x.requestor_workflow_id;
      (match x.request_message with
      | None -> []
      | Some v -> request_message_type_to_query (List.append path [ "RequestMessage" ]) v);
      delegation_permission_to_query (List.append path [ "Permissions" ]) x.permissions;
      delegation_request_description_type_to_query
        (List.append path [ "Description" ])
        x.description;
      (match x.owner_account_id with
      | None -> []
      | Some v -> account_id_type_to_query (List.append path [ "OwnerAccountId" ]) v);
    ]

let create_account_alias_request_to_query path (x : create_account_alias_request) =
  List.concat [ account_alias_type_to_query (List.append path [ "AccountAlias" ]) x.account_alias ]

let access_key_to_query path (x : access_key) =
  List.concat
    [
      (match x.create_date with
      | None -> []
      | Some v -> date_type_to_query (List.append path [ "CreateDate" ]) v);
      access_key_secret_type_to_query (List.append path [ "SecretAccessKey" ]) x.secret_access_key;
      status_type_to_query (List.append path [ "Status" ]) x.status;
      access_key_id_type_to_query (List.append path [ "AccessKeyId" ]) x.access_key_id;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let create_access_key_response_to_query path (x : create_access_key_response) =
  List.concat [ access_key_to_query (List.append path [ "AccessKey" ]) x.access_key ]

let create_access_key_request_to_query path (x : create_access_key_request) =
  List.concat
    [
      (match x.user_name with
      | None -> []
      | Some v -> existing_user_name_type_to_query (List.append path [ "UserName" ]) v);
    ]

let change_password_request_to_query path (x : change_password_request) =
  List.concat
    [
      password_type_to_query (List.append path [ "NewPassword" ]) x.new_password;
      password_type_to_query (List.append path [ "OldPassword" ]) x.old_password;
    ]

let attach_user_policy_request_to_query path (x : attach_user_policy_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
      user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
    ]

let attach_role_policy_request_to_query path (x : attach_role_policy_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
    ]

let attach_group_policy_request_to_query path (x : attach_group_policy_request) =
  List.concat
    [
      arn_type_to_query (List.append path [ "PolicyArn" ]) x.policy_arn;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let associate_delegation_request_request_to_query path (x : associate_delegation_request_request) =
  List.concat
    [
      delegation_request_id_type_to_query
        (List.append path [ "DelegationRequestId" ])
        x.delegation_request_id;
    ]

let add_user_to_group_request_to_query path (x : add_user_to_group_request) =
  List.concat
    [
      existing_user_name_type_to_query (List.append path [ "UserName" ]) x.user_name;
      group_name_type_to_query (List.append path [ "GroupName" ]) x.group_name;
    ]

let add_role_to_instance_profile_request_to_query path (x : add_role_to_instance_profile_request) =
  List.concat
    [
      role_name_type_to_query (List.append path [ "RoleName" ]) x.role_name;
      instance_profile_name_type_to_query
        (List.append path [ "InstanceProfileName" ])
        x.instance_profile_name;
    ]

let add_client_id_to_open_id_connect_provider_request_to_query path
    (x : add_client_id_to_open_id_connect_provider_request) =
  List.concat
    [
      client_id_type_to_query (List.append path [ "ClientID" ]) x.client_i_d;
      arn_type_to_query
        (List.append path [ "OpenIDConnectProviderArn" ])
        x.open_id_connect_provider_arn;
    ]

let accept_delegation_request_request_to_query path (x : accept_delegation_request_request) =
  List.concat
    [
      delegation_request_id_type_to_query
        (List.append path [ "DelegationRequestId" ])
        x.delegation_request_id;
    ]
