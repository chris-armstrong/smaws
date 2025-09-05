(** 
    SQS client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec string_ = string[@@ocaml.doc ""]
type nonrec tag_key = string[@@ocaml.doc ""]
type nonrec tag_key_list = tag_key list[@@ocaml.doc ""]
type nonrec untag_queue_request =
  {
  tag_keys: tag_key_list
    [@ocaml.doc "The list of tags to be removed from the specified queue.\n"];
  queue_url: string_ [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc ""]
type nonrec exception_message = string[@@ocaml.doc ""]
type nonrec unsupported_operation =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Error code 400. Unsupported operation.\n"]
type nonrec request_throttled =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was denied due to request throttling.\n\n {ul\n       {-  Exceeds the permitted request rate for the queue or for the recipient of the request.\n           \n            }\n       {-  Ensure that the request rate is within the Amazon SQS limits for sending messages. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-quotas.html#quotas-requests}Amazon SQS quotas} in the {i Amazon SQS Developer Guide}.\n           \n            }\n       }\n  "]
type nonrec queue_does_not_exist =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Ensure that the [QueueUrl] is correct and that the queue has not been deleted.\n"]
type nonrec invalid_security =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was not made over HTTPS or did not use SigV4 for signing.\n"]
type nonrec invalid_address =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified ID is invalid.\n"]
type nonrec too_many_entries_in_batch_request =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The batch request contains more entries than permissible. For Amazon SQS, the maximum number of entries you can include in a single {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessageBatch.html}SendMessageBatch}, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_DeleteMessageBatch.html}DeleteMessageBatch}, or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_ChangeMessageVisibilityBatch.html}ChangeMessageVisibilityBatch} request is 10.\n"]
type nonrec token = string[@@ocaml.doc ""]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag_map = (tag_key * tag_value) list[@@ocaml.doc ""]
type nonrec tag_queue_request =
  {
  tags: tag_map
    [@ocaml.doc "The list of tags to be added to the specified queue.\n"];
  queue_url: string_ [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc ""]
type nonrec string_list = string_ list[@@ocaml.doc ""]
type nonrec start_message_move_task_result =
  {
  task_handle: string_ option
    [@ocaml.doc
      "An identifier associated with a message movement task. You can use this identifier to cancel a specified message movement task using the [CancelMessageMoveTask] action.\n"]}
[@@ocaml.doc ""]
type nonrec nullable_integer = int[@@ocaml.doc ""]
type nonrec start_message_move_task_request =
  {
  max_number_of_messages_per_second: nullable_integer option
    [@ocaml.doc
      "The number of messages to be moved per second (the message movement rate). You can use this field to define a fixed message movement rate. The maximum value for messages per second is 500. If this field is left blank, the system will optimize the rate based on the queue message backlog size, which may vary throughout the duration of the message movement task.\n"];
  destination_arn: string_ option
    [@ocaml.doc
      "The ARN of the queue that receives the moved messages. You can use this field to specify the destination queue where you would like to redrive messages. If this field is left blank, the messages will be redriven back to their respective original source queues.\n"];
  source_arn: string_
    [@ocaml.doc
      "The ARN of the queue that contains the messages to be moved to another queue. Currently, only ARNs of dead-letter queues (DLQs) whose sources are other Amazon SQS queues are accepted. DLQs whose sources are non-SQS queues, such as Lambda or Amazon SNS topics, are not currently supported.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "One or more specified resources don't exist.\n"]
type nonrec queue_attribute_name =
  | SqsManagedSseEnabled [@ocaml.doc ""]
  | RedriveAllowPolicy [@ocaml.doc ""]
  | FifoThroughputLimit [@ocaml.doc ""]
  | DeduplicationScope [@ocaml.doc ""]
  | KmsDataKeyReusePeriodSeconds [@ocaml.doc ""]
  | KmsMasterKeyId [@ocaml.doc ""]
  | ContentBasedDeduplication [@ocaml.doc ""]
  | FifoQueue [@ocaml.doc ""]
  | RedrivePolicy [@ocaml.doc ""]
  | ReceiveMessageWaitTimeSeconds [@ocaml.doc ""]
  | DelaySeconds [@ocaml.doc ""]
  | ApproximateNumberOfMessagesDelayed [@ocaml.doc ""]
  | QueueArn [@ocaml.doc ""]
  | LastModifiedTimestamp [@ocaml.doc ""]
  | CreatedTimestamp [@ocaml.doc ""]
  | ApproximateNumberOfMessagesNotVisible [@ocaml.doc ""]
  | ApproximateNumberOfMessages [@ocaml.doc ""]
  | MessageRetentionPeriod [@ocaml.doc ""]
  | MaximumMessageSize [@ocaml.doc ""]
  | VisibilityTimeout [@ocaml.doc ""]
  | Policy [@ocaml.doc ""]
  | All [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec queue_attribute_map = (queue_attribute_name * string_) list
[@@ocaml.doc ""]
type nonrec set_queue_attributes_request =
  {
  attributes: queue_attribute_map
    [@ocaml.doc
      "A map of attributes to set.\n\n The following lists the names, descriptions, and values of the special request parameters that the [SetQueueAttributes] action uses:\n \n  {ul\n        {-   [DelaySeconds] \226\128\147 The length of time, in seconds, for which the delivery of all messages in the queue is delayed. Valid values: An integer from 0 to 900 (15 minutes). Default: 0. \n            \n             }\n        {-   [MaximumMessageSize] \226\128\147 The limit of how many bytes a message can contain before Amazon SQS rejects it. Valid values: An integer from 1,024 bytes (1 KiB) up to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB). \n            \n             }\n        {-   [MessageRetentionPeriod] \226\128\147 The length of time, in seconds, for which Amazon SQS retains a message. Valid values: An integer representing seconds, from 60 (1 minute) to 1,209,600 (14 days). Default: 345,600 (4 days). When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.\n            \n             }\n        {-   [Policy] \226\128\147 The queue's policy. A valid Amazon Web Services policy. For more information about policy structure, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html}Overview of Amazon Web Services IAM Policies} in the {i Identity and Access Management User Guide}. \n            \n             }\n        {-   [ReceiveMessageWaitTimeSeconds] \226\128\147 The length of time, in seconds, for which a \n            {[\n             [ReceiveMessage] \n            ]}\n             action waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0. \n            \n             }\n        {-   [VisibilityTimeout] \226\128\147 The visibility timeout for the queue, in seconds. Valid values: An integer from 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n            \n             }\n        }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:} \n   \n    {ul\n          {-   [RedrivePolicy] \226\128\147 The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [deadLetterTargetArn] \226\128\147 The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.\n                         \n                          }\n                     {-   [maxReceiveCount] \226\128\147 The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.\n                         \n                          }\n                     \n           }\n            }\n          {-   [RedriveAllowPolicy] \226\128\147 The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [redrivePermission] \226\128\147 The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:\n                         \n                          {ul\n                                {-   [allowAll] \226\128\147 (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [denyAll] \226\128\147 No source queues can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [byQueue] \226\128\147 Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-   [sourceQueueArns] \226\128\147 The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].\n                         \n                          }\n                     \n           }\n            }\n          }\n    The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.\n    \n      The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:\n      \n       {ul\n             {-   [KmsMasterKeyId] \226\128\147 The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. While the alias of the AWS-managed CMK for Amazon SQS is always [alias/aws/sqs], the alias of a custom CMK can, for example, be \n                 {[\n                 alias/{i MyAlias} \n                 ]}\n                 . For more examples, see {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} in the {i Key Management Service API Reference}. \n                 \n                  }\n             {-   [KmsDataKeyReusePeriodSeconds] \226\128\147 The length of time, in seconds, for which Amazon SQS can reuse a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys}data key} to encrypt or decrypt messages before calling KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). Default: 300 (5 minutes). A shorter time period provides better security but results in more calls to KMS which might incur charges after Free Tier. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}. \n                 \n                  }\n             {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n                 \n                  }\n             }\n   The following attribute applies only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:\n   \n    {ul\n          {-   [ContentBasedDeduplication] \226\128\147 Enables content-based deduplication. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. Note the following: \n              \n               {ul\n                     {-  Every message must have a unique [MessageDeduplicationId].\n                         \n                          {ul\n                                {-  You may provide a [MessageDeduplicationId] explicitly.\n                                    \n                                     }\n                                {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                                    \n                                     }\n                                {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                                    \n                                     }\n                                {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n                         \n                          }\n                     {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n                         \n                          }\n                     \n           }\n            }\n          }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:\n   \n    {ul\n          {-   [DeduplicationScope] \226\128\147 Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].\n              \n               }\n          {-   [FifoThroughputLimit] \226\128\147 Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].\n              \n               }\n          }\n   To enable high throughput for FIFO queues, do the following:\n   \n    {ul\n          {-  Set [DeduplicationScope] to [messageGroup].\n              \n               }\n          {-  Set [FifoThroughputLimit] to [perMessageGroupId].\n              \n               }\n          }\n   If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.\n   \n    For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.\n    "];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose attributes are set.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec over_limit = {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified action violates a limit. For example, [ReceiveMessage] returns this error if the maximum number of in flight messages is reached and [AddPermission] returns this error if the maximum number of permissions for the queue is reached.\n"]
type nonrec invalid_attribute_value =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "A queue attribute value is invalid.\n"]
type nonrec invalid_attribute_name =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified attribute doesn't exist.\n"]
type nonrec send_message_result =
  {
  sequence_number: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The large, non-consecutive number that Amazon SQS assigns to each message.\n \n  The length of [SequenceNumber] is 128 bits. [SequenceNumber] continues to increase for a particular [MessageGroupId].\n  "];
  message_id: string_ option
    [@ocaml.doc
      "An attribute containing the [MessageId] of the message sent to the queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue and Message Identifiers} in the {i Amazon SQS Developer Guide}. \n"];
  md5_of_message_system_attributes: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest.\n"];
  md5_of_message_attributes: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  md5_of_message_body: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"]}
[@@ocaml.doc "The [MD5OfMessageBody] and [MessageId] elements.\n"]
type nonrec binary = bytes[@@ocaml.doc ""]
type nonrec binary_list = binary list[@@ocaml.doc ""]
type nonrec message_attribute_value =
  {
  data_type: string_
    [@ocaml.doc
      "Amazon SQS supports the following logical data types: [String], [Number], and [Binary]. For the [Number] data type, you must use [StringValue].\n\n You can also append custom labels. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes} in the {i Amazon SQS Developer Guide}.\n "];
  binary_list_values: binary_list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  string_list_values: string_list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  binary_value: binary option
    [@ocaml.doc
      "Binary type attributes can store any binary data, such as compressed data, encrypted data, or images.\n"];
  string_value: string_ option
    [@ocaml.doc
      "Strings are Unicode with UTF-8 binary encoding. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}ASCII Printable Characters}.\n"]}
[@@ocaml.doc
  "The user-specified message attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see \n{[\n [SendMessage].\n]}\n \n\n  [Name], [type], [value] and the message body must not be empty or null. All parts of the message attribute, including [Name], [Type], and [Value], are part of the message size restriction (256 KiB or 262,144 bytes).\n "]
type nonrec message_body_attribute_map =
  (string_ * message_attribute_value) list[@@ocaml.doc ""]
type nonrec message_system_attribute_value =
  {
  data_type: string_
    [@ocaml.doc
      "Amazon SQS supports the following logical data types: [String], [Number], and [Binary]. For the [Number] data type, you must use [StringValue].\n\n You can also append custom labels. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes} in the {i Amazon SQS Developer Guide}.\n "];
  binary_list_values: binary_list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  string_list_values: string_list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  binary_value: binary option
    [@ocaml.doc
      "Binary type attributes can store any binary data, such as compressed data, encrypted data, or images.\n"];
  string_value: string_ option
    [@ocaml.doc
      "Strings are Unicode with UTF-8 binary encoding. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}ASCII Printable Characters}.\n"]}
[@@ocaml.doc
  "The user-specified message system attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see \n{[\n [SendMessage].\n]}\n \n\n  [Name], [type], [value] and the message body must not be empty or null.\n "]
type nonrec message_system_attribute_name_for_sends =
  | AWSTraceHeader [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec message_body_system_attribute_map =
  (message_system_attribute_name_for_sends * message_system_attribute_value)
    list[@@ocaml.doc ""]
type nonrec send_message_request =
  {
  message_group_id: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use [MessageGroupId] values (for example, session data for multiple users). In this scenario, multiple consumers can process the queue, but the session data of each user is processed in a FIFO fashion.\n \n  {ul\n        {-  You must associate a non-empty [MessageGroupId] with a message. If you don't provide a [MessageGroupId], the action fails.\n            \n             }\n        {-   [ReceiveMessage] might return messages with multiple [MessageGroupId] values. For each [MessageGroupId], the messages are sorted by time sent. The caller can't specify a [MessageGroupId].\n            \n             }\n        }\n   The maximum length of [MessageGroupId] is 128 characters. Valid values: alphanumeric characters and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n   \n    For best practices of using [MessageGroupId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html}Using the MessageGroupId Property} in the {i Amazon SQS Developer Guide}.\n    \n       [MessageGroupId] is required for FIFO queues. You can't use it for Standard queues.\n      \n       "];
  message_deduplication_id: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The token used for deduplication of sent messages. If a message with a particular [MessageDeduplicationId] is sent successfully, any messages sent with the same [MessageDeduplicationId] are accepted successfully but aren't delivered during the 5-minute deduplication interval. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html} Exactly-once processing} in the {i Amazon SQS Developer Guide}.\n \n  {ul\n        {-  Every message must have a unique [MessageDeduplicationId],\n            \n             {ul\n                   {-  You may provide a [MessageDeduplicationId] explicitly.\n                       \n                        }\n                   {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                       \n                        }\n                   {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                       \n                        }\n                   {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                       \n                        }\n                   \n         }\n          }\n        {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n            \n             }\n        {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n            \n             }\n        }\n    The [MessageDeduplicationId] is available to the consumer of the message (this can be useful for troubleshooting delivery issues).\n    \n     If a message is sent successfully but the acknowledgement is lost and the message is resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon SQS can't detect duplicate messages.\n     \n      Amazon SQS continues to keep track of the message deduplication ID even after the message is received and deleted.\n      \n        The maximum length of [MessageDeduplicationId] is 128 characters. [MessageDeduplicationId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~]).\n        \n         For best practices of using [MessageDeduplicationId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html}Using the MessageDeduplicationId Property} in the {i Amazon SQS Developer Guide}.\n         "];
  message_system_attributes: message_body_system_attribute_map option
    [@ocaml.doc
      "The message system attribute to send. Each message system attribute consists of a [Name], [Type], and [Value].\n\n  {ul\n        {-  Currently, the only supported message system attribute is [AWSTraceHeader]. Its type must be [String] and its value must be a correctly formatted X-Ray trace header string.\n            \n             }\n        {-  The size of a message system attribute doesn't count towards the total size of a message.\n            \n             }\n        }\n   "];
  message_attributes: message_body_attribute_map option
    [@ocaml.doc
      "Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.\n"];
  delay_seconds: nullable_integer option
    [@ocaml.doc
      " The length of time, in seconds, for which to delay a specific message. Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive [DelaySeconds] value become available for processing after the delay period is finished. If you don't specify a value, the default value for the queue applies. \n\n  When you set [FifoQueue], you can't set [DelaySeconds] per message. You can set this parameter only on a queue level.\n  \n   "];
  message_body: string_
    [@ocaml.doc
      "The message to send. The minimum size is one character. The maximum size is 256 KiB.\n\n  A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.\n  \n    [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] \n   \n    Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.\n    \n     "];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue to which a message is sent.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec send_message_batch_result_entry =
  {
  sequence_number: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The large, non-consecutive number that Amazon SQS assigns to each message.\n \n  The length of [SequenceNumber] is 128 bits. As [SequenceNumber] continues to increase for a particular [MessageGroupId].\n  "];
  md5_of_message_system_attributes: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  md5_of_message_attributes: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  md5_of_message_body: string_
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  message_id: string_ [@ocaml.doc "An identifier for the message.\n"];
  id: string_ [@ocaml.doc "An identifier for the message in this batch.\n"]}
[@@ocaml.doc
  "Encloses a [MessageId] for a successfully-enqueued message in a \n{[\n [SendMessageBatch].\n]}\n \n"]
type nonrec send_message_batch_result_entry_list =
  send_message_batch_result_entry list[@@ocaml.doc ""]
type nonrec boolean_ = bool[@@ocaml.doc ""]
type nonrec batch_result_error_entry =
  {
  message: string_ option
    [@ocaml.doc
      "A message explaining why the action failed on this entry.\n"];
  code: string_
    [@ocaml.doc
      "An error code representing why the action failed on this entry.\n"];
  sender_fault: boolean_
    [@ocaml.doc
      "Specifies whether the error happened due to the caller of the batch API action.\n"];
  id: string_ [@ocaml.doc "The [Id] of an entry in a batch request.\n"]}
[@@ocaml.doc
  "Gives a detailed description of the result of an action on each entry in the request.\n"]
type nonrec batch_result_error_entry_list = batch_result_error_entry list
[@@ocaml.doc ""]
type nonrec send_message_batch_result =
  {
  failed: batch_result_error_entry_list
    [@ocaml.doc
      "A list of \n{[\n [BatchResultErrorEntry] \n]}\n items with error details about each message that can't be enqueued.\n"];
  successful: send_message_batch_result_entry_list
    [@ocaml.doc
      "A list of \n{[\n [SendMessageBatchResultEntry] \n]}\n items.\n"]}
[@@ocaml.doc
  "For each message in the batch, the response contains a \n{[\n [SendMessageBatchResultEntry] \n]}\n tag if the message succeeds or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message fails.\n"]
type nonrec send_message_batch_request_entry =
  {
  message_group_id: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use [MessageGroupId] values (for example, session data for multiple users). In this scenario, multiple consumers can process the queue, but the session data of each user is processed in a FIFO fashion.\n \n  {ul\n        {-  You must associate a non-empty [MessageGroupId] with a message. If you don't provide a [MessageGroupId], the action fails.\n            \n             }\n        {-   [ReceiveMessage] might return messages with multiple [MessageGroupId] values. For each [MessageGroupId], the messages are sorted by time sent. The caller can't specify a [MessageGroupId].\n            \n             }\n        }\n   The length of [MessageGroupId] is 128 characters. Valid values: alphanumeric characters and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n   \n    For best practices of using [MessageGroupId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html}Using the MessageGroupId Property} in the {i Amazon SQS Developer Guide}.\n    \n       [MessageGroupId] is required for FIFO queues. You can't use it for Standard queues.\n      \n       "];
  message_deduplication_id: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The token used for deduplication of messages within a 5-minute minimum deduplication interval. If a message with a particular [MessageDeduplicationId] is sent successfully, subsequent messages with the same [MessageDeduplicationId] are accepted successfully but aren't delivered. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html} Exactly-once processing} in the {i Amazon SQS Developer Guide}.\n \n  {ul\n        {-  Every message must have a unique [MessageDeduplicationId],\n            \n             {ul\n                   {-  You may provide a [MessageDeduplicationId] explicitly.\n                       \n                        }\n                   {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                       \n                        }\n                   {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                       \n                        }\n                   {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                       \n                        }\n                   \n         }\n          }\n        {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n            \n             }\n        {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n            \n             }\n        }\n    The [MessageDeduplicationId] is available to the consumer of the message (this can be useful for troubleshooting delivery issues).\n    \n     If a message is sent successfully but the acknowledgement is lost and the message is resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon SQS can't detect duplicate messages.\n     \n      Amazon SQS continues to keep track of the message deduplication ID even after the message is received and deleted.\n      \n        The length of [MessageDeduplicationId] is 128 characters. [MessageDeduplicationId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~]).\n        \n         For best practices of using [MessageDeduplicationId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html}Using the MessageDeduplicationId Property} in the {i Amazon SQS Developer Guide}.\n         "];
  message_system_attributes: message_body_system_attribute_map option
    [@ocaml.doc
      "The message system attribute to send Each message system attribute consists of a [Name], [Type], and [Value].\n\n  {ul\n        {-  Currently, the only supported message system attribute is [AWSTraceHeader]. Its type must be [String] and its value must be a correctly formatted X-Ray trace header string.\n            \n             }\n        {-  The size of a message system attribute doesn't count towards the total size of a message.\n            \n             }\n        }\n   "];
  message_attributes: message_body_attribute_map option
    [@ocaml.doc
      "Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.\n"];
  delay_seconds: nullable_integer option
    [@ocaml.doc
      "The length of time, in seconds, for which a specific message is delayed. Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive [DelaySeconds] value become available for processing after the delay period is finished. If you don't specify a value, the default value for the queue is applied. \n\n  When you set [FifoQueue], you can't set [DelaySeconds] per message. You can set this parameter only on a queue level.\n  \n   "];
  message_body: string_ [@ocaml.doc "The body of the message.\n"];
  id: string_
    [@ocaml.doc
      "An identifier for a message in this batch used to communicate the result.\n\n  The [Id]s of a batch request need to be unique within a request.\n  \n   This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).\n   \n    "]}
[@@ocaml.doc
  "Contains the details of a single Amazon SQS message along with an [Id].\n"]
type nonrec send_message_batch_request_entry_list =
  send_message_batch_request_entry list[@@ocaml.doc ""]
type nonrec send_message_batch_request =
  {
  entries: send_message_batch_request_entry_list
    [@ocaml.doc
      "A list of \n{[\n [SendMessageBatchRequestEntry] \n]}\n items.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue to which batched messages are sent.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec kms_throttled =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Amazon Web Services KMS throttles requests for the following conditions.\n"]
type nonrec kms_opt_in_required =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was rejected because the specified key policy isn't syntactically or semantically correct.\n"]
type nonrec kms_not_found =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was rejected because the specified entity or resource could not be found. \n"]
type nonrec kms_invalid_state =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was rejected because the state of the specified resource is not valid for this request.\n"]
type nonrec kms_invalid_key_usage =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was rejected for one of the following reasons:\n\n {ul\n       {-  The KeyUsage value of the KMS key is incompatible with the API operation.\n           \n            }\n       {-  The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key (KeySpec).\n           \n            }\n       }\n  "]
type nonrec kms_disabled =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was denied due to request throttling.\n"]
type nonrec kms_access_denied =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The caller doesn't have the required KMS access.\n"]
type nonrec invalid_batch_entry_id =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The [Id] of a batch entry in a batch request doesn't abide by the specification.\n"]
type nonrec empty_batch_request =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The batch request doesn't contain any entries.\n"]
type nonrec batch_request_too_long =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The length of all the messages put together is more than the limit.\n"]
type nonrec batch_entry_ids_not_distinct =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Two or more batch entries in the request have the same [Id].\n"]
type nonrec invalid_message_contents =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The message contains characters outside the allowed set.\n"]
type nonrec remove_permission_request =
  {
  label: string_
    [@ocaml.doc
      "The identification of the permission to remove. This is the label added using the \n{[\n [AddPermission] \n]}\n action.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which permissions are removed.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec message_system_attribute_name =
  | DeadLetterQueueSourceArn [@ocaml.doc ""]
  | AWSTraceHeader [@ocaml.doc ""]
  | MessageGroupId [@ocaml.doc ""]
  | MessageDeduplicationId [@ocaml.doc ""]
  | SequenceNumber [@ocaml.doc ""]
  | ApproximateFirstReceiveTimestamp [@ocaml.doc ""]
  | ApproximateReceiveCount [@ocaml.doc ""]
  | SentTimestamp [@ocaml.doc ""]
  | SenderId [@ocaml.doc ""]
  | All [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec message_system_attribute_map =
  (message_system_attribute_name * string_) list[@@ocaml.doc ""]
type nonrec message =
  {
  message_attributes: message_body_attribute_map option
    [@ocaml.doc
      "Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.\n"];
  md5_of_message_attributes: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  attributes: message_system_attribute_map option
    [@ocaml.doc
      "A map of the attributes requested in \n{[\n [ReceiveMessage] \n]}\n to their respective values. Supported attributes:\n\n {ul\n       {-   [ApproximateReceiveCount] \n           \n            }\n       {-   [ApproximateFirstReceiveTimestamp] \n           \n            }\n       {-   [MessageDeduplicationId] \n           \n            }\n       {-   [MessageGroupId] \n           \n            }\n       {-   [SenderId] \n           \n            }\n       {-   [SentTimestamp] \n           \n            }\n       {-   [SequenceNumber] \n           \n            }\n       }\n    [ApproximateFirstReceiveTimestamp] and [SentTimestamp] are each returned as an integer representing the {{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds.\n   "];
  body: string_ option
    [@ocaml.doc "The message's contents (not URL-encoded).\n"];
  md5_of_body: string_ option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message body string.\n"];
  receipt_handle: string_ option
    [@ocaml.doc
      "An identifier associated with the act of receiving the message. A new receipt handle is returned every time you receive a message. When deleting a message, you provide the last received receipt handle to delete the message.\n"];
  message_id: string_ option
    [@ocaml.doc
      "A unique identifier for the message. A [MessageId]is considered unique across all Amazon Web Services accounts for an extended period of time.\n"]}
[@@ocaml.doc "An Amazon SQS message.\n"]
type nonrec message_list = message list[@@ocaml.doc ""]
type nonrec receive_message_result =
  {
  messages: message_list option [@ocaml.doc "A list of messages.\n"]}
[@@ocaml.doc "A list of received messages.\n"]
type nonrec attribute_name_list = queue_attribute_name list[@@ocaml.doc ""]
type nonrec message_system_attribute_list =
  message_system_attribute_name list[@@ocaml.doc ""]
type nonrec message_attribute_name = string[@@ocaml.doc ""]
type nonrec message_attribute_name_list = message_attribute_name list
[@@ocaml.doc ""]
type nonrec receive_message_request =
  {
  receive_request_attempt_id: string_ option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The token used for deduplication of [ReceiveMessage] calls. If a networking issue occurs after a [ReceiveMessage] action, and instead of a response you receive a generic error, it is possible to retry the same action with an identical [ReceiveRequestAttemptId] to retrieve the same set of messages, even if their visibility timeout has not yet expired.\n \n  {ul\n        {-  You can use [ReceiveRequestAttemptId] only for 5 minutes after a [ReceiveMessage] action.\n            \n             }\n        {-  When you set [FifoQueue], a caller of the [ReceiveMessage] action can provide a [ReceiveRequestAttemptId] explicitly.\n            \n             }\n        {-  It is possible to retry the [ReceiveMessage] action with the same [ReceiveRequestAttemptId] if none of the messages have been modified (deleted or had their visibility changes).\n            \n             }\n        {-  During a visibility timeout, subsequent calls with the same [ReceiveRequestAttemptId] return the same messages and receipt handles. If a retry occurs within the deduplication interval, it resets the visibility timeout. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n            \n              If a caller of the [ReceiveMessage] action still processes messages when the visibility timeout expires and messages become visible, another worker consuming from the same queue can receive the same messages and therefore process duplicates. Also, if a consumer whose message processing time is longer than the visibility timeout tries to delete the processed messages, the action fails with an error.\n              \n               To mitigate this effect, ensure that your application observes a safe threshold before the visibility timeout expires and extend the visibility timeout as necessary.\n               \n                 }\n        {-  While messages with a particular [MessageGroupId] are invisible, no more messages belonging to the same [MessageGroupId] are returned until the visibility timeout expires. You can still receive messages with another [MessageGroupId] as long as it is also visible.\n            \n             }\n        {-  If a caller of [ReceiveMessage] can't track the [ReceiveRequestAttemptId], no retries work until the original visibility timeout expires. As a result, delays might occur but the messages in the queue remain in a strict order.\n            \n             }\n        }\n   The maximum length of [ReceiveRequestAttemptId] is 128 characters. [ReceiveRequestAttemptId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~]).\n   \n    For best practices of using [ReceiveRequestAttemptId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-receiverequestattemptid-request-parameter.html}Using the ReceiveRequestAttemptId Request Parameter} in the {i Amazon SQS Developer Guide}.\n    "];
  wait_time_seconds: nullable_integer option
    [@ocaml.doc
      "The duration (in seconds) for which the call waits for a message to arrive in the queue before returning. If a message is available, the call returns sooner than [WaitTimeSeconds]. If no messages are available and the wait time expires, the call does not return a message list. If you are using the Java SDK, it returns a [ReceiveMessageResponse] object, which has a empty list instead of a Null object.\n\n  To avoid HTTP errors, ensure that the HTTP response timeout for [ReceiveMessage] requests is longer than the [WaitTimeSeconds] parameter. For example, with the Java SDK, you can set HTTP transport settings using the {{:https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/nio/netty/NettyNioAsyncHttpClient.html} NettyNioAsyncHttpClient} for asynchronous clients, or the {{:https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/apache/ApacheHttpClient.html} ApacheHttpClient} for synchronous clients. \n  \n   "];
  visibility_timeout: nullable_integer option
    [@ocaml.doc
      "The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a [ReceiveMessage] request. If not specified, the default visibility timeout for the queue is used, which is 30 seconds.\n\n Understanding [VisibilityTimeout]:\n \n  {ul\n        {-  When a message is received from a queue, it becomes temporarily invisible to other consumers for the duration of the visibility timeout. This prevents multiple consumers from processing the same message simultaneously. If the message is not deleted or its visibility timeout is not extended before the timeout expires, it becomes visible again and can be retrieved by other consumers.\n            \n             }\n        {-  Setting an appropriate visibility timeout is crucial. If it's too short, the message might become visible again before processing is complete, leading to duplicate processing. If it's too long, it delays the reprocessing of messages if the initial processing fails.\n            \n             }\n        {-  You can adjust the visibility timeout using the [--visibility-timeout] parameter in the [receive-message] command to match the processing time required by your application.\n            \n             }\n        {-  A message that isn't deleted or a message whose visibility isn't extended before the visibility timeout expires counts as a failed receive. Depending on the configuration of the queue, the message might be sent to the dead-letter queue.\n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n   "];
  max_number_of_messages: nullable_integer option
    [@ocaml.doc
      "The maximum number of messages to return. Amazon SQS never returns more messages than this value (however, fewer messages might be returned). Valid values: 1 to 10. Default: 1.\n"];
  message_attribute_names: message_attribute_name_list option
    [@ocaml.doc
      "The name of the message attribute, where {i N} is the index.\n\n {ul\n       {-  The name can contain alphanumeric characters and the underscore ([_]), hyphen ([-]), and period ([.]).\n           \n            }\n       {-  The name is case-sensitive and must be unique among all attribute names for the message.\n           \n            }\n       {-  The name must not start with AWS-reserved prefixes such as [AWS.] or [Amazon.] (or any casing variants).\n           \n            }\n       {-  The name must not start or end with a period ([.]), and it should not have periods in succession ([..]).\n           \n            }\n       {-  The name can be up to 256 characters long.\n           \n            }\n       }\n   When using [ReceiveMessage], you can send a list of attribute names to receive, or you can return all of the attributes by specifying [All] or [.*] in your request. You can also use all message attributes starting with a prefix, for example [bar.*].\n   "];
  message_system_attribute_names: message_system_attribute_list option
    [@ocaml.doc
      "A list of attributes that need to be returned along with each message. These attributes include:\n\n {ul\n       {-   [All] \226\128\147 Returns all values.\n           \n            }\n       {-   [ApproximateFirstReceiveTimestamp] \226\128\147 Returns the time the message was first received from the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n           \n            }\n       {-   [ApproximateReceiveCount] \226\128\147 Returns the number of times a message has been received across all queues but not deleted.\n           \n            }\n       {-   [AWSTraceHeader] \226\128\147 Returns the X-Ray trace header string. \n           \n            }\n       {-   [SenderId] \n           \n            {ul\n                  {-  For a user, returns the user ID, for example [ABCDEFGHI1JKLMNOPQ23R].\n                      \n                       }\n                  {-  For an IAM role, returns the IAM role ID, for example [ABCDE1F2GH3I4JK5LMNOP:i-a123b456].\n                      \n                       }\n                  \n        }\n         }\n       {-   [SentTimestamp] \226\128\147 Returns the time the message was sent to the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n           \n            }\n       {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n           \n            }\n       {-   [MessageDeduplicationId] \226\128\147 Returns the value provided by the producer that calls the \n           {[\n            [SendMessage] \n           ]}\n            action.\n           \n            }\n       {-   [MessageGroupId] \226\128\147 Returns the value provided by the producer that calls the \n           {[\n            [SendMessage] \n           ]}\n            action. Messages with the same [MessageGroupId] are returned in sequence.\n           \n            }\n       {-   [SequenceNumber] \226\128\147 Returns the value provided by Amazon SQS.\n           \n            }\n       }\n  "];
  attribute_names: attribute_name_list option
    [@ocaml.doc
      " This parameter has been discontinued but will be supported for backward compatibility. To provide attribute names, you are encouraged to use [MessageSystemAttributeNames]. \n \n   A list of attributes that need to be returned along with each message. These attributes include:\n   \n    {ul\n          {-   [All] \226\128\147 Returns all values.\n              \n               }\n          {-   [ApproximateFirstReceiveTimestamp] \226\128\147 Returns the time the message was first received from the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n              \n               }\n          {-   [ApproximateReceiveCount] \226\128\147 Returns the number of times a message has been received across all queues but not deleted.\n              \n               }\n          {-   [AWSTraceHeader] \226\128\147 Returns the X-Ray trace header string. \n              \n               }\n          {-   [SenderId] \n              \n               {ul\n                     {-  For a user, returns the user ID, for example [ABCDEFGHI1JKLMNOPQ23R].\n                         \n                          }\n                     {-  For an IAM role, returns the IAM role ID, for example [ABCDE1F2GH3I4JK5LMNOP:i-a123b456].\n                         \n                          }\n                     \n           }\n            }\n          {-   [SentTimestamp] \226\128\147 Returns the time the message was sent to the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n              \n               }\n          {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n              \n               }\n          {-   [MessageDeduplicationId] \226\128\147 Returns the value provided by the producer that calls the \n              {[\n               [SendMessage] \n              ]}\n               action.\n              \n               }\n          {-   [MessageGroupId] \226\128\147 Returns the value provided by the producer that calls the \n              {[\n               [SendMessage] \n              ]}\n               action. Messages with the same [MessageGroupId] are returned in sequence.\n              \n               }\n          {-   [SequenceNumber] \226\128\147 Returns the value provided by Amazon SQS.\n              \n               }\n          }\n  "];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which messages are received.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "Retrieves one or more messages from a specified queue.\n"]
type nonrec receipt_handle_is_invalid =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The specified receipt handle isn't valid.\n"]
type nonrec queue_url_list = string_ list[@@ocaml.doc ""]
type nonrec queue_name_exists =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "A queue with this name already exists. Amazon SQS returns this error only if the request includes attributes whose values differ from those of the existing queue.\n"]
type nonrec queue_deleted_recently =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "You must wait 60 seconds after deleting a queue before you can create another queue with the same name.\n"]
type nonrec purge_queue_request =
  {
  queue_url: string_
    [@ocaml.doc
      "The URL of the queue from which the [PurgeQueue] action deletes messages.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec purge_queue_in_progress =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "Indicates that the specified queue previously received a [PurgeQueue] request within the last 60 seconds (the time it can take to delete the messages in the queue).\n"]
type nonrec nullable_long = int[@@ocaml.doc ""]
type nonrec message_not_inflight = unit[@@ocaml.doc ""]
type nonrec long = int[@@ocaml.doc ""]
type nonrec list_queues_result =
  {
  next_token: token option
    [@ocaml.doc
      "Pagination token to include in the next request. Token value is [null] if there are no additional results to request, or if you did not set [MaxResults] in the request.\n"];
  queue_urls: queue_url_list option
    [@ocaml.doc
      "A list of queue URLs, up to 1,000 entries, or the value of [MaxResults] that you sent in the request.\n"]}
[@@ocaml.doc "A list of your queues.\n"]
type nonrec boxed_integer = int[@@ocaml.doc ""]
type nonrec list_queues_request =
  {
  max_results: boxed_integer option
    [@ocaml.doc
      "Maximum number of results to include in the response. Value range is 1 to 1000. You must set [MaxResults] to receive a value for [NextToken] in the response.\n"];
  next_token: token option
    [@ocaml.doc "Pagination token to request the next set of results.\n"];
  queue_name_prefix: string_ option
    [@ocaml.doc
      "A string to use for filtering the list results. Only those queues whose name begins with the specified string are returned.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec list_queue_tags_result =
  {
  tags: tag_map option
    [@ocaml.doc "The list of all tags added to the specified queue.\n"]}
[@@ocaml.doc ""]
type nonrec list_queue_tags_request =
  {
  queue_url: string_ [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc ""]
type nonrec list_message_move_tasks_result_entry =
  {
  started_timestamp: long option
    [@ocaml.doc "The timestamp of starting the message movement task.\n"];
  failure_reason: string_ option
    [@ocaml.doc
      "The task failure reason (only included if the task status is FAILED).\n"];
  approximate_number_of_messages_to_move: nullable_long option
    [@ocaml.doc
      "The number of messages to be moved from the source queue. This number is obtained at the time of starting the message movement task and is only included after the message movement task is selected to start.\n"];
  approximate_number_of_messages_moved: long option
    [@ocaml.doc
      "The approximate number of messages already moved to the destination queue.\n"];
  max_number_of_messages_per_second: nullable_integer option
    [@ocaml.doc
      "The number of messages to be moved per second (the message movement rate), if it has been specified in the [StartMessageMoveTask] request. If a [MaxNumberOfMessagesPerSecond] has not been specified in the [StartMessageMoveTask] request, this field value will be NULL.\n"];
  destination_arn: string_ option
    [@ocaml.doc
      "The ARN of the destination queue if it has been specified in the [StartMessageMoveTask] request. If a [DestinationArn] has not been specified in the [StartMessageMoveTask] request, this field value will be NULL.\n"];
  source_arn: string_ option
    [@ocaml.doc
      "The ARN of the queue that contains the messages to be moved to another queue.\n"];
  status: string_ option
    [@ocaml.doc
      "The status of the message movement task. Possible values are: RUNNING, COMPLETED, CANCELLING, CANCELLED, and FAILED.\n"];
  task_handle: string_ option
    [@ocaml.doc
      "An identifier associated with a message movement task. When this field is returned in the response of the [ListMessageMoveTasks] action, it is only populated for tasks that are in RUNNING status.\n"]}
[@@ocaml.doc "Contains the details of a message movement task. \n"]
type nonrec list_message_move_tasks_result_entry_list =
  list_message_move_tasks_result_entry list[@@ocaml.doc ""]
type nonrec list_message_move_tasks_result =
  {
  results: list_message_move_tasks_result_entry_list option
    [@ocaml.doc "A list of message movement tasks and their attributes.\n"]}
[@@ocaml.doc ""]
type nonrec list_message_move_tasks_request =
  {
  max_results: nullable_integer option
    [@ocaml.doc
      "The maximum number of results to include in the response. The default is 1, which provides the most recent message movement task. The upper limit is 10.\n"];
  source_arn: string_
    [@ocaml.doc
      "The ARN of the queue whose message movement tasks are to be listed.\n"]}
[@@ocaml.doc ""]
type nonrec list_dead_letter_source_queues_result =
  {
  next_token: token option
    [@ocaml.doc
      "Pagination token to include in the next request. Token value is [null] if there are no additional results to request, or if you did not set [MaxResults] in the request.\n"];
  queue_urls: queue_url_list
    [@ocaml.doc
      "A list of source queue URLs that have the [RedrivePolicy] queue attribute configured with a dead-letter queue.\n"]}
[@@ocaml.doc "A list of your dead letter source queues.\n"]
type nonrec list_dead_letter_source_queues_request =
  {
  max_results: boxed_integer option
    [@ocaml.doc
      "Maximum number of results to include in the response. Value range is 1 to 1000. You must set [MaxResults] to receive a value for [NextToken] in the response.\n"];
  next_token: token option
    [@ocaml.doc "Pagination token to request the next set of results.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of a dead-letter queue.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec invalid_id_format = unit[@@ocaml.doc ""]
type nonrec get_queue_url_result =
  {
  queue_url: string_ option [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc
                                                                    "For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-api-responses.html}Interpreting Responses} in the {i Amazon SQS Developer Guide}.\n"]
type nonrec get_queue_url_request =
  {
  queue_owner_aws_account_id: string_ option
    [@ocaml.doc
      "(Optional) The Amazon Web Services account ID of the account that created the queue. This is only required when you are attempting to access a queue owned by another Amazon Web Services account.\n"];
  queue_name: string_
    [@ocaml.doc
      "(Required) The name of the queue for which you want to fetch the URL. The name can be up to 80 characters long and can include alphanumeric characters, hyphens (-), and underscores (_). Queue URLs and names are case-sensitive.\n"]}
[@@ocaml.doc
  "Retrieves the URL of an existing queue based on its name and, optionally, the Amazon Web Services account ID. \n"]
type nonrec get_queue_attributes_result =
  {
  attributes: queue_attribute_map option
    [@ocaml.doc "A map of attributes to their respective values.\n"]}
[@@ocaml.doc "A list of returned queue attributes.\n"]
type nonrec get_queue_attributes_request =
  {
  attribute_names: attribute_name_list option
    [@ocaml.doc
      "A list of attributes for which to retrieve information.\n\n The [AttributeNames] parameter is optional, but if you don't specify values for this parameter, the request returns empty results.\n \n   In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.\n   \n     The following attributes are supported:\n     \n       The [ApproximateNumberOfMessagesDelayed], [ApproximateNumberOfMessagesNotVisible], and [ApproximateNumberOfMessages] metrics may not achieve consistency until at least 1 minute after the producers stop sending messages. This period is required for the queue metadata to reach eventual consistency. \n       \n         {ul\n               {-   [All] \226\128\147 Returns all values. \n                   \n                    }\n               {-   [ApproximateNumberOfMessages] \226\128\147 Returns the approximate number of messages available for retrieval from the queue.\n                   \n                    }\n               {-   [ApproximateNumberOfMessagesDelayed] \226\128\147 Returns the approximate number of messages in the queue that are delayed and not available for reading immediately. This can happen when the queue is configured as a delay queue or when a message has been sent with a delay parameter.\n                   \n                    }\n               {-   [ApproximateNumberOfMessagesNotVisible] \226\128\147 Returns the approximate number of messages that are in flight. Messages are considered to be {i in flight} if they have been sent to a client but have not yet been deleted or have not yet reached the end of their visibility window. \n                   \n                    }\n               {-   [CreatedTimestamp] \226\128\147 Returns the time when the queue was created in seconds ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time}).\n                   \n                    }\n               {-   [DelaySeconds] \226\128\147 Returns the default delay on the queue in seconds.\n                   \n                    }\n               {-   [LastModifiedTimestamp] \226\128\147 Returns the time when the queue was last changed in seconds ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time}).\n                   \n                    }\n               {-   [MaximumMessageSize] \226\128\147 Returns the limit of how many bytes a message can contain before Amazon SQS rejects it.\n                   \n                    }\n               {-   [MessageRetentionPeriod] \226\128\147 Returns the length of time, in seconds, for which Amazon SQS retains a message. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.\n                   \n                    }\n               {-   [Policy] \226\128\147 Returns the policy of the queue.\n                   \n                    }\n               {-   [QueueArn] \226\128\147 Returns the Amazon resource name (ARN) of the queue.\n                   \n                    }\n               {-   [ReceiveMessageWaitTimeSeconds] \226\128\147 Returns the length of time, in seconds, for which the [ReceiveMessage] action waits for a message to arrive. \n                   \n                    }\n               {-   [VisibilityTimeout] \226\128\147 Returns the visibility timeout for the queue. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}. \n                   \n                    }\n               }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:} \n   \n    {ul\n          {-   [RedrivePolicy] \226\128\147 The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [deadLetterTargetArn] \226\128\147 The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.\n                         \n                          }\n                     {-   [maxReceiveCount] \226\128\147 The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.\n                         \n                          }\n                     \n           }\n            }\n          {-   [RedriveAllowPolicy] \226\128\147 The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [redrivePermission] \226\128\147 The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:\n                         \n                          {ul\n                                {-   [allowAll] \226\128\147 (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [denyAll] \226\128\147 No source queues can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [byQueue] \226\128\147 Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-   [sourceQueueArns] \226\128\147 The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].\n                         \n                          }\n                     \n           }\n            }\n          }\n    The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.\n    \n      The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:\n      \n       {ul\n             {-   [KmsMasterKeyId] \226\128\147 Returns the ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. \n                 \n                  }\n             {-   [KmsDataKeyReusePeriodSeconds] \226\128\147 Returns the length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling KMS again. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}. \n                 \n                  }\n             {-   [SqsManagedSseEnabled] \226\128\147 Returns information about whether the queue is using SSE-SQS encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n                 \n                  }\n             }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:\n   \n    {ul\n          {-   [FifoQueue] \226\128\147 Returns information about whether the queue is FIFO. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-understanding-logic.html}FIFO queue logic} in the {i Amazon SQS Developer Guide}.\n              \n                To determine whether a queue is {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, you can check whether [QueueName] ends with the [.fifo] suffix.\n                \n                  }\n          {-   [ContentBasedDeduplication] \226\128\147 Returns whether content-based deduplication is enabled for the queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. \n              \n               }\n          }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:\n   \n    {ul\n          {-   [DeduplicationScope] \226\128\147 Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].\n              \n               }\n          {-   [FifoThroughputLimit] \226\128\147 Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].\n              \n               }\n          }\n   To enable high throughput for FIFO queues, do the following:\n   \n    {ul\n          {-  Set [DeduplicationScope] to [messageGroup].\n              \n               }\n          {-  Set [FifoThroughputLimit] to [perMessageGroupId].\n              \n               }\n          }\n   If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.\n   \n    For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.\n    "];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose attribute information is retrieved.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec delete_queue_request =
  {
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue to delete.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec delete_message_request =
  {
  receipt_handle: string_
    [@ocaml.doc
      "The receipt handle associated with the message to delete.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which messages are deleted.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec delete_message_batch_result_entry =
  {
  id: string_ [@ocaml.doc "Represents a successfully deleted message.\n"]}
[@@ocaml.doc
  "Encloses the [Id] of an entry in \n{[\n [DeleteMessageBatch].\n]}\n \n"]
type nonrec delete_message_batch_result_entry_list =
  delete_message_batch_result_entry list[@@ocaml.doc ""]
type nonrec delete_message_batch_result =
  {
  failed: batch_result_error_entry_list
    [@ocaml.doc "A list of \n{[\n [BatchResultErrorEntry] \n]}\n items.\n"];
  successful: delete_message_batch_result_entry_list
    [@ocaml.doc
      "A list of \n{[\n [DeleteMessageBatchResultEntry] \n]}\n items.\n"]}
[@@ocaml.doc
  "For each message in the batch, the response contains a \n{[\n [DeleteMessageBatchResultEntry] \n]}\n tag if the message is deleted or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message can't be deleted.\n"]
type nonrec delete_message_batch_request_entry =
  {
  receipt_handle: string_ [@ocaml.doc "A receipt handle.\n"];
  id: string_
    [@ocaml.doc
      "The identifier for this particular receipt handle. This is used to communicate the result.\n\n  The [Id]s of a batch request need to be unique within a request.\n  \n   This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).\n   \n    "]}
[@@ocaml.doc "Encloses a receipt handle and an identifier for it.\n"]
type nonrec delete_message_batch_request_entry_list =
  delete_message_batch_request_entry list[@@ocaml.doc ""]
type nonrec delete_message_batch_request =
  {
  entries: delete_message_batch_request_entry_list
    [@ocaml.doc
      "Lists the receipt handles for the messages to be deleted.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which messages are deleted.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec create_queue_result =
  {
  queue_url: string_ option
    [@ocaml.doc "The URL of the created Amazon SQS queue.\n"]}[@@ocaml.doc
                                                                "Returns the [QueueUrl] attribute of the created queue.\n"]
type nonrec create_queue_request =
  {
  tags: tag_map option
    [@ocaml.doc
      "Add cost allocation tags to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n When you use queue tags, keep the following guidelines in mind:\n \n  {ul\n        {-  Adding more than 50 tags to a queue isn't recommended.\n            \n             }\n        {-  Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings.\n            \n             }\n        {-  Tags are case-sensitive.\n            \n             }\n        {-  A new tag with a key identical to that of an existing tag overwrites the existing tag.\n            \n             }\n        }\n   For a full list of tag restrictions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues}Quotas related to queues} in the {i Amazon SQS Developer Guide}.\n   \n     To be able to tag a queue on creation, you must have the [sqs:CreateQueue] and [sqs:TagQueue] permissions.\n     \n      Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n      \n       "];
  attributes: queue_attribute_map option
    [@ocaml.doc
      "A map of attributes with their corresponding values.\n\n The following lists the names, descriptions, and values of the special request parameters that the [CreateQueue] action uses:\n \n  {ul\n        {-   [DelaySeconds] \226\128\147 The length of time, in seconds, for which the delivery of all messages in the queue is delayed. Valid values: An integer from 0 to 900 seconds (15 minutes). Default: 0. \n            \n             }\n        {-   [MaximumMessageSize] \226\128\147 The limit of how many bytes a message can contain before Amazon SQS rejects it. Valid values: An integer from 1,024 bytes (1 KiB) to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB). \n            \n             }\n        {-   [MessageRetentionPeriod] \226\128\147 The length of time, in seconds, for which Amazon SQS retains a message. Valid values: An integer from 60 seconds (1 minute) to 1,209,600 seconds (14 days). Default: 345,600 (4 days). When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.\n            \n             }\n        {-   [Policy] \226\128\147 The queue's policy. A valid Amazon Web Services policy. For more information about policy structure, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html}Overview of Amazon Web Services IAM Policies} in the {i IAM User Guide}. \n            \n             }\n        {-   [ReceiveMessageWaitTimeSeconds] \226\128\147 The length of time, in seconds, for which a \n            {[\n             [ReceiveMessage] \n            ]}\n             action waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0. \n            \n             }\n        {-   [VisibilityTimeout] \226\128\147 The visibility timeout for the queue, in seconds. Valid values: An integer from 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n            \n             }\n        }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:} \n   \n    {ul\n          {-   [RedrivePolicy] \226\128\147 The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [deadLetterTargetArn] \226\128\147 The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.\n                         \n                          }\n                     {-   [maxReceiveCount] \226\128\147 The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.\n                         \n                          }\n                     \n           }\n            }\n          {-   [RedriveAllowPolicy] \226\128\147 The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [redrivePermission] \226\128\147 The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:\n                         \n                          {ul\n                                {-   [allowAll] \226\128\147 (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [denyAll] \226\128\147 No source queues can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [byQueue] \226\128\147 Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-   [sourceQueueArns] \226\128\147 The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].\n                         \n                          }\n                     \n           }\n            }\n          }\n    The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.\n    \n      The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:\n      \n       {ul\n             {-   [KmsMasterKeyId] \226\128\147 The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. While the alias of the Amazon Web Services managed CMK for Amazon SQS is always [alias/aws/sqs], the alias of a custom CMK can, for example, be \n                 {[\n                 alias/{i MyAlias} \n                 ]}\n                 . For more examples, see {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} in the {i Key Management Service API Reference}. \n                 \n                  }\n             {-   [KmsDataKeyReusePeriodSeconds] \226\128\147 The length of time, in seconds, for which Amazon SQS can reuse a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys}data key} to encrypt or decrypt messages before calling KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). Default: 300 (5 minutes). A shorter time period provides better security but results in more calls to KMS which might incur charges after Free Tier. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?} \n                 \n                  }\n             {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n                 \n                  }\n             }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:\n   \n    {ul\n          {-   [FifoQueue] \226\128\147 Designates a queue as FIFO. Valid values are [true] and [false]. If you don't specify the [FifoQueue] attribute, Amazon SQS creates a standard queue. You can provide this attribute only during queue creation. You can't change it for an existing queue. When you set this attribute, you must also provide the [MessageGroupId] for your messages explicitly.\n              \n               For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-understanding-logic.html}FIFO queue logic} in the {i Amazon SQS Developer Guide}.\n               \n                }\n          {-   [ContentBasedDeduplication] \226\128\147 Enables content-based deduplication. Valid values are [true] and [false]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. Note the following: \n              \n               {ul\n                     {-  Every message must have a unique [MessageDeduplicationId].\n                         \n                          {ul\n                                {-  You may provide a [MessageDeduplicationId] explicitly.\n                                    \n                                     }\n                                {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                                    \n                                     }\n                                {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                                    \n                                     }\n                                {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n                         \n                          }\n                     {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n                         \n                          }\n                     \n           }\n            }\n          }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:\n   \n    {ul\n          {-   [DeduplicationScope] \226\128\147 Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].\n              \n               }\n          {-   [FifoThroughputLimit] \226\128\147 Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].\n              \n               }\n          }\n   To enable high throughput for FIFO queues, do the following:\n   \n    {ul\n          {-  Set [DeduplicationScope] to [messageGroup].\n              \n               }\n          {-  Set [FifoThroughputLimit] to [perMessageGroupId].\n              \n               }\n          }\n   If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.\n   \n    For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.\n    "];
  queue_name: string_
    [@ocaml.doc
      "The name of the new queue. The following limits apply to this name:\n\n {ul\n       {-  A queue name can have up to 80 characters.\n           \n            }\n       {-  Valid values: alphanumeric characters, hyphens ([-]), and underscores ([_]).\n           \n            }\n       {-  A FIFO queue name must end with the [.fifo] suffix.\n           \n            }\n       }\n   Queue URLs and names are case-sensitive.\n   "]}
[@@ocaml.doc "\n"]
type nonrec change_message_visibility_request =
  {
  visibility_timeout: nullable_integer
    [@ocaml.doc
      "The new value for the message's visibility timeout (in seconds). Values range: [0] to [43200]. Maximum: 12 hours.\n"];
  receipt_handle: string_
    [@ocaml.doc
      "The receipt handle associated with the message, whose visibility timeout is changed. This parameter is returned by the \n{[\n [ReceiveMessage] \n]}\n action.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose message's visibility is changed.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc ""]
type nonrec change_message_visibility_batch_result_entry =
  {
  id: string_
    [@ocaml.doc
      "Represents a message whose visibility timeout has been changed successfully.\n"]}
[@@ocaml.doc
  "Encloses the [Id] of an entry in \n{[\n [ChangeMessageVisibilityBatch].\n]}\n \n"]
type nonrec change_message_visibility_batch_result_entry_list =
  change_message_visibility_batch_result_entry list[@@ocaml.doc ""]
type nonrec change_message_visibility_batch_result =
  {
  failed: batch_result_error_entry_list
    [@ocaml.doc "A list of \n{[\n [BatchResultErrorEntry] \n]}\n items.\n"];
  successful: change_message_visibility_batch_result_entry_list
    [@ocaml.doc
      "A list of \n{[\n [ChangeMessageVisibilityBatchResultEntry] \n]}\n items.\n"]}
[@@ocaml.doc
  "For each message in the batch, the response contains a \n{[\n [ChangeMessageVisibilityBatchResultEntry] \n]}\n tag if the message succeeds or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message fails.\n"]
type nonrec change_message_visibility_batch_request_entry =
  {
  visibility_timeout: nullable_integer option
    [@ocaml.doc
      "The new value (in seconds) for the message's visibility timeout.\n"];
  receipt_handle: string_ [@ocaml.doc "A receipt handle.\n"];
  id: string_
    [@ocaml.doc
      "An identifier for this particular receipt handle used to communicate the result.\n\n  The [Id]s of a batch request need to be unique within a request.\n  \n   This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).\n   \n    "]}
[@@ocaml.doc
  "Encloses a receipt handle and an entry ID for each message in \n{[\n [ChangeMessageVisibilityBatch].\n]}\n \n"]
type nonrec change_message_visibility_batch_request_entry_list =
  change_message_visibility_batch_request_entry list[@@ocaml.doc ""]
type nonrec change_message_visibility_batch_request =
  {
  entries: change_message_visibility_batch_request_entry_list
    [@ocaml.doc
      "Lists the receipt handles of the messages for which the visibility timeout must be changed.\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose messages' visibility is changed.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec cancel_message_move_task_result =
  {
  approximate_number_of_messages_moved: long option
    [@ocaml.doc
      "The approximate number of messages already moved to the destination queue.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_message_move_task_request =
  {
  task_handle: string_
    [@ocaml.doc "An identifier associated with a message movement task.\n"]}
[@@ocaml.doc ""]
type nonrec aws_account_id_list = string_ list[@@ocaml.doc ""]
type nonrec action_name_list = string_ list[@@ocaml.doc ""]
type nonrec add_permission_request =
  {
  actions: action_name_list
    [@ocaml.doc
      "The action the client wants to allow for the specified principal. Valid values: the name of any action or [*].\n\n For more information about these actions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-overview-of-managing-access.html}Overview of Managing Access Permissions to Your Amazon Simple Queue Service Resource} in the {i Amazon SQS Developer Guide}.\n \n  Specifying [SendMessage], [DeleteMessage], or [ChangeMessageVisibility] for [ActionName.n] also grants permissions for the corresponding batch versions of those actions: [SendMessageBatch], [DeleteMessageBatch], and [ChangeMessageVisibilityBatch].\n  "];
  aws_account_ids: aws_account_id_list
    [@ocaml.doc
      "The Amazon Web Services account numbers of the {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principals} who are to receive permission. For information about locating the Amazon Web Services account identification, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html#sqs-api-request-authentication}Your Amazon Web Services Identifiers} in the {i Amazon SQS Developer Guide}.\n"];
  label: string_
    [@ocaml.doc
      "The unique identification of the permission you're setting (for example, [AliceSendMessage]). Maximum 80 characters. Allowed characters include alphanumeric characters, hyphens ([-]), and underscores ([_]).\n"];
  queue_url: string_
    [@ocaml.doc
      "The URL of the Amazon SQS queue to which permissions are added.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"](** {1:builders Builders} *)

val make_untag_queue_request :
  tag_keys:tag_key_list -> queue_url:string_ -> unit -> untag_queue_request
val make_tag_queue_request :
  tags:tag_map -> queue_url:string_ -> unit -> tag_queue_request
val make_start_message_move_task_request :
  ?max_number_of_messages_per_second:nullable_integer ->
    ?destination_arn:string_ ->
      source_arn:string_ -> unit -> start_message_move_task_request
val make_set_queue_attributes_request :
  attributes:queue_attribute_map ->
    queue_url:string_ -> unit -> set_queue_attributes_request
val make_message_attribute_value :
  ?binary_list_values:binary_list ->
    ?string_list_values:string_list ->
      ?binary_value:binary ->
        ?string_value:string_ ->
          data_type:string_ -> unit -> message_attribute_value
val make_message_system_attribute_value :
  ?binary_list_values:binary_list ->
    ?string_list_values:string_list ->
      ?binary_value:binary ->
        ?string_value:string_ ->
          data_type:string_ -> unit -> message_system_attribute_value
val make_send_message_request :
  ?message_group_id:string_ ->
    ?message_deduplication_id:string_ ->
      ?message_system_attributes:message_body_system_attribute_map ->
        ?message_attributes:message_body_attribute_map ->
          ?delay_seconds:nullable_integer ->
            message_body:string_ ->
              queue_url:string_ -> unit -> send_message_request
val make_send_message_batch_result_entry :
  ?sequence_number:string_ ->
    ?md5_of_message_system_attributes:string_ ->
      ?md5_of_message_attributes:string_ ->
        md5_of_message_body:string_ ->
          message_id:string_ ->
            id:string_ -> unit -> send_message_batch_result_entry
val make_batch_result_error_entry :
  ?message:string_ ->
    code:string_ ->
      sender_fault:boolean_ -> id:string_ -> unit -> batch_result_error_entry
val make_send_message_batch_request_entry :
  ?message_group_id:string_ ->
    ?message_deduplication_id:string_ ->
      ?message_system_attributes:message_body_system_attribute_map ->
        ?message_attributes:message_body_attribute_map ->
          ?delay_seconds:nullable_integer ->
            message_body:string_ ->
              id:string_ -> unit -> send_message_batch_request_entry
val make_send_message_batch_request :
  entries:send_message_batch_request_entry_list ->
    queue_url:string_ -> unit -> send_message_batch_request
val make_remove_permission_request :
  label:string_ -> queue_url:string_ -> unit -> remove_permission_request
val make_message :
  ?message_attributes:message_body_attribute_map ->
    ?md5_of_message_attributes:string_ ->
      ?attributes:message_system_attribute_map ->
        ?body:string_ ->
          ?md5_of_body:string_ ->
            ?receipt_handle:string_ -> ?message_id:string_ -> unit -> message
val make_receive_message_request :
  ?receive_request_attempt_id:string_ ->
    ?wait_time_seconds:nullable_integer ->
      ?visibility_timeout:nullable_integer ->
        ?max_number_of_messages:nullable_integer ->
          ?message_attribute_names:message_attribute_name_list ->
            ?message_system_attribute_names:message_system_attribute_list ->
              ?attribute_names:attribute_name_list ->
                queue_url:string_ -> unit -> receive_message_request
val make_purge_queue_request :
  queue_url:string_ -> unit -> purge_queue_request
val make_list_queues_request :
  ?max_results:boxed_integer ->
    ?next_token:token ->
      ?queue_name_prefix:string_ -> unit -> list_queues_request
val make_list_queue_tags_request :
  queue_url:string_ -> unit -> list_queue_tags_request
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
                    unit -> list_message_move_tasks_result_entry
val make_list_message_move_tasks_request :
  ?max_results:nullable_integer ->
    source_arn:string_ -> unit -> list_message_move_tasks_request
val make_list_dead_letter_source_queues_request :
  ?max_results:boxed_integer ->
    ?next_token:token ->
      queue_url:string_ -> unit -> list_dead_letter_source_queues_request
val make_get_queue_url_request :
  ?queue_owner_aws_account_id:string_ ->
    queue_name:string_ -> unit -> get_queue_url_request
val make_get_queue_attributes_request :
  ?attribute_names:attribute_name_list ->
    queue_url:string_ -> unit -> get_queue_attributes_request
val make_delete_queue_request :
  queue_url:string_ -> unit -> delete_queue_request
val make_delete_message_request :
  receipt_handle:string_ ->
    queue_url:string_ -> unit -> delete_message_request
val make_delete_message_batch_result_entry :
  id:string_ -> unit -> delete_message_batch_result_entry
val make_delete_message_batch_request_entry :
  receipt_handle:string_ ->
    id:string_ -> unit -> delete_message_batch_request_entry
val make_delete_message_batch_request :
  entries:delete_message_batch_request_entry_list ->
    queue_url:string_ -> unit -> delete_message_batch_request
val make_create_queue_request :
  ?tags:tag_map ->
    ?attributes:queue_attribute_map ->
      queue_name:string_ -> unit -> create_queue_request
val make_change_message_visibility_request :
  visibility_timeout:nullable_integer ->
    receipt_handle:string_ ->
      queue_url:string_ -> unit -> change_message_visibility_request
val make_change_message_visibility_batch_result_entry :
  id:string_ -> unit -> change_message_visibility_batch_result_entry
val make_change_message_visibility_batch_request_entry :
  ?visibility_timeout:nullable_integer ->
    receipt_handle:string_ ->
      id:string_ -> unit -> change_message_visibility_batch_request_entry
val make_change_message_visibility_batch_request :
  entries:change_message_visibility_batch_request_entry_list ->
    queue_url:string_ -> unit -> change_message_visibility_batch_request
val make_cancel_message_move_task_request :
  task_handle:string_ -> unit -> cancel_message_move_task_request
val make_add_permission_request :
  actions:action_name_list ->
    aws_account_ids:aws_account_id_list ->
      label:string_ -> queue_url:string_ -> unit -> add_permission_request(** {1:operations Operations} *)

module AddPermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      add_permission_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security  | `OverLimit of over_limit 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Adds a permission to a queue for a specific {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principal}. This allows sharing access to the queue.\n\n When you create a queue, you have full control access rights for the queue. Only you, the owner of the queue, can grant or deny permissions to the queue. For more information about these permissions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow Developers to Write Messages to a Shared Queue} in the {i Amazon SQS Developer Guide}.\n \n   {ul\n         {-   [AddPermission] generates a policy for you. You can use \n             {[\n              [SetQueueAttributes] \n             ]}\n              to upload your policy. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html}Using Custom Policies with the Amazon SQS Access Policy Language} in the {i Amazon SQS Developer Guide}.\n             \n              }\n         {-  An Amazon SQS policy can have a maximum of seven actions per statement.\n             \n              }\n         {-  To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.\n             \n              }\n         {-  Amazon SQS [AddPermission] does not support adding a non-account principal.\n             \n              }\n         }\n     Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n     \n      "]
module CancelMessageMoveTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_message_move_task_request ->
        (cancel_message_move_task_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `RequestThrottled of request_throttled 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Cancels a specified message movement task. A message movement can only be cancelled when the current status is RUNNING. Cancelling a message movement task does not revert the messages that have already been moved. It can only stop the messages that have not been moved yet.\n\n  {ul\n        {-  This action is currently limited to supporting message redrive from {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue. \n            \n             }\n        {-  Only one active message movement task is supported per queue at any given time.\n            \n             }\n        }\n   "]
module ChangeMessageVisibility :
sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `MessageNotInflight of message_not_inflight 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `ReceiptHandleIsInvalid of receipt_handle_is_invalid 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Changes the visibility timeout of a specified message in a queue to a new value. The default visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n\n For example, if the default timeout for a queue is 60 seconds, 15 seconds have elapsed since you received the message, and you send a ChangeMessageVisibility call with [VisibilityTimeout] set to 10 seconds, the 10 seconds begin to count from the time that you make the [ChangeMessageVisibility] call. Thus, any attempt to change the visibility timeout or to delete that message 10 seconds after you initially change the visibility timeout (a total of 25 seconds) might result in an error.\n \n  An Amazon SQS message has three basic states:\n  \n   {ol\n         {-  Sent to a queue by a producer.\n             \n              }\n         {-  Received from the queue by a consumer.\n             \n              }\n         {-  Deleted from the queue.\n             \n              }\n         }\n   A message is considered to be {i stored} after it is sent to a queue by a producer, but not yet received from the queue by a consumer (that is, between states 1 and 2). There is no limit to the number of stored messages. A message is considered to be {i in flight} after it is received from a queue by a consumer, but not yet deleted from the queue (that is, between states 2 and 3). There is a limit to the number of in flight messages.\n   \n    Limits that apply to in flight messages are unrelated to the {i unlimited} number of stored messages.\n    \n     For most standard queues (depending on queue traffic and message backlog), there can be a maximum of approximately 120,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns the [OverLimit] error message. To avoid reaching the limit, you should delete messages from the queue after they're processed. You can also increase the number of queues you use to process your messages. To request a limit increase, {{:https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs}file a support request}.\n     \n      For FIFO queues, there can be a maximum of 120,000 in flight messages (received from a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS returns no error messages.\n      \n        If you attempt to set the [VisibilityTimeout] to a value greater than the maximum time left, Amazon SQS returns an error. Amazon SQS doesn't automatically recalculate and increase the timeout to the maximum remaining time.\n        \n         Unlike with a queue, when you change the visibility timeout for a specific message the timeout value is applied immediately but isn't saved in memory for that message. If you don't delete a message after it is received, the visibility timeout for the message reverts to the original timeout value (not to the value you set using the [ChangeMessageVisibility] action) the next time the message is received.\n         \n          "]
module ChangeMessageVisibilityBatch :
sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_batch_request ->
        (change_message_visibility_batch_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct 
          | `EmptyBatchRequest of empty_batch_request 
          | `InvalidAddress of invalid_address 
          | `InvalidBatchEntryId of invalid_batch_entry_id 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `TooManyEntriesInBatchRequest of
              too_many_entries_in_batch_request 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Changes the visibility timeout of multiple messages. This is a batch version of \n{[\n [ChangeMessageVisibility].\n]}\n The result of the action on each message is reported individually in the response. You can send up to 10 \n{[\n [ChangeMessageVisibility] \n]}\n requests with each [ChangeMessageVisibilityBatch] action.\n\n  Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].\n  \n   "]
module CreateQueue :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_queue_request ->
        (create_queue_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidAttributeName of invalid_attribute_name 
          | `InvalidAttributeValue of invalid_attribute_value 
          | `InvalidSecurity of invalid_security 
          | `QueueDeletedRecently of queue_deleted_recently 
          | `QueueNameExists of queue_name_exists 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep the following in mind:\n\n {ul\n       {-  If you don't specify the [FifoQueue] attribute, Amazon SQS creates a standard queue.\n           \n             You can't change the queue type after you create it and you can't convert an existing standard queue into a FIFO queue. You must either create a new FIFO queue for your application or delete your existing standard queue and recreate it as a FIFO queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving}Moving From a Standard Queue to a FIFO Queue} in the {i Amazon SQS Developer Guide}. \n             \n               }\n       {-  If you don't provide a value for an attribute, the queue is created with the default value for the attribute.\n           \n            }\n       {-  If you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.\n           \n            }\n       }\n   To successfully create a new queue, you must provide a queue name that adheres to the {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html}limits related to queues} and is unique within the scope of your queues.\n   \n     After you create a queue, you must wait at least one second after the queue is created to be able to use the queue.\n     \n       To retrieve the URL of a queue, use the {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_GetQueueUrl.html} [GetQueueUrl] } action. This action only requires the {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html#API_CreateQueue_RequestSyntax} [QueueName] } parameter.\n       \n        When creating queues, keep the following points in mind:\n        \n         {ul\n               {-  If you specify the name of an existing queue and provide the exact same names and values for all its attributes, the {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html} [CreateQueue] } action will return the URL of the existing queue instead of creating a new one.\n                   \n                    }\n               {-  If you attempt to create a queue with a name that already exists but with different attribute names or values, the [CreateQueue] action will return an error. This ensures that existing queues are not inadvertently altered.\n                   \n                    }\n               }\n    Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n    \n     "]
module DeleteMessage :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidIdFormat of invalid_id_format 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `ReceiptHandleIsInvalid of receipt_handle_is_invalid 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Deletes the specified message from the specified queue. To select the message to delete, use the [ReceiptHandle] of the message ({i not} the [MessageId] which you receive when you send the message). Amazon SQS can delete a message from a queue even if a visibility timeout setting causes the message to be locked by another consumer. Amazon SQS automatically deletes messages left in a queue longer than the retention period configured for the queue. \n\n  Each time you receive a message, meaning when a consumer retrieves a message from the queue, it comes with a unique [ReceiptHandle]. If you receive the same message more than once, you will get a different [ReceiptHandle] each time. When you want to delete a message using the [DeleteMessage] action, you must use the [ReceiptHandle] from the most recent time you received the message. If you use an old [ReceiptHandle], the request will succeed, but the message might not be deleted. \n  \n   For standard queues, it is possible to receive a message even after you delete it. This might happen on rare occasions if one of the servers which stores a copy of the message is unavailable when you send the request to delete the message. The copy remains on the server and might be returned to you during a subsequent receive request. You should ensure that your application is idempotent, so that receiving a message more than once does not cause issues.\n   \n    "]
module DeleteMessageBatch :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_batch_request ->
        (delete_message_batch_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct 
          | `EmptyBatchRequest of empty_batch_request 
          | `InvalidAddress of invalid_address 
          | `InvalidBatchEntryId of invalid_batch_entry_id 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `TooManyEntriesInBatchRequest of
              too_many_entries_in_batch_request 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Deletes up to ten messages from the specified queue. This is a batch version of \n{[\n [DeleteMessage].\n]}\n The result of the action on each message is reported individually in the response.\n\n  Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].\n  \n   "]
module DeleteQueue :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_queue_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Deletes the queue specified by the [QueueUrl], regardless of the queue's contents.\n\n  Be careful with the [DeleteQueue] action: When you delete a queue, any messages in the queue are no longer available. \n  \n    When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving that queue during the 60 seconds might succeed. For example, a \n    {[\n     [SendMessage] \n    ]}\n     request might succeed, but after 60 seconds the queue and the message you sent no longer exist.\n    \n     When you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.\n     \n       Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n       \n        The delete operation uses the HTTP [GET] verb.\n        \n         "]
module GetQueueAttributes :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_attributes_request ->
        (get_queue_attributes_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidAttributeName of invalid_attribute_name 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Gets attributes for the specified queue.\n\n  To determine whether a queue is {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, you can check whether [QueueName] ends with the [.fifo] suffix.\n  \n   "]
module GetQueueUrl :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_url_request ->
        (get_queue_url_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "The [GetQueueUrl] API returns the URL of an existing Amazon SQS queue. This is useful when you know the queue's name but need to retrieve its URL for further operations.\n\n To access a queue owned by another Amazon Web Services account, use the [QueueOwnerAWSAccountId] parameter to specify the account ID of the queue's owner. Note that the queue owner must grant you the necessary permissions to access the queue. For more information about accessing shared queues, see the \n {[\n  [AddPermission] \n ]}\n  API or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue}Allow developers to write messages to a shared queue} in the {i Amazon SQS Developer Guide}. \n "]
module ListDeadLetterSourceQueues :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_dead_letter_source_queues_request ->
        (list_dead_letter_source_queues_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Returns a list of your queues that have the [RedrivePolicy] queue attribute configured with a dead-letter queue.\n\n  The [ListDeadLetterSourceQueues] methods supports pagination. Set parameter [MaxResults] in the request to specify the maximum number of results to be returned in the response. If you do not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and there are additional results to display, the response includes a value for [NextToken]. Use [NextToken] as a parameter in your next request to [ListDeadLetterSourceQueues] to receive the next page of results. \n \n  For more information about using dead-letter queues, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}Using Amazon SQS Dead-Letter Queues} in the {i Amazon SQS Developer Guide}.\n  "]
module ListMessageMoveTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_message_move_tasks_request ->
        (list_message_move_tasks_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `RequestThrottled of request_throttled 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Gets the most recent message movement tasks (up to 10) under a specific source queue.\n\n  {ul\n        {-  This action is currently limited to supporting message redrive from {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} only. In this context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue. \n            \n             }\n        {-  Only one active message movement task is supported per queue at any given time.\n            \n             }\n        }\n   "]
module ListQueueTags :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_queue_tags_request ->
        (list_queue_tags_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "List all cost allocation tags added to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n  \n   "]
module ListQueues :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_queues_request ->
        (list_queues_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Returns a list of your queues in the current region. The response includes a maximum of 1,000 results. If you specify a value for the optional [QueueNamePrefix] parameter, only queues with a name that begins with the specified value are returned.\n\n  The [listQueues] methods supports pagination. Set parameter [MaxResults] in the request to specify the maximum number of results to be returned in the response. If you do not set [MaxResults], the response includes a maximum of 1,000 results. If you set [MaxResults] and there are additional results to display, the response includes a value for [NextToken]. Use [NextToken] as a parameter in your next request to [listQueues] to receive the next page of results. \n \n   Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n   \n    "]
module PurgeQueue :
sig
  val request :
    Smaws_Lib.Context.t ->
      purge_queue_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `PurgeQueueInProgress of purge_queue_in_progress 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Deletes available messages in a queue (including in-flight messages) specified by the [QueueURL] parameter.\n\n  When you use the [PurgeQueue] action, you can't retrieve any messages deleted from a queue.\n  \n   The message deletion process takes up to 60 seconds. We recommend waiting for 60 seconds regardless of your queue's size. \n   \n     Messages sent to the queue {i before} you call [PurgeQueue] might be received but are deleted within the next minute.\n     \n      Messages sent to the queue {i after} you call [PurgeQueue] might be deleted while the queue is being purged.\n      "]
module ReceiveMessage :
sig
  val request :
    Smaws_Lib.Context.t ->
      receive_message_request ->
        (receive_message_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `KmsAccessDenied of kms_access_denied 
          | `KmsDisabled of kms_disabled 
          | `KmsInvalidKeyUsage of kms_invalid_key_usage 
          | `KmsInvalidState of kms_invalid_state 
          | `KmsNotFound of kms_not_found 
          | `KmsOptInRequired of kms_opt_in_required 
          | `KmsThrottled of kms_throttled  | `OverLimit of over_limit 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Retrieves one or more messages (up to 10), from the specified queue. Using the [WaitTimeSeconds] parameter enables long-poll support. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html}Amazon SQS Long Polling} in the {i Amazon SQS Developer Guide}. \n\n Short poll is the default behavior where a weighted random set of machines is sampled on a [ReceiveMessage] call. Therefore, only the messages on the sampled machines are returned. If the number of messages in the queue is small (fewer than 1,000), you most likely get fewer messages than you requested per [ReceiveMessage] call. If the number of messages in the queue is extremely small, you might not receive any messages in a particular [ReceiveMessage] response. If this happens, repeat the request.\n \n  For each message returned, the response includes the following:\n  \n   {ul\n         {-  The message body.\n             \n              }\n         {-  An MD5 digest of the message body. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n             \n              }\n         {-  The [MessageId] you received when you sent the message to the queue.\n             \n              }\n         {-  The receipt handle.\n             \n              }\n         {-  The message attributes.\n             \n              }\n         {-  An MD5 digest of the message attributes.\n             \n              }\n         }\n   The receipt handle is the identifier you must provide when deleting the message. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue and Message Identifiers} in the {i Amazon SQS Developer Guide}.\n   \n    You can provide the [VisibilityTimeout] parameter in your request. The parameter is applied to the messages that Amazon SQS returns in the response. If you don't include the parameter, the overall visibility timeout for the queue is used for the returned messages. The default visibility timeout for a queue is 30 seconds. \n    \n      In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.\n      \n       "]
module RemovePermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Revokes any permissions in the queue policy that matches the specified [Label] parameter.\n\n  {ul\n        {-  Only the owner of a queue can remove permissions from it.\n            \n             }\n        {-  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n            \n             }\n        {-  To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.\n            \n             }\n        }\n   "]
module SendMessage :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_request ->
        (send_message_result,
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
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Delivers a message to the specified queue.\n\n  A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.\n  \n    [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] \n   \n    Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.\n    \n     "]
module SendMessageBatch :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_batch_request ->
        (send_message_batch_result,
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
          | `TooManyEntriesInBatchRequest of
              too_many_entries_in_batch_request 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "You can use [SendMessageBatch] to send up to 10 messages to the specified queue by assigning either identical or different values to each message (or by not assigning values at all). This is a batch version of \n{[\n [SendMessage].\n]}\n For a FIFO queue, multiple messages within a single batch are enqueued in the order they are sent.\n\n The result of sending each message is reported individually in the response. Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of [200].\n \n  The maximum allowed individual message size and the maximum total payload size (the sum of the individual lengths of all of the batched messages) are both 256 KiB (262,144 bytes).\n  \n    A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.\n    \n      [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] \n     \n      Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.\n      \n        If you don't specify the [DelaySeconds] parameter for an entry, Amazon SQS uses the default value for the queue.\n        "]
module SetQueueAttributes :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_queue_attributes_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidAttributeName of invalid_attribute_name 
          | `InvalidAttributeValue of invalid_attribute_value 
          | `InvalidSecurity of invalid_security  | `OverLimit of over_limit 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Sets the value of one or more queue attributes, like a policy. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.\n\n  {ul\n        {-  In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.\n            \n             }\n        {-  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n            \n             }\n        {-  To remove the ability to change queue permissions, you must deny permission to the [AddPermission], [RemovePermission], and [SetQueueAttributes] actions in your IAM policy.\n            \n             }\n        }\n   "]
module StartMessageMoveTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_message_move_task_request ->
        (start_message_move_task_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `RequestThrottled of request_throttled 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Starts an asynchronous task to move messages from a specified source queue to a specified destination queue.\n\n  {ul\n        {-  This action is currently limited to supporting message redrive from queues that are configured as {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues (DLQs)} of other Amazon SQS queues only. Non-SQS queue sources of dead-letter queues, such as Lambda or Amazon SNS topics, are currently not supported.\n            \n             }\n        {-  In dead-letter queues redrive context, the [StartMessageMoveTask] the source queue is the DLQ, while the destination queue can be the original source queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.\n            \n             }\n        {-  Only one active message movement task is supported per queue at any given time.\n            \n             }\n        }\n   "]
module TagQueue :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_queue_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Add cost allocation tags to the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n When you use queue tags, keep the following guidelines in mind:\n \n  {ul\n        {-  Adding more than 50 tags to a queue isn't recommended.\n            \n             }\n        {-  Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings.\n            \n             }\n        {-  Tags are case-sensitive.\n            \n             }\n        {-  A new tag with a key identical to that of an existing tag overwrites the existing tag.\n            \n             }\n        }\n   For a full list of tag restrictions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues}Quotas related to queues} in the {i Amazon SQS Developer Guide}.\n   \n     Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n     \n      "]
module UntagQueue :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_queue_request ->
        (Smaws_Lib.Smithy_api.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddress of invalid_address 
          | `InvalidSecurity of invalid_security 
          | `QueueDoesNotExist of queue_does_not_exist 
          | `RequestThrottled of request_throttled 
          | `UnsupportedOperation of unsupported_operation ]) result
end[@@ocaml.doc
     "Remove cost allocation tags from the specified Amazon SQS queue. For an overview, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html}Tagging Your Amazon SQS Queues} in the {i Amazon SQS Developer Guide}.\n\n  Cross-account permissions don't apply to this action. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name}Grant cross-account permissions to a role and a username} in the {i Amazon SQS Developer Guide}.\n  \n   "]