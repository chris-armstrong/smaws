open Types

let make_cognito_identity_provider
    ?provider_name:(provider_name_ : cognito_identity_provider_name option)
    ?client_id:(client_id_ : cognito_identity_provider_client_id option)
    ?server_side_token_check:
      (server_side_token_check_ : cognito_identity_provider_token_check option) () =
  ({
     provider_name = provider_name_;
     client_id = client_id_;
     server_side_token_check = server_side_token_check_;
   }
    : cognito_identity_provider)

let make_identity_pool ?allow_classic_flow:(allow_classic_flow_ : classic_flow option)
    ?supported_login_providers:(supported_login_providers_ : identity_providers option)
    ?developer_provider_name:(developer_provider_name_ : developer_provider_name option)
    ?open_id_connect_provider_ar_ns:(open_id_connect_provider_ar_ns_ : oidc_provider_list option)
    ?cognito_identity_providers:
      (cognito_identity_providers_ : cognito_identity_provider_list option)
    ?saml_provider_ar_ns:(saml_provider_ar_ns_ : saml_provider_list option)
    ?identity_pool_tags:(identity_pool_tags_ : identity_pool_tags_type option)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id)
    ~identity_pool_name:(identity_pool_name_ : identity_pool_name)
    ~allow_unauthenticated_identities:
      (allow_unauthenticated_identities_ : identity_pool_unauthenticated) () =
  ({
     identity_pool_id = identity_pool_id_;
     identity_pool_name = identity_pool_name_;
     allow_unauthenticated_identities = allow_unauthenticated_identities_;
     allow_classic_flow = allow_classic_flow_;
     supported_login_providers = supported_login_providers_;
     developer_provider_name = developer_provider_name_;
     open_id_connect_provider_ar_ns = open_id_connect_provider_ar_ns_;
     cognito_identity_providers = cognito_identity_providers_;
     saml_provider_ar_ns = saml_provider_ar_ns_;
     identity_pool_tags = identity_pool_tags_;
   }
    : identity_pool)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : arn_string)
    ~tag_keys:(tag_keys_ : identity_pool_tags_list_type) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_unlink_identity_input ~identity_id:(identity_id_ : identity_id)
    ~logins:(logins_ : logins_map) ~logins_to_remove:(logins_to_remove_ : logins_list) () =
  ({ identity_id = identity_id_; logins = logins_; logins_to_remove = logins_to_remove_ }
    : unlink_identity_input)

let make_unlink_developer_identity_input ~identity_id:(identity_id_ : identity_id)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id)
    ~developer_provider_name:(developer_provider_name_ : developer_provider_name)
    ~developer_user_identifier:(developer_user_identifier_ : developer_user_identifier) () =
  ({
     identity_id = identity_id_;
     identity_pool_id = identity_pool_id_;
     developer_provider_name = developer_provider_name_;
     developer_user_identifier = developer_user_identifier_;
   }
    : unlink_developer_identity_input)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_input ~resource_arn:(resource_arn_ : arn_string)
    ~tags:(tags_ : identity_pool_tags_type) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_set_principal_tag_attribute_map_response
    ?identity_pool_id:(identity_pool_id_ : identity_pool_id option)
    ?identity_provider_name:(identity_provider_name_ : identity_provider_name option)
    ?use_defaults:(use_defaults_ : use_defaults option)
    ?principal_tags:(principal_tags_ : principal_tags option) () =
  ({
     identity_pool_id = identity_pool_id_;
     identity_provider_name = identity_provider_name_;
     use_defaults = use_defaults_;
     principal_tags = principal_tags_;
   }
    : set_principal_tag_attribute_map_response)

let make_set_principal_tag_attribute_map_input ?use_defaults:(use_defaults_ : use_defaults option)
    ?principal_tags:(principal_tags_ : principal_tags option)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id)
    ~identity_provider_name:(identity_provider_name_ : identity_provider_name) () =
  ({
     identity_pool_id = identity_pool_id_;
     identity_provider_name = identity_provider_name_;
     use_defaults = use_defaults_;
     principal_tags = principal_tags_;
   }
    : set_principal_tag_attribute_map_input)

