open Types

val make_update_environment_request :
  ?managed_credentials_action:managed_credentials_action ->
  ?description:environment_description ->
  ?name:environment_name ->
  environment_id:environment_id ->
  unit ->
  update_environment_request

val make_environment_member :
  ?last_access:timestamp ->
  environment_id:environment_id ->
  user_arn:user_arn ->
  user_id:string_ ->
  permissions:permissions ->
  unit ->
  environment_member

val make_update_environment_membership_request :
  permissions:member_permissions ->
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  update_environment_membership_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:environment_arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:environment_arn -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:environment_arn -> unit -> list_tags_for_resource_request

val make_list_environments_request :
  ?max_results:max_results -> ?next_token:string_ -> unit -> list_environments_request

val make_environment_lifecycle :
  ?failure_resource:string_ ->
  ?reason:string_ ->
  ?status:environment_lifecycle_status ->
  unit ->
  environment_lifecycle

val make_environment :
  ?managed_credentials_status:managed_credentials_status ->
  ?lifecycle:environment_lifecycle ->
  ?connection_type:connection_type ->
  ?description:environment_description ->
  ?name:environment_name ->
  ?id:environment_id ->
  owner_arn:string_ ->
  arn:string_ ->
  type_:environment_type ->
  unit ->
  environment

val make_describe_environments_request :
  environment_ids:bounded_environment_id_list -> unit -> describe_environments_request

val make_describe_environment_status_request :
  environment_id:environment_id -> unit -> describe_environment_status_request

val make_describe_environment_memberships_request :
  ?max_results:max_results ->
  ?next_token:string_ ->
  ?permissions:permissions_list ->
  ?environment_id:environment_id ->
  ?user_arn:user_arn ->
  unit ->
  describe_environment_memberships_request

val make_delete_environment_request :
  environment_id:environment_id -> unit -> delete_environment_request

val make_delete_environment_membership_request :
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  delete_environment_membership_request

val make_create_environment_membership_request :
  permissions:member_permissions ->
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  create_environment_membership_request

val make_create_environment_ec2_request :
  ?dry_run:nullable_boolean ->
  ?connection_type:connection_type ->
  ?tags:tag_list ->
  ?owner_arn:user_arn ->
  ?automatic_stop_time_minutes:automatic_stop_time_minutes ->
  ?subnet_id:subnet_id ->
  ?client_request_token:client_request_token ->
  ?description:environment_description ->
  image_id:image_id ->
  instance_type:instance_type ->
  name:environment_name ->
  unit ->
  create_environment_ec2_request
