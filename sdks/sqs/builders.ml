open Types

let make_add_permission_request ~queue_url:(queue_url_ : string_) ~label:(label_ : string_)
    ~aws_account_ids:(aws_account_ids_ : aws_account_id_list) ~actions:(actions_ : action_name_list)
    () =
  ({
     queue_url = queue_url_;
     label = label_;
     aws_account_ids = aws_account_ids_;
     actions = actions_;
   }
    : add_permission_request)

let make_untag_queue_request ~queue_url:(queue_url_ : string_) ~tag_keys:(tag_keys_ : tag_key_list)
    () =
  ({ queue_url = queue_url_; tag_keys = tag_keys_ } : untag_queue_request)

let make_tag_queue_request ~queue_url:(queue_url_ : string_) ~tags:(tags_ : tag_map) () =
  ({ queue_url = queue_url_; tags = tags_ } : tag_queue_request)

let make_start_message_move_task_request ?destination_arn:(destination_arn_ : string_ option)
    ?max_number_of_messages_per_second:
      (max_number_of_messages_per_second_ : nullable_integer option)
    ~source_arn:(source_arn_ : string_) () =
  ({
     source_arn = source_arn_;
     destination_arn = destination_arn_;
     max_number_of_messages_per_second = max_number_of_messages_per_second_;
   }
    : start_message_move_task_request)

let make_set_queue_attributes_request ~queue_url:(queue_url_ : string_)
    ~attributes:(attributes_ : queue_attribute_map) () =
  ({ queue_url = queue_url_; attributes = attributes_ } : set_queue_attributes_request)

let make_batch_result_error_entry ?message:(message_ : string_ option) ~id:(id_ : string_)
    ~sender_fault:(sender_fault_ : boolean_) ~code:(code_ : string_) () =
  ({ id = id_; sender_fault = sender_fault_; code = code_; message = message_ }
    : batch_result_error_entry)

let make_send_message_batch_result_entry
    ?md5_of_message_attributes:(md5_of_message_attributes_ : string_ option)
    ?md5_of_message_system_attributes:(md5_of_message_system_attributes_ : string_ option)
    ?sequence_number:(sequence_number_ : string_ option) ~id:(id_ : string_)
    ~message_id:(message_id_ : string_) ~md5_of_message_body:(md5_of_message_body_ : string_) () =
  ({
     id = id_;
     message_id = message_id_;
     md5_of_message_body = md5_of_message_body_;
     md5_of_message_attributes = md5_of_message_attributes_;
     md5_of_message_system_attributes = md5_of_message_system_attributes_;
     sequence_number = sequence_number_;
   }
    : send_message_batch_result_entry)

let make_message_system_attribute_value ?string_value:(string_value_ : string_ option)
    ?binary_value:(binary_value_ : binary option)
    ?string_list_values:(string_list_values_ : string_list option)
    ?binary_list_values:(binary_list_values_ : binary_list option) ~data_type:(data_type_ : string_)
    () =
  ({
     string_value = string_value_;
     binary_value = binary_value_;
     string_list_values = string_list_values_;
     binary_list_values = binary_list_values_;
     data_type = data_type_;
   }
    : message_system_attribute_value)

let make_message_attribute_value ?string_value:(string_value_ : string_ option)
    ?binary_value:(binary_value_ : binary option)
    ?string_list_values:(string_list_values_ : string_list option)
    ?binary_list_values:(binary_list_values_ : binary_list option) ~data_type:(data_type_ : string_)
    () =
  ({
     string_value = string_value_;
     binary_value = binary_value_;
     string_list_values = string_list_values_;
     binary_list_values = binary_list_values_;
     data_type = data_type_;
   }
    : message_attribute_value)

let make_send_message_batch_request_entry ?delay_seconds:(delay_seconds_ : nullable_integer option)
    ?message_attributes:(message_attributes_ : message_body_attribute_map option)
    ?message_system_attributes:
      (message_system_attributes_ : message_body_system_attribute_map option)
    ?message_deduplication_id:(message_deduplication_id_ : string_ option)
    ?message_group_id:(message_group_id_ : string_ option) ~id:(id_ : string_)
    ~message_body:(message_body_ : string_) () =
  ({
     id = id_;
     message_body = message_body_;
     delay_seconds = delay_seconds_;
     message_attributes = message_attributes_;
     message_system_attributes = message_system_attributes_;
     message_deduplication_id = message_deduplication_id_;
     message_group_id = message_group_id_;
   }
    : send_message_batch_request_entry)

