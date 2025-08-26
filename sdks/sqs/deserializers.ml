open Smaws_Lib.Json.DeserializeHelpers
open Types
let string__of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_key_list_of_yojson "TagKeys" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : untag_queue_request)
let exception_message_of_yojson = string_of_yojson
let unsupported_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : unsupported_operation)
let request_throttled_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : request_throttled)
let queue_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : queue_does_not_exist)
let invalid_security_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : invalid_security)
let invalid_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : invalid_address)
let base_unit_of_yojson = unit_of_yojson
let too_many_entries_in_batch_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : too_many_entries_in_batch_request)
let token_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_map_of_yojson tree path =
  map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path
let tag_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_map_of_yojson "Tags" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : tag_queue_request)
let string_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let start_message_move_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_handle =
       (option_of_yojson (value_for_key string__of_yojson "TaskHandle") _list
          path)
   } : start_message_move_task_result)
let nullable_integer_of_yojson = int_of_yojson
let start_message_move_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_number_of_messages_per_second =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson
             "MaxNumberOfMessagesPerSecond") _list path);
     destination_arn =
       (option_of_yojson (value_for_key string__of_yojson "DestinationArn")
          _list path);
     source_arn = (value_for_key string__of_yojson "SourceArn" _list path)
   } : start_message_move_task_request)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : resource_not_found_exception)
