open Types

val make_untag_queue_request :
  tag_keys:tag_key_list -> queue_url:string_ -> unit -> untag_queue_request

val make_tag_queue_request : tags:tag_map -> queue_url:string_ -> unit -> tag_queue_request

val make_start_message_move_task_request :
  ?max_number_of_messages_per_second:nullable_integer ->
  ?destination_arn:string_ ->
  source_arn:string_ ->
  unit ->
  start_message_move_task_request

val make_set_queue_attributes_request :
  attributes:queue_attribute_map -> queue_url:string_ -> unit -> set_queue_attributes_request

val make_message_attribute_value :
  ?binary_list_values:binary_list ->
  ?string_list_values:string_list ->
  ?binary_value:binary ->
  ?string_value:string_ ->
  data_type:string_ ->
  unit ->
  message_attribute_value

val make_message_system_attribute_value :
  ?binary_list_values:binary_list ->
  ?string_list_values:string_list ->
  ?binary_value:binary ->
  ?string_value:string_ ->
  data_type:string_ ->
  unit ->
  message_system_attribute_value

val make_send_message_request :
  ?message_group_id:string_ ->
  ?message_deduplication_id:string_ ->
  ?message_system_attributes:message_body_system_attribute_map ->
  ?message_attributes:message_body_attribute_map ->
  ?delay_seconds:nullable_integer ->
  message_body:string_ ->
  queue_url:string_ ->
  unit ->
  send_message_request

val make_send_message_batch_result_entry :
  ?sequence_number:string_ ->
  ?md5_of_message_system_attributes:string_ ->
  ?md5_of_message_attributes:string_ ->
  md5_of_message_body:string_ ->
  message_id:string_ ->
  id:string_ ->
  unit ->
  send_message_batch_result_entry

val make_batch_result_error_entry :
  ?message:string_ ->
  code:string_ ->
  sender_fault:boolean_ ->
  id:string_ ->
  unit ->
  batch_result_error_entry

val make_send_message_batch_request_entry :
  ?message_group_id:string_ ->
  ?message_deduplication_id:string_ ->
  ?message_system_attributes:message_body_system_attribute_map ->
  ?message_attributes:message_body_attribute_map ->
  ?delay_seconds:nullable_integer ->
  message_body:string_ ->
  id:string_ ->
  unit ->
  send_message_batch_request_entry

val make_send_message_batch_request :
  entries:send_message_batch_request_entry_list ->
  queue_url:string_ ->
  unit ->
  send_message_batch_request

val make_remove_permission_request :
  label:string_ -> queue_url:string_ -> unit -> remove_permission_request

val make_message :
  ?message_attributes:message_body_attribute_map ->
  ?md5_of_message_attributes:string_ ->
  ?attributes:message_system_attribute_map ->
  ?body:string_ ->
  ?md5_of_body:string_ ->
  ?receipt_handle:string_ ->
  ?message_id:string_ ->
  unit ->
  message

val make_receive_message_request :
  ?receive_request_attempt_id:string_ ->
  ?wait_time_seconds:nullable_integer ->
  ?visibility_timeout:nullable_integer ->
  ?max_number_of_messages:nullable_integer ->
  ?message_attribute_names:message_attribute_name_list ->
  ?message_system_attribute_names:message_system_attribute_list ->
  ?attribute_names:attribute_name_list ->
  queue_url:string_ ->
  unit ->
  receive_message_request

val make_purge_queue_request : queue_url:string_ -> unit -> purge_queue_request

val make_list_queues_request :
  ?max_results:boxed_integer ->
  ?next_token:token ->
  ?queue_name_prefix:string_ ->
  unit ->
  list_queues_request

val make_list_queue_tags_request : queue_url:string_ -> unit -> list_queue_tags_request

val make_list_message_move_tasks_result_entry :
  ?started_timestamp:long ->
  ?failure_reason:string_ ->
  ?approximate_number_of_messages_to_move:nullable_long ->
  ?approximate_number_of_messages_moved:long ->
  ?max_number_of_messages_per_second:nullable_integer ->
  ?destination_arn:string_ ->
  ?source_arn:string_ ->
  ?status:string_ ->
  ?task_handle:string_ ->
  unit ->
  list_message_move_tasks_result_entry

val make_list_message_move_tasks_request :
  ?max_results:nullable_integer -> source_arn:string_ -> unit -> list_message_move_tasks_request

val make_list_dead_letter_source_queues_request :
  ?max_results:boxed_integer ->
  ?next_token:token ->
  queue_url:string_ ->
  unit ->
  list_dead_letter_source_queues_request

val make_get_queue_url_request :
  ?queue_owner_aws_account_id:string_ -> queue_name:string_ -> unit -> get_queue_url_request

val make_get_queue_attributes_request :
  ?attribute_names:attribute_name_list -> queue_url:string_ -> unit -> get_queue_attributes_request

val make_delete_queue_request : queue_url:string_ -> unit -> delete_queue_request

val make_delete_message_request :
  receipt_handle:string_ -> queue_url:string_ -> unit -> delete_message_request

val make_delete_message_batch_result_entry : id:string_ -> unit -> delete_message_batch_result_entry

val make_delete_message_batch_request_entry :
  receipt_handle:string_ -> id:string_ -> unit -> delete_message_batch_request_entry

val make_delete_message_batch_request :
  entries:delete_message_batch_request_entry_list ->
  queue_url:string_ ->
  unit ->
  delete_message_batch_request

val make_create_queue_request :
  ?tags:tag_map ->
  ?attributes:queue_attribute_map ->
  queue_name:string_ ->
  unit ->
  create_queue_request

val make_change_message_visibility_request :
  visibility_timeout:nullable_integer ->
  receipt_handle:string_ ->
  queue_url:string_ ->
  unit ->
  change_message_visibility_request

val make_change_message_visibility_batch_result_entry :
  id:string_ -> unit -> change_message_visibility_batch_result_entry

val make_change_message_visibility_batch_request_entry :
  ?visibility_timeout:nullable_integer ->
  receipt_handle:string_ ->
  id:string_ ->
  unit ->
  change_message_visibility_batch_request_entry

val make_change_message_visibility_batch_request :
  entries:change_message_visibility_batch_request_entry_list ->
  queue_url:string_ ->
  unit ->
  change_message_visibility_batch_request

val make_cancel_message_move_task_request :
  task_handle:string_ -> unit -> cancel_message_move_task_request

val make_add_permission_request :
  actions:action_name_list ->
  aws_account_ids:aws_account_id_list ->
  label:string_ ->
  queue_url:string_ ->
  unit ->
  add_permission_request
