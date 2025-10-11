open Types
open Service_metadata

module AddPermission = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `OverLimit _ -> "com.amazonaws.sqs#OverLimit"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "OverLimit" -> `OverLimit (Json_deserializers.over_limit_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_permission_request) =
    let input = Json_serializers.add_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.AddPermission" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CancelMessageMoveTask = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `ResourceNotFoundException _ -> "com.amazonaws.sqs#ResourceNotFoundException"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_message_move_task_request) =
    let input = Json_serializers.cancel_message_move_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.CancelMessageMoveTask" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_message_move_task_result_of_yojson
      ~error_deserializer
end

module ChangeMessageVisibility = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `MessageNotInflight _ -> "com.amazonaws.sqs#MessageNotInflight"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `ReceiptHandleIsInvalid _ -> "com.amazonaws.sqs#ReceiptHandleIsInvalid"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "MessageNotInflight" ->
          `MessageNotInflight (Json_deserializers.message_not_inflight_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "ReceiptHandleIsInvalid" ->
          `ReceiptHandleIsInvalid (Json_deserializers.receipt_handle_is_invalid_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : change_message_visibility_request) =
    let input = Json_serializers.change_message_visibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ChangeMessageVisibility" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ChangeMessageVisibilityBatch = struct
  let error_to_string = function
    | `BatchEntryIdsNotDistinct _ -> "com.amazonaws.sqs#BatchEntryIdsNotDistinct"
    | `EmptyBatchRequest _ -> "com.amazonaws.sqs#EmptyBatchRequest"
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidBatchEntryId _ -> "com.amazonaws.sqs#InvalidBatchEntryId"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `TooManyEntriesInBatchRequest _ -> "com.amazonaws.sqs#TooManyEntriesInBatchRequest"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchEntryIdsNotDistinct" ->
          `BatchEntryIdsNotDistinct
            (Json_deserializers.batch_entry_ids_not_distinct_of_yojson tree path)
      | _, "EmptyBatchRequest" ->
          `EmptyBatchRequest (Json_deserializers.empty_batch_request_of_yojson tree path)
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidBatchEntryId" ->
          `InvalidBatchEntryId (Json_deserializers.invalid_batch_entry_id_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "TooManyEntriesInBatchRequest" ->
          `TooManyEntriesInBatchRequest
            (Json_deserializers.too_many_entries_in_batch_request_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : change_message_visibility_batch_request) =
    let input = Json_serializers.change_message_visibility_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ChangeMessageVisibilityBatch"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.change_message_visibility_batch_result_of_yojson
      ~error_deserializer
end

module CreateQueue = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidAttributeName _ -> "com.amazonaws.sqs#InvalidAttributeName"
    | `InvalidAttributeValue _ -> "com.amazonaws.sqs#InvalidAttributeValue"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDeletedRecently _ -> "com.amazonaws.sqs#QueueDeletedRecently"
    | `QueueNameExists _ -> "com.amazonaws.sqs#QueueNameExists"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidAttributeName" ->
          `InvalidAttributeName (Json_deserializers.invalid_attribute_name_of_yojson tree path)
      | _, "InvalidAttributeValue" ->
          `InvalidAttributeValue (Json_deserializers.invalid_attribute_value_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDeletedRecently" ->
          `QueueDeletedRecently (Json_deserializers.queue_deleted_recently_of_yojson tree path)
      | _, "QueueNameExists" ->
          `QueueNameExists (Json_deserializers.queue_name_exists_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_queue_request) =
    let input = Json_serializers.create_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.CreateQueue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_queue_result_of_yojson ~error_deserializer
end

module DeleteMessage = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidIdFormat _ -> "com.amazonaws.sqs#InvalidIdFormat"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `ReceiptHandleIsInvalid _ -> "com.amazonaws.sqs#ReceiptHandleIsInvalid"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidIdFormat" ->
          `InvalidIdFormat (Json_deserializers.invalid_id_format_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "ReceiptHandleIsInvalid" ->
          `ReceiptHandleIsInvalid (Json_deserializers.receipt_handle_is_invalid_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_message_request) =
    let input = Json_serializers.delete_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.DeleteMessage" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMessageBatch = struct
  let error_to_string = function
    | `BatchEntryIdsNotDistinct _ -> "com.amazonaws.sqs#BatchEntryIdsNotDistinct"
    | `EmptyBatchRequest _ -> "com.amazonaws.sqs#EmptyBatchRequest"
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidBatchEntryId _ -> "com.amazonaws.sqs#InvalidBatchEntryId"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `TooManyEntriesInBatchRequest _ -> "com.amazonaws.sqs#TooManyEntriesInBatchRequest"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchEntryIdsNotDistinct" ->
          `BatchEntryIdsNotDistinct
            (Json_deserializers.batch_entry_ids_not_distinct_of_yojson tree path)
      | _, "EmptyBatchRequest" ->
          `EmptyBatchRequest (Json_deserializers.empty_batch_request_of_yojson tree path)
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidBatchEntryId" ->
          `InvalidBatchEntryId (Json_deserializers.invalid_batch_entry_id_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "TooManyEntriesInBatchRequest" ->
          `TooManyEntriesInBatchRequest
            (Json_deserializers.too_many_entries_in_batch_request_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_message_batch_request) =
    let input = Json_serializers.delete_message_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.DeleteMessageBatch" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_message_batch_result_of_yojson
      ~error_deserializer
end

module DeleteQueue = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_queue_request) =
    let input = Json_serializers.delete_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.DeleteQueue" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module GetQueueAttributes = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidAttributeName _ -> "com.amazonaws.sqs#InvalidAttributeName"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidAttributeName" ->
          `InvalidAttributeName (Json_deserializers.invalid_attribute_name_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_queue_attributes_request) =
    let input = Json_serializers.get_queue_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.GetQueueAttributes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_queue_attributes_result_of_yojson
      ~error_deserializer
end

module GetQueueUrl = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_queue_url_request) =
    let input = Json_serializers.get_queue_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.GetQueueUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_queue_url_result_of_yojson ~error_deserializer
end

module ListDeadLetterSourceQueues = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dead_letter_source_queues_request) =
    let input = Json_serializers.list_dead_letter_source_queues_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ListDeadLetterSourceQueues" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_dead_letter_source_queues_result_of_yojson
      ~error_deserializer
