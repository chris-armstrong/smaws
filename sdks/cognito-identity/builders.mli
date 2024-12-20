open Types
val make_cognito_identity_provider :
  ?server_side_token_check:bool ->
  ?client_id:string ->
  ?provider_name:string ->
  unit
-> cognito_identity_provider
(** Create a {!type-cognito_identity_provider} type *)

val make_identity_pool :
  ?identity_pool_tags:(string * string) list ->
  ?saml_provider_ar_ns:string list ->
  ?cognito_identity_providers:cognito_identity_provider list ->
  ?open_id_connect_provider_ar_ns:string list ->
  ?developer_provider_name:string ->
  ?supported_login_providers:(string * string) list ->
  ?allow_classic_flow:bool ->
  allow_unauthenticated_identities:bool ->
  identity_pool_name:string ->
  identity_pool_id:string ->
  unit
-> identity_pool
(** Create a {!type-identity_pool} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input
(** Create a {!type-untag_resource_input} type *)

val make_unprocessed_identity_id :
  ?error_code:error_code -> ?identity_id:string -> unit
-> unprocessed_identity_id
(** Create a {!type-unprocessed_identity_id} type *)

val make_unlink_identity_input :
  logins_to_remove:string list ->
  logins:(string * string) list ->
  identity_id:string ->
  unit
-> unlink_identity_input
(** Create a {!type-unlink_identity_input} type *)

val make_unlink_developer_identity_input :
  developer_user_identifier:string ->
  developer_provider_name:string ->
  identity_pool_id:string ->
  identity_id:string ->
  unit
-> unlink_developer_identity_input
(** Create a {!type-unlink_developer_identity_input} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag_resource_input :
  tags:(string * string) list -> resource_arn:string -> unit
-> tag_resource_input
(** Create a {!type-tag_resource_input} type *)

val make_set_principal_tag_attribute_map_response :
  ?principal_tags:(string * string) list ->
  ?use_defaults:bool ->
  ?identity_provider_name:string ->
  ?identity_pool_id:string ->
  unit
-> set_principal_tag_attribute_map_response
(** Create a {!type-set_principal_tag_attribute_map_response} type *)

val make_set_principal_tag_attribute_map_input :
  ?principal_tags:(string * string) list ->
  ?use_defaults:bool ->
  identity_provider_name:string ->
  identity_pool_id:string ->
  unit
-> set_principal_tag_attribute_map_input
(** Create a {!type-set_principal_tag_attribute_map_input} type *)

val make_mapping_rule :
  role_ar_n:string ->
  value:string ->
  match_type:mapping_rule_match_type ->
  claim:string ->
  unit
-> mapping_rule
(** Create a {!type-mapping_rule} type *)

val make_rules_configuration_type : rules:mapping_rule list -> unit
-> rules_configuration_type
(** Create a {!type-rules_configuration_type} type *)

val make_role_mapping :
  ?rules_configuration:rules_configuration_type ->
  ?ambiguous_role_resolution:ambiguous_role_resolution_type ->
  type_:role_mapping_type ->
  unit
-> role_mapping
(** Create a {!type-role_mapping} type *)

val make_set_identity_pool_roles_input :
  ?role_mappings:(string * role_mapping) list ->
  roles:(string * string) list ->
  identity_pool_id:string ->
  unit
-> set_identity_pool_roles_input
(** Create a {!type-set_identity_pool_roles_input} type *)

val make_merge_developer_identities_response : ?identity_id:string -> unit
-> merge_developer_identities_response
(** Create a {!type-merge_developer_identities_response} type *)

val make_merge_developer_identities_input :
  identity_pool_id:string ->
  developer_provider_name:string ->
  destination_user_identifier:string ->
  source_user_identifier:string ->
  unit
-> merge_developer_identities_input
(** Create a {!type-merge_developer_identities_input} type *)

val make_lookup_developer_identity_response :
  ?next_token:string ->
  ?developer_user_identifier_list:string list ->
  ?identity_id:string ->
  unit
-> lookup_developer_identity_response
(** Create a {!type-lookup_developer_identity_response} type *)

val make_lookup_developer_identity_input :
  ?next_token:string ->
  ?max_results:int ->
  ?developer_user_identifier:string ->
  ?identity_id:string ->
  identity_pool_id:string ->
  unit
-> lookup_developer_identity_input
(** Create a {!type-lookup_developer_identity_input} type *)

val make_list_tags_for_resource_response :
  ?tags:(string * string) list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input
(** Create a {!type-list_tags_for_resource_input} type *)

val make_identity_pool_short_description :
  ?identity_pool_name:string -> ?identity_pool_id:string -> unit
-> identity_pool_short_description
(** Create a {!type-identity_pool_short_description} type *)

val make_list_identity_pools_response :
  ?next_token:string ->
  ?identity_pools:identity_pool_short_description list ->
  unit
-> list_identity_pools_response
(** Create a {!type-list_identity_pools_response} type *)

val make_list_identity_pools_input :
  ?next_token:string -> max_results:int -> unit
-> list_identity_pools_input
(** Create a {!type-list_identity_pools_input} type *)

val make_identity_description :
  ?last_modified_date:float ->
  ?creation_date:float ->
  ?logins:string list ->
  ?identity_id:string ->
  unit
-> identity_description
(** Create a {!type-identity_description} type *)

val make_list_identities_response :
  ?next_token:string ->
  ?identities:identity_description list ->
  ?identity_pool_id:string ->
  unit
-> list_identities_response
(** Create a {!type-list_identities_response} type *)

val make_list_identities_input :
  ?hide_disabled:bool ->
  ?next_token:string ->
  max_results:int ->
  identity_pool_id:string ->
  unit
-> list_identities_input
(** Create a {!type-list_identities_input} type *)

val make_get_principal_tag_attribute_map_response :
  ?principal_tags:(string * string) list ->
  ?use_defaults:bool ->
  ?identity_provider_name:string ->
  ?identity_pool_id:string ->
  unit
-> get_principal_tag_attribute_map_response
(** Create a {!type-get_principal_tag_attribute_map_response} type *)

val make_get_principal_tag_attribute_map_input :
  identity_provider_name:string -> identity_pool_id:string -> unit
-> get_principal_tag_attribute_map_input
(** Create a {!type-get_principal_tag_attribute_map_input} type *)

val make_get_open_id_token_response :
  ?token:string -> ?identity_id:string -> unit
-> get_open_id_token_response
(** Create a {!type-get_open_id_token_response} type *)

val make_get_open_id_token_input :
  ?logins:(string * string) list -> identity_id:string -> unit
-> get_open_id_token_input
(** Create a {!type-get_open_id_token_input} type *)

val make_get_open_id_token_for_developer_identity_response :
  ?token:string -> ?identity_id:string -> unit
-> get_open_id_token_for_developer_identity_response
(** Create a {!type-get_open_id_token_for_developer_identity_response} type *)

val make_get_open_id_token_for_developer_identity_input :
  ?token_duration:int ->
  ?principal_tags:(string * string) list ->
  ?identity_id:string ->
  logins:(string * string) list ->
  identity_pool_id:string ->
  unit
-> get_open_id_token_for_developer_identity_input
(** Create a {!type-get_open_id_token_for_developer_identity_input} type *)

val make_get_identity_pool_roles_response :
  ?role_mappings:(string * role_mapping) list ->
  ?roles:(string * string) list ->
  ?identity_pool_id:string ->
  unit
-> get_identity_pool_roles_response
(** Create a {!type-get_identity_pool_roles_response} type *)

val make_get_identity_pool_roles_input : identity_pool_id:string -> unit
-> get_identity_pool_roles_input
(** Create a {!type-get_identity_pool_roles_input} type *)

val make_get_id_response : ?identity_id:string -> unit
-> get_id_response
(** Create a {!type-get_id_response} type *)

val make_get_id_input :
  ?logins:(string * string) list ->
  ?account_id:string ->
  identity_pool_id:string ->
  unit
-> get_id_input
(** Create a {!type-get_id_input} type *)

val make_credentials :
  ?expiration:float ->
  ?session_token:string ->
  ?secret_key:string ->
  ?access_key_id:string ->
  unit
-> credentials
(** Create a {!type-credentials} type *)

val make_get_credentials_for_identity_response :
  ?credentials:credentials -> ?identity_id:string -> unit
-> get_credentials_for_identity_response
(** Create a {!type-get_credentials_for_identity_response} type *)

val make_get_credentials_for_identity_input :
  ?custom_role_arn:string ->
  ?logins:(string * string) list ->
  identity_id:string ->
  unit
-> get_credentials_for_identity_input
(** Create a {!type-get_credentials_for_identity_input} type *)

val make_describe_identity_pool_input : identity_pool_id:string -> unit
-> describe_identity_pool_input
(** Create a {!type-describe_identity_pool_input} type *)

val make_describe_identity_input : identity_id:string -> unit
-> describe_identity_input
(** Create a {!type-describe_identity_input} type *)

val make_delete_identity_pool_input : identity_pool_id:string -> unit
-> delete_identity_pool_input
(** Create a {!type-delete_identity_pool_input} type *)

val make_delete_identities_response :
  ?unprocessed_identity_ids:unprocessed_identity_id list -> unit
-> delete_identities_response
(** Create a {!type-delete_identities_response} type *)

val make_delete_identities_input : identity_ids_to_delete:string list -> unit
-> delete_identities_input
(** Create a {!type-delete_identities_input} type *)

val make_create_identity_pool_input :
  ?identity_pool_tags:(string * string) list ->
  ?saml_provider_ar_ns:string list ->
  ?cognito_identity_providers:cognito_identity_provider list ->
  ?open_id_connect_provider_ar_ns:string list ->
  ?developer_provider_name:string ->
  ?supported_login_providers:(string * string) list ->
  ?allow_classic_flow:bool ->
  allow_unauthenticated_identities:bool ->
  identity_pool_name:string ->
  unit
-> create_identity_pool_input
(** Create a {!type-create_identity_pool_input} type *)

