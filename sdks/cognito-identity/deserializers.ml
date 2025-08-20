open Smaws_Lib.Json.DeserializeHelpers
open Types
let use_defaults_of_yojson = bool_of_yojson
let string__of_yojson = string_of_yojson
let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : too_many_requests_exception)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : resource_not_found_exception)
let resource_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : resource_conflict_exception)
let not_authorized_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : not_authorized_exception)
let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : limit_exceeded_exception)
let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : invalid_parameter_exception)
let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : internal_error_exception)
let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : concurrent_modification_exception)
let identity_pool_id_of_yojson = string_of_yojson
let identity_pool_name_of_yojson = string_of_yojson
let identity_pool_unauthenticated_of_yojson = bool_of_yojson
let classic_flow_of_yojson = bool_of_yojson
let identity_provider_id_of_yojson = string_of_yojson
let identity_provider_name_of_yojson = string_of_yojson
let identity_providers_of_yojson tree path =
  map_of_yojson identity_provider_name_of_yojson
    identity_provider_id_of_yojson tree path
let developer_provider_name_of_yojson = string_of_yojson
let arn_string_of_yojson = string_of_yojson
let oidc_provider_list_of_yojson tree path =
  list_of_yojson arn_string_of_yojson tree path
let cognito_identity_provider_name_of_yojson = string_of_yojson
let cognito_identity_provider_client_id_of_yojson = string_of_yojson
let cognito_identity_provider_token_check_of_yojson = bool_of_yojson
let cognito_identity_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_side_token_check =
       (option_of_yojson
          (value_for_key cognito_identity_provider_token_check_of_yojson
             "ServerSideTokenCheck") _list path);
     client_id =
       (option_of_yojson
          (value_for_key cognito_identity_provider_client_id_of_yojson
             "ClientId") _list path);
     provider_name =
       (option_of_yojson
          (value_for_key cognito_identity_provider_name_of_yojson
             "ProviderName") _list path)
   } : cognito_identity_provider)
let cognito_identity_provider_list_of_yojson tree path =
  list_of_yojson cognito_identity_provider_of_yojson tree path
let saml_provider_list_of_yojson tree path =
  list_of_yojson arn_string_of_yojson tree path
let tag_value_type_of_yojson = string_of_yojson
let tag_keys_type_of_yojson = string_of_yojson
let identity_pool_tags_type_of_yojson tree path =
  map_of_yojson tag_keys_type_of_yojson tag_value_type_of_yojson tree path
let identity_pool_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_tags =
       (option_of_yojson
          (value_for_key identity_pool_tags_type_of_yojson "IdentityPoolTags")
          _list path);
     saml_provider_ar_ns =
       (option_of_yojson
          (value_for_key saml_provider_list_of_yojson "SamlProviderARNs")
          _list path);
     cognito_identity_providers =
       (option_of_yojson
          (value_for_key cognito_identity_provider_list_of_yojson
             "CognitoIdentityProviders") _list path);
     open_id_connect_provider_ar_ns =
       (option_of_yojson
          (value_for_key oidc_provider_list_of_yojson
             "OpenIdConnectProviderARNs") _list path);
     developer_provider_name =
       (option_of_yojson
          (value_for_key developer_provider_name_of_yojson
             "DeveloperProviderName") _list path);
     supported_login_providers =
       (option_of_yojson
          (value_for_key identity_providers_of_yojson
             "SupportedLoginProviders") _list path);
     allow_classic_flow =
       (option_of_yojson
          (value_for_key classic_flow_of_yojson "AllowClassicFlow") _list
          path);
     allow_unauthenticated_identities =
       (value_for_key identity_pool_unauthenticated_of_yojson
          "AllowUnauthenticatedIdentities" _list path);
     identity_pool_name =
       (value_for_key identity_pool_name_of_yojson "IdentityPoolName" _list
          path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : identity_pool)
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let identity_pool_tags_list_type_of_yojson tree path =
  list_of_yojson tag_keys_type_of_yojson tree path