end

module ListMessageMoveTasks = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `ResourceNotFoundException _ -> "com.amazonaws.sqs#ResourceNotFoundException"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_message_move_tasks_request) =
    let input = Json_serializers.list_message_move_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ListMessageMoveTasks" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_message_move_tasks_result_of_yojson
      ~error_deserializer
end

module ListQueueTags = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_queue_tags_request) =
    let input = Json_serializers.list_queue_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ListQueueTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_queue_tags_result_of_yojson
      ~error_deserializer
end

module ListQueues = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_queues_request) =
    let input = Json_serializers.list_queues_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ListQueues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_queues_result_of_yojson ~error_deserializer
end

module PurgeQueue = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `PurgeQueueInProgress _ -> "com.amazonaws.sqs#PurgeQueueInProgress"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "PurgeQueueInProgress" ->
          `PurgeQueueInProgress (Json_deserializers.purge_queue_in_progress_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : purge_queue_request) =
    let input = Json_serializers.purge_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.PurgeQueue" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ReceiveMessage = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `KmsAccessDenied _ -> "com.amazonaws.sqs#KmsAccessDenied"
    | `KmsDisabled _ -> "com.amazonaws.sqs#KmsDisabled"
    | `KmsInvalidKeyUsage _ -> "com.amazonaws.sqs#KmsInvalidKeyUsage"
    | `KmsInvalidState _ -> "com.amazonaws.sqs#KmsInvalidState"
    | `KmsNotFound _ -> "com.amazonaws.sqs#KmsNotFound"
    | `KmsOptInRequired _ -> "com.amazonaws.sqs#KmsOptInRequired"
    | `KmsThrottled _ -> "com.amazonaws.sqs#KmsThrottled"
    | `OverLimit _ -> "com.amazonaws.sqs#OverLimit"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "KmsAccessDenied" ->
          `KmsAccessDenied (Json_deserializers.kms_access_denied_of_yojson tree path)
      | _, "KmsDisabled" -> `KmsDisabled (Json_deserializers.kms_disabled_of_yojson tree path)
      | _, "KmsInvalidKeyUsage" ->
          `KmsInvalidKeyUsage (Json_deserializers.kms_invalid_key_usage_of_yojson tree path)
      | _, "KmsInvalidState" ->
          `KmsInvalidState (Json_deserializers.kms_invalid_state_of_yojson tree path)
      | _, "KmsNotFound" -> `KmsNotFound (Json_deserializers.kms_not_found_of_yojson tree path)
      | _, "KmsOptInRequired" ->
          `KmsOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KmsThrottled" -> `KmsThrottled (Json_deserializers.kms_throttled_of_yojson tree path)
      | _, "OverLimit" -> `OverLimit (Json_deserializers.over_limit_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : receive_message_request) =
    let input = Json_serializers.receive_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.ReceiveMessage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.receive_message_result_of_yojson
      ~error_deserializer
end

module RemovePermission = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_permission_request) =
    let input = Json_serializers.remove_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.RemovePermission" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SendMessage = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidMessageContents _ -> "com.amazonaws.sqs#InvalidMessageContents"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `KmsAccessDenied _ -> "com.amazonaws.sqs#KmsAccessDenied"
    | `KmsDisabled _ -> "com.amazonaws.sqs#KmsDisabled"
    | `KmsInvalidKeyUsage _ -> "com.amazonaws.sqs#KmsInvalidKeyUsage"
    | `KmsInvalidState _ -> "com.amazonaws.sqs#KmsInvalidState"
    | `KmsNotFound _ -> "com.amazonaws.sqs#KmsNotFound"
    | `KmsOptInRequired _ -> "com.amazonaws.sqs#KmsOptInRequired"
    | `KmsThrottled _ -> "com.amazonaws.sqs#KmsThrottled"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidMessageContents" ->
          `InvalidMessageContents (Json_deserializers.invalid_message_contents_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "KmsAccessDenied" ->
          `KmsAccessDenied (Json_deserializers.kms_access_denied_of_yojson tree path)
      | _, "KmsDisabled" -> `KmsDisabled (Json_deserializers.kms_disabled_of_yojson tree path)
      | _, "KmsInvalidKeyUsage" ->
          `KmsInvalidKeyUsage (Json_deserializers.kms_invalid_key_usage_of_yojson tree path)
      | _, "KmsInvalidState" ->
          `KmsInvalidState (Json_deserializers.kms_invalid_state_of_yojson tree path)
      | _, "KmsNotFound" -> `KmsNotFound (Json_deserializers.kms_not_found_of_yojson tree path)
      | _, "KmsOptInRequired" ->
          `KmsOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KmsThrottled" -> `KmsThrottled (Json_deserializers.kms_throttled_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_message_request) =
    let input = Json_serializers.send_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.SendMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_message_result_of_yojson ~error_deserializer
