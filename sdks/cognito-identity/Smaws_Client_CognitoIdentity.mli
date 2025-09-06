(** 
    Cognito Identity client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module CreateIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_identity_pool_input ->
        (identity_pool,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Creates a new identity pool. The identity pool is a store of user identity information that is specific to your Amazon Web Services account. The keys for [SupportedLoginProviders] are as follows:\n\n {ul\n       {-  Facebook: [graph.facebook.com] \n           \n            }\n       {-  Google: [accounts.google.com] \n           \n            }\n       {-  Sign in With Apple: [appleid.apple.com] \n           \n            }\n       {-  Amazon: [www.amazon.com] \n           \n            }\n       {-  Twitter: [api.twitter.com] \n           \n            }\n       {-  Digits: [www.digits.com] \n           \n            }\n       }\n    If you don't provide a value for a parameter, Amazon Cognito sets it to its default value. \n    \n      You must use Amazon Web Services developer credentials to call this operation.\n      "]
module DeleteIdentities :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identities_input ->
        (delete_identities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to delete.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module DeleteIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identity_pool_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the pool.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module DescribeIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_input ->
        (identity_description,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Returns metadata related to the given identity, including when the identity was created and any associated linked logins.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module DescribeIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_pool_input ->
        (identity_pool,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Gets details about a particular identity pool, including the pool name, ID description, creation date, and current number of users.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module GetCredentialsForIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_credentials_for_identity_input ->
        (get_credentials_for_identity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidIdentityPoolConfigurationException of
              invalid_identity_pool_configuration_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. If the token is for [cognito-identity.amazonaws.com], it will be passed through to Security Token Service with the appropriate role for the token.\n\n This is a public API. You do not need any credentials to call this API.\n "]
module GetId :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_id_input ->
        (get_id_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Generates (or retrieves) IdentityID. Supplying multiple logins will create an implicit linked account.\n\n This is a public API. You do not need any credentials to call this API.\n "]
module GetIdentityPoolRoles :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_identity_pool_roles_input ->
        (get_identity_pool_roles_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Gets the roles for an identity pool.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module GetOpenIdToken :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_input ->
        (get_open_id_token_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by [GetId]. You can optionally add additional logins for the identity. Supplying multiple logins creates an implicit link.\n\n The OpenID token is valid for 10 minutes.\n \n  This is a public API. You do not need any credentials to call this API.\n  "]
module GetOpenIdTokenForDeveloperIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_open_id_token_for_developer_identity_input ->
        (get_open_id_token_for_developer_identity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DeveloperUserAlreadyRegisteredException of
              developer_user_already_registered_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Registers (or retrieves) a Cognito [IdentityId] and an OpenID Connect token for a user authenticated by your backend authentication process. Supplying multiple logins will create an implicit linked account. You can only specify one developer provider as part of the [Logins] map, which is linked to the identity pool. The developer provider is the \"domain\" by which Cognito will refer to your users.\n\n You can use [GetOpenIdTokenForDeveloperIdentity] to create a new identity and to link new logins (that is, user credentials issued by a public provider or developer provider) to an existing identity. When you want to create a new identity, the [IdentityId] should be null. When you want to associate a new login with an existing authenticated/unauthenticated identity, you can do so by providing the existing [IdentityId]. This API will create the identity in the specified [IdentityPoolId].\n \n  You must use Amazon Web Services developer credentials to call this operation.\n  "]
module GetPrincipalTagAttributeMap :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_principal_tag_attribute_map_input ->
        (get_principal_tag_attribute_map_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Use [GetPrincipalTagAttributeMap] to list all mappings between [PrincipalTags] and user attributes.\n"]
module ListIdentities :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_identities_input ->
        (list_identities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Lists the identities in an identity pool.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module ListIdentityPools :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_identity_pools_input ->
        (list_identity_pools_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Lists all of the Cognito identity pools registered for your account.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Lists the tags that are assigned to an Amazon Cognito identity pool.\n\n A tag is a label that you can apply to identity pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.\n \n  You can use this action up to 10 times per second, per account.\n  "]
module LookupDeveloperIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_developer_identity_input ->
        (lookup_developer_identity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Retrieves the [IdentityID] associated with a [DeveloperUserIdentifier] or the list of [DeveloperUserIdentifier] values associated with an [IdentityId] for an existing identity. Either [IdentityID] or [DeveloperUserIdentifier] must not be null. If you supply only one of these values, the other value will be searched in the database and returned as a part of the response. If you supply both, [DeveloperUserIdentifier] will be matched against [IdentityID]. If the values are verified against the database, the response returns both values and is the same as the request. Otherwise, a [ResourceConflictException] is thrown.\n\n  [LookupDeveloperIdentity] is intended for low-throughput control plane operations: for example, to enable customer service to locate an identity ID by username. If you are using it for higher-volume operations such as user authentication, your requests are likely to be throttled. [GetOpenIdTokenForDeveloperIdentity] is a better option for higher-volume operations for user authentication.\n \n  You must use Amazon Web Services developer credentials to call this operation.\n  "]
module MergeDeveloperIdentities :
sig
  val request :
    Smaws_Lib.Context.t ->
      merge_developer_identities_input ->
        (merge_developer_identities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Merges two users having different [IdentityId]s, existing in the same identity pool, and identified by the same developer provider. You can use this action to request that discrete users be merged and identified as a single user in the Cognito environment. Cognito associates the given source user ([SourceUserIdentifier]) with the [IdentityId] of the [DestinationUserIdentifier]. Only developer-authenticated users can be merged. If the users to be merged are associated with the same public provider, but as two different users, an exception will be thrown.\n\n The number of linked logins is limited to 20. So, the number of linked logins for the source user, [SourceUserIdentifier], and the destination user, [DestinationUserIdentifier], together should not be larger than 20. Otherwise, an exception will be thrown.\n \n  You must use Amazon Web Services developer credentials to call this operation.\n  "]
module SetIdentityPoolRoles :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_identity_pool_roles_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Sets the roles for an identity pool. These roles are used when making calls to [GetCredentialsForIdentity] action.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module SetPrincipalTagAttributeMap :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_principal_tag_attribute_map_input ->
        (set_principal_tag_attribute_map_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "You can use this operation to use default (username and clientID) attribute or custom attribute mappings.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Assigns a set of tags to the specified Amazon Cognito identity pool. A tag is a label that you can use to categorize and manage identity pools in different ways, such as by purpose, owner, environment, or other criteria.\n\n Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of an identity pool, one for testing and another for production, you might assign an [Environment] tag key to both identity pools. The value of this key might be [Test] for one identity pool and [Production] for the other.\n \n  Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your identity pools. In an IAM policy, you can constrain permissions for identity pools based on specific tags or tag values.\n  \n   You can use this action up to 5 times per second, per account. An identity pool can have as many as 50 tags.\n   "]
module UnlinkDeveloperIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_developer_identity_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Unlinks a [DeveloperUserIdentifier] from an existing identity. Unlinked developer users will be considered new identities next time they are seen. If, for a given Cognito identity, you remove all federated identities as well as the developer user identifier, the Cognito identity becomes inaccessible.\n\n You must use Amazon Web Services developer credentials to call this operation.\n "]
module UnlinkIdentity :
sig
  val request :
    Smaws_Lib.Context.t ->
      unlink_identity_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExternalServiceException of external_service_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Unlinks a federated identity from an existing account. Unlinked logins will be considered new identities next time they are seen. Removing the last linked login will make this identity inaccessible.\n\n This is a public API. You do not need any credentials to call this API.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Removes the specified tags from the specified Amazon Cognito identity pool. You can use this action up to 5 times per second, per account\n"]
module UpdateIdentityPool :
sig
  val request :
    Smaws_Lib.Context.t ->
      identity_pool ->
        (identity_pool,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NotAuthorizedException of not_authorized_exception 
          | `ResourceConflictException of resource_conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyRequestsException of too_many_requests_exception ])
          result
end[@@ocaml.doc
     "Updates the configuration of an identity pool.\n\n  If you don't provide a value for a parameter, Amazon Cognito sets it to its default value. \n  \n    You must use Amazon Web Services developer credentials to call this operation.\n    "](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
