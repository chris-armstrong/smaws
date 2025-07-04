open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cognito-identity";
      endpointPrefix = "cognito-identity";
      version = "2014-06-30";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
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
      "TRUE if server-side token validation is enabled for the identity provider\226\128\153s token.\n\n Once you set [ServerSideTokenCheck] to TRUE for an identity pool, that identity pool will check with the integrated user pools to make sure that the user has not been globally signed out or deleted before the identity pool provides an OIDC token or AWS credentials for the user.\n \n  If the user is signed out or deleted, the identity pool will return a 400 Not Authorized error.\n  "];
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
      "How users for a specific identity provider are to mapped to roles. This is a string to [RoleMapping] object map. The string identifies the identity provider, for example, \"graph.facebook.com\" or \"cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id\".\n\n Up to 25 rules can be specified per identity provider.\n "];
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
  "Thrown if the identity pool has no role associated for the given auth type (auth/unauth) or if the AssumeRole fails.\n"]
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
      "The expiration time of the token, in seconds. You can specify a custom expiration time for the token so that you can cache it. If you don't provide an expiration time, the token is valid for 15 minutes. You can exchange the token with Amazon STS for temporary AWS credentials, which are valid for a maximum of one hour. The maximum token duration you can set is 24 hours. You should take care in setting the expiration time for a token, as there are significant security implications: an attacker could use a leaked token to access your AWS resources for the token's duration.\n\n  Please provide for a small grace period, usually no more than 5 minutes, to account for clock skew.\n  \n   "];
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
      "How users for a specific identity provider are to mapped to roles. This is a String-to-[RoleMapping] object map. The string identifies the identity provider, for example, \"graph.facebook.com\" or \"cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id\".\n"];
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
    [@ocaml.doc "A standard AWS account ID (9+ digits).\n"]}[@@ocaml.doc
                                                              "Input to the GetId action.\n"]
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
[@@ocaml.doc "Input to the CreateIdentityPool action.\n"]