let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys =
       (value_for_key identity_pool_tags_list_type_of_yojson "TagKeys" _list
          path);
     resource_arn =
       (value_for_key arn_string_of_yojson "ResourceArn" _list path)
   } : untag_resource_input)
let identity_id_of_yojson = string_of_yojson
let base_unit_of_yojson = unit_of_yojson
let error_code_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "InternalServerError" -> INTERNAL_SERVER_ERROR
    | `String "AccessDenied" -> ACCESS_DENIED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCode") : error_code) : 
  error_code)
let unprocessed_identity_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       (option_of_yojson (value_for_key error_code_of_yojson "ErrorCode")
          _list path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : unprocessed_identity_id)
let unprocessed_identity_id_list_of_yojson tree path =
  list_of_yojson unprocessed_identity_id_of_yojson tree path
let identity_provider_token_of_yojson = string_of_yojson
let logins_map_of_yojson tree path =
  map_of_yojson identity_provider_name_of_yojson
    identity_provider_token_of_yojson tree path
let logins_list_of_yojson tree path =
  list_of_yojson identity_provider_name_of_yojson tree path
let unlink_identity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logins_to_remove =
       (value_for_key logins_list_of_yojson "LoginsToRemove" _list path);
     logins = (value_for_key logins_map_of_yojson "Logins" _list path);
     identity_id =
       (value_for_key identity_id_of_yojson "IdentityId" _list path)
   } : unlink_identity_input)
let external_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : external_service_exception)
let developer_user_identifier_of_yojson = string_of_yojson
let unlink_developer_identity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     developer_user_identifier =
       (value_for_key developer_user_identifier_of_yojson
          "DeveloperUserIdentifier" _list path);
     developer_provider_name =
       (value_for_key developer_provider_name_of_yojson
          "DeveloperProviderName" _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path);
     identity_id =
       (value_for_key identity_id_of_yojson "IdentityId" _list path)
   } : unlink_developer_identity_input)
let token_duration_of_yojson = long_of_yojson
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (value_for_key identity_pool_tags_type_of_yojson "Tags" _list path);
     resource_arn =
       (value_for_key arn_string_of_yojson "ResourceArn" _list path)
   } : tag_resource_input)
let principal_tag_value_of_yojson = string_of_yojson
let principal_tag_i_d_of_yojson = string_of_yojson
let principal_tags_of_yojson tree path =
  map_of_yojson principal_tag_i_d_of_yojson principal_tag_value_of_yojson
    tree path
let set_principal_tag_attribute_map_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_tags =
       (option_of_yojson
          (value_for_key principal_tags_of_yojson "PrincipalTags") _list path);
     use_defaults =
       (option_of_yojson (value_for_key use_defaults_of_yojson "UseDefaults")
          _list path);
     identity_provider_name =
       (option_of_yojson
          (value_for_key identity_provider_name_of_yojson
             "IdentityProviderName") _list path);
     identity_pool_id =
       (option_of_yojson
          (value_for_key identity_pool_id_of_yojson "IdentityPoolId") _list
          path)
   } : set_principal_tag_attribute_map_response)
let set_principal_tag_attribute_map_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_tags =
       (option_of_yojson
          (value_for_key principal_tags_of_yojson "PrincipalTags") _list path);
     use_defaults =
       (option_of_yojson (value_for_key use_defaults_of_yojson "UseDefaults")
          _list path);
     identity_provider_name =
       (value_for_key identity_provider_name_of_yojson "IdentityProviderName"
          _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : set_principal_tag_attribute_map_input)
let role_type_of_yojson = string_of_yojson
let roles_map_of_yojson tree path =
  map_of_yojson role_type_of_yojson arn_string_of_yojson tree path
let role_mapping_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "Rules" -> RULES
    | `String "Token" -> TOKEN
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RoleMappingType" value)
    | _ -> raise (deserialize_wrong_type_error path "RoleMappingType") : 
     role_mapping_type) : role_mapping_type)
