open Smaws_Lib.Json.SerializeHelpers
open Types

let arn_string_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let resource_conflict_exception_to_yojson (x : resource_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let not_authorized_exception_to_yojson (x : not_authorized_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let tag_value_type_to_yojson = string_to_yojson
let tag_keys_type_to_yojson = string_to_yojson

let identity_pool_tags_type_to_yojson tree =
  map_to_yojson tag_keys_type_to_yojson tag_value_type_to_yojson tree

let saml_provider_list_to_yojson tree = list_to_yojson arn_string_to_yojson tree
let cognito_identity_provider_token_check_to_yojson = bool_to_yojson
let cognito_identity_provider_client_id_to_yojson = string_to_yojson
let cognito_identity_provider_name_to_yojson = string_to_yojson

let cognito_identity_provider_to_yojson (x : cognito_identity_provider) =
  assoc_to_yojson
    [
      ("ProviderName", option_to_yojson cognito_identity_provider_name_to_yojson x.provider_name);
      ("ClientId", option_to_yojson cognito_identity_provider_client_id_to_yojson x.client_id);
      ( "ServerSideTokenCheck",
        option_to_yojson cognito_identity_provider_token_check_to_yojson x.server_side_token_check
      );
    ]

let cognito_identity_provider_list_to_yojson tree =
  list_to_yojson cognito_identity_provider_to_yojson tree

let oidc_provider_list_to_yojson tree = list_to_yojson arn_string_to_yojson tree
let developer_provider_name_to_yojson = string_to_yojson
let identity_provider_id_to_yojson = string_to_yojson
let identity_provider_name_to_yojson = string_to_yojson

let identity_providers_to_yojson tree =
  map_to_yojson identity_provider_name_to_yojson identity_provider_id_to_yojson tree

let classic_flow_to_yojson = bool_to_yojson
let identity_pool_unauthenticated_to_yojson = bool_to_yojson
let identity_pool_name_to_yojson = string_to_yojson
let identity_pool_id_to_yojson = string_to_yojson

let identity_pool_to_yojson (x : identity_pool) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("IdentityPoolName", Some (identity_pool_name_to_yojson x.identity_pool_name));
      ( "AllowUnauthenticatedIdentities",
        Some (identity_pool_unauthenticated_to_yojson x.allow_unauthenticated_identities) );
      ("AllowClassicFlow", option_to_yojson classic_flow_to_yojson x.allow_classic_flow);
      ( "SupportedLoginProviders",
        option_to_yojson identity_providers_to_yojson x.supported_login_providers );
      ( "DeveloperProviderName",
        option_to_yojson developer_provider_name_to_yojson x.developer_provider_name );
      ( "OpenIdConnectProviderARNs",
        option_to_yojson oidc_provider_list_to_yojson x.open_id_connect_provider_ar_ns );
      ( "CognitoIdentityProviders",
        option_to_yojson cognito_identity_provider_list_to_yojson x.cognito_identity_providers );
      ("SamlProviderARNs", option_to_yojson saml_provider_list_to_yojson x.saml_provider_ar_ns);
      ("IdentityPoolTags", option_to_yojson identity_pool_tags_type_to_yojson x.identity_pool_tags);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let identity_pool_tags_list_type_to_yojson tree = list_to_yojson tag_keys_type_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_string_to_yojson x.resource_arn));
      ("TagKeys", Some (identity_pool_tags_list_type_to_yojson x.tag_keys));
    ]

let external_service_exception_to_yojson (x : external_service_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let logins_list_to_yojson tree = list_to_yojson identity_provider_name_to_yojson tree
let identity_provider_token_to_yojson = string_to_yojson

let logins_map_to_yojson tree =
  map_to_yojson identity_provider_name_to_yojson identity_provider_token_to_yojson tree

let identity_id_to_yojson = string_to_yojson

let unlink_identity_input_to_yojson (x : unlink_identity_input) =
  assoc_to_yojson
    [
      ("IdentityId", Some (identity_id_to_yojson x.identity_id));
      ("Logins", Some (logins_map_to_yojson x.logins));
      ("LoginsToRemove", Some (logins_list_to_yojson x.logins_to_remove));
    ]

let developer_user_identifier_to_yojson = string_to_yojson

let unlink_developer_identity_input_to_yojson (x : unlink_developer_identity_input) =
  assoc_to_yojson
    [
      ("IdentityId", Some (identity_id_to_yojson x.identity_id));
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("DeveloperProviderName", Some (developer_provider_name_to_yojson x.developer_provider_name));
      ( "DeveloperUserIdentifier",
        Some (developer_user_identifier_to_yojson x.developer_user_identifier) );
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_string_to_yojson x.resource_arn));
      ("Tags", Some (identity_pool_tags_type_to_yojson x.tags));
    ]

