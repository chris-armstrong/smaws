open Smaws_Lib
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
  queue_url: string }[@@ocaml.doc "\n"]