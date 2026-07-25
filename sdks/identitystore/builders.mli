open Types

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
