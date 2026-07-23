(** identitystore client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_group_membership :
  ?membership_id:resource_id ->
  ?group_id:resource_id ->
  ?member_id:member_id ->
  ?created_at:date_type ->
  ?updated_at:date_type ->
  ?created_by:string_type ->
  ?updated_by:string_type ->
  identity_store_id:identity_store_id ->
  unit ->
  group_membership

val make_list_group_memberships_for_member_response :
  ?next_token:next_token ->
  group_memberships:group_memberships ->
  unit ->
  list_group_memberships_for_member_response

val make_list_group_memberships_for_member_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  identity_store_id:identity_store_id ->
  member_id:member_id ->
  unit ->
  list_group_memberships_for_member_request

val make_is_member_in_groups_response :
  results:group_membership_existence_results -> unit -> is_member_in_groups_response

val make_is_member_in_groups_request :
  identity_store_id:identity_store_id ->
  member_id:member_id ->
  group_ids:group_ids ->
  unit ->
  is_member_in_groups_request

val make_get_user_id_response :
  identity_store_id:identity_store_id -> user_id:resource_id -> unit -> get_user_id_response

val make_unique_attribute :
  attribute_path:attribute_path -> attribute_value:attribute_value -> unit -> unique_attribute

val make_external_id : issuer:external_id_issuer -> id:external_id_identifier -> unit -> external_id

val make_get_user_id_request :
  identity_store_id:identity_store_id ->
  alternate_identifier:alternate_identifier ->
  unit ->
  get_user_id_request

val make_get_group_membership_id_response :
  membership_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  get_group_membership_id_response

val make_get_group_membership_id_request :
  identity_store_id:identity_store_id ->
  group_id:resource_id ->
  member_id:member_id ->
  unit ->
  get_group_membership_id_request

val make_get_group_id_response :
  group_id:resource_id -> identity_store_id:identity_store_id -> unit -> get_group_id_response

val make_get_group_id_request :
  identity_store_id:identity_store_id ->
  alternate_identifier:alternate_identifier ->
  unit ->
  get_group_id_request

val make_address :
  ?street_address:sensitive_string_type ->
  ?locality:sensitive_string_type ->
  ?region:sensitive_string_type ->
  ?postal_code:sensitive_string_type ->
  ?country:sensitive_string_type ->
  ?formatted:sensitive_string_type ->
  ?type_:sensitive_string_type ->
  ?primary:boolean_type ->
  unit ->
  address

val make_attribute_operation :
  ?attribute_value:attribute_value -> attribute_path:attribute_path -> unit -> attribute_operation

val make_create_group_response :
  group_id:resource_id -> identity_store_id:identity_store_id -> unit -> create_group_response

val make_create_group_request :
  ?display_name:group_display_name ->
  ?description:sensitive_string_type ->
  identity_store_id:identity_store_id ->
  unit ->
  create_group_request

val make_create_group_membership_response :
  membership_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  create_group_membership_response

val make_create_group_membership_request :
  identity_store_id:identity_store_id ->
  group_id:resource_id ->
  member_id:member_id ->
  unit ->
  create_group_membership_request

val make_create_user_response :
  identity_store_id:identity_store_id -> user_id:resource_id -> unit -> create_user_response

val make_role :
  ?value:sensitive_string_type ->
  ?type_:sensitive_string_type ->
  ?primary:boolean_type ->
  unit ->
  role

val make_photo :
  ?type_:sensitive_string_type ->
  ?display:sensitive_string_type ->
  ?primary:boolean_type ->
  value:sensitive_string_type ->
  unit ->
  photo

val make_phone_number :
  ?value:sensitive_string_type ->
  ?type_:sensitive_string_type ->
  ?primary:boolean_type ->
  unit ->
  phone_number

val make_email :
  ?value:sensitive_string_type ->
  ?type_:sensitive_string_type ->
  ?primary:boolean_type ->
  unit ->
  email

val make_name :
  ?formatted:sensitive_string_type ->
  ?family_name:sensitive_string_type ->
  ?given_name:sensitive_string_type ->
  ?middle_name:sensitive_string_type ->
  ?honorific_prefix:sensitive_string_type ->
  ?honorific_suffix:sensitive_string_type ->
  unit ->
  name

val make_create_user_request :
  ?user_name:user_name ->
  ?name:name ->
  ?display_name:sensitive_string_type ->
  ?nick_name:sensitive_string_type ->
  ?profile_url:sensitive_string_type ->
  ?emails:emails ->
  ?addresses:addresses ->
  ?phone_numbers:phone_numbers ->
  ?user_type:sensitive_string_type ->
  ?title:sensitive_string_type ->
  ?preferred_language:sensitive_string_type ->
  ?locale:sensitive_string_type ->
  ?timezone:sensitive_string_type ->
  ?photos:photos ->
  ?website:sensitive_string_type ->
  ?birthdate:sensitive_string_type ->
  ?roles:roles ->
  ?extensions:extensions ->
  identity_store_id:identity_store_id ->
  unit ->
  create_user_request

val make_delete_group_response : unit -> unit

val make_delete_group_request :
  identity_store_id:identity_store_id -> group_id:resource_id -> unit -> delete_group_request

val make_delete_group_membership_response : unit -> unit

val make_delete_group_membership_request :
  identity_store_id:identity_store_id ->
  membership_id:resource_id ->
  unit ->
  delete_group_membership_request

val make_delete_user_response : unit -> unit

val make_delete_user_request :
  identity_store_id:identity_store_id -> user_id:resource_id -> unit -> delete_user_request

val make_describe_group_response :
  ?display_name:group_display_name ->
  ?external_ids:external_ids ->
  ?description:sensitive_string_type ->
  ?created_at:date_type ->
  ?updated_at:date_type ->
  ?created_by:string_type ->
  ?updated_by:string_type ->
  group_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  describe_group_response

val make_describe_group_request :
  identity_store_id:identity_store_id -> group_id:resource_id -> unit -> describe_group_request

val make_describe_group_membership_response :
  ?created_at:date_type ->
  ?updated_at:date_type ->
  ?created_by:string_type ->
  ?updated_by:string_type ->
  identity_store_id:identity_store_id ->
  membership_id:resource_id ->
  group_id:resource_id ->
  member_id:member_id ->
  unit ->
  describe_group_membership_response

val make_describe_group_membership_request :
  identity_store_id:identity_store_id ->
  membership_id:resource_id ->
  unit ->
  describe_group_membership_request

val make_describe_user_response :
  ?user_name:user_name ->
  ?external_ids:external_ids ->
  ?name:name ->
  ?display_name:sensitive_string_type ->
  ?nick_name:sensitive_string_type ->
  ?profile_url:sensitive_string_type ->
  ?emails:emails ->
  ?addresses:addresses ->
  ?phone_numbers:phone_numbers ->
  ?user_type:sensitive_string_type ->
  ?title:sensitive_string_type ->
  ?preferred_language:sensitive_string_type ->
  ?locale:sensitive_string_type ->
  ?timezone:sensitive_string_type ->
  ?user_status:user_status ->
  ?photos:photos ->
  ?website:sensitive_string_type ->
  ?birthdate:sensitive_string_type ->
  ?roles:roles ->
  ?created_at:date_type ->
  ?created_by:string_type ->
  ?updated_at:date_type ->
  ?updated_by:string_type ->
  ?extensions:extensions ->
  identity_store_id:identity_store_id ->
  user_id:resource_id ->
  unit ->
  describe_user_response

val make_describe_user_request :
  ?extensions:extension_names ->
  identity_store_id:identity_store_id ->
  user_id:resource_id ->
  unit ->
  describe_user_request

val make_filter :
  attribute_path:attribute_path -> attribute_value:sensitive_string_type -> unit -> filter

val make_group :
  ?display_name:group_display_name ->
  ?external_ids:external_ids ->
  ?description:sensitive_string_type ->
  ?created_at:date_type ->
  ?updated_at:date_type ->
  ?created_by:string_type ->
  ?updated_by:string_type ->
  group_id:resource_id ->
  identity_store_id:identity_store_id ->
  unit ->
  group

val make_list_group_memberships_response :
  ?next_token:next_token ->
  group_memberships:group_memberships ->
  unit ->
  list_group_memberships_response

val make_list_group_memberships_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  identity_store_id:identity_store_id ->
  group_id:resource_id ->
  unit ->
  list_group_memberships_request

val make_list_groups_response :
  ?next_token:next_token -> groups:groups -> unit -> list_groups_response

val make_list_groups_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  identity_store_id:identity_store_id ->
  unit ->
  list_groups_request

val make_user :
  ?user_name:user_name ->
  ?external_ids:external_ids ->
  ?name:name ->
  ?display_name:sensitive_string_type ->
  ?nick_name:sensitive_string_type ->
  ?profile_url:sensitive_string_type ->
  ?emails:emails ->
  ?addresses:addresses ->
  ?phone_numbers:phone_numbers ->
  ?user_type:sensitive_string_type ->
  ?title:sensitive_string_type ->
  ?preferred_language:sensitive_string_type ->
  ?locale:sensitive_string_type ->
  ?timezone:sensitive_string_type ->
  ?user_status:user_status ->
  ?photos:photos ->
  ?website:sensitive_string_type ->
  ?birthdate:sensitive_string_type ->
  ?roles:roles ->
  ?created_at:date_type ->
  ?created_by:string_type ->
  ?updated_at:date_type ->
  ?updated_by:string_type ->
  ?extensions:extensions ->
  identity_store_id:identity_store_id ->
  user_id:resource_id ->
  unit ->
  user

val make_list_users_response : ?next_token:next_token -> users:users -> unit -> list_users_response

val make_list_users_request :
  ?extensions:extension_names ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:filters ->
  identity_store_id:identity_store_id ->
  unit ->
  list_users_request

val make_update_group_response : unit -> unit

val make_update_group_request :
  identity_store_id:identity_store_id ->
  group_id:resource_id ->
  operations:attribute_operations ->
  unit ->
  update_group_request

val make_update_user_response : unit -> unit

val make_update_user_request :
  identity_store_id:identity_store_id ->
  user_id:resource_id ->
  operations:attribute_operations ->
  unit ->
  update_user_request
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
