open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let aws_account_id_list_to_yojson tree = list_to_yojson string__to_yojson tree
let action_name_list_to_yojson tree = list_to_yojson string__to_yojson tree
let exception_message_to_yojson = string_to_yojson

let unsupported_operation_to_yojson (x : unsupported_operation) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let request_throttled_to_yojson (x : request_throttled) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let queue_does_not_exist_to_yojson (x : queue_does_not_exist) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let over_limit_to_yojson (x : over_limit) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_security_to_yojson (x : invalid_security) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_address_to_yojson (x : invalid_address) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let add_permission_request_to_yojson (x : add_permission_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("Label", Some (string__to_yojson x.label));
      ("AWSAccountIds", Some (aws_account_id_list_to_yojson x.aws_account_ids));
      ("Actions", Some (action_name_list_to_yojson x.actions));
    ]

let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_queue_request_to_yojson (x : untag_queue_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_queue_request_to_yojson (x : tag_queue_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url)); ("Tags", Some (tag_map_to_yojson x.tags));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let start_message_move_task_result_to_yojson (x : start_message_move_task_result) =
  assoc_to_yojson [ ("TaskHandle", option_to_yojson string__to_yojson x.task_handle) ]

let nullable_integer_to_yojson = int_to_yojson

let start_message_move_task_request_to_yojson (x : start_message_move_task_request) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string__to_yojson x.source_arn));
      ("DestinationArn", option_to_yojson string__to_yojson x.destination_arn);
      ( "MaxNumberOfMessagesPerSecond",
        option_to_yojson nullable_integer_to_yojson x.max_number_of_messages_per_second );
    ]

let invalid_attribute_value_to_yojson (x : invalid_attribute_value) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_attribute_name_to_yojson (x : invalid_attribute_name) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let queue_attribute_name_to_yojson (x : queue_attribute_name) =
  match x with
  | All -> `String "All"
  | Policy -> `String "Policy"
  | VisibilityTimeout -> `String "VisibilityTimeout"
  | MaximumMessageSize -> `String "MaximumMessageSize"
  | MessageRetentionPeriod -> `String "MessageRetentionPeriod"
  | ApproximateNumberOfMessages -> `String "ApproximateNumberOfMessages"
  | ApproximateNumberOfMessagesNotVisible -> `String "ApproximateNumberOfMessagesNotVisible"
  | CreatedTimestamp -> `String "CreatedTimestamp"
  | LastModifiedTimestamp -> `String "LastModifiedTimestamp"
  | QueueArn -> `String "QueueArn"
  | ApproximateNumberOfMessagesDelayed -> `String "ApproximateNumberOfMessagesDelayed"
  | DelaySeconds -> `String "DelaySeconds"
  | ReceiveMessageWaitTimeSeconds -> `String "ReceiveMessageWaitTimeSeconds"
  | RedrivePolicy -> `String "RedrivePolicy"
  | FifoQueue -> `String "FifoQueue"
  | ContentBasedDeduplication -> `String "ContentBasedDeduplication"
  | KmsMasterKeyId -> `String "KmsMasterKeyId"
  | KmsDataKeyReusePeriodSeconds -> `String "KmsDataKeyReusePeriodSeconds"
  | DeduplicationScope -> `String "DeduplicationScope"
  | FifoThroughputLimit -> `String "FifoThroughputLimit"
  | RedriveAllowPolicy -> `String "RedriveAllowPolicy"
  | SqsManagedSseEnabled -> `String "SqsManagedSseEnabled"

let queue_attribute_map_to_yojson tree =
  map_to_yojson queue_attribute_name_to_yojson string__to_yojson tree

let set_queue_attributes_request_to_yojson (x : set_queue_attributes_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("Attributes", Some (queue_attribute_map_to_yojson x.attributes));
    ]