let make_mapping_rule ~claim:(claim_ : claim_name)
    ~match_type:(match_type_ : mapping_rule_match_type) ~value:(value_ : claim_value)
    ~role_ar_n:(role_ar_n_ : arn_string) () =
  ({ claim = claim_; match_type = match_type_; value = value_; role_ar_n = role_ar_n_ }
    : mapping_rule)

let make_rules_configuration_type ~rules:(rules_ : mapping_rules_list) () =
  ({ rules = rules_ } : rules_configuration_type)

let make_role_mapping
    ?ambiguous_role_resolution:(ambiguous_role_resolution_ : ambiguous_role_resolution_type option)
    ?rules_configuration:(rules_configuration_ : rules_configuration_type option)
    ~type_:(type__ : role_mapping_type) () =
  ({
     type_ = type__;
     ambiguous_role_resolution = ambiguous_role_resolution_;
     rules_configuration = rules_configuration_;
   }
    : role_mapping)

let make_set_identity_pool_roles_input ?role_mappings:(role_mappings_ : role_mapping_map option)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id) ~roles:(roles_ : roles_map) () =
  ({ identity_pool_id = identity_pool_id_; roles = roles_; role_mappings = role_mappings_ }
    : set_identity_pool_roles_input)

let make_merge_developer_identities_response ?identity_id:(identity_id_ : identity_id option) () =
  ({ identity_id = identity_id_ } : merge_developer_identities_response)

let make_merge_developer_identities_input
    ~source_user_identifier:(source_user_identifier_ : developer_user_identifier)
    ~destination_user_identifier:(destination_user_identifier_ : developer_user_identifier)
    ~developer_provider_name:(developer_provider_name_ : developer_provider_name)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id) () =
  ({
     source_user_identifier = source_user_identifier_;
     destination_user_identifier = destination_user_identifier_;
     developer_provider_name = developer_provider_name_;
     identity_pool_id = identity_pool_id_;
   }
    : merge_developer_identities_input)

let make_lookup_developer_identity_response ?identity_id:(identity_id_ : identity_id option)
    ?developer_user_identifier_list:
      (developer_user_identifier_list_ : developer_user_identifier_list option)
    ?next_token:(next_token_ : pagination_key option) () =
  ({
     identity_id = identity_id_;
     developer_user_identifier_list = developer_user_identifier_list_;
     next_token = next_token_;
   }
    : lookup_developer_identity_response)

let make_lookup_developer_identity_input ?identity_id:(identity_id_ : identity_id option)
    ?developer_user_identifier:(developer_user_identifier_ : developer_user_identifier option)
    ?max_results:(max_results_ : query_limit option)
    ?next_token:(next_token_ : pagination_key option)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id) () =
  ({
     identity_pool_id = identity_pool_id_;
     identity_id = identity_id_;
     developer_user_identifier = developer_user_identifier_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : lookup_developer_identity_input)

let make_list_tags_for_resource_response ?tags:(tags_ : identity_pool_tags_type option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : arn_string) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_identity_pool_short_description
    ?identity_pool_id:(identity_pool_id_ : identity_pool_id option)
    ?identity_pool_name:(identity_pool_name_ : identity_pool_name option) () =
  ({ identity_pool_id = identity_pool_id_; identity_pool_name = identity_pool_name_ }
    : identity_pool_short_description)

let make_list_identity_pools_response ?identity_pools:(identity_pools_ : identity_pools_list option)
    ?next_token:(next_token_ : pagination_key option) () =
  ({ identity_pools = identity_pools_; next_token = next_token_ } : list_identity_pools_response)

let make_list_identity_pools_input ?next_token:(next_token_ : pagination_key option)
    ~max_results:(max_results_ : query_limit) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_identity_pools_input)

