(** 
    Cognito Identity client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  identity_pool_name: string }(** {1:builders Builders} *)

val make_cognito_identity_provider :
  ?server_side_token_check:bool ->
    ?client_id:string ->
      ?provider_name:string -> unit -> cognito_identity_provider
val make_identity_pool :
  ?identity_pool_tags:identity_pool_tags_type ->
    ?saml_provider_ar_ns:string list ->
      ?cognito_identity_providers:cognito_identity_provider list ->
        ?open_id_connect_provider_ar_ns:string list ->
          ?developer_provider_name:string ->
            ?supported_login_providers:identity_providers ->
              ?allow_classic_flow:bool ->
                allow_unauthenticated_identities:bool ->
                  identity_pool_name:string ->
                    identity_pool_id:string -> unit -> identity_pool
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit -> untag_resource_input
val make_unprocessed_identity_id :
  ?error_code:error_code ->
    ?identity_id:string -> unit -> unprocessed_identity_id
val make_unlink_identity_input :
  logins_to_remove:string list ->
    logins:logins_map -> identity_id:string -> unit -> unlink_identity_input
val make_unlink_developer_identity_input :
  developer_user_identifier:string ->
    developer_provider_name:string ->
      identity_pool_id:string ->
        identity_id:string -> unit -> unlink_developer_identity_input
val make_tag_resource_response : unit -> tag_resource_response
val make_tag_resource_input :
  tags:identity_pool_tags_type ->
    resource_arn:string -> unit -> tag_resource_input
val make_set_principal_tag_attribute_map_response :
  ?principal_tags:principal_tags ->
    ?use_defaults:bool ->
      ?identity_provider_name:string ->
        ?identity_pool_id:string ->
          unit -> set_principal_tag_attribute_map_response
val make_set_principal_tag_attribute_map_input :
  ?principal_tags:principal_tags ->
    ?use_defaults:bool ->
      identity_provider_name:string ->
        identity_pool_id:string ->
          unit -> set_principal_tag_attribute_map_input
val make_mapping_rule :
  role_ar_n:string ->
    value:string ->
      match_type:mapping_rule_match_type ->
        claim:string -> unit -> mapping_rule
val make_rules_configuration_type :
  rules:mapping_rule list -> unit -> rules_configuration_type
val make_role_mapping :
  ?rules_configuration:rules_configuration_type ->
    ?ambiguous_role_resolution:ambiguous_role_resolution_type ->
      type_:role_mapping_type -> unit -> role_mapping
val make_set_identity_pool_roles_input :
  ?role_mappings:role_mapping_map ->
    roles:roles_map ->
      identity_pool_id:string -> unit -> set_identity_pool_roles_input
val make_merge_developer_identities_response :
  ?identity_id:string -> unit -> merge_developer_identities_response
val make_merge_developer_identities_input :
  identity_pool_id:string ->
    developer_provider_name:string ->
      destination_user_identifier:string ->
        source_user_identifier:string ->
          unit -> merge_developer_identities_input
val make_lookup_developer_identity_response :
  ?next_token:string ->
    ?developer_user_identifier_list:string list ->
      ?identity_id:string -> unit -> lookup_developer_identity_response
val make_lookup_developer_identity_input :
  ?next_token:string ->
    ?max_results:int ->
      ?developer_user_identifier:string ->
        ?identity_id:string ->
          identity_pool_id:string -> unit -> lookup_developer_identity_input
val make_list_tags_for_resource_response :
  ?tags:identity_pool_tags_type -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_input :
  resource_arn:string -> unit -> list_tags_for_resource_input
val make_identity_pool_short_description :
  ?identity_pool_name:string ->
    ?identity_pool_id:string -> unit -> identity_pool_short_description
val make_list_identity_pools_response :
  ?next_token:string ->
    ?identity_pools:identity_pool_short_description list ->
      unit -> list_identity_pools_response
val make_list_identity_pools_input :
  ?next_token:string -> max_results:int -> unit -> list_identity_pools_input
val make_identity_description :
  ?last_modified_date:CoreTypes.Timestamp.t ->
    ?creation_date:CoreTypes.Timestamp.t ->
      ?logins:string list ->
        ?identity_id:string -> unit -> identity_description
val make_list_identities_response :
  ?next_token:string ->
    ?identities:identity_description list ->
      ?identity_pool_id:string -> unit -> list_identities_response
val make_list_identities_input :
  ?hide_disabled:bool ->
    ?next_token:string ->
      max_results:int ->
        identity_pool_id:string -> unit -> list_identities_input
val make_get_principal_tag_attribute_map_response :
  ?principal_tags:principal_tags ->
    ?use_defaults:bool ->
      ?identity_provider_name:string ->
        ?identity_pool_id:string ->
          unit -> get_principal_tag_attribute_map_response
