(** SQS client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AddPermission : sig
  val request :
    Smaws_Lib.Context.t ->
    add_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `OverLimit of over_limit
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Adds a permission to a queue for a specific \
   {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principal}. This allows \
   sharing access to the queue.\n\n\
  \ When you create a queue, you have full control access rights for the queue. Only you, the \
   owner of the queue, can grant or deny permissions to the queue. For more information about \
   these permissions, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow \
   Developers to Write Messages to a Shared Queue} in the {i Amazon SQS Developer Guide}.\n\
  \ \n\
  \   {ul\n\
  \         {-   [AddPermission] generates a policy for you. You can use \n\
  \             {[\n\
  \              [SetQueueAttributes] \n\
  \             ]}\n\
  \              to upload your policy. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html}Using \
   Custom Policies with the Amazon SQS Access Policy Language} in the {i Amazon SQS Developer \
   Guide}.\n\
  \             \n\
  \              }\n\
  \         {-  An Amazon SQS policy can have a maximum of seven actions per statement.\n\
  \             \n\
  \              }\n\
  \         {-  To remove the ability to change queue permissions, you must deny permission to the \
   [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.\n\
  \             \n\
  \              }\n\
  \         {-  Amazon SQS [AddPermission] does not support adding a non-account principal.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \     Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \     \n\
  \      "]

module CancelMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
    cancel_message_move_task_request ->
    ( cancel_message_move_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `RequestThrottled of request_throttled
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Cancels a specified message movement task. A message movement can only be cancelled when the \
   current status is RUNNING. Cancelling a message movement task does not revert the messages that \
   have already been moved. It can only stop the messages that have not been moved yet.\n\n\
  \  {ul\n\
  \        {-  This action is currently limited to supporting message redrive from \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter \
   queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while \
   the destination queue can be the original source queue (from which the messages were driven to \
   the dead-letter-queue), or a custom destination queue. \n\
  \            \n\
  \             }\n\
  \        {-  Only one active message movement task is supported per queue at any given time.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module ChangeMessageVisibility : sig
  val request :
    Smaws_Lib.Context.t ->
    change_message_visibility_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `MessageNotInflight of message_not_inflight
      | `QueueDoesNotExist of queue_does_not_exist
      | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Changes the visibility timeout of a specified message in a queue to a new value. The default \
   visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 \
   hours. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility \
   Timeout} in the {i Amazon SQS Developer Guide}.\n\n\
  \ For example, if the default timeout for a queue is 60 seconds, 15 seconds have elapsed since \
   you received the message, and you send a ChangeMessageVisibility call with [VisibilityTimeout] \
   set to 10 seconds, the 10 seconds begin to count from the time that you make the \
   [ChangeMessageVisibility] call. Thus, any attempt to change the visibility timeout or to delete \
   that message 10 seconds after you initially change the visibility timeout (a total of 25 \
   seconds) might result in an error.\n\
  \ \n\
  \  An Amazon SQS message has three basic states:\n\
  \  \n\
  \   {ol\n\
  \         {-  Sent to a queue by a producer.\n\
  \             \n\
  \              }\n\
  \         {-  Received from the queue by a consumer.\n\
  \             \n\
  \              }\n\
  \         {-  Deleted from the queue.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   A message is considered to be {i stored} after it is sent to a queue by a producer, but not \
   yet received from the queue by a consumer (that is, between states 1 and 2). There is no limit \
   to the number of stored messages. A message is considered to be {i in flight} after it is \
   received from a queue by a consumer, but not yet deleted from the queue (that is, between \
   states 2 and 3). There is a limit to the number of in flight messages.\n\
  \   \n\
  \    Limits that apply to in flight messages are unrelated to the {i unlimited} number of stored \
   messages.\n\
  \    \n\
  \     For most standard queues (depending on queue traffic and message backlog), there can be a \
   maximum of approximately 120,000 in flight messages (received from a queue by a consumer, but \
   not yet deleted from the queue). If you reach this limit, Amazon SQS returns the [OverLimit] \
   error message. To avoid reaching the limit, you should delete messages from the queue after \
   they're processed. You can also increase the number of queues you use to process your messages. \
   To request a limit increase, \
   {{:https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs}file \
   a support request}.\n\
  \     \n\
  \      For FIFO queues, there can be a maximum of 120,000 in flight messages (received from a \
   queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS \
   returns no error messages.\n\
  \      \n\
  \        If you attempt to set the [VisibilityTimeout] to a value greater than the maximum time \
   left, Amazon SQS returns an error. Amazon SQS doesn't automatically recalculate and increase \
   the timeout to the maximum remaining time.\n\
  \        \n\
  \         Unlike with a queue, when you change the visibility timeout for a specific message the \
   timeout value is applied immediately but isn't saved in memory for that message. If you don't \
   delete a message after it is received, the visibility timeout for the message reverts to the \
   original timeout value (not to the value you set using the [ChangeMessageVisibility] action) \
   the next time the message is received.\n\
  \         \n\
  \          "]

module ChangeMessageVisibilityBatch : sig
  val request :
    Smaws_Lib.Context.t ->
    change_message_visibility_batch_request ->
    ( change_message_visibility_batch_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
      | `EmptyBatchRequest of empty_batch_request
      | `InvalidAddress of invalid_address
      | `InvalidBatchEntryId of invalid_batch_entry_id
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Changes the visibility timeout of multiple messages. This is a batch version of \n\
   {[\n\
  \ [ChangeMessageVisibility].\n\
   ]}\n\
  \ The result of the action on each message is reported individually in the response. You can \
   send up to 10 \n\
   {[\n\
  \ [ChangeMessageVisibility] \n\
   ]}\n\
  \ requests with each [ChangeMessageVisibilityBatch] action.\n\n\
  \  Because the batch request can result in a combination of successful and unsuccessful actions, \
   you should check for batch errors even when the call returns an HTTP status code of [200].\n\
  \  \n\
  \   "]

module CreateQueue : sig
  val request :
    Smaws_Lib.Context.t ->
    create_queue_request ->
    ( create_queue_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidAttributeName of invalid_attribute_name
      | `InvalidAttributeValue of invalid_attribute_value
      | `InvalidSecurity of invalid_security
      | `QueueDeletedRecently of queue_deleted_recently
      | `QueueNameExists of queue_name_exists
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep \
   the following in mind:\n\n\
  \ {ul\n\
  \       {-  If you don't specify the [FifoQueue] attribute, Amazon SQS creates a standard queue.\n\
  \           \n\
  \             You can't change the queue type after you create it and you can't convert an \
   existing standard queue into a FIFO queue. You must either create a new FIFO queue for your \
   application or delete your existing standard queue and recreate it as a FIFO queue. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving}Moving \
   From a Standard Queue to a FIFO Queue} in the {i Amazon SQS Developer Guide}. \n\
  \             \n\
  \               }\n\
  \       {-  If you don't provide a value for an attribute, the queue is created with the default \
   value for the attribute.\n\
  \           \n\
  \            }\n\
  \       {-  If you delete a queue, you must wait at least 60 seconds before creating a queue \
   with the same name.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   To successfully create a new queue, you must provide a queue name that adheres to the \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html}limits \
   related to queues} and is unique within the scope of your queues.\n\
  \   \n\
  \     After you create a queue, you must wait at least one second after the queue is created to \
   be able to use the queue.\n\
  \     \n\
  \       To retrieve the URL of a queue, use the \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_GetQueueUrl.html} \
   [GetQueueUrl] } action. This action only requires the \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html#API_CreateQueue_RequestSyntax} \
   [QueueName] } parameter.\n\
  \       \n\
  \        When creating queues, keep the following points in mind:\n\
  \        \n\
  \         {ul\n\
  \               {-  If you specify the name of an existing queue and provide the exact same \
   names and values for all its attributes, the \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html} \
   [CreateQueue] } action will return the URL of the existing queue instead of creating a new one.\n\
  \                   \n\
  \                    }\n\
  \               {-  If you attempt to create a queue with a name that already exists but with \
   different attribute names or values, the [CreateQueue] action will return an error. This \
   ensures that existing queues are not inadvertently altered.\n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \    Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \    \n\
  \     "]

module DeleteMessage : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_message_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidIdFormat of invalid_id_format
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Deletes the specified message from the specified queue. To select the message to delete, use \
   the [ReceiptHandle] of the message ({i not} the [MessageId] which you receive when you send the \
   message). Amazon SQS can delete a message from a queue even if a visibility timeout setting \
   causes the message to be locked by another consumer. Amazon SQS automatically deletes messages \
   left in a queue longer than the retention period configured for the queue. \n\n\
  \  Each time you receive a message, meaning when a consumer retrieves a message from the queue, \
   it comes with a unique [ReceiptHandle]. If you receive the same message more than once, you \
   will get a different [ReceiptHandle] each time. When you want to delete a message using the \
   [DeleteMessage] action, you must use the [ReceiptHandle] from the most recent time you received \
   the message. If you use an old [ReceiptHandle], the request will succeed, but the message might \
   not be deleted. \n\
  \  \n\
  \   For standard queues, it is possible to receive a message even after you delete it. This \
   might happen on rare occasions if one of the servers which stores a copy of the message is \
   unavailable when you send the request to delete the message. The copy remains on the server and \
   might be returned to you during a subsequent receive request. You should ensure that your \
   application is idempotent, so that receiving a message more than once does not cause issues.\n\
  \   \n\
  \    "]

module DeleteMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_message_batch_request ->
    ( delete_message_batch_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
      | `EmptyBatchRequest of empty_batch_request
      | `InvalidAddress of invalid_address
      | `InvalidBatchEntryId of invalid_batch_entry_id
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Deletes up to ten messages from the specified queue. This is a batch version of \n\
   {[\n\
  \ [DeleteMessage].\n\
   ]}\n\
  \ The result of the action on each message is reported individually in the response.\n\n\
  \  Because the batch request can result in a combination of successful and unsuccessful actions, \
   you should check for batch errors even when the call returns an HTTP status code of [200].\n\
  \  \n\
  \   "]

module DeleteQueue : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_queue_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Deletes the queue specified by the [QueueUrl], regardless of the queue's contents.\n\n\
  \  Be careful with the [DeleteQueue] action: When you delete a queue, any messages in the queue \
   are no longer available. \n\
  \  \n\
  \    When you delete a queue, the deletion process takes up to 60 seconds. Requests you send \
   involving that queue during the 60 seconds might succeed. For example, a \n\
  \    {[\n\
  \     [SendMessage] \n\
  \    ]}\n\
  \     request might succeed, but after 60 seconds the queue and the message you sent no longer \
   exist.\n\
  \    \n\
  \     When you delete a queue, you must wait at least 60 seconds before creating a queue with \
   the same name.\n\
  \     \n\
  \       Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \       \n\
  \        The delete operation uses the HTTP [GET] verb.\n\
  \        \n\
  \         "]

module GetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
    get_queue_attributes_request ->
    ( get_queue_attributes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidAttributeName of invalid_attribute_name
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Gets attributes for the specified queue.\n\n\
  \  To determine whether a queue is \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, \
   you can check whether [QueueName] ends with the [.fifo] suffix.\n\
  \  \n\
  \   "]

module GetQueueUrl : sig
  val request :
    Smaws_Lib.Context.t ->
    get_queue_url_request ->
    ( get_queue_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "The [GetQueueUrl] API returns the URL of an existing Amazon SQS queue. This is useful when you \
   know the queue's name but need to retrieve its URL for further operations.\n\n\
  \ To access a queue owned by another Amazon Web Services account, use the \
   [QueueOwnerAWSAccountId] parameter to specify the account ID of the queue's owner. Note that \
   the queue owner must grant you the necessary permissions to access the queue. For more \
   information about accessing shared queues, see the \n\
  \ {[\n\
  \  [AddPermission] \n\
  \ ]}\n\
  \  API or \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow \
   developers to write messages to a shared queue} in the {i Amazon SQS Developer Guide}. \n\
  \ "]

module ListDeadLetterSourceQueues : sig
  val request :
    Smaws_Lib.Context.t ->
    list_dead_letter_source_queues_request ->
    ( list_dead_letter_source_queues_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Returns a list of your queues that have the [RedrivePolicy] queue attribute configured with a \
   dead-letter queue.\n\n\
  \  The [ListDeadLetterSourceQueues] methods supports pagination. Set parameter [MaxResults] in \
   the request to specify the maximum number of results to be returned in the response. If you do \
   not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] \
   and there are additional results to display, the response includes a value for [NextToken]. Use \
   [NextToken] as a parameter in your next request to [ListDeadLetterSourceQueues] to receive the \
   next page of results. \n\
  \ \n\
  \  For more information about using dead-letter queues, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}Using \
   Amazon SQS Dead-Letter Queues} in the {i Amazon SQS Developer Guide}.\n\
  \  "]

module ListMessageMoveTasks : sig
  val request :
    Smaws_Lib.Context.t ->
    list_message_move_tasks_request ->
    ( list_message_move_tasks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `RequestThrottled of request_throttled
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Gets the most recent message movement tasks (up to 10) under a specific source queue.\n\n\
  \  {ul\n\
  \        {-  This action is currently limited to supporting message redrive from \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter \
   queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while \
   the destination queue can be the original source queue (from which the messages were driven to \
   the dead-letter-queue), or a custom destination queue. \n\
  \            \n\
  \             }\n\
  \        {-  Only one active message movement task is supported per queue at any given time.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module ListQueueTags : sig
  val request :
    Smaws_Lib.Context.t ->
    list_queue_tags_request ->
    ( list_queue_tags_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "List all cost allocation tags added to the specified Amazon SQS queue. For an overview, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging \
   Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n\
  \  Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \  \n\
  \   "]

module ListQueues : sig
  val request :
    Smaws_Lib.Context.t ->
    list_queues_request ->
    ( list_queues_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Returns a list of your queues in the current region. The response includes a maximum of 1,000 \
   results. If you specify a value for the optional [QueueNamePrefix] parameter, only queues with \
   a name that begins with the specified value are returned.\n\n\
  \  The [listQueues] methods supports pagination. Set parameter [MaxResults] in the request to \
   specify the maximum number of results to be returned in the response. If you do not set \
   [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and \
   there are additional results to display, the response includes a value for [NextToken]. Use \
   [NextToken] as a parameter in your next request to [listQueues] to receive the next page of \
   results. \n\
  \ \n\
  \   Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \   \n\
  \    "]

module PurgeQueue : sig
  val request :
    Smaws_Lib.Context.t ->
    purge_queue_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `PurgeQueueInProgress of purge_queue_in_progress
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Deletes available messages in a queue (including in-flight messages) specified by the \
   [QueueURL] parameter.\n\n\
  \  When you use the [PurgeQueue] action, you can't retrieve any messages deleted from a queue.\n\
  \  \n\
  \   The message deletion process takes up to 60 seconds. We recommend waiting for 60 seconds \
   regardless of your queue's size. \n\
  \   \n\
  \     Messages sent to the queue {i before} you call [PurgeQueue] might be received but are \
   deleted within the next minute.\n\
  \     \n\
  \      Messages sent to the queue {i after} you call [PurgeQueue] might be deleted while the \
   queue is being purged.\n\
  \      "]

module ReceiveMessage : sig
  val request :
    Smaws_Lib.Context.t ->
    receive_message_request ->
    ( receive_message_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `KmsAccessDenied of kms_access_denied
      | `KmsDisabled of kms_disabled
      | `KmsInvalidKeyUsage of kms_invalid_key_usage
      | `KmsInvalidState of kms_invalid_state
      | `KmsNotFound of kms_not_found
      | `KmsOptInRequired of kms_opt_in_required
      | `KmsThrottled of kms_throttled
      | `OverLimit of over_limit
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Retrieves one or more messages (up to 10), from the specified queue. Using the \
   [WaitTimeSeconds] parameter enables long-poll support. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html}Amazon \
   SQS Long Polling} in the {i Amazon SQS Developer Guide}. \n\n\
  \ Short poll is the default behavior where a weighted random set of machines is sampled on a \
   [ReceiveMessage] call. Therefore, only the messages on the sampled machines are returned. If \
   the number of messages in the queue is small (fewer than 1,000), you most likely get fewer \
   messages than you requested per [ReceiveMessage] call. If the number of messages in the queue \
   is extremely small, you might not receive any messages in a particular [ReceiveMessage] \
   response. If this happens, repeat the request.\n\
  \ \n\
  \  For each message returned, the response includes the following:\n\
  \  \n\
  \   {ul\n\
  \         {-  The message body.\n\
  \             \n\
  \              }\n\
  \         {-  An MD5 digest of the message body. For information about MD5, see \
   {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n\
  \             \n\
  \              }\n\
  \         {-  The [MessageId] you received when you sent the message to the queue.\n\
  \             \n\
  \              }\n\
  \         {-  The receipt handle.\n\
  \             \n\
  \              }\n\
  \         {-  The message attributes.\n\
  \             \n\
  \              }\n\
  \         {-  An MD5 digest of the message attributes.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   The receipt handle is the identifier you must provide when deleting the message. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue \
   and Message Identifiers} in the {i Amazon SQS Developer Guide}.\n\
  \   \n\
  \    You can provide the [VisibilityTimeout] parameter in your request. The parameter is applied \
   to the messages that Amazon SQS returns in the response. If you don't include the parameter, \
   the overall visibility timeout for the queue is used for the returned messages. The default \
   visibility timeout for a queue is 30 seconds. \n\
  \    \n\
  \      In the future, new attributes might be added. If you write code that calls this action, \
   we recommend that you structure your code so that it can handle new attributes gracefully.\n\
  \      \n\
  \       "]

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
    remove_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Revokes any permissions in the queue policy that matches the specified [Label] parameter.\n\n\
  \  {ul\n\
  \        {-  Only the owner of a queue can remove permissions from it.\n\
  \            \n\
  \             }\n\
  \        {-  Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \            \n\
  \             }\n\
  \        {-  To remove the ability to change queue permissions, you must deny permission to the \
   [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module SendMessage : sig
  val request :
    Smaws_Lib.Context.t ->
    send_message_request ->
    ( send_message_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidMessageContents of invalid_message_contents
      | `InvalidSecurity of invalid_security
      | `KmsAccessDenied of kms_access_denied
      | `KmsDisabled of kms_disabled
      | `KmsInvalidKeyUsage of kms_invalid_key_usage
      | `KmsInvalidState of kms_invalid_state
      | `KmsNotFound of kms_not_found
      | `KmsOptInRequired of kms_opt_in_required
      | `KmsThrottled of kms_throttled
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Delivers a message to the specified queue.\n\n\
  \  A message can include only XML, JSON, and unformatted text. The following Unicode characters \
   are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C \
   specification for characters}.\n\
  \  \n\
  \    [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] \n\
  \   \n\
  \    Amazon SQS does not throw an exception or completely reject the message if it contains \
   invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing \
   the message in the queue, as long as the message body contains at least one valid character.\n\
  \    \n\
  \     "]

module SendMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
    send_message_batch_request ->
    ( send_message_batch_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
      | `BatchRequestTooLong of batch_request_too_long
      | `EmptyBatchRequest of empty_batch_request
      | `InvalidAddress of invalid_address
      | `InvalidBatchEntryId of invalid_batch_entry_id
      | `InvalidSecurity of invalid_security
      | `KmsAccessDenied of kms_access_denied
      | `KmsDisabled of kms_disabled
      | `KmsInvalidKeyUsage of kms_invalid_key_usage
      | `KmsInvalidState of kms_invalid_state
      | `KmsNotFound of kms_not_found
      | `KmsOptInRequired of kms_opt_in_required
      | `KmsThrottled of kms_throttled
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "You can use [SendMessageBatch] to send up to 10 messages to the specified queue by assigning \
   either identical or different values to each message (or by not assigning values at all). This \
   is a batch version of \n\
   {[\n\
  \ [SendMessage].\n\
   ]}\n\
  \ For a FIFO queue, multiple messages within a single batch are enqueued in the order they are \
   sent.\n\n\
  \ The result of sending each message is reported individually in the response. Because the batch \
   request can result in a combination of successful and unsuccessful actions, you should check \
   for batch errors even when the call returns an HTTP status code of [200].\n\
  \ \n\
  \  The maximum allowed individual message size and the maximum total payload size (the sum of \
   the individual lengths of all of the batched messages) are both 256 KiB (262,144 bytes).\n\
  \  \n\
  \    A message can include only XML, JSON, and unformatted text. The following Unicode \
   characters are allowed. For more information, see the \
   {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.\n\
  \    \n\
  \      [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to \
   [#x10FFFF] \n\
  \     \n\
  \      Amazon SQS does not throw an exception or completely reject the message if it contains \
   invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing \
   the message in the queue, as long as the message body contains at least one valid character.\n\
  \      \n\
  \        If you don't specify the [DelaySeconds] parameter for an entry, Amazon SQS uses the \
   default value for the queue.\n\
  \        "]

module SetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
    set_queue_attributes_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidAttributeName of invalid_attribute_name
      | `InvalidAttributeValue of invalid_attribute_value
      | `InvalidSecurity of invalid_security
      | `OverLimit of over_limit
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Sets the value of one or more queue attributes, like a policy. When you change a queue's \
   attributes, the change can take up to 60 seconds for most of the attributes to propagate \
   throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can \
   take up to 15 minutes and will impact existing messages in the queue potentially causing them \
   to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing \
   messages.\n\n\
  \  {ul\n\
  \        {-  In the future, new attributes might be added. If you write code that calls this \
   action, we recommend that you structure your code so that it can handle new attributes \
   gracefully.\n\
  \            \n\
  \             }\n\
  \        {-  Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \            \n\
  \             }\n\
  \        {-  To remove the ability to change queue permissions, you must deny permission to the \
   [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module StartMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
    start_message_move_task_request ->
    ( start_message_move_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `RequestThrottled of request_throttled
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Starts an asynchronous task to move messages from a specified source queue to a specified \
   destination queue.\n\n\
  \  {ul\n\
  \        {-  This action is currently limited to supporting message redrive from queues that are \
   configured as \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter \
   queues (DLQs)} of other Amazon SQS queues only. Non-SQS queue sources of dead-letter queues, \
   such as Lambda or Amazon SNS topics, are currently not supported.\n\
  \            \n\
  \             }\n\
  \        {-  In dead-letter queues redrive context, the [StartMessageMoveTask] the source queue \
   is the DLQ, while the destination queue can be the original source queue (from which the \
   messages were driven to the dead-letter-queue), or a custom destination queue.\n\
  \            \n\
  \             }\n\
  \        {-  Only one active message movement task is supported per queue at any given time.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module TagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_queue_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Add cost allocation tags to the specified Amazon SQS queue. For an overview, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging \
   Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n\
  \ When you use queue tags, keep the following guidelines in mind:\n\
  \ \n\
  \  {ul\n\
  \        {-  Adding more than 50 tags to a queue isn't recommended.\n\
  \            \n\
  \             }\n\
  \        {-  Tags don't have any semantic meaning. Amazon SQS interprets tags as character \
   strings.\n\
  \            \n\
  \             }\n\
  \        {-  Tags are case-sensitive.\n\
  \            \n\
  \             }\n\
  \        {-  A new tag with a key identical to that of an existing tag overwrites the existing \
   tag.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For a full list of tag restrictions, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues}Quotas \
   related to queues} in the {i Amazon SQS Developer Guide}.\n\
  \   \n\
  \     Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \     \n\
  \      "]

(** {1:Serialization and Deserialization} *)
module UntagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_queue_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAddress of invalid_address
      | `InvalidSecurity of invalid_security
      | `QueueDoesNotExist of queue_does_not_exist
      | `RequestThrottled of request_throttled
      | `UnsupportedOperation of unsupported_operation ] )
    result
end
[@@ocaml.doc
  "Remove cost allocation tags from the specified Amazon SQS queue. For an overview, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging \
   Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n\
  \  Cross-account permissions don't apply to this action. For more information, see \
   {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant \
   cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n\
  \  \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
