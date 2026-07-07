open Types

module BatchGetPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_policy_input ->
    (batch_get_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_policy_input ->
    ( batch_get_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a group (batch) of policies.\n\n\
  \  The [BatchGetPolicy] operation doesn't have its own IAM permission. To authorize this \
   operation for Amazon Web Services principals, include the permission \
   [verifiedpermissions:GetPolicy] in their IAM policies.\n\
  \  \n\
  \   "]

module BatchIsAuthorized : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_is_authorized_input ->
    ( batch_is_authorized_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_is_authorized_input ->
    ( batch_is_authorized_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Makes a series of decisions about multiple authorization requests for one principal or \
   resource. Each request contains the equivalent content of an [IsAuthorized] request: principal, \
   action, resource, and context. Either the [principal] or the [resource] parameter must be \
   identical across all requests. For example, Verified Permissions won't evaluate a pair of \
   requests where [bob] views [photo1] and [alice] views [photo2]. Authorization of [bob] to view \
   [photo1] and [photo2], or [bob] and [alice] to view [photo1], are valid batches. \n\n\
  \ The request is evaluated against all policies in the specified policy store that match the \
   entities that you declare. The result of the decisions is a series of [Allow] or [Deny] \
   responses, along with the IDs of the policies that produced each decision.\n\
  \ \n\
  \  The [entities] of a [BatchIsAuthorized] API request can contain up to 100 principals and up \
   to 100 resources. The [requests] of a [BatchIsAuthorized] API request can contain up to 30 \
   requests.\n\
  \  \n\
  \    The [BatchIsAuthorized] operation doesn't have its own IAM permission. To authorize this \
   operation for Amazon Web Services principals, include the permission \
   [verifiedpermissions:IsAuthorized] in their IAM policies.\n\
  \    \n\
  \     "]

module BatchIsAuthorizedWithToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_is_authorized_with_token_input ->
    ( batch_is_authorized_with_token_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_is_authorized_with_token_input ->
    ( batch_is_authorized_with_token_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Makes a series of decisions about multiple authorization requests for one token. The principal \
   in this request comes from an external identity source in the form of an identity or access \
   token, formatted as a {{:https://wikipedia.org/wiki/JSON_Web_Token}JSON web token (JWT)}. The \
   information in the parameters can also define additional context that Verified Permissions can \
   include in the evaluations.\n\n\
  \ The request is evaluated against all policies in the specified policy store that match the \
   entities that you provide in the entities declaration and in the token. The result of the \
   decisions is a series of [Allow] or [Deny] responses, along with the IDs of the policies that \
   produced each decision.\n\
  \ \n\
  \  The [entities] of a [BatchIsAuthorizedWithToken] API request can contain up to 100 resources \
   and up to 99 user groups. The [requests] of a [BatchIsAuthorizedWithToken] API request can \
   contain up to 30 requests.\n\
  \  \n\
  \    The [BatchIsAuthorizedWithToken] operation doesn't have its own IAM permission. To \
   authorize this operation for Amazon Web Services principals, include the permission \
   [verifiedpermissions:IsAuthorizedWithToken] in their IAM policies.\n\
  \    \n\
  \     "]

module CreateIdentitySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_identity_source_input ->
    ( create_identity_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_identity_source_input ->
    ( create_identity_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an identity source to a policy store\226\128\147an Amazon Cognito user pool or OpenID \
   Connect (OIDC) identity provider (IdP). \n\n\
  \ After you create an identity source, you can use the identities provided by the IdP as proxies \
   for the principal in authorization queries that use the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken} \
   or \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_BatchIsAuthorizedWithToken.html}BatchIsAuthorizedWithToken} \
   API operations. These identities take the form of tokens that contain claims about the user, \
   such as IDs, attributes and group memberships. Identity sources provide identity (ID) tokens \
   and access tokens. Verified Permissions derives information about your user and session from \
   token claims. Access tokens provide action [context] to your policies, and ID tokens provide \
   principal [Attributes].\n\
  \ \n\
  \   Tokens from an identity source user continue to be usable until they expire. Token \
   revocation and resource deletion have no effect on the validity of a token in your policy store\n\
  \   \n\
  \      To reference a user from this identity source in your Cedar policies, refer to the \
   following syntax examples.\n\
  \      \n\
  \       {ul\n\
  \             {-  Amazon Cognito user pool: [Namespace::\\[Entity type\\]::\\[User pool \
   ID\\]|\\[user principal attribute\\]], for example \
   [MyCorp::User::us-east-1_EXAMPLE|a1b2c3d4-5678-90ab-cdef-EXAMPLE11111].\n\
  \                 \n\
  \                  }\n\
  \             {-  OpenID Connect (OIDC) provider: [Namespace::\\[Entity \
   type\\]::\\[entityIdPrefix\\]|\\[user principal attribute\\]], for example \
   [MyCorp::User::MyOIDCProvider|a1b2c3d4-5678-90ab-cdef-EXAMPLE22222].\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \     Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \     \n\
  \      "]

module CreatePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_input ->
    ( create_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_input ->
    ( create_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Cedar policy and saves it in the specified policy store. You can create either a \
   static policy or a policy linked to a policy template.\n\n\
  \ {ul\n\
  \       {-  To create a static policy, provide the Cedar policy text in the [StaticPolicy] \
   section of the [PolicyDefinition].\n\
  \           \n\
  \            }\n\
  \       {-  To create a policy that is dynamically linked to a policy template, specify the \
   policy template ID and the principal and resource to associate with this policy in the \
   [templateLinked] section of the [PolicyDefinition]. If the policy template is ever updated, any \
   policies linked to the policy template automatically use the updated template.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    Creating a policy causes it to be validated against the schema in the policy store. If the \
   policy doesn't pass validation, the operation fails and the policy isn't stored.\n\
  \    \n\
  \       Verified Permissions is {i  \
   {{:https://wikipedia.org/wiki/Eventual_consistency}eventually consistent} }. It can take a few \
   seconds for a new or changed element to propagate through the service and be visible in the \
   results of other Verified Permissions operations.\n\
  \       \n\
  \        "]

module CreatePolicyStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_store_input ->
    ( create_policy_store_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_store_input ->
    ( create_policy_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a policy store. A policy store is a container for policy resources.\n\n\
  \  As of May 2026, Verified Permissions has aligned with Cedar and now supports multiple \
   namespaces.\n\
  \  \n\
  \     Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \     \n\
  \      "]

module CreatePolicyStoreAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_store_alias_input ->
    ( create_policy_store_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_store_alias_input ->
    ( create_policy_store_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a policy store alias for the specified policy store. A policy store alias is an \
   alternative identifier that you can use to reference a policy store in API operations.\n\n\
  \ This operation is idempotent. If multiple CreatePolicyStoreAlias requests are made where the \
   [aliasName] and [policyStoreId] fields are the same between the requests, subsequent requests \
   will be ignored. For each duplicate CreatePolicyStoreAlias request, a Success response will be \
   returned and a new policy store alias will not be created.\n\
  \ \n\
  \   Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \   \n\
  \    "]

module CreatePolicyTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_template_input ->
    ( create_policy_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_template_input ->
    ( create_policy_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a policy template. A template can use placeholders for the principal and resource. A \
   template must be instantiated into a policy by associating it with specific principals and \
   resources to use for the placeholders. That instantiated policy can then be considered in \
   authorization decisions. The instantiated policy works identically to any other policy, except \
   that it is dynamically linked to the template. If the template changes, then any policies that \
   are linked to that template are immediately updated as well.\n\n\
  \  Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \  \n\
  \   "]

module DeleteIdentitySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_source_input ->
    ( delete_identity_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_source_input ->
    ( delete_identity_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an identity source that references an identity provider (IdP) such as Amazon Cognito. \
   After you delete the identity source, you can no longer use tokens for identities from that \
   identity source to represent principals in authorization queries made using \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_IsAuthorizedWithToken.html}IsAuthorizedWithToken}. \
   operations.\n"]

module DeletePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_input ->
    ( delete_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_input ->
    ( delete_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified policy from the policy store.\n\n\
  \ This operation is idempotent; if you specify a policy that doesn't exist, the request response \
   returns a successful [HTTP 200] status code.\n\
  \ "]

module DeletePolicyStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidStateException of invalid_state_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_store_input ->
    ( delete_policy_store_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidStateException of invalid_state_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_store_input ->
    ( delete_policy_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidStateException of invalid_state_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified policy store.\n\n\
  \ This operation is idempotent. If you specify a policy store that does not exist, the request \
   response will still return a successful HTTP 200 status code.\n\
  \ "]

module DeletePolicyStoreAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidStateException of invalid_state_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_store_alias_input ->
    ( delete_policy_store_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidStateException of invalid_state_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_store_alias_input ->
    ( delete_policy_store_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidStateException of invalid_state_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified policy store alias.\n\n\
  \ This operation is idempotent. If you specify a policy store alias that does not exist, the \
   request response will still return a successful HTTP 200 status code.\n\
  \ \n\
  \  By default, when a policy store alias is deleted, it enters the [PendingDeletion] state. When \
   a policy store alias is in the [PendingDeletion] state, new policy store aliases cannot be \
   created with the same name. If the policy store alias is used in an API that has a \
   [policyStoreId] field, the operation will fail with a [ResourceNotFound] exception.\n\
  \  \n\
  \   To immediately delete a policy store alias and bypass the [PendingDeletion] state, set the \
   [deletionMode] parameter to [HardDelete].\n\
  \   \n\
  \     Verified Permissions is eventually consistent. If you hard delete a policy store alias and \
   then immediately recreate it to be associated with a different policy store, requests that \
   reference this alias may continue to be evaluated against the previously associated policy \
   store for a short period of time.\n\
  \     \n\
  \      "]

module DeletePolicyTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_template_input ->
    ( delete_policy_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_template_input ->
    ( delete_policy_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified policy template from the policy store.\n\n\
  \  This operation also deletes any policies that were created from the specified policy \
   template. Those policies are immediately removed from all future API responses, and are \
   asynchronously deleted from the policy store.\n\
  \  \n\
  \   "]

module GetIdentitySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_source_input ->
    ( get_identity_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_source_input ->
    ( get_identity_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details about the specified identity source.\n"]

module GetPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_input ->
    ( get_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_input ->
    ( get_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the specified policy.\n"]

module GetPolicyStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_store_input ->
    ( get_policy_store_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_store_input ->
    ( get_policy_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about a policy store.\n"]

module GetPolicyStoreAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_store_alias_input ->
    ( get_policy_store_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_store_alias_input ->
    ( get_policy_store_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about the specified policy store alias.\n"]

module GetPolicyTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_policy_template_input ->
    ( get_policy_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_policy_template_input ->
    ( get_policy_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the details for the specified policy template in the specified policy store.\n"]

module GetSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_input ->
    ( get_schema_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_input ->
    ( get_schema_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve the details for the specified schema in the specified policy store.\n"]

module IsAuthorized : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    is_authorized_input ->
    ( is_authorized_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    is_authorized_input ->
    ( is_authorized_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Makes an authorization decision about a service request described in the parameters. The \
   information in the parameters can also define additional context that Verified Permissions can \
   include in the evaluation. The request is evaluated against all matching policies in the \
   specified policy store. The result of the decision is either [Allow] or [Deny], along with a \
   list of the policies that resulted in the decision.\n"]

module IsAuthorizedWithToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    is_authorized_with_token_input ->
    ( is_authorized_with_token_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    is_authorized_with_token_input ->
    ( is_authorized_with_token_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Makes an authorization decision about a service request described in the parameters. The \
   principal in this request comes from an external identity source in the form of an identity \
   token formatted as a {{:https://wikipedia.org/wiki/JSON_Web_Token}JSON web token (JWT)}. The \
   information in the parameters can also define additional context that Verified Permissions can \
   include in the evaluation. The request is evaluated against all matching policies in the \
   specified policy store. The result of the decision is either [Allow] or [Deny], along with a \
   list of the policies that resulted in the decision.\n\n\
  \ Verified Permissions validates each token that is specified in a request by checking its \
   expiration date and its signature.\n\
  \ \n\
  \   Tokens from an identity source user continue to be usable until they expire. Token \
   revocation and resource deletion have no effect on the validity of a token in your policy store\n\
  \   \n\
  \    "]

module ListIdentitySources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_identity_sources_input ->
    ( list_identity_sources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_identity_sources_input ->
    ( list_identity_sources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of all of the identity sources defined in the specified policy store.\n"]

module ListPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policies_input ->
    ( list_policies_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policies_input ->
    ( list_policies_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of all policies stored in the specified policy store.\n"]

module ListPolicyStoreAliases : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policy_store_aliases_input ->
    (list_policy_store_aliases_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policy_store_aliases_input ->
    ( list_policy_store_aliases_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of all policy store aliases in the calling Amazon Web Services account.\n"]

module ListPolicyStores : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policy_stores_input ->
    (list_policy_stores_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policy_stores_input ->
    ( list_policy_stores_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a paginated list of all policy stores in the calling Amazon Web Services account.\n"]

module ListPolicyTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policy_templates_input ->
    ( list_policy_templates_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policy_templates_input ->
    ( list_policy_templates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of all policy templates in the specified policy store.\n"]

module PutSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_schema_input ->
    ( put_schema_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_schema_input ->
    ( put_schema_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the policy schema in the specified policy store. The schema is used to \
   validate any Cedar policies and policy templates submitted to the policy store. Any changes to \
   the schema validate only policies and templates submitted after the schema change. Existing \
   policies and templates are not re-evaluated against the changed schema. If you later update a \
   policy, then it is evaluated against the new schema at that time.\n\n\
  \  Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \  \n\
  \   "]

module UpdateIdentitySource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_identity_source_input ->
    ( update_identity_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_identity_source_input ->
    ( update_identity_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified identity source to use a new identity provider (IdP), or to change the \
   mapping of identities from the IdP to a different principal entity type.\n\n\
  \  Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \  \n\
  \   "]

module UpdatePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_policy_input ->
    ( update_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_policy_input ->
    ( update_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a Cedar static policy in the specified policy store. You can change only certain \
   elements of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyInput.html#amazonverifiedpermissions-UpdatePolicy-request-UpdatePolicyDefinition}UpdatePolicyDefinition} \
   parameter. You can directly update only static policies. To change a template-linked policy, \
   you must update the template instead, using \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyTemplate.html}UpdatePolicyTemplate}.\n\n\
  \  {ul\n\
  \        {-  If policy validation is enabled in the policy store, then updating a static policy \
   causes Verified Permissions to validate the policy against the schema in the policy store. If \
   the updated static policy doesn't pass validation, the operation fails and the update isn't \
   stored.\n\
  \            \n\
  \             }\n\
  \        {-  When you edit a static policy, you can change only certain elements of a static \
   policy:\n\
  \            \n\
  \             {ul\n\
  \                   {-  The action referenced by the policy. \n\
  \                       \n\
  \                        }\n\
  \                   {-  A condition clause, such as when and unless. \n\
  \                       \n\
  \                        }\n\
  \                   \n\
  \         }\n\
  \          You can't change these elements of a static policy: \n\
  \          \n\
  \           {ul\n\
  \                 {-  Changing a policy from a static policy to a template-linked policy. \n\
  \                     \n\
  \                      }\n\
  \                 {-  Changing the effect of a static policy from permit or forbid. \n\
  \                     \n\
  \                      }\n\
  \                 {-  The principal referenced by a static policy. \n\
  \                     \n\
  \                      }\n\
  \                 {-  The resource referenced by a static policy. \n\
  \                     \n\
  \                      }\n\
  \                 \n\
  \         }\n\
  \          }\n\
  \        {-  To update a template-linked policy, you must update the template instead. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \     Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \     \n\
  \      "]

module UpdatePolicyStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_policy_store_input ->
    ( update_policy_store_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_policy_store_input ->
    ( update_policy_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the validation setting for a policy store.\n\n\
  \  Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \  \n\
  \   "]

module UpdatePolicyTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_policy_template_input ->
    ( update_policy_template_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_policy_template_input ->
    ( update_policy_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified policy template. You can update only the description and the some \
   elements of the \
   {{:https://docs.aws.amazon.com/verifiedpermissions/latest/apireference/API_UpdatePolicyTemplate.html#amazonverifiedpermissions-UpdatePolicyTemplate-request-policyBody}policyBody}. \
   \n\n\
  \  Changes you make to the policy template content are immediately (within the constraints of \
   eventual consistency) reflected in authorization decisions that involve all template-linked \
   policies instantiated from this template.\n\
  \  \n\
  \     Verified Permissions is {i  {{:https://wikipedia.org/wiki/Eventual_consistency}eventually \
   consistent} }. It can take a few seconds for a new or changed element to propagate through the \
   service and be visible in the results of other Verified Permissions operations.\n\
  \     \n\
  \      "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the tags associated with the specified Amazon Verified Permissions resource. In \
   Verified Permissions, policy stores can be tagged.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns one or more tags (key-value pairs) to the specified Amazon Verified Permissions \
   resource. Tags can help you organize and categorize your resources. You can also use them to \
   scope user permissions by granting a user permission to access or change only resources with \
   certain tag values. In Verified Permissions, policy stores can be tagged.\n\n\
  \ Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as \
   strings of characters.\n\
  \ \n\
  \  You can use the TagResource action with a resource that already has tags. If you specify a \
   new tag key, this tag is appended to the list of tags associated with the resource. If you \
   specify a tag key that is already associated with the resource, the new tag value that you \
   specify replaces the previous value for that tag.\n\
  \  \n\
  \   You can associate as many as 50 tags with a resource.\n\
  \   "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from the specified Amazon Verified Permissions resource. In Verified \
   Permissions, policy stores can be tagged.\n"]