let ambiguous_role_resolution_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "Deny" -> DENY
    | `String "AuthenticatedRole" -> AUTHENTICATED_ROLE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "AmbiguousRoleResolutionType" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "AmbiguousRoleResolutionType") : 
     ambiguous_role_resolution_type) : ambiguous_role_resolution_type)
let claim_name_of_yojson = string_of_yojson
let mapping_rule_match_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NotEqual" -> NOT_EQUAL
    | `String "StartsWith" -> STARTS_WITH
    | `String "Contains" -> CONTAINS
    | `String "Equals" -> EQUALS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "MappingRuleMatchType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "MappingRuleMatchType") : 
     mapping_rule_match_type) : mapping_rule_match_type)
let claim_value_of_yojson = string_of_yojson
let mapping_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key arn_string_of_yojson "RoleARN" _list path);
     value = (value_for_key claim_value_of_yojson "Value" _list path);
     match_type =
       (value_for_key mapping_rule_match_type_of_yojson "MatchType" _list
          path);
     claim = (value_for_key claim_name_of_yojson "Claim" _list path)
   } : mapping_rule)
let mapping_rules_list_of_yojson tree path =
  list_of_yojson mapping_rule_of_yojson tree path
let rules_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rules = (value_for_key mapping_rules_list_of_yojson "Rules" _list path)
   } : rules_configuration_type)
let role_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules_configuration =
       (option_of_yojson
          (value_for_key rules_configuration_type_of_yojson
             "RulesConfiguration") _list path);
     ambiguous_role_resolution =
       (option_of_yojson
          (value_for_key ambiguous_role_resolution_type_of_yojson
             "AmbiguousRoleResolution") _list path);
     type_ = (value_for_key role_mapping_type_of_yojson "Type" _list path)
   } : role_mapping)
let role_mapping_map_of_yojson tree path =
  map_of_yojson identity_provider_name_of_yojson role_mapping_of_yojson tree
    path
let set_identity_pool_roles_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_mappings =
       (option_of_yojson
          (value_for_key role_mapping_map_of_yojson "RoleMappings") _list
          path);
     roles = (value_for_key roles_map_of_yojson "Roles" _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : set_identity_pool_roles_input)
let session_token_string_of_yojson = string_of_yojson
let secret_key_string_of_yojson = string_of_yojson
let query_limit_of_yojson = int_of_yojson
let pagination_key_of_yojson = string_of_yojson
let oidc_token_of_yojson = string_of_yojson
let merge_developer_identities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : merge_developer_identities_response)
let merge_developer_identities_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path);
     developer_provider_name =
       (value_for_key developer_provider_name_of_yojson
          "DeveloperProviderName" _list path);
     destination_user_identifier =
       (value_for_key developer_user_identifier_of_yojson
          "DestinationUserIdentifier" _list path);
     source_user_identifier =
       (value_for_key developer_user_identifier_of_yojson
          "SourceUserIdentifier" _list path)
   } : merge_developer_identities_input)
let developer_user_identifier_list_of_yojson tree path =
  list_of_yojson developer_user_identifier_of_yojson tree path
let lookup_developer_identity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key pagination_key_of_yojson "NextToken")
          _list path);
     developer_user_identifier_list =
       (option_of_yojson
          (value_for_key developer_user_identifier_list_of_yojson
             "DeveloperUserIdentifierList") _list path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : lookup_developer_identity_response)
let lookup_developer_identity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key pagination_key_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key query_limit_of_yojson "MaxResults")
          _list path);
     developer_user_identifier =
       (option_of_yojson
          (value_for_key developer_user_identifier_of_yojson
             "DeveloperUserIdentifier") _list path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : lookup_developer_identity_input)
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson
          (value_for_key identity_pool_tags_type_of_yojson "Tags") _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       (value_for_key arn_string_of_yojson "ResourceArn" _list path)
   } : list_tags_for_resource_input)
let identity_pool_short_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_name =
       (option_of_yojson
          (value_for_key identity_pool_name_of_yojson "IdentityPoolName")
          _list path);
     identity_pool_id =
       (option_of_yojson
          (value_for_key identity_pool_id_of_yojson "IdentityPoolId") _list
          path)
   } : identity_pool_short_description)
let identity_pools_list_of_yojson tree path =
  list_of_yojson identity_pool_short_description_of_yojson tree path