let queue_attribute_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SqsManagedSseEnabled" -> SqsManagedSseEnabled
    | `String "RedriveAllowPolicy" -> RedriveAllowPolicy
    | `String "FifoThroughputLimit" -> FifoThroughputLimit
    | `String "DeduplicationScope" -> DeduplicationScope
    | `String "KmsDataKeyReusePeriodSeconds" -> KmsDataKeyReusePeriodSeconds
    | `String "KmsMasterKeyId" -> KmsMasterKeyId
    | `String "ContentBasedDeduplication" -> ContentBasedDeduplication
    | `String "FifoQueue" -> FifoQueue
    | `String "RedrivePolicy" -> RedrivePolicy
    | `String "ReceiveMessageWaitTimeSeconds" ->
        ReceiveMessageWaitTimeSeconds
    | `String "DelaySeconds" -> DelaySeconds
    | `String "ApproximateNumberOfMessagesDelayed" ->
        ApproximateNumberOfMessagesDelayed
    | `String "QueueArn" -> QueueArn
    | `String "LastModifiedTimestamp" -> LastModifiedTimestamp
    | `String "CreatedTimestamp" -> CreatedTimestamp
    | `String "ApproximateNumberOfMessagesNotVisible" ->
        ApproximateNumberOfMessagesNotVisible
    | `String "ApproximateNumberOfMessages" -> ApproximateNumberOfMessages
    | `String "MessageRetentionPeriod" -> MessageRetentionPeriod
    | `String "MaximumMessageSize" -> MaximumMessageSize
    | `String "VisibilityTimeout" -> VisibilityTimeout
    | `String "Policy" -> Policy
    | `String "All" -> All
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "QueueAttributeName"
             value)
    | _ -> raise (deserialize_wrong_type_error path "QueueAttributeName") : 
     queue_attribute_name) : queue_attribute_name)
let queue_attribute_map_of_yojson tree path =
  map_of_yojson queue_attribute_name_of_yojson string__of_yojson tree path
let set_queue_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (value_for_key queue_attribute_map_of_yojson "Attributes" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : set_queue_attributes_request)
let over_limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : over_limit)
let invalid_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : invalid_attribute_value)
let invalid_attribute_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : invalid_attribute_name)
let send_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sequence_number =
       (option_of_yojson (value_for_key string__of_yojson "SequenceNumber")
          _list path);
     message_id =
       (option_of_yojson (value_for_key string__of_yojson "MessageId") _list
          path);
     md5_of_message_system_attributes =
       (option_of_yojson
          (value_for_key string__of_yojson "MD5OfMessageSystemAttributes")
          _list path);
     md5_of_message_attributes =
       (option_of_yojson
          (value_for_key string__of_yojson "MD5OfMessageAttributes") _list
          path);
     md5_of_message_body =
       (option_of_yojson (value_for_key string__of_yojson "MD5OfMessageBody")
          _list path)
   } : send_message_result)
let binary_of_yojson = blob_of_yojson
let binary_list_of_yojson tree path =
  list_of_yojson binary_of_yojson tree path
let message_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_type = (value_for_key string__of_yojson "DataType" _list path);
     binary_list_values =
       (option_of_yojson
          (value_for_key binary_list_of_yojson "BinaryListValues") _list path);
     string_list_values =
       (option_of_yojson
          (value_for_key string_list_of_yojson "StringListValues") _list path);
     binary_value =
       (option_of_yojson (value_for_key binary_of_yojson "BinaryValue") _list
          path);
     string_value =
       (option_of_yojson (value_for_key string__of_yojson "StringValue")
          _list path)
   } : message_attribute_value)
let message_body_attribute_map_of_yojson tree path =
  map_of_yojson string__of_yojson message_attribute_value_of_yojson tree path
let message_system_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_type = (value_for_key string__of_yojson "DataType" _list path);
     binary_list_values =
       (option_of_yojson
          (value_for_key binary_list_of_yojson "BinaryListValues") _list path);
     string_list_values =
       (option_of_yojson
          (value_for_key string_list_of_yojson "StringListValues") _list path);
     binary_value =
       (option_of_yojson (value_for_key binary_of_yojson "BinaryValue") _list
          path);
     string_value =
       (option_of_yojson (value_for_key string__of_yojson "StringValue")
          _list path)
   } : message_system_attribute_value)
let message_system_attribute_name_for_sends_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "AWSTraceHeader" -> AWSTraceHeader
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "MessageSystemAttributeNameForSends" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "MessageSystemAttributeNameForSends") : message_system_attribute_name_for_sends) : 
  message_system_attribute_name_for_sends)
let message_body_system_attribute_map_of_yojson tree path =
  map_of_yojson message_system_attribute_name_for_sends_of_yojson
    message_system_attribute_value_of_yojson tree path
let send_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_group_id =
       (option_of_yojson (value_for_key string__of_yojson "MessageGroupId")
          _list path);
     message_deduplication_id =
       (option_of_yojson
          (value_for_key string__of_yojson "MessageDeduplicationId") _list
          path);
     message_system_attributes =
       (option_of_yojson
          (value_for_key message_body_system_attribute_map_of_yojson
             "MessageSystemAttributes") _list path);
     message_attributes =
       (option_of_yojson
          (value_for_key message_body_attribute_map_of_yojson
             "MessageAttributes") _list path);
     delay_seconds =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "DelaySeconds") _list
          path);
     message_body =
       (value_for_key string__of_yojson "MessageBody" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : send_message_request)
let send_message_batch_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sequence_number =
       (option_of_yojson (value_for_key string__of_yojson "SequenceNumber")
          _list path);
     md5_of_message_system_attributes =
       (option_of_yojson
          (value_for_key string__of_yojson "MD5OfMessageSystemAttributes")
          _list path);
     md5_of_message_attributes =
       (option_of_yojson
          (value_for_key string__of_yojson "MD5OfMessageAttributes") _list
          path);
     md5_of_message_body =
       (value_for_key string__of_yojson "MD5OfMessageBody" _list path);
     message_id = (value_for_key string__of_yojson "MessageId" _list path);
     id = (value_for_key string__of_yojson "Id" _list path)
   } : send_message_batch_result_entry)
let send_message_batch_result_entry_list_of_yojson tree path =
  list_of_yojson send_message_batch_result_entry_of_yojson tree path
let boolean__of_yojson = bool_of_yojson
let batch_result_error_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     code = (value_for_key string__of_yojson "Code" _list path);
     sender_fault =
       (value_for_key boolean__of_yojson "SenderFault" _list path);
     id = (value_for_key string__of_yojson "Id" _list path)
   } : batch_result_error_entry)
let batch_result_error_entry_list_of_yojson tree path =
  list_of_yojson batch_result_error_entry_of_yojson tree path
let send_message_batch_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed =
       (value_for_key batch_result_error_entry_list_of_yojson "Failed" _list
          path);
     successful =
       (value_for_key send_message_batch_result_entry_list_of_yojson
          "Successful" _list path)
   } : send_message_batch_result)
let send_message_batch_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_group_id =
       (option_of_yojson (value_for_key string__of_yojson "MessageGroupId")
          _list path);
     message_deduplication_id =
       (option_of_yojson
          (value_for_key string__of_yojson "MessageDeduplicationId") _list
          path);
     message_system_attributes =
       (option_of_yojson
          (value_for_key message_body_system_attribute_map_of_yojson
             "MessageSystemAttributes") _list path);
     message_attributes =
       (option_of_yojson
          (value_for_key message_body_attribute_map_of_yojson
             "MessageAttributes") _list path);
     delay_seconds =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "DelaySeconds") _list
          path);
     message_body =
       (value_for_key string__of_yojson "MessageBody" _list path);
     id = (value_for_key string__of_yojson "Id" _list path)
   } : send_message_batch_request_entry)
let send_message_batch_request_entry_list_of_yojson tree path =
  list_of_yojson send_message_batch_request_entry_of_yojson tree path
let send_message_batch_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries =
       (value_for_key send_message_batch_request_entry_list_of_yojson
          "Entries" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : send_message_batch_request)
let kms_throttled_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_throttled)
let kms_opt_in_required_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_opt_in_required)
let kms_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_not_found)
let kms_invalid_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_invalid_state)
let kms_invalid_key_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_invalid_key_usage)
let kms_disabled_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_disabled)
let kms_access_denied_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : kms_access_denied)
let invalid_batch_entry_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : invalid_batch_entry_id)
let empty_batch_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : empty_batch_request)
let batch_request_too_long_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : batch_request_too_long)
let batch_entry_ids_not_distinct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : batch_entry_ids_not_distinct)
let invalid_message_contents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : invalid_message_contents)
let remove_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label = (value_for_key string__of_yojson "Label" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : remove_permission_request)
let message_system_attribute_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DeadLetterQueueSourceArn" -> DeadLetterQueueSourceArn
    | `String "AWSTraceHeader" -> AWSTraceHeader
    | `String "MessageGroupId" -> MessageGroupId
    | `String "MessageDeduplicationId" -> MessageDeduplicationId
    | `String "SequenceNumber" -> SequenceNumber
    | `String "ApproximateFirstReceiveTimestamp" ->
        ApproximateFirstReceiveTimestamp
    | `String "ApproximateReceiveCount" -> ApproximateReceiveCount
    | `String "SentTimestamp" -> SentTimestamp
    | `String "SenderId" -> SenderId
    | `String "All" -> All
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "MessageSystemAttributeName" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "MessageSystemAttributeName") : 
     message_system_attribute_name) : message_system_attribute_name)