let too_many_entries_in_batch_request_to_yojson (x : too_many_entries_in_batch_request) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_throttled_to_yojson (x : kms_throttled) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_opt_in_required_to_yojson (x : kms_opt_in_required) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_not_found_to_yojson (x : kms_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_invalid_state_to_yojson (x : kms_invalid_state) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_invalid_key_usage_to_yojson (x : kms_invalid_key_usage) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_disabled_to_yojson (x : kms_disabled) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let kms_access_denied_to_yojson (x : kms_access_denied) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_batch_entry_id_to_yojson (x : invalid_batch_entry_id) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let empty_batch_request_to_yojson (x : empty_batch_request) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let batch_request_too_long_to_yojson (x : batch_request_too_long) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let batch_entry_ids_not_distinct_to_yojson (x : batch_entry_ids_not_distinct) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let boolean__to_yojson = bool_to_yojson

let batch_result_error_entry_to_yojson (x : batch_result_error_entry) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("SenderFault", Some (boolean__to_yojson x.sender_fault));
      ("Code", Some (string__to_yojson x.code));
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let batch_result_error_entry_list_to_yojson tree =
  list_to_yojson batch_result_error_entry_to_yojson tree

let send_message_batch_result_entry_to_yojson (x : send_message_batch_result_entry) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("MessageId", Some (string__to_yojson x.message_id));
      ("MD5OfMessageBody", Some (string__to_yojson x.md5_of_message_body));
      ("MD5OfMessageAttributes", option_to_yojson string__to_yojson x.md5_of_message_attributes);
      ( "MD5OfMessageSystemAttributes",
        option_to_yojson string__to_yojson x.md5_of_message_system_attributes );
      ("SequenceNumber", option_to_yojson string__to_yojson x.sequence_number);
    ]

let send_message_batch_result_entry_list_to_yojson tree =
  list_to_yojson send_message_batch_result_entry_to_yojson tree

let send_message_batch_result_to_yojson (x : send_message_batch_result) =
  assoc_to_yojson
    [
      ("Successful", Some (send_message_batch_result_entry_list_to_yojson x.successful));
      ("Failed", Some (batch_result_error_entry_list_to_yojson x.failed));
    ]

let binary_to_yojson = blob_to_yojson
let binary_list_to_yojson tree = list_to_yojson binary_to_yojson tree
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let message_system_attribute_value_to_yojson (x : message_system_attribute_value) =
  assoc_to_yojson
    [
      ("StringValue", option_to_yojson string__to_yojson x.string_value);
      ("BinaryValue", option_to_yojson binary_to_yojson x.binary_value);
      ("StringListValues", option_to_yojson string_list_to_yojson x.string_list_values);
      ("BinaryListValues", option_to_yojson binary_list_to_yojson x.binary_list_values);
      ("DataType", Some (string__to_yojson x.data_type));
    ]