let principal_tag_value_to_yojson = string_to_yojson
let principal_tag_i_d_to_yojson = string_to_yojson

let principal_tags_to_yojson tree =
  map_to_yojson principal_tag_i_d_to_yojson principal_tag_value_to_yojson tree

let use_defaults_to_yojson = bool_to_yojson

let set_principal_tag_attribute_map_response_to_yojson
    (x : set_principal_tag_attribute_map_response) =
  assoc_to_yojson
    [
      ("IdentityPoolId", option_to_yojson identity_pool_id_to_yojson x.identity_pool_id);
      ( "IdentityProviderName",
        option_to_yojson identity_provider_name_to_yojson x.identity_provider_name );
      ("UseDefaults", option_to_yojson use_defaults_to_yojson x.use_defaults);
      ("PrincipalTags", option_to_yojson principal_tags_to_yojson x.principal_tags);
    ]

let set_principal_tag_attribute_map_input_to_yojson (x : set_principal_tag_attribute_map_input) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("IdentityProviderName", Some (identity_provider_name_to_yojson x.identity_provider_name));
      ("UseDefaults", option_to_yojson use_defaults_to_yojson x.use_defaults);
      ("PrincipalTags", option_to_yojson principal_tags_to_yojson x.principal_tags);
    ]

let claim_value_to_yojson = string_to_yojson

let mapping_rule_match_type_to_yojson (x : mapping_rule_match_type) =
  match x with
  | EQUALS -> `String "Equals"
  | CONTAINS -> `String "Contains"
  | STARTS_WITH -> `String "StartsWith"
  | NOT_EQUAL -> `String "NotEqual"

let claim_name_to_yojson = string_to_yojson

let mapping_rule_to_yojson (x : mapping_rule) =
  assoc_to_yojson
    [
      ("Claim", Some (claim_name_to_yojson x.claim));
      ("MatchType", Some (mapping_rule_match_type_to_yojson x.match_type));
      ("Value", Some (claim_value_to_yojson x.value));
      ("RoleARN", Some (arn_string_to_yojson x.role_ar_n));
    ]

let mapping_rules_list_to_yojson tree = list_to_yojson mapping_rule_to_yojson tree

let rules_configuration_type_to_yojson (x : rules_configuration_type) =
  assoc_to_yojson [ ("Rules", Some (mapping_rules_list_to_yojson x.rules)) ]

let ambiguous_role_resolution_type_to_yojson (x : ambiguous_role_resolution_type) =
  match x with AUTHENTICATED_ROLE -> `String "AuthenticatedRole" | DENY -> `String "Deny"

let role_mapping_type_to_yojson (x : role_mapping_type) =
  match x with TOKEN -> `String "Token" | RULES -> `String "Rules"

let role_mapping_to_yojson (x : role_mapping) =
  assoc_to_yojson
    [
      ("Type", Some (role_mapping_type_to_yojson x.type_));
      ( "AmbiguousRoleResolution",
        option_to_yojson ambiguous_role_resolution_type_to_yojson x.ambiguous_role_resolution );
      ( "RulesConfiguration",
        option_to_yojson rules_configuration_type_to_yojson x.rules_configuration );
    ]

let role_mapping_map_to_yojson tree =
  map_to_yojson identity_provider_name_to_yojson role_mapping_to_yojson tree

let role_type_to_yojson = string_to_yojson
let roles_map_to_yojson tree = map_to_yojson role_type_to_yojson arn_string_to_yojson tree

let set_identity_pool_roles_input_to_yojson (x : set_identity_pool_roles_input) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("Roles", Some (roles_map_to_yojson x.roles));
      ("RoleMappings", option_to_yojson role_mapping_map_to_yojson x.role_mappings);
    ]

let merge_developer_identities_response_to_yojson (x : merge_developer_identities_response) =
  assoc_to_yojson [ ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id) ]

let merge_developer_identities_input_to_yojson (x : merge_developer_identities_input) =
  assoc_to_yojson
    [
      ("SourceUserIdentifier", Some (developer_user_identifier_to_yojson x.source_user_identifier));
      ( "DestinationUserIdentifier",
        Some (developer_user_identifier_to_yojson x.destination_user_identifier) );
      ("DeveloperProviderName", Some (developer_provider_name_to_yojson x.developer_provider_name));
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
    ]

let pagination_key_to_yojson = string_to_yojson

let developer_user_identifier_list_to_yojson tree =
  list_to_yojson developer_user_identifier_to_yojson tree

