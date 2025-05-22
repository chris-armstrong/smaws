open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "sqs";
      endpointPrefix = "sqs";
      version = "2012-11-05";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec untag_queue_request =
  {
  tag_keys: string list
    [@ocaml.doc "The list of tags to be removed from the specified queue.\n"];
  queue_url: string [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc ""]
type nonrec unsupported_operation = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Error code 400. Unsupported operation.\n"]
type nonrec request_throttled = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was denied due to request throttling.\n\n {ul\n       {-  The rate of requests per second exceeds the Amazon Web Services KMS request quota for an account and Region. \n           \n            }\n       {-  A burst or sustained high rate of requests to change the state of the same KMS key. This condition is often known as a \"hot key.\"\n           \n            }\n       {-  Requests for operations on KMS keys in a Amazon Web Services CloudHSM key store might be throttled at a lower-than-expected rate when the Amazon Web Services CloudHSM cluster associated with the Amazon Web Services CloudHSM key store is processing numerous commands, including those unrelated to the Amazon Web Services CloudHSM key store.\n           \n            }\n       }\n  "]
type nonrec queue_does_not_exist = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified queue doesn't exist.\n"]
type nonrec invalid_security = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "When the request to a queue is not HTTPS and SigV4.\n"]
type nonrec invalid_address = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The [accountId] is invalid.\n"]
type nonrec too_many_entries_in_batch_request =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The batch request contains more entries than permissible.\n"]
type nonrec tag_map = (string * string) list[@@ocaml.doc ""]
type nonrec tag_queue_request =
  {
  tags: tag_map
    [@ocaml.doc "The list of tags to be added to the specified queue.\n"];
  queue_url: string [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc ""]
type nonrec start_message_move_task_result =
  {
  task_handle: string option
    [@ocaml.doc
      "An identifier associated with a message movement task. You can use this identifier to cancel a specified message movement task using the [CancelMessageMoveTask] action.\n"]}
[@@ocaml.doc ""]
type nonrec start_message_move_task_request =
  {
  max_number_of_messages_per_second: int option
    [@ocaml.doc
      "The number of messages to be moved per second (the message movement rate). You can use this field to define a fixed message movement rate. The maximum value for messages per second is 500. If this field is left blank, the system will optimize the rate based on the queue message backlog size, which may vary throughout the duration of the message movement task.\n"];
  destination_arn: string option
    [@ocaml.doc
      "The ARN of the queue that receives the moved messages. You can use this field to specify the destination queue where you would like to redrive messages. If this field is left blank, the messages will be redriven back to their respective original source queues.\n"];
  source_arn: string
    [@ocaml.doc
      "The ARN of the queue that contains the messages to be moved to another queue. Currently, only ARNs of dead-letter queues (DLQs) whose sources are other Amazon SQS queues are accepted. DLQs whose sources are non-SQS queues, such as Lambda or Amazon SNS topics, are not currently supported.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
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
type nonrec queue_attribute_map = (queue_attribute_name * string) list
[@@ocaml.doc ""]
type nonrec set_queue_attributes_request =
  {
  attributes: queue_attribute_map
    [@ocaml.doc
      "A map of attributes to set.\n\n The following lists the names, descriptions, and values of the special request parameters that the [SetQueueAttributes] action uses:\n \n  {ul\n        {-   [DelaySeconds] \226\128\147 The length of time, in seconds, for which the delivery of all messages in the queue is delayed. Valid values: An integer from 0 to 900 (15 minutes). Default: 0. \n            \n             }\n        {-   [MaximumMessageSize] \226\128\147 The limit of how many bytes a message can contain before Amazon SQS rejects it. Valid values: An integer from 1,024 bytes (1 KiB) up to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB). \n            \n             }\n        {-   [MessageRetentionPeriod] \226\128\147 The length of time, in seconds, for which Amazon SQS retains a message. Valid values: An integer representing seconds, from 60 (1 minute) to 1,209,600 (14 days). Default: 345,600 (4 days). When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.\n            \n             }\n        {-   [Policy] \226\128\147 The queue's policy. A valid Amazon Web Services policy. For more information about policy structure, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html}Overview of Amazon Web Services IAM Policies} in the {i Identity and Access Management User Guide}. \n            \n             }\n        {-   [ReceiveMessageWaitTimeSeconds] \226\128\147 The length of time, in seconds, for which a \n            {[\n             [ReceiveMessage] \n            ]}\n             action waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0. \n            \n             }\n        {-   [VisibilityTimeout] \226\128\147 The visibility timeout for the queue, in seconds. Valid values: An integer from 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n            \n             }\n        }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:} \n   \n    {ul\n          {-   [RedrivePolicy] \226\128\147 The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [deadLetterTargetArn] \226\128\147 The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.\n                         \n                          }\n                     {-   [maxReceiveCount] \226\128\147 The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.\n                         \n                          }\n                     \n           }\n            }\n          {-   [RedriveAllowPolicy] \226\128\147 The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [redrivePermission] \226\128\147 The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:\n                         \n                          {ul\n                                {-   [allowAll] \226\128\147 (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [denyAll] \226\128\147 No source queues can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [byQueue] \226\128\147 Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-   [sourceQueueArns] \226\128\147 The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].\n                         \n                          }\n                     \n           }\n            }\n          }\n    The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.\n    \n      The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:\n      \n       {ul\n             {-   [KmsMasterKeyId] \226\128\147 The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. While the alias of the AWS-managed CMK for Amazon SQS is always [alias/aws/sqs], the alias of a custom CMK can, for example, be \n                 {[\n                 alias/{i MyAlias} \n                 ]}\n                 . For more examples, see {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} in the {i Key Management Service API Reference}. \n                 \n                  }\n             {-   [KmsDataKeyReusePeriodSeconds] \226\128\147 The length of time, in seconds, for which Amazon SQS can reuse a {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys}data key} to encrypt or decrypt messages before calling KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). Default: 300 (5 minutes). A shorter time period provides better security but results in more calls to KMS which might incur charges after Free Tier. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}. \n                 \n                  }\n             {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n                 \n                  }\n             }\n   The following attribute applies only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:\n   \n    {ul\n          {-   [ContentBasedDeduplication] \226\128\147 Enables content-based deduplication. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. Note the following: \n              \n               {ul\n                     {-  Every message must have a unique [MessageDeduplicationId].\n                         \n                          {ul\n                                {-  You may provide a [MessageDeduplicationId] explicitly.\n                                    \n                                     }\n                                {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                                    \n                                     }\n                                {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                                    \n                                     }\n                                {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n                         \n                          }\n                     {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n                         \n                          }\n                     \n           }\n            }\n          }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:\n   \n    {ul\n          {-   [DeduplicationScope] \226\128\147 Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].\n              \n               }\n          {-   [FifoThroughputLimit] \226\128\147 Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].\n              \n               }\n          }\n   To enable high throughput for FIFO queues, do the following:\n   \n    {ul\n          {-  Set [DeduplicationScope] to [messageGroup].\n              \n               }\n          {-  Set [FifoThroughputLimit] to [perMessageGroupId].\n              \n               }\n          }\n   If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.\n   \n    For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.\n    "];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose attributes are set.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec over_limit = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified action violates a limit. For example, [ReceiveMessage] returns this error if the maximum number of in flight messages is reached and [AddPermission] returns this error if the maximum number of permissions for the queue is reached.\n"]
type nonrec invalid_attribute_value =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A queue attribute value is invalid.\n"]
type nonrec invalid_attribute_name = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified attribute doesn't exist.\n"]
type nonrec send_message_result =
  {
  sequence_number: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The large, non-consecutive number that Amazon SQS assigns to each message.\n \n  The length of [SequenceNumber] is 128 bits. [SequenceNumber] continues to increase for a particular [MessageGroupId].\n  "];
  message_id: string option
    [@ocaml.doc
      "An attribute containing the [MessageId] of the message sent to the queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html}Queue and Message Identifiers} in the {i Amazon SQS Developer Guide}. \n"];
  md5_of_message_system_attributes: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest.\n"];
  md5_of_message_attributes: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  md5_of_message_body: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"]}
[@@ocaml.doc "The [MD5OfMessageBody] and [MessageId] elements.\n"]
type nonrec message_attribute_value =
  {
  data_type: string
    [@ocaml.doc
      "Amazon SQS supports the following logical data types: [String], [Number], and [Binary]. For the [Number] data type, you must use [StringValue].\n\n You can also append custom labels. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes} in the {i Amazon SQS Developer Guide}.\n "];
  binary_list_values: bytes list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  string_list_values: string list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  binary_value: bytes option
    [@ocaml.doc
      "Binary type attributes can store any binary data, such as compressed data, encrypted data, or images.\n"];
  string_value: string option
    [@ocaml.doc
      "Strings are Unicode with UTF-8 binary encoding. For a list of code values, see {{:http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}ASCII Printable Characters}.\n"]}
[@@ocaml.doc
  "The user-specified message attribute value. For string data types, the [Value] attribute has the same restrictions on the content as the message body. For more information, see \n{[\n [SendMessage].\n]}\n \n\n  [Name], [type], [value] and the message body must not be empty or null. All parts of the message attribute, including [Name], [Type], and [Value], are part of the message size restriction (256 KiB or 262,144 bytes).\n "]
type nonrec message_body_attribute_map =
  (string * message_attribute_value) list[@@ocaml.doc ""]
type nonrec message_system_attribute_value =
  {
  data_type: string
    [@ocaml.doc
      "Amazon SQS supports the following logical data types: [String], [Number], and [Binary]. For the [Number] data type, you must use [StringValue].\n\n You can also append custom labels. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS Message Attributes} in the {i Amazon SQS Developer Guide}.\n "];
  binary_list_values: bytes list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  string_list_values: string list option
    [@ocaml.doc "Not implemented. Reserved for future use.\n"];
  binary_value: bytes option
    [@ocaml.doc
      "Binary type attributes can store any binary data, such as compressed data, encrypted data, or images.\n"];
  string_value: string option
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
  message_group_id: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use [MessageGroupId] values (for example, session data for multiple users). In this scenario, multiple consumers can process the queue, but the session data of each user is processed in a FIFO fashion.\n \n  {ul\n        {-  You must associate a non-empty [MessageGroupId] with a message. If you don't provide a [MessageGroupId], the action fails.\n            \n             }\n        {-   [ReceiveMessage] might return messages with multiple [MessageGroupId] values. For each [MessageGroupId], the messages are sorted by time sent. The caller can't specify a [MessageGroupId].\n            \n             }\n        }\n   The maximum length of [MessageGroupId] is 128 characters. Valid values: alphanumeric characters and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n   \n    For best practices of using [MessageGroupId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html}Using the MessageGroupId Property} in the {i Amazon SQS Developer Guide}.\n    \n       [MessageGroupId] is required for FIFO queues. You can't use it for Standard queues.\n      \n       "];
  message_deduplication_id: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The token used for deduplication of sent messages. If a message with a particular [MessageDeduplicationId] is sent successfully, any messages sent with the same [MessageDeduplicationId] are accepted successfully but aren't delivered during the 5-minute deduplication interval. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html} Exactly-once processing} in the {i Amazon SQS Developer Guide}.\n \n  {ul\n        {-  Every message must have a unique [MessageDeduplicationId],\n            \n             {ul\n                   {-  You may provide a [MessageDeduplicationId] explicitly.\n                       \n                        }\n                   {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                       \n                        }\n                   {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                       \n                        }\n                   {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                       \n                        }\n                   \n         }\n          }\n        {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n            \n             }\n        {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n            \n             }\n        }\n    The [MessageDeduplicationId] is available to the consumer of the message (this can be useful for troubleshooting delivery issues).\n    \n     If a message is sent successfully but the acknowledgement is lost and the message is resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon SQS can't detect duplicate messages.\n     \n      Amazon SQS continues to keep track of the message deduplication ID even after the message is received and deleted.\n      \n        The maximum length of [MessageDeduplicationId] is 128 characters. [MessageDeduplicationId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~]).\n        \n         For best practices of using [MessageDeduplicationId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html}Using the MessageDeduplicationId Property} in the {i Amazon SQS Developer Guide}.\n         "];
  message_system_attributes: message_body_system_attribute_map option
    [@ocaml.doc
      "The message system attribute to send. Each message system attribute consists of a [Name], [Type], and [Value].\n\n  {ul\n        {-  Currently, the only supported message system attribute is [AWSTraceHeader]. Its type must be [String] and its value must be a correctly formatted X-Ray trace header string.\n            \n             }\n        {-  The size of a message system attribute doesn't count towards the total size of a message.\n            \n             }\n        }\n   "];
  message_attributes: message_body_attribute_map option
    [@ocaml.doc
      "Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.\n"];
  delay_seconds: int option
    [@ocaml.doc
      " The length of time, in seconds, for which to delay a specific message. Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive [DelaySeconds] value become available for processing after the delay period is finished. If you don't specify a value, the default value for the queue applies. \n\n  When you set [FifoQueue], you can't set [DelaySeconds] per message. You can set this parameter only on a queue level.\n  \n   "];
  message_body: string
    [@ocaml.doc
      "The message to send. The minimum size is one character. The maximum size is 256 KiB.\n\n  A message can include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more information, see the {{:http://www.w3.org/TR/REC-xml/#charsets}W3C specification for characters}.\n  \n    [#x9] | [#xA] | [#xD] | [#x20] to [#xD7FF] | [#xE000] to [#xFFFD] | [#x10000] to [#x10FFFF] \n   \n    Amazon SQS does not throw an exception or completely reject the message if it contains invalid characters. Instead, it replaces those invalid characters with [U+FFFD] before storing the message in the queue, as long as the message body contains at least one valid character.\n    \n     "];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue to which a message is sent.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec send_message_batch_result_entry =
  {
  sequence_number: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The large, non-consecutive number that Amazon SQS assigns to each message.\n \n  The length of [SequenceNumber] is 128 bits. As [SequenceNumber] continues to increase for a particular [MessageGroupId].\n  "];
  md5_of_message_system_attributes: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  md5_of_message_attributes: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  md5_of_message_body: string
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  message_id: string [@ocaml.doc "An identifier for the message.\n"];
  id: string [@ocaml.doc "An identifier for the message in this batch.\n"]}
[@@ocaml.doc
  "Encloses a [MessageId] for a successfully-enqueued message in a \n{[\n [SendMessageBatch].\n]}\n \n"]
type nonrec batch_result_error_entry =
  {
  message: string option
    [@ocaml.doc
      "A message explaining why the action failed on this entry.\n"];
  code: string
    [@ocaml.doc
      "An error code representing why the action failed on this entry.\n"];
  sender_fault: bool
    [@ocaml.doc
      "Specifies whether the error happened due to the caller of the batch API action.\n"];
  id: string [@ocaml.doc "The [Id] of an entry in a batch request.\n"]}
[@@ocaml.doc
  "Gives a detailed description of the result of an action on each entry in the request.\n"]
type nonrec send_message_batch_result =
  {
  failed: batch_result_error_entry list
    [@ocaml.doc
      "A list of \n{[\n [BatchResultErrorEntry] \n]}\n items with error details about each message that can't be enqueued.\n"];
  successful: send_message_batch_result_entry list
    [@ocaml.doc
      "A list of \n{[\n [SendMessageBatchResultEntry] \n]}\n items.\n"]}
[@@ocaml.doc
  "For each message in the batch, the response contains a \n{[\n [SendMessageBatchResultEntry] \n]}\n tag if the message succeeds or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message fails.\n"]
type nonrec send_message_batch_request_entry =
  {
  message_group_id: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The tag that specifies that a message belongs to a specific message group. Messages that belong to the same message group are processed in a FIFO manner (however, messages in different message groups might be processed out of order). To interleave multiple ordered streams within a single queue, use [MessageGroupId] values (for example, session data for multiple users). In this scenario, multiple consumers can process the queue, but the session data of each user is processed in a FIFO fashion.\n \n  {ul\n        {-  You must associate a non-empty [MessageGroupId] with a message. If you don't provide a [MessageGroupId], the action fails.\n            \n             }\n        {-   [ReceiveMessage] might return messages with multiple [MessageGroupId] values. For each [MessageGroupId], the messages are sorted by time sent. The caller can't specify a [MessageGroupId].\n            \n             }\n        }\n   The length of [MessageGroupId] is 128 characters. Valid values: alphanumeric characters and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n   \n    For best practices of using [MessageGroupId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html}Using the MessageGroupId Property} in the {i Amazon SQS Developer Guide}.\n    \n       [MessageGroupId] is required for FIFO queues. You can't use it for Standard queues.\n      \n       "];
  message_deduplication_id: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The token used for deduplication of messages within a 5-minute minimum deduplication interval. If a message with a particular [MessageDeduplicationId] is sent successfully, subsequent messages with the same [MessageDeduplicationId] are accepted successfully but aren't delivered. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html} Exactly-once processing} in the {i Amazon SQS Developer Guide}.\n \n  {ul\n        {-  Every message must have a unique [MessageDeduplicationId],\n            \n             {ul\n                   {-  You may provide a [MessageDeduplicationId] explicitly.\n                       \n                        }\n                   {-  If you aren't able to provide a [MessageDeduplicationId] and you enable [ContentBasedDeduplication] for your queue, Amazon SQS uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the message (but not the attributes of the message). \n                       \n                        }\n                   {-  If you don't provide a [MessageDeduplicationId] and the queue doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n                       \n                        }\n                   {-  If the queue has [ContentBasedDeduplication] set, your [MessageDeduplicationId] overrides the generated one.\n                       \n                        }\n                   \n         }\n          }\n        {-  When [ContentBasedDeduplication] is in effect, messages with identical content sent within the deduplication interval are treated as duplicates and only one copy of the message is delivered.\n            \n             }\n        {-  If you send one message with [ContentBasedDeduplication] enabled and then another message with a [MessageDeduplicationId] that is the same as the one generated for the first [MessageDeduplicationId], the two messages are treated as duplicates and only one copy of the message is delivered. \n            \n             }\n        }\n    The [MessageDeduplicationId] is available to the consumer of the message (this can be useful for troubleshooting delivery issues).\n    \n     If a message is sent successfully but the acknowledgement is lost and the message is resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon SQS can't detect duplicate messages.\n     \n      Amazon SQS continues to keep track of the message deduplication ID even after the message is received and deleted.\n      \n        The length of [MessageDeduplicationId] is 128 characters. [MessageDeduplicationId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~]).\n        \n         For best practices of using [MessageDeduplicationId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html}Using the MessageDeduplicationId Property} in the {i Amazon SQS Developer Guide}.\n         "];
  message_system_attributes: message_body_system_attribute_map option
    [@ocaml.doc
      "The message system attribute to send Each message system attribute consists of a [Name], [Type], and [Value].\n\n  {ul\n        {-  Currently, the only supported message system attribute is [AWSTraceHeader]. Its type must be [String] and its value must be a correctly formatted X-Ray trace header string.\n            \n             }\n        {-  The size of a message system attribute doesn't count towards the total size of a message.\n            \n             }\n        }\n   "];
  message_attributes: message_body_attribute_map option
    [@ocaml.doc
      "Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.\n"];
  delay_seconds: int option
    [@ocaml.doc
      "The length of time, in seconds, for which a specific message is delayed. Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive [DelaySeconds] value become available for processing after the delay period is finished. If you don't specify a value, the default value for the queue is applied. \n\n  When you set [FifoQueue], you can't set [DelaySeconds] per message. You can set this parameter only on a queue level.\n  \n   "];
  message_body: string [@ocaml.doc "The body of the message.\n"];
  id: string
    [@ocaml.doc
      "An identifier for a message in this batch used to communicate the result.\n\n  The [Id]s of a batch request need to be unique within a request.\n  \n   This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).\n   \n    "]}
[@@ocaml.doc
  "Contains the details of a single Amazon SQS message along with an [Id].\n"]
type nonrec send_message_batch_request =
  {
  entries: send_message_batch_request_entry list
    [@ocaml.doc
      "A list of \n{[\n [SendMessageBatchRequestEntry] \n]}\n items.\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue to which batched messages are sent.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec kms_throttled = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Amazon Web Services KMS throttles requests for the following conditions.\n"]
type nonrec kms_opt_in_required = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified key policy isn't syntactically or semantically correct.\n"]
type nonrec kms_not_found = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the specified entity or resource could not be found. \n"]
type nonrec kms_invalid_state = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected because the state of the specified resource is not valid for this request.\n"]
type nonrec kms_invalid_key_usage = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was rejected for one of the following reasons:\n\n {ul\n       {-  The KeyUsage value of the KMS key is incompatible with the API operation.\n           \n            }\n       {-  The encryption algorithm or signing algorithm specified for the operation is incompatible with the type of key material in the KMS key (KeySpec).\n           \n            }\n       }\n  "]
type nonrec kms_disabled = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request was denied due to request throttling.\n"]
type nonrec kms_access_denied = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The caller doesn't have the required KMS access.\n"]
type nonrec invalid_batch_entry_id = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The [Id] of a batch entry in a batch request doesn't abide by the specification.\n"]
type nonrec empty_batch_request = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The batch request doesn't contain any entries.\n"]
type nonrec batch_request_too_long = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The length of all the messages put together is more than the limit.\n"]
type nonrec batch_entry_ids_not_distinct =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Two or more batch entries in the request have the same [Id].\n"]
type nonrec invalid_message_contents =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The message contains characters outside the allowed set.\n"]
type nonrec remove_permission_request =
  {
  label: string
    [@ocaml.doc
      "The identification of the permission to remove. This is the label added using the \n{[\n [AddPermission] \n]}\n action.\n"];
  queue_url: string
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
  (message_system_attribute_name * string) list[@@ocaml.doc ""]
type nonrec message =
  {
  message_attributes: message_body_attribute_map option
    [@ocaml.doc
      "Each message attribute consists of a [Name], [Type], and [Value]. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes}Amazon SQS message attributes} in the {i Amazon SQS Developer Guide}.\n"];
  md5_of_message_attributes: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the MD5 digest. For information about MD5, see {{:https://www.ietf.org/rfc/rfc1321.txt}RFC1321}.\n"];
  attributes: message_system_attribute_map option
    [@ocaml.doc
      "A map of the attributes requested in \n{[\n [ReceiveMessage] \n]}\n to their respective values. Supported attributes:\n\n {ul\n       {-   [ApproximateReceiveCount] \n           \n            }\n       {-   [ApproximateFirstReceiveTimestamp] \n           \n            }\n       {-   [MessageDeduplicationId] \n           \n            }\n       {-   [MessageGroupId] \n           \n            }\n       {-   [SenderId] \n           \n            }\n       {-   [SentTimestamp] \n           \n            }\n       {-   [SequenceNumber] \n           \n            }\n       }\n    [ApproximateFirstReceiveTimestamp] and [SentTimestamp] are each returned as an integer representing the {{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds.\n   "];
  body: string option
    [@ocaml.doc "The message's contents (not URL-encoded).\n"];
  md5_of_body: string option
    [@ocaml.doc
      "An MD5 digest of the non-URL-encoded message body string.\n"];
  receipt_handle: string option
    [@ocaml.doc
      "An identifier associated with the act of receiving the message. A new receipt handle is returned every time you receive a message. When deleting a message, you provide the last received receipt handle to delete the message.\n"];
  message_id: string option
    [@ocaml.doc
      "A unique identifier for the message. A [MessageId]is considered unique across all Amazon Web Services accounts for an extended period of time.\n"]}
[@@ocaml.doc "An Amazon SQS message.\n"]
type nonrec receive_message_result =
  {
  messages: message list option [@ocaml.doc "A list of messages.\n"]}
[@@ocaml.doc "A list of received messages.\n"]
type nonrec receive_message_request =
  {
  receive_request_attempt_id: string option
    [@ocaml.doc
      "This parameter applies only to FIFO (first-in-first-out) queues.\n\n The token used for deduplication of [ReceiveMessage] calls. If a networking issue occurs after a [ReceiveMessage] action, and instead of a response you receive a generic error, it is possible to retry the same action with an identical [ReceiveRequestAttemptId] to retrieve the same set of messages, even if their visibility timeout has not yet expired.\n \n  {ul\n        {-  You can use [ReceiveRequestAttemptId] only for 5 minutes after a [ReceiveMessage] action.\n            \n             }\n        {-  When you set [FifoQueue], a caller of the [ReceiveMessage] action can provide a [ReceiveRequestAttemptId] explicitly.\n            \n             }\n        {-  It is possible to retry the [ReceiveMessage] action with the same [ReceiveRequestAttemptId] if none of the messages have been modified (deleted or had their visibility changes).\n            \n             }\n        {-  During a visibility timeout, subsequent calls with the same [ReceiveRequestAttemptId] return the same messages and receipt handles. If a retry occurs within the deduplication interval, it resets the visibility timeout. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}.\n            \n              If a caller of the [ReceiveMessage] action still processes messages when the visibility timeout expires and messages become visible, another worker consuming from the same queue can receive the same messages and therefore process duplicates. Also, if a consumer whose message processing time is longer than the visibility timeout tries to delete the processed messages, the action fails with an error.\n              \n               To mitigate this effect, ensure that your application observes a safe threshold before the visibility timeout expires and extend the visibility timeout as necessary.\n               \n                 }\n        {-  While messages with a particular [MessageGroupId] are invisible, no more messages belonging to the same [MessageGroupId] are returned until the visibility timeout expires. You can still receive messages with another [MessageGroupId] as long as it is also visible.\n            \n             }\n        {-  If a caller of [ReceiveMessage] can't track the [ReceiveRequestAttemptId], no retries work until the original visibility timeout expires. As a result, delays might occur but the messages in the queue remain in a strict order.\n            \n             }\n        }\n   The maximum length of [ReceiveRequestAttemptId] is 128 characters. [ReceiveRequestAttemptId] can contain alphanumeric characters ([a-z], [A-Z], [0-9]) and punctuation ([!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~]).\n   \n    For best practices of using [ReceiveRequestAttemptId], see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-receiverequestattemptid-request-parameter.html}Using the ReceiveRequestAttemptId Request Parameter} in the {i Amazon SQS Developer Guide}.\n    "];
  wait_time_seconds: int option
    [@ocaml.doc
      "The duration (in seconds) for which the call waits for a message to arrive in the queue before returning. If a message is available, the call returns sooner than [WaitTimeSeconds]. If no messages are available and the wait time expires, the call does not return a message list.\n\n  To avoid HTTP errors, ensure that the HTTP response timeout for [ReceiveMessage] requests is longer than the [WaitTimeSeconds] parameter. For example, with the Java SDK, you can set HTTP transport settings using the {{:https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/nio/netty/NettyNioAsyncHttpClient.html} NettyNioAsyncHttpClient} for asynchronous clients, or the {{:https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/apache/ApacheHttpClient.html} ApacheHttpClient} for synchronous clients. \n  \n   "];
  visibility_timeout: int option
    [@ocaml.doc
      "The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a [ReceiveMessage] request.\n"];
  max_number_of_messages: int option
    [@ocaml.doc
      "The maximum number of messages to return. Amazon SQS never returns more messages than this value (however, fewer messages might be returned). Valid values: 1 to 10. Default: 1.\n"];
  message_attribute_names: string list option
    [@ocaml.doc
      "The name of the message attribute, where {i N} is the index.\n\n {ul\n       {-  The name can contain alphanumeric characters and the underscore ([_]), hyphen ([-]), and period ([.]).\n           \n            }\n       {-  The name is case-sensitive and must be unique among all attribute names for the message.\n           \n            }\n       {-  The name must not start with AWS-reserved prefixes such as [AWS.] or [Amazon.] (or any casing variants).\n           \n            }\n       {-  The name must not start or end with a period ([.]), and it should not have periods in succession ([..]).\n           \n            }\n       {-  The name can be up to 256 characters long.\n           \n            }\n       }\n   When using [ReceiveMessage], you can send a list of attribute names to receive, or you can return all of the attributes by specifying [All] or [.*] in your request. You can also use all message attributes starting with a prefix, for example [bar.*].\n   "];
  message_system_attribute_names: message_system_attribute_name list option
    [@ocaml.doc
      "A list of attributes that need to be returned along with each message. These attributes include:\n\n {ul\n       {-   [All] \226\128\147 Returns all values.\n           \n            }\n       {-   [ApproximateFirstReceiveTimestamp] \226\128\147 Returns the time the message was first received from the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n           \n            }\n       {-   [ApproximateReceiveCount] \226\128\147 Returns the number of times a message has been received across all queues but not deleted.\n           \n            }\n       {-   [AWSTraceHeader] \226\128\147 Returns the X-Ray trace header string. \n           \n            }\n       {-   [SenderId] \n           \n            {ul\n                  {-  For a user, returns the user ID, for example [ABCDEFGHI1JKLMNOPQ23R].\n                      \n                       }\n                  {-  For an IAM role, returns the IAM role ID, for example [ABCDE1F2GH3I4JK5LMNOP:i-a123b456].\n                      \n                       }\n                  \n        }\n         }\n       {-   [SentTimestamp] \226\128\147 Returns the time the message was sent to the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n           \n            }\n       {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n           \n            }\n       {-   [MessageDeduplicationId] \226\128\147 Returns the value provided by the producer that calls the \n           {[\n            [SendMessage] \n           ]}\n            action.\n           \n            }\n       {-   [MessageGroupId] \226\128\147 Returns the value provided by the producer that calls the \n           {[\n            [SendMessage] \n           ]}\n            action. Messages with the same [MessageGroupId] are returned in sequence.\n           \n            }\n       {-   [SequenceNumber] \226\128\147 Returns the value provided by Amazon SQS.\n           \n            }\n       }\n  "];
  attribute_names: queue_attribute_name list option
    [@ocaml.doc
      "  This parameter has been deprecated but will be supported for backward compatibility. To provide attribute names, you are encouraged to use [MessageSystemAttributeNames]. \n \n   A list of attributes that need to be returned along with each message. These attributes include:\n   \n    {ul\n          {-   [All] \226\128\147 Returns all values.\n              \n               }\n          {-   [ApproximateFirstReceiveTimestamp] \226\128\147 Returns the time the message was first received from the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n              \n               }\n          {-   [ApproximateReceiveCount] \226\128\147 Returns the number of times a message has been received across all queues but not deleted.\n              \n               }\n          {-   [AWSTraceHeader] \226\128\147 Returns the X-Ray trace header string. \n              \n               }\n          {-   [SenderId] \n              \n               {ul\n                     {-  For a user, returns the user ID, for example [ABCDEFGHI1JKLMNOPQ23R].\n                         \n                          }\n                     {-  For an IAM role, returns the IAM role ID, for example [ABCDE1F2GH3I4JK5LMNOP:i-a123b456].\n                         \n                          }\n                     \n           }\n            }\n          {-   [SentTimestamp] \226\128\147 Returns the time the message was sent to the queue ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time} in milliseconds).\n              \n               }\n          {-   [SqsManagedSseEnabled] \226\128\147 Enables server-side queue encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n              \n               }\n          {-   [MessageDeduplicationId] \226\128\147 Returns the value provided by the producer that calls the \n              {[\n               [SendMessage] \n              ]}\n               action.\n              \n               }\n          {-   [MessageGroupId] \226\128\147 Returns the value provided by the producer that calls the \n              {[\n               [SendMessage] \n              ]}\n               action. Messages with the same [MessageGroupId] are returned in sequence.\n              \n               }\n          {-   [SequenceNumber] \226\128\147 Returns the value provided by Amazon SQS.\n              \n               }\n          }\n  "];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which messages are received.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec receipt_handle_is_invalid =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified receipt handle isn't valid.\n"]
type nonrec queue_name_exists = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A queue with this name already exists. Amazon SQS returns this error only if the request includes attributes whose values differ from those of the existing queue.\n"]
type nonrec queue_deleted_recently = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You must wait 60 seconds after deleting a queue before you can create another queue with the same name.\n"]
type nonrec purge_queue_request =
  {
  queue_url: string
    [@ocaml.doc
      "The URL of the queue from which the [PurgeQueue] action deletes messages.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec purge_queue_in_progress =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Indicates that the specified queue previously received a [PurgeQueue] request within the last 60 seconds (the time it can take to delete the messages in the queue).\n"]
type nonrec list_queues_result =
  {
  next_token: string option
    [@ocaml.doc
      "Pagination token to include in the next request. Token value is [null] if there are no additional results to request, or if you did not set [MaxResults] in the request.\n"];
  queue_urls: string list option
    [@ocaml.doc
      "A list of queue URLs, up to 1,000 entries, or the value of [MaxResults] that you sent in the request.\n"]}
[@@ocaml.doc "A list of your queues.\n"]
type nonrec list_queues_request =
  {
  max_results: int option
    [@ocaml.doc
      "Maximum number of results to include in the response. Value range is 1 to 1000. You must set [MaxResults] to receive a value for [NextToken] in the response.\n"];
  next_token: string option
    [@ocaml.doc "Pagination token to request the next set of results.\n"];
  queue_name_prefix: string option
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
  queue_url: string [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc ""]
type nonrec list_message_move_tasks_result_entry =
  {
  started_timestamp: int option
    [@ocaml.doc "The timestamp of starting the message movement task.\n"];
  failure_reason: string option
    [@ocaml.doc
      "The task failure reason (only included if the task status is FAILED).\n"];
  approximate_number_of_messages_to_move: int option
    [@ocaml.doc
      "The number of messages to be moved from the source queue. This number is obtained at the time of starting the message movement task and is only included after the message movement task is selected to start.\n"];
  approximate_number_of_messages_moved: int option
    [@ocaml.doc
      "The approximate number of messages already moved to the destination queue.\n"];
  max_number_of_messages_per_second: int option
    [@ocaml.doc
      "The number of messages to be moved per second (the message movement rate), if it has been specified in the [StartMessageMoveTask] request. If a [MaxNumberOfMessagesPerSecond] has not been specified in the [StartMessageMoveTask] request, this field value will be NULL.\n"];
  destination_arn: string option
    [@ocaml.doc
      "The ARN of the destination queue if it has been specified in the [StartMessageMoveTask] request. If a [DestinationArn] has not been specified in the [StartMessageMoveTask] request, this field value will be NULL.\n"];
  source_arn: string option
    [@ocaml.doc
      "The ARN of the queue that contains the messages to be moved to another queue.\n"];
  status: string option
    [@ocaml.doc
      "The status of the message movement task. Possible values are: RUNNING, COMPLETED, CANCELLING, CANCELLED, and FAILED.\n"];
  task_handle: string option
    [@ocaml.doc
      "An identifier associated with a message movement task. When this field is returned in the response of the [ListMessageMoveTasks] action, it is only populated for tasks that are in RUNNING status.\n"]}
[@@ocaml.doc "Contains the details of a message movement task. \n"]
type nonrec list_message_move_tasks_result =
  {
  results: list_message_move_tasks_result_entry list option
    [@ocaml.doc "A list of message movement tasks and their attributes.\n"]}
[@@ocaml.doc ""]
type nonrec list_message_move_tasks_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in the response. The default is 1, which provides the most recent message movement task. The upper limit is 10.\n"];
  source_arn: string
    [@ocaml.doc
      "The ARN of the queue whose message movement tasks are to be listed.\n"]}
[@@ocaml.doc ""]
type nonrec list_dead_letter_source_queues_result =
  {
  next_token: string option
    [@ocaml.doc
      "Pagination token to include in the next request. Token value is [null] if there are no additional results to request, or if you did not set [MaxResults] in the request.\n"];
  queue_urls: string list
    [@ocaml.doc
      "A list of source queue URLs that have the [RedrivePolicy] queue attribute configured with a dead-letter queue.\n"]}
[@@ocaml.doc "A list of your dead letter source queues.\n"]
type nonrec list_dead_letter_source_queues_request =
  {
  max_results: int option
    [@ocaml.doc
      "Maximum number of results to include in the response. Value range is 1 to 1000. You must set [MaxResults] to receive a value for [NextToken] in the response.\n"];
  next_token: string option
    [@ocaml.doc "Pagination token to request the next set of results.\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of a dead-letter queue.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec get_queue_url_result =
  {
  queue_url: string option [@ocaml.doc "The URL of the queue.\n"]}[@@ocaml.doc
                                                                    "For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-api-responses.html}Interpreting Responses} in the {i Amazon SQS Developer Guide}.\n"]
type nonrec get_queue_url_request =
  {
  queue_owner_aws_account_id: string option
    [@ocaml.doc
      "The Amazon Web Services account ID of the account that created the queue.\n"];
  queue_name: string
    [@ocaml.doc
      "The name of the queue whose URL must be fetched. Maximum 80 characters. Valid values: alphanumeric characters, hyphens ([-]), and underscores ([_]).\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec get_queue_attributes_result =
  {
  attributes: queue_attribute_map option
    [@ocaml.doc "A map of attributes to their respective values.\n"]}
[@@ocaml.doc "A list of returned queue attributes.\n"]
type nonrec get_queue_attributes_request =
  {
  attribute_names: queue_attribute_name list option
    [@ocaml.doc
      "A list of attributes for which to retrieve information.\n\n The [AttributeNames] parameter is optional, but if you don't specify values for this parameter, the request returns empty results.\n \n   In the future, new attributes might be added. If you write code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.\n   \n     The following attributes are supported:\n     \n       The [ApproximateNumberOfMessagesDelayed], [ApproximateNumberOfMessagesNotVisible], and [ApproximateNumberOfMessages] metrics may not achieve consistency until at least 1 minute after the producers stop sending messages. This period is required for the queue metadata to reach eventual consistency. \n       \n         {ul\n               {-   [All] \226\128\147 Returns all values. \n                   \n                    }\n               {-   [ApproximateNumberOfMessages] \226\128\147 Returns the approximate number of messages available for retrieval from the queue.\n                   \n                    }\n               {-   [ApproximateNumberOfMessagesDelayed] \226\128\147 Returns the approximate number of messages in the queue that are delayed and not available for reading immediately. This can happen when the queue is configured as a delay queue or when a message has been sent with a delay parameter.\n                   \n                    }\n               {-   [ApproximateNumberOfMessagesNotVisible] \226\128\147 Returns the approximate number of messages that are in flight. Messages are considered to be {i in flight} if they have been sent to a client but have not yet been deleted or have not yet reached the end of their visibility window. \n                   \n                    }\n               {-   [CreatedTimestamp] \226\128\147 Returns the time when the queue was created in seconds ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time}).\n                   \n                    }\n               {-   [DelaySeconds] \226\128\147 Returns the default delay on the queue in seconds.\n                   \n                    }\n               {-   [LastModifiedTimestamp] \226\128\147 Returns the time when the queue was last changed in seconds ({{:http://en.wikipedia.org/wiki/Unix_time}epoch time}).\n                   \n                    }\n               {-   [MaximumMessageSize] \226\128\147 Returns the limit of how many bytes a message can contain before Amazon SQS rejects it.\n                   \n                    }\n               {-   [MessageRetentionPeriod] \226\128\147 Returns the length of time, in seconds, for which Amazon SQS retains a message. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon SQS system. Changes made to the [MessageRetentionPeriod] attribute can take up to 15 minutes and will impact existing messages in the queue potentially causing them to be expired and deleted if the [MessageRetentionPeriod] is reduced below the age of existing messages.\n                   \n                    }\n               {-   [Policy] \226\128\147 Returns the policy of the queue.\n                   \n                    }\n               {-   [QueueArn] \226\128\147 Returns the Amazon resource name (ARN) of the queue.\n                   \n                    }\n               {-   [ReceiveMessageWaitTimeSeconds] \226\128\147 Returns the length of time, in seconds, for which the [ReceiveMessage] action waits for a message to arrive. \n                   \n                    }\n               {-   [VisibilityTimeout] \226\128\147 Returns the visibility timeout for the queue. For more information about the visibility timeout, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html}Visibility Timeout} in the {i Amazon SQS Developer Guide}. \n                   \n                    }\n               }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html}dead-letter queues:} \n   \n    {ul\n          {-   [RedrivePolicy] \226\128\147 The string that includes the parameters for the dead-letter queue functionality of the source queue as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [deadLetterTargetArn] \226\128\147 The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS moves messages after the value of [maxReceiveCount] is exceeded.\n                         \n                          }\n                     {-   [maxReceiveCount] \226\128\147 The number of times a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10. When the [ReceiveCount] for a message exceeds the [maxReceiveCount] for a queue, Amazon SQS moves the message to the dead-letter-queue.\n                         \n                          }\n                     \n           }\n            }\n          {-   [RedriveAllowPolicy] \226\128\147 The string that includes the parameters for the permissions for the dead-letter queue redrive permission and which source queues can specify dead-letter queues as a JSON object. The parameters are as follows:\n              \n               {ul\n                     {-   [redrivePermission] \226\128\147 The permission type that defines which source queues can specify the current queue as the dead-letter queue. Valid values are:\n                         \n                          {ul\n                                {-   [allowAll] \226\128\147 (Default) Any source queues in this Amazon Web Services account in the same Region can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [denyAll] \226\128\147 No source queues can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                {-   [byQueue] \226\128\147 Only queues specified by the [sourceQueueArns] parameter can specify this queue as the dead-letter queue.\n                                    \n                                     }\n                                \n                      }\n                       }\n                     {-   [sourceQueueArns] \226\128\147 The Amazon Resource Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter only when the [redrivePermission] parameter is set to [byQueue]. You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify dead-letter queues, set the [redrivePermission] parameter to [allowAll].\n                         \n                          }\n                     \n           }\n            }\n          }\n    The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also be a standard queue.\n    \n      The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html}server-side-encryption}:\n      \n       {ul\n             {-   [KmsMasterKeyId] \226\128\147 Returns the ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms}Key Terms}. \n                 \n                  }\n             {-   [KmsDataKeyReusePeriodSeconds] \226\128\147 Returns the length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling KMS again. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work}How Does the Data Key Reuse Period Work?}. \n                 \n                  }\n             {-   [SqsManagedSseEnabled] \226\128\147 Returns information about whether the queue is using SSE-SQS encryption using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for example, {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html}SSE-KMS} or {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html}SSE-SQS}).\n                 \n                  }\n             }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO (first-in-first-out) queues}:\n   \n    {ul\n          {-   [FifoQueue] \226\128\147 Returns information about whether the queue is FIFO. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-understanding-logic.html}FIFO queue logic} in the {i Amazon SQS Developer Guide}.\n              \n                To determine whether a queue is {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html}FIFO}, you can check whether [QueueName] ends with the [.fifo] suffix.\n                \n                  }\n          {-   [ContentBasedDeduplication] \226\128\147 Returns whether content-based deduplication is enabled for the queue. For more information, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues-exactly-once-processing.html}Exactly-once processing} in the {i Amazon SQS Developer Guide}. \n              \n               }\n          }\n   The following attributes apply only to {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/high-throughput-fifo.html}high throughput for FIFO queues}:\n   \n    {ul\n          {-   [DeduplicationScope] \226\128\147 Specifies whether message deduplication occurs at the message group or queue level. Valid values are [messageGroup] and [queue].\n              \n               }\n          {-   [FifoThroughputLimit] \226\128\147 Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are [perQueue] and [perMessageGroupId]. The [perMessageGroupId] value is allowed only when the value for [DeduplicationScope] is [messageGroup].\n              \n               }\n          }\n   To enable high throughput for FIFO queues, do the following:\n   \n    {ul\n          {-  Set [DeduplicationScope] to [messageGroup].\n              \n               }\n          {-  Set [FifoThroughputLimit] to [perMessageGroupId].\n              \n               }\n          }\n   If you set these attributes to anything other than the values shown for enabling high throughput, normal throughput is in effect and deduplication occurs as specified.\n   \n    For information on throughput quotas, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-messages.html}Quotas related to messages} in the {i Amazon SQS Developer Guide}.\n    "];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose attribute information is retrieved.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec delete_queue_request =
  {
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue to delete.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec delete_message_request =
  {
  receipt_handle: string
    [@ocaml.doc
      "The receipt handle associated with the message to delete.\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which messages are deleted.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec delete_message_batch_result_entry =
  {
  id: string [@ocaml.doc "Represents a successfully deleted message.\n"]}
[@@ocaml.doc
  "Encloses the [Id] of an entry in \n{[\n [DeleteMessageBatch].\n]}\n \n"]
type nonrec delete_message_batch_result =
  {
  failed: batch_result_error_entry list
    [@ocaml.doc "A list of \n{[\n [BatchResultErrorEntry] \n]}\n items.\n"];
  successful: delete_message_batch_result_entry list
    [@ocaml.doc
      "A list of \n{[\n [DeleteMessageBatchResultEntry] \n]}\n items.\n"]}
[@@ocaml.doc
  "For each message in the batch, the response contains a \n{[\n [DeleteMessageBatchResultEntry] \n]}\n tag if the message is deleted or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message can't be deleted.\n"]
type nonrec delete_message_batch_request_entry =
  {
  receipt_handle: string [@ocaml.doc "A receipt handle.\n"];
  id: string
    [@ocaml.doc
      "The identifier for this particular receipt handle. This is used to communicate the result.\n\n  The [Id]s of a batch request need to be unique within a request.\n  \n   This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).\n   \n    "]}
[@@ocaml.doc "Encloses a receipt handle and an identifier for it.\n"]
type nonrec delete_message_batch_request =
  {
  entries: delete_message_batch_request_entry list
    [@ocaml.doc
      "Lists the receipt handles for the messages to be deleted.\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue from which messages are deleted.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec create_queue_result =
  {
  queue_url: string option
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
  queue_name: string
    [@ocaml.doc
      "The name of the new queue. The following limits apply to this name:\n\n {ul\n       {-  A queue name can have up to 80 characters.\n           \n            }\n       {-  Valid values: alphanumeric characters, hyphens ([-]), and underscores ([_]).\n           \n            }\n       {-  A FIFO queue name must end with the [.fifo] suffix.\n           \n            }\n       }\n   Queue URLs and names are case-sensitive.\n   "]}
[@@ocaml.doc "\n"]
type nonrec change_message_visibility_request =
  {
  visibility_timeout: int
    [@ocaml.doc
      "The new value for the message's visibility timeout (in seconds). Values range: [0] to [43200]. Maximum: 12 hours.\n"];
  receipt_handle: string
    [@ocaml.doc
      "The receipt handle associated with the message, whose visibility timeout is changed. This parameter is returned by the \n{[\n [ReceiveMessage] \n]}\n action.\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose message's visibility is changed.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc ""]
type nonrec change_message_visibility_batch_result_entry =
  {
  id: string
    [@ocaml.doc
      "Represents a message whose visibility timeout has been changed successfully.\n"]}
[@@ocaml.doc
  "Encloses the [Id] of an entry in \n{[\n [ChangeMessageVisibilityBatch].\n]}\n \n"]
type nonrec change_message_visibility_batch_result =
  {
  failed: batch_result_error_entry list
    [@ocaml.doc "A list of \n{[\n [BatchResultErrorEntry] \n]}\n items.\n"];
  successful: change_message_visibility_batch_result_entry list
    [@ocaml.doc
      "A list of \n{[\n [ChangeMessageVisibilityBatchResultEntry] \n]}\n items.\n"]}
[@@ocaml.doc
  "For each message in the batch, the response contains a \n{[\n [ChangeMessageVisibilityBatchResultEntry] \n]}\n tag if the message succeeds or a \n{[\n [BatchResultErrorEntry] \n]}\n tag if the message fails.\n"]
type nonrec change_message_visibility_batch_request_entry =
  {
  visibility_timeout: int option
    [@ocaml.doc
      "The new value (in seconds) for the message's visibility timeout.\n"];
  receipt_handle: string [@ocaml.doc "A receipt handle.\n"];
  id: string
    [@ocaml.doc
      "An identifier for this particular receipt handle used to communicate the result.\n\n  The [Id]s of a batch request need to be unique within a request.\n  \n   This identifier can have up to 80 characters. The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).\n   \n    "]}
[@@ocaml.doc
  "Encloses a receipt handle and an entry ID for each message in \n{[\n [ChangeMessageVisibilityBatch].\n]}\n \n"]
type nonrec change_message_visibility_batch_request =
  {
  entries: change_message_visibility_batch_request_entry list
    [@ocaml.doc
      "Lists the receipt handles of the messages for which the visibility timeout must be changed.\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue whose messages' visibility is changed.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]
type nonrec cancel_message_move_task_result =
  {
  approximate_number_of_messages_moved: int option
    [@ocaml.doc
      "The approximate number of messages already moved to the destination queue.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_message_move_task_request =
  {
  task_handle: string
    [@ocaml.doc "An identifier associated with a message movement task.\n"]}
[@@ocaml.doc ""]
type nonrec add_permission_request =
  {
  actions: string list
    [@ocaml.doc
      "The action the client wants to allow for the specified principal. Valid values: the name of any action or [*].\n\n For more information about these actions, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-overview-of-managing-access.html}Overview of Managing Access Permissions to Your Amazon Simple Queue Service Resource} in the {i Amazon SQS Developer Guide}.\n \n  Specifying [SendMessage], [DeleteMessage], or [ChangeMessageVisibility] for [ActionName.n] also grants permissions for the corresponding batch versions of those actions: [SendMessageBatch], [DeleteMessageBatch], and [ChangeMessageVisibilityBatch].\n  "];
  aws_account_ids: string list
    [@ocaml.doc
      "The Amazon Web Services account numbers of the {{:https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P}principals} who are to receive permission. For information about locating the Amazon Web Services account identification, see {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html#sqs-api-request-authentication}Your Amazon Web Services Identifiers} in the {i Amazon SQS Developer Guide}.\n"];
  label: string
    [@ocaml.doc
      "The unique identification of the permission you're setting (for example, [AliceSendMessage]). Maximum 80 characters. Allowed characters include alphanumeric characters, hyphens ([-]), and underscores ([_]).\n"];
  queue_url: string
    [@ocaml.doc
      "The URL of the Amazon SQS queue to which permissions are added.\n\n Queue URLs and names are case-sensitive.\n "]}
[@@ocaml.doc "\n"]