let make_identity_description ?identity_id:(identity_id_ : identity_id option)
    ?logins:(logins_ : logins_list option) ?creation_date:(creation_date_ : date_type option)
    ?last_modified_date:(last_modified_date_ : date_type option) () =
  ({
     identity_id = identity_id_;
     logins = logins_;
     creation_date = creation_date_;
     last_modified_date = last_modified_date_;
   }
    : identity_description)

let make_list_identities_response ?identity_pool_id:(identity_pool_id_ : identity_pool_id option)
    ?identities:(identities_ : identities_list option)
    ?next_token:(next_token_ : pagination_key option) () =
  ({ identity_pool_id = identity_pool_id_; identities = identities_; next_token = next_token_ }
    : list_identities_response)

let make_list_identities_input ?next_token:(next_token_ : pagination_key option)
    ?hide_disabled:(hide_disabled_ : hide_disabled option)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id)
    ~max_results:(max_results_ : query_limit) () =
  ({
     identity_pool_id = identity_pool_id_;
     max_results = max_results_;
     next_token = next_token_;
     hide_disabled = hide_disabled_;
   }
    : list_identities_input)

let make_get_principal_tag_attribute_map_response
    ?identity_pool_id:(identity_pool_id_ : identity_pool_id option)
    ?identity_provider_name:(identity_provider_name_ : identity_provider_name option)
    ?use_defaults:(use_defaults_ : use_defaults option)
    ?principal_tags:(principal_tags_ : principal_tags option) () =
  ({
     identity_pool_id = identity_pool_id_;
     identity_provider_name = identity_provider_name_;
     use_defaults = use_defaults_;
     principal_tags = principal_tags_;
   }
    : get_principal_tag_attribute_map_response)

let make_get_principal_tag_attribute_map_input
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id)
    ~identity_provider_name:(identity_provider_name_ : identity_provider_name) () =
  ({ identity_pool_id = identity_pool_id_; identity_provider_name = identity_provider_name_ }
    : get_principal_tag_attribute_map_input)

let make_get_open_id_token_for_developer_identity_response
    ?identity_id:(identity_id_ : identity_id option) ?token:(token_ : oidc_token option) () =
  ({ identity_id = identity_id_; token = token_ }
    : get_open_id_token_for_developer_identity_response)

let make_get_open_id_token_for_developer_identity_input
    ?identity_id:(identity_id_ : identity_id option)
    ?principal_tags:(principal_tags_ : principal_tags option)
    ?token_duration:(token_duration_ : token_duration option)
    ~identity_pool_id:(identity_pool_id_ : identity_pool_id) ~logins:(logins_ : logins_map) () =
  ({
     identity_pool_id = identity_pool_id_;
     identity_id = identity_id_;
     logins = logins_;
     principal_tags = principal_tags_;
     token_duration = token_duration_;
   }
    : get_open_id_token_for_developer_identity_input)

let make_get_open_id_token_response ?identity_id:(identity_id_ : identity_id option)
    ?token:(token_ : oidc_token option) () =
  ({ identity_id = identity_id_; token = token_ } : get_open_id_token_response)

let make_get_open_id_token_input ?logins:(logins_ : logins_map option)
    ~identity_id:(identity_id_ : identity_id) () =
  ({ identity_id = identity_id_; logins = logins_ } : get_open_id_token_input)

let make_get_identity_pool_roles_response
    ?identity_pool_id:(identity_pool_id_ : identity_pool_id option)
    ?roles:(roles_ : roles_map option) ?role_mappings:(role_mappings_ : role_mapping_map option) ()
    =
  ({ identity_pool_id = identity_pool_id_; roles = roles_; role_mappings = role_mappings_ }
    : get_identity_pool_roles_response)

let make_get_identity_pool_roles_input ~identity_pool_id:(identity_pool_id_ : identity_pool_id) () =
  ({ identity_pool_id = identity_pool_id_ } : get_identity_pool_roles_input)

let make_get_id_response ?identity_id:(identity_id_ : identity_id option) () =
  ({ identity_id = identity_id_ } : get_id_response)