let lookup_developer_identity_response_to_yojson (x : lookup_developer_identity_response) =
  assoc_to_yojson
    [
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ( "DeveloperUserIdentifierList",
        option_to_yojson developer_user_identifier_list_to_yojson x.developer_user_identifier_list
      );
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let query_limit_to_yojson = int_to_yojson

let lookup_developer_identity_input_to_yojson (x : lookup_developer_identity_input) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ( "DeveloperUserIdentifier",
        option_to_yojson developer_user_identifier_to_yojson x.developer_user_identifier );
      ("MaxResults", option_to_yojson query_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson identity_pool_tags_type_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_string_to_yojson x.resource_arn)) ]

let identity_pool_short_description_to_yojson (x : identity_pool_short_description) =
  assoc_to_yojson
    [
      ("IdentityPoolId", option_to_yojson identity_pool_id_to_yojson x.identity_pool_id);
      ("IdentityPoolName", option_to_yojson identity_pool_name_to_yojson x.identity_pool_name);
    ]

let identity_pools_list_to_yojson tree =
  list_to_yojson identity_pool_short_description_to_yojson tree

let list_identity_pools_response_to_yojson (x : list_identity_pools_response) =
  assoc_to_yojson
    [
      ("IdentityPools", option_to_yojson identity_pools_list_to_yojson x.identity_pools);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let list_identity_pools_input_to_yojson (x : list_identity_pools_input) =
  assoc_to_yojson
    [
      ("MaxResults", Some (query_limit_to_yojson x.max_results));
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let identity_description_to_yojson (x : identity_description) =
  assoc_to_yojson
    [
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ("Logins", option_to_yojson logins_list_to_yojson x.logins);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
    ]

let identities_list_to_yojson tree = list_to_yojson identity_description_to_yojson tree

let list_identities_response_to_yojson (x : list_identities_response) =
  assoc_to_yojson
    [
      ("IdentityPoolId", option_to_yojson identity_pool_id_to_yojson x.identity_pool_id);
      ("Identities", option_to_yojson identities_list_to_yojson x.identities);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let hide_disabled_to_yojson = bool_to_yojson

let list_identities_input_to_yojson (x : list_identities_input) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("MaxResults", Some (query_limit_to_yojson x.max_results));
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("HideDisabled", option_to_yojson hide_disabled_to_yojson x.hide_disabled);
    ]

let get_principal_tag_attribute_map_response_to_yojson
    (x : get_principal_tag_attribute_map_response) =
  assoc_to_yojson
    [
      ("IdentityPoolId", option_to_yojson identity_pool_id_to_yojson x.identity_pool_id);
      ( "IdentityProviderName",
        option_to_yojson identity_provider_name_to_yojson x.identity_provider_name );
      ("UseDefaults", option_to_yojson use_defaults_to_yojson x.use_defaults);
      ("PrincipalTags", option_to_yojson principal_tags_to_yojson x.principal_tags);
    ]

let get_principal_tag_attribute_map_input_to_yojson (x : get_principal_tag_attribute_map_input) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("IdentityProviderName", Some (identity_provider_name_to_yojson x.identity_provider_name));
    ]

let developer_user_already_registered_exception_to_yojson
    (x : developer_user_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let oidc_token_to_yojson = string_to_yojson

let get_open_id_token_for_developer_identity_response_to_yojson
    (x : get_open_id_token_for_developer_identity_response) =
  assoc_to_yojson
    [
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ("Token", option_to_yojson oidc_token_to_yojson x.token);
    ]

let token_duration_to_yojson = long_to_yojson

let get_open_id_token_for_developer_identity_input_to_yojson
    (x : get_open_id_token_for_developer_identity_input) =
  assoc_to_yojson
    [
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ("Logins", Some (logins_map_to_yojson x.logins));
      ("PrincipalTags", option_to_yojson principal_tags_to_yojson x.principal_tags);
      ("TokenDuration", option_to_yojson token_duration_to_yojson x.token_duration);
    ]

let get_open_id_token_response_to_yojson (x : get_open_id_token_response) =
  assoc_to_yojson
    [
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ("Token", option_to_yojson oidc_token_to_yojson x.token);
    ]

let get_open_id_token_input_to_yojson (x : get_open_id_token_input) =
  assoc_to_yojson
    [
      ("IdentityId", Some (identity_id_to_yojson x.identity_id));
      ("Logins", option_to_yojson logins_map_to_yojson x.logins);
    ]

let get_identity_pool_roles_response_to_yojson (x : get_identity_pool_roles_response) =
  assoc_to_yojson
    [
      ("IdentityPoolId", option_to_yojson identity_pool_id_to_yojson x.identity_pool_id);
      ("Roles", option_to_yojson roles_map_to_yojson x.roles);
      ("RoleMappings", option_to_yojson role_mapping_map_to_yojson x.role_mappings);
    ]

let get_identity_pool_roles_input_to_yojson (x : get_identity_pool_roles_input) =
  assoc_to_yojson [ ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id)) ]

