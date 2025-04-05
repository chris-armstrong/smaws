open Smaws_Lib
open Types
let make_cognito_identity_provider
  ?server_side_token_check:(server_side_token_check_ : bool option) 
  ?client_id:(client_id_ : string option) 
  ?provider_name:(provider_name_ : string option)  () =
  ({
     server_side_token_check = server_side_token_check_;
     client_id = client_id_;
     provider_name = provider_name_
   } : cognito_identity_provider)
let make_identity_pool
  ?identity_pool_tags:(identity_pool_tags_ : identity_pool_tags_type option) 
  ?saml_provider_ar_ns:(saml_provider_ar_ns_ : string list option) 
  ?cognito_identity_providers:(cognito_identity_providers_ :
                                cognito_identity_provider list option)
   ?open_id_connect_provider_ar_ns:(open_id_connect_provider_ar_ns_ :
                                     string list option)
   ?developer_provider_name:(developer_provider_name_ : string option) 
  ?supported_login_providers:(supported_login_providers_ :
                               identity_providers option)
   ?allow_classic_flow:(allow_classic_flow_ : bool option) 
  ~allow_unauthenticated_identities:(allow_unauthenticated_identities_ :
                                      bool)
   ~identity_pool_name:(identity_pool_name_ : string) 
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     identity_pool_tags = identity_pool_tags_;
     saml_provider_ar_ns = saml_provider_ar_ns_;
     cognito_identity_providers = cognito_identity_providers_;
     open_id_connect_provider_ar_ns = open_id_connect_provider_ar_ns_;
     developer_provider_name = developer_provider_name_;
     supported_login_providers = supported_login_providers_;
     allow_classic_flow = allow_classic_flow_;
     allow_unauthenticated_identities = allow_unauthenticated_identities_;
     identity_pool_name = identity_pool_name_;
     identity_pool_id = identity_pool_id_
   } : identity_pool)
let make_untag_resource_response () = (() : untag_resource_response)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_unprocessed_identity_id
  ?error_code:(error_code_ : error_code option) 
  ?identity_id:(identity_id_ : string option)  () =
  ({ error_code = error_code_; identity_id = identity_id_ } : unprocessed_identity_id)
let make_unlink_identity_input
  ~logins_to_remove:(logins_to_remove_ : string list) 
  ~logins:(logins_ : logins_map)  ~identity_id:(identity_id_ : string)  () =
  ({
     logins_to_remove = logins_to_remove_;
     logins = logins_;
     identity_id = identity_id_
   } : unlink_identity_input)
let make_unlink_developer_identity_input
  ~developer_user_identifier:(developer_user_identifier_ : string) 
  ~developer_provider_name:(developer_provider_name_ : string) 
  ~identity_pool_id:(identity_pool_id_ : string) 
  ~identity_id:(identity_id_ : string)  () =
  ({
     developer_user_identifier = developer_user_identifier_;
     developer_provider_name = developer_provider_name_;
     identity_pool_id = identity_pool_id_;
     identity_id = identity_id_
   } : unlink_developer_identity_input)
let make_tag_resource_response () = (() : tag_resource_response)
let make_tag_resource_input ~tags:(tags_ : identity_pool_tags_type) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_set_principal_tag_attribute_map_response
  ?principal_tags:(principal_tags_ : principal_tags option) 
  ?use_defaults:(use_defaults_ : bool option) 
  ?identity_provider_name:(identity_provider_name_ : string option) 
  ?identity_pool_id:(identity_pool_id_ : string option)  () =
  ({
     principal_tags = principal_tags_;
     use_defaults = use_defaults_;
     identity_provider_name = identity_provider_name_;
     identity_pool_id = identity_pool_id_
   } : set_principal_tag_attribute_map_response)
let make_set_principal_tag_attribute_map_input
  ?principal_tags:(principal_tags_ : principal_tags option) 
  ?use_defaults:(use_defaults_ : bool option) 
  ~identity_provider_name:(identity_provider_name_ : string) 
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     principal_tags = principal_tags_;
     use_defaults = use_defaults_;
     identity_provider_name = identity_provider_name_;
     identity_pool_id = identity_pool_id_
   } : set_principal_tag_attribute_map_input)
let make_mapping_rule ~role_ar_n:(role_ar_n_ : string) 
  ~value:(value_ : string) 
  ~match_type:(match_type_ : mapping_rule_match_type) 
  ~claim:(claim_ : string)  () =
  ({
     role_ar_n = role_ar_n_;
     value = value_;
     match_type = match_type_;
     claim = claim_
   } : mapping_rule)
let make_rules_configuration_type ~rules:(rules_ : mapping_rule list)  () =
  ({ rules = rules_ } : rules_configuration_type)
let make_role_mapping
  ?rules_configuration:(rules_configuration_ :
                         rules_configuration_type option)
   ?ambiguous_role_resolution:(ambiguous_role_resolution_ :
                                ambiguous_role_resolution_type option)
   ~type_:(type__ : role_mapping_type)  () =
  ({
     rules_configuration = rules_configuration_;
     ambiguous_role_resolution = ambiguous_role_resolution_;
     type_ = type__
   } : role_mapping)