let make_send_message_batch_request ~queue_url:(queue_url_ : string_)
    ~entries:(entries_ : send_message_batch_request_entry_list) () =
  ({ queue_url = queue_url_; entries = entries_ } : send_message_batch_request)

let make_send_message_request ?delay_seconds:(delay_seconds_ : nullable_integer option)
    ?message_attributes:(message_attributes_ : message_body_attribute_map option)
    ?message_system_attributes:
      (message_system_attributes_ : message_body_system_attribute_map option)
    ?message_deduplication_id:(message_deduplication_id_ : string_ option)
    ?message_group_id:(message_group_id_ : string_ option) ~queue_url:(queue_url_ : string_)
    ~message_body:(message_body_ : string_) () =
  ({
     queue_url = queue_url_;
     message_body = message_body_;
     delay_seconds = delay_seconds_;
     message_attributes = message_attributes_;
     message_system_attributes = message_system_attributes_;
     message_deduplication_id = message_deduplication_id_;
     message_group_id = message_group_id_;
   }
    : send_message_request)

let make_remove_permission_request ~queue_url:(queue_url_ : string_) ~label:(label_ : string_) () =
  ({ queue_url = queue_url_; label = label_ } : remove_permission_request)

let make_message ?message_id:(message_id_ : string_ option)
    ?receipt_handle:(receipt_handle_ : string_ option) ?md5_of_body:(md5_of_body_ : string_ option)
    ?body:(body_ : string_ option) ?attributes:(attributes_ : message_system_attribute_map option)
    ?md5_of_message_attributes:(md5_of_message_attributes_ : string_ option)
    ?message_attributes:(message_attributes_ : message_body_attribute_map option) () =
  ({
     message_id = message_id_;
     receipt_handle = receipt_handle_;
     md5_of_body = md5_of_body_;
     body = body_;
     attributes = attributes_;
     md5_of_message_attributes = md5_of_message_attributes_;
     message_attributes = message_attributes_;
   }
    : message)

let make_receive_message_request ?attribute_names:(attribute_names_ : attribute_name_list option)
    ?message_system_attribute_names:
      (message_system_attribute_names_ : message_system_attribute_list option)
    ?message_attribute_names:(message_attribute_names_ : message_attribute_name_list option)
    ?max_number_of_messages:(max_number_of_messages_ : nullable_integer option)
    ?visibility_timeout:(visibility_timeout_ : nullable_integer option)
    ?wait_time_seconds:(wait_time_seconds_ : nullable_integer option)
    ?receive_request_attempt_id:(receive_request_attempt_id_ : string_ option)
    ~queue_url:(queue_url_ : string_) () =
  ({
     queue_url = queue_url_;
     attribute_names = attribute_names_;
     message_system_attribute_names = message_system_attribute_names_;
     message_attribute_names = message_attribute_names_;
     max_number_of_messages = max_number_of_messages_;
     visibility_timeout = visibility_timeout_;
     wait_time_seconds = wait_time_seconds_;
     receive_request_attempt_id = receive_request_attempt_id_;
   }
    : receive_message_request)

let make_purge_queue_request ~queue_url:(queue_url_ : string_) () =
  ({ queue_url = queue_url_ } : purge_queue_request)

let make_list_queue_tags_request ~queue_url:(queue_url_ : string_) () =
  ({ queue_url = queue_url_ } : list_queue_tags_request)

let make_list_queues_request ?queue_name_prefix:(queue_name_prefix_ : string_ option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : boxed_integer option) () =
  ({ queue_name_prefix = queue_name_prefix_; next_token = next_token_; max_results = max_results_ }
    : list_queues_request)

let make_list_message_move_tasks_result_entry ?task_handle:(task_handle_ : string_ option)
    ?status:(status_ : string_ option) ?source_arn:(source_arn_ : string_ option)
    ?destination_arn:(destination_arn_ : string_ option)
    ?max_number_of_messages_per_second:
      (max_number_of_messages_per_second_ : nullable_integer option)
    ?approximate_number_of_messages_moved:(approximate_number_of_messages_moved_ : long option)
    ?approximate_number_of_messages_to_move:
      (approximate_number_of_messages_to_move_ : nullable_long option)
    ?failure_reason:(failure_reason_ : string_ option)
    ?started_timestamp:(started_timestamp_ : long option) () =
  ({
     task_handle = task_handle_;
     status = status_;
     source_arn = source_arn_;
     destination_arn = destination_arn_;
     max_number_of_messages_per_second = max_number_of_messages_per_second_;
     approximate_number_of_messages_moved = approximate_number_of_messages_moved_;
     approximate_number_of_messages_to_move = approximate_number_of_messages_to_move_;
     failure_reason = failure_reason_;
     started_timestamp = started_timestamp_;
   }
    : list_message_move_tasks_result_entry)

let make_list_message_move_tasks_request ?max_results:(max_results_ : nullable_integer option)
    ~source_arn:(source_arn_ : string_) () =
  ({ source_arn = source_arn_; max_results = max_results_ } : list_message_move_tasks_request)

let make_list_dead_letter_source_queues_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : boxed_integer option) ~queue_url:(queue_url_ : string_) () =
  ({ queue_url = queue_url_; next_token = next_token_; max_results = max_results_ }
    : list_dead_letter_source_queues_request)

let make_get_queue_url_request
    ?queue_owner_aws_account_id:(queue_owner_aws_account_id_ : string_ option)
    ~queue_name:(queue_name_ : string_) () =
  ({ queue_name = queue_name_; queue_owner_aws_account_id = queue_owner_aws_account_id_ }
    : get_queue_url_request)

let make_get_queue_attributes_request
    ?attribute_names:(attribute_names_ : attribute_name_list option)
    ~queue_url:(queue_url_ : string_) () =
  ({ queue_url = queue_url_; attribute_names = attribute_names_ } : get_queue_attributes_request)

let make_delete_queue_request ~queue_url:(queue_url_ : string_) () =
  ({ queue_url = queue_url_ } : delete_queue_request)

let make_delete_message_batch_result_entry ~id:(id_ : string_) () =
  ({ id = id_ } : delete_message_batch_result_entry)

let make_delete_message_batch_request_entry ~id:(id_ : string_)
    ~receipt_handle:(receipt_handle_ : string_) () =
  ({ id = id_; receipt_handle = receipt_handle_ } : delete_message_batch_request_entry)

let make_delete_message_batch_request ~queue_url:(queue_url_ : string_)
    ~entries:(entries_ : delete_message_batch_request_entry_list) () =
  ({ queue_url = queue_url_; entries = entries_ } : delete_message_batch_request)

let make_delete_message_request ~queue_url:(queue_url_ : string_)
    ~receipt_handle:(receipt_handle_ : string_) () =
  ({ queue_url = queue_url_; receipt_handle = receipt_handle_ } : delete_message_request)

let make_create_queue_request ?attributes:(attributes_ : queue_attribute_map option)
    ?tags:(tags_ : tag_map option) ~queue_name:(queue_name_ : string_) () =
  ({ queue_name = queue_name_; attributes = attributes_; tags = tags_ } : create_queue_request)

let make_change_message_visibility_batch_result_entry ~id:(id_ : string_) () =
  ({ id = id_ } : change_message_visibility_batch_result_entry)

let make_change_message_visibility_batch_request_entry
    ?visibility_timeout:(visibility_timeout_ : nullable_integer option) ~id:(id_ : string_)
    ~receipt_handle:(receipt_handle_ : string_) () =
  ({ id = id_; receipt_handle = receipt_handle_; visibility_timeout = visibility_timeout_ }
    : change_message_visibility_batch_request_entry)

let make_change_message_visibility_batch_request ~queue_url:(queue_url_ : string_)
    ~entries:(entries_ : change_message_visibility_batch_request_entry_list) () =
  ({ queue_url = queue_url_; entries = entries_ } : change_message_visibility_batch_request)

let make_change_message_visibility_request ~queue_url:(queue_url_ : string_)
    ~receipt_handle:(receipt_handle_ : string_)
    ~visibility_timeout:(visibility_timeout_ : nullable_integer) () =
  ({
     queue_url = queue_url_;
     receipt_handle = receipt_handle_;
     visibility_timeout = visibility_timeout_;
   }
    : change_message_visibility_request)

let make_cancel_message_move_task_request ~task_handle:(task_handle_ : string_) () =
  ({ task_handle = task_handle_ } : cancel_message_move_task_request)