let get_id_response_to_yojson (x : get_id_response) =
  assoc_to_yojson [ ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id) ]

let account_id_to_yojson = string_to_yojson

let get_id_input_to_yojson (x : get_id_input) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id));
      ("Logins", option_to_yojson logins_map_to_yojson x.logins);
    ]

let invalid_identity_pool_configuration_exception_to_yojson
    (x : invalid_identity_pool_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let session_token_string_to_yojson = string_to_yojson
let secret_key_string_to_yojson = string_to_yojson
let access_key_string_to_yojson = string_to_yojson

let credentials_to_yojson (x : credentials) =
  assoc_to_yojson
    [
      ("AccessKeyId", option_to_yojson access_key_string_to_yojson x.access_key_id);
      ("SecretKey", option_to_yojson secret_key_string_to_yojson x.secret_key);
      ("SessionToken", option_to_yojson session_token_string_to_yojson x.session_token);
      ("Expiration", option_to_yojson date_type_to_yojson x.expiration);
    ]

let get_credentials_for_identity_response_to_yojson (x : get_credentials_for_identity_response) =
  assoc_to_yojson
    [
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ("Credentials", option_to_yojson credentials_to_yojson x.credentials);
    ]

let get_credentials_for_identity_input_to_yojson (x : get_credentials_for_identity_input) =
  assoc_to_yojson
    [
      ("IdentityId", Some (identity_id_to_yojson x.identity_id));
      ("Logins", option_to_yojson logins_map_to_yojson x.logins);
      ("CustomRoleArn", option_to_yojson arn_string_to_yojson x.custom_role_arn);
    ]

let describe_identity_pool_input_to_yojson (x : describe_identity_pool_input) =
  assoc_to_yojson [ ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id)) ]

let describe_identity_input_to_yojson (x : describe_identity_input) =
  assoc_to_yojson [ ("IdentityId", Some (identity_id_to_yojson x.identity_id)) ]

let delete_identity_pool_input_to_yojson (x : delete_identity_pool_input) =
  assoc_to_yojson [ ("IdentityPoolId", Some (identity_pool_id_to_yojson x.identity_pool_id)) ]

let error_code_to_yojson (x : error_code) =
  match x with
  | ACCESS_DENIED -> `String "AccessDenied"
  | INTERNAL_SERVER_ERROR -> `String "InternalServerError"

let unprocessed_identity_id_to_yojson (x : unprocessed_identity_id) =
  assoc_to_yojson
    [
      ("IdentityId", option_to_yojson identity_id_to_yojson x.identity_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let unprocessed_identity_id_list_to_yojson tree =
  list_to_yojson unprocessed_identity_id_to_yojson tree

let delete_identities_response_to_yojson (x : delete_identities_response) =
  assoc_to_yojson
    [
      ( "UnprocessedIdentityIds",
        option_to_yojson unprocessed_identity_id_list_to_yojson x.unprocessed_identity_ids );
    ]

let identity_id_list_to_yojson tree = list_to_yojson identity_id_to_yojson tree

let delete_identities_input_to_yojson (x : delete_identities_input) =
  assoc_to_yojson
    [ ("IdentityIdsToDelete", Some (identity_id_list_to_yojson x.identity_ids_to_delete)) ]

let create_identity_pool_input_to_yojson (x : create_identity_pool_input) =
  assoc_to_yojson
    [
      ("IdentityPoolName", Some (identity_pool_name_to_yojson x.identity_pool_name));
      ( "AllowUnauthenticatedIdentities",
        Some (identity_pool_unauthenticated_to_yojson x.allow_unauthenticated_identities) );
      ("AllowClassicFlow", option_to_yojson classic_flow_to_yojson x.allow_classic_flow);
      ( "SupportedLoginProviders",
        option_to_yojson identity_providers_to_yojson x.supported_login_providers );
      ( "DeveloperProviderName",
        option_to_yojson developer_provider_name_to_yojson x.developer_provider_name );
      ( "OpenIdConnectProviderARNs",
        option_to_yojson oidc_provider_list_to_yojson x.open_id_connect_provider_ar_ns );
      ( "CognitoIdentityProviders",
        option_to_yojson cognito_identity_provider_list_to_yojson x.cognito_identity_providers );
      ("SamlProviderARNs", option_to_yojson saml_provider_list_to_yojson x.saml_provider_ar_ns);
      ("IdentityPoolTags", option_to_yojson identity_pool_tags_type_to_yojson x.identity_pool_tags);
    ]