let message_system_attribute_map_of_yojson tree path =
  map_of_yojson message_system_attribute_name_of_yojson string__of_yojson
    tree path
let message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_attributes =
       (option_of_yojson
          (value_for_key message_body_attribute_map_of_yojson
             "MessageAttributes") _list path);
     md5_of_message_attributes =
       (option_of_yojson
          (value_for_key string__of_yojson "MD5OfMessageAttributes") _list
          path);
     attributes =
       (option_of_yojson
          (value_for_key message_system_attribute_map_of_yojson "Attributes")
          _list path);
     body =
       (option_of_yojson (value_for_key string__of_yojson "Body") _list path);
     md5_of_body =
       (option_of_yojson (value_for_key string__of_yojson "MD5OfBody") _list
          path);
     receipt_handle =
       (option_of_yojson (value_for_key string__of_yojson "ReceiptHandle")
          _list path);
     message_id =
       (option_of_yojson (value_for_key string__of_yojson "MessageId") _list
          path)
   } : message)
let message_list_of_yojson tree path =
  list_of_yojson message_of_yojson tree path
let receive_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     messages =
       (option_of_yojson (value_for_key message_list_of_yojson "Messages")
          _list path)
   } : receive_message_result)
let attribute_name_list_of_yojson tree path =
  list_of_yojson queue_attribute_name_of_yojson tree path
let message_system_attribute_list_of_yojson tree path =
  list_of_yojson message_system_attribute_name_of_yojson tree path
let message_attribute_name_of_yojson = string_of_yojson
let message_attribute_name_list_of_yojson tree path =
  list_of_yojson message_attribute_name_of_yojson tree path
let receive_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     receive_request_attempt_id =
       (option_of_yojson
          (value_for_key string__of_yojson "ReceiveRequestAttemptId") _list
          path);
     wait_time_seconds =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "WaitTimeSeconds") _list
          path);
     visibility_timeout =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "VisibilityTimeout")
          _list path);
     max_number_of_messages =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "MaxNumberOfMessages")
          _list path);
     message_attribute_names =
       (option_of_yojson
          (value_for_key message_attribute_name_list_of_yojson
             "MessageAttributeNames") _list path);
     message_system_attribute_names =
       (option_of_yojson
          (value_for_key message_system_attribute_list_of_yojson
             "MessageSystemAttributeNames") _list path);
     attribute_names =
       (option_of_yojson
          (value_for_key attribute_name_list_of_yojson "AttributeNames")
          _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : receive_message_request)
