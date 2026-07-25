type nonrec access_control_attribute_value_source = string [@@ocaml.doc ""]

type nonrec access_control_attribute_value_source_list = access_control_attribute_value_source list
[@@ocaml.doc ""]

type nonrec access_control_attribute_value = {
  source : access_control_attribute_value_source_list;
      [@ocaml.doc
        "The identity source to use when mapping a specified attribute to IAM Identity Center.\n"]
}
[@@ocaml.doc
  "The value used for mapping a specified attribute to an identity source. For more information, \
   see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/attributemappingsconcept.html}Attribute \
   mappings} in the {i IAM Identity Center User Guide}.\n"]

type nonrec access_control_attribute_key = string [@@ocaml.doc ""]

type nonrec access_control_attribute = {
  key : access_control_attribute_key;
      [@ocaml.doc
        "The name of the attribute associated with your identities in your identity source. This \
         is used to map a specified attribute in your identity source with an attribute in IAM \
         Identity Center.\n"]
  value : access_control_attribute_value;
      [@ocaml.doc "The value used for mapping a specified attribute to an identity source.\n"]
}
[@@ocaml.doc
  "These are IAM Identity Center identity store attributes that you can configure for use in \
   attributes-based access control (ABAC). You can create permissions policies that determine who \
   can access your Amazon Web Services resources based upon the configured attribute values. When \
   you enable ABAC and specify [AccessControlAttributes], IAM Identity Center passes the attribute \
   values of the authenticated user into IAM for use in policy evaluation.\n"]

type nonrec access_control_attribute_list = access_control_attribute list [@@ocaml.doc ""]

type nonrec access_denied_exception_reason = KMS_ACCESS_DENIED_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception_message = string [@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : access_denied_exception_message option; [@ocaml.doc ""]
  reason : access_denied_exception_reason option;
      [@ocaml.doc "The reason for the access denied exception.\n"]
}
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec principal_id = string [@@ocaml.doc ""]

type nonrec principal_type = USER [@ocaml.doc ""] | GROUP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec permission_set_arn = string [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec account_assignment = {
  account_id : account_id option;
      [@ocaml.doc "The identifier of the Amazon Web Services account.\n"]
  permission_set_arn : permission_set_arn option;
      [@ocaml.doc
        "The ARN of the permission set. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  principal_type : principal_type option;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
  principal_id : principal_id option;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM Identity Center \
         Identity Store API Reference}.\n"]
}
[@@ocaml.doc
  "The assignment that indicates a principal's limited access to a specified Amazon Web Services \
   account with a specified permission set.\n\n\
  \  The term {i principal} here refers to a user or group that is defined in IAM Identity Center.\n\
  \  \n\
  \   "]

type nonrec account_assignment_for_principal = {
  account_id : account_id option;
      [@ocaml.doc "The account ID number of the Amazon Web Services account.\n"]
  permission_set_arn : permission_set_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center permission set assigned to this principal for this \
         Amazon Web Services account.\n"]
  principal_id : principal_id option; [@ocaml.doc "The ID of the principal.\n"]
  principal_type : principal_type option; [@ocaml.doc "The type of the principal.\n"]
}
[@@ocaml.doc
  "A structure that describes an assignment of an Amazon Web Services account to a principal and \
   the permissions that principal has in the account.\n"]

type nonrec account_assignment_list = account_assignment list [@@ocaml.doc ""]

type nonrec account_assignment_list_for_principal = account_assignment_for_principal list
[@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec target_type = AWS_ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec target_id = string [@@ocaml.doc ""]

type nonrec reason = string [@@ocaml.doc ""]

type nonrec uu_id = string [@@ocaml.doc ""]

type nonrec status_values =
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_assignment_operation_status = {
  status : status_values option;
      [@ocaml.doc "The status of the permission set provisioning process.\n"]
  request_id : uu_id option;
      [@ocaml.doc
        "The identifier for tracking the request operation that is generated by the universally \
         unique identifier (UUID) workflow.\n"]
  failure_reason : reason option;
      [@ocaml.doc
        "The message that contains an error or exception in case of an operation failure.\n"]
  target_id : target_id option;
      [@ocaml.doc
        "TargetID is an Amazon Web Services account identifier, (For example, 123456789012).\n"]
  target_type : target_type option;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
  permission_set_arn : permission_set_arn option;
      [@ocaml.doc
        "The ARN of the permission set. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  principal_type : principal_type option;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
  principal_id : principal_id option;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM Identity Center \
         Identity Store API Reference}.\n"]
  created_date : date option; [@ocaml.doc "The date that the permission set was created.\n"]
}
[@@ocaml.doc
  "The status of the creation or deletion operation of an assignment that a principal needs to \
   access an account.\n"]

type nonrec account_assignment_operation_status_metadata = {
  status : status_values option;
      [@ocaml.doc "The status of the permission set provisioning process.\n"]
  request_id : uu_id option;
      [@ocaml.doc
        "The identifier for tracking the request operation that is generated by the universally \
         unique identifier (UUID) workflow.\n"]
  created_date : date option; [@ocaml.doc "The date that the permission set was created.\n"]
}
[@@ocaml.doc "Provides information about the [AccountAssignment] creation request.\n"]

type nonrec account_assignment_operation_status_list =
  account_assignment_operation_status_metadata list
[@@ocaml.doc ""]

type nonrec account_list = account_id list [@@ocaml.doc ""]

type nonrec actor_policy_document = Smaws_Lib.CoreTypes.Document.t [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | KMS_INVALID_KEY_USAGE_EXCEPTION [@ocaml.doc ""]
  | KMS_INVALID_STATE_EXCEPTION [@ocaml.doc ""]
  | KMS_DISABLED_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_message = string [@@ocaml.doc ""]

type nonrec validation_exception = {
  message : validation_exception_message option; [@ocaml.doc ""]
  reason : validation_exception_reason option;
      [@ocaml.doc "The reason for the validation exception.\n"]
}
[@@ocaml.doc "The request failed because it contains a syntax error.\n"]

type nonrec throttling_exception_reason = KMS_THROTTLING_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec throttling_exception_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : throttling_exception_message option; [@ocaml.doc ""]
  reason : throttling_exception_reason option;
      [@ocaml.doc "The reason for the throttling exception.\n"]
}
[@@ocaml.doc
  "Indicates that the principal has crossed the throttling limits of the API operations.\n"]

type nonrec service_quota_exceeded_message = string [@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : service_quota_exceeded_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the principal has crossed the permitted number of resources that can be created.\n"]

type nonrec internal_failure_message = string [@@ocaml.doc ""]

type nonrec internal_server_exception = {
  message : internal_failure_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request processing has failed because of an unknown error, exception, or failure with an \
   internal server.\n"]

type nonrec conflict_exception_message = string [@@ocaml.doc ""]

type nonrec conflict_exception = { message : conflict_exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Occurs when a conflict with a previous successful write is detected. This generally occurs when \
   the previous write did not have time to propagate to the host serving the current request. A \
   retry (with appropriate backoff logic) is the recommended response to this exception.\n"]

type nonrec region_status =
  | ACTIVE [@ocaml.doc ""]
  | ADDING [@ocaml.doc ""]
  | REMOVING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec add_region_response = {
  status : region_status option;
      [@ocaml.doc
        "The status of the Region after the Add operation. The status is ADDING when the \
         asynchronous workflow is in progress and changes to ACTIVE when complete.\n"]
}
[@@ocaml.doc ""]

type nonrec region_name = string [@@ocaml.doc ""]

type nonrec instance_arn = string [@@ocaml.doc ""]

type nonrec add_region_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Identity Center instance to replicate to the \
         target Region.\n"]
  region_name : region_name;
      [@ocaml.doc
        "The name of the Amazon Web Services Region to add to the IAM Identity Center instance. \
         The Region name must be 1-32 characters long and follow the pattern of Amazon Web \
         Services Region names (for example, us-east-1).\n"]
}
[@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec application_visibility = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec application_url = string [@@ocaml.doc ""]

type nonrec sign_in_origin = IDENTITY_CENTER [@ocaml.doc ""] | APPLICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sign_in_options = {
  origin : sign_in_origin;
      [@ocaml.doc
        "This determines how IAM Identity Center navigates the user to the target application. It \
         can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [APPLICATION]: IAM Identity Center redirects the customer to the configured \
         [ApplicationUrl].\n\
        \           \n\
        \            }\n\
        \       {-   [IDENTITY_CENTER]: IAM Identity Center uses SAML identity-provider initiated \
         authentication to sign the customer directly into a SAML-based application.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  application_url : application_url option;
      [@ocaml.doc
        "The URL that accepts authentication requests for an application. This is a required \
         parameter if the [Origin] parameter is [APPLICATION].\n"]
}
[@@ocaml.doc "A structure that describes the sign-in options for an application portal.\n"]

type nonrec portal_options = {
  sign_in_options : sign_in_options option;
      [@ocaml.doc "A structure that describes the sign-in options for the access portal.\n"]
  visibility : application_visibility option;
      [@ocaml.doc "Indicates whether this application is visible in the access portal.\n"]
}
[@@ocaml.doc
  "A structure that describes the options for the access portal associated with an application.\n"]

type nonrec application_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec identity_store_arn = string [@@ocaml.doc ""]

type nonrec application_name_type = string [@@ocaml.doc ""]

type nonrec application_provider_arn = string [@@ocaml.doc ""]

type nonrec application_arn = string [@@ocaml.doc ""]

type nonrec application = {
  application_arn : application_arn option; [@ocaml.doc "The ARN of the application.\n"]
  application_provider_arn : application_provider_arn option;
      [@ocaml.doc "The ARN of the application provider for this application.\n"]
  name : application_name_type option; [@ocaml.doc "The name of the application.\n"]
  application_account : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID number of the application.\n"]
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center that is configured with this application.\n"]
  identity_store_arn : identity_store_arn option;
      [@ocaml.doc
        "The ARN of the identity store that is connected to the instance of IAM Identity Center.\n"]
  status : application_status option;
      [@ocaml.doc
        "The current status of the application in this instance of IAM Identity Center.\n"]
  portal_options : portal_options option;
      [@ocaml.doc
        "A structure that describes the options for the access portal associated with this \
         application.\n"]
  description : description option; [@ocaml.doc "The description of the application.\n"]
  created_date : date option;
      [@ocaml.doc "The date and time when the application was originally created.\n"]
  created_from : region_name option;
      [@ocaml.doc
        "The Amazon Web Services Region where the application was created in IAM Identity Center.\n"]
}
[@@ocaml.doc
  "A structure that describes an application that uses IAM Identity Center for access management.\n"]

type nonrec application_access_scope_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec application_assignment = {
  application_arn : application_arn;
      [@ocaml.doc "The ARN of the application that has principals assigned.\n"]
  principal_id : principal_id;
      [@ocaml.doc "The unique identifier of the principal assigned to the application.\n"]
  principal_type : principal_type;
      [@ocaml.doc "The type of the principal assigned to the application.\n"]
}
[@@ocaml.doc "A structure that describes an assignment of a principal to an application.\n"]

type nonrec application_assignment_for_principal = {
  application_arn : application_arn option;
      [@ocaml.doc "The ARN of the application to which the specified principal is assigned.\n"]
  principal_id : principal_id option;
      [@ocaml.doc "The unique identifier of the principal assigned to the application.\n"]
  principal_type : principal_type option;
      [@ocaml.doc "The type of the principal assigned to the application.\n"]
}
[@@ocaml.doc "A structure that describes an application to which a principal is assigned.\n"]

type nonrec application_assignment_list_for_principal = application_assignment_for_principal list
[@@ocaml.doc ""]

type nonrec application_assignments_list = application_assignment list [@@ocaml.doc ""]

type nonrec application_authentication_method_resource = Smaws_Lib.CoreTypes.Resource.t
[@@ocaml.doc ""]

type nonrec application_grant_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec application_list = application list [@@ocaml.doc ""]

type nonrec resource_server_scope_details = {
  long_description : description option;
      [@ocaml.doc "The description of an access scope for a resource server.\n"]
  detailed_title : description option;
      [@ocaml.doc "The title of an access scope for a resource server.\n"]
}
[@@ocaml.doc
  "A structure that describes details for an IAM Identity Center access scope that is associated \
   with a resource server.\n"]

type nonrec resource_server_scope = string [@@ocaml.doc ""]

type nonrec resource_server_scopes = (resource_server_scope * resource_server_scope_details) list
[@@ocaml.doc ""]

type nonrec resource_server_config = {
  scopes : resource_server_scopes option;
      [@ocaml.doc
        "A list of the IAM Identity Center access scopes that are associated with this resource \
         server.\n"]
}
[@@ocaml.doc "A structure that describes the configuration of a resource server.\n"]

type nonrec icon_url = string [@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec display_data = {
  display_name : name option;
      [@ocaml.doc "The name of the application provider that appears in the portal.\n"]
  icon_url : icon_url option;
      [@ocaml.doc "A URL that points to an icon that represents the application provider.\n"]
  description : description option;
      [@ocaml.doc "The description of the application provider that appears in the portal.\n"]
}
[@@ocaml.doc "A structure that describes how the portal represents an application provider.\n"]

type nonrec federation_protocol = SAML [@ocaml.doc ""] | OAUTH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec application_provider = {
  application_provider_arn : application_provider_arn;
      [@ocaml.doc "The ARN of the application provider.\n"]
  federation_protocol : federation_protocol option;
      [@ocaml.doc "The protocol that the application provider uses to perform federation.\n"]
  display_data : display_data option;
      [@ocaml.doc
        "A structure that describes how IAM Identity Center represents the application provider in \
         the portal.\n"]
  resource_server_config : resource_server_config option;
      [@ocaml.doc "A structure that describes the application provider's resource server.\n"]
}
[@@ocaml.doc
  "A structure that describes a provider that can be used to connect an Amazon Web Services \
   managed application or customer managed application to IAM Identity Center.\n"]

type nonrec application_provider_list = application_provider list [@@ocaml.doc ""]

type nonrec assignment_required = bool [@@ocaml.doc ""]

type nonrec resource_not_found_exception_reason = KMS_NOT_FOUND_EXCEPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : resource_not_found_message option; [@ocaml.doc ""]
  reason : resource_not_found_exception_reason option;
      [@ocaml.doc "The reason for the resource not found exception.\n"]
}
[@@ocaml.doc "Indicates that a requested resource is not found.\n"]

type nonrec attach_customer_managed_policy_reference_to_permission_set_response = unit
[@@ocaml.doc ""]

type nonrec managed_policy_path = string [@@ocaml.doc ""]

type nonrec managed_policy_name = string [@@ocaml.doc ""]

type nonrec customer_managed_policy_reference = {
  name : managed_policy_name;
      [@ocaml.doc
        "The name of the IAM policy that you have configured in each account where you want to \
         deploy your permission set.\n"]
  path : managed_policy_path option;
      [@ocaml.doc
        "The path to the IAM policy that you have configured in each account where you want to \
         deploy your permission set. The default is [/]. For more information, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-friendly-names}Friendly \
         names and paths} in the {i IAM User Guide}.\n"]
}
[@@ocaml.doc
  "Specifies the name and path of a customer managed policy. You must have an IAM policy that \
   matches the name and path in each Amazon Web Services account where you want to deploy your \
   permission set.\n"]

type nonrec attach_customer_managed_policy_reference_to_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the [PermissionSet].\n"]
  customer_managed_policy_reference : customer_managed_policy_reference;
      [@ocaml.doc
        "Specifies the name and path of a customer managed policy. You must have an IAM policy \
         that matches the name and path in each Amazon Web Services account where you want to \
         deploy your permission set.\n"]
}
[@@ocaml.doc ""]

type nonrec attach_managed_policy_to_permission_set_response = unit [@@ocaml.doc ""]

type nonrec managed_policy_arn = string [@@ocaml.doc ""]

type nonrec attach_managed_policy_to_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the [PermissionSet] that the managed policy should be attached to.\n"]
  managed_policy_arn : managed_policy_arn;
      [@ocaml.doc
        "The Amazon Web Services managed policy ARN to be attached to a permission set.\n"]
}
[@@ocaml.doc ""]

type nonrec attached_managed_policy = {
  name : name option; [@ocaml.doc "The name of the Amazon Web Services managed policy.\n"]
  arn : managed_policy_arn option;
      [@ocaml.doc
        "The ARN of the Amazon Web Services managed policy. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
}
[@@ocaml.doc
  "A structure that stores a list of managed policy ARNs that describe the associated Amazon Web \
   Services managed policy.\n"]

type nonrec attached_managed_policy_list = attached_managed_policy list [@@ocaml.doc ""]

type nonrec iam_authentication_method = {
  actor_policy : actor_policy_document; [@ocaml.doc "An IAM policy document in JSON.\n"]
}
[@@ocaml.doc "A structure that describes details for authentication that uses IAM.\n"]

type nonrec authentication_method =
  | Iam of iam_authentication_method
      [@ocaml.doc "A structure that describes details for IAM authentication.\n"]
[@@ocaml.doc
  "A structure that describes an authentication method that can be used by an application.\n"]

type nonrec authentication_method_type = IAM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec authentication_method_item = {
  authentication_method_type : authentication_method_type option;
      [@ocaml.doc "The type of authentication that is used by this method.\n"]
  authentication_method : authentication_method option;
      [@ocaml.doc
        "A structure that describes an authentication method. The contents of this structure is \
         determined by the [AuthenticationMethodType].\n"]
}
[@@ocaml.doc "A structure that describes an authentication method and its type.\n"]

type nonrec authentication_methods = authentication_method_item list [@@ocaml.doc ""]

type nonrec ur_i = string [@@ocaml.doc ""]

type nonrec redirect_uris = ur_i list [@@ocaml.doc ""]

type nonrec authorization_code_grant = {
  redirect_uris : redirect_uris option;
      [@ocaml.doc
        "A list of URIs that are valid locations to redirect a user's browser after the user is \
         authorized.\n\n\
        \  RedirectUris is required when the grant type is [authorization_code].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A structure that defines configuration settings for an application that supports the OAuth 2.0 \
   Authorization Code Grant.\n"]

type nonrec token_issuer_audience = string [@@ocaml.doc ""]

type nonrec token_issuer_audiences = token_issuer_audience list [@@ocaml.doc ""]

type nonrec trusted_token_issuer_arn = string [@@ocaml.doc ""]

type nonrec authorized_token_issuer = {
  trusted_token_issuer_arn : trusted_token_issuer_arn option;
      [@ocaml.doc "The ARN of the trusted token issuer.\n"]
  authorized_audiences : token_issuer_audiences option;
      [@ocaml.doc
        "An array list of authorized audiences, or applications, that can consume the tokens \
         generated by the associated trusted token issuer.\n"]
}
[@@ocaml.doc
  "A structure that describes a trusted token issuer and associates it with a set of authorized \
   audiences.\n"]

type nonrec authorized_token_issuers = authorized_token_issuer list [@@ocaml.doc ""]

type nonrec claim_attribute_path = string [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec create_account_assignment_response = {
  account_assignment_creation_status : account_assignment_operation_status option;
      [@ocaml.doc "The status object for the account assignment creation operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_assignment_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  target_id : target_id;
      [@ocaml.doc
        "TargetID is an Amazon Web Services account identifier, (For example, 123456789012).\n"]
  target_type : target_type;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc
        "The ARN of the permission set that the admin wants to grant the principal access to.\n"]
  principal_type : principal_type;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM Identity Center \
         Identity Store API Reference}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_application_response = {
  application_arn : application_arn option; [@ocaml.doc "Specifies the ARN of the application.\n"]
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  identity_store_arn : identity_store_arn option;
      [@ocaml.doc
        "The ARN of the identity store that is connected to the instance of IAM Identity Center.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key for the tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc
  "A set of key-value pairs that are used to manage the resource. Tags can only be applied to \
   permission sets and cannot be applied to corresponding roles that IAM Identity Center creates \
   in Amazon Web Services accounts.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec create_application_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  application_provider_arn : application_provider_arn;
      [@ocaml.doc "The ARN of the application provider under which the operation will run.\n"]
  name : application_name_type; [@ocaml.doc "The name of the .\n"]
  description : description option; [@ocaml.doc "The description of the .\n"]
  portal_options : portal_options option;
      [@ocaml.doc
        "A structure that describes the options for the portal associated with an application.\n"]
  tags : tag_list option; [@ocaml.doc "Specifies tags to be attached to the application.\n"]
  status : application_status option;
      [@ocaml.doc "Specifies whether the application is enabled or disabled.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [IdempotentParameterMismatch] error.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_application_assignment_response = unit [@@ocaml.doc ""]

type nonrec create_application_assignment_request = {
  application_arn : application_arn;
      [@ocaml.doc "The ARN of the application for which the assignment is created.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM \
         Identity Center Identity Store API Reference}.\n"]
  principal_type : principal_type;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_instance_response = {
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run. \n\n\
        \ For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec name_type = string [@@ocaml.doc ""]

type nonrec create_instance_request = {
  name : name_type option; [@ocaml.doc "The name of the instance of IAM Identity Center.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [IdempotentParameterMismatch] error.\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc "Specifies tags to be attached to the instance of IAM Identity Center.\n"]
}
[@@ocaml.doc ""]

type nonrec create_instance_access_control_attribute_configuration_response = unit [@@ocaml.doc ""]

type nonrec instance_access_control_attribute_configuration = {
  access_control_attributes : access_control_attribute_list;
      [@ocaml.doc
        "Lists the attributes that are configured for ABAC in the specified IAM Identity Center \
         instance.\n"]
}
[@@ocaml.doc
  "Specifies the attributes to add to your attribute-based access control (ABAC) configuration.\n"]

type nonrec create_instance_access_control_attribute_configuration_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed.\n"]
  instance_access_control_attribute_configuration : instance_access_control_attribute_configuration;
      [@ocaml.doc
        "Specifies the IAM Identity Center identity store attributes to add to your ABAC \
         configuration. When using an external identity provider as an identity source, you can \
         pass attributes through the SAML assertion. Doing so provides an alternative to \
         configuring attributes from the IAM Identity Center identity store. If a SAML assertion \
         passes any of these attributes, IAM Identity Center will replace the attribute value with \
         the value from the IAM Identity Center identity store.\n"]
}
[@@ocaml.doc ""]

type nonrec relay_state = string [@@ocaml.doc ""]

type nonrec duration = string [@@ocaml.doc ""]

type nonrec permission_set_description = string [@@ocaml.doc ""]

type nonrec permission_set_name = string [@@ocaml.doc ""]

type nonrec permission_set = {
  name : permission_set_name option; [@ocaml.doc "The name of the permission set.\n"]
  permission_set_arn : permission_set_arn option;
      [@ocaml.doc
        "The ARN of the permission set. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  description : permission_set_description option;
      [@ocaml.doc "The description of the [PermissionSet].\n"]
  created_date : date option; [@ocaml.doc "The date that the permission set was created.\n"]
  session_duration : duration option;
      [@ocaml.doc
        "The length of time that the application user sessions are valid for in the ISO-8601 \
         standard.\n"]
  relay_state : relay_state option;
      [@ocaml.doc
        "Used to redirect users within the application during the federation authentication process.\n"]
}
[@@ocaml.doc "An entity that contains IAM policies.\n"]

type nonrec create_permission_set_response = {
  permission_set : permission_set option;
      [@ocaml.doc "Defines the level of access on an Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_permission_set_request = {
  name : permission_set_name; [@ocaml.doc "The name of the [PermissionSet].\n"]
  description : permission_set_description option;
      [@ocaml.doc "The description of the [PermissionSet].\n"]
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  session_duration : duration option;
      [@ocaml.doc
        "The length of time that the application user sessions are valid in the ISO-8601 standard.\n"]
  relay_state : relay_state option;
      [@ocaml.doc
        "Used to redirect users within the application during the federation authentication process.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to attach to the new [PermissionSet].\n"]
}
[@@ocaml.doc ""]

type nonrec create_trusted_token_issuer_response = {
  trusted_token_issuer_arn : trusted_token_issuer_arn option;
      [@ocaml.doc "The ARN of the new trusted token issuer configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec jwks_retrieval_option = OPEN_ID_DISCOVERY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec jmes_path = string [@@ocaml.doc ""]

type nonrec trusted_token_issuer_url = string [@@ocaml.doc ""]

type nonrec oidc_jwt_configuration = {
  issuer_url : trusted_token_issuer_url;
      [@ocaml.doc
        "The URL that IAM Identity Center uses for OpenID Discovery. OpenID Discovery is used to \
         obtain the information required to verify the tokens that the trusted token issuer \
         generates.\n"]
  claim_attribute_path : claim_attribute_path;
      [@ocaml.doc
        "The path of the source attribute in the JWT from the trusted token issuer. The attribute \
         mapped by this JMESPath expression is compared against the attribute mapped by \
         [IdentityStoreAttributePath] when a trusted token issuer token is exchanged for an IAM \
         Identity Center token.\n"]
  identity_store_attribute_path : jmes_path;
      [@ocaml.doc
        "The path of the destination attribute in a JWT from IAM Identity Center. The attribute \
         mapped by this JMESPath expression is compared against the attribute mapped by \
         [ClaimAttributePath] when a trusted token issuer token is exchanged for an IAM Identity \
         Center token. \n"]
  jwks_retrieval_option : jwks_retrieval_option;
      [@ocaml.doc
        "The method that the trusted token issuer can use to retrieve the JSON Web Key Set used to \
         verify a JWT.\n"]
}
[@@ocaml.doc
  "A structure that describes configuration settings for a trusted token issuer that supports \
   OpenID Connect (OIDC) and JSON Web Tokens (JWTs).\n"]

type nonrec trusted_token_issuer_configuration =
  | OidcJwtConfiguration of oidc_jwt_configuration
      [@ocaml.doc
        "A structure that describes the settings for a trusted token issuer that works with OpenID \
         Connect (OIDC) by using JSON Web Tokens (JWT).\n"]
[@@ocaml.doc
  "A structure that describes the configuration of a trusted token issuer. The structure and \
   available settings are determined by the type of the trusted token issuer.\n"]

type nonrec trusted_token_issuer_type = OIDC_JWT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec trusted_token_issuer_name = string [@@ocaml.doc ""]

type nonrec create_trusted_token_issuer_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "Specifies the ARN of the instance of IAM Identity Center to contain the new trusted token \
         issuer configuration.\n"]
  name : trusted_token_issuer_name;
      [@ocaml.doc "Specifies the name of the new trusted token issuer configuration.\n"]
  trusted_token_issuer_type : trusted_token_issuer_type;
      [@ocaml.doc "Specifies the type of the new trusted token issuer.\n"]
  trusted_token_issuer_configuration : trusted_token_issuer_configuration;
      [@ocaml.doc
        "Specifies settings that apply to the new trusted token issuer configuration. The settings \
         that are available depend on what [TrustedTokenIssuerType] you specify.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive ID that you provide to ensure the idempotency of the \
         request. This lets you safely retry the request without accidentally performing the same \
         operation a second time. Passing the same value to a later call to an operation requires \
         that you also pass the same value for all other parameters. We recommend that you use a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of value.}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [IdempotentParameterMismatch] error.\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc "Specifies tags to be attached to the new trusted token issuer configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec customer_managed_policy_reference_list = customer_managed_policy_reference list
[@@ocaml.doc ""]

type nonrec delete_account_assignment_response = {
  account_assignment_deletion_status : account_assignment_operation_status option;
      [@ocaml.doc "The status object for the account assignment deletion operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_assignment_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  target_id : target_id;
      [@ocaml.doc
        "TargetID is an Amazon Web Services account identifier, (For example, 123456789012).\n"]
  target_type : target_type;
      [@ocaml.doc "The entity type for which the assignment will be deleted.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the permission set that will be used to remove access.\n"]
  principal_type : principal_type;
      [@ocaml.doc "The entity type for which the assignment will be deleted.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM Identity Center \
         Identity Store API Reference}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_application_response = unit [@@ocaml.doc ""]

type nonrec delete_application_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}. \n"]
}
[@@ocaml.doc ""]

type nonrec scope = string [@@ocaml.doc ""]

type nonrec delete_application_access_scope_request = {
  application_arn : application_arn;
      [@ocaml.doc "Specifies the ARN of the application with the access scope to delete.\n"]
  scope : scope;
      [@ocaml.doc "Specifies the name of the access scope to remove from the application.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_application_assignment_response = unit [@@ocaml.doc ""]

type nonrec delete_application_assignment_request = {
  application_arn : application_arn; [@ocaml.doc "Specifies the ARN of the application.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM \
         Identity Center Identity Store API Reference}.\n"]
  principal_type : principal_type;
      [@ocaml.doc "The entity type for which the assignment will be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_application_authentication_method_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application with the authentication method to delete.\n"]
  authentication_method_type : authentication_method_type;
      [@ocaml.doc "Specifies the authentication method type to delete from the application.\n"]
}
[@@ocaml.doc ""]

type nonrec grant_type =
  | AUTHORIZATION_CODE [@ocaml.doc ""]
  | REFRESH_TOKEN [@ocaml.doc ""]
  | JWT_BEARER [@ocaml.doc ""]
  | TOKEN_EXCHANGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_application_grant_request = {
  application_arn : application_arn;
      [@ocaml.doc "Specifies the ARN of the application with the grant to delete.\n"]
  grant_type : grant_type;
      [@ocaml.doc "Specifies the type of grant to delete from the application.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_inline_policy_from_permission_set_response = unit [@@ocaml.doc ""]

type nonrec delete_inline_policy_from_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the permission set that will be used to remove access.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_instance_response = unit [@@ocaml.doc ""]

type nonrec delete_instance_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_instance_access_control_attribute_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_instance_access_control_attribute_configuration_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_permission_set_response = unit [@@ocaml.doc ""]

type nonrec delete_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the permission set that should be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_permissions_boundary_from_permission_set_response = unit [@@ocaml.doc ""]

type nonrec delete_permissions_boundary_from_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the [PermissionSet].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_trusted_token_issuer_response = unit [@@ocaml.doc ""]

type nonrec delete_trusted_token_issuer_request = {
  trusted_token_issuer_arn : trusted_token_issuer_arn;
      [@ocaml.doc "Specifies the ARN of the trusted token issuer configuration to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_assignment_creation_status_response = {
  account_assignment_creation_status : account_assignment_operation_status option;
      [@ocaml.doc "The status object for the account assignment creation operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_assignment_creation_status_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  account_assignment_creation_request_id : uu_id;
      [@ocaml.doc "The identifier that is used to track the request operation progress.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_assignment_deletion_status_response = {
  account_assignment_deletion_status : account_assignment_operation_status option;
      [@ocaml.doc "The status object for the account assignment deletion operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_assignment_deletion_status_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  account_assignment_deletion_request_id : uu_id;
      [@ocaml.doc "The identifier that is used to track the request operation progress.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_response = {
  application_arn : application_arn option; [@ocaml.doc "Specifies the ARN of the application.\n"]
  application_provider_arn : application_provider_arn option;
      [@ocaml.doc "The ARN of the application provider under which the operation will run.\n"]
  name : application_name_type option; [@ocaml.doc "The application name.\n"]
  application_account : account_id option; [@ocaml.doc "The account ID.\n"]
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center application under which the operation will run. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  identity_store_arn : identity_store_arn option;
      [@ocaml.doc
        "The ARN of the identity store that is connected to the instance of IAM Identity Center.\n"]
  status : application_status option;
      [@ocaml.doc "Specifies whether the application is enabled or disabled.\n"]
  portal_options : portal_options option;
      [@ocaml.doc
        "A structure that describes the options for the portal associated with an application.\n"]
  description : description option; [@ocaml.doc "The description of the .\n"]
  created_date : date option; [@ocaml.doc "The date the application was created.\n"]
  created_from : region_name option;
      [@ocaml.doc
        "The Amazon Web Services Region where the application was created in IAM Identity Center.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_assignment_response = {
  principal_type : principal_type option;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
  principal_id : principal_id option;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM \
         Identity Center Identity Store API Reference}.\n"]
  application_arn : application_arn option;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_assignment_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "An identifier for an object in IAM Identity Center, such as a user or group. PrincipalIds \
         are GUIDs (For example, f81d4fae-7dec-11d0-a765-00a0c91e6bf6). For more information about \
         PrincipalIds in IAM Identity Center, see the \
         {{:https://docs.aws.amazon.com/singlesignon/latest/IdentityStoreAPIReference/welcome.html}IAM \
         Identity Center Identity Store API Reference}.\n"]
  principal_type : principal_type;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_provider_response = {
  application_provider_arn : application_provider_arn;
      [@ocaml.doc "The ARN of the application provider.\n"]
  federation_protocol : federation_protocol option;
      [@ocaml.doc "The protocol used to federate to the application provider.\n"]
  display_data : display_data option;
      [@ocaml.doc "A structure with details about the display data for the application provider.\n"]
  resource_server_config : resource_server_config option;
      [@ocaml.doc "A structure with details about the receiving application.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_provider_request = {
  application_provider_arn : application_provider_arn;
      [@ocaml.doc "Specifies the ARN of the application provider for which you want details.\n"]
}
[@@ocaml.doc ""]

type nonrec kms_key_status =
  | UPDATING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec kms_key_type =
  | AWS_OWNED_KMS_KEY [@ocaml.doc ""]
  | CUSTOMER_MANAGED_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_configuration_details = {
  key_type : kms_key_type option; [@ocaml.doc "The type of KMS key used for encryption.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The ARN of the KMS key currently used to encrypt data in your IAM Identity Center \
         instance. \n"]
  encryption_status : kms_key_status option;
      [@ocaml.doc "The current status of encryption configuration.\n"]
  encryption_status_reason : reason option;
      [@ocaml.doc
        "Provides additional context about the current encryption status. This field is \
         particularly useful when the encryption status is UPDATE_FAILED. When encryption \
         configuration update fails, this field contains information about the cause, which may \
         include KMS key access issues, key not found errors, invalid key configuration, key in an \
         invalid state, or a disabled key. \n"]
}
[@@ocaml.doc
  "The encryption configuration of your IAM Identity Center instance, including the key type, KMS \
   key ARN, and current encryption status. \n"]

type nonrec instance_status =
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec id = string [@@ocaml.doc ""]

type nonrec describe_instance_response = {
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  identity_store_id : id option;
      [@ocaml.doc
        "The identifier of the identity store that is connected to the instance of IAM Identity \
         Center.\n"]
  owner_account_id : account_id option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account for which the instance was created.\n"]
  name : name_type option; [@ocaml.doc "Specifies the instance name.\n"]
  created_date : date option; [@ocaml.doc "The date the instance was created.\n"]
  status : instance_status option; [@ocaml.doc "The status of the instance. \n"]
  status_reason : reason option;
      [@ocaml.doc
        "Provides additional context about the current status of the IAM Identity Center instance. \
         This field is particularly useful when an instance is in a non-ACTIVE state, such as \
         CREATE_FAILED. When an instance fails to create or update, this field contains \
         information about the cause, which may include issues with KMS key configuration, \
         permission problems with the specified KMS key, or service-related errors. \n"]
  encryption_configuration_details : encryption_configuration_details option;
      [@ocaml.doc
        "Contains the encryption configuration for your IAM Identity Center instance, including \
         the encryption status, KMS key type, and KMS key ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_instance_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_access_control_attribute_configuration_status_reason = string [@@ocaml.doc ""]

type nonrec instance_access_control_attribute_configuration_status =
  | ENABLED [@ocaml.doc ""]
  | CREATION_IN_PROGRESS [@ocaml.doc ""]
  | CREATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_instance_access_control_attribute_configuration_response = {
  status : instance_access_control_attribute_configuration_status option;
      [@ocaml.doc "The status of the attribute configuration process.\n"]
  status_reason : instance_access_control_attribute_configuration_status_reason option;
      [@ocaml.doc "Provides more details about the current status of the specified attribute.\n"]
  instance_access_control_attribute_configuration :
    instance_access_control_attribute_configuration option;
      [@ocaml.doc
        "Gets the list of IAM Identity Center identity store attributes that have been added to \
         your ABAC configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_instance_access_control_attribute_configuration_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_permission_set_response = {
  permission_set : permission_set option;
      [@ocaml.doc "Describes the level of access on an Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the permission set. \n"]
}
[@@ocaml.doc ""]

type nonrec permission_set_provisioning_status = {
  status : status_values option;
      [@ocaml.doc "The status of the permission set provisioning process.\n"]
  request_id : uu_id option;
      [@ocaml.doc
        "The identifier for tracking the request operation that is generated by the universally \
         unique identifier (UUID) workflow.\n"]
  account_id : account_id option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account from which to list the assignments.\n"]
  permission_set_arn : permission_set_arn option;
      [@ocaml.doc
        "The ARN of the permission set that is being provisioned. For more information about ARNs, \
         see {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  failure_reason : reason option;
      [@ocaml.doc
        "The message that contains an error or exception in case of an operation failure.\n"]
  created_date : date option; [@ocaml.doc "The date that the permission set was created.\n"]
}
[@@ocaml.doc
  "A structure that is used to provide the status of the provisioning operation for a specified \
   permission set.\n"]

type nonrec describe_permission_set_provisioning_status_response = {
  permission_set_provisioning_status : permission_set_provisioning_status option;
      [@ocaml.doc "The status object for the permission set provisioning operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_permission_set_provisioning_status_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  provision_permission_set_request_id : uu_id;
      [@ocaml.doc
        "The identifier that is provided by the [ProvisionPermissionSet] call to retrieve the \
         current status of the provisioning workflow.\n"]
}
[@@ocaml.doc ""]

type nonrec is_primary_region = bool [@@ocaml.doc ""]

type nonrec describe_region_response = {
  region_name : region_name option; [@ocaml.doc "The Amazon Web Services Region name.\n"]
  status : region_status option;
      [@ocaml.doc
        "The current status of the Region. Valid values are ACTIVE (Region is operational), ADDING \
         (Region replication workflow is in progress), or REMOVING (Region removal workflow is in \
         progress).\n"]
  added_date : date option;
      [@ocaml.doc
        "The timestamp when the Region was added to the IAM Identity Center instance. For the \
         primary Region, this is the IAM Identity Center instance creation time.\n"]
  is_primary_region : is_primary_region option;
      [@ocaml.doc
        "Indicates whether this is the primary Region where the IAM Identity Center instance was \
         originally enabled. For more information on the difference between the primary Region and \
         additional Regions, see \
         {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/multi-region-iam-identity-center.html}IAM \
         Identity Center User Guide} \n"]
}
[@@ocaml.doc ""]

type nonrec describe_region_request = {
  instance_arn : instance_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM Identity Center instance.\n"]
  region_name : region_name;
      [@ocaml.doc
        "The name of the Amazon Web Services Region to retrieve information about. The Region name \
         must be 1-32 characters long and follow the pattern of Amazon Web Services Region names \
         (for example, us-east-1).\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trusted_token_issuer_response = {
  trusted_token_issuer_arn : trusted_token_issuer_arn option;
      [@ocaml.doc "The ARN of the trusted token issuer configuration.\n"]
  name : trusted_token_issuer_name option;
      [@ocaml.doc "The name of the trusted token issuer configuration.\n"]
  trusted_token_issuer_type : trusted_token_issuer_type option;
      [@ocaml.doc "The type of the trusted token issuer.\n"]
  trusted_token_issuer_configuration : trusted_token_issuer_configuration option;
      [@ocaml.doc
        "A structure the describes the settings that apply of this trusted token issuer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trusted_token_issuer_request = {
  trusted_token_issuer_arn : trusted_token_issuer_arn;
      [@ocaml.doc
        "Specifies the ARN of the trusted token issuer configuration that you want details about.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_customer_managed_policy_reference_from_permission_set_response = unit
[@@ocaml.doc ""]

type nonrec detach_customer_managed_policy_reference_from_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the [PermissionSet].\n"]
  customer_managed_policy_reference : customer_managed_policy_reference;
      [@ocaml.doc
        "Specifies the name and path of a customer managed policy. You must have an IAM policy \
         that matches the name and path in each Amazon Web Services account where you want to \
         deploy your permission set.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_managed_policy_from_permission_set_response = unit [@@ocaml.doc ""]

type nonrec detach_managed_policy_from_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the [PermissionSet] from which the policy should be detached.\n"]
  managed_policy_arn : managed_policy_arn;
      [@ocaml.doc
        "The Amazon Web Services managed policy ARN to be detached from a permission set.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_configuration = {
  key_type : kms_key_type; [@ocaml.doc "The type of KMS key used for encryption.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The ARN of the KMS key used to encrypt data. Required when KeyType is \
         CUSTOMER_MANAGED_KEY. Cannot be specified when KeyType is AWS_OWNED_KMS_KEY.\n"]
}
[@@ocaml.doc
  " A structure that specifies the KMS key type and KMS key ARN used to encrypt data in your IAM \
   Identity Center instance.\n"]

type nonrec scope_target = string [@@ocaml.doc ""]

type nonrec scope_targets = scope_target list [@@ocaml.doc ""]

type nonrec get_application_access_scope_response = {
  scope : scope;
      [@ocaml.doc "The name of the access scope that can be used with the authorized targets.\n"]
  authorized_targets : scope_targets option;
      [@ocaml.doc "An array of authorized targets associated with this access scope.\n"]
}
[@@ocaml.doc ""]

type nonrec get_application_access_scope_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application with the access scope that you want to retrieve.\n"]
  scope : scope;
      [@ocaml.doc
        "Specifies the name of the access scope for which you want the authorized targets.\n"]
}
[@@ocaml.doc ""]

type nonrec get_application_assignment_configuration_response = {
  assignment_required : assignment_required;
      [@ocaml.doc
        "If [AssignmentsRequired] is [true] (default value), users don\226\128\153t have access to \
         the application unless an assignment is created using the \
         {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html}CreateApplicationAssignment \
         API}. If [false], all users have access to the application. \n"]
}
[@@ocaml.doc ""]

type nonrec get_application_assignment_configuration_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
}
[@@ocaml.doc ""]

type nonrec get_application_authentication_method_response = {
  authentication_method : authentication_method option;
      [@ocaml.doc "A structure that contains details about the requested authentication method.\n"]
}
[@@ocaml.doc ""]

type nonrec get_application_authentication_method_request = {
  application_arn : application_arn; [@ocaml.doc "Specifies the ARN of the application.\n"]
  authentication_method_type : authentication_method_type;
      [@ocaml.doc "Specifies the type of authentication method for which you want details.\n"]
}
[@@ocaml.doc ""]

type nonrec token_exchange_grant = unit [@@ocaml.doc ""]

type nonrec refresh_token_grant = unit [@@ocaml.doc ""]

type nonrec jwt_bearer_grant = {
  authorized_token_issuers : authorized_token_issuers option;
      [@ocaml.doc
        "A list of allowed token issuers trusted by the Identity Center instances for this \
         application.\n\n\
        \   [AuthorizedTokenIssuers] is required when the grant type is [JwtBearerGrant].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A structure that defines configuration settings for an application that supports the JWT Bearer \
   Token Authorization Grant. The [AuthorizedAudience] field is the aud claim. For more \
   information, see {{:https://datatracker.ietf.org/doc/html/rfc7523}RFC 7523}.\n"]

type nonrec grant =
  | AuthorizationCode of authorization_code_grant
      [@ocaml.doc "Configuration options for the [authorization_code] grant type.\n"]
  | JwtBearer of jwt_bearer_grant
      [@ocaml.doc
        "Configuration options for the [urn:ietf:params:oauth:grant-type:jwt-bearer] grant type.\n"]
  | RefreshToken of refresh_token_grant
      [@ocaml.doc "Configuration options for the [refresh_token] grant type.\n"]
  | TokenExchange of token_exchange_grant
      [@ocaml.doc
        "Configuration options for the [urn:ietf:params:oauth:grant-type:token-exchange] grant type.\n"]
[@@ocaml.doc
  "The Grant union represents the set of possible configuration options for the selected grant \
   type. Exactly one member of the union must be specified, and must match the grant type selected.\n"]

type nonrec get_application_grant_response = {
  grant : grant; [@ocaml.doc "A structure that describes the requested grant.\n"]
}
[@@ocaml.doc ""]

type nonrec get_application_grant_request = {
  application_arn : application_arn;
      [@ocaml.doc "Specifies the ARN of the application that contains the grant.\n"]
  grant_type : grant_type; [@ocaml.doc "Specifies the type of grant.\n"]
}
[@@ocaml.doc ""]

type nonrec user_background_session_application_status =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_application_session_configuration_response = {
  user_background_session_application_status : user_background_session_application_status option;
      [@ocaml.doc "The status of user background sessions for the application. \n"]
}
[@@ocaml.doc ""]

type nonrec get_application_session_configuration_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the application for which to retrieve the session \
         configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec permission_set_policy_document = string [@@ocaml.doc ""]

type nonrec get_inline_policy_for_permission_set_response = {
  inline_policy : permission_set_policy_document option;
      [@ocaml.doc
        "The inline policy that is attached to the permission set.\n\n\
        \  For [Length Constraints], if a valid ARN is provided for a permission set, it is \
         possible for an empty inline policy to be returned.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_inline_policy_for_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the permission set.\n"]
}
[@@ocaml.doc ""]

type nonrec permissions_boundary = {
  customer_managed_policy_reference : customer_managed_policy_reference option;
      [@ocaml.doc
        "Specifies the name and path of a customer managed policy. You must have an IAM policy \
         that matches the name and path in each Amazon Web Services account where you want to \
         deploy your permission set.\n"]
  managed_policy_arn : managed_policy_arn option;
      [@ocaml.doc
        "The Amazon Web Services managed policy ARN that you want to attach to a permission set as \
         a permissions boundary.\n"]
}
[@@ocaml.doc
  "Specifies the configuration of the Amazon Web Services managed or customer managed policy that \
   you want to set as a permissions boundary. Specify either [CustomerManagedPolicyReference] to \
   use the name and path of a customer managed policy, or [ManagedPolicyArn] to use the ARN of an \
   Amazon Web Services managed policy. A permissions boundary represents the maximum permissions \
   that any policy can grant your role. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html}Permissions \
   boundaries for IAM entities} in the {i IAM User Guide}.\n\n\
  \  Policies used as permissions boundaries don't provide permissions. You must also attach an \
   IAM policy to the role. To learn how the effective permissions for a role are evaluated, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html}IAM \
   JSON policy evaluation logic} in the {i IAM User Guide}.\n\
  \  \n\
  \   "]

type nonrec get_permissions_boundary_for_permission_set_response = {
  permissions_boundary : permissions_boundary option;
      [@ocaml.doc "The permissions boundary attached to the specified permission set.\n"]
}
[@@ocaml.doc ""]

type nonrec get_permissions_boundary_for_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the [PermissionSet].\n"]
}
[@@ocaml.doc ""]

type nonrec grant_item = {
  grant_type : grant_type; [@ocaml.doc "The type of the selected grant.\n"]
  grant : grant; [@ocaml.doc "The configuration structure for the selected grant.\n"]
}
[@@ocaml.doc "A structure that defines a single grant and its configuration.\n"]

type nonrec grants = grant_item list [@@ocaml.doc ""]

type nonrec region_metadata = {
  region_name : region_name option; [@ocaml.doc "The Amazon Web Services Region name.\n"]
  status : region_status option;
      [@ocaml.doc
        "The current status of the Region. Valid values are ACTIVE (Region is operational), ADDING \
         (Region extension workflow is in progress), or REMOVING (Region removal workflow is in \
         progress).\n"]
  added_date : date option;
      [@ocaml.doc
        "The timestamp when the Region was added to the IAM Identity Center instance. For the \
         primary Region, this is the instance creation time.\n"]
  is_primary_region : is_primary_region option;
      [@ocaml.doc
        "Indicates whether this is the primary Region where the IAM Identity Center instance was \
         originally enabled. The primary Region cannot be removed.\n"]
}
[@@ocaml.doc
  "Contains information about an enabled Region of an IAM Identity Center instance, including the \
   Region name, status, date added, and whether it is the primary Region.\n"]

type nonrec region_metadata_list = region_metadata list [@@ocaml.doc ""]

type nonrec instance_metadata = {
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the Identity Center instance under which the operation will be executed. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  identity_store_id : id option;
      [@ocaml.doc
        "The identifier of the identity store that is connected to the Identity Center instance.\n"]
  owner_account_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID number of the owner of the Identity Center instance.\n"]
  name : name_type option; [@ocaml.doc "The name of the Identity Center instance.\n"]
  created_date : date option;
      [@ocaml.doc "The date and time that the Identity Center instance was created.\n"]
  status : instance_status option;
      [@ocaml.doc "The current status of this Identity Center instance.\n"]
  status_reason : reason option;
      [@ocaml.doc
        "Provides additional context about the current status of the IAM Identity Center instance. \
         This field is particularly useful when an instance is in a non-ACTIVE state, such as \
         CREATE_FAILED. When an instance creation fails, this field contains information about the \
         cause, which may include issues with KMS key configuration or insufficient permissions. \n"]
  primary_region : region_name option;
      [@ocaml.doc
        "The primary Region where the IAM Identity Center instance was originally enabled. The \
         primary Region cannot be removed.\n"]
  regions : region_metadata_list option;
      [@ocaml.doc
        "The list of Regions enabled in the IAM Identity Center instance, including Regions with \
         ACTIVE, ADDING, or REMOVING status.\n"]
}
[@@ocaml.doc "Provides information about the IAM Identity Center instance.\n"]

type nonrec instance_list = instance_metadata list [@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec list_account_assignment_creation_status_response = {
  account_assignments_creation_status : account_assignment_operation_status_list option;
      [@ocaml.doc "The status object for the account assignment creation operation.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_status_filter = {
  status : status_values option;
      [@ocaml.doc "Filters the list operations result based on the status attribute.\n"]
}
[@@ocaml.doc "Filters the operation status list based on the passed attribute value.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_account_assignment_creation_status_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the assignment.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
  filter : operation_status_filter option;
      [@ocaml.doc "Filters results based on the passed attribute value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_assignment_deletion_status_response = {
  account_assignments_deletion_status : account_assignment_operation_status_list option;
      [@ocaml.doc "The status object for the account assignment deletion operation.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_assignment_deletion_status_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the assignment.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
  filter : operation_status_filter option;
      [@ocaml.doc "Filters results based on the passed attribute value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_assignments_response = {
  account_assignments : account_assignment_list option;
      [@ocaml.doc
        "The list of assignments that match the input Amazon Web Services account and permission \
         set.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_assignments_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  account_id : target_id;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account from which to list the assignments.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the permission set from which to list assignments.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the assignment.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_assignments_filter = {
  account_id : account_id option;
      [@ocaml.doc
        "The ID number of an Amazon Web Services account that filters the results in the response.\n"]
}
[@@ocaml.doc "A structure that describes a filter for account assignments.\n"]

type nonrec list_account_assignments_for_principal_response = {
  account_assignments : account_assignment_list_for_principal option;
      [@ocaml.doc "An array list of the account assignments for the principal.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_assignments_for_principal_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "Specifies the ARN of the instance of IAM Identity Center that contains the principal.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "Specifies the principal for which you want to retrieve the list of account assignments.\n"]
  principal_type : principal_type; [@ocaml.doc "Specifies the type of the principal.\n"]
  filter : list_account_assignments_filter option;
      [@ocaml.doc
        "Specifies an Amazon Web Services account ID number. Results are filtered to only those \
         that match this ID number.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_for_provisioned_permission_set_response = {
  account_ids : account_list option; [@ocaml.doc "The list of Amazon Web Services [AccountIds].\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec provisioning_status =
  | LATEST_PERMISSION_SET_PROVISIONED [@ocaml.doc ""]
  | LATEST_PERMISSION_SET_NOT_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_accounts_for_provisioned_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc
        "The ARN of the [PermissionSet] from which the associated Amazon Web Services accounts \
         will be listed.\n"]
  provisioning_status : provisioning_status option;
      [@ocaml.doc "The permission set provisioning status for an Amazon Web Services account.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the [PermissionSet].\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec scope_details = {
  scope : scope; [@ocaml.doc "The name of the access scope.\n"]
  authorized_targets : scope_targets option; [@ocaml.doc "An array list of ARNs of applications.\n"]
}
[@@ocaml.doc
  "A structure that describes an IAM Identity Center access scope and its authorized targets.\n"]

type nonrec scopes = scope_details list [@@ocaml.doc ""]

type nonrec list_application_access_scopes_response = {
  scopes : scopes;
      [@ocaml.doc
        "An array list of access scopes and their authorized targets that are associated with the \
         application.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_access_scopes_request = {
  application_arn : application_arn; [@ocaml.doc "Specifies the ARN of the application.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_assignments_response = {
  application_assignments : application_assignments_list option;
      [@ocaml.doc "The list of users assigned to an application.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_assignments_request = {
  application_arn : application_arn; [@ocaml.doc "Specifies the ARN of the application.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_assignments_filter = {
  application_arn : application_arn option; [@ocaml.doc "The ARN of an application.\n"]
}
[@@ocaml.doc "A structure that describes a filter for application assignments.\n"]

type nonrec list_application_assignments_for_principal_response = {
  application_assignments : application_assignment_list_for_principal option;
      [@ocaml.doc "An array list of the application assignments for the specified principal.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_assignments_for_principal_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "Specifies the instance of IAM Identity Center that contains principal and applications.\n"]
  principal_id : principal_id;
      [@ocaml.doc
        "Specifies the unique identifier of the principal for which you want to retrieve its \
         assignments.\n"]
  principal_type : principal_type;
      [@ocaml.doc
        "Specifies the type of the principal for which you want to retrieve its assignments.\n"]
  filter : list_application_assignments_filter option;
      [@ocaml.doc
        "Filters the output to include only assignments associated with the application that has \
         the specified ARN.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_authentication_methods_response = {
  authentication_methods : authentication_methods option;
      [@ocaml.doc "An array list of authentication methods for the specified application.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_authentication_methods_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application with the authentication methods you want to list.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_grants_response = {
  grants : grants; [@ocaml.doc "An array list of structures that describe the requested grants.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_grants_request = {
  application_arn : application_arn;
      [@ocaml.doc "Specifies the ARN of the application whose grants you want to list.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_providers_response = {
  application_providers : application_provider_list option;
      [@ocaml.doc "An array list of structures that describe application providers.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_application_providers_request = {
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_applications_response = {
  applications : application_list option;
      [@ocaml.doc "Retrieves all applications associated with the instance.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_applications_filter = {
  application_account : account_id option;
      [@ocaml.doc
        "An Amazon Web Services account ID number that filters the results in the response.\n"]
  application_provider : application_provider_arn option;
      [@ocaml.doc
        "The ARN of an application provider that can filter the results in the response.\n"]
}
[@@ocaml.doc "A structure that describes a filter for applications.\n"]

type nonrec list_applications_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center application under which the operation will run. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
  filter : list_applications_filter option; [@ocaml.doc "Filters response results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_customer_managed_policy_references_in_permission_set_response = {
  customer_managed_policy_references : customer_managed_policy_reference_list option;
      [@ocaml.doc
        "Specifies the names and paths of the customer managed policies that you have attached to \
         your permission set.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_customer_managed_policy_references_in_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the [PermissionSet]. \n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the list call.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_instances_response = {
  instances : instance_list option;
      [@ocaml.doc "Lists the IAM Identity Center instances that the caller has access to.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_instances_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the instance.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_managed_policies_in_permission_set_response = {
  attached_managed_policies : attached_managed_policy_list option;
      [@ocaml.doc "An array of the [AttachedManagedPolicy] data type object.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_managed_policies_in_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn;
      [@ocaml.doc "The ARN of the [PermissionSet] whose managed policies will be listed.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the [PermissionSet].\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec permission_set_provisioning_status_metadata = {
  status : status_values option;
      [@ocaml.doc "The status of the permission set provisioning process.\n"]
  request_id : uu_id option;
      [@ocaml.doc
        "The identifier for tracking the request operation that is generated by the universally \
         unique identifier (UUID) workflow.\n"]
  created_date : date option; [@ocaml.doc "The date that the permission set was created.\n"]
}
[@@ocaml.doc "Provides information about the permission set provisioning status.\n"]

type nonrec permission_set_provisioning_status_list =
  permission_set_provisioning_status_metadata list
[@@ocaml.doc ""]

type nonrec list_permission_set_provisioning_status_response = {
  permission_sets_provisioning_status : permission_set_provisioning_status_list option;
      [@ocaml.doc "The status object for the permission set provisioning operation.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_permission_set_provisioning_status_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the assignment.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
  filter : operation_status_filter option;
      [@ocaml.doc "Filters results based on the passed attribute value.\n"]
}
[@@ocaml.doc ""]

type nonrec permission_set_list = permission_set_arn list [@@ocaml.doc ""]

type nonrec list_permission_sets_response = {
  permission_sets : permission_set_list option;
      [@ocaml.doc "Defines the level of access on an Amazon Web Services account.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_permission_sets_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the assignment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_permission_sets_provisioned_to_account_response = {
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
  permission_sets : permission_set_list option;
      [@ocaml.doc "Defines the level of access that an Amazon Web Services account has.\n"]
}
[@@ocaml.doc ""]

type nonrec list_permission_sets_provisioned_to_account_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  account_id : account_id;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account from which to list the assignments.\n"]
  provisioning_status : provisioning_status option;
      [@ocaml.doc "The status object for the permission set provisioning operation.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to display for the assignment.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_regions_response = {
  regions : region_metadata_list option;
      [@ocaml.doc
        "The list of Regions enabled in the IAM Identity Center instance, including Regions with \
         ACTIVE, ADDING, or REMOVING status.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token to be used in subsequent calls. If the value is null, then there are \
         no more entries.\n"]
}
[@@ocaml.doc ""]

type nonrec list_regions_request = {
  instance_arn : instance_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM Identity Center instance.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call. Default is 100.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc "A set of key-value pairs that are used to manage the resource.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The ARN of the resource with the tags to be listed.\n"]
  next_token : token option;
      [@ocaml.doc
        "The pagination token for the list API. Initially the value is null. Use the output of \
         previous API calls to make subsequent calls.\n"]
}
[@@ocaml.doc ""]

type nonrec trusted_token_issuer_metadata = {
  trusted_token_issuer_arn : trusted_token_issuer_arn option;
      [@ocaml.doc
        "The ARN of the trusted token issuer configuration in the instance of IAM Identity Center.\n"]
  name : trusted_token_issuer_name option;
      [@ocaml.doc
        "The name of the trusted token issuer configuration in the instance of IAM Identity Center.\n"]
  trusted_token_issuer_type : trusted_token_issuer_type option;
      [@ocaml.doc "The type of trusted token issuer.\n"]
}
[@@ocaml.doc "A structure that describes a trusted token issuer.\n"]

type nonrec trusted_token_issuer_list = trusted_token_issuer_metadata list [@@ocaml.doc ""]

type nonrec list_trusted_token_issuers_response = {
  trusted_token_issuers : trusted_token_issuer_list option;
      [@ocaml.doc "An array list of the trusted token issuer configurations.\n"]
  next_token : token option;
      [@ocaml.doc
        "If present, this value indicates that more output is available than is included in the \
         current response. Use this value in the [NextToken] request parameter in a subsequent \
         call to the operation to get the next part of the output. You should repeat this until \
         the [NextToken] response element comes back as [null]. This indicates that this is the \
         last page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_trusted_token_issuers_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "Specifies the ARN of the instance of IAM Identity Center with the trusted token issuer \
         configurations that you want to list.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the total number of results that you want included in each response. If \
         additional items exist beyond the number you specify, the [NextToken] response element is \
         returned with a value (not null). Include the specified value as the [NextToken] request \
         parameter in the next call to the operation to get the next set of results. Note that the \
         service might return fewer results than the maximum even when there are more results \
         available. You should check [NextToken] after every operation to ensure that you receive \
         all of the results.\n"]
  next_token : token option;
      [@ocaml.doc
        "Specifies that you want to receive the next page of results. Valid only if you received a \
         [NextToken] response in the previous request. If you did, it indicates that more output \
         is available. Set this parameter to the value provided by the previous call's [NextToken] \
         response to request the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec oidc_jwt_update_configuration = {
  claim_attribute_path : claim_attribute_path option;
      [@ocaml.doc
        "The path of the source attribute in the JWT from the trusted token issuer. The attribute \
         mapped by this JMESPath expression is compared against the attribute mapped by \
         [IdentityStoreAttributePath] when a trusted token issuer token is exchanged for an IAM \
         Identity Center token.\n"]
  identity_store_attribute_path : jmes_path option;
      [@ocaml.doc
        "The path of the destination attribute in a JWT from IAM Identity Center. The attribute \
         mapped by this JMESPath expression is compared against the attribute mapped by \
         [ClaimAttributePath] when a trusted token issuer token is exchanged for an IAM Identity \
         Center token.\n"]
  jwks_retrieval_option : jwks_retrieval_option option;
      [@ocaml.doc
        "The method that the trusted token issuer can use to retrieve the JSON Web Key Set used to \
         verify a JWT.\n"]
}
[@@ocaml.doc
  "A structure that describes updated configuration settings for a trusted token issuer that \
   supports OpenID Connect (OIDC) and JSON Web Tokens (JWTs).\n"]

type nonrec provision_permission_set_response = {
  permission_set_provisioning_status : permission_set_provisioning_status option;
      [@ocaml.doc "The status object for the permission set provisioning operation.\n"]
}
[@@ocaml.doc ""]

type nonrec provision_target_type =
  | AWS_ACCOUNT [@ocaml.doc ""]
  | ALL_PROVISIONED_ACCOUNTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec provision_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the permission set.\n"]
  target_id : target_id option;
      [@ocaml.doc
        "TargetID is an Amazon Web Services account identifier, (For example, 123456789012).\n"]
  target_type : provision_target_type;
      [@ocaml.doc "The entity type for which the assignment will be created.\n"]
}
[@@ocaml.doc ""]

type nonrec put_application_access_scope_request = {
  scope : scope;
      [@ocaml.doc
        "Specifies the name of the access scope to be associated with the specified targets.\n"]
  authorized_targets : scope_targets option;
      [@ocaml.doc
        "Specifies an array list of ARNs that represent the authorized targets for this access \
         scope.\n"]
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application with the access scope with the targets to add or \
         update.\n"]
}
[@@ocaml.doc ""]

type nonrec put_application_assignment_configuration_response = unit [@@ocaml.doc ""]

type nonrec put_application_assignment_configuration_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  assignment_required : assignment_required;
      [@ocaml.doc
        "If [AssignmentsRequired] is [true] (default value), users don\226\128\153t have access to \
         the application unless an assignment is created using the \
         {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html}CreateApplicationAssignment \
         API}. If [false], all users have access to the application. \n"]
}
[@@ocaml.doc ""]

type nonrec put_application_authentication_method_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application with the authentication method to add or update.\n"]
  authentication_method_type : authentication_method_type;
      [@ocaml.doc
        "Specifies the type of the authentication method that you want to add or update.\n"]
  authentication_method : authentication_method;
      [@ocaml.doc
        "Specifies a structure that describes the authentication method to add or update. The \
         structure type you provide is determined by the [AuthenticationMethodType] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec put_application_grant_request = {
  application_arn : application_arn;
      [@ocaml.doc "Specifies the ARN of the application to update.\n"]
  grant_type : grant_type; [@ocaml.doc "Specifies the type of grant to update.\n"]
  grant : grant; [@ocaml.doc "Specifies a structure that describes the grant to update.\n"]
}
[@@ocaml.doc ""]

type nonrec put_application_session_configuration_response = unit [@@ocaml.doc ""]

type nonrec put_application_session_configuration_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the application for which to update the session \
         configuration.\n"]
  user_background_session_application_status : user_background_session_application_status option;
      [@ocaml.doc "The status of user background sessions for the application.\n"]
}
[@@ocaml.doc ""]

type nonrec put_inline_policy_to_permission_set_response = unit [@@ocaml.doc ""]

type nonrec put_inline_policy_to_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the permission set.\n"]
  inline_policy : permission_set_policy_document;
      [@ocaml.doc "The inline policy to attach to a [PermissionSet].\n"]
}
[@@ocaml.doc ""]

type nonrec put_permissions_boundary_to_permission_set_response = unit [@@ocaml.doc ""]

type nonrec put_permissions_boundary_to_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the [PermissionSet].\n"]
  permissions_boundary : permissions_boundary;
      [@ocaml.doc "The permissions boundary that you want to attach to a [PermissionSet].\n"]
}
[@@ocaml.doc ""]

type nonrec remove_region_response = {
  status : region_status option;
      [@ocaml.doc
        "The status of the Region after the remove operation. The status is REMOVING when the \
         asynchronous workflow is in progress. The Region record is deleted when the workflow \
         completes.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_region_request = {
  instance_arn : instance_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM Identity Center instance.\n"]
  region_name : region_name;
      [@ocaml.doc
        "The name of the Amazon Web Services Region to remove from the IAM Identity Center \
         instance. The Region name must be 1-32 characters long and follow the pattern of Amazon \
         Web Services Region names (for example, us-east-1). The primary Region cannot be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec update_trusted_token_issuer_response = unit [@@ocaml.doc ""]

type nonrec trusted_token_issuer_update_configuration =
  | OidcJwtConfiguration of oidc_jwt_update_configuration
      [@ocaml.doc
        "A structure that describes an updated configuration for a trusted token issuer that uses \
         OpenID Connect (OIDC) with JSON web tokens (JWT).\n"]
[@@ocaml.doc
  "A structure that contains details to be updated for a trusted token issuer configuration. The \
   structure and settings that you can include depend on the type of the trusted token issuer \
   being updated.\n"]

type nonrec update_trusted_token_issuer_request = {
  trusted_token_issuer_arn : trusted_token_issuer_arn;
      [@ocaml.doc
        "Specifies the ARN of the trusted token issuer configuration that you want to update.\n"]
  name : trusted_token_issuer_name option;
      [@ocaml.doc
        "Specifies the updated name to be applied to the trusted token issuer configuration.\n"]
  trusted_token_issuer_configuration : trusted_token_issuer_update_configuration option;
      [@ocaml.doc
        "Specifies a structure with settings to apply to the specified trusted token issuer. The \
         settings that you can provide are determined by the type of the trusted token issuer that \
         you are updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_permission_set_response = unit [@@ocaml.doc ""]

type nonrec update_permission_set_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  permission_set_arn : permission_set_arn; [@ocaml.doc "The ARN of the permission set.\n"]
  description : permission_set_description option;
      [@ocaml.doc "The description of the [PermissionSet].\n"]
  session_duration : duration option;
      [@ocaml.doc
        "The length of time that the application user sessions are valid for in the ISO-8601 \
         standard.\n"]
  relay_state : relay_state option;
      [@ocaml.doc
        "Used to redirect users within the application during the federation authentication process.\n"]
}
[@@ocaml.doc ""]

type nonrec update_instance_access_control_attribute_configuration_response = unit [@@ocaml.doc ""]

type nonrec update_instance_access_control_attribute_configuration_request = {
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed.\n"]
  instance_access_control_attribute_configuration : instance_access_control_attribute_configuration;
      [@ocaml.doc "Updates the attributes for your ABAC configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec update_instance_response = unit [@@ocaml.doc ""]

type nonrec update_instance_request = {
  name : name_type option; [@ocaml.doc "Updates the instance name.\n"]
  instance_arn : instance_arn;
      [@ocaml.doc
        "The ARN of the instance of IAM Identity Center under which the operation will run. For \
         more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "Specifies the encryption configuration for your IAM Identity Center instance. You can use \
         this to configure customer managed KMS keys or Amazon Web Services owned KMS keys for \
         encrypting your instance data.\n"]
}
[@@ocaml.doc ""]

type nonrec update_application_response = unit [@@ocaml.doc ""]

type nonrec update_application_portal_options = {
  sign_in_options : sign_in_options option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A structure that describes the options for the access portal associated with an application \
   that can be updated.\n"]

type nonrec update_application_request = {
  application_arn : application_arn;
      [@ocaml.doc
        "Specifies the ARN of the application. For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  name : application_name_type option;
      [@ocaml.doc "Specifies the updated name for the application.\n"]
  description : description option; [@ocaml.doc "The description of the .\n"]
  status : application_status option;
      [@ocaml.doc "Specifies whether the application is enabled or disabled.\n"]
  portal_options : update_application_portal_options option;
      [@ocaml.doc
        "A structure that describes the options for the portal associated with an application.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The ARN of the resource with the tags to be listed.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The keys of tags that are attached to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  instance_arn : instance_arn option;
      [@ocaml.doc
        "The ARN of the IAM Identity Center instance under which the operation will be executed. \
         For more information about ARNs, see \
         {{:/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and \
         Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The ARN of the resource with the tags to be listed.\n"]
  tags : tag_list; [@ocaml.doc "A set of key-value pairs that are used to manage the resource.\n"]
}
[@@ocaml.doc ""]
