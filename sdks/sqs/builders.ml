open Smaws_Lib
open Types
let make_untag_queue_request ~tag_keys:(tag_keys_ : string list)
  ~queue_url:(queue_url_ : string) () =
  ({ tag_keys = tag_keys_; queue_url = queue_url_ } : untag_queue_request)
let make_tag_queue_request ~tags:(tags_ : tag_map)
  ~queue_url:(queue_url_ : string) () =
  ({ tags = tags_; queue_url = queue_url_ } : tag_queue_request)
let make_start_message_move_task_request
  ?max_number_of_messages_per_second:(max_number_of_messages_per_second_ :
                                       int option)
  ?destination_arn:(destination_arn_ : string option)
  ~source_arn:(source_arn_ : string) () =
  ({
     max_number_of_messages_per_second = max_number_of_messages_per_second_;
     destination_arn = destination_arn_;
     source_arn = source_arn_
   } : start_message_move_task_request)
let make_set_queue_attributes_request
  ~attributes:(attributes_ : queue_attribute_map)
  ~queue_url:(queue_url_ : string) () =
  ({ attributes = attributes_; queue_url = queue_url_ } : set_queue_attributes_request)
let make_message_attribute_value
  ?binary_list_values:(binary_list_values_ : bytes list option)
  ?string_list_values:(string_list_values_ : string list option)
  ?binary_value:(binary_value_ : bytes option)
  ?string_value:(string_value_ : string option)
  ~data_type:(data_type_ : string) () =
  ({
     data_type = data_type_;
     binary_list_values = binary_list_values_;
     string_list_values = string_list_values_;
     binary_value = binary_value_;
     string_value = string_value_
   } : message_attribute_value)
let make_message_system_attribute_value
  ?binary_list_values:(binary_list_values_ : bytes list option)
  ?string_list_values:(string_list_values_ : string list option)
  ?binary_value:(binary_value_ : bytes option)
  ?string_value:(string_value_ : string option)
  ~data_type:(data_type_ : string) () =
  ({
     data_type = data_type_;
     binary_list_values = binary_list_values_;
     string_list_values = string_list_values_;
     binary_value = binary_value_;
     string_value = string_value_
   } : message_system_attribute_value)
let make_send_message_request
  ?message_group_id:(message_group_id_ : string option)
  ?message_deduplication_id:(message_deduplication_id_ : string option)
  ?message_system_attributes:(message_system_attributes_ :
                               message_body_system_attribute_map option)
  ?message_attributes:(message_attributes_ :
                        message_body_attribute_map option)
  ?delay_seconds:(delay_seconds_ : int option)
  ~message_body:(message_body_ : string) ~queue_url:(queue_url_ : string) ()
  =
  ({
     message_group_id = message_group_id_;
     message_deduplication_id = message_deduplication_id_;
     message_system_attributes = message_system_attributes_;
     message_attributes = message_attributes_;
     delay_seconds = delay_seconds_;
     message_body = message_body_;
     queue_url = queue_url_
   } : send_message_request)
let make_send_message_batch_result_entry
  ?sequence_number:(sequence_number_ : string option)
  ?md5_of_message_system_attributes:(md5_of_message_system_attributes_ :
                                      string option)
  ?md5_of_message_attributes:(md5_of_message_attributes_ : string option)
  ~md5_of_message_body:(md5_of_message_body_ : string)
  ~message_id:(message_id_ : string) ~id:(id_ : string) () =
  ({
     sequence_number = sequence_number_;
     md5_of_message_system_attributes = md5_of_message_system_attributes_;
     md5_of_message_attributes = md5_of_message_attributes_;
     md5_of_message_body = md5_of_message_body_;
     message_id = message_id_;
     id = id_
   } : send_message_batch_result_entry)
let make_batch_result_error_entry ?message:(message_ : string option)
  ~code:(code_ : string) ~sender_fault:(sender_fault_ : bool)
  ~id:(id_ : string) () =
  ({ message = message_; code = code_; sender_fault = sender_fault_; id = id_
   } : batch_result_error_entry)