let receipt_handle_is_invalid_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : receipt_handle_is_invalid)
let queue_url_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let queue_name_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : queue_name_exists)
let queue_deleted_recently_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : queue_deleted_recently)
let purge_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queue_url = (value_for_key string__of_yojson "QueueUrl" _list path) } : 
    purge_queue_request)
let purge_queue_in_progress_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path)
   } : purge_queue_in_progress)
let nullable_long_of_yojson = long_of_yojson
let message_not_inflight_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let long_of_yojson = long_of_yojson
let list_queues_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     queue_urls =
       (option_of_yojson (value_for_key queue_url_list_of_yojson "QueueUrls")
          _list path)
   } : list_queues_result)
let boxed_integer_of_yojson = int_of_yojson
let list_queues_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key boxed_integer_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     queue_name_prefix =
       (option_of_yojson (value_for_key string__of_yojson "QueueNamePrefix")
          _list path)
   } : list_queues_request)
let list_queue_tags_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path)
   } : list_queue_tags_result)
let list_queue_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queue_url = (value_for_key string__of_yojson "QueueUrl" _list path) } : 
    list_queue_tags_request)
let list_message_move_tasks_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     started_timestamp =
       (option_of_yojson (value_for_key long_of_yojson "StartedTimestamp")
          _list path);
     failure_reason =
       (option_of_yojson (value_for_key string__of_yojson "FailureReason")
          _list path);
     approximate_number_of_messages_to_move =
       (option_of_yojson
          (value_for_key nullable_long_of_yojson
             "ApproximateNumberOfMessagesToMove") _list path);
     approximate_number_of_messages_moved =
       (option_of_yojson
          (value_for_key long_of_yojson "ApproximateNumberOfMessagesMoved")
          _list path);
     max_number_of_messages_per_second =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson
             "MaxNumberOfMessagesPerSecond") _list path);
     destination_arn =
       (option_of_yojson (value_for_key string__of_yojson "DestinationArn")
          _list path);
     source_arn =
       (option_of_yojson (value_for_key string__of_yojson "SourceArn") _list
          path);
     status =
       (option_of_yojson (value_for_key string__of_yojson "Status") _list
          path);
     task_handle =
       (option_of_yojson (value_for_key string__of_yojson "TaskHandle") _list
          path)
   } : list_message_move_tasks_result_entry)
let list_message_move_tasks_result_entry_list_of_yojson tree path =
  list_of_yojson list_message_move_tasks_result_entry_of_yojson tree path
let list_message_move_tasks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results =
       (option_of_yojson
          (value_for_key list_message_move_tasks_result_entry_list_of_yojson
             "Results") _list path)
   } : list_message_move_tasks_result)
let list_message_move_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "MaxResults") _list path);
     source_arn = (value_for_key string__of_yojson "SourceArn" _list path)
   } : list_message_move_tasks_request)
let list_dead_letter_source_queues_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     queue_urls =
       (value_for_key queue_url_list_of_yojson "queueUrls" _list path)
   } : list_dead_letter_source_queues_result)
let list_dead_letter_source_queues_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key boxed_integer_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key token_of_yojson "NextToken") _list
          path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : list_dead_letter_source_queues_request)
let invalid_id_format_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let get_queue_url_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     queue_url =
       (option_of_yojson (value_for_key string__of_yojson "QueueUrl") _list
          path)
   } : get_queue_url_result)
let get_queue_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     queue_owner_aws_account_id =
       (option_of_yojson
          (value_for_key string__of_yojson "QueueOwnerAWSAccountId") _list
          path);
     queue_name = (value_for_key string__of_yojson "QueueName" _list path)
   } : get_queue_url_request)
let get_queue_attributes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (option_of_yojson
          (value_for_key queue_attribute_map_of_yojson "Attributes") _list
          path)
   } : get_queue_attributes_result)
let get_queue_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_names =
       (option_of_yojson
          (value_for_key attribute_name_list_of_yojson "AttributeNames")
          _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : get_queue_attributes_request)