let make_get_id_input ?account_id:(account_id_ : account_id option)
    ?logins:(logins_ : logins_map option) ~identity_pool_id:(identity_pool_id_ : identity_pool_id)
    () =
  ({ account_id = account_id_; identity_pool_id = identity_pool_id_; logins = logins_ }
    : get_id_input)

let make_credentials ?access_key_id:(access_key_id_ : access_key_string option)
    ?secret_key:(secret_key_ : secret_key_string option)
    ?session_token:(session_token_ : session_token_string option)
    ?expiration:(expiration_ : date_type option) () =
  ({
     access_key_id = access_key_id_;
     secret_key = secret_key_;
     session_token = session_token_;
     expiration = expiration_;
   }
    : credentials)

let make_get_credentials_for_identity_response ?identity_id:(identity_id_ : identity_id option)
    ?credentials:(credentials_ : credentials option) () =
  ({ identity_id = identity_id_; credentials = credentials_ }
    : get_credentials_for_identity_response)

let make_get_credentials_for_identity_input ?logins:(logins_ : logins_map option)
    ?custom_role_arn:(custom_role_arn_ : arn_string option)
    ~identity_id:(identity_id_ : identity_id) () =
  ({ identity_id = identity_id_; logins = logins_; custom_role_arn = custom_role_arn_ }
    : get_credentials_for_identity_input)

let make_describe_identity_pool_input ~identity_pool_id:(identity_pool_id_ : identity_pool_id) () =
  ({ identity_pool_id = identity_pool_id_ } : describe_identity_pool_input)

let make_describe_identity_input ~identity_id:(identity_id_ : identity_id) () =
  ({ identity_id = identity_id_ } : describe_identity_input)

let make_delete_identity_pool_input ~identity_pool_id:(identity_pool_id_ : identity_pool_id) () =
  ({ identity_pool_id = identity_pool_id_ } : delete_identity_pool_input)

let make_unprocessed_identity_id ?identity_id:(identity_id_ : identity_id option)
    ?error_code:(error_code_ : error_code option) () =
  ({ identity_id = identity_id_; error_code = error_code_ } : unprocessed_identity_id)

let make_delete_identities_response
    ?unprocessed_identity_ids:(unprocessed_identity_ids_ : unprocessed_identity_id_list option) () =
  ({ unprocessed_identity_ids = unprocessed_identity_ids_ } : delete_identities_response)

let make_delete_identities_input
    ~identity_ids_to_delete:(identity_ids_to_delete_ : identity_id_list) () =
  ({ identity_ids_to_delete = identity_ids_to_delete_ } : delete_identities_input)

let make_create_identity_pool_input ?allow_classic_flow:(allow_classic_flow_ : classic_flow option)
    ?supported_login_providers:(supported_login_providers_ : identity_providers option)
    ?developer_provider_name:(developer_provider_name_ : developer_provider_name option)
    ?open_id_connect_provider_ar_ns:(open_id_connect_provider_ar_ns_ : oidc_provider_list option)
    ?cognito_identity_providers:
      (cognito_identity_providers_ : cognito_identity_provider_list option)
    ?saml_provider_ar_ns:(saml_provider_ar_ns_ : saml_provider_list option)
    ?identity_pool_tags:(identity_pool_tags_ : identity_pool_tags_type option)
    ~identity_pool_name:(identity_pool_name_ : identity_pool_name)
    ~allow_unauthenticated_identities:
      (allow_unauthenticated_identities_ : identity_pool_unauthenticated) () =
  ({
     identity_pool_name = identity_pool_name_;
     allow_unauthenticated_identities = allow_unauthenticated_identities_;
     allow_classic_flow = allow_classic_flow_;
     supported_login_providers = supported_login_providers_;
     developer_provider_name = developer_provider_name_;
     open_id_connect_provider_ar_ns = open_id_connect_provider_ar_ns_;
     cognito_identity_providers = cognito_identity_providers_;
     saml_provider_ar_ns = saml_provider_ar_ns_;
     identity_pool_tags = identity_pool_tags_;
   }
    : create_identity_pool_input)
