(** 
    SQS client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec untag_queue_request = {
  tag_keys: string list ;
  queue_url: string }[@@ocaml.doc ""]
type nonrec unsupported_operation = {
  message: string option }[@@ocaml.doc
                            "Error code 400. Unsupported operation.\n"]
type nonrec request_throttled = {
  message: string option }[@@ocaml.doc
                            "The request was denied due to request throttling.\n\n {ul\n       {-  The rate of requests per second exceeds the Amazon Web Services KMS request quota for an account and Region. \n           \n            }\n       {-  A burst or sustained high rate of requests to change the state of the same KMS key. This condition is often known as a \"hot key.\"\n           \n            }\n       {-  Requests for operations on KMS keys in a Amazon Web Services CloudHSM key store might be throttled at a lower-than-expected rate when the Amazon Web Services CloudHSM cluster associated with the Amazon Web Services CloudHSM key store is processing numerous commands, including those unrelated to the Amazon Web Services CloudHSM key store.\n           \n            }\n       }\n  "]
type nonrec queue_does_not_exist = {
  message: string option }[@@ocaml.doc
                            "The specified queue doesn't exist.\n"]
type nonrec invalid_security = {
  message: string option }[@@ocaml.doc
                            "When the request to a queue is not HTTPS and SigV4.\n"]
type nonrec invalid_address = {
  message: string option }[@@ocaml.doc "The [accountId] is invalid.\n"]
type nonrec too_many_entries_in_batch_request = {
  message: string option }[@@ocaml.doc
                            "The batch request contains more entries than permissible.\n"]
type nonrec tag_map = (string * string) list[@@ocaml.doc ""]
type nonrec tag_queue_request = {
  tags: tag_map ;
  queue_url: string }[@@ocaml.doc ""]
type nonrec start_message_move_task_result = {
  task_handle: string option }[@@ocaml.doc ""]
type nonrec start_message_move_task_request =
  {
  max_number_of_messages_per_second: int option ;
  destination_arn: string option ;
  source_arn: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "One or more specified resources don't exist.\n"]
type nonrec queue_attribute_name =
  | SqsManagedSseEnabled 
  | RedriveAllowPolicy 
  | FifoThroughputLimit 
  | DeduplicationScope 
  | KmsDataKeyReusePeriodSeconds 
  | KmsMasterKeyId 
  | ContentBasedDeduplication 
  | FifoQueue 
  | RedrivePolicy 
  | ReceiveMessageWaitTimeSeconds 
  | DelaySeconds 
  | ApproximateNumberOfMessagesDelayed 
  | QueueArn 
  | LastModifiedTimestamp 
  | CreatedTimestamp 
  | ApproximateNumberOfMessagesNotVisible 
  | ApproximateNumberOfMessages 
  | MessageRetentionPeriod 
  | MaximumMessageSize 
  | VisibilityTimeout 
  | Policy 
  | All [@@ocaml.doc ""]
type nonrec queue_attribute_map = (queue_attribute_name * string) list
[@@ocaml.doc ""]
type nonrec set_queue_attributes_request =
  {
  attributes: queue_attribute_map ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec over_limit = {
  message: string option }[@@ocaml.doc
                            "The specified action violates a limit. For example, [ReceiveMessage] returns this error if the maximum number of in flight messages is reached and [AddPermission] returns this error if the maximum number of permissions for the queue is reached.\n"]
type nonrec invalid_attribute_value = {
  message: string option }[@@ocaml.doc
                            "A queue attribute value is invalid.\n"]
type nonrec invalid_attribute_name = {
  message: string option }[@@ocaml.doc
                            "The specified attribute doesn't exist.\n"]
type nonrec send_message_result =
  {
  sequence_number: string option ;
  message_id: string option ;
  md5_of_message_system_attributes: string option ;
  md5_of_message_attributes: string option ;
  md5_of_message_body: string option }[@@ocaml.doc
                                        "The [MD5OfMessageBody] and [MessageId] elements.\n"]
type nonrec message_attribute_value =
  {
  data_type: string ;
  binary_list_values: bytes list option ;
  string_list_values: string list option ;
  binary_value: bytes option ;
  string_value: string option }[@@ocaml.doc
                                 "The user-specified message attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see \n{[\n [SendMessage].\n]}\n \n\n  [Name], [type], [value] and the message body must not be empty or null. All parts of the message attribute, including [Name], [Type], and [Value], are part of the message size restriction (256 KiB or 262,144 bytes).\n "]
type nonrec message_body_attribute_map =
  (string * message_attribute_value) list[@@ocaml.doc ""]
type nonrec message_system_attribute_value =
  {
  data_type: string ;
  binary_list_values: bytes list option ;
  string_list_values: string list option ;
  binary_value: bytes option ;
  string_value: string option }[@@ocaml.doc
                                 "The user-specified message system attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see \n{[\n [SendMessage].\n]}\n \n\n  [Name], [type], [value] and the message body must not be empty or null.\n "]
type nonrec message_system_attribute_name_for_sends =
  | AWSTraceHeader [@@ocaml.doc ""]
type nonrec message_body_system_attribute_map =
  (message_system_attribute_name_for_sends * message_system_attribute_value)
    list[@@ocaml.doc ""]
type nonrec send_message_request =
  {
  message_group_id: string option ;
  message_deduplication_id: string option ;
  message_system_attributes: message_body_system_attribute_map option ;
  message_attributes: message_body_attribute_map option ;
  delay_seconds: int option ;
  message_body: string ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec send_message_batch_result_entry =
  {
  sequence_number: string option ;
  md5_of_message_system_attributes: string option ;
  md5_of_message_attributes: string option ;
  md5_of_message_body: string ;
  message_id: string ;
  id: string }[@@ocaml.doc
                "Encloses a [MessageId] for a successfully-enqueued message in a \n{[\n [SendMessageBatch].\n]}\n \n"]
type nonrec batch_result_error_entry =
  {
  message: string option ;
  code: string ;
  sender_fault: bool ;
  id: string }[@@ocaml.doc
                "Gives a detailed description of the result of an action on each entry in the request.\n"]
type nonrec send_message_batch_result =
  {
  failed: batch_result_error_entry list ;
  successful: send_message_batch_result_entry list }[@@ocaml.doc
                                                      "For each message in the batch, the response contains a \n{[\n [SendMessageBatchResultEntry] \n]}\n tag if the message succeeds or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message fails.\n"]
type nonrec send_message_batch_request_entry =
  {
  message_group_id: string option ;
  message_deduplication_id: string option ;
  message_system_attributes: message_body_system_attribute_map option ;
  message_attributes: message_body_attribute_map option ;
  delay_seconds: int option ;
  message_body: string ;
  id: string }[@@ocaml.doc
                "Contains the details of a single Amazon SQS message along with an [Id].\n"]
type nonrec send_message_batch_request =
  {
  entries: send_message_batch_request_entry list ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec kms_throttled = {
  message: string option }[@@ocaml.doc
                            "Amazon Web Services KMS throttles requests for the following conditions.\n"]
type nonrec kms_opt_in_required = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified key policy isn't syntactically or semantically correct.\n"]
type nonrec kms_not_found = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified entity or resource could not be found. \n"]
type nonrec kms_invalid_state = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the state of the specified resource is not valid for this request.\n"]
type nonrec kms_invalid_key_usage = {
  message: string option }[@@ocaml.doc
                            "The request was rejected for one of the following reasons:\n\n {ul\n       {-  The KeyUsage value of the KMS key is incompatible with the API operation.\n           \n            }\n       {-  The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key (KeySpec).\n           \n            }\n       }\n  "]
type nonrec kms_disabled = {
  message: string option }[@@ocaml.doc
                            "The request was denied due to request throttling.\n"]
type nonrec kms_access_denied = {
  message: string option }[@@ocaml.doc
                            "The caller doesn't have the required KMS access.\n"]
type nonrec invalid_batch_entry_id = {
  message: string option }[@@ocaml.doc
                            "The [Id] of a batch entry in a batch request doesn't abide by the specification.\n"]
type nonrec empty_batch_request = {
  message: string option }[@@ocaml.doc
                            "The batch request doesn't contain any entries.\n"]
type nonrec batch_request_too_long = {
  message: string option }[@@ocaml.doc
                            "The length of all the messages put together is more than the limit.\n"]
type nonrec batch_entry_ids_not_distinct = {
  message: string option }[@@ocaml.doc
                            "Two or more batch entries in the request have the same [Id].\n"]
type nonrec invalid_message_contents = {
  message: string option }[@@ocaml.doc
                            "The message contains characters outside the allowed set.\n"]
type nonrec remove_permission_request = {
  label: string ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec message_system_attribute_name =
  | DeadLetterQueueSourceArn 
  | AWSTraceHeader 
  | MessageGroupId 
  | MessageDeduplicationId 
  | SequenceNumber 
  | ApproximateFirstReceiveTimestamp 
  | ApproximateReceiveCount 
  | SentTimestamp 
  | SenderId 
  | All [@@ocaml.doc ""]
type nonrec message_system_attribute_map =
  (message_system_attribute_name * string) list[@@ocaml.doc ""]
type nonrec message =
  {
  message_attributes: message_body_attribute_map option ;
  md5_of_message_attributes: string option ;
  attributes: message_system_attribute_map option ;
  body: string option ;
  md5_of_body: string option ;
  receipt_handle: string option ;
  message_id: string option }[@@ocaml.doc "An Amazon SQS message.\n"]
type nonrec receive_message_result = {
  messages: message list option }[@@ocaml.doc
                                   "A list of received messages.\n"]
type nonrec receive_message_request =
  {
  receive_request_attempt_id: string option ;
  wait_time_seconds: int option ;
  visibility_timeout: int option ;
  max_number_of_messages: int option ;
  message_attribute_names: string list option ;
  message_system_attribute_names: message_system_attribute_name list option ;
  attribute_names: queue_attribute_name list option ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec receipt_handle_is_invalid = {
  message: string option }[@@ocaml.doc
                            "The specified receipt handle isn't valid.\n"]
type nonrec queue_name_exists = {
  message: string option }[@@ocaml.doc
                            "A queue with this name already exists. Amazon SQS returns this error only if the request includes attributes whose values differ from those of the existing queue.\n"]
type nonrec queue_deleted_recently = {
  message: string option }[@@ocaml.doc
                            "You must wait 60 seconds after deleting a queue before you can create another queue with the same name.\n"]
type nonrec purge_queue_request = {
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec purge_queue_in_progress = {
  message: string option }[@@ocaml.doc
                            "Indicates that the specified queue previously received a [PurgeQueue] request within the last 60 seconds (the time it can take to delete the messages in the queue).\n"]
type nonrec message_not_inflight = unit
type nonrec list_queues_result =
  {
  next_token: string option ;
  queue_urls: string list option }[@@ocaml.doc "A list of your queues.\n"]
type nonrec list_queues_request =
  {
  max_results: int option ;
  next_token: string option ;
  queue_name_prefix: string option }[@@ocaml.doc "\n"]
type nonrec list_queue_tags_result = {
  tags: tag_map option }[@@ocaml.doc ""]
type nonrec list_queue_tags_request = {
  queue_url: string }[@@ocaml.doc ""]
type nonrec list_message_move_tasks_result_entry =
  {
  started_timestamp: int option ;
  failure_reason: string option ;
  approximate_number_of_messages_to_move: int option ;
  approximate_number_of_messages_moved: int option ;
  max_number_of_messages_per_second: int option ;
  destination_arn: string option ;
  source_arn: string option ;
  status: string option ;
  task_handle: string option }[@@ocaml.doc
                                "Contains the details of a message movement task. \n"]
type nonrec list_message_move_tasks_result =
  {
  results: list_message_move_tasks_result_entry list option }[@@ocaml.doc ""]
type nonrec list_message_move_tasks_request =
  {
  max_results: int option ;
  source_arn: string }[@@ocaml.doc ""]
type nonrec list_dead_letter_source_queues_result =
  {
  next_token: string option ;
  queue_urls: string list }[@@ocaml.doc
                             "A list of your dead letter source queues.\n"]
type nonrec list_dead_letter_source_queues_request =
  {
  max_results: int option ;
  next_token: string option ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec invalid_id_format = unit
type nonrec get_queue_url_result = {
  queue_url: string option }[@@ocaml.doc
                              "For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-api-responses.html}Interpreting Responses} in the {i Amazon SQS Developer Guide}.\n"]
type nonrec get_queue_url_request =
  {
  queue_owner_aws_account_id: string option ;
  queue_name: string }[@@ocaml.doc "\n"]
type nonrec get_queue_attributes_result =
  {
  attributes: queue_attribute_map option }[@@ocaml.doc
                                            "A list of returned queue attributes.\n"]
type nonrec get_queue_attributes_request =
  {
  attribute_names: queue_attribute_name list option ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec delete_queue_request = {
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec delete_message_request =
  {
  receipt_handle: string ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec delete_message_batch_result_entry = {
  id: string }[@@ocaml.doc
                "Encloses the [Id] of an entry in \n{[\n [DeleteMessageBatch].\n]}\n \n"]
type nonrec delete_message_batch_result =
  {
  failed: batch_result_error_entry list ;
  successful: delete_message_batch_result_entry list }[@@ocaml.doc
                                                        "For each message in the batch, the response contains a \n{[\n [DeleteMessageBatchResultEntry] \n]}\n tag if the message is deleted or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message can't be deleted.\n"]
type nonrec delete_message_batch_request_entry =
  {
  receipt_handle: string ;
  id: string }[@@ocaml.doc
                "Encloses a receipt handle and an identifier for it.\n"]
type nonrec delete_message_batch_request =
  {
  entries: delete_message_batch_request_entry list ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec create_queue_result = {
  queue_url: string option }[@@ocaml.doc
                              "Returns the [QueueUrl] attribute of the created queue.\n"]
type nonrec create_queue_request =
  {
  tags: tag_map option ;
  attributes: queue_attribute_map option ;
  queue_name: string }[@@ocaml.doc "\n"]
type nonrec change_message_visibility_request =
  {
  visibility_timeout: int ;
  receipt_handle: string ;
  queue_url: string }[@@ocaml.doc ""]
type nonrec change_message_visibility_batch_result_entry = {
  id: string }[@@ocaml.doc
                "Encloses the [Id] of an entry in \n{[\n [ChangeMessageVisibilityBatch].\n]}\n \n"]
type nonrec change_message_visibility_batch_result =
  {
  failed: batch_result_error_entry list ;
  successful: change_message_visibility_batch_result_entry list }[@@ocaml.doc
                                                                   "For each message in the batch, the response contains a \n{[\n [ChangeMessageVisibilityBatchResultEntry] \n]}\n tag if the message succeeds or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message fails.\n"]
type nonrec change_message_visibility_batch_request_entry =
  {
  visibility_timeout: int option ;
  receipt_handle: string ;
  id: string }[@@ocaml.doc
                "Encloses a receipt handle and an entry ID for each message in \n{[\n [ChangeMessageVisibilityBatch].\n]}\n \n"]
type nonrec change_message_visibility_batch_request =
  {
  entries: change_message_visibility_batch_request_entry list ;
  queue_url: string }[@@ocaml.doc "\n"]
type nonrec cancel_message_move_task_result =
  {
  approximate_number_of_messages_moved: int option }[@@ocaml.doc ""]
type nonrec cancel_message_move_task_request = {
  task_handle: string }[@@ocaml.doc ""]
type nonrec add_permission_request =
  {
  actions: string list ;
  aws_account_ids: string list ;
  label: string ;
  queue_url: string }[@@ocaml.doc "\n"](** {1:builders Builders} *)

val make_untag_queue_request :
  tag_keys:string list -> queue_url:string -> unit -> untag_queue_request
val make_tag_queue_request :
  tags:tag_map -> queue_url:string -> unit -> tag_queue_request
val make_start_message_move_task_request :
  ?max_number_of_messages_per_second:int ->
    ?destination_arn:string ->
      source_arn:string -> unit -> start_message_move_task_request
val make_set_queue_attributes_request :
  attributes:queue_attribute_map ->
    queue_url:string -> unit -> set_queue_attributes_request
val make_message_attribute_value :
  ?binary_list_values:bytes list ->
    ?string_list_values:string list ->
      ?binary_value:bytes ->
        ?string_value:string ->
          data_type:string -> unit -> message_attribute_value
val make_message_system_attribute_value :
  ?binary_list_values:bytes list ->
    ?string_list_values:string list ->
      ?binary_value:bytes ->
        ?string_value:string ->
          data_type:string -> unit -> message_system_attribute_value
val make_send_message_request :
  ?message_group_id:string ->
    ?message_deduplication_id:string ->
      ?message_system_attributes:message_body_system_attribute_map ->
        ?message_attributes:message_body_attribute_map ->
          ?delay_seconds:int ->
            message_body:string ->
              queue_url:string -> unit -> send_message_request
val make_send_message_batch_result_entry :
  ?sequence_number:string ->
    ?md5_of_message_system_attributes:string ->
      ?md5_of_message_attributes:string ->
        md5_of_message_body:string ->
          message_id:string ->
            id:string -> unit -> send_message_batch_result_entry
val make_batch_result_error_entry :
  ?message:string ->
    code:string ->
      sender_fault:bool -> id:string -> unit -> batch_result_error_entry
val make_send_message_batch_request_entry :
  ?message_group_id:string ->
    ?message_deduplication_id:string ->
      ?message_system_attributes:message_body_system_attribute_map ->
        ?message_attributes:message_body_attribute_map ->
          ?delay_seconds:int ->
            message_body:string ->
              id:string -> unit -> send_message_batch_request_entry
val make_send_message_batch_request :
  entries:send_message_batch_request_entry list ->
    queue_url:string -> unit -> send_message_batch_request
val make_remove_permission_request :
  label:string -> queue_url:string -> unit -> remove_permission_request
val make_message :
  ?message_attributes:message_body_attribute_map ->
    ?md5_of_message_attributes:string ->
      ?attributes:message_system_attribute_map ->
        ?body:string ->
          ?md5_of_body:string ->
            ?receipt_handle:string -> ?message_id:string -> unit -> message
val make_receive_message_request :
  ?receive_request_attempt_id:string ->
    ?wait_time_seconds:int ->
      ?visibility_timeout:int ->
        ?max_number_of_messages:int ->
          ?message_attribute_names:string list ->
            ?message_system_attribute_names:message_system_attribute_name
              list ->
              ?attribute_names:queue_attribute_name list ->
                queue_url:string -> unit -> receive_message_request
val make_purge_queue_request :
  queue_url:string -> unit -> purge_queue_request
val make_list_queues_request :
  ?max_results:int ->
    ?next_token:string ->
      ?queue_name_prefix:string -> unit -> list_queues_request
val make_list_queue_tags_request :
  queue_url:string -> unit -> list_queue_tags_request
val make_list_message_move_tasks_result_entry :
  ?started_timestamp:int ->
    ?failure_reason:string ->
      ?approximate_number_of_messages_to_move:int ->
        ?approximate_number_of_messages_moved:int ->
          ?max_number_of_messages_per_second:int ->
            ?destination_arn:string ->
              ?source_arn:string ->
                ?status:string ->
                  ?task_handle:string ->
                    unit -> list_message_move_tasks_result_entry
val make_list_message_move_tasks_request :
  ?max_results:int ->
    source_arn:string -> unit -> list_message_move_tasks_request
val make_list_dead_letter_source_queues_request :
  ?max_results:int ->
    ?next_token:string ->
      queue_url:string -> unit -> list_dead_letter_source_queues_request
val make_get_queue_url_request :
  ?queue_owner_aws_account_id:string ->
    queue_name:string -> unit -> get_queue_url_request
val make_get_queue_attributes_request :
  ?attribute_names:queue_attribute_name list ->
    queue_url:string -> unit -> get_queue_attributes_request
val make_delete_queue_request :
  queue_url:string -> unit -> delete_queue_request
val make_delete_message_request :
  receipt_handle:string -> queue_url:string -> unit -> delete_message_request
val make_delete_message_batch_result_entry :
  id:string -> unit -> delete_message_batch_result_entry
val make_delete_message_batch_request_entry :
  receipt_handle:string ->
    id:string -> unit -> delete_message_batch_request_entry
val make_delete_message_batch_request :
  entries:delete_message_batch_request_entry list ->
    queue_url:string -> unit -> delete_message_batch_request
val make_create_queue_request :
  ?tags:tag_map ->
    ?attributes:queue_attribute_map ->
      queue_name:string -> unit -> create_queue_request
val make_change_message_visibility_request :
  visibility_timeout:int ->
    receipt_handle:string ->
      queue_url:string -> unit -> change_message_visibility_request
val make_change_message_visibility_batch_result_entry :
  id:string -> unit -> change_message_visibility_batch_result_entry
val make_change_message_visibility_batch_request_entry :
  ?visibility_timeout:int ->
    receipt_handle:string ->
      id:string -> unit -> change_message_visibility_batch_request_entry
val make_change_message_visibility_batch_request :
  entries:change_message_visibility_batch_request_entry list ->
    queue_url:string -> unit -> change_message_visibility_batch_request
val make_cancel_message_move_task_request :
  task_handle:string -> unit -> cancel_message_move_task_request
val make_add_permission_request :
  actions:string list ->
    aws_account_ids:string list ->
      label:string -> queue_url:string -> unit -> add_permission_request(** {1:operations Operations} *)

module AddPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      add_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Adds a permission to a queue for a specific {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principal}. This allows sharing access to the queue.

 When you create a queue, you have full control access rights for the queue. Only you, the owner of the queue, can grant or deny permissions to the queue. For more information about these permissions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow Developers to Write Messages to a Shared Queue} in the {i Amazon SQS Developer Guide}.
 
   {ul
         {-   [AddPermission] generates a policy for you. You can use 
             {[
              [SetQueueAttributes] 
             ]}
              to upload your policy. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html}Using Custom Policies with the Amazon SQS Access Policy Language} in the {i Amazon SQS Developer Guide}.
             
              }
         {-  An Amazon SQS policy can have a maximum of seven actions per statement.
             
              }
         {-  To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.
             
              }
         {-  Amazon SQS [AddPermission] does not support adding a non-account principal.
             
              }
         }
     Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
     
       *)

  
end

module CancelMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_message_move_task_request ->
        (cancel_message_move_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Cancels a specified message movement task. A message movement can only be cancelled when the current status is RUNNING. Cancelling a message movement task does not revert the messages that have already been moved. It can only stop the messages that have not been moved yet.

  {ul
        {-  This action is currently limited to supporting message redrive from {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue. 
            
             }
        {-  Only one active message movement task is supported per queue at any given time.
            
             }
        }
    *)

  
end

module ChangeMessageVisibility : sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `MessageNotInflight of message_not_inflight
            | `QueueDoesNotExist of queue_does_not_exist
            | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Changes the visibility timeout of a specified message in a queue to a new value. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.

 For example, if the default timeout for a queue is 60 seconds, 15 seconds have elapsed since you received the message, and you send a ChangeMessageVisibility call with [VisibilityTimeout] set to 10 seconds, the 10 seconds begin to count from the time that you make the [ChangeMessageVisibility] call. Thus, any attempt to change the visibility timeout or to delete that message 10 seconds after you initially change the visibility timeout (a total of 25 seconds) might result in an error.
 
  An Amazon SQS message has three basic states:
  
   {ol
         {-  Sent to a queue by a producer.
             
              }
         {-  Received from the queue by a consumer.
             
              }
         {-  Deleted from the queue.
             
              }
         }
   A message is considered to be {i stored} after it is sent to a queue by a producer, but not yet received from the queue by a consumer (that is, between states 1 and 2). There is no limit to the number of stored messages. A message is considered to be {i in flight} after it is received from a queue by a consumer, but not yet deleted from the queue (that is, between states 2 and 3). There is a limit to the number of in flight messages.
   
    Limits that apply to in flight messages are unrelated to the {i unlimited} number of stored messages.
    
     For most standard queues (depending on queue traffic and message backlog), there can be a maximum of approximately 120,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns the [OverLimit] error message. To avoid reaching the limit, you should delete messages from the queue after they're processed. You can also increase the number of queues you use to process your messages. To request a limit increase, {{:https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs}file a support request}.
     
      For FIFO queues, there can be a maximum of 20,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns no error messages.
      
        If you attempt to set the [VisibilityTimeout] to a value greater than the maximum time left, Amazon SQS returns an error. Amazon SQS doesn't automatically recalculate and increase the timeout to the maximum remaining time.
        
         Unlike with a queue, when you change the visibility timeout for a specific message the timeout value is applied immediately but isn't saved in memory for that message. If you don't delete a message after it is received, the visibility timeout for the message reverts to the original timeout value (not to the value you set using the [ChangeMessageVisibility] action) the next time the message is received.
         
           *)

  
end

module ChangeMessageVisibilityBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_batch_request ->
        (change_message_visibility_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Changes the visibility timeout of multiple messages. This is a batch version of 
{[
 [ChangeMessageVisibility].
]}
 The result of the action on each message is reported individually in the response. You can send up to 10 
{[
 [ChangeMessageVisibility] 
]}
 requests with each [ChangeMessageVisibilityBatch] action.

  Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].
  
    *)

  
end

module CreateQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      create_queue_request ->
        (create_queue_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidAttributeValue of invalid_attribute_value
            | `InvalidSecurity of invalid_security
            | `QueueDeletedRecently of queue_deleted_recently
            | `QueueNameExists of queue_name_exists
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep the following in mind:

 {ul
       {-  If you don't specify the [FifoQueue] attribute, Amazon SQS creates a standard queue.
           
             You can't change the queue type after you create it and you can't convert an existing standard queue into a FIFO queue. You must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving}Moving From a Standard Queue to a FIFO Queue} in the {i Amazon SQS Developer Guide}. 
             
               }
       {-  If you don't provide a value for an attribute, the queue is created with the default value for the attribute.
           
            }
       {-  If you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.
           
            }
       }
   To successfully create a new queue, you must provide a queue name that adheres to the {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html}limits related to queues} and is unique within the scope of your queues.
   
     After you create a queue, you must wait at least one second after the queue is created to be able to use the queue.
     
       To get the queue URL, use the 
       {[
        [GetQueueUrl] 
       ]}
        action. 
       {[
        [GetQueueUrl] 
       ]}
        requires only the [QueueName] parameter. be aware of existing queue names:
       
        {ul
              {-  If you provide the name of an existing queue along with the exact names and values of all the queue's attributes, [CreateQueue] returns the queue URL for the existing queue.
                  
                   }
              {-  If the queue name, attribute names, or attribute values don't match an existing queue, [CreateQueue] returns an error.
                  
                   }
              }
    Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
    
      *)

  
end

module DeleteMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidIdFormat of invalid_id_format
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Deletes the specified message from the specified queue. To select the message to delete, use the [ReceiptHandle] of the message ({i not} the [MessageId] which you receive when you send the message). Amazon SQS can delete a message from a queue even if a visibility timeout setting causes the message to be locked by another consumer. Amazon SQS automatically deletes messages left in a queue longer than the retention period configured for the queue. 

  The [ReceiptHandle] is associated with a {i specific instance} of receiving a message. If you receive a message more than once, the [ReceiptHandle] is different each time you receive a message. When you use the [DeleteMessage] action, you must provide the most recently received [ReceiptHandle] for the message (otherwise, the request succeeds, but the message will not be deleted).
  
   For standard queues, it is possible to receive a message even after you delete it. This might happen on rare occasions if one of the servers which stores a copy of the message is unavailable when you send the request to delete the message. The copy remains on the server and might be returned to you during a subsequent receive request. You should ensure that your application is idempotent, so that receiving a message more than once does not cause issues.
   
     *)

  
end

module DeleteMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_batch_request ->
        (delete_message_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Deletes up to ten messages from the specified queue. This is a batch version of 
{[
 [DeleteMessage].
]}
 The result of the action on each message is reported individually in the response.

  Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].
  
    *)

  
end

module DeleteQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Deletes the queue specified by the [QueueUrl], regardless of the queue's contents.

  Be careful with the [DeleteQueue] action: When you delete a queue, any messages in the queue are no longer available. 
  
    When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving that queue during the 60 seconds might succeed. For example, a 
    {[
     [SendMessage] 
    ]}
     request might succeed, but after 60 seconds the queue and the message you sent no longer exist.
    
     When you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.
     
       Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
       
        The delete operation uses the HTTP [GET] verb.
        
          *)

  
end

module GetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_attributes_request ->
        (get_queue_attributes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Gets attributes for the specified queue.

  To determine whether a queue is {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, you can check whether [QueueName] ends with the [.fifo] suffix.
  
    *)

  
end

module GetQueueUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_url_request ->
        (get_queue_url_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Returns the URL of an existing Amazon SQS queue.

 To access a queue that belongs to another AWS account, use the [QueueOwnerAWSAccountId] parameter to specify the account ID of the queue's owner. The queue's owner must grant you permission to access the queue. For more information about shared queue access, see 
 {[
  [AddPermission] 
 ]}
  or see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow Developers to Write Messages to a Shared Queue} in the {i Amazon SQS Developer Guide}. 
  *)

  
end

module ListDeadLetterSourceQueues : sig
  val request :
    Smaws_Lib.Context.t ->
      list_dead_letter_source_queues_request ->
        (list_dead_letter_source_queues_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Returns a list of your queues that have the [RedrivePolicy] queue attribute configured with a dead-letter queue.

  The [ListDeadLetterSourceQueues] methods supports pagination. Set parameter [MaxResults] in the request to specify the maximum number of results to be returned in the response. If you do not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and there are additional results to display, the response includes a value for [NextToken]. Use [NextToken] as a parameter in your next request to [ListDeadLetterSourceQueues] to receive the next page of results. 
 
  For more information about using dead-letter queues, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}Using Amazon SQS Dead-Letter Queues} in the {i Amazon SQS Developer Guide}.
   *)

  
end

module ListMessageMoveTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_message_move_tasks_request ->
        (list_message_move_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Gets the most recent message movement tasks (up to 10) under a specific source queue.

  {ul
        {-  This action is currently limited to supporting message redrive from {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue. 
            
             }
        {-  Only one active message movement task is supported per queue at any given time.
            
             }
        }
    *)

  
end

module ListQueueTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queue_tags_request ->
        (list_queue_tags_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** List all cost allocation tags added to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.

  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
  
    *)

  
end

module ListQueues : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queues_request ->
        (list_queues_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Returns a list of your queues in the current region. The response includes a maximum of 1,000 results. If you specify a value for the optional [QueueNamePrefix] parameter, only queues with a name that begins with the specified value are returned.

  The [listQueues] methods supports pagination. Set parameter [MaxResults] in the request to specify the maximum number of results to be returned in the response. If you do not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and there are additional results to display, the response includes a value for [NextToken]. Use [NextToken] as a parameter in your next request to [listQueues] to receive the next page of results. 
 
   Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
   
     *)

  
end

module PurgeQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      purge_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `PurgeQueueInProgress of purge_queue_in_progress
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Deletes available messages in a queue (including in-flight messages) specified by the [QueueURL] parameter.

  When you use the [PurgeQueue] action, you can't retrieve any messages deleted from a queue.
  
   The message deletion process takes up to 60 seconds. We recommend waiting for 60 seconds regardless of your queue's size. 
   
     Messages sent to the queue {i before} you call [PurgeQueue] might be received but are deleted within the next minute.
     
      Messages sent to the queue {i after} you call [PurgeQueue] might be deleted while the queue is being purged.
       *)

  
end

module ReceiveMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      receive_message_request ->
        (receive_message_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
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
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Retrieves one or more messages (up to 10), from the specified queue. Using the [WaitTimeSeconds] parameter enables long-poll support. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html}Amazon SQS Long Polling} in the {i Amazon SQS Developer Guide}. 

 Short poll is the default behavior where a weighted random set of machines is sampled on a [ReceiveMessage] call. Thus, only the messages on the sampled machines are returned. If the number of messages in the queue is small (fewer than 1,000), you most likely get fewer messages than you requested per [ReceiveMessage] call. If the number of messages in the queue is extremely small, you might not receive any messages in a particular [ReceiveMessage] response. If this happens, repeat the request. 
 
  For each message returned, the response includes the following:
  
   {ul
         {-  The message body.
             
              }
         {-  An MD5 digest of the message body. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.
             
              }
         {-  The [MessageId] you received when you sent the message to the queue.
             
              }
         {-  The receipt handle.
             
              }
         {-  The message attributes.
             
              }
         {-  An MD5 digest of the message attributes.
             
              }
         }
   The receipt handle is the identifier you must provide when deleting the message. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue and Message Identifiers} in the {i Amazon SQS Developer Guide}.
   
    You can provide the [VisibilityTimeout] parameter in your request. The parameter is applied to the messages that Amazon SQS returns in the response. If you don't include the parameter, the overall visibility timeout for the queue is used for the returned messages. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.
    
     A message that isn't deleted or a message whose visibility isn't extended before the visibility timeout expires counts as a failed receive. Depending on the configuration of the queue, the message might be sent to the dead-letter queue.
     
       In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.
       
         *)

  
end

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Revokes any permissions in the queue policy that matches the specified [Label] parameter.

  {ul
        {-  Only the owner of a queue can remove permissions from it.
            
             }
        {-  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
            
             }
        {-  To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.
            
             }
        }
    *)

  
end

module SendMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_request ->
        (send_message_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
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
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Delivers a message to the specified queue.

  A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.
  
    [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] 
   
    Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.
    
      *)

  
end

module SendMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_batch_request ->
        (send_message_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
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
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** You can use [SendMessageBatch] to send up to 10 messages to the specified queue by assigning either identical or different values to each message (or by not assigning values at all). This is a batch version of 
{[
 [SendMessage].
]}
 For a FIFO queue, multiple messages within a single batch are enqueued in the order they are sent.

 The result of sending each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].
 
  The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KiB (262,144 bytes).
  
    A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.
    
      [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] 
     
      Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.
      
        If you don't specify the [DelaySeconds] parameter for an entry, Amazon SQS uses the default value for the queue.
         *)

  
end

module SetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      set_queue_attributes_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidAttributeValue of invalid_attribute_value
            | `InvalidSecurity of invalid_security
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Sets the value of one or more queue attributes, like a policy. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.

  {ul
        {-  In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.
            
             }
        {-  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
            
             }
        {-  To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.
            
             }
        }
    *)

  
end

module StartMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
      start_message_move_task_request ->
        (start_message_move_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Starts an asynchronous task to move messages from a specified source queue to a specified destination queue.

  {ul
        {-  This action is currently limited to supporting message redrive from queues that are configured as {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} of other Amazon SQS queues only. Non-SQS queue sources of dead-letter queues, such as Lambda or Amazon SNS topics, are currently not supported.
            
             }
        {-  In dead-letter queues redrive context, the [StartMessageMoveTask] the source queue is the DLQ, while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.
            
             }
        {-  Only one active message movement task is supported per queue at any given time.
            
             }
        }
    *)

  
end

module TagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Add cost allocation tags to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.

 When you use queue tags, keep the following guidelines in mind:
 
  {ul
        {-  Adding more than 50 tags to a queue isn't recommended.
            
             }
        {-  Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings.
            
             }
        {-  Tags are case-sensitive.
            
             }
        {-  A new tag with a key identical to that of an existing tag overwrites the existing tag.
            
             }
        }
   For a full list of tag restrictions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues}Quotas related to queues} in the {i Amazon SQS Developer Guide}.
   
     Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
     
       *)

  
end

module UntagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
  (** Remove cost allocation tags from the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.

  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.
  
    *)

  
end

