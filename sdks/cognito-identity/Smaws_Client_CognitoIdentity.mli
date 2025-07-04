(** 
    Cognito Identity client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec too_many_requests_exception =
  {
  message: string option
    [@ocaml.doc "Message returned by a TooManyRequestsException\n"]}[@@ocaml.doc
                                                                    "Thrown when a request is throttled.\n"]
type nonrec resource_not_found_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by a ResourceNotFoundException.\n"]}
[@@ocaml.doc
  "Thrown when the requested resource (for example, a dataset or record) does not exist.\n"]
type nonrec resource_conflict_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by a ResourceConflictException.\n"]}
[@@ocaml.doc
  "Thrown when a user tries to use a login which is already linked to another account.\n"]
type nonrec not_authorized_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by a NotAuthorizedException\n"]}
[@@ocaml.doc
  "Thrown when a user is not authorized to access the requested resource.\n"]
type nonrec limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by a LimitExceededException.\n"]}
[@@ocaml.doc
  "Thrown when the total number of user pools has exceeded a preset limit.\n"]
type nonrec invalid_parameter_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by an InvalidParameterException.\n"]}
[@@ocaml.doc "Thrown for missing or bad input parameter(s).\n"]
type nonrec internal_error_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by an InternalErrorException.\n"]}
[@@ocaml.doc
  "Thrown when the service encounters an error during processing the request.\n"]
type nonrec concurrent_modification_exception =
  {
  message: string option
    [@ocaml.doc
      "The message returned by a ConcurrentModificationException.\n"]}
[@@ocaml.doc "Thrown if there are parallel requests to modify a resource.\n"]
type nonrec identity_providers = (string * string) list[@@ocaml.doc ""]
type nonrec cognito_identity_provider =
  {
  server_side_token_check: bool option
    [@ocaml.doc
      "TRUE if server-side token validation is enabled for the identity provider\226\128\153s token.\n\n Once you set [ServerSideTokenCheck] to TRUE for an identity pool, that identity pool will check with the integrated user pools to make sure that the user has not been globally signed out or deleted before the identity pool provides an OIDC token or Amazon Web Services credentials for the user.\n \n  If the user is signed out or deleted, the identity pool will return a 400 Not Authorized error.\n  "];
  client_id: string option
    [@ocaml.doc "The client ID for the Amazon Cognito user pool.\n"];
  provider_name: string option
    [@ocaml.doc
      "The provider name for an Amazon Cognito user pool. For example, [cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789].\n"]}
[@@ocaml.doc
  "A provider representing an Amazon Cognito user pool and its client ID.\n"]
type nonrec identity_pool_tags_type = (string * string) list[@@ocaml.doc ""]
type nonrec identity_pool =
  {
  identity_pool_tags: identity_pool_tags_type option
    [@ocaml.doc
      "The tags that are assigned to the identity pool. A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.\n"];
  saml_provider_ar_ns: string list option
    [@ocaml.doc
      "An array of Amazon Resource Names (ARNs) of the SAML provider for your identity pool.\n"];
  cognito_identity_providers: cognito_identity_provider list option
    [@ocaml.doc
      "A list representing an Amazon Cognito user pool and its client ID.\n"];
  open_id_connect_provider_ar_ns: string list option
    [@ocaml.doc "The ARNs of the OpenID Connect providers.\n"];
  developer_provider_name: string option
    [@ocaml.doc
      "The \"domain\" by which Cognito will refer to your users.\n"];
  supported_login_providers: identity_providers option
    [@ocaml.doc
      "Optional key:value pairs mapping provider names to provider app IDs.\n"];
  allow_classic_flow: bool option
    [@ocaml.doc
      "Enables or disables the Basic (Classic) authentication flow. For more information, see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html}Identity Pools (Federated Identities) Authentication Flow} in the {i Amazon Cognito Developer Guide}.\n"];
  allow_unauthenticated_identities: bool
    [@ocaml.doc
      "TRUE if the identity pool supports unauthenticated logins.\n"];
  identity_pool_name: string [@ocaml.doc "A string that you provide.\n"];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "An object representing an Amazon Cognito identity pool.\n"]
type nonrec untag_resource_input =
  {
  tag_keys: string list
    [@ocaml.doc "The keys of the tags to remove from the user pool.\n"];
  resource_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the identity pool.\n"]}
[@@ocaml.doc ""]
type nonrec error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec unprocessed_identity_id =
  {
  error_code: error_code option
    [@ocaml.doc
      "The error code indicating the type of error that occurred.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.\n"]
type nonrec logins_map = (string * string) list[@@ocaml.doc ""]
type nonrec unlink_identity_input =
  {
  logins_to_remove: string list
    [@ocaml.doc "Provider names to unlink from this identity.\n"];
  logins: logins_map
    [@ocaml.doc
      "A set of optional name-value pairs that map provider names to provider tokens.\n"];
  identity_id: string
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the UnlinkIdentity action.\n"]
type nonrec external_service_exception =
  {
  message: string option
    [@ocaml.doc "The message returned by an ExternalServiceException\n"]}
[@@ocaml.doc
  "An exception thrown when a dependent service such as Facebook or Twitter is not responding\n"]
type nonrec unlink_developer_identity_input =
  {
  developer_user_identifier: string
    [@ocaml.doc
      "A unique ID used by your backend authentication process to identify a user.\n"];
  developer_provider_name: string
    [@ocaml.doc
      "The \"domain\" by which Cognito will refer to your users.\n"];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"];
  identity_id: string
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [UnlinkDeveloperIdentity] action.\n"]
type nonrec tag_resource_input =
  {
  tags: identity_pool_tags_type
    [@ocaml.doc "The tags to assign to the identity pool.\n"];
  resource_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the identity pool.\n"]}
[@@ocaml.doc ""]
type nonrec principal_tags = (string * string) list[@@ocaml.doc ""]
type nonrec set_principal_tag_attribute_map_response =
  {
  principal_tags: principal_tags option
    [@ocaml.doc
      "You can use this operation to add principal tags. The [PrincipalTags]operation enables you to reference user attributes in your IAM permissions policy.\n"];
  use_defaults: bool option
    [@ocaml.doc
      "You can use this operation to select default (username and clientID) attribute mappings.\n"];
  identity_provider_name: string option
    [@ocaml.doc
      "The provider name you want to use for attribute mappings.\n"];
  identity_pool_id: string option
    [@ocaml.doc
      "The ID of the Identity Pool you want to set attribute mappings for.\n"]}
[@@ocaml.doc ""]
type nonrec set_principal_tag_attribute_map_input =
  {
  principal_tags: principal_tags option
    [@ocaml.doc "You can use this operation to add principal tags.\n"];
  use_defaults: bool option
    [@ocaml.doc
      "You can use this operation to use default (username and clientID) attribute mappings.\n"];
  identity_provider_name: string
    [@ocaml.doc
      "The provider name you want to use for attribute mappings.\n"];
  identity_pool_id: string
    [@ocaml.doc
      "The ID of the Identity Pool you want to set attribute mappings for.\n"]}
[@@ocaml.doc ""]
type nonrec roles_map = (string * string) list[@@ocaml.doc ""]
type nonrec role_mapping_type =
  | RULES [@ocaml.doc ""]
  | TOKEN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ambiguous_role_resolution_type =
  | DENY [@ocaml.doc ""]
  | AUTHENTICATED_ROLE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec mapping_rule_match_type =
  | NOT_EQUAL [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec mapping_rule =
  {
  role_ar_n: string [@ocaml.doc "The role ARN.\n"];
  value: string
    [@ocaml.doc
      "A brief string that the claim must match, for example, \"paid\" or \"yes\".\n"];
  match_type: mapping_rule_match_type
    [@ocaml.doc
      "The match condition that specifies how closely the claim value in the IdP token must match [Value].\n"];
  claim: string
    [@ocaml.doc
      "The claim name that must be present in the token, for example, \"isAdmin\" or \"paid\".\n"]}
[@@ocaml.doc
  "A rule that maps a claim name, a claim value, and a match type to a role ARN.\n"]
type nonrec rules_configuration_type =
  {
  rules: mapping_rule list
    [@ocaml.doc
      "An array of rules. You can specify up to 25 rules per identity provider.\n\n Rules are evaluated in order. The first one to match specifies the role.\n "]}
[@@ocaml.doc "A container for rules.\n"]
type nonrec role_mapping =
  {
  rules_configuration: rules_configuration_type option
    [@ocaml.doc
      "The rules to be used for mapping users to roles.\n\n If you specify Rules as the role mapping type, [RulesConfiguration] is required.\n "];
  ambiguous_role_resolution: ambiguous_role_resolution_type option
    [@ocaml.doc
      "If you specify Token or Rules as the [Type], [AmbiguousRoleResolution] is required.\n\n Specifies the action to be taken if either no rules match the claim value for the [Rules] type, or there is no [cognito:preferred_role] claim and there are multiple [cognito:roles] matches for the [Token] type.\n "];
  type_: role_mapping_type
    [@ocaml.doc
      "The role mapping type. Token will use [cognito:roles] and [cognito:preferred_role] claims from the Cognito identity provider token to map groups to roles. Rules will attempt to match claims from the token to map to a role.\n"]}
[@@ocaml.doc "A role mapping.\n"]
type nonrec role_mapping_map = (string * role_mapping) list[@@ocaml.doc ""]
type nonrec set_identity_pool_roles_input =
  {
  role_mappings: role_mapping_map option
    [@ocaml.doc
      "How users for a specific identity provider are to mapped to roles. This is a string to [RoleMapping] object map. The string identifies the identity provider, for example, [graph.facebook.com] or [cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id].\n\n Up to 25 rules can be specified per identity provider.\n "];
  roles: roles_map
    [@ocaml.doc
      "The map of roles associated with this pool. For a given role, the key will be either \"authenticated\" or \"unauthenticated\" and the value will be the Role ARN.\n"];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [SetIdentityPoolRoles] action.\n"]
type nonrec merge_developer_identities_response =
  {
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Returned in response to a successful [MergeDeveloperIdentities] action.\n"]
type nonrec merge_developer_identities_input =
  {
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"];
  developer_provider_name: string
    [@ocaml.doc
      "The \"domain\" by which Cognito will refer to your users. This is a (pseudo) domain name that you provide while creating an identity pool. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. For the [DeveloperProviderName], you can use letters as well as period (.), underscore (_), and dash (-).\n"];
  destination_user_identifier: string
    [@ocaml.doc
      "User identifier for the destination user. The value should be a [DeveloperUserIdentifier].\n"];
  source_user_identifier: string
    [@ocaml.doc
      "User identifier for the source user. The value should be a [DeveloperUserIdentifier].\n"]}
[@@ocaml.doc "Input to the [MergeDeveloperIdentities] action.\n"]
type nonrec lookup_developer_identity_response =
  {
  next_token: string option
    [@ocaml.doc
      "A pagination token. The first call you make will have [NextToken] set to null. After that the service will return [NextToken] values as needed. For example, let's say you make a request with [MaxResults] set to 10, and there are 20 matches in the database. The service will return a pagination token as a part of the response. This token can be used to call the API again and get results starting from the 11th match.\n"];
  developer_user_identifier_list: string list option
    [@ocaml.doc
      "This is the list of developer user identifiers associated with an identity ID. Cognito supports the association of multiple developer user identifiers with an identity ID.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Returned in response to a successful [LookupDeveloperIdentity] action.\n"]
type nonrec lookup_developer_identity_input =
  {
  next_token: string option
    [@ocaml.doc
      "A pagination token. The first call you make will have [NextToken] set to null. After that the service will return [NextToken] values as needed. For example, let's say you make a request with [MaxResults] set to 10, and there are 20 matches in the database. The service will return a pagination token as a part of the response. This token can be used to call the API again and get results starting from the 11th match.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of identities to return.\n"];
  developer_user_identifier: string option
    [@ocaml.doc
      "A unique ID used by your backend authentication process to identify a user. Typically, a developer identity provider would issue many developer user identifiers, in keeping with the number of users.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [LookupDeveloperIdentityInput] action.\n"]
type nonrec list_tags_for_resource_response =
  {
  tags: identity_pool_tags_type option
    [@ocaml.doc "The tags that are assigned to the identity pool.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the identity pool that the tags are assigned to.\n"]}
[@@ocaml.doc ""]
type nonrec identity_pool_short_description =
  {
  identity_pool_name: string option
    [@ocaml.doc "A string that you provide.\n"];
  identity_pool_id: string option
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "A description of the identity pool.\n"]
type nonrec list_identity_pools_response =
  {
  next_token: string option [@ocaml.doc "A pagination token.\n"];
  identity_pools: identity_pool_short_description list option
    [@ocaml.doc
      "The identity pools returned by the ListIdentityPools action.\n"]}
[@@ocaml.doc "The result of a successful ListIdentityPools action.\n"]
type nonrec list_identity_pools_input =
  {
  next_token: string option [@ocaml.doc "A pagination token.\n"];
  max_results: int
    [@ocaml.doc "The maximum number of identities to return.\n"]}[@@ocaml.doc
                                                                   "Input to the ListIdentityPools action.\n"]
type nonrec identity_description =
  {
  last_modified_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "Date on which the identity was last modified.\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "Date on which the identity was created.\n"];
  logins: string list option [@ocaml.doc "The provider names.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "A description of the identity.\n"]
type nonrec list_identities_response =
  {
  next_token: string option [@ocaml.doc "A pagination token.\n"];
  identities: identity_description list option
    [@ocaml.doc
      "An object containing a set of identities and associated mappings.\n"];
  identity_pool_id: string option
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "The response to a ListIdentities request.\n"]
type nonrec list_identities_input =
  {
  hide_disabled: bool option
    [@ocaml.doc
      "An optional boolean parameter that allows you to hide disabled identities. If omitted, the ListIdentities API will include disabled identities in the response.\n"];
  next_token: string option [@ocaml.doc "A pagination token.\n"];
  max_results: int
    [@ocaml.doc "The maximum number of identities to return.\n"];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the ListIdentities action.\n"]
type nonrec invalid_identity_pool_configuration_exception =
  {
  message: string option
    [@ocaml.doc
      "The message returned for an [InvalidIdentityPoolConfigurationException] \n"]}
[@@ocaml.doc
  "If you provided authentication information in the request, the identity pool has no authenticated role configured, or STS returned an error response to the request to assume the authenticated role from the identity pool. If you provided no authentication information in the request, the identity pool has no unauthenticated role configured, or STS returned an error response to the request to assume the unauthenticated role from the identity pool.\n\n Your role trust policy must grant [AssumeRoleWithWebIdentity] permissions to [cognito-identity.amazonaws.com].\n "]
type nonrec get_principal_tag_attribute_map_response =
  {
  principal_tags: principal_tags option
    [@ocaml.doc
      "You can use this operation to add principal tags. The [PrincipalTags]operation enables you to reference user attributes in your IAM permissions policy.\n"];
  use_defaults: bool option
    [@ocaml.doc "You can use this operation to list \n"];
  identity_provider_name: string option
    [@ocaml.doc "You can use this operation to get the provider name.\n"];
  identity_pool_id: string option
    [@ocaml.doc
      "You can use this operation to get the ID of the Identity Pool you setup attribute mappings for.\n"]}
[@@ocaml.doc ""]
type nonrec get_principal_tag_attribute_map_input =
  {
  identity_provider_name: string
    [@ocaml.doc "You can use this operation to get the provider name.\n"];
  identity_pool_id: string
    [@ocaml.doc
      "You can use this operation to get the ID of the Identity Pool you setup attribute mappings for.\n"]}
[@@ocaml.doc ""]
type nonrec get_open_id_token_response =
  {
  token: string option
    [@ocaml.doc "An OpenID token, valid for 10 minutes.\n"];
  identity_id: string option
    [@ocaml.doc
      "A unique identifier in the format REGION:GUID. Note that the IdentityId returned may not match the one passed on input.\n"]}
[@@ocaml.doc
  "Returned in response to a successful GetOpenIdToken request.\n"]
type nonrec get_open_id_token_input =
  {
  logins: logins_map option
    [@ocaml.doc
      "A set of optional name-value pairs that map provider names to provider tokens. When using graph.facebook.com and www.amazon.com, supply the access_token returned from the provider's authflow. For accounts.google.com, an Amazon Cognito user pool provider, or any other OpenID Connect provider, always include the [id_token].\n"];
  identity_id: string
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the GetOpenIdToken action.\n"]
type nonrec get_open_id_token_for_developer_identity_response =
  {
  token: string option [@ocaml.doc "An OpenID token.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Returned in response to a successful [GetOpenIdTokenForDeveloperIdentity] request.\n"]
type nonrec get_open_id_token_for_developer_identity_input =
  {
  token_duration: int option
    [@ocaml.doc
      "The expiration time of the token, in seconds. You can specify a custom expiration time for the token so that you can cache it. If you don't provide an expiration time, the token is valid for 15 minutes. You can exchange the token with Amazon STS for temporary Amazon Web Services credentials, which are valid for a maximum of one hour. The maximum token duration you can set is 24 hours. You should take care in setting the expiration time for a token, as there are significant security implications: an attacker could use a leaked token to access your Amazon Web Services resources for the token's duration.\n\n  Please provide for a small grace period, usually no more than 5 minutes, to account for clock skew.\n  \n   "];
  principal_tags: principal_tags option
    [@ocaml.doc
      "Use this operation to configure attribute mappings for custom providers. \n"];
  logins: logins_map
    [@ocaml.doc
      "A set of optional name-value pairs that map provider names to provider tokens. Each name-value pair represents a user from a public provider or developer provider. If the user is from a developer provider, the name-value pair will follow the syntax [\"developer_provider_name\": \"developer_user_identifier\"]. The developer provider is the \"domain\" by which Cognito will refer to your users; you provided this domain while creating/updating the identity pool. The developer user identifier is an identifier from your backend that uniquely identifies a user. When you create an identity pool, you can specify the supported logins.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [GetOpenIdTokenForDeveloperIdentity] action.\n"]
type nonrec developer_user_already_registered_exception =
  {
  message: string option
    [@ocaml.doc
      "This developer user identifier is already registered with Cognito.\n"]}
[@@ocaml.doc
  "The provided developer user identifier is already registered with Cognito under a different identity ID.\n"]
type nonrec get_identity_pool_roles_response =
  {
  role_mappings: role_mapping_map option
    [@ocaml.doc
      "How users for a specific identity provider are to mapped to roles. This is a String-to-[RoleMapping] object map. The string identifies the identity provider, for example, [graph.facebook.com] or [cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id].\n"];
  roles: roles_map option
    [@ocaml.doc
      "The map of roles associated with this pool. Currently only authenticated and unauthenticated roles are supported.\n"];
  identity_pool_id: string option
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Returned in response to a successful [GetIdentityPoolRoles] operation.\n"]
type nonrec get_identity_pool_roles_input =
  {
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [GetIdentityPoolRoles] action.\n"]
type nonrec get_id_response =
  {
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Returned in response to a GetId request.\n"]
type nonrec get_id_input =
  {
  logins: logins_map option
    [@ocaml.doc
      "A set of optional name-value pairs that map provider names to provider tokens. The available provider names for [Logins] are as follows:\n\n {ul\n       {-  Facebook: [graph.facebook.com] \n           \n            }\n       {-  Amazon Cognito user pool: \n           {[\n           cognito-idp..amazonaws.com/\n           ]}\n           , for example, [cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789]. \n           \n            }\n       {-  Google: [accounts.google.com] \n           \n            }\n       {-  Amazon: [www.amazon.com] \n           \n            }\n       {-  Twitter: [api.twitter.com] \n           \n            }\n       {-  Digits: [www.digits.com] \n           \n            }\n       }\n  "];
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"];
  account_id: string option
    [@ocaml.doc "A standard Amazon Web Services account ID (9+ digits).\n"]}
[@@ocaml.doc "Input to the GetId action.\n"]
type nonrec credentials =
  {
  expiration: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date at which these credentials will expire.\n"];
  session_token: string option
    [@ocaml.doc "The Session Token portion of the credentials\n"];
  secret_key: string option
    [@ocaml.doc "The Secret Access Key portion of the credentials\n"];
  access_key_id: string option
    [@ocaml.doc "The Access Key portion of the credentials.\n"]}[@@ocaml.doc
                                                                  "Credentials for the provided identity ID.\n"]
type nonrec get_credentials_for_identity_response =
  {
  credentials: credentials option
    [@ocaml.doc "Credentials for the provided identity ID.\n"];
  identity_id: string option
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Returned in response to a successful [GetCredentialsForIdentity] operation.\n"]
type nonrec get_credentials_for_identity_input =
  {
  custom_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the role to be assumed when multiple roles were received in the token from the identity provider. For example, a SAML-based identity provider. This parameter is optional for identity providers that do not support role customization.\n"];
  logins: logins_map option
    [@ocaml.doc
      "A set of optional name-value pairs that map provider names to provider tokens. The name-value pair will follow the syntax \"provider_name\": \"provider_user_identifier\".\n\n Logins should not be specified when trying to get credentials for an unauthenticated identity.\n \n  The Logins parameter is required when using identities associated with external identity providers such as Facebook. For examples of [Logins] maps, see the code examples in the {{:https://docs.aws.amazon.com/cognito/latest/developerguide/external-identity-providers.html}External Identity Providers} section of the Amazon Cognito Developer Guide.\n  "];
  identity_id: string
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [GetCredentialsForIdentity] action.\n"]
type nonrec describe_identity_pool_input =
  {
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the DescribeIdentityPool action.\n"]
type nonrec describe_identity_input =
  {
  identity_id: string
    [@ocaml.doc "A unique identifier in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the [DescribeIdentity] action.\n"]
type nonrec delete_identity_pool_input =
  {
  identity_pool_id: string
    [@ocaml.doc "An identity pool ID in the format REGION:GUID.\n"]}[@@ocaml.doc
                                                                    "Input to the DeleteIdentityPool action.\n"]
type nonrec delete_identities_response =
  {
  unprocessed_identity_ids: unprocessed_identity_id list option
    [@ocaml.doc
      "An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.\n"]}
[@@ocaml.doc
  "Returned in response to a successful [DeleteIdentities] operation.\n"]
type nonrec delete_identities_input =
  {
  identity_ids_to_delete: string list
    [@ocaml.doc "A list of 1-60 identities that you want to delete.\n"]}
[@@ocaml.doc "Input to the [DeleteIdentities] action.\n"]
type nonrec create_identity_pool_input =
  {
  identity_pool_tags: identity_pool_tags_type option
    [@ocaml.doc
      "Tags to assign to the identity pool. A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.\n"];
  saml_provider_ar_ns: string list option
    [@ocaml.doc
      "An array of Amazon Resource Names (ARNs) of the SAML provider for your identity pool.\n"];
  cognito_identity_providers: cognito_identity_provider list option
    [@ocaml.doc
      "An array of Amazon Cognito user pools and their client IDs.\n"];
  open_id_connect_provider_ar_ns: string list option
    [@ocaml.doc
      "The Amazon Resource Names (ARN) of the OpenID Connect providers.\n"];
  developer_provider_name: string option
    [@ocaml.doc
      "The \"domain\" by which Cognito will refer to your users. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. For the [DeveloperProviderName], you can use letters as well as period ([.]), underscore ([_]), and dash ([-]).\n\n Once you have set a developer provider name, you cannot change it. Please take care in setting this parameter.\n "];
  supported_login_providers: identity_providers option
    [@ocaml.doc
      "Optional key:value pairs mapping provider names to provider app IDs.\n"];
  allow_classic_flow: bool option
    [@ocaml.doc
      "Enables or disables the Basic (Classic) authentication flow. For more information, see {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html}Identity Pools (Federated Identities) Authentication Flow} in the {i Amazon Cognito Developer Guide}.\n"];
  allow_unauthenticated_identities: bool
    [@ocaml.doc
      "TRUE if the identity pool supports unauthenticated logins.\n"];
  identity_pool_name: string [@ocaml.doc "A string that you provide.\n"]}
[@@ocaml.doc "Input to the CreateIdentityPool action.\n"](** {1:builders Builders} *)

val make_cognito_identity_provider :
  ?server_side_token_check:bool ->
    ?client_id:string ->
      ?provider_name:string -> unit -> cognito_identity_provider
val make_identity_pool :
  ?identity_pool_tags:identity_pool_tags_type ->
    ?saml_provider_ar_ns:string list ->
      ?cognito_identity_providers:cognito_identity_provider list ->
        ?open_id_connect_provider_ar_ns:string list ->
          ?developer_provider_name:string ->
            ?supported_login_providers:identity_providers ->
              ?allow_classic_flow:bool ->
                allow_unauthenticated_identities:bool ->
                  identity_pool_name:string ->
                    identity_pool_id:string -> unit -> identity_pool
val make_untag_resource_response : unit -> unit
val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit -> untag_resource_input
val make_unprocessed_identity_id :
  ?error_code:error_code ->
    ?identity_id:string -> unit -> unprocessed_identity_id
val make_unlink_identity_input :
  logins_to_remove:string list ->
    logins:logins_map -> identity_id:string -> unit -> unlink_identity_input
val make_unlink_developer_identity_input :
  developer_user_identifier:string ->
    developer_provider_name:string ->
      identity_pool_id:string ->
        identity_id:string -> unit -> unlink_developer_identity_input
val make_tag_resource_response : unit -> unit
val make_tag_resource_input :
  tags:identity_pool_tags_type ->
    resource_arn:string -> unit -> tag_resource_input
val make_set_principal_tag_attribute_map_response :
  ?principal_tags:principal_tags ->
    ?use_defaults:bool ->
      ?identity_provider_name:string ->
        ?identity_pool_id:string ->
          unit -> set_principal_tag_attribute_map_response
val make_set_principal_tag_attribute_map_input :
  ?principal_tags:principal_tags ->
    ?use_defaults:bool ->
      identity_provider_name:string ->
        identity_pool_id:string ->
          unit -> set_principal_tag_attribute_map_input
val make_mapping_rule :
  role_ar_n:string ->
    value:string ->
      match_type:mapping_rule_match_type ->
        claim:string -> unit -> mapping_rule
val make_rules_configuration_type :
  rules:mapping_rule list -> unit -> rules_configuration_type
val make_role_mapping :
  ?rules_configuration:rules_configuration_type ->
    ?ambiguous_role_resolution:ambiguous_role_resolution_type ->
      type_:role_mapping_type -> unit -> role_mapping
val make_set_identity_pool_roles_input :
  ?role_mappings:role_mapping_map ->
    roles:roles_map ->
      identity_pool_id:string -> unit -> set_identity_pool_roles_input
val make_merge_developer_identities_response :
  ?identity_id:string -> unit -> merge_developer_identities_response
val make_merge_developer_identities_input :
  identity_pool_id:string ->
    developer_provider_name:string ->
      destination_user_identifier:string ->
        source_user_identifier:string ->
          unit -> merge_developer_identities_input
val make_lookup_developer_identity_response :
  ?next_token:string ->
    ?developer_user_identifier_list:string list ->
      ?identity_id:string -> unit -> lookup_developer_identity_response
val make_lookup_developer_identity_input :
  ?next_token:string ->
    ?max_results:int ->
      ?developer_user_identifier:string ->
        ?identity_id:string ->
          identity_pool_id:string -> unit -> lookup_developer_identity_input
val make_list_tags_for_resource_response :
  ?tags:identity_pool_tags_type -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_input :
  resource_arn:string -> unit -> list_tags_for_resource_input
val make_identity_pool_short_description :
  ?identity_pool_name:string ->
    ?identity_pool_id:string -> unit -> identity_pool_short_description
val make_list_identity_pools_response :
  ?next_token:string ->
    ?identity_pools:identity_pool_short_description list ->
      unit -> list_identity_pools_response
val make_list_identity_pools_input :
  ?next_token:string -> max_results:int -> unit -> list_identity_pools_input
val make_identity_description :
  ?last_modified_date:CoreTypes.Timestamp.t ->
    ?creation_date:CoreTypes.Timestamp.t ->
      ?logins:string list ->
        ?identity_id:string -> unit -> identity_description
val make_list_identities_response :
  ?next_token:string ->
    ?identities:identity_description list ->
      ?identity_pool_id:string -> unit -> list_identities_response
val make_list_identities_input :
  ?hide_disabled:bool ->
    ?next_token:string ->
      max_results:int ->
        identity_pool_id:string -> unit -> list_identities_input
val make_get_principal_tag_attribute_map_response :
  ?principal_tags:principal_tags ->
    ?use_defaults:bool ->
      ?identity_provider_name:string ->
        ?identity_pool_id:string ->
          unit -> get_principal_tag_attribute_map_response
val make_get_principal_tag_attribute_map_input :
  identity_provider_name:string ->
    identity_pool_id:string -> unit -> get_principal_tag_attribute_map_input
val make_get_open_id_token_response :
  ?token:string -> ?identity_id:string -> unit -> get_open_id_token_response
val make_get_open_id_token_input :
  ?logins:logins_map -> identity_id:string -> unit -> get_open_id_token_input
val make_get_open_id_token_for_developer_identity_response :
  ?token:string ->
    ?identity_id:string ->
      unit -> get_open_id_token_for_developer_identity_response
val make_get_open_id_token_for_developer_identity_input :
  ?token_duration:int ->
    ?principal_tags:principal_tags ->
      ?identity_id:string ->
        logins:logins_map ->
          identity_pool_id:string ->
            unit -> get_open_id_token_for_developer_identity_input
val make_get_identity_pool_roles_response :
  ?role_mappings:role_mapping_map ->
    ?roles:roles_map ->
      ?identity_pool_id:string -> unit -> get_identity_pool_roles_response
val make_get_identity_pool_roles_input :
  identity_pool_id:string -> unit -> get_identity_pool_roles_input
val make_get_id_response : ?identity_id:string -> unit -> get_id_response
val make_get_id_input :
  ?logins:logins_map ->
    ?account_id:string -> identity_pool_id:string -> unit -> get_id_input
val make_credentials :
  ?expiration:CoreTypes.Timestamp.t ->
    ?session_token:string ->
      ?secret_key:string -> ?access_key_id:string -> unit -> credentials
val make_get_credentials_for_identity_response :
  ?credentials:credentials ->
    ?identity_id:string -> unit -> get_credentials_for_identity_response
val make_get_credentials_for_identity_input :
  ?custom_role_arn:string ->
    ?logins:logins_map ->
      identity_id:string -> unit -> get_credentials_for_identity_input
val make_describe_identity_pool_input :
  identity_pool_id:string -> unit -> describe_identity_pool_input
val make_describe_identity_input :
  identity_id:string -> unit -> describe_identity_input
val make_delete_identity_pool_input :
  identity_pool_id:string -> unit -> delete_identity_pool_input
val make_delete_identities_response :
  ?unprocessed_identity_ids:unprocessed_identity_id list ->
    unit -> delete_identities_response
val make_delete_identities_input :
  identity_ids_to_delete:string list -> unit -> delete_identities_input
val make_create_identity_pool_input :
  ?identity_pool_tags:identity_pool_tags_type ->
    ?saml_provider_ar_ns:string list ->
      ?cognito_identity_providers:cognito_identity_provider list ->
        ?open_id_connect_provider_ar_ns:string list ->
          ?developer_provider_name:string ->
            ?supported_login_providers:identity_providers ->
              ?allow_classic_flow:bool ->
                allow_unauthenticated_identities:bool ->
                  identity_pool_name:string ->
                    unit -> create_identity_pool_input(** {1:operations Operations} *)

module CreateIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_identity_pool_input ->
        (identity_pool,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Creates a new identity pool. The identity pool is a store of user identity information that is specific to your Amazon Web Services account. The keys for [SupportedLoginProviders] are as follows:\n\n {ul\n       {-  Facebook: [graph.facebook.com] \n           \n            }\n       {-  Google: [accounts.google.com] \n           \n            }\n       {-  Sign in With Apple: [appleid.apple.com] \n           \n            }\n       {-  Amazon: [www.amazon.com] \n           \n            }\n       {-  Twitter: [api.twitter.com] \n           \n            }\n       {-  Digits: [www.digits.com] \n           \n            }\n       }\n    If you don't provide a value for a parameter, Amazon Cognito sets it to its default value. \n    \n      You must use Amazon Web Services developer credentials to call this operation.\n      "]
module DeleteIdentities :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identities_input ->
        (delete_identities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module DeleteIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identity_pool_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the pool.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module DescribeIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_input ->
        (identity_description,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Returns metadata related to the given identity, including when the identity was created and any associated linked logins.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module DescribeIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_pool_input ->
        (identity_pool,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module GetCredentialsForIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_credentials_for_identity_input ->
        (get_credentials_for_identity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidIdentityPoolConfigurationException of
              invalid_identity_pool_configuration_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for [cognito-identity.amazonaws.com], it will be passed through to Security Token Service with the appropriate role for the token.\n\n This is a public API. You do not need any credentials to call this API.\n "]
module GetId :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_id_input ->
        (get_id_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Generates (or retrieves) IdentityID. Supplying multiple logins will create an implicit linked account.\n\n This is a public API. You do not need any credentials to call this API.\n "]
module GetIdentityPoolRoles :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_identity_pool_roles_input ->
        (get_identity_pool_roles_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Gets the roles for an identity pool.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module GetOpenIdToken :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_input ->
        (get_open_id_token_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by [GetId]. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.\n\n The OpenID token is valid for 10 minutes.\n \n  This is a public API. You do not need any credentials to call this API.\n  "]
module GetOpenIdTokenForDeveloperIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_for_developer_identity_input ->
        (get_open_id_token_for_developer_identity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DeveloperUserAlreadyRegisteredException of
              developer_user_already_registered_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Registers (or retrieves) a Cognito [IdentityId] and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the [Logins] map, which is linked to the identity pool. The developer provider is the \"domain\" by which Cognito will refer to your users.\n\n You can use [GetOpenIdTokenForDeveloperIdentity] to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the [IdentityId] should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing [IdentityId]. This API will create the identity in the specified [IdentityPoolId].\n \n  You must use Amazon Web Services developer credentials to call this operation.\n  "]
module GetPrincipalTagAttributeMap :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_principal_tag_attribute_map_input ->
        (get_principal_tag_attribute_map_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Use [GetPrincipalTagAttributeMap] to list all mappings between [PrincipalTags] and user attributes.\n"]
module ListIdentities :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_identities_input ->
        (list_identities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Lists the identities in an identity pool.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module ListIdentityPools :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_identity_pools_input ->
        (list_identity_pools_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Lists all of the Cognito identity pools registered for your account.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Lists the tags that are assigned to an Amazon Cognito identity pool.\n\n A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.\n \n  You can use this action up to 10 times per second, per account.\n  "]
module LookupDeveloperIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_developer_identity_input ->
        (lookup_developer_identity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Retrieves the [IdentityID] associated with a [DeveloperUserIdentifier] or the list of [DeveloperUserIdentifier] values associated with an [IdentityId] for an existing identity. Either [IdentityID] or [DeveloperUserIdentifier] must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, [DeveloperUserIdentifier] will be matched against [IdentityID]. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise, a [ResourceConflictException] is thrown.\n\n  [LookupDeveloperIdentity] is intended for low-throughput control plane operations: for example, to enable customer service to locate an identity ID by username. If you are using it for higher-volume operations such as user authentication, your requests are likely to be throttled. [GetOpenIdTokenForDeveloperIdentity] is a better option for higher-volume operations for user authentication.\n \n  You must use Amazon Web Services developer credentials to call this operation.\n  "]
module MergeDeveloperIdentities :
sig
  val request :
    Smaws_Lib.Context.t ->
      merge_developer_identities_input ->
        (merge_developer_identities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Merges two users having different [IdentityId]s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user ([SourceUserIdentifier]) with the [IdentityId] of the [DestinationUserIdentifier]. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.\n\n The number of linked logins is limited to 20. So, the number of linked logins for the source user, [SourceUserIdentifier], and the destination user, [DestinationUserIdentifier], together should not be larger than 20. Otherwise, an exception will be thrown.\n \n  You must use Amazon Web Services developer credentials to call this operation.\n  "]
module SetIdentityPoolRoles :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_identity_pool_roles_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Sets the roles for an identity pool. These roles are used when making calls to [GetCredentialsForIdentity] action.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module SetPrincipalTagAttributeMap :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_principal_tag_attribute_map_input ->
        (set_principal_tag_attribute_map_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "You can use this operation to use default (username and clientID) attribute or custom attribute mappings.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Assigns a set of tags to the specified Amazon Cognito identity pool. A tag is a label that you can use to categorize and manage identity pools in different ways, such as by purpose, owner, environment, or other criteria.\n\n Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of an identity pool, one for testing and another for production, you might assign an [Environment] tag key to both identity pools. The value of this key might be [Test] for one identity pool and [Production] for the other.\n \n  Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your identity pools. In an IAM policy, you can constrain permissions for identity pools based on specific tags or tag values.\n  \n   You can use this action up to 5 times per second, per account. An identity pool can have as many as 50 tags.\n   "]
module UnlinkDeveloperIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_developer_identity_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Unlinks a [DeveloperUserIdentifier] from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module UnlinkIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_identity_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.\n\n This is a public API. You do not need any credentials to call this API.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Removes the specified tags from the specified Amazon Cognito identity pool. You can use this action up to 5 times per second, per account\n"]
module UpdateIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      identity_pool ->
        (identity_pool,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Updates the configuration of an identity pool.\n\n  If you don't provide a value for a parameter, Amazon Cognito sets it to its default value. \n  \n    You must use Amazon Web Services developer credentials to call this operation.\n    "]