let make_set_identity_pool_roles_input
  ?role_mappings:(role_mappings_ : role_mapping_map option) 
  ~roles:(roles_ : roles_map)  ~identity_pool_id:(identity_pool_id_ : string)
   () =
  ({
     role_mappings = role_mappings_;
     roles = roles_;
     identity_pool_id = identity_pool_id_
   } : set_identity_pool_roles_input)
let make_merge_developer_identities_response
  ?identity_id:(identity_id_ : string option)  () =
  ({ identity_id = identity_id_ } : merge_developer_identities_response)
let make_merge_developer_identities_input
  ~identity_pool_id:(identity_pool_id_ : string) 
  ~developer_provider_name:(developer_provider_name_ : string) 
  ~destination_user_identifier:(destination_user_identifier_ : string) 
  ~source_user_identifier:(source_user_identifier_ : string)  () =
  ({
     identity_pool_id = identity_pool_id_;
     developer_provider_name = developer_provider_name_;
     destination_user_identifier = destination_user_identifier_;
     source_user_identifier = source_user_identifier_
   } : merge_developer_identities_input)
let make_lookup_developer_identity_response
  ?next_token:(next_token_ : string option) 
  ?developer_user_identifier_list:(developer_user_identifier_list_ :
                                    string list option)
   ?identity_id:(identity_id_ : string option)  () =
  ({
     next_token = next_token_;
     developer_user_identifier_list = developer_user_identifier_list_;
     identity_id = identity_id_
   } : lookup_developer_identity_response)
let make_lookup_developer_identity_input
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?developer_user_identifier:(developer_user_identifier_ : string option) 
  ?identity_id:(identity_id_ : string option) 
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     developer_user_identifier = developer_user_identifier_;
     identity_id = identity_id_;
     identity_pool_id = identity_pool_id_
   } : lookup_developer_identity_input)
let make_list_tags_for_resource_response
  ?tags:(tags_ : identity_pool_tags_type option)  () =
  ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : string) 
  () = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_identity_pool_short_description
  ?identity_pool_name:(identity_pool_name_ : string option) 
  ?identity_pool_id:(identity_pool_id_ : string option)  () =
  ({
     identity_pool_name = identity_pool_name_;
     identity_pool_id = identity_pool_id_
   } : identity_pool_short_description)
let make_list_identity_pools_response
  ?next_token:(next_token_ : string option) 
  ?identity_pools:(identity_pools_ :
                    identity_pool_short_description list option)
   () =
  ({ next_token = next_token_; identity_pools = identity_pools_ } : list_identity_pools_response)
let make_list_identity_pools_input ?next_token:(next_token_ : string option) 
  ~max_results:(max_results_ : int)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_identity_pools_input)
let make_identity_description
  ?last_modified_date:(last_modified_date_ : CoreTypes.Timestamp.t option) 
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option) 
  ?logins:(logins_ : string list option) 
  ?identity_id:(identity_id_ : string option)  () =
  ({
     last_modified_date = last_modified_date_;
     creation_date = creation_date_;
     logins = logins_;
     identity_id = identity_id_
   } : identity_description)
let make_list_identities_response ?next_token:(next_token_ : string option) 
  ?identities:(identities_ : identity_description list option) 
  ?identity_pool_id:(identity_pool_id_ : string option)  () =
  ({
     next_token = next_token_;
     identities = identities_;
     identity_pool_id = identity_pool_id_
   } : list_identities_response)
let make_list_identities_input ?hide_disabled:(hide_disabled_ : bool option) 
  ?next_token:(next_token_ : string option) 
  ~max_results:(max_results_ : int) 
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     hide_disabled = hide_disabled_;
     next_token = next_token_;
     max_results = max_results_;
     identity_pool_id = identity_pool_id_
   } : list_identities_input)
let make_get_principal_tag_attribute_map_response
  ?principal_tags:(principal_tags_ : principal_tags option) 
  ?use_defaults:(use_defaults_ : bool option) 
  ?identity_provider_name:(identity_provider_name_ : string option) 
  ?identity_pool_id:(identity_pool_id_ : string option)  () =
  ({
     principal_tags = principal_tags_;
     use_defaults = use_defaults_;
     identity_provider_name = identity_provider_name_;
     identity_pool_id = identity_pool_id_
   } : get_principal_tag_attribute_map_response)
let make_get_principal_tag_attribute_map_input
  ~identity_provider_name:(identity_provider_name_ : string) 
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     identity_provider_name = identity_provider_name_;
     identity_pool_id = identity_pool_id_
   } : get_principal_tag_attribute_map_input)
let make_get_open_id_token_response ?token:(token_ : string option) 
  ?identity_id:(identity_id_ : string option)  () =
  ({ token = token_; identity_id = identity_id_ } : get_open_id_token_response)
let make_get_open_id_token_input ?logins:(logins_ : logins_map option) 
  ~identity_id:(identity_id_ : string)  () =
  ({ logins = logins_; identity_id = identity_id_ } : get_open_id_token_input)
