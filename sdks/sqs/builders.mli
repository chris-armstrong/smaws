open Types

val make_add_permission_request :
  queue_url:string_ ->
  label:string_ ->
  aws_account_ids:aws_account_id_list ->
  actions:action_name_list ->
  unit ->
  add_permission_request

val make_untag_queue_request :
  queue_url:string_ -> tag_keys:tag_key_list -> unit -> untag_queue_request

val make_tag_queue_request : queue_url:string_ -> tags:tag_map -> unit -> tag_queue_request

val make_start_message_move_task_request :
  ?destination_arn:string_ ->
  ?max_number_of_messages_per_second:nullable_integer ->
  source_arn:string_ ->
  unit ->
  start_message_move_task_request

val make_set_queue_attributes_request :
  queue_url:string_ -> attributes:queue_attribute_map -> unit -> set_queue_attributes_request

val make_batch_result_error_entry :
  ?message:string_ ->
  id:string_ ->
  sender_fault:boolean_ ->
  code:string_ ->
  unit ->
  batch_result_error_entry

val make_send_message_batch_result_entry :
  ?md5_of_message_attributes:string_ ->
  ?md5_of_message_system_attributes:string_ ->
  ?sequence_number:string_ ->
  id:string_ ->
  message_id:string_ ->
  md5_of_message_body:string_ ->
  unit ->
  send_message_batch_result_entry

val make_message_system_attribute_value :
  ?string_value:string_ ->
  ?binary_value:binary ->
  ?string_list_values:string_list ->
  ?binary_list_values:binary_list ->
  data_type:string_ ->
  unit ->
  message_system_attribute_value

val make_message_attribute_value :
  ?string_value:string_ ->
  ?binary_value:binary ->
  ?string_list_values:string_list ->
  ?binary_list_values:binary_list ->
  data_type:string_ ->
  unit ->
  message_attribute_value

val make_send_message_batch_request_entry :
  ?delay_seconds:nullable_integer ->
  ?message_attributes:message_body_attribute_map ->
  ?message_system_attributes:message_body_system_attribute_map ->
  ?message_deduplication_id:string_ ->
  ?message_group_id:string_ ->
  id:string_ ->
  message_body:string_ ->
  unit ->
  send_message_batch_request_entry

val make_send_message_batch_request :
  queue_url:string_ ->
  entries:send_message_batch_request_entry_list ->
  unit ->
  send_message_batch_request

val make_send_message_request :
  ?delay_seconds:nullable_integer ->
  ?message_attributes:message_body_attribute_map ->
  ?message_system_attributes:message_body_system_attribute_map ->
  ?message_deduplication_id:string_ ->
  ?message_group_id:string_ ->
  queue_url:string_ ->
  message_body:string_ ->
  unit ->
  send_message_request

val make_remove_permission_request :
  queue_url:string_ -> label:string_ -> unit -> remove_permission_request

val make_message :
  ?message_id:string_ ->
  ?receipt_handle:string_ ->
  ?md5_of_body:string_ ->
  ?body:string_ ->
  ?attributes:message_system_attribute_map ->
  ?md5_of_message_attributes:string_ ->
  ?message_attributes:message_body_attribute_map ->
  unit ->
  message

val make_receive_message_request :
  ?attribute_names:attribute_name_list ->
  ?message_system_attribute_names:message_system_attribute_list ->
  ?message_attribute_names:message_attribute_name_list ->
  ?max_number_of_messages:nullable_integer ->
  ?visibility_timeout:nullable_integer ->
  ?wait_time_seconds:nullable_integer ->
  ?receive_request_attempt_id:string_ ->
  queue_url:string_ ->
  unit ->
  receive_message_request

val make_purge_queue_request : queue_url:string_ -> unit -> purge_queue_request
val make_list_queue_tags_request : queue_url:string_ -> unit -> list_queue_tags_request

val make_list_queues_request :
  ?queue_name_prefix:string_ ->
  ?next_token:token ->
  ?max_results:boxed_integer ->
  unit ->
  list_queues_request

val make_list_message_move_tasks_result_entry :
  ?task_handle:string_ ->
  ?status:string_ ->
  ?source_arn:string_ ->
  ?destination_arn:string_ ->
  ?max_number_of_messages_per_second:nullable_integer ->
  ?approximate_number_of_messages_moved:long ->
  ?approximate_number_of_messages_to_move:nullable_long ->
  ?failure_reason:string_ ->
  ?started_timestamp:long ->
  unit ->
  list_message_move_tasks_result_entry

val make_list_message_move_tasks_request :
  ?max_results:nullable_integer -> source_arn:string_ -> unit -> list_message_move_tasks_request

val make_list_dead_letter_source_queues_request :
  ?next_token:token ->
  ?max_results:boxed_integer ->
  queue_url:string_ ->
  unit ->
  list_dead_letter_source_queues_request

val make_get_queue_url_request :
  ?queue_owner_aws_account_id:string_ -> queue_name:string_ -> unit -> get_queue_url_request

val make_get_queue_attributes_request :
  ?attribute_names:attribute_name_list -> queue_url:string_ -> unit -> get_queue_attributes_request

val make_delete_queue_request : queue_url:string_ -> unit -> delete_queue_request
val make_delete_message_batch_result_entry : id:string_ -> unit -> delete_message_batch_result_entry

val make_delete_message_batch_request_entry :
  id:string_ -> receipt_handle:string_ -> unit -> delete_message_batch_request_entry

val make_delete_message_batch_request :
  queue_url:string_ ->
  entries:delete_message_batch_request_entry_list ->
  unit ->
  delete_message_batch_request

val make_delete_message_request :
  queue_url:string_ -> receipt_handle:string_ -> unit -> delete_message_request

val make_create_queue_request :
  ?attributes:queue_attribute_map ->
  ?tags:tag_map ->
  queue_name:string_ ->
  unit ->
  create_queue_request

val make_change_message_visibility_batch_result_entry :
  id:string_ -> unit -> change_message_visibility_batch_result_entry

val make_change_message_visibility_batch_request_entry :
  ?visibility_timeout:nullable_integer ->
  id:string_ ->
  receipt_handle:string_ ->
  unit ->
  change_message_visibility_batch_request_entry

val make_change_message_visibility_batch_request :
  queue_url:string_ ->
  entries:change_message_visibility_batch_request_entry_list ->
  unit ->
  change_message_visibility_batch_request

val make_change_message_visibility_request :
  queue_url:string_ ->
  receipt_handle:string_ ->
  visibility_timeout:nullable_integer ->
  unit ->
  change_message_visibility_request

val make_cancel_message_move_task_request :
  task_handle:string_ -> unit -> cancel_message_move_task_request
