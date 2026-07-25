open Types

val make_cognito_identity_provider :
  ?provider_name:cognito_identity_provider_name ->
  ?client_id:cognito_identity_provider_client_id ->
  ?server_side_token_check:cognito_identity_provider_token_check ->
  unit ->
  cognito_identity_provider

val make_identity_pool :
  ?allow_classic_flow:classic_flow ->
  ?supported_login_providers:identity_providers ->
  ?developer_provider_name:developer_provider_name ->
  ?open_id_connect_provider_ar_ns:oidc_provider_list ->
  ?cognito_identity_providers:cognito_identity_provider_list ->
  ?saml_provider_ar_ns:saml_provider_list ->
  ?identity_pool_tags:identity_pool_tags_type ->
  identity_pool_id:identity_pool_id ->
  identity_pool_name:identity_pool_name ->
  allow_unauthenticated_identities:identity_pool_unauthenticated ->
  unit ->
  identity_pool

val make_untag_resource_response : unit -> unit

val make_untag_resource_input :
  resource_arn:arn_string -> tag_keys:identity_pool_tags_list_type -> unit -> untag_resource_input

val make_unlink_identity_input :
  identity_id:identity_id ->
  logins:logins_map ->
  logins_to_remove:logins_list ->
  unit ->
  unlink_identity_input

val make_unlink_developer_identity_input :
  identity_id:identity_id ->
  identity_pool_id:identity_pool_id ->
  developer_provider_name:developer_provider_name ->
  developer_user_identifier:developer_user_identifier ->
  unit ->
  unlink_developer_identity_input

val make_tag_resource_response : unit -> unit

val make_tag_resource_input :
  resource_arn:arn_string -> tags:identity_pool_tags_type -> unit -> tag_resource_input

val make_set_principal_tag_attribute_map_response :
  ?identity_pool_id:identity_pool_id ->
  ?identity_provider_name:identity_provider_name ->
  ?use_defaults:use_defaults ->
  ?principal_tags:principal_tags ->
  unit ->
  set_principal_tag_attribute_map_response

val make_set_principal_tag_attribute_map_input :
  ?use_defaults:use_defaults ->
  ?principal_tags:principal_tags ->
  identity_pool_id:identity_pool_id ->
  identity_provider_name:identity_provider_name ->
  unit ->
  set_principal_tag_attribute_map_input

val make_mapping_rule :
  claim:claim_name ->
  match_type:mapping_rule_match_type ->
  value:claim_value ->
  role_ar_n:arn_string ->
  unit ->
  mapping_rule

val make_rules_configuration_type : rules:mapping_rules_list -> unit -> rules_configuration_type

val make_role_mapping :
  ?ambiguous_role_resolution:ambiguous_role_resolution_type ->
  ?rules_configuration:rules_configuration_type ->
  type_:role_mapping_type ->
  unit ->
  role_mapping

val make_set_identity_pool_roles_input :
  ?role_mappings:role_mapping_map ->
  identity_pool_id:identity_pool_id ->
  roles:roles_map ->
  unit ->
  set_identity_pool_roles_input

val make_merge_developer_identities_response :
  ?identity_id:identity_id -> unit -> merge_developer_identities_response

val make_merge_developer_identities_input :
  source_user_identifier:developer_user_identifier ->
  destination_user_identifier:developer_user_identifier ->
  developer_provider_name:developer_provider_name ->
  identity_pool_id:identity_pool_id ->
  unit ->
  merge_developer_identities_input

val make_lookup_developer_identity_response :
  ?identity_id:identity_id ->
  ?developer_user_identifier_list:developer_user_identifier_list ->
  ?next_token:pagination_key ->
  unit ->
  lookup_developer_identity_response

val make_lookup_developer_identity_input :
  ?identity_id:identity_id ->
  ?developer_user_identifier:developer_user_identifier ->
  ?max_results:query_limit ->
  ?next_token:pagination_key ->
  identity_pool_id:identity_pool_id ->
  unit ->
  lookup_developer_identity_input

val make_list_tags_for_resource_response :
  ?tags:identity_pool_tags_type -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_input :
  resource_arn:arn_string -> unit -> list_tags_for_resource_input

val make_identity_pool_short_description :
  ?identity_pool_id:identity_pool_id ->
  ?identity_pool_name:identity_pool_name ->
  unit ->
  identity_pool_short_description

val make_list_identity_pools_response :
  ?identity_pools:identity_pools_list ->
  ?next_token:pagination_key ->
  unit ->
  list_identity_pools_response