val make_get_principal_tag_attribute_map_input :
  identity_provider_name:string ->
    identity_pool_id:string -> unit -> get_principal_tag_attribute_map_input
val make_get_open_id_token_response :
  ?token:string -> ?identity_id:string -> unit -> get_open_id_token_response
val make_get_open_id_token_input :
  ?logins:logins_map -> identity_id:string -> unit -> get_open_id_token_input
val make_get_open_id_token_for_developer_identity_response :
  ?token:string ->
    ?identity_id:string ->
      unit -> get_open_id_token_for_developer_identity_response
val make_get_open_id_token_for_developer_identity_input :
  ?token_duration:int ->
    ?principal_tags:principal_tags ->
      ?identity_id:string ->
        logins:logins_map ->
          identity_pool_id:string ->
            unit -> get_open_id_token_for_developer_identity_input
val make_get_identity_pool_roles_response :
  ?role_mappings:role_mapping_map ->
    ?roles:roles_map ->
      ?identity_pool_id:string -> unit -> get_identity_pool_roles_response
val make_get_identity_pool_roles_input :
  identity_pool_id:string -> unit -> get_identity_pool_roles_input
val make_get_id_response : ?identity_id:string -> unit -> get_id_response
val make_get_id_input :
  ?logins:logins_map ->
    ?account_id:string -> identity_pool_id:string -> unit -> get_id_input
val make_credentials :
  ?expiration:CoreTypes.Timestamp.t ->
    ?session_token:string ->
      ?secret_key:string -> ?access_key_id:string -> unit -> credentials
val make_get_credentials_for_identity_response :
  ?credentials:credentials ->
    ?identity_id:string -> unit -> get_credentials_for_identity_response
val make_get_credentials_for_identity_input :
  ?custom_role_arn:string ->
    ?logins:logins_map ->
      identity_id:string -> unit -> get_credentials_for_identity_input
val make_describe_identity_pool_input :
  identity_pool_id:string -> unit -> describe_identity_pool_input
val make_describe_identity_input :
  identity_id:string -> unit -> describe_identity_input
val make_delete_identity_pool_input :
  identity_pool_id:string -> unit -> delete_identity_pool_input
val make_delete_identities_response :
  ?unprocessed_identity_ids:unprocessed_identity_id list ->
    unit -> delete_identities_response
val make_delete_identities_input :
  identity_ids_to_delete:string list -> unit -> delete_identities_input
val make_create_identity_pool_input :
  ?identity_pool_tags:identity_pool_tags_type ->
    ?saml_provider_ar_ns:string list ->
      ?cognito_identity_providers:cognito_identity_provider list ->
        ?open_id_connect_provider_ar_ns:string list ->
          ?developer_provider_name:string ->
            ?supported_login_providers:identity_providers ->
              ?allow_classic_flow:bool ->
                allow_unauthenticated_identities:bool ->
                  identity_pool_name:string ->
                    unit -> create_identity_pool_input(** {1:operations Operations} *)

module CreateIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      create_identity_pool_input ->
        (identity_pool,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Creates a new identity pool. The identity pool is a store of user identity information that is specific to your AWS account. The keys for [SupportedLoginProviders] are as follows:
    
     {ul
          {- Facebook: [graph.facebook.com]
             
             }
           {- Google: [accounts.google.com]
              
              }
           {- Amazon: [www.amazon.com]
              
              }
           {- Twitter: [api.twitter.com]
              
              }
           {- Digits: [www.digits.com]
              
              }
          
      }
       You must use AWS Developer credentials to call this API.
        *)

  
end