end

module SendMessageBatch = struct
  let error_to_string = function
    | `BatchEntryIdsNotDistinct _ -> "com.amazonaws.sqs#BatchEntryIdsNotDistinct"
    | `BatchRequestTooLong _ -> "com.amazonaws.sqs#BatchRequestTooLong"
    | `EmptyBatchRequest _ -> "com.amazonaws.sqs#EmptyBatchRequest"
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidBatchEntryId _ -> "com.amazonaws.sqs#InvalidBatchEntryId"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `KmsAccessDenied _ -> "com.amazonaws.sqs#KmsAccessDenied"
    | `KmsDisabled _ -> "com.amazonaws.sqs#KmsDisabled"
    | `KmsInvalidKeyUsage _ -> "com.amazonaws.sqs#KmsInvalidKeyUsage"
    | `KmsInvalidState _ -> "com.amazonaws.sqs#KmsInvalidState"
    | `KmsNotFound _ -> "com.amazonaws.sqs#KmsNotFound"
    | `KmsOptInRequired _ -> "com.amazonaws.sqs#KmsOptInRequired"
    | `KmsThrottled _ -> "com.amazonaws.sqs#KmsThrottled"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `TooManyEntriesInBatchRequest _ -> "com.amazonaws.sqs#TooManyEntriesInBatchRequest"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchEntryIdsNotDistinct" ->
          `BatchEntryIdsNotDistinct
            (Json_deserializers.batch_entry_ids_not_distinct_of_yojson tree path)
      | _, "BatchRequestTooLong" ->
          `BatchRequestTooLong (Json_deserializers.batch_request_too_long_of_yojson tree path)
      | _, "EmptyBatchRequest" ->
          `EmptyBatchRequest (Json_deserializers.empty_batch_request_of_yojson tree path)
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidBatchEntryId" ->
          `InvalidBatchEntryId (Json_deserializers.invalid_batch_entry_id_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "KmsAccessDenied" ->
          `KmsAccessDenied (Json_deserializers.kms_access_denied_of_yojson tree path)
      | _, "KmsDisabled" -> `KmsDisabled (Json_deserializers.kms_disabled_of_yojson tree path)
      | _, "KmsInvalidKeyUsage" ->
          `KmsInvalidKeyUsage (Json_deserializers.kms_invalid_key_usage_of_yojson tree path)
      | _, "KmsInvalidState" ->
          `KmsInvalidState (Json_deserializers.kms_invalid_state_of_yojson tree path)
      | _, "KmsNotFound" -> `KmsNotFound (Json_deserializers.kms_not_found_of_yojson tree path)
      | _, "KmsOptInRequired" ->
          `KmsOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KmsThrottled" -> `KmsThrottled (Json_deserializers.kms_throttled_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "TooManyEntriesInBatchRequest" ->
          `TooManyEntriesInBatchRequest
            (Json_deserializers.too_many_entries_in_batch_request_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_message_batch_request) =
    let input = Json_serializers.send_message_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.SendMessageBatch" ~service ~context
      ~input ~output_deserializer:Json_deserializers.send_message_batch_result_of_yojson
      ~error_deserializer
end

module SetQueueAttributes = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidAttributeName _ -> "com.amazonaws.sqs#InvalidAttributeName"
    | `InvalidAttributeValue _ -> "com.amazonaws.sqs#InvalidAttributeValue"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `OverLimit _ -> "com.amazonaws.sqs#OverLimit"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidAttributeName" ->
          `InvalidAttributeName (Json_deserializers.invalid_attribute_name_of_yojson tree path)
      | _, "InvalidAttributeValue" ->
          `InvalidAttributeValue (Json_deserializers.invalid_attribute_value_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "OverLimit" -> `OverLimit (Json_deserializers.over_limit_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_queue_attributes_request) =
    let input = Json_serializers.set_queue_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.SetQueueAttributes" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartMessageMoveTask = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `ResourceNotFoundException _ -> "com.amazonaws.sqs#ResourceNotFoundException"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_message_move_task_request) =
    let input = Json_serializers.start_message_move_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.StartMessageMoveTask" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_message_move_task_result_of_yojson
      ~error_deserializer
end

module TagQueue = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_queue_request) =
    let input = Json_serializers.tag_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.TagQueue" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagQueue = struct
  let error_to_string = function
    | `InvalidAddress _ -> "com.amazonaws.sqs#InvalidAddress"
    | `InvalidSecurity _ -> "com.amazonaws.sqs#InvalidSecurity"
    | `QueueDoesNotExist _ -> "com.amazonaws.sqs#QueueDoesNotExist"
    | `RequestThrottled _ -> "com.amazonaws.sqs#RequestThrottled"
    | `UnsupportedOperation _ -> "com.amazonaws.sqs#UnsupportedOperation"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidAddress" ->
          `InvalidAddress (Json_deserializers.invalid_address_of_yojson tree path)
      | _, "InvalidSecurity" ->
          `InvalidSecurity (Json_deserializers.invalid_security_of_yojson tree path)
      | _, "QueueDoesNotExist" ->
          `QueueDoesNotExist (Json_deserializers.queue_does_not_exist_of_yojson tree path)
      | _, "RequestThrottled" ->
          `RequestThrottled (Json_deserializers.request_throttled_of_yojson tree path)
      | _, "UnsupportedOperation" ->
          `UnsupportedOperation (Json_deserializers.unsupported_operation_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_queue_request) =
    let input = Json_serializers.untag_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQS.UntagQueue" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