let make_get_open_id_token_for_developer_identity_response
  ?token:(token_ : string option) 
  ?identity_id:(identity_id_ : string option)  () =
  ({ token = token_; identity_id = identity_id_ } : get_open_id_token_for_developer_identity_response)
let make_get_open_id_token_for_developer_identity_input
  ?token_duration:(token_duration_ : int option) 
  ?principal_tags:(principal_tags_ : principal_tags option) 
  ?identity_id:(identity_id_ : string option)  ~logins:(logins_ : logins_map)
   ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     token_duration = token_duration_;
     principal_tags = principal_tags_;
     logins = logins_;
     identity_id = identity_id_;
     identity_pool_id = identity_pool_id_
   } : get_open_id_token_for_developer_identity_input)
let make_get_identity_pool_roles_response
  ?role_mappings:(role_mappings_ : role_mapping_map option) 
  ?roles:(roles_ : roles_map option) 
  ?identity_pool_id:(identity_pool_id_ : string option)  () =
  ({
     role_mappings = role_mappings_;
     roles = roles_;
     identity_pool_id = identity_pool_id_
   } : get_identity_pool_roles_response)
let make_get_identity_pool_roles_input
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({ identity_pool_id = identity_pool_id_ } : get_identity_pool_roles_input)
let make_get_id_response ?identity_id:(identity_id_ : string option)  () =
  ({ identity_id = identity_id_ } : get_id_response)
let make_get_id_input ?logins:(logins_ : logins_map option) 
  ?account_id:(account_id_ : string option) 
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({
     logins = logins_;
     identity_pool_id = identity_pool_id_;
     account_id = account_id_
   } : get_id_input)
let make_credentials ?expiration:(expiration_ : CoreTypes.Timestamp.t option)
   ?session_token:(session_token_ : string option) 
  ?secret_key:(secret_key_ : string option) 
  ?access_key_id:(access_key_id_ : string option)  () =
  ({
     expiration = expiration_;
     session_token = session_token_;
     secret_key = secret_key_;
     access_key_id = access_key_id_
   } : credentials)
let make_get_credentials_for_identity_response
  ?credentials:(credentials_ : credentials option) 
  ?identity_id:(identity_id_ : string option)  () =
  ({ credentials = credentials_; identity_id = identity_id_ } : get_credentials_for_identity_response)
let make_get_credentials_for_identity_input
  ?custom_role_arn:(custom_role_arn_ : string option) 
  ?logins:(logins_ : logins_map option)  ~identity_id:(identity_id_ : string)
   () =
  ({
     custom_role_arn = custom_role_arn_;
     logins = logins_;
     identity_id = identity_id_
   } : get_credentials_for_identity_input)
let make_describe_identity_pool_input
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({ identity_pool_id = identity_pool_id_ } : describe_identity_pool_input)
let make_describe_identity_input ~identity_id:(identity_id_ : string)  () =
  ({ identity_id = identity_id_ } : describe_identity_input)
let make_delete_identity_pool_input
  ~identity_pool_id:(identity_pool_id_ : string)  () =
  ({ identity_pool_id = identity_pool_id_ } : delete_identity_pool_input)
let make_delete_identities_response
  ?unprocessed_identity_ids:(unprocessed_identity_ids_ :
                              unprocessed_identity_id list option)
   () =
  ({ unprocessed_identity_ids = unprocessed_identity_ids_ } : delete_identities_response)
let make_delete_identities_input
  ~identity_ids_to_delete:(identity_ids_to_delete_ : string list)  () =
  ({ identity_ids_to_delete = identity_ids_to_delete_ } : delete_identities_input)
let make_create_identity_pool_input
  ?identity_pool_tags:(identity_pool_tags_ : identity_pool_tags_type option) 
  ?saml_provider_ar_ns:(saml_provider_ar_ns_ : string list option) 
  ?cognito_identity_providers:(cognito_identity_providers_ :
                                cognito_identity_provider list option)
   ?open_id_connect_provider_ar_ns:(open_id_connect_provider_ar_ns_ :
                                     string list option)
   ?developer_provider_name:(developer_provider_name_ : string option) 
  ?supported_login_providers:(supported_login_providers_ :
                               identity_providers option)
   ?allow_classic_flow:(allow_classic_flow_ : bool option) 
  ~allow_unauthenticated_identities:(allow_unauthenticated_identities_ :
                                      bool)
   ~identity_pool_name:(identity_pool_name_ : string)  () =
  ({
     identity_pool_tags = identity_pool_tags_;
     saml_provider_ar_ns = saml_provider_ar_ns_;
     cognito_identity_providers = cognito_identity_providers_;
     open_id_connect_provider_ar_ns = open_id_connect_provider_ar_ns_;
     developer_provider_name = developer_provider_name_;
     supported_login_providers = supported_login_providers_;
     allow_classic_flow = allow_classic_flow_;
     allow_unauthenticated_identities = allow_unauthenticated_identities_;
     identity_pool_name = identity_pool_name_
   } : create_identity_pool_input)