module DeleteIdentities : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identities_input ->
        (delete_identities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module DeleteIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identity_pool_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module DescribeIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_input ->
        (identity_description,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Returns metadata related to the given identity, including when the identity was created and any associated linked logins.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module DescribeIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_pool_input ->
        (identity_pool,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module GetCredentialsForIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      get_credentials_for_identity_input ->
        (get_credentials_for_identity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidIdentityPoolConfigurationException of invalid_identity_pool_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the appropriate role for the token.
    
     This is a public API. You do not need any credentials to call this API.
      *)

  
end

module GetId : sig
  val request :
    Smaws_Lib.Context.t ->
      get_id_input ->
        (get_id_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.
    
     This is a public API. You do not need any credentials to call this API.
      *)

  
end

module GetIdentityPoolRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_identity_pool_roles_input ->
        (get_identity_pool_roles_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Gets the roles for an identity pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module GetOpenIdToken : sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_input ->
        (get_open_id_token_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by [GetId]. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.
    
     The OpenID token is valid for 10 minutes.
     
      This is a public API. You do not need any credentials to call this API.
       *)

  
end

module GetOpenIdTokenForDeveloperIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_for_developer_identity_input ->
        (get_open_id_token_for_developer_identity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DeveloperUserAlreadyRegisteredException of developer_user_already_registered_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    Registers (or retrieves) a Cognito [IdentityId] and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the [Logins] map, which is linked to the identity pool. The developer provider is the "domain" by which Cognito will refer to your users.
    
     You can use [GetOpenIdTokenForDeveloperIdentity] to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the [IdentityId] should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing [IdentityId]. This API will create the identity in the specified [IdentityPoolId].
     
      You must use AWS Developer credentials to call this API.
       |}]

  
end

module GetPrincipalTagAttributeMap : sig
  val request :
    Smaws_Lib.Context.t ->
      get_principal_tag_attribute_map_input ->
        (get_principal_tag_attribute_map_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Use [GetPrincipalTagAttributeMap] to list all mappings between [PrincipalTags] and user attributes.
     *)

  
end

module ListIdentities : sig
  val request :
    Smaws_Lib.Context.t ->
      list_identities_input ->
        (list_identities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Lists the identities in an identity pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module ListIdentityPools : sig
  val request :
    Smaws_Lib.Context.t ->
      list_identity_pools_input ->
        (list_identity_pools_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Lists all of the Cognito identity pools registered for your account.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Lists the tags that are assigned to an Amazon Cognito identity pool.
    
     A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.
     
      You can use this action up to 10 times per second, per account.
       *)

  
end

module LookupDeveloperIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_developer_identity_input ->
        (lookup_developer_identity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Retrieves the [IdentityID] associated with a [DeveloperUserIdentifier] or the list of [DeveloperUserIdentifier] values associated with an [IdentityId] for an existing identity. Either [IdentityID] or [DeveloperUserIdentifier] must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, [DeveloperUserIdentifier] will be matched against [IdentityID]. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise a [ResourceConflictException] is thrown.
    
     [LookupDeveloperIdentity] is intended for low-throughput control plane operations: for example, to enable customer service to locate an identity ID by username. If you are using it for higher-volume operations such as user authentication, your requests are likely to be throttled. [GetOpenIdTokenForDeveloperIdentity] is a better option for higher-volume operations for user authentication.
     
      You must use AWS Developer credentials to call this API.
       *)

  
end

module MergeDeveloperIdentities : sig
  val request :
    Smaws_Lib.Context.t ->
      merge_developer_identities_input ->
        (merge_developer_identities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Merges two users having different [IdentityId]s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user ([SourceUserIdentifier]) with the [IdentityId] of the [DestinationUserIdentifier]. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.
    
     The number of linked logins is limited to 20. So, the number of linked logins for the source user, [SourceUserIdentifier], and the destination user, [DestinationUserIdentifier], together should not be larger than 20. Otherwise, an exception will be thrown.
     
      You must use AWS Developer credentials to call this API.
       *)

  
end

module SetIdentityPoolRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      set_identity_pool_roles_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Sets the roles for an identity pool. These roles are used when making calls to [GetCredentialsForIdentity] action.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module SetPrincipalTagAttributeMap : sig
  val request :
    Smaws_Lib.Context.t ->
      set_principal_tag_attribute_map_input ->
        (set_principal_tag_attribute_map_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    You can use this operation to use default (username and clientID) attribute or custom attribute mappings.
     *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Assigns a set of tags to the specified Amazon Cognito identity pool. A tag is a label that you can use to categorize and manage identity pools in different ways, such as by purpose, owner, environment, or other criteria.
    
     Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of an identity pool, one for testing and another for production, you might assign an [Environment] tag key to both identity pools. The value of this key might be [Test] for one identity pool and [Production] for the other.
     
      Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your identity pools. In an IAM policy, you can constrain permissions for identity pools based on specific tags or tag values.
      
       You can use this action up to 5 times per second, per account. An identity pool can have as many as 50 tags.
        *)

  
end

module UnlinkDeveloperIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_developer_identity_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Unlinks a [DeveloperUserIdentifier] from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

module UnlinkIdentity : sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_identity_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExternalServiceException of external_service_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.
    
     This is a public API. You do not need any credentials to call this API.
      *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Removes the specified tags from the specified Amazon Cognito identity pool. You can use this action up to 5 times per second, per account
     *)

  
end

module UpdateIdentityPool : sig
  val request :
    Smaws_Lib.Context.t ->
      identity_pool ->
        (identity_pool,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NotAuthorizedException of not_authorized_exception
            | `ResourceConflictException of resource_conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyRequestsException of too_many_requests_exception
            
        ]
      ) result
  (** 
    Updates an identity pool.
    
     You must use AWS Developer credentials to call this API.
      *)

  
end