let list_identity_pools_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key pagination_key_of_yojson "NextToken")
          _list path);
     identity_pools =
       (option_of_yojson
          (value_for_key identity_pools_list_of_yojson "IdentityPools") _list
          path)
   } : list_identity_pools_response)
let list_identity_pools_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key pagination_key_of_yojson "NextToken")
          _list path);
     max_results =
       (value_for_key query_limit_of_yojson "MaxResults" _list path)
   } : list_identity_pools_input)
let date_type_of_yojson = timestamp_epoch_seconds_of_yojson
let identity_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       (option_of_yojson
          (value_for_key date_type_of_yojson "LastModifiedDate") _list path);
     creation_date =
       (option_of_yojson (value_for_key date_type_of_yojson "CreationDate")
          _list path);
     logins =
       (option_of_yojson (value_for_key logins_list_of_yojson "Logins") _list
          path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : identity_description)
let identities_list_of_yojson tree path =
  list_of_yojson identity_description_of_yojson tree path
let list_identities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key pagination_key_of_yojson "NextToken")
          _list path);
     identities =
       (option_of_yojson
          (value_for_key identities_list_of_yojson "Identities") _list path);
     identity_pool_id =
       (option_of_yojson
          (value_for_key identity_pool_id_of_yojson "IdentityPoolId") _list
          path)
   } : list_identities_response)
let hide_disabled_of_yojson = bool_of_yojson
let list_identities_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hide_disabled =
       (option_of_yojson
          (value_for_key hide_disabled_of_yojson "HideDisabled") _list path);
     next_token =
       (option_of_yojson (value_for_key pagination_key_of_yojson "NextToken")
          _list path);
     max_results =
       (value_for_key query_limit_of_yojson "MaxResults" _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : list_identities_input)
let invalid_identity_pool_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : invalid_identity_pool_configuration_exception)
let identity_id_list_of_yojson tree path =
  list_of_yojson identity_id_of_yojson tree path
let get_principal_tag_attribute_map_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_tags =
       (option_of_yojson
          (value_for_key principal_tags_of_yojson "PrincipalTags") _list path);
     use_defaults =
       (option_of_yojson (value_for_key use_defaults_of_yojson "UseDefaults")
          _list path);
     identity_provider_name =
       (option_of_yojson
          (value_for_key identity_provider_name_of_yojson
             "IdentityProviderName") _list path);
     identity_pool_id =
       (option_of_yojson
          (value_for_key identity_pool_id_of_yojson "IdentityPoolId") _list
          path)
   } : get_principal_tag_attribute_map_response)
let get_principal_tag_attribute_map_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_name =
       (value_for_key identity_provider_name_of_yojson "IdentityProviderName"
          _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : get_principal_tag_attribute_map_input)
let get_open_id_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token =
       (option_of_yojson (value_for_key oidc_token_of_yojson "Token") _list
          path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : get_open_id_token_response)
let get_open_id_token_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logins =
       (option_of_yojson (value_for_key logins_map_of_yojson "Logins") _list
          path);
     identity_id =
       (value_for_key identity_id_of_yojson "IdentityId" _list path)
   } : get_open_id_token_input)
let get_open_id_token_for_developer_identity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token =
       (option_of_yojson (value_for_key oidc_token_of_yojson "Token") _list
          path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : get_open_id_token_for_developer_identity_response)
let get_open_id_token_for_developer_identity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_duration =
       (option_of_yojson
          (value_for_key token_duration_of_yojson "TokenDuration") _list path);
     principal_tags =
       (option_of_yojson
          (value_for_key principal_tags_of_yojson "PrincipalTags") _list path);
     logins = (value_for_key logins_map_of_yojson "Logins" _list path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : get_open_id_token_for_developer_identity_input)
let developer_user_already_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "message") _list
          path)
   } : developer_user_already_registered_exception)
