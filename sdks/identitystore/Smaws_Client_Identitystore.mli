(** identitystore client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_external_id : id:external_id_identifier -> issuer:external_id_issuer -> unit -> external_id

val make_name :
  ?honorific_suffix:sensitive_string_type ->
  ?honorific_prefix:sensitive_string_type ->
  ?middle_name:sensitive_string_type ->
  ?given_name:sensitive_string_type ->
  ?family_name:sensitive_string_type ->
  ?formatted:sensitive_string_type ->
  unit ->
  name

val make_email :
  ?primary:boolean_type ->
  ?type_:sensitive_string_type ->
  ?value:sensitive_string_type ->
  unit ->
  email

val make_address :
  ?primary:boolean_type ->
  ?type_:sensitive_string_type ->
  ?formatted:sensitive_string_type ->
  ?country:sensitive_string_type ->
  ?postal_code:sensitive_string_type ->
  ?region:sensitive_string_type ->
  ?locality:sensitive_string_type ->
  ?street_address:sensitive_string_type ->
  unit ->
  address

val make_phone_number :
  ?primary:boolean_type ->
  ?type_:sensitive_string_type ->
  ?value:sensitive_string_type ->
  unit ->
  phone_number

val make_photo :
  ?primary:boolean_type ->
  ?display:sensitive_string_type ->
  ?type_:sensitive_string_type ->
  value:sensitive_string_type ->
  unit ->
  photo

val make_role :
  ?primary:boolean_type ->
  ?type_:sensitive_string_type ->
  ?value:sensitive_string_type ->
  unit ->
  role

val make_user :
  ?extensions:extensions ->
  ?updated_by:string_type ->
  ?updated_at:date_type ->
  ?created_by:string_type ->
  ?created_at:date_type ->
  ?roles:roles ->
  ?birthdate:sensitive_string_type ->
  ?website:sensitive_string_type ->
  ?photos:photos ->
  ?user_status:user_status ->
  ?timezone:sensitive_string_type ->
  ?locale:sensitive_string_type ->
  ?preferred_language:sensitive_string_type ->
  ?title:sensitive_string_type ->
  ?user_type:sensitive_string_type ->
  ?phone_numbers:phone_numbers ->
  ?addresses:addresses ->
  ?emails:emails ->
  ?profile_url:sensitive_string_type ->
  ?nick_name:sensitive_string_type ->
  ?display_name:sensitive_string_type ->
  ?name:name ->
  ?external_ids:external_ids ->
  ?user_name:user_name ->
  user_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  user

val make_update_user_response : unit -> unit

val make_attribute_operation :
  ?attribute_value:attribute_value -> attribute_path:attribute_path -> unit -> attribute_operation

val make_update_user_request :
  operations:attribute_operations ->
  user_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  update_user_request

val make_update_group_response : unit -> unit

val make_update_group_request :
  operations:attribute_operations ->
  group_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  update_group_request

val make_unique_attribute :
  attribute_value:attribute_value -> attribute_path:attribute_path -> unit -> unique_attribute

val make_list_users_response : ?next_token:next_token -> users:users -> unit -> list_users_response

val make_filter :
  attribute_value:sensitive_string_type -> attribute_path:attribute_path -> unit -> filter

val make_list_users_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?extensions:extension_names ->
  identity_store_id:identity_store_id ->
  unit ->
  list_users_request

val make_group :
  ?updated_by:string_type ->
  ?created_by:string_type ->
  ?updated_at:date_type ->
  ?created_at:date_type ->
  ?description:sensitive_string_type ->
  ?external_ids:external_ids ->
  ?display_name:group_display_name ->
  identity_store_id:identity_store_id ->
  group_id:resource_id ->
  unit ->
  group

val make_list_groups_response :
  ?next_token:next_token -> groups:groups -> unit -> list_groups_response

val make_list_groups_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  identity_store_id:identity_store_id ->
  unit ->
  list_groups_request

val make_group_membership :
  ?updated_by:string_type ->
  ?created_by:string_type ->
  ?updated_at:date_type ->
  ?created_at:date_type ->
  ?member_id:member_id ->
  ?group_id:resource_id ->
  ?membership_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  group_membership

val make_list_group_memberships_response :
  ?next_token:next_token ->
  group_memberships:group_memberships ->
  unit ->
  list_group_memberships_response

val make_list_group_memberships_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  group_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  list_group_memberships_request

val make_list_group_memberships_for_member_response :
  ?next_token:next_token ->
  group_memberships:group_memberships ->
  unit ->
  list_group_memberships_for_member_response

val make_list_group_memberships_for_member_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  member_id:member_id ->
  identity_store_id:identity_store_id ->
  unit ->
  list_group_memberships_for_member_request

val make_is_member_in_groups_response :
  results:group_membership_existence_results -> unit -> is_member_in_groups_response

val make_is_member_in_groups_request :
  group_ids:group_ids ->
  member_id:member_id ->
  identity_store_id:identity_store_id ->
  unit ->
  is_member_in_groups_request

val make_get_user_id_response :
  user_id:resource_id -> identity_store_id:identity_store_id -> unit -> get_user_id_response

val make_get_user_id_request :
  alternate_identifier:alternate_identifier ->
  identity_store_id:identity_store_id ->
  unit ->
  get_user_id_request

val make_get_group_membership_id_response :
  identity_store_id:identity_store_id ->
  membership_id:resource_id ->
  unit ->
  get_group_membership_id_response

val make_get_group_membership_id_request :
  member_id:member_id ->
  group_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  get_group_membership_id_request

val make_get_group_id_response :
  identity_store_id:identity_store_id -> group_id:resource_id -> unit -> get_group_id_response

val make_get_group_id_request :
  alternate_identifier:alternate_identifier ->
  identity_store_id:identity_store_id ->
  unit ->
  get_group_id_request

val make_describe_user_response :
  ?extensions:extensions ->
  ?updated_by:string_type ->
  ?updated_at:date_type ->
  ?created_by:string_type ->
  ?created_at:date_type ->
  ?roles:roles ->
  ?birthdate:sensitive_string_type ->
  ?website:sensitive_string_type ->
  ?photos:photos ->
  ?user_status:user_status ->
  ?timezone:sensitive_string_type ->
  ?locale:sensitive_string_type ->
  ?preferred_language:sensitive_string_type ->
  ?title:sensitive_string_type ->
  ?user_type:sensitive_string_type ->
  ?phone_numbers:phone_numbers ->
  ?addresses:addresses ->
  ?emails:emails ->
  ?profile_url:sensitive_string_type ->
  ?nick_name:sensitive_string_type ->
  ?display_name:sensitive_string_type ->
  ?name:name ->
  ?external_ids:external_ids ->
  ?user_name:user_name ->
  user_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  describe_user_response

val make_describe_user_request :
  ?extensions:extension_names ->
  user_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  describe_user_request

val make_describe_group_response :
  ?updated_by:string_type ->
  ?created_by:string_type ->
  ?updated_at:date_type ->
  ?created_at:date_type ->
  ?description:sensitive_string_type ->
  ?external_ids:external_ids ->
  ?display_name:group_display_name ->
  identity_store_id:identity_store_id ->
  group_id:resource_id ->
  unit ->
  describe_group_response

val make_describe_group_request :
  group_id:resource_id -> identity_store_id:identity_store_id -> unit -> describe_group_request

val make_describe_group_membership_response :
  ?updated_by:string_type ->
  ?created_by:string_type ->
  ?updated_at:date_type ->
  ?created_at:date_type ->
  member_id:member_id ->
  group_id:resource_id ->
  membership_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  describe_group_membership_response

val make_describe_group_membership_request :
  membership_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  describe_group_membership_request

val make_delete_user_response : unit -> unit

val make_delete_user_request :
  user_id:resource_id -> identity_store_id:identity_store_id -> unit -> delete_user_request

val make_delete_group_response : unit -> unit

val make_delete_group_request :
  group_id:resource_id -> identity_store_id:identity_store_id -> unit -> delete_group_request

val make_delete_group_membership_response : unit -> unit

val make_delete_group_membership_request :
  membership_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  delete_group_membership_request

val make_create_user_response :
  user_id:resource_id -> identity_store_id:identity_store_id -> unit -> create_user_response

val make_create_user_request :
  ?extensions:extensions ->
  ?roles:roles ->
  ?birthdate:sensitive_string_type ->
  ?website:sensitive_string_type ->
  ?photos:photos ->
  ?timezone:sensitive_string_type ->
  ?locale:sensitive_string_type ->
  ?preferred_language:sensitive_string_type ->
  ?title:sensitive_string_type ->
  ?user_type:sensitive_string_type ->
  ?phone_numbers:phone_numbers ->
  ?addresses:addresses ->
  ?emails:emails ->
  ?profile_url:sensitive_string_type ->
  ?nick_name:sensitive_string_type ->
  ?display_name:sensitive_string_type ->
  ?name:name ->
  ?user_name:user_name ->
  identity_store_id:identity_store_id ->
  unit ->
  create_user_request

val make_create_group_response :
  identity_store_id:identity_store_id -> group_id:resource_id -> unit -> create_group_response

val make_create_group_request :
  ?description:sensitive_string_type ->
  ?display_name:group_display_name ->
  identity_store_id:identity_store_id ->
  unit ->
  create_group_request

val make_create_group_membership_response :
  identity_store_id:identity_store_id ->
  membership_id:resource_id ->
  unit ->
  create_group_membership_response

val make_create_group_membership_request :
  member_id:member_id ->
  group_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  create_group_membership_request
(** {1:operations Operations} *)

module CreateGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_group_request ->
    ( create_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_group_request ->
    ( create_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a group within the specified identity store.\n"]

module CreateGroupMembership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_group_membership_request ->
    ( create_group_membership_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_group_membership_request ->
    ( create_group_membership_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a relationship between a member and a group. The following identifiers must be \
   specified: [GroupId], [IdentityStoreId], and [MemberId].\n"]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a user within the specified identity store.\n"]

module DeleteGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_group_request ->
    ( delete_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_group_request ->
    ( delete_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a group within an identity store given [GroupId].\n"]

module DeleteGroupMembership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_group_membership_request ->
    ( delete_group_membership_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_group_membership_request ->
    ( delete_group_membership_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a membership within a group given [MembershipId].\n"]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a user within an identity store given [UserId].\n"]

module DescribeGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_group_request ->
    ( describe_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_group_request ->
    ( describe_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the group metadata and attributes from [GroupId] in an identity store.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module DescribeGroupMembership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_group_membership_request ->
    ( describe_group_membership_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_group_membership_request ->
    ( describe_group_membership_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves membership metadata and attributes from [MembershipId] in an identity store.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module DescribeUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_request ->
    ( describe_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_request ->
    ( describe_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the user metadata and attributes from the [UserId] in an identity store.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module GetGroupId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_group_id_request ->
    ( get_group_id_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_group_id_request ->
    ( get_group_id_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves [GroupId] in an identity store.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module GetGroupMembershipId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_group_membership_id_request ->
    ( get_group_membership_id_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_group_membership_id_request ->
    ( get_group_membership_id_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the [MembershipId] in an identity store.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module GetUserId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_id_request ->
    ( get_user_id_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_id_request ->
    ( get_user_id_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the [UserId] in an identity store.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module IsMemberInGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    is_member_in_groups_request ->
    ( is_member_in_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    is_member_in_groups_request ->
    ( is_member_in_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Checks the user's membership in all requested groups and returns if the member exists in all \
   queried groups.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module ListGroupMemberships : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_group_memberships_request ->
    ( list_group_memberships_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_group_memberships_request ->
    ( list_group_memberships_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For the specified group in the specified identity store, returns the list of all [ \
   GroupMembership] objects and returns results in paginated form.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module ListGroupMembershipsForMember : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_group_memberships_for_member_request ->
    ( list_group_memberships_for_member_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_group_memberships_for_member_request ->
    ( list_group_memberships_for_member_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For the specified member in the specified identity store, returns the list of all [ \
   GroupMembership] objects and returns results in paginated form.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module ListGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_groups_request ->
    ( list_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_groups_request ->
    ( list_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all groups in the identity store. Returns a paginated list of complete [Group] objects. \
   Filtering for a [Group] by the [DisplayName] attribute is deprecated. Instead, use the \
   [GetGroupId] API action.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module ListUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all users in the identity store. Returns a paginated list of complete [User] objects. \
   Filtering for a [User] by the [UserName] attribute is deprecated. Instead, use the [GetUserId] \
   API action.\n\n\
  \  If you have access to a member account, you can use this API operation from the member \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/manage-your-accounts.html#limiting-access-from-member-accounts}Limiting \
   access to the identity store from member accounts} in the {i  IAM Identity Center User Guide}.\n\
  \  \n\
  \   "]

module UpdateGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_group_request ->
    ( update_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_group_request ->
    ( update_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified group metadata and attributes in the specified identity store.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( update_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( update_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified user metadata and attributes in the specified identity store.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
