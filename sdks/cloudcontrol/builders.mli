open Types

val make_progress_event :
  ?type_name:type_name ->
  ?identifier:identifier ->
  ?request_token:request_token ->
  ?hooks_request_token:request_token ->
  ?operation:operation ->
  ?operation_status:operation_status ->
  ?event_time:timestamp ->
  ?resource_model:properties ->
  ?status_message:status_message ->
  ?error_code:handler_error_code ->
  ?retry_after:timestamp ->
  unit ->
  progress_event

val make_cancel_resource_request_output :
  ?progress_event:progress_event -> unit -> cancel_resource_request_output

val make_cancel_resource_request_input :
  request_token:request_token -> unit -> cancel_resource_request_input

val make_update_resource_output : ?progress_event:progress_event -> unit -> update_resource_output

val make_update_resource_input :
  ?type_version_id:type_version_id ->
  ?role_arn:role_arn ->
  ?client_token:client_token ->
  type_name:type_name ->
  identifier:identifier ->
  patch_document:patch_document ->
  unit ->
  update_resource_input

val make_resource_description :
  ?identifier:identifier -> ?properties:properties -> unit -> resource_description

val make_list_resources_output :
  ?type_name:type_name ->
  ?resource_descriptions:resource_descriptions ->
  ?next_token:handler_next_token ->
  unit ->
  list_resources_output

val make_list_resources_input :
  ?type_version_id:type_version_id ->
  ?role_arn:role_arn ->
  ?next_token:handler_next_token ->
  ?max_results:max_results ->
  ?resource_model:properties ->
  type_name:type_name ->
  unit ->
  list_resources_input

val make_list_resource_requests_output :
  ?resource_request_status_summaries:resource_request_status_summaries ->
  ?next_token:next_token ->
  unit ->
  list_resource_requests_output

val make_resource_request_status_filter :
  ?operations:operations ->
  ?operation_statuses:operation_statuses ->
  unit ->
  resource_request_status_filter

val make_list_resource_requests_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?resource_request_status_filter:resource_request_status_filter ->
  unit ->
  list_resource_requests_input

val make_hook_progress_event :
  ?hook_type_name:type_name ->
  ?hook_type_version_id:type_version_id ->
  ?hook_type_arn:hook_type_arn ->
  ?invocation_point:hook_invocation_point ->
  ?hook_status:hook_status ->
  ?hook_event_time:timestamp ->
  ?hook_status_message:status_message ->
  ?failure_mode:hook_failure_mode ->
  unit ->
  hook_progress_event

val make_get_resource_request_status_output :
  ?progress_event:progress_event ->
  ?hooks_progress_event:hooks_progress_event ->
  unit ->
  get_resource_request_status_output

val make_get_resource_request_status_input :
  request_token:request_token -> unit -> get_resource_request_status_input

val make_get_resource_output :
  ?type_name:type_name -> ?resource_description:resource_description -> unit -> get_resource_output

val make_get_resource_input :
  ?type_version_id:type_version_id ->
  ?role_arn:role_arn ->
  type_name:type_name ->
  identifier:identifier ->
  unit ->
  get_resource_input

val make_delete_resource_output : ?progress_event:progress_event -> unit -> delete_resource_output

val make_delete_resource_input :
  ?type_version_id:type_version_id ->
  ?role_arn:role_arn ->
  ?client_token:client_token ->
  type_name:type_name ->
  identifier:identifier ->
  unit ->
  delete_resource_input

val make_create_resource_output : ?progress_event:progress_event -> unit -> create_resource_output

val make_create_resource_input :
  ?type_version_id:type_version_id ->
  ?role_arn:role_arn ->
  ?client_token:client_token ->
  type_name:type_name ->
  desired_state:properties ->
  unit ->
  create_resource_input