let delete_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queue_url = (value_for_key string__of_yojson "QueueUrl" _list path) } : 
    delete_queue_request)
let delete_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     receipt_handle =
       (value_for_key string__of_yojson "ReceiptHandle" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : delete_message_request)
let delete_message_batch_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key string__of_yojson "Id" _list path) } : delete_message_batch_result_entry)
let delete_message_batch_result_entry_list_of_yojson tree path =
  list_of_yojson delete_message_batch_result_entry_of_yojson tree path
let delete_message_batch_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed =
       (value_for_key batch_result_error_entry_list_of_yojson "Failed" _list
          path);
     successful =
       (value_for_key delete_message_batch_result_entry_list_of_yojson
          "Successful" _list path)
   } : delete_message_batch_result)
let delete_message_batch_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     receipt_handle =
       (value_for_key string__of_yojson "ReceiptHandle" _list path);
     id = (value_for_key string__of_yojson "Id" _list path)
   } : delete_message_batch_request_entry)
let delete_message_batch_request_entry_list_of_yojson tree path =
  list_of_yojson delete_message_batch_request_entry_of_yojson tree path
let delete_message_batch_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries =
       (value_for_key delete_message_batch_request_entry_list_of_yojson
          "Entries" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : delete_message_batch_request)
let create_queue_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     queue_url =
       (option_of_yojson (value_for_key string__of_yojson "QueueUrl") _list
          path)
   } : create_queue_result)
let create_queue_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_map_of_yojson "tags") _list path);
     attributes =
       (option_of_yojson
          (value_for_key queue_attribute_map_of_yojson "Attributes") _list
          path);
     queue_name = (value_for_key string__of_yojson "QueueName" _list path)
   } : create_queue_request)
let change_message_visibility_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility_timeout =
       (value_for_key nullable_integer_of_yojson "VisibilityTimeout" _list
          path);
     receipt_handle =
       (value_for_key string__of_yojson "ReceiptHandle" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : change_message_visibility_request)
let change_message_visibility_batch_result_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key string__of_yojson "Id" _list path) } : change_message_visibility_batch_result_entry)
let change_message_visibility_batch_result_entry_list_of_yojson tree path =
  list_of_yojson change_message_visibility_batch_result_entry_of_yojson tree
    path
let change_message_visibility_batch_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed =
       (value_for_key batch_result_error_entry_list_of_yojson "Failed" _list
          path);
     successful =
       (value_for_key
          change_message_visibility_batch_result_entry_list_of_yojson
          "Successful" _list path)
   } : change_message_visibility_batch_result)
let change_message_visibility_batch_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility_timeout =
       (option_of_yojson
          (value_for_key nullable_integer_of_yojson "VisibilityTimeout")
          _list path);
     receipt_handle =
       (value_for_key string__of_yojson "ReceiptHandle" _list path);
     id = (value_for_key string__of_yojson "Id" _list path)
   } : change_message_visibility_batch_request_entry)
let change_message_visibility_batch_request_entry_list_of_yojson tree path =
  list_of_yojson change_message_visibility_batch_request_entry_of_yojson tree
    path
let change_message_visibility_batch_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entries =
       (value_for_key
          change_message_visibility_batch_request_entry_list_of_yojson
          "Entries" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : change_message_visibility_batch_request)
let cancel_message_move_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approximate_number_of_messages_moved =
       (option_of_yojson
          (value_for_key long_of_yojson "ApproximateNumberOfMessagesMoved")
          _list path)
   } : cancel_message_move_task_result)
let cancel_message_move_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_handle = (value_for_key string__of_yojson "TaskHandle" _list path)
   } : cancel_message_move_task_request)
let aws_account_id_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let action_name_list_of_yojson tree path =
  list_of_yojson string__of_yojson tree path
let add_permission_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions =
       (value_for_key action_name_list_of_yojson "Actions" _list path);
     aws_account_ids =
       (value_for_key aws_account_id_list_of_yojson "AWSAccountIds" _list
          path);
     label = (value_for_key string__of_yojson "Label" _list path);
     queue_url = (value_for_key string__of_yojson "QueueUrl" _list path)
   } : add_permission_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson
let base_float_of_yojson = float_of_yojson
let base_double_of_yojson = double_of_yojson
let base_short_of_yojson = short_of_yojson
let base_blob_of_yojson = blob_of_yojson
let base_byte_of_yojson = byte_of_yojson