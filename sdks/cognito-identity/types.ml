open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cognito-identity";
      endpointPrefix = "cognito-identity";
      version = "2014-06-30";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec too_many_requests_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource_conflict_exception = {
  message: string option }
type nonrec not_authorized_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec invalid_parameter_exception = {
  message: string option }
type nonrec internal_error_exception = {
  message: string option }
type nonrec concurrent_modification_exception = {
  message: string option }
type nonrec identity_providers = (string * string) list
type nonrec cognito_identity_provider =
  {
  server_side_token_check: bool option ;
  client_id: string option ;
  provider_name: string option }
type nonrec identity_pool_tags_type = (string * string) list
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
  identity_pool_id: string }
type nonrec untag_resource_response = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec error_code =
  | INTERNAL_SERVER_ERROR 
  | ACCESS_DENIED 
type nonrec unprocessed_identity_id =
  {
  error_code: error_code option ;
  identity_id: string option }
type nonrec logins_map = (string * string) list
type nonrec unlink_identity_input =
  {
  logins_to_remove: string list ;
  logins: logins_map ;
  identity_id: string }
type nonrec external_service_exception = {
  message: string option }
type nonrec unlink_developer_identity_input =
  {
  developer_user_identifier: string ;
  developer_provider_name: string ;
  identity_pool_id: string ;
  identity_id: string }
type nonrec tag_resource_response = unit
type nonrec tag_resource_input =
  {
  tags: identity_pool_tags_type ;
  resource_arn: string }
type nonrec principal_tags = (string * string) list
type nonrec set_principal_tag_attribute_map_response =
  {
  principal_tags: principal_tags option ;
  use_defaults: bool option ;
  identity_provider_name: string option ;
  identity_pool_id: string option }
type nonrec set_principal_tag_attribute_map_input =
  {
  principal_tags: principal_tags option ;
  use_defaults: bool option ;
  identity_provider_name: string ;
  identity_pool_id: string }
type nonrec roles_map = (string * string) list
type nonrec role_mapping_type =
  | RULES 
  | TOKEN 
type nonrec ambiguous_role_resolution_type =
  | DENY 
  | AUTHENTICATED_ROLE 
type nonrec mapping_rule_match_type =
  | NOT_EQUAL 
  | STARTS_WITH 
  | CONTAINS 
  | EQUALS 
type nonrec mapping_rule =
  {
  role_ar_n: string ;
  value: string ;
  match_type: mapping_rule_match_type ;
  claim: string }
type nonrec rules_configuration_type = {
  rules: mapping_rule list }
type nonrec role_mapping =
  {
  rules_configuration: rules_configuration_type option ;
  ambiguous_role_resolution: ambiguous_role_resolution_type option ;
  type_: role_mapping_type }
type nonrec role_mapping_map = (string * role_mapping) list
type nonrec set_identity_pool_roles_input =
  {
  role_mappings: role_mapping_map option ;
  roles: roles_map ;
  identity_pool_id: string }
type nonrec merge_developer_identities_response =
  {
  identity_id: string option }
type nonrec merge_developer_identities_input =
  {
  identity_pool_id: string ;
  developer_provider_name: string ;
  destination_user_identifier: string ;
  source_user_identifier: string }
type nonrec lookup_developer_identity_response =
  {
  next_token: string option ;
  developer_user_identifier_list: string list option ;
  identity_id: string option }
type nonrec lookup_developer_identity_input =
  {
  next_token: string option ;
  max_results: int option ;
  developer_user_identifier: string option ;
  identity_id: string option ;
  identity_pool_id: string }
type nonrec list_tags_for_resource_response =
  {
  tags: identity_pool_tags_type option }
type nonrec list_tags_for_resource_input = {
  resource_arn: string }
type nonrec identity_pool_short_description =
  {
  identity_pool_name: string option ;
  identity_pool_id: string option }
type nonrec list_identity_pools_response =
  {
  next_token: string option ;
  identity_pools: identity_pool_short_description list option }
type nonrec list_identity_pools_input =
  {
  next_token: string option ;
  max_results: int }
type nonrec identity_description =
  {
  last_modified_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t option ;
  logins: string list option ;
  identity_id: string option }
type nonrec list_identities_response =
  {
  next_token: string option ;
  identities: identity_description list option ;
  identity_pool_id: string option }
type nonrec list_identities_input =
  {
  hide_disabled: bool option ;
  next_token: string option ;
  max_results: int ;
  identity_pool_id: string }
type nonrec invalid_identity_pool_configuration_exception =
  {
  message: string option }
type nonrec get_principal_tag_attribute_map_response =
  {
  principal_tags: principal_tags option ;
  use_defaults: bool option ;
  identity_provider_name: string option ;
  identity_pool_id: string option }
type nonrec get_principal_tag_attribute_map_input =
  {
  identity_provider_name: string ;
  identity_pool_id: string }
type nonrec get_open_id_token_response =
  {
  token: string option ;
  identity_id: string option }
type nonrec get_open_id_token_input =
  {
  logins: logins_map option ;
  identity_id: string }
type nonrec get_open_id_token_for_developer_identity_response =
  {
  token: string option ;
  identity_id: string option }
type nonrec get_open_id_token_for_developer_identity_input =
  {
  token_duration: int option ;
  principal_tags: principal_tags option ;
  logins: logins_map ;
  identity_id: string option ;
  identity_pool_id: string }
type nonrec developer_user_already_registered_exception =
  {
  message: string option }
type nonrec get_identity_pool_roles_response =
  {
  role_mappings: role_mapping_map option ;
  roles: roles_map option ;
  identity_pool_id: string option }
type nonrec get_identity_pool_roles_input = {
  identity_pool_id: string }
type nonrec get_id_response = {
  identity_id: string option }
type nonrec get_id_input =
  {
  logins: logins_map option ;
  identity_pool_id: string ;
  account_id: string option }
type nonrec credentials =
  {
  expiration: CoreTypes.Timestamp.t option ;
  session_token: string option ;
  secret_key: string option ;
  access_key_id: string option }
type nonrec get_credentials_for_identity_response =
  {
  credentials: credentials option ;
  identity_id: string option }
type nonrec get_credentials_for_identity_input =
  {
  custom_role_arn: string option ;
  logins: logins_map option ;
  identity_id: string }
type nonrec describe_identity_pool_input = {
  identity_pool_id: string }
type nonrec describe_identity_input = {
  identity_id: string }
type nonrec delete_identity_pool_input = {
  identity_pool_id: string }
type nonrec delete_identities_response =
  {
  unprocessed_identity_ids: unprocessed_identity_id list option }
type nonrec delete_identities_input = {
  identity_ids_to_delete: string list }
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
  identity_pool_name: string }