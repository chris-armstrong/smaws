open Types
val make_cognito_identity_provider :
  ?server_side_token_check:cognito_identity_provider_token_check ->
    ?client_id:cognito_identity_provider_client_id ->
      ?provider_name:cognito_identity_provider_name ->
        unit -> cognito_identity_provider
val make_identity_pool :
  ?identity_pool_tags:identity_pool_tags_type ->
    ?saml_provider_ar_ns:saml_provider_list ->
      ?cognito_identity_providers:cognito_identity_provider_list ->
        ?open_id_connect_provider_ar_ns:oidc_provider_list ->
          ?developer_provider_name:developer_provider_name ->
            ?supported_login_providers:identity_providers ->
              ?allow_classic_flow:classic_flow ->
                allow_unauthenticated_identities:identity_pool_unauthenticated
                  ->
                  identity_pool_name:identity_pool_name ->
                    identity_pool_id:identity_pool_id ->
                      unit -> identity_pool
val make_untag_resource_response : unit -> unit
val make_untag_resource_input :
  tag_keys:identity_pool_tags_list_type ->
    resource_arn:arn_string -> unit -> untag_resource_input
val make_unprocessed_identity_id :
  ?error_code:error_code ->
    ?identity_id:identity_id -> unit -> unprocessed_identity_id
val make_unlink_identity_input :
  logins_to_remove:logins_list ->
    logins:logins_map ->
      identity_id:identity_id -> unit -> unlink_identity_input
val make_unlink_developer_identity_input :
  developer_user_identifier:developer_user_identifier ->
    developer_provider_name:developer_provider_name ->
      identity_pool_id:identity_pool_id ->
        identity_id:identity_id -> unit -> unlink_developer_identity_input
val make_tag_resource_response : unit -> unit
val make_tag_resource_input :
  tags:identity_pool_tags_type ->
    resource_arn:arn_string -> unit -> tag_resource_input
val make_set_principal_tag_attribute_map_response :
  ?principal_tags:principal_tags ->
    ?use_defaults:use_defaults ->
      ?identity_provider_name:identity_provider_name ->
        ?identity_pool_id:identity_pool_id ->
          unit -> set_principal_tag_attribute_map_response
val make_set_principal_tag_attribute_map_input :
  ?principal_tags:principal_tags ->
    ?use_defaults:use_defaults ->
      identity_provider_name:identity_provider_name ->
        identity_pool_id:identity_pool_id ->
          unit -> set_principal_tag_attribute_map_input
val make_mapping_rule :
  role_ar_n:arn_string ->
    value:claim_value ->
      match_type:mapping_rule_match_type ->
        claim:claim_name -> unit -> mapping_rule
val make_rules_configuration_type :
  rules:mapping_rules_list -> unit -> rules_configuration_type
val make_role_mapping :
  ?rules_configuration:rules_configuration_type ->
    ?ambiguous_role_resolution:ambiguous_role_resolution_type ->
      type_:role_mapping_type -> unit -> role_mapping
val make_set_identity_pool_roles_input :
  ?role_mappings:role_mapping_map ->
    roles:roles_map ->
      identity_pool_id:identity_pool_id ->
        unit -> set_identity_pool_roles_input
val make_merge_developer_identities_response :
  ?identity_id:identity_id -> unit -> merge_developer_identities_response
val make_merge_developer_identities_input :
  identity_pool_id:identity_pool_id ->
    developer_provider_name:developer_provider_name ->
      destination_user_identifier:developer_user_identifier ->
        source_user_identifier:developer_user_identifier ->
          unit -> merge_developer_identities_input
val make_lookup_developer_identity_response :
  ?next_token:pagination_key ->
    ?developer_user_identifier_list:developer_user_identifier_list ->
      ?identity_id:identity_id -> unit -> lookup_developer_identity_response
val make_lookup_developer_identity_input :
  ?next_token:pagination_key ->
    ?max_results:query_limit ->
      ?developer_user_identifier:developer_user_identifier ->
        ?identity_id:identity_id ->
          identity_pool_id:identity_pool_id ->
            unit -> lookup_developer_identity_input
val make_list_tags_for_resource_response :
  ?tags:identity_pool_tags_type -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_input :
  resource_arn:arn_string -> unit -> list_tags_for_resource_input
val make_identity_pool_short_description :
  ?identity_pool_name:identity_pool_name ->
    ?identity_pool_id:identity_pool_id ->
      unit -> identity_pool_short_description
val make_list_identity_pools_response :
  ?next_token:pagination_key ->
    ?identity_pools:identity_pools_list ->
      unit -> list_identity_pools_response
val make_list_identity_pools_input :
  ?next_token:pagination_key ->
    max_results:query_limit -> unit -> list_identity_pools_input
val make_identity_description :
  ?last_modified_date:date_type ->
    ?creation_date:date_type ->
      ?logins:logins_list ->
        ?identity_id:identity_id -> unit -> identity_description
val make_list_identities_response :
  ?next_token:pagination_key ->
    ?identities:identities_list ->
      ?identity_pool_id:identity_pool_id -> unit -> list_identities_response
val make_list_identities_input :
  ?hide_disabled:hide_disabled ->
    ?next_token:pagination_key ->
      max_results:query_limit ->
        identity_pool_id:identity_pool_id -> unit -> list_identities_input
val make_get_principal_tag_attribute_map_response :
  ?principal_tags:principal_tags ->
    ?use_defaults:use_defaults ->
      ?identity_provider_name:identity_provider_name ->
        ?identity_pool_id:identity_pool_id ->
          unit -> get_principal_tag_attribute_map_response
val make_get_principal_tag_attribute_map_input :
  identity_provider_name:identity_provider_name ->
    identity_pool_id:identity_pool_id ->
      unit -> get_principal_tag_attribute_map_input
val make_get_open_id_token_response :
  ?token:oidc_token ->
    ?identity_id:identity_id -> unit -> get_open_id_token_response
val make_get_open_id_token_input :
  ?logins:logins_map ->
    identity_id:identity_id -> unit -> get_open_id_token_input
val make_get_open_id_token_for_developer_identity_response :
  ?token:oidc_token ->
    ?identity_id:identity_id ->
      unit -> get_open_id_token_for_developer_identity_response
val make_get_open_id_token_for_developer_identity_input :
  ?token_duration:token_duration ->
    ?principal_tags:principal_tags ->
      ?identity_id:identity_id ->
        logins:logins_map ->
          identity_pool_id:identity_pool_id ->
            unit -> get_open_id_token_for_developer_identity_input
val make_get_identity_pool_roles_response :
  ?role_mappings:role_mapping_map ->
    ?roles:roles_map ->
      ?identity_pool_id:identity_pool_id ->
        unit -> get_identity_pool_roles_response
val make_get_identity_pool_roles_input :
  identity_pool_id:identity_pool_id -> unit -> get_identity_pool_roles_input
val make_get_id_response :
  ?identity_id:identity_id -> unit -> get_id_response
val make_get_id_input :
  ?logins:logins_map ->
    ?account_id:account_id ->
      identity_pool_id:identity_pool_id -> unit -> get_id_input
val make_credentials :
  ?expiration:date_type ->
    ?session_token:session_token_string ->
      ?secret_key:secret_key_string ->
        ?access_key_id:access_key_string -> unit -> credentials
val make_get_credentials_for_identity_response :
  ?credentials:credentials ->
    ?identity_id:identity_id -> unit -> get_credentials_for_identity_response
val make_get_credentials_for_identity_input :
  ?custom_role_arn:arn_string ->
    ?logins:logins_map ->
      identity_id:identity_id -> unit -> get_credentials_for_identity_input
val make_describe_identity_pool_input :
  identity_pool_id:identity_pool_id -> unit -> describe_identity_pool_input
val make_describe_identity_input :
  identity_id:identity_id -> unit -> describe_identity_input
val make_delete_identity_pool_input :
  identity_pool_id:identity_pool_id -> unit -> delete_identity_pool_input
val make_delete_identities_response :
  ?unprocessed_identity_ids:unprocessed_identity_id_list ->
    unit -> delete_identities_response
val make_delete_identities_input :
  identity_ids_to_delete:identity_id_list -> unit -> delete_identities_input
val make_create_identity_pool_input :
  ?identity_pool_tags:identity_pool_tags_type ->
    ?saml_provider_ar_ns:saml_provider_list ->
      ?cognito_identity_providers:cognito_identity_provider_list ->
        ?open_id_connect_provider_ar_ns:oidc_provider_list ->
          ?developer_provider_name:developer_provider_name ->
            ?supported_login_providers:identity_providers ->
              ?allow_classic_flow:classic_flow ->
                allow_unauthenticated_identities:identity_pool_unauthenticated
                  ->
                  identity_pool_name:identity_pool_name ->
                    unit -> create_identity_pool_input