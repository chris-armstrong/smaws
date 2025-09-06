open Types
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
     "Updates the configuration of an identity pool.\n\n  If you don't provide a value for a parameter, Amazon Cognito sets it to its default value. \n  \n    You must use Amazon Web Services developer credentials to call this operation.\n    "]