open Types
open Service_metadata
module AddPermission =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "OverLimit") ->
            `OverLimit (Json_deserializers.over_limit_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : add_permission_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.add_permission_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSAddPermission" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module CancelMessageMoveTask =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : cancel_message_move_task_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.cancel_message_move_task_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSCancelMessageMoveTask" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.cancel_message_move_task_result_of_yojson
          ~error_deserializer
  end
module ChangeMessageVisibility =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "MessageNotInflight") ->
            `MessageNotInflight
              (Json_deserializers.message_not_inflight_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "ReceiptHandleIsInvalid") ->
            `ReceiptHandleIsInvalid
              (Json_deserializers.receipt_handle_is_invalid_of_yojson tree
                 path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : change_message_visibility_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.change_message_visibility_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSChangeMessageVisibility" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module ChangeMessageVisibilityBatch =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BatchEntryIdsNotDistinct") ->
            `BatchEntryIdsNotDistinct
              (Json_deserializers.batch_entry_ids_not_distinct_of_yojson tree
                 path)
        | (_, "EmptyBatchRequest") ->
            `EmptyBatchRequest
              (Json_deserializers.empty_batch_request_of_yojson tree path)
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidBatchEntryId") ->
            `InvalidBatchEntryId
              (Json_deserializers.invalid_batch_entry_id_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "TooManyEntriesInBatchRequest") ->
            `TooManyEntriesInBatchRequest
              (Json_deserializers.too_many_entries_in_batch_request_of_yojson
                 tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : change_message_visibility_batch_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.change_message_visibility_batch_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSChangeMessageVisibilityBatch" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.change_message_visibility_batch_result_of_yojson
          ~error_deserializer
  end
module CreateQueue =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidAttributeName") ->
            `InvalidAttributeName
              (Json_deserializers.invalid_attribute_name_of_yojson tree path)
        | (_, "InvalidAttributeValue") ->
            `InvalidAttributeValue
              (Json_deserializers.invalid_attribute_value_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDeletedRecently") ->
            `QueueDeletedRecently
              (Json_deserializers.queue_deleted_recently_of_yojson tree path)
        | (_, "QueueNameExists") ->
            `QueueNameExists
              (Json_deserializers.queue_name_exists_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_queue_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.create_queue_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSCreateQueue" ~service ~config:context.config
          ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_queue_result_of_yojson
          ~error_deserializer
  end
module DeleteMessage =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidIdFormat") ->
            `InvalidIdFormat
              (Json_deserializers.invalid_id_format_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "ReceiptHandleIsInvalid") ->
            `ReceiptHandleIsInvalid
              (Json_deserializers.receipt_handle_is_invalid_of_yojson tree
                 path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_message_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_message_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSDeleteMessage" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteMessageBatch =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BatchEntryIdsNotDistinct") ->
            `BatchEntryIdsNotDistinct
              (Json_deserializers.batch_entry_ids_not_distinct_of_yojson tree
                 path)
        | (_, "EmptyBatchRequest") ->
            `EmptyBatchRequest
              (Json_deserializers.empty_batch_request_of_yojson tree path)
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidBatchEntryId") ->
            `InvalidBatchEntryId
              (Json_deserializers.invalid_batch_entry_id_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "TooManyEntriesInBatchRequest") ->
            `TooManyEntriesInBatchRequest
              (Json_deserializers.too_many_entries_in_batch_request_of_yojson
                 tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_message_batch_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_message_batch_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSDeleteMessageBatch" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_message_batch_result_of_yojson
          ~error_deserializer
  end
module DeleteQueue =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_queue_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_queue_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSDeleteQueue" ~service ~config:context.config
          ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module GetQueueAttributes =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidAttributeName") ->
            `InvalidAttributeName
              (Json_deserializers.invalid_attribute_name_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_queue_attributes_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_queue_attributes_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSGetQueueAttributes" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_queue_attributes_result_of_yojson
          ~error_deserializer
  end
module GetQueueUrl =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_queue_url_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.get_queue_url_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSGetQueueUrl" ~service ~config:context.config
          ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_queue_url_result_of_yojson
          ~error_deserializer
  end
module ListDeadLetterSourceQueues =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_dead_letter_source_queues_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_dead_letter_source_queues_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSListDeadLetterSourceQueues" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_dead_letter_source_queues_result_of_yojson
          ~error_deserializer
  end
module ListMessageMoveTasks =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_message_move_tasks_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_message_move_tasks_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSListMessageMoveTasks" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_message_move_tasks_result_of_yojson
          ~error_deserializer
  end
module ListQueueTags =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_queue_tags_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_queue_tags_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSListQueueTags" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_queue_tags_result_of_yojson
          ~error_deserializer
  end
module ListQueues =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_queues_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_queues_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQSListQueues"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_queues_result_of_yojson
          ~error_deserializer
  end
module PurgeQueue =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "PurgeQueueInProgress") ->
            `PurgeQueueInProgress
              (Json_deserializers.purge_queue_in_progress_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : purge_queue_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.purge_queue_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQSPurgeQueue"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module ReceiveMessage =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "KmsAccessDenied") ->
            `KmsAccessDenied
              (Json_deserializers.kms_access_denied_of_yojson tree path)
        | (_, "KmsDisabled") ->
            `KmsDisabled
              (Json_deserializers.kms_disabled_of_yojson tree path)
        | (_, "KmsInvalidKeyUsage") ->
            `KmsInvalidKeyUsage
              (Json_deserializers.kms_invalid_key_usage_of_yojson tree path)
        | (_, "KmsInvalidState") ->
            `KmsInvalidState
              (Json_deserializers.kms_invalid_state_of_yojson tree path)
        | (_, "KmsNotFound") ->
            `KmsNotFound
              (Json_deserializers.kms_not_found_of_yojson tree path)
        | (_, "KmsOptInRequired") ->
            `KmsOptInRequired
              (Json_deserializers.kms_opt_in_required_of_yojson tree path)
        | (_, "KmsThrottled") ->
            `KmsThrottled
              (Json_deserializers.kms_throttled_of_yojson tree path)
        | (_, "OverLimit") ->
            `OverLimit (Json_deserializers.over_limit_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : receive_message_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.receive_message_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSReceiveMessage" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.receive_message_result_of_yojson
          ~error_deserializer
  end
module RemovePermission =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : remove_permission_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.remove_permission_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSRemovePermission" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module SendMessage =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidMessageContents") ->
            `InvalidMessageContents
              (Json_deserializers.invalid_message_contents_of_yojson tree
                 path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "KmsAccessDenied") ->
            `KmsAccessDenied
              (Json_deserializers.kms_access_denied_of_yojson tree path)
        | (_, "KmsDisabled") ->
            `KmsDisabled
              (Json_deserializers.kms_disabled_of_yojson tree path)
        | (_, "KmsInvalidKeyUsage") ->
            `KmsInvalidKeyUsage
              (Json_deserializers.kms_invalid_key_usage_of_yojson tree path)
        | (_, "KmsInvalidState") ->
            `KmsInvalidState
              (Json_deserializers.kms_invalid_state_of_yojson tree path)
        | (_, "KmsNotFound") ->
            `KmsNotFound
              (Json_deserializers.kms_not_found_of_yojson tree path)
        | (_, "KmsOptInRequired") ->
            `KmsOptInRequired
              (Json_deserializers.kms_opt_in_required_of_yojson tree path)
        | (_, "KmsThrottled") ->
            `KmsThrottled
              (Json_deserializers.kms_throttled_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : send_message_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.send_message_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSSendMessage" ~service ~config:context.config
          ~http:context.http ~input
          ~output_deserializer:Json_deserializers.send_message_result_of_yojson
          ~error_deserializer
  end
module SendMessageBatch =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BatchEntryIdsNotDistinct") ->
            `BatchEntryIdsNotDistinct
              (Json_deserializers.batch_entry_ids_not_distinct_of_yojson tree
                 path)
        | (_, "BatchRequestTooLong") ->
            `BatchRequestTooLong
              (Json_deserializers.batch_request_too_long_of_yojson tree path)
        | (_, "EmptyBatchRequest") ->
            `EmptyBatchRequest
              (Json_deserializers.empty_batch_request_of_yojson tree path)
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidBatchEntryId") ->
            `InvalidBatchEntryId
              (Json_deserializers.invalid_batch_entry_id_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "KmsAccessDenied") ->
            `KmsAccessDenied
              (Json_deserializers.kms_access_denied_of_yojson tree path)
        | (_, "KmsDisabled") ->
            `KmsDisabled
              (Json_deserializers.kms_disabled_of_yojson tree path)
        | (_, "KmsInvalidKeyUsage") ->
            `KmsInvalidKeyUsage
              (Json_deserializers.kms_invalid_key_usage_of_yojson tree path)
        | (_, "KmsInvalidState") ->
            `KmsInvalidState
              (Json_deserializers.kms_invalid_state_of_yojson tree path)
        | (_, "KmsNotFound") ->
            `KmsNotFound
              (Json_deserializers.kms_not_found_of_yojson tree path)
        | (_, "KmsOptInRequired") ->
            `KmsOptInRequired
              (Json_deserializers.kms_opt_in_required_of_yojson tree path)
        | (_, "KmsThrottled") ->
            `KmsThrottled
              (Json_deserializers.kms_throttled_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "TooManyEntriesInBatchRequest") ->
            `TooManyEntriesInBatchRequest
              (Json_deserializers.too_many_entries_in_batch_request_of_yojson
                 tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : send_message_batch_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.send_message_batch_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSSendMessageBatch" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.send_message_batch_result_of_yojson
          ~error_deserializer
  end
module SetQueueAttributes =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidAttributeName") ->
            `InvalidAttributeName
              (Json_deserializers.invalid_attribute_name_of_yojson tree path)
        | (_, "InvalidAttributeValue") ->
            `InvalidAttributeValue
              (Json_deserializers.invalid_attribute_value_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "OverLimit") ->
            `OverLimit (Json_deserializers.over_limit_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : set_queue_attributes_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.set_queue_attributes_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSSetQueueAttributes" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module StartMessageMoveTask =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_message_move_task_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.start_message_move_task_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AmazonSQSStartMessageMoveTask" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.start_message_move_task_result_of_yojson
          ~error_deserializer
  end
module TagQueue =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : tag_queue_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.tag_queue_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQSTagQueue"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module UntagQueue =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidAddress") ->
            `InvalidAddress
              (Json_deserializers.invalid_address_of_yojson tree path)
        | (_, "InvalidSecurity") ->
            `InvalidSecurity
              (Json_deserializers.invalid_security_of_yojson tree path)
        | (_, "QueueDoesNotExist") ->
            `QueueDoesNotExist
              (Json_deserializers.queue_does_not_exist_of_yojson tree path)
        | (_, "RequestThrottled") ->
            `RequestThrottled
              (Json_deserializers.request_throttled_of_yojson tree path)
        | (_, "UnsupportedOperation") ->
            `UnsupportedOperation
              (Json_deserializers.unsupported_operation_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : untag_queue_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.untag_queue_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonSQSUntagQueue"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end