let message_system_attribute_name_for_sends_to_yojson (x : message_system_attribute_name_for_sends)
    =
  match x with AWSTraceHeader -> `String "AWSTraceHeader"

let message_body_system_attribute_map_to_yojson tree =
  map_to_yojson message_system_attribute_name_for_sends_to_yojson
    message_system_attribute_value_to_yojson tree

let message_attribute_value_to_yojson (x : message_attribute_value) =
  assoc_to_yojson
    [
      ("StringValue", option_to_yojson string__to_yojson x.string_value);
      ("BinaryValue", option_to_yojson binary_to_yojson x.binary_value);
      ("StringListValues", option_to_yojson string_list_to_yojson x.string_list_values);
      ("BinaryListValues", option_to_yojson binary_list_to_yojson x.binary_list_values);
      ("DataType", Some (string__to_yojson x.data_type));
    ]

let message_body_attribute_map_to_yojson tree =
  map_to_yojson string__to_yojson message_attribute_value_to_yojson tree

let send_message_batch_request_entry_to_yojson (x : send_message_batch_request_entry) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("MessageBody", Some (string__to_yojson x.message_body));
      ("DelaySeconds", option_to_yojson nullable_integer_to_yojson x.delay_seconds);
      ( "MessageAttributes",
        option_to_yojson message_body_attribute_map_to_yojson x.message_attributes );
      ( "MessageSystemAttributes",
        option_to_yojson message_body_system_attribute_map_to_yojson x.message_system_attributes );
      ("MessageDeduplicationId", option_to_yojson string__to_yojson x.message_deduplication_id);
      ("MessageGroupId", option_to_yojson string__to_yojson x.message_group_id);
    ]

let send_message_batch_request_entry_list_to_yojson tree =
  list_to_yojson send_message_batch_request_entry_to_yojson tree

let send_message_batch_request_to_yojson (x : send_message_batch_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("Entries", Some (send_message_batch_request_entry_list_to_yojson x.entries));
    ]

let invalid_message_contents_to_yojson (x : invalid_message_contents) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let send_message_result_to_yojson (x : send_message_result) =
  assoc_to_yojson
    [
      ("MD5OfMessageBody", option_to_yojson string__to_yojson x.md5_of_message_body);
      ("MD5OfMessageAttributes", option_to_yojson string__to_yojson x.md5_of_message_attributes);
      ( "MD5OfMessageSystemAttributes",
        option_to_yojson string__to_yojson x.md5_of_message_system_attributes );
      ("MessageId", option_to_yojson string__to_yojson x.message_id);
      ("SequenceNumber", option_to_yojson string__to_yojson x.sequence_number);
    ]

let send_message_request_to_yojson (x : send_message_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("MessageBody", Some (string__to_yojson x.message_body));
      ("DelaySeconds", option_to_yojson nullable_integer_to_yojson x.delay_seconds);
      ( "MessageAttributes",
        option_to_yojson message_body_attribute_map_to_yojson x.message_attributes );
      ( "MessageSystemAttributes",
        option_to_yojson message_body_system_attribute_map_to_yojson x.message_system_attributes );
      ("MessageDeduplicationId", option_to_yojson string__to_yojson x.message_deduplication_id);
      ("MessageGroupId", option_to_yojson string__to_yojson x.message_group_id);
    ]

let remove_permission_request_to_yojson (x : remove_permission_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url)); ("Label", Some (string__to_yojson x.label));
    ]

let message_system_attribute_name_to_yojson (x : message_system_attribute_name) =
  match x with
  | All -> `String "All"
  | SenderId -> `String "SenderId"
  | SentTimestamp -> `String "SentTimestamp"
  | ApproximateReceiveCount -> `String "ApproximateReceiveCount"
  | ApproximateFirstReceiveTimestamp -> `String "ApproximateFirstReceiveTimestamp"
  | SequenceNumber -> `String "SequenceNumber"
  | MessageDeduplicationId -> `String "MessageDeduplicationId"
  | MessageGroupId -> `String "MessageGroupId"
  | AWSTraceHeader -> `String "AWSTraceHeader"
  | DeadLetterQueueSourceArn -> `String "DeadLetterQueueSourceArn"

let message_system_attribute_map_to_yojson tree =
  map_to_yojson message_system_attribute_name_to_yojson string__to_yojson tree

let message_to_yojson (x : message) =
  assoc_to_yojson
    [
      ("MessageId", option_to_yojson string__to_yojson x.message_id);
      ("ReceiptHandle", option_to_yojson string__to_yojson x.receipt_handle);
      ("MD5OfBody", option_to_yojson string__to_yojson x.md5_of_body);
      ("Body", option_to_yojson string__to_yojson x.body);
      ("Attributes", option_to_yojson message_system_attribute_map_to_yojson x.attributes);
      ("MD5OfMessageAttributes", option_to_yojson string__to_yojson x.md5_of_message_attributes);
      ( "MessageAttributes",
        option_to_yojson message_body_attribute_map_to_yojson x.message_attributes );
    ]

let message_list_to_yojson tree = list_to_yojson message_to_yojson tree

let receive_message_result_to_yojson (x : receive_message_result) =
  assoc_to_yojson [ ("Messages", option_to_yojson message_list_to_yojson x.messages) ]

let message_attribute_name_to_yojson = string_to_yojson

let message_attribute_name_list_to_yojson tree =
  list_to_yojson message_attribute_name_to_yojson tree

let message_system_attribute_list_to_yojson tree =
  list_to_yojson message_system_attribute_name_to_yojson tree

let attribute_name_list_to_yojson tree = list_to_yojson queue_attribute_name_to_yojson tree

let receive_message_request_to_yojson (x : receive_message_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("AttributeNames", option_to_yojson attribute_name_list_to_yojson x.attribute_names);
      ( "MessageSystemAttributeNames",
        option_to_yojson message_system_attribute_list_to_yojson x.message_system_attribute_names );
      ( "MessageAttributeNames",
        option_to_yojson message_attribute_name_list_to_yojson x.message_attribute_names );
      ("MaxNumberOfMessages", option_to_yojson nullable_integer_to_yojson x.max_number_of_messages);
      ("VisibilityTimeout", option_to_yojson nullable_integer_to_yojson x.visibility_timeout);
      ("WaitTimeSeconds", option_to_yojson nullable_integer_to_yojson x.wait_time_seconds);
      ("ReceiveRequestAttemptId", option_to_yojson string__to_yojson x.receive_request_attempt_id);
    ]

let purge_queue_in_progress_to_yojson (x : purge_queue_in_progress) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let purge_queue_request_to_yojson (x : purge_queue_request) =
  assoc_to_yojson [ ("QueueUrl", Some (string__to_yojson x.queue_url)) ]

let list_queue_tags_result_to_yojson (x : list_queue_tags_result) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_queue_tags_request_to_yojson (x : list_queue_tags_request) =
  assoc_to_yojson [ ("QueueUrl", Some (string__to_yojson x.queue_url)) ]

let token_to_yojson = string_to_yojson
let queue_url_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_queues_result_to_yojson (x : list_queues_result) =
  assoc_to_yojson
    [
      ("QueueUrls", option_to_yojson queue_url_list_to_yojson x.queue_urls);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let boxed_integer_to_yojson = int_to_yojson

let list_queues_request_to_yojson (x : list_queues_request) =
  assoc_to_yojson
    [
      ("QueueNamePrefix", option_to_yojson string__to_yojson x.queue_name_prefix);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let long_to_yojson = long_to_yojson
let nullable_long_to_yojson = long_to_yojson

let list_message_move_tasks_result_entry_to_yojson (x : list_message_move_tasks_result_entry) =
  assoc_to_yojson
    [
      ("TaskHandle", option_to_yojson string__to_yojson x.task_handle);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("SourceArn", option_to_yojson string__to_yojson x.source_arn);
      ("DestinationArn", option_to_yojson string__to_yojson x.destination_arn);
      ( "MaxNumberOfMessagesPerSecond",
        option_to_yojson nullable_integer_to_yojson x.max_number_of_messages_per_second );
      ( "ApproximateNumberOfMessagesMoved",
        option_to_yojson long_to_yojson x.approximate_number_of_messages_moved );
      ( "ApproximateNumberOfMessagesToMove",
        option_to_yojson nullable_long_to_yojson x.approximate_number_of_messages_to_move );
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("StartedTimestamp", option_to_yojson long_to_yojson x.started_timestamp);
    ]

let list_message_move_tasks_result_entry_list_to_yojson tree =
  list_to_yojson list_message_move_tasks_result_entry_to_yojson tree

let list_message_move_tasks_result_to_yojson (x : list_message_move_tasks_result) =
  assoc_to_yojson
    [ ("Results", option_to_yojson list_message_move_tasks_result_entry_list_to_yojson x.results) ]

let list_message_move_tasks_request_to_yojson (x : list_message_move_tasks_request) =
  assoc_to_yojson
    [
      ("SourceArn", Some (string__to_yojson x.source_arn));
      ("MaxResults", option_to_yojson nullable_integer_to_yojson x.max_results);
    ]

let list_dead_letter_source_queues_result_to_yojson (x : list_dead_letter_source_queues_result) =
  assoc_to_yojson
    [
      ("queueUrls", Some (queue_url_list_to_yojson x.queue_urls));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let list_dead_letter_source_queues_request_to_yojson (x : list_dead_letter_source_queues_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson boxed_integer_to_yojson x.max_results);
    ]

let get_queue_url_result_to_yojson (x : get_queue_url_result) =
  assoc_to_yojson [ ("QueueUrl", option_to_yojson string__to_yojson x.queue_url) ]

let get_queue_url_request_to_yojson (x : get_queue_url_request) =
  assoc_to_yojson
    [
      ("QueueName", Some (string__to_yojson x.queue_name));
      ("QueueOwnerAWSAccountId", option_to_yojson string__to_yojson x.queue_owner_aws_account_id);
    ]

let get_queue_attributes_result_to_yojson (x : get_queue_attributes_result) =
  assoc_to_yojson [ ("Attributes", option_to_yojson queue_attribute_map_to_yojson x.attributes) ]

let get_queue_attributes_request_to_yojson (x : get_queue_attributes_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("AttributeNames", option_to_yojson attribute_name_list_to_yojson x.attribute_names);
    ]

let delete_queue_request_to_yojson (x : delete_queue_request) =
  assoc_to_yojson [ ("QueueUrl", Some (string__to_yojson x.queue_url)) ]

let delete_message_batch_result_entry_to_yojson (x : delete_message_batch_result_entry) =
  assoc_to_yojson [ ("Id", Some (string__to_yojson x.id)) ]

let delete_message_batch_result_entry_list_to_yojson tree =
  list_to_yojson delete_message_batch_result_entry_to_yojson tree

let delete_message_batch_result_to_yojson (x : delete_message_batch_result) =
  assoc_to_yojson
    [
      ("Successful", Some (delete_message_batch_result_entry_list_to_yojson x.successful));
      ("Failed", Some (batch_result_error_entry_list_to_yojson x.failed));
    ]

let delete_message_batch_request_entry_to_yojson (x : delete_message_batch_request_entry) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("ReceiptHandle", Some (string__to_yojson x.receipt_handle));
    ]

let delete_message_batch_request_entry_list_to_yojson tree =
  list_to_yojson delete_message_batch_request_entry_to_yojson tree

let delete_message_batch_request_to_yojson (x : delete_message_batch_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("Entries", Some (delete_message_batch_request_entry_list_to_yojson x.entries));
    ]

let receipt_handle_is_invalid_to_yojson (x : receipt_handle_is_invalid) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_id_format_to_yojson = unit_to_yojson

let delete_message_request_to_yojson (x : delete_message_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("ReceiptHandle", Some (string__to_yojson x.receipt_handle));
    ]

let queue_name_exists_to_yojson (x : queue_name_exists) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let queue_deleted_recently_to_yojson (x : queue_deleted_recently) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_queue_result_to_yojson (x : create_queue_result) =
  assoc_to_yojson [ ("QueueUrl", option_to_yojson string__to_yojson x.queue_url) ]

let create_queue_request_to_yojson (x : create_queue_request) =
  assoc_to_yojson
    [
      ("QueueName", Some (string__to_yojson x.queue_name));
      ("Attributes", option_to_yojson queue_attribute_map_to_yojson x.attributes);
      ("tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let change_message_visibility_batch_result_entry_to_yojson
    (x : change_message_visibility_batch_result_entry) =
  assoc_to_yojson [ ("Id", Some (string__to_yojson x.id)) ]

let change_message_visibility_batch_result_entry_list_to_yojson tree =
  list_to_yojson change_message_visibility_batch_result_entry_to_yojson tree

let change_message_visibility_batch_result_to_yojson (x : change_message_visibility_batch_result) =
  assoc_to_yojson
    [
      ("Successful", Some (change_message_visibility_batch_result_entry_list_to_yojson x.successful));
      ("Failed", Some (batch_result_error_entry_list_to_yojson x.failed));
    ]

let change_message_visibility_batch_request_entry_to_yojson
    (x : change_message_visibility_batch_request_entry) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("ReceiptHandle", Some (string__to_yojson x.receipt_handle));
      ("VisibilityTimeout", option_to_yojson nullable_integer_to_yojson x.visibility_timeout);
    ]

let change_message_visibility_batch_request_entry_list_to_yojson tree =
  list_to_yojson change_message_visibility_batch_request_entry_to_yojson tree

let change_message_visibility_batch_request_to_yojson (x : change_message_visibility_batch_request)
    =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("Entries", Some (change_message_visibility_batch_request_entry_list_to_yojson x.entries));
    ]

let message_not_inflight_to_yojson = unit_to_yojson

let change_message_visibility_request_to_yojson (x : change_message_visibility_request) =
  assoc_to_yojson
    [
      ("QueueUrl", Some (string__to_yojson x.queue_url));
      ("ReceiptHandle", Some (string__to_yojson x.receipt_handle));
      ("VisibilityTimeout", Some (nullable_integer_to_yojson x.visibility_timeout));
    ]

let cancel_message_move_task_result_to_yojson (x : cancel_message_move_task_result) =
  assoc_to_yojson
    [
      ( "ApproximateNumberOfMessagesMoved",
        option_to_yojson long_to_yojson x.approximate_number_of_messages_moved );
    ]

let cancel_message_move_task_request_to_yojson (x : cancel_message_move_task_request) =
  assoc_to_yojson [ ("TaskHandle", Some (string__to_yojson x.task_handle)) ]
