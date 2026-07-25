open Types

val make_environment_member :
  ?last_access:timestamp ->
  permissions:permissions ->
  user_id:string_ ->
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  environment_member

val make_update_environment_membership_request :
  environment_id:environment_id ->
  user_arn:user_arn ->
  permissions:member_permissions ->
  unit ->
  update_environment_membership_request

val make_update_environment_request :
  ?name:environment_name ->
  ?description:environment_description ->
  ?managed_credentials_action:managed_credentials_action ->
  environment_id:environment_id ->
  unit ->
  update_environment_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:environment_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:environment_arn -> tags:tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:environment_arn -> unit -> list_tags_for_resource_request

val make_list_environments_request :
  ?next_token:string_ -> ?max_results:max_results -> unit -> list_environments_request

val make_describe_environment_status_request :
  environment_id:environment_id -> unit -> describe_environment_status_request

val make_environment_lifecycle :
  ?status:environment_lifecycle_status ->
  ?reason:string_ ->
  ?failure_resource:string_ ->
  unit ->
  environment_lifecycle

val make_environment :
  ?id:environment_id ->
  ?name:environment_name ->
  ?description:environment_description ->
  ?connection_type:connection_type ->
  ?lifecycle:environment_lifecycle ->
  ?managed_credentials_status:managed_credentials_status ->
  type_:environment_type ->
  arn:string_ ->
  owner_arn:string_ ->
  unit ->
  environment

val make_describe_environments_request :
  environment_ids:bounded_environment_id_list -> unit -> describe_environments_request

val make_describe_environment_memberships_request :
  ?user_arn:user_arn ->
  ?environment_id:environment_id ->
  ?permissions:permissions_list ->
  ?next_token:string_ ->
  ?max_results:max_results ->
  unit ->
  describe_environment_memberships_request

val make_delete_environment_membership_request :
  environment_id:environment_id ->
  user_arn:user_arn ->
  unit ->
  delete_environment_membership_request

val make_delete_environment_request :
  environment_id:environment_id -> unit -> delete_environment_request

val make_create_environment_membership_request :
  environment_id:environment_id ->
  user_arn:user_arn ->
  permissions:member_permissions ->
  unit ->
  create_environment_membership_request

val make_create_environment_ec2_request :
  ?description:environment_description ->
  ?client_request_token:client_request_token ->
  ?subnet_id:subnet_id ->
  ?automatic_stop_time_minutes:automatic_stop_time_minutes ->
  ?owner_arn:user_arn ->
  ?tags:tag_list ->
  ?connection_type:connection_type ->
  ?dry_run:nullable_boolean ->
  name:environment_name ->
  instance_type:instance_type ->
  image_id:image_id ->
  unit ->
  create_environment_ec2_request