let make_send_message_batch_request_entry
  ?message_group_id:(message_group_id_ : string option)
  ?message_deduplication_id:(message_deduplication_id_ : string option)
  ?message_system_attributes:(message_system_attributes_ :
                               message_body_system_attribute_map option)
  ?message_attributes:(message_attributes_ :
                        message_body_attribute_map option)
  ?delay_seconds:(delay_seconds_ : int option)
  ~message_body:(message_body_ : string) ~id:(id_ : string) () =
  ({
     message_group_id = message_group_id_;
     message_deduplication_id = message_deduplication_id_;
     message_system_attributes = message_system_attributes_;
     message_attributes = message_attributes_;
     delay_seconds = delay_seconds_;
     message_body = message_body_;
     id = id_
   } : send_message_batch_request_entry)
let make_send_message_batch_request
  ~entries:(entries_ : send_message_batch_request_entry list)
  ~queue_url:(queue_url_ : string) () =
  ({ entries = entries_; queue_url = queue_url_ } : send_message_batch_request)
let make_remove_permission_request ~label:(label_ : string)
  ~queue_url:(queue_url_ : string) () =
  ({ label = label_; queue_url = queue_url_ } : remove_permission_request)
let make_message
  ?message_attributes:(message_attributes_ :
                        message_body_attribute_map option)
  ?md5_of_message_attributes:(md5_of_message_attributes_ : string option)
  ?attributes:(attributes_ : message_system_attribute_map option)
  ?body:(body_ : string option) ?md5_of_body:(md5_of_body_ : string option)
  ?receipt_handle:(receipt_handle_ : string option)
  ?message_id:(message_id_ : string option) () =
  ({
     message_attributes = message_attributes_;
     md5_of_message_attributes = md5_of_message_attributes_;
     attributes = attributes_;
     body = body_;
     md5_of_body = md5_of_body_;
     receipt_handle = receipt_handle_;
     message_id = message_id_
   } : message)
let make_receive_message_request
  ?receive_request_attempt_id:(receive_request_attempt_id_ : string option)
  ?wait_time_seconds:(wait_time_seconds_ : int option)
  ?visibility_timeout:(visibility_timeout_ : int option)
  ?max_number_of_messages:(max_number_of_messages_ : int option)
  ?message_attribute_names:(message_attribute_names_ : string list option)
  ?message_system_attribute_names:(message_system_attribute_names_ :
                                    message_system_attribute_name list option)
  ?attribute_names:(attribute_names_ : queue_attribute_name list option)
  ~queue_url:(queue_url_ : string) () =
  ({
     receive_request_attempt_id = receive_request_attempt_id_;
     wait_time_seconds = wait_time_seconds_;
     visibility_timeout = visibility_timeout_;
     max_number_of_messages = max_number_of_messages_;
     message_attribute_names = message_attribute_names_;
     message_system_attribute_names = message_system_attribute_names_;
     attribute_names = attribute_names_;
     queue_url = queue_url_
   } : receive_message_request)
let make_purge_queue_request ~queue_url:(queue_url_ : string) () =
  ({ queue_url = queue_url_ } : purge_queue_request)
let make_list_queues_request ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?queue_name_prefix:(queue_name_prefix_ : string option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     queue_name_prefix = queue_name_prefix_
   } : list_queues_request)
let make_list_queue_tags_request ~queue_url:(queue_url_ : string) () =
  ({ queue_url = queue_url_ } : list_queue_tags_request)
let make_list_message_move_tasks_result_entry
  ?started_timestamp:(started_timestamp_ : int option)
  ?failure_reason:(failure_reason_ : string option)
  ?approximate_number_of_messages_to_move:(approximate_number_of_messages_to_move_
                                            : int option)
  ?approximate_number_of_messages_moved:(approximate_number_of_messages_moved_
                                          : int option)
  ?max_number_of_messages_per_second:(max_number_of_messages_per_second_ :
                                       int option)
  ?destination_arn:(destination_arn_ : string option)
  ?source_arn:(source_arn_ : string option) ?status:(status_ : string option)
  ?task_handle:(task_handle_ : string option) () =
  ({
     started_timestamp = started_timestamp_;
     failure_reason = failure_reason_;
     approximate_number_of_messages_to_move =
       approximate_number_of_messages_to_move_;
     approximate_number_of_messages_moved =
       approximate_number_of_messages_moved_;
     max_number_of_messages_per_second = max_number_of_messages_per_second_;
     destination_arn = destination_arn_;
     source_arn = source_arn_;
     status = status_;
     task_handle = task_handle_
   } : list_message_move_tasks_result_entry)
let make_list_message_move_tasks_request
  ?max_results:(max_results_ : int option) ~source_arn:(source_arn_ : string)
  () =
  ({ max_results = max_results_; source_arn = source_arn_ } : list_message_move_tasks_request)
let make_list_dead_letter_source_queues_request
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) ~queue_url:(queue_url_ : string)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     queue_url = queue_url_
   } : list_dead_letter_source_queues_request)
let make_get_queue_url_request
  ?queue_owner_aws_account_id:(queue_owner_aws_account_id_ : string option)
  ~queue_name:(queue_name_ : string) () =
  ({
     queue_owner_aws_account_id = queue_owner_aws_account_id_;
     queue_name = queue_name_
   } : get_queue_url_request)
let make_get_queue_attributes_request
  ?attribute_names:(attribute_names_ : queue_attribute_name list option)
  ~queue_url:(queue_url_ : string) () =
  ({ attribute_names = attribute_names_; queue_url = queue_url_ } : get_queue_attributes_request)
let make_delete_queue_request ~queue_url:(queue_url_ : string) () =
  ({ queue_url = queue_url_ } : delete_queue_request)
let make_delete_message_request ~receipt_handle:(receipt_handle_ : string)
  ~queue_url:(queue_url_ : string) () =
  ({ receipt_handle = receipt_handle_; queue_url = queue_url_ } : delete_message_request)
let make_delete_message_batch_result_entry ~id:(id_ : string) () =
  ({ id = id_ } : delete_message_batch_result_entry)
let make_delete_message_batch_request_entry
  ~receipt_handle:(receipt_handle_ : string) ~id:(id_ : string) () =
  ({ receipt_handle = receipt_handle_; id = id_ } : delete_message_batch_request_entry)
let make_delete_message_batch_request
  ~entries:(entries_ : delete_message_batch_request_entry list)
  ~queue_url:(queue_url_ : string) () =
  ({ entries = entries_; queue_url = queue_url_ } : delete_message_batch_request)
let make_create_queue_request ?tags:(tags_ : tag_map option)
  ?attributes:(attributes_ : queue_attribute_map option)
  ~queue_name:(queue_name_ : string) () =
  ({ tags = tags_; attributes = attributes_; queue_name = queue_name_ } : 
  create_queue_request)
let make_change_message_visibility_request
  ~visibility_timeout:(visibility_timeout_ : int)
  ~receipt_handle:(receipt_handle_ : string) ~queue_url:(queue_url_ : string)
  () =
  ({
     visibility_timeout = visibility_timeout_;
     receipt_handle = receipt_handle_;
     queue_url = queue_url_
   } : change_message_visibility_request)
let make_change_message_visibility_batch_result_entry ~id:(id_ : string) () =
  ({ id = id_ } : change_message_visibility_batch_result_entry)
let make_change_message_visibility_batch_request_entry
  ?visibility_timeout:(visibility_timeout_ : int option)
  ~receipt_handle:(receipt_handle_ : string) ~id:(id_ : string) () =
  ({
     visibility_timeout = visibility_timeout_;
     receipt_handle = receipt_handle_;
     id = id_
   } : change_message_visibility_batch_request_entry)
let make_change_message_visibility_batch_request
  ~entries:(entries_ : change_message_visibility_batch_request_entry list)
  ~queue_url:(queue_url_ : string) () =
  ({ entries = entries_; queue_url = queue_url_ } : change_message_visibility_batch_request)
let make_cancel_message_move_task_request
  ~task_handle:(task_handle_ : string) () =
  ({ task_handle = task_handle_ } : cancel_message_move_task_request)
let make_add_permission_request ~actions:(actions_ : string list)
  ~aws_account_ids:(aws_account_ids_ : string list) ~label:(label_ : string)
  ~queue_url:(queue_url_ : string) () =
  ({
     actions = actions_;
     aws_account_ids = aws_account_ids_;
     label = label_;
     queue_url = queue_url_
   } : add_permission_request)