let get_identity_pool_roles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_mappings =
       (option_of_yojson
          (value_for_key role_mapping_map_of_yojson "RoleMappings") _list
          path);
     roles =
       (option_of_yojson (value_for_key roles_map_of_yojson "Roles") _list
          path);
     identity_pool_id =
       (option_of_yojson
          (value_for_key identity_pool_id_of_yojson "IdentityPoolId") _list
          path)
   } : get_identity_pool_roles_response)
let get_identity_pool_roles_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : get_identity_pool_roles_input)
let get_id_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : get_id_response)
let account_id_of_yojson = string_of_yojson
let get_id_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logins =
       (option_of_yojson (value_for_key logins_map_of_yojson "Logins") _list
          path);
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path);
     account_id =
       (option_of_yojson (value_for_key account_id_of_yojson "AccountId")
          _list path)
   } : get_id_input)
let access_key_string_of_yojson = string_of_yojson
let credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration =
       (option_of_yojson (value_for_key date_type_of_yojson "Expiration")
          _list path);
     session_token =
       (option_of_yojson
          (value_for_key session_token_string_of_yojson "SessionToken") _list
          path);
     secret_key =
       (option_of_yojson
          (value_for_key secret_key_string_of_yojson "SecretKey") _list path);
     access_key_id =
       (option_of_yojson
          (value_for_key access_key_string_of_yojson "AccessKeyId") _list
          path)
   } : credentials)
let get_credentials_for_identity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credentials =
       (option_of_yojson (value_for_key credentials_of_yojson "Credentials")
          _list path);
     identity_id =
       (option_of_yojson (value_for_key identity_id_of_yojson "IdentityId")
          _list path)
   } : get_credentials_for_identity_response)
let get_credentials_for_identity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_role_arn =
       (option_of_yojson (value_for_key arn_string_of_yojson "CustomRoleArn")
          _list path);
     logins =
       (option_of_yojson (value_for_key logins_map_of_yojson "Logins") _list
          path);
     identity_id =
       (value_for_key identity_id_of_yojson "IdentityId" _list path)
   } : get_credentials_for_identity_input)
let describe_identity_pool_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : describe_identity_pool_input)
let describe_identity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_id =
       (value_for_key identity_id_of_yojson "IdentityId" _list path)
   } : describe_identity_input)
let delete_identity_pool_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_id =
       (value_for_key identity_pool_id_of_yojson "IdentityPoolId" _list path)
   } : delete_identity_pool_input)
let delete_identities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_identity_ids =
       (option_of_yojson
          (value_for_key unprocessed_identity_id_list_of_yojson
             "UnprocessedIdentityIds") _list path)
   } : delete_identities_response)
let delete_identities_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_ids_to_delete =
       (value_for_key identity_id_list_of_yojson "IdentityIdsToDelete" _list
          path)
   } : delete_identities_input)
let create_identity_pool_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_pool_tags =
       (option_of_yojson
          (value_for_key identity_pool_tags_type_of_yojson "IdentityPoolTags")
          _list path);
     saml_provider_ar_ns =
       (option_of_yojson
          (value_for_key saml_provider_list_of_yojson "SamlProviderARNs")
          _list path);
     cognito_identity_providers =
       (option_of_yojson
          (value_for_key cognito_identity_provider_list_of_yojson
             "CognitoIdentityProviders") _list path);
     open_id_connect_provider_ar_ns =
       (option_of_yojson
          (value_for_key oidc_provider_list_of_yojson
             "OpenIdConnectProviderARNs") _list path);
     developer_provider_name =
       (option_of_yojson
          (value_for_key developer_provider_name_of_yojson
             "DeveloperProviderName") _list path);
     supported_login_providers =
       (option_of_yojson
          (value_for_key identity_providers_of_yojson
             "SupportedLoginProviders") _list path);
     allow_classic_flow =
       (option_of_yojson
          (value_for_key classic_flow_of_yojson "AllowClassicFlow") _list
          path);
     allow_unauthenticated_identities =
       (value_for_key identity_pool_unauthenticated_of_yojson
          "AllowUnauthenticatedIdentities" _list path);
     identity_pool_name =
       (value_for_key identity_pool_name_of_yojson "IdentityPoolName" _list
          path)
   } : create_identity_pool_input)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson