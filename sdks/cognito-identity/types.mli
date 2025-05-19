open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec too_many_requests_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when a request is throttled.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when the requested resource (for example, a dataset or record) does not exist.\n"]
type nonrec resource_conflict_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when a user tries to use a login which is already linked to another account.\n"]
type nonrec not_authorized_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when a user is not authorized to access the requested resource.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when the total number of user pools has exceeded a preset limit.\n"]
type nonrec invalid_parameter_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown for missing or bad input parameter(s).\n"]
type nonrec internal_error_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when the service encounters an error during processing the request.\n"]
type nonrec concurrent_modification_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown if there are parallel requests to modify a resource.\n"]
type nonrec identity_providers = (string * string) list[@@ocaml.doc ""]
type nonrec cognito_identity_provider =
  {
  server_side_token_check: bool option ;
  client_id: string option ;
  provider_name: string option }[@@ocaml.doc
                                  "A provider representing an Amazon Cognito user pool and its client ID.\n"]
type nonrec identity_pool_tags_type = (string * string) list[@@ocaml.doc ""]
type nonrec identity_pool =
  {
  identity_pool_tags: identity_pool_tags_type option ;
  saml_provider_ar_ns: string list option ;
  cognito_identity_providers: cognito_identity_provider list option ;
  open_id_connect_provider_ar_ns: string list option ;
  developer_provider_name: string option ;
  supported_login_providers: identity_providers option ;
  allow_classic_flow: bool option ;
  allow_unauthenticated_identities: bool ;
  identity_pool_name: string ;
  identity_pool_id: string }[@@ocaml.doc
                              "An object representing an Amazon Cognito identity pool.\n"]
type nonrec untag_resource_response = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec error_code =
  | INTERNAL_SERVER_ERROR 
  | ACCESS_DENIED [@@ocaml.doc ""]
type nonrec unprocessed_identity_id =
  {
  error_code: error_code option ;
  identity_id: string option }[@@ocaml.doc
                                "An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.\n"]
type nonrec logins_map = (string * string) list[@@ocaml.doc ""]
type nonrec unlink_identity_input =
  {
  logins_to_remove: string list ;
  logins: logins_map ;
  identity_id: string }[@@ocaml.doc "Input to the UnlinkIdentity action.\n"]
type nonrec external_service_exception = {
  message: string option }[@@ocaml.doc
                            "An exception thrown when a dependent service such as Facebook or Twitter is not responding\n"]
type nonrec unlink_developer_identity_input =
  {
  developer_user_identifier: string ;
  developer_provider_name: string ;
  identity_pool_id: string ;
  identity_id: string }[@@ocaml.doc
                         "Input to the [UnlinkDeveloperIdentity] action.\n"]
type nonrec tag_resource_response = unit
type nonrec tag_resource_input =
  {
  tags: identity_pool_tags_type ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec principal_tags = (string * string) list[@@ocaml.doc ""]
type nonrec set_principal_tag_attribute_map_response =
  {
  principal_tags: principal_tags option ;
  use_defaults: bool option ;
  identity_provider_name: string option ;
  identity_pool_id: string option }[@@ocaml.doc ""]
type nonrec set_principal_tag_attribute_map_input =
  {
  principal_tags: principal_tags option ;
  use_defaults: bool option ;
  identity_provider_name: string ;
  identity_pool_id: string }[@@ocaml.doc ""]
type nonrec roles_map = (string * string) list[@@ocaml.doc ""]
type nonrec role_mapping_type =
  | RULES 
  | TOKEN [@@ocaml.doc ""]
type nonrec ambiguous_role_resolution_type =
  | DENY 
  | AUTHENTICATED_ROLE [@@ocaml.doc ""]
type nonrec mapping_rule_match_type =
  | NOT_EQUAL 
  | STARTS_WITH 
  | CONTAINS 
  | EQUALS [@@ocaml.doc ""]
type nonrec mapping_rule =
  {
  role_ar_n: string ;
  value: string ;
  match_type: mapping_rule_match_type ;
  claim: string }[@@ocaml.doc
                   "A rule that maps a claim name, a claim value, and a match type to a role ARN.\n"]
type nonrec rules_configuration_type = {
  rules: mapping_rule list }[@@ocaml.doc "A container for rules.\n"]
type nonrec role_mapping =
  {
  rules_configuration: rules_configuration_type option ;
  ambiguous_role_resolution: ambiguous_role_resolution_type option ;
  type_: role_mapping_type }[@@ocaml.doc "A role mapping.\n"]
type nonrec role_mapping_map = (string * role_mapping) list[@@ocaml.doc ""]
type nonrec set_identity_pool_roles_input =
  {
  role_mappings: role_mapping_map option ;
  roles: roles_map ;
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the [SetIdentityPoolRoles] action.\n"]
type nonrec merge_developer_identities_response =
  {
  identity_id: string option }[@@ocaml.doc
                                "Returned in response to a successful [MergeDeveloperIdentities] action.\n"]
type nonrec merge_developer_identities_input =
  {
  identity_pool_id: string ;
  developer_provider_name: string ;
  destination_user_identifier: string ;
  source_user_identifier: string }[@@ocaml.doc
                                    "Input to the [MergeDeveloperIdentities] action.\n"]
type nonrec lookup_developer_identity_response =
  {
  next_token: string option ;
  developer_user_identifier_list: string list option ;
  identity_id: string option }[@@ocaml.doc
                                "Returned in response to a successful [LookupDeveloperIdentity] action.\n"]
type nonrec lookup_developer_identity_input =
  {
  next_token: string option ;
  max_results: int option ;
  developer_user_identifier: string option ;
  identity_id: string option ;
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the [LookupDeveloperIdentityInput] action.\n"]
type nonrec list_tags_for_resource_response =
  {
  tags: identity_pool_tags_type option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec identity_pool_short_description =
  {
  identity_pool_name: string option ;
  identity_pool_id: string option }[@@ocaml.doc
                                     "A description of the identity pool.\n"]
type nonrec list_identity_pools_response =
  {
  next_token: string option ;
  identity_pools: identity_pool_short_description list option }[@@ocaml.doc
                                                                 "The result of a successful ListIdentityPools action.\n"]
type nonrec list_identity_pools_input =
  {
  next_token: string option ;
  max_results: int }[@@ocaml.doc "Input to the ListIdentityPools action.\n"]
type nonrec identity_description =
  {
  last_modified_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t option ;
  logins: string list option ;
  identity_id: string option }[@@ocaml.doc
                                "A description of the identity.\n"]
type nonrec list_identities_response =
  {
  next_token: string option ;
  identities: identity_description list option ;
  identity_pool_id: string option }[@@ocaml.doc
                                     "The response to a ListIdentities request.\n"]
type nonrec list_identities_input =
  {
  hide_disabled: bool option ;
  next_token: string option ;
  max_results: int ;
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the ListIdentities action.\n"]
type nonrec invalid_identity_pool_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "Thrown if the identity pool has no role associated for the given auth type (auth/unauth) or if the AssumeRole fails.\n"]
type nonrec get_principal_tag_attribute_map_response =
  {
  principal_tags: principal_tags option ;
  use_defaults: bool option ;
  identity_provider_name: string option ;
  identity_pool_id: string option }[@@ocaml.doc ""]
type nonrec get_principal_tag_attribute_map_input =
  {
  identity_provider_name: string ;
  identity_pool_id: string }[@@ocaml.doc ""]
type nonrec get_open_id_token_response =
  {
  token: string option ;
  identity_id: string option }[@@ocaml.doc
                                "Returned in response to a successful GetOpenIdToken request.\n"]
type nonrec get_open_id_token_input =
  {
  logins: logins_map option ;
  identity_id: string }[@@ocaml.doc "Input to the GetOpenIdToken action.\n"]
type nonrec get_open_id_token_for_developer_identity_response =
  {
  token: string option ;
  identity_id: string option }[@@ocaml.doc
                                "Returned in response to a successful [GetOpenIdTokenForDeveloperIdentity] request.\n"]
type nonrec get_open_id_token_for_developer_identity_input =
  {
  token_duration: int option ;
  principal_tags: principal_tags option ;
  logins: logins_map ;
  identity_id: string option ;
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the [GetOpenIdTokenForDeveloperIdentity] action.\n"]
type nonrec developer_user_already_registered_exception =
  {
  message: string option }[@@ocaml.doc
                            "The provided developer user identifier is already registered with Cognito under a different identity ID.\n"]
type nonrec get_identity_pool_roles_response =
  {
  role_mappings: role_mapping_map option ;
  roles: roles_map option ;
  identity_pool_id: string option }[@@ocaml.doc
                                     "Returned in response to a successful [GetIdentityPoolRoles] operation.\n"]
type nonrec get_identity_pool_roles_input = {
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the [GetIdentityPoolRoles] action.\n"]
type nonrec get_id_response = {
  identity_id: string option }[@@ocaml.doc
                                "Returned in response to a GetId request.\n"]
type nonrec get_id_input =
  {
  logins: logins_map option ;
  identity_pool_id: string ;
  account_id: string option }[@@ocaml.doc "Input to the GetId action.\n"]
type nonrec credentials =
  {
  expiration: CoreTypes.Timestamp.t option ;
  session_token: string option ;
  secret_key: string option ;
  access_key_id: string option }[@@ocaml.doc
                                  "Credentials for the provided identity ID.\n"]
type nonrec get_credentials_for_identity_response =
  {
  credentials: credentials option ;
  identity_id: string option }[@@ocaml.doc
                                "Returned in response to a successful [GetCredentialsForIdentity] operation.\n"]
type nonrec get_credentials_for_identity_input =
  {
  custom_role_arn: string option ;
  logins: logins_map option ;
  identity_id: string }[@@ocaml.doc
                         "Input to the [GetCredentialsForIdentity] action.\n"]
type nonrec describe_identity_pool_input = {
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the DescribeIdentityPool action.\n"]
type nonrec describe_identity_input = {
  identity_id: string }[@@ocaml.doc
                         "Input to the [DescribeIdentity] action.\n"]
type nonrec delete_identity_pool_input = {
  identity_pool_id: string }[@@ocaml.doc
                              "Input to the DeleteIdentityPool action.\n"]
type nonrec delete_identities_response =
  {
  unprocessed_identity_ids: unprocessed_identity_id list option }[@@ocaml.doc
                                                                   "Returned in response to a successful [DeleteIdentities] operation.\n"]
type nonrec delete_identities_input = {
  identity_ids_to_delete: string list }[@@ocaml.doc
                                         "Input to the [DeleteIdentities] action.\n"]
type nonrec create_identity_pool_input =
  {
  identity_pool_tags: identity_pool_tags_type option ;
  saml_provider_ar_ns: string list option ;
  cognito_identity_providers: cognito_identity_provider list option ;
  open_id_connect_provider_ar_ns: string list option ;
  developer_provider_name: string option ;
  supported_login_providers: identity_providers option ;
  allow_classic_flow: bool option ;
  allow_unauthenticated_identities: bool ;
  identity_pool_name: string }[@@ocaml.doc
                                "Input to the CreateIdentityPool action.\n"]