val make_list_identity_pools_input :
  ?next_token:pagination_key -> max_results:query_limit -> unit -> list_identity_pools_input

val make_identity_description :
  ?identity_id:identity_id ->
  ?logins:logins_list ->
  ?creation_date:date_type ->
  ?last_modified_date:date_type ->
  unit ->
  identity_description

val make_list_identities_response :
  ?identity_pool_id:identity_pool_id ->
  ?identities:identities_list ->
  ?next_token:pagination_key ->
  unit ->
  list_identities_response

val make_list_identities_input :
  ?next_token:pagination_key ->
  ?hide_disabled:hide_disabled ->
  identity_pool_id:identity_pool_id ->
  max_results:query_limit ->
  unit ->
  list_identities_input

val make_get_principal_tag_attribute_map_response :
  ?identity_pool_id:identity_pool_id ->
  ?identity_provider_name:identity_provider_name ->
  ?use_defaults:use_defaults ->
  ?principal_tags:principal_tags ->
  unit ->
  get_principal_tag_attribute_map_response

val make_get_principal_tag_attribute_map_input :
  identity_pool_id:identity_pool_id ->
  identity_provider_name:identity_provider_name ->
  unit ->
  get_principal_tag_attribute_map_input

val make_get_open_id_token_for_developer_identity_response :
  ?identity_id:identity_id ->
  ?token:oidc_token ->
  unit ->
  get_open_id_token_for_developer_identity_response

val make_get_open_id_token_for_developer_identity_input :
  ?identity_id:identity_id ->
  ?principal_tags:principal_tags ->
  ?token_duration:token_duration ->
  identity_pool_id:identity_pool_id ->
  logins:logins_map ->
  unit ->
  get_open_id_token_for_developer_identity_input

val make_get_open_id_token_response :
  ?identity_id:identity_id -> ?token:oidc_token -> unit -> get_open_id_token_response

val make_get_open_id_token_input :
  ?logins:logins_map -> identity_id:identity_id -> unit -> get_open_id_token_input

val make_get_identity_pool_roles_response :
  ?identity_pool_id:identity_pool_id ->
  ?roles:roles_map ->
  ?role_mappings:role_mapping_map ->
  unit ->
  get_identity_pool_roles_response

val make_get_identity_pool_roles_input :
  identity_pool_id:identity_pool_id -> unit -> get_identity_pool_roles_input

val make_get_id_response : ?identity_id:identity_id -> unit -> get_id_response

val make_get_id_input :
  ?account_id:account_id ->
  ?logins:logins_map ->
  identity_pool_id:identity_pool_id ->
  unit ->
  get_id_input

val make_credentials :
  ?access_key_id:access_key_string ->
  ?secret_key:secret_key_string ->
  ?session_token:session_token_string ->
  ?expiration:date_type ->
  unit ->
  credentials

val make_get_credentials_for_identity_response :
  ?identity_id:identity_id ->
  ?credentials:credentials ->
  unit ->
  get_credentials_for_identity_response

val make_get_credentials_for_identity_input :
  ?logins:logins_map ->
  ?custom_role_arn:arn_string ->
  identity_id:identity_id ->
  unit ->
  get_credentials_for_identity_input

val make_describe_identity_pool_input :
  identity_pool_id:identity_pool_id -> unit -> describe_identity_pool_input

val make_describe_identity_input : identity_id:identity_id -> unit -> describe_identity_input

val make_delete_identity_pool_input :
  identity_pool_id:identity_pool_id -> unit -> delete_identity_pool_input

val make_unprocessed_identity_id :
  ?identity_id:identity_id -> ?error_code:error_code -> unit -> unprocessed_identity_id

val make_delete_identities_response :
  ?unprocessed_identity_ids:unprocessed_identity_id_list -> unit -> delete_identities_response

val make_delete_identities_input :
  identity_ids_to_delete:identity_id_list -> unit -> delete_identities_input

val make_create_identity_pool_input :
  ?allow_classic_flow:classic_flow ->
  ?supported_login_providers:identity_providers ->
  ?developer_provider_name:developer_provider_name ->
  ?open_id_connect_provider_ar_ns:oidc_provider_list ->
  ?cognito_identity_providers:cognito_identity_provider_list ->
  ?saml_provider_ar_ns:saml_provider_list ->
  ?identity_pool_tags:identity_pool_tags_type ->
  identity_pool_name:identity_pool_name ->
  allow_unauthenticated_identities:identity_pool_unauthenticated ->
  unit ->
  create_identity_pool_input
