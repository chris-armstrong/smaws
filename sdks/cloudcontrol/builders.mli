open Types

val make_progress_event :
  ?retry_after:timestamp ->
  ?error_code:handler_error_code ->
  ?status_message:status_message ->
  ?resource_model:properties ->
  ?event_time:timestamp ->
  ?operation_status:operation_status ->
  ?operation:operation ->
  ?hooks_request_token:request_token ->
  ?request_token:request_token ->
  ?identifier:identifier ->
  ?type_name:type_name ->
  unit ->
  progress_event

val make_update_resource_output : ?progress_event:progress_event -> unit -> update_resource_output

val make_update_resource_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  patch_document:patch_document ->
  identifier:identifier ->
  type_name:type_name ->
  unit ->
  update_resource_input

val make_resource_request_status_filter :
  ?operation_statuses:operation_statuses ->
  ?operations:operations ->
  unit ->
  resource_request_status_filter

val make_resource_description :
  ?properties:properties -> ?identifier:identifier -> unit -> resource_description

val make_list_resources_output :
  ?next_token:handler_next_token ->
  ?resource_descriptions:resource_descriptions ->
  ?type_name:type_name ->
  unit ->
  list_resources_output

val make_list_resources_input :
  ?resource_model:properties ->
  ?max_results:max_results ->
  ?next_token:handler_next_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  type_name:type_name ->
  unit ->
  list_resources_input

val make_list_resource_requests_output :
  ?next_token:next_token ->
  ?resource_request_status_summaries:resource_request_status_summaries ->
  unit ->
  list_resource_requests_output

val make_list_resource_requests_input :
  ?resource_request_status_filter:resource_request_status_filter ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resource_requests_input

val make_hook_progress_event :
  ?failure_mode:hook_failure_mode ->
  ?hook_status_message:status_message ->
  ?hook_event_time:timestamp ->
  ?hook_status:hook_status ->
  ?invocation_point:hook_invocation_point ->
  ?hook_type_arn:hook_type_arn ->
  ?hook_type_version_id:type_version_id ->
  ?hook_type_name:type_name ->
  unit ->
  hook_progress_event

val make_get_resource_request_status_output :
  ?hooks_progress_event:hooks_progress_event ->
  ?progress_event:progress_event ->
  unit ->
  get_resource_request_status_output

val make_get_resource_request_status_input :
  request_token:request_token -> unit -> get_resource_request_status_input

val make_get_resource_output :
  ?resource_description:resource_description -> ?type_name:type_name -> unit -> get_resource_output

val make_get_resource_input :
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  identifier:identifier ->
  type_name:type_name ->
  unit ->
  get_resource_input

val make_delete_resource_output : ?progress_event:progress_event -> unit -> delete_resource_output

val make_delete_resource_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  identifier:identifier ->
  type_name:type_name ->
  unit ->
  delete_resource_input

val make_create_resource_output : ?progress_event:progress_event -> unit -> create_resource_output

val make_create_resource_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  desired_state:properties ->
  type_name:type_name ->
  unit ->
  create_resource_input

val make_cancel_resource_request_output :
  ?progress_event:progress_event -> unit -> cancel_resource_request_output

val make_cancel_resource_request_input :
  request_token:request_token -> unit -> cancel_resource_request_input
