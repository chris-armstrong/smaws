type nonrec action = string [@@ocaml.doc ""]

type nonrec actions_list = action list [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates that the requested resource does not exist.\n"]

type nonrec invalid_parameter_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that a request parameter does not comply with the associated constraints.\n"]

type nonrec internal_error_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates an internal service error.\n"]

type nonrec authorization_error_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates that the user has been denied access to the requested resource.\n"]

type nonrec delegate = string [@@ocaml.doc ""]

type nonrec delegates_list = delegate list [@@ocaml.doc ""]

type nonrec label = string [@@ocaml.doc ""]

type nonrec topic_ar_n = string [@@ocaml.doc ""]

type nonrec add_permission_input = {
  topic_arn : topic_ar_n;
      [@ocaml.doc "The ARN of the topic whose access control policy you wish to modify.\n"]
  label : label; [@ocaml.doc "A unique identifier for the new policy statement.\n"]
  aws_account_id : delegates_list;
      [@ocaml.doc
        "The Amazon Web Services account IDs of the users (principals) who will be given access to \
         the specified actions. The users must have Amazon Web Services account, but do not need \
         to be signed up for this service.\n"]
  action_name : actions_list;
      [@ocaml.doc
        "The action you want to allow for the specified principal(s).\n\n\
        \ Valid values: Any Amazon SNS action name, for example [Publish].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec verification_exception = {
  message : string_; [@ocaml.doc ""]
  status : string_; [@ocaml.doc "The status of the verification error.\n"]
}
[@@ocaml.doc "Indicates that the one-time password (OTP) used for verification is invalid.\n"]

type nonrec throttled_exception = { message : string_ option [@ocaml.doc "Throttled request.\n"] }
[@@ocaml.doc
  "Indicates that the rate at which requests have been submitted for this action exceeds the limit \
   for your Amazon Web Services account.\n"]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Can\226\128\153t perform the action on the specified resource. Make sure that the resource \
   exists.\n"]

type nonrec verify_sms_sandbox_phone_number_result = unit [@@ocaml.doc ""]

type nonrec otp_code = string [@@ocaml.doc ""]

type nonrec phone_number_string = string [@@ocaml.doc ""]

type nonrec verify_sms_sandbox_phone_number_input = {
  phone_number : phone_number_string; [@ocaml.doc "The destination phone number to verify.\n"]
  one_time_password : otp_code;
      [@ocaml.doc
        "The OTP sent to the destination number from the [CreateSMSSandBoxPhoneNumber] call.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_policy_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request doesn't comply with the IAM tag policy. Correct your request and then retry it.\n"]

type nonrec tag_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Can't add more than 50 tags to a topic.\n"]

type nonrec stale_tag_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "A tag has been added to a resource with the same ARN as a deleted resource. Wait a short while \
   and then retry the operation.\n"]

type nonrec concurrent_access_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Can't perform multiple operations on a tag simultaneously. Perform the operations sequentially.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the topic from which to remove tags.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The list of tag keys to remove from the specified topic.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_security_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The credential signature isn't valid. You must use an HTTPS endpoint and sign your request \
   using Signature Version 4.\n"]

type nonrec subscription_ar_n = string [@@ocaml.doc ""]

type nonrec unsubscribe_input = {
  subscription_arn : subscription_ar_n; [@ocaml.doc "The ARN of the subscription to be deleted.\n"]
}
[@@ocaml.doc "Input for Unsubscribe action.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The required key portion of the tag.\n"]
  value : tag_value; [@ocaml.doc "The optional value portion of the tag.\n"]
}
[@@ocaml.doc "The list of tags to be added to the specified topic.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : amazon_resource_name; [@ocaml.doc "The ARN of the topic to which to add tags.\n"]
  tags : tag_list;
      [@ocaml.doc
        "The tags to be added to the specified topic. A tag consists of a required key and an \
         optional value.\n"]
}
[@@ocaml.doc ""]

type nonrec subscription_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the customer already owns the maximum allowed number of subscriptions.\n"]

type nonrec replay_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the request parameter has exceeded the maximum number of concurrent message \
   replays.\n"]

type nonrec filter_policy_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the number of filter polices in your Amazon Web Services account exceeds the \
   limit. To add more filter polices, submit an Amazon SNS Limit Increase case in the Amazon Web \
   Services Support Center.\n"]

type nonrec subscribe_response = {
  subscription_arn : subscription_ar_n option;
      [@ocaml.doc
        "The ARN of the subscription if it is confirmed, or the string \"pending confirmation\" if \
         the subscription requires confirmation. However, if the API request parameter \
         [ReturnSubscriptionArn] is true, then the value is always the subscription ARN, even if \
         the subscription requires confirmation.\n"]
}
[@@ocaml.doc "Response for Subscribe action.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute_name = string [@@ocaml.doc ""]

type nonrec subscription_attributes_map = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec endpoint2 = string [@@ocaml.doc ""]

type nonrec protocol = string [@@ocaml.doc ""]

type nonrec subscribe_input = {
  topic_arn : topic_ar_n; [@ocaml.doc "The ARN of the topic you want to subscribe to.\n"]
  protocol : protocol;
      [@ocaml.doc
        "The protocol that you want to use. Supported protocols include:\n\n\
        \ {ul\n\
        \       {-   [http] \226\128\147 delivery of JSON-encoded message via HTTP POST\n\
        \           \n\
        \            }\n\
        \       {-   [https] \226\128\147 delivery of JSON-encoded message via HTTPS POST\n\
        \           \n\
        \            }\n\
        \       {-   [email] \226\128\147 delivery of message via SMTP\n\
        \           \n\
        \            }\n\
        \       {-   [email-json] \226\128\147 delivery of JSON-encoded message via SMTP\n\
        \           \n\
        \            }\n\
        \       {-   [sms] \226\128\147 delivery of message via SMS\n\
        \           \n\
        \            }\n\
        \       {-   [sqs] \226\128\147 delivery of JSON-encoded message to an Amazon SQS queue\n\
        \           \n\
        \            }\n\
        \       {-   [application] \226\128\147 delivery of JSON-encoded message to an EndpointArn \
         for a mobile app and device\n\
        \           \n\
        \            }\n\
        \       {-   [lambda] \226\128\147 delivery of JSON-encoded message to an Lambda function\n\
        \           \n\
        \            }\n\
        \       {-   [firehose] \226\128\147 delivery of JSON-encoded message to an Amazon Data \
         Firehose delivery stream.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  endpoint : endpoint2 option;
      [@ocaml.doc
        "The endpoint that you want to receive notifications. Endpoints vary by protocol:\n\n\
        \ {ul\n\
        \       {-  For the [http] protocol, the (public) endpoint is a URL beginning with \
         [http://].\n\
        \           \n\
        \            }\n\
        \       {-  For the [https] protocol, the (public) endpoint is a URL beginning with \
         [https://].\n\
        \           \n\
        \            }\n\
        \       {-  For the [email] protocol, the endpoint is an email address.\n\
        \           \n\
        \            }\n\
        \       {-  For the [email-json] protocol, the endpoint is an email address.\n\
        \           \n\
        \            }\n\
        \       {-  For the [sms] protocol, the endpoint is a phone number of an SMS-enabled device.\n\
        \           \n\
        \            }\n\
        \       {-  For the [sqs] protocol, the endpoint is the ARN of an Amazon SQS queue.\n\
        \           \n\
        \            }\n\
        \       {-  For the [application] protocol, the endpoint is the EndpointArn of a mobile \
         app and device.\n\
        \           \n\
        \            }\n\
        \       {-  For the [lambda] protocol, the endpoint is the ARN of an Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-  For the [firehose] protocol, the endpoint is the ARN of an Amazon Data \
         Firehose delivery stream.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  attributes : subscription_attributes_map option;
      [@ocaml.doc
        "A map of attributes with their corresponding values.\n\n\
        \ The following lists the names, descriptions, and values of the special request \
         parameters that the [Subscribe] action uses:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DeliveryPolicy] \226\128\147 The policy that defines how Amazon SNS retries \
         failed deliveries to HTTP/S endpoints.\n\
        \            \n\
        \             }\n\
        \        {-   [FilterPolicy] \226\128\147 The simple JSON object that lets your subscriber \
         receive only a subset of messages, rather than receiving every message published to the \
         topic.\n\
        \            \n\
        \             }\n\
        \        {-   [FilterPolicyScope] \226\128\147 This attribute lets you choose the \
         filtering scope by using one of the following string value types:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [MessageAttributes] (default) \226\128\147 The filter is applied \
         on the message attributes.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [MessageBody] \226\128\147 The filter is applied on the message \
         body.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [RawMessageDelivery] \226\128\147 When set to [true], enables raw message \
         delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to \
         process JSON formatting, which is otherwise created for Amazon SNS metadata.\n\
        \            \n\
        \             }\n\
        \        {-   [RedrivePolicy] \226\128\147 When specified, sends undeliverable messages to \
         the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to \
         client errors (for example, when the subscribed endpoint is unreachable) or server errors \
         (for example, when the service that powers the subscribed endpoint becomes unavailable) \
         are held in the dead-letter queue for further analysis or reprocessing.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following attribute applies only to Amazon Data Firehose delivery stream \
         subscriptions:\n\
        \   \n\
        \    {ul\n\
        \          {-   [SubscriptionRoleArn] \226\128\147 The ARN of the IAM role that has the \
         following:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Permission to write to the Firehose delivery stream\n\
        \                         \n\
        \                          }\n\
        \                     {-  Amazon SNS listed as a trusted entity\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            Specifying a valid ARN for this attribute is required for Firehose delivery \
         stream subscriptions. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html}Fanout to \
         Firehose delivery streams} in the {i Amazon SNS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \          }\n\
        \   The following attributes apply only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html}FIFO topics}:\n\
        \   \n\
        \    {ul\n\
        \          {-   [ReplayPolicy] \226\128\147 Adds or updates an inline policy document for \
         a subscription to replay messages stored in the specified Amazon SNS topic.\n\
        \              \n\
        \               }\n\
        \          {-   [ReplayStatus] \226\128\147 Retrieves the status of the subscription \
         message replay, which can be one of the following:\n\
        \              \n\
        \               {ul\n\
        \                     {-   [Completed] \226\128\147 The replay has successfully \
         redelivered all messages, and is now delivering newly published messages. If an ending \
         point was specified in the [ReplayPolicy] then the subscription will no longer receive \
         newly published messages.\n\
        \                         \n\
        \                          }\n\
        \                     {-   [In progress] \226\128\147 The replay is currently replaying \
         the selected messages.\n\
        \                         \n\
        \                          }\n\
        \                     {-   [Failed] \226\128\147 The replay was unable to complete.\n\
        \                         \n\
        \                          }\n\
        \                     {-   [Pending] \226\128\147 The default state while the replay \
         initiates.\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \  "]
  return_subscription_arn : boolean_ option;
      [@ocaml.doc
        "Sets whether the response from the [Subscribe] request includes the subscription ARN, \
         even if the subscription is not yet confirmed.\n\n\
        \ If you set this parameter to [true], the response includes the ARN in all cases, even if \
         the subscription is not yet confirmed. In addition to the ARN for confirmed \
         subscriptions, the response also includes the [pending\n\
        \                subscription] ARN value for subscriptions that aren't yet confirmed. A \
         subscription becomes confirmed when the subscriber calls the [ConfirmSubscription] action \
         with a confirmation token.\n\
        \ \n\
        \  \n\
        \  \n\
        \   The default value is [false].\n\
        \   "]
}
[@@ocaml.doc "Input for Subscribe action.\n"]

type nonrec set_topic_attributes_input = {
  topic_arn : topic_ar_n; [@ocaml.doc "The ARN of the topic to modify.\n"]
  attribute_name : attribute_name;
      [@ocaml.doc
        "A map of attributes with their corresponding values.\n\n\
        \ The following lists the names, descriptions, and values of the special request \
         parameters that the [SetTopicAttributes] action uses:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DeliveryPolicy] \226\128\147 The policy that defines how Amazon SNS retries \
         failed deliveries to HTTP/S endpoints.\n\
        \            \n\
        \             }\n\
        \        {-   [DisplayName] \226\128\147 The display name to use for a topic with SMS \
         subscriptions.\n\
        \            \n\
        \             }\n\
        \        {-   [Policy] \226\128\147 The policy that defines who can access your topic. By \
         default, only the topic owner can publish or subscribe to the topic.\n\
        \            \n\
        \             }\n\
        \        {-   [TracingConfig] \226\128\147 Tracing mode of an Amazon SNS topic. By default \
         [TracingConfig] is set to [PassThrough], and the topic passes through the tracing header \
         it receives from an Amazon SNS publisher to its subscriptions. If set to [Active], Amazon \
         SNS will vend X-Ray segment data to topic owner account if the sampled flag in the \
         tracing header is true. This is only supported on standard topics.\n\
        \            \n\
        \             }\n\
        \        {-  HTTP\n\
        \            \n\
        \             {ul\n\
        \                   {-   [HTTPSuccessFeedbackRoleArn] \226\128\147 Indicates successful \
         message delivery status for an Amazon SNS topic that is subscribed to an HTTP endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   {-   [HTTPSuccessFeedbackSampleRate] \226\128\147 Indicates percentage \
         of successful messages to sample for an Amazon SNS topic that is subscribed to an HTTP \
         endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [HTTPFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an HTTP endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Amazon Data Firehose\n\
        \            \n\
        \             {ul\n\
        \                   {-   [FirehoseSuccessFeedbackRoleArn] \226\128\147 Indicates \
         successful message delivery status for an Amazon SNS topic that is subscribed to an \
         Amazon Data Firehose endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [FirehoseSuccessFeedbackSampleRate] \226\128\147 Indicates \
         percentage of successful messages to sample for an Amazon SNS topic that is subscribed to \
         an Amazon Data Firehose endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [FirehoseFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an Amazon Data \
         Firehose endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Lambda\n\
        \            \n\
        \             {ul\n\
        \                   {-   [LambdaSuccessFeedbackRoleArn] \226\128\147 Indicates successful \
         message delivery status for an Amazon SNS topic that is subscribed to an Lambda endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [LambdaSuccessFeedbackSampleRate] \226\128\147 Indicates \
         percentage of successful messages to sample for an Amazon SNS topic that is subscribed to \
         an Lambda endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [LambdaFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an Lambda endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Platform application endpoint\n\
        \            \n\
        \             {ul\n\
        \                   {-   [ApplicationSuccessFeedbackRoleArn] \226\128\147 Indicates \
         successful message delivery status for an Amazon SNS topic that is subscribed to an \
         platform application endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [ApplicationSuccessFeedbackSampleRate] \226\128\147 Indicates \
         percentage of successful messages to sample for an Amazon SNS topic that is subscribed to \
         an platform application endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [ApplicationFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an platform \
         application endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \           In addition to being able to configure topic attributes for message delivery \
         status of notification messages sent to Amazon SNS application endpoints, you can also \
         configure application attributes for the delivery status of push notification messages \
         sent to push notification services.\n\
        \           \n\
        \            For example, For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html}Using Amazon SNS \
         Application Attributes for Message Delivery Status}. \n\
        \            \n\
        \              }\n\
        \        {-  Amazon SQS\n\
        \            \n\
        \             {ul\n\
        \                   {-   [SQSSuccessFeedbackRoleArn] \226\128\147 Indicates successful \
         message delivery status for an Amazon SNS topic that is subscribed to an Amazon SQS \
         endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   {-   [SQSSuccessFeedbackSampleRate] \226\128\147 Indicates percentage \
         of successful messages to sample for an Amazon SNS topic that is subscribed to an Amazon \
         SQS endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   {-   [SQSFailureFeedbackRoleArn] \226\128\147 Indicates failed message \
         delivery status for an Amazon SNS topic that is subscribed to an Amazon SQS endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    The SuccessFeedbackRoleArn and FailureFeedbackRoleArn attributes are used to give \
         Amazon SNS write access to use CloudWatch Logs on your behalf. The \
         SuccessFeedbackSampleRate attribute is for specifying the sample rate percentage (0-100) \
         of successfully delivered messages. After you configure the FailureFeedbackRoleArn \
         attribute, then all failed message deliveries generate CloudWatch Logs. \n\
        \    \n\
        \      The following attribute applies only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html}server-side-encryption}:\n\
        \      \n\
        \       {ul\n\
        \             {-   [KmsMasterKeyId] \226\128\147 The ID of an Amazon Web Services managed \
         customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms}Key \
         Terms}. For more examples, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} \
         in the {i Key Management Service API Reference}. \n\
        \                 \n\
        \                  }\n\
        \             {-   [SignatureVersion] \226\128\147 The signature version corresponds to \
         the hashing algorithm used while creating the signature of the notifications, \
         subscription confirmations, or unsubscribe confirmation messages sent by Amazon SNS. By \
         default, [SignatureVersion] is set to [1].\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \   The following attribute applies only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html}FIFO topics}:\n\
        \   \n\
        \    {ul\n\
        \          {-   [ArchivePolicy] \226\128\147 The policy that sets the retention period for \
         messages stored in the message archive of an Amazon SNS FIFO topic.\n\
        \              \n\
        \               }\n\
        \          {-   [ContentBasedDeduplication] \226\128\147 Enables content-based \
         deduplication for FIFO topics.\n\
        \              \n\
        \               {ul\n\
        \                     {-  By default, [ContentBasedDeduplication] is set to [false]. If \
         you create a FIFO topic and this attribute is [false], you must specify a value for the \
         [MessageDeduplicationId] parameter for the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_Publish.html}Publish} action. \n\
        \                         \n\
        \                          }\n\
        \                     {-  When you set [ContentBasedDeduplication] to [true], Amazon SNS \
         uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the \
         message (but not the attributes of the message).\n\
        \                         \n\
        \                          (Optional) To override the generated value, you can specify a \
         value for the [MessageDeduplicationId] parameter for the [Publish] action.\n\
        \                          \n\
        \                           }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \   {ul\n\
        \         {-   [FifoThroughputScope] \226\128\147 Enables higher throughput for your FIFO \
         topic by adjusting the scope of deduplication. This attribute has two possible values:\n\
        \             \n\
        \              {ul\n\
        \                    {-   [Topic] \226\128\147 The scope of message deduplication is \
         across the entire topic. This is the default value and maintains existing behavior, with \
         a maximum throughput of 3000 messages per second or 20MB per second, whichever comes \
         first.\n\
        \                        \n\
        \                         }\n\
        \                    {-   [MessageGroup] \226\128\147 The scope of deduplication is within \
         each individual message group, which enables higher throughput per topic subject to \
         regional quotas. For more information on quotas or to request an increase, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/sns.html}Amazon SNS service quotas} in \
         the Amazon Web Services General Reference.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \          }\n\
        \           }\n\
        \         }\n\
        \  "]
  attribute_value : attribute_value option; [@ocaml.doc "The new value for the attribute.\n"]
}
[@@ocaml.doc "Input for SetTopicAttributes action.\n"]

type nonrec set_subscription_attributes_input = {
  subscription_arn : subscription_ar_n; [@ocaml.doc "The ARN of the subscription to modify.\n"]
  attribute_name : attribute_name;
      [@ocaml.doc
        "A map of attributes with their corresponding values.\n\n\
        \ The following lists the names, descriptions, and values of the special request \
         parameters that this action uses:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DeliveryPolicy] \226\128\147 The policy that defines how Amazon SNS retries \
         failed deliveries to HTTP/S endpoints.\n\
        \            \n\
        \             }\n\
        \        {-   [FilterPolicy] \226\128\147 The simple JSON object that lets your subscriber \
         receive only a subset of messages, rather than receiving every message published to the \
         topic.\n\
        \            \n\
        \             }\n\
        \        {-   [FilterPolicyScope] \226\128\147 This attribute lets you choose the \
         filtering scope by using one of the following string value types:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [MessageAttributes] (default) \226\128\147 The filter is applied \
         on the message attributes.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [MessageBody] \226\128\147 The filter is applied on the message \
         body.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-   [RawMessageDelivery] \226\128\147 When set to [true], enables raw message \
         delivery to Amazon SQS or HTTP/S endpoints. This eliminates the need for the endpoints to \
         process JSON formatting, which is otherwise created for Amazon SNS metadata.\n\
        \            \n\
        \             }\n\
        \        {-   [RedrivePolicy] \226\128\147 When specified, sends undeliverable messages to \
         the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to \
         client errors (for example, when the subscribed endpoint is unreachable) or server errors \
         (for example, when the service that powers the subscribed endpoint becomes unavailable) \
         are held in the dead-letter queue for further analysis or reprocessing.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following attribute applies only to Amazon Data Firehose delivery stream \
         subscriptions:\n\
        \   \n\
        \    {ul\n\
        \          {-   [SubscriptionRoleArn] \226\128\147 The ARN of the IAM role that has the \
         following:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Permission to write to the Firehose delivery stream\n\
        \                         \n\
        \                          }\n\
        \                     {-  Amazon SNS listed as a trusted entity\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            Specifying a valid ARN for this attribute is required for Firehose delivery \
         stream subscriptions. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html}Fanout to \
         Firehose delivery streams} in the {i Amazon SNS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \          }\n\
        \  "]
  attribute_value : attribute_value option;
      [@ocaml.doc "The new value for the attribute in JSON format.\n"]
}
[@@ocaml.doc "Input for SetSubscriptionAttributes action.\n"]

type nonrec set_sms_attributes_response = unit [@@ocaml.doc ""]

type nonrec map_string_to_string = (string_ * string_) list [@@ocaml.doc ""]

type nonrec set_sms_attributes_input = {
  attributes : map_string_to_string;
      [@ocaml.doc
        "The default settings for sending SMS messages from your Amazon Web Services account. You \
         can set values for the following attribute names:\n\n\
        \  [MonthlySpendLimit] \226\128\147 The maximum amount in USD that you are willing to \
         spend each month to send SMS messages. When Amazon SNS determines that sending an SMS \
         message would incur a cost that exceeds this limit, it stops sending SMS messages within \
         minutes.\n\
        \ \n\
        \   Amazon SNS stops sending SMS messages within minutes of the limit being crossed. \
         During that interval, if you continue to send SMS messages, you will incur costs that \
         exceed your limit.\n\
        \   \n\
        \     By default, the spend limit is set to the maximum allowed by Amazon SNS. If you want \
         to raise the limit, submit an \
         {{:https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sns}SNS \
         Limit Increase case}. For {b New limit value}, enter your desired monthly spend limit. In \
         the {b Use Case Description} field, explain that you are requesting an SMS monthly spend \
         limit increase.\n\
        \     \n\
        \       [DeliveryStatusIAMRole] \226\128\147 The ARN of the IAM role that allows Amazon \
         SNS to write logs about SMS deliveries in CloudWatch Logs. For each SMS message that you \
         send, Amazon SNS writes a log that includes the message price, the success or failure \
         status, the reason for failure (if the message failed), the message dwell time, and other \
         information.\n\
        \      \n\
        \        [DeliveryStatusSuccessSamplingRate] \226\128\147 The percentage of successful SMS \
         deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value can be an \
         integer from 0 - 100. For example, to write logs only for failed deliveries, set this \
         value to [0]. To write logs for 10% of your successful deliveries, set it to [10].\n\
        \       \n\
        \         [DefaultSenderID] \226\128\147 A string, such as your business brand, that is \
         displayed as the sender on the receiving device. Support for sender IDs varies by \
         country. The sender ID can be 1 - 11 alphanumeric characters, and it must contain at \
         least one letter.\n\
        \        \n\
        \          [DefaultSMSType] \226\128\147 The type of SMS message that you will send by \
         default. You can assign the following values:\n\
        \         \n\
        \          {ul\n\
        \                {-   [Promotional] \226\128\147 (Default) Noncritical messages, such as \
         marketing messages. Amazon SNS optimizes the message delivery to incur the lowest cost.\n\
        \                    \n\
        \                     }\n\
        \                {-   [Transactional] \226\128\147 Critical messages that support customer \
         transactions, such as one-time passcodes for multi-factor authentication. Amazon SNS \
         optimizes the message delivery to achieve the highest reliability.\n\
        \                    \n\
        \                     }\n\
        \                }\n\
        \    [UsageReportS3Bucket] \226\128\147 The name of the Amazon S3 bucket to receive daily \
         SMS usage reports from Amazon SNS. Each day, Amazon SNS will deliver a usage report as a \
         CSV file to the bucket. The report includes the following information for each SMS \
         message that was successfully delivered by your Amazon Web Services account:\n\
        \   \n\
        \    {ul\n\
        \          {-  Time that the message was published (in UTC)\n\
        \              \n\
        \               }\n\
        \          {-  Message ID\n\
        \              \n\
        \               }\n\
        \          {-  Destination phone number\n\
        \              \n\
        \               }\n\
        \          {-  Message type\n\
        \              \n\
        \               }\n\
        \          {-  Delivery status\n\
        \              \n\
        \               }\n\
        \          {-  Message price (in USD)\n\
        \              \n\
        \               }\n\
        \          {-  Part number (a message is split into multiple parts if it is too long for a \
         single message)\n\
        \              \n\
        \               }\n\
        \          {-  Total number of parts\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To receive the report, the bucket must have a policy that allows the Amazon SNS \
         service principal to perform the [s3:PutObject] and [s3:GetBucketLocation] actions.\n\
        \   \n\
        \    For an example bucket policy and usage report, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sms_stats.html}Monitoring SMS Activity} in \
         the {i Amazon SNS Developer Guide}.\n\
        \    "]
}
[@@ocaml.doc "The input for the SetSMSAttributes action.\n"]

type nonrec set_platform_application_attributes_input = {
  platform_application_arn : string_;
      [@ocaml.doc " [PlatformApplicationArn] for [SetPlatformApplicationAttributes] action.\n"]
  attributes : map_string_to_string;
      [@ocaml.doc
        "A map of the platform application attributes. Attributes in this map include the \
         following:\n\n\
        \ {ul\n\
        \       {-   [PlatformCredential] \226\128\147 The credential received from the \
         notification service.\n\
        \           \n\
        \            {ul\n\
        \                  {-  For ADM, [PlatformCredential]is client secret.\n\
        \                      \n\
        \                       }\n\
        \                  {-  For Apple Services using certificate credentials, \
         [PlatformCredential] is private key.\n\
        \                      \n\
        \                       }\n\
        \                  {-  For Apple Services using token credentials, [PlatformCredential] is \
         signing key.\n\
        \                      \n\
        \                       }\n\
        \                  {-  For GCM (Firebase Cloud Messaging) using key credentials, there is \
         no [PlatformPrincipal]. The [PlatformCredential] is [API key].\n\
        \                      \n\
        \                       }\n\
        \                  {-  For GCM (Firebase Cloud Messaging) using token credentials, there \
         is no [PlatformPrincipal]. The [PlatformCredential] is a JSON formatted private key file. \
         When using the Amazon Web Services CLI, the file must be in string format and special \
         characters must be ignored. To format the file correctly, Amazon SNS recommends using the \
         following command: [SERVICE_JSON=`jq @json <<< cat\n\
        \                            service.json`].\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \   {ul\n\
        \         {-   [PlatformPrincipal] \226\128\147 The principal received from the \
         notification service.\n\
        \             \n\
        \              {ul\n\
        \                    {-  For ADM, [PlatformPrincipal]is client id.\n\
        \                        \n\
        \                         }\n\
        \                    {-  For Apple Services using certificate credentials, \
         [PlatformPrincipal] is SSL certificate.\n\
        \                        \n\
        \                         }\n\
        \                    {-  For Apple Services using token credentials, [PlatformPrincipal] \
         is signing key ID.\n\
        \                        \n\
        \                         }\n\
        \                    {-  For GCM (Firebase Cloud Messaging), there is no \
         [PlatformPrincipal]. \n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \          }\n\
        \           }\n\
        \         }\n\
        \   {ul\n\
        \         {-   [EventEndpointCreated] \226\128\147 Topic ARN to which [EndpointCreated] \
         event notifications are sent.\n\
        \             \n\
        \              }\n\
        \         {-   [EventEndpointDeleted] \226\128\147 Topic ARN to which [EndpointDeleted] \
         event notifications are sent.\n\
        \             \n\
        \              }\n\
        \         {-   [EventEndpointUpdated] \226\128\147 Topic ARN to which [EndpointUpdate] \
         event notifications are sent.\n\
        \             \n\
        \              }\n\
        \         {-   [EventDeliveryFailure] \226\128\147 Topic ARN to which [DeliveryFailure] \
         event notifications are sent upon Direct Publish delivery failure (permanent) to one of \
         the application's endpoints.\n\
        \             \n\
        \              }\n\
        \         {-   [SuccessFeedbackRoleArn] \226\128\147 IAM role ARN used to give Amazon SNS \
         write access to use CloudWatch Logs on your behalf.\n\
        \             \n\
        \              }\n\
        \         {-   [FailureFeedbackRoleArn] \226\128\147 IAM role ARN used to give Amazon SNS \
         write access to use CloudWatch Logs on your behalf.\n\
        \             \n\
        \              }\n\
        \         {-   [SuccessFeedbackSampleRate] \226\128\147 Sample rate percentage (0-100) of \
         successfully delivered messages.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   The following attributes only apply to [APNs] token-based authentication:\n\
        \   \n\
        \    {ul\n\
        \          {-   [ApplePlatformTeamID] \226\128\147 The identifier that's assigned to your \
         Apple developer account team.\n\
        \              \n\
        \               }\n\
        \          {-   [ApplePlatformBundleID] \226\128\147 The bundle identifier that's assigned \
         to your iOS app.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Input for [SetPlatformApplicationAttributes] action.\n"]

type nonrec set_endpoint_attributes_input = {
  endpoint_arn : string_; [@ocaml.doc "EndpointArn used for [SetEndpointAttributes] action.\n"]
  attributes : map_string_to_string;
      [@ocaml.doc
        "A map of the endpoint attributes. Attributes in this map include the following:\n\n\
        \ {ul\n\
        \       {-   [CustomUserData] \226\128\147 arbitrary user data to associate with the \
         endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less \
         than 2KB.\n\
        \           \n\
        \            }\n\
        \       {-   [Enabled] \226\128\147 flag that enables/disables delivery to the endpoint. \
         Amazon SNS will set this to false when a notification service indicates to Amazon SNS \
         that the endpoint is invalid. Users can set it back to true, typically after updating \
         Token.\n\
        \           \n\
        \            }\n\
        \       {-   [Token] \226\128\147 device token, also referred to as a registration id, for \
         an app and mobile device. This is returned from the notification service when an app and \
         mobile device are registered with the notification service.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Input for [SetEndpointAttributes] action.\n"]

type nonrec remove_permission_input = {
  topic_arn : topic_ar_n;
      [@ocaml.doc "The ARN of the topic whose access control policy you wish to modify.\n"]
  label : label; [@ocaml.doc "The unique label of the statement you want to remove.\n"]
}
[@@ocaml.doc "Input for RemovePermission action.\n"]

type nonrec put_data_protection_policy_input = {
  resource_arn : topic_ar_n;
      [@ocaml.doc
        "The ARN of the topic whose [DataProtectionPolicy] you want to add or update.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the Amazon Web Services General Reference.\n\
        \ "]
  data_protection_policy : attribute_value;
      [@ocaml.doc
        "The JSON serialization of the topic's [DataProtectionPolicy].\n\n\
        \ The [DataProtectionPolicy] must be in JSON string format.\n\
        \ \n\
        \  Length Constraints: Maximum length of 30,720.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec validation_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "Indicates that a parameter in the request is invalid.\n"]

type nonrec too_many_entries_in_batch_request_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc " The batch request contains more entries than permissible (more than 10).\n"]

type nonrec platform_application_disabled_exception = {
  message : string_ option; [@ocaml.doc "Message for platform application disabled.\n"]
}
[@@ocaml.doc "Exception error indicating platform application disabled.\n"]

type nonrec kms_throttling_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was denied due to request throttling. For more information about throttling, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#requests-per-second}Limits} \
   in the {i Key Management Service Developer Guide.} \n"]

type nonrec kms_opt_in_required = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The Amazon Web Services access key ID needs a subscription for the service.\n"]

type nonrec kms_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The request was rejected because the specified entity or resource can't be found.\n"]

type nonrec kms_invalid_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because the state of the specified resource isn't valid for this \
   request. For more information, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key states of Amazon \
   Web Services KMS keys} in the {i Key Management Service Developer Guide}.\n"]

type nonrec kms_disabled_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was rejected because the specified Amazon Web Services KMS key isn't enabled.\n"]

type nonrec kms_access_denied_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The ciphertext references a key that doesn't exist or that you don't have access to.\n"]

type nonrec invalid_parameter_value_exception = {
  message : string_ option;
      [@ocaml.doc "The parameter of an entry in a request doesn't abide by the specification. \n"]
}
[@@ocaml.doc
  "Indicates that a request parameter does not comply with the associated constraints.\n"]

type nonrec invalid_batch_entry_id_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The [Id] of a batch entry in a batch request doesn't abide by the specification. \n"]

type nonrec endpoint_disabled_exception = {
  message : string_ option; [@ocaml.doc "Message for endpoint disabled.\n"]
}
[@@ocaml.doc "Exception error indicating endpoint disabled.\n"]

type nonrec empty_batch_request_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The batch request doesn't contain any entries.\n"]

type nonrec batch_request_too_long_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The length of all the batch messages put together is more than the limit.\n"]

type nonrec batch_entry_ids_not_distinct_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Two or more batch entries in the request have the same [Id].\n"]

type nonrec batch_result_error_entry = {
  id : string_; [@ocaml.doc "The [Id] of an entry in a batch request\n"]
  code : string_; [@ocaml.doc "An error code representing why the action failed on this entry.\n"]
  message : string_ option;
      [@ocaml.doc "A message explaining why the action failed on this entry.\n"]
  sender_fault : boolean_;
      [@ocaml.doc
        "Specifies whether the error happened due to the caller of the batch API action.\n"]
}
[@@ocaml.doc "Gives a detailed description of failed messages in the batch.\n"]

type nonrec batch_result_error_entry_list = batch_result_error_entry list [@@ocaml.doc ""]

type nonrec message_id = string [@@ocaml.doc ""]

type nonrec publish_batch_result_entry = {
  id : string_ option; [@ocaml.doc "The [Id] of an entry in a batch request.\n"]
  message_id : message_id option; [@ocaml.doc "An identifier for the message.\n"]
  sequence_number : string_ option;
      [@ocaml.doc
        "This parameter applies only to FIFO (first-in-first-out) topics.\n\n\
        \ The large, non-consecutive number that Amazon SNS assigns to each message.\n\
        \ \n\
        \  The length of [SequenceNumber] is 128 bits. [SequenceNumber] continues to increase for \
         a particular [MessageGroupId].\n\
        \  "]
}
[@@ocaml.doc "Encloses data related to a successful message in a batch request for topic.\n"]

type nonrec publish_batch_result_entry_list = publish_batch_result_entry list [@@ocaml.doc ""]

type nonrec publish_batch_response = {
  successful : publish_batch_result_entry_list option;
      [@ocaml.doc "A list of successful [PublishBatch] responses.\n"]
  failed : batch_result_error_entry_list option;
      [@ocaml.doc "A list of failed [PublishBatch] responses. \n"]
}
[@@ocaml.doc ""]

type nonrec binary = bytes [@@ocaml.doc ""]

type nonrec message_attribute_value = {
  data_type : string_;
      [@ocaml.doc
        "Amazon SNS supports the following logical data types: String, String.Array, Number, and \
         Binary. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes}Message \
         Attribute Data Types}.\n"]
  string_value : string_ option;
      [@ocaml.doc
        "Strings are Unicode with UTF8 binary encoding. For a list of code values, see \
         {{:https://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters}ASCII Printable \
         Characters}.\n"]
  binary_value : binary option;
      [@ocaml.doc
        "Binary type attributes can store any binary data, for example, compressed data, encrypted \
         data, or images.\n"]
}
[@@ocaml.doc
  "The user-specified message attribute value. For string data types, the value attribute has the \
   same restrictions on the content as the message body. For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/api/API_Publish.html}Publish}.\n\n\
  \ Name, type, and value must not be empty or null. In addition, the message body should not be \
   empty or null. All parts of the message attribute, including name, type, and value, are \
   included in the message size restriction, which is currently 256 KB (262,144 bytes). For more \
   information, see {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html}Amazon \
   SNS message attributes} and \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html}Publishing to a mobile \
   phone} in the {i Amazon SNS Developer Guide.} \n\
  \ "]

type nonrec message_attribute_map = (string_ * message_attribute_value) list [@@ocaml.doc ""]

type nonrec message_structure = string [@@ocaml.doc ""]

type nonrec subject = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec publish_batch_request_entry = {
  id : string_;
      [@ocaml.doc
        "An identifier for the message in this batch.\n\n\
        \  The [Ids] of a batch request must be unique within a request. \n\
        \  \n\
        \   This identifier can have up to 80 characters. The following characters are accepted: \
         alphanumeric characters, hyphens(-), and underscores (_). \n\
        \   \n\
        \    "]
  message : message; [@ocaml.doc "The body of the message.\n"]
  subject : subject option; [@ocaml.doc "The subject of the batch message.\n"]
  message_structure : message_structure option;
      [@ocaml.doc
        "Set [MessageStructure] to [json] if you want to send a different message for each \
         protocol. For example, using one publish action, you can send a short message to your SMS \
         subscribers and a longer message to your email subscribers. If you set [MessageStructure] \
         to [json], the value of the [Message] parameter must: \n\n\
        \ {ul\n\
        \       {-  be a syntactically valid JSON object; and\n\
        \           \n\
        \            }\n\
        \       {-  contain at least a top-level JSON key of \"default\" with a value that is a \
         string.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can define other top-level keys that define the message you want to send to a \
         specific transport protocol (for example, http). \n\
        \   "]
  message_attributes : message_attribute_map option;
      [@ocaml.doc
        "Each message attribute consists of a [Name], [Type], and [Value]. For more information, \
         see {{:https://docs.aws.amazon.com/sns/latest/dg/sns-message-attributes.html}Amazon SNS \
         message attributes} in the Amazon SNS Developer Guide.\n"]
  message_deduplication_id : string_ option;
      [@ocaml.doc
        "This parameter applies only to FIFO (first-in-first-out) topics.\n\n\
        \ {ul\n\
        \       {-  This parameter applies only to FIFO (first-in-first-out) topics. The \
         [MessageDeduplicationId] can contain up to 128 alphanumeric characters [(a-z, A-Z, 0-9)] \
         and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n\
        \           \n\
        \            }\n\
        \       {-  Every message must have a unique [MessageDeduplicationId], which is a token \
         used for deduplication of sent messages within the 5 minute minimum deduplication \
         interval.\n\
        \           \n\
        \            }\n\
        \       {-  The scope of deduplication depends on the [FifoThroughputScope] attribute, \
         when set to [Topic] the message deduplication scope is across the entire topic, when set \
         to [MessageGroup] the message deduplication scope is within each individual message \
         group. \n\
        \           \n\
        \            }\n\
        \       {-  If a message with a particular [MessageDeduplicationId] is sent successfully, \
         subsequent messages within the deduplication scope and interval, with the same \
         [MessageDeduplicationId], are accepted successfully but aren't delivered.\n\
        \           \n\
        \            }\n\
        \       {-  Every message must have a unique [MessageDeduplicationId].\n\
        \           \n\
        \            {ul\n\
        \                  {-  You may provide a [MessageDeduplicationId] explicitly.\n\
        \                      \n\
        \                       }\n\
        \                  {-  If you aren't able to provide a [MessageDeduplicationId] and you \
         enable [ContentBasedDeduplication] for your topic, Amazon SNS uses a SHA-256 hash to \
         generate the [MessageDeduplicationId] using the body of the message (but not the \
         attributes of the message).\n\
        \                      \n\
        \                       }\n\
        \                  {-  If you don't provide a [MessageDeduplicationId] and the topic \
         doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n\
        \                      \n\
        \                       }\n\
        \                  {-  If the topic has a [ContentBasedDeduplication] set, your \
         [MessageDeduplicationId] overrides the generated one. \n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  When [ContentBasedDeduplication] is in effect, messages with identical content \
         sent within the deduplication scope and interval are treated as duplicates and only one \
         copy of the message is delivered.\n\
        \           \n\
        \            }\n\
        \       {-  If you send one message with [ContentBasedDeduplication] enabled, and then \
         another message with a [MessageDeduplicationId] that is the same as the one generated for \
         the first [MessageDeduplicationId], the two messages are treated as duplicates, within \
         the deduplication scope and interval, and only one copy of the message is delivered. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [MessageDeduplicationId] is available to the consumer of the message (this can be \
         useful for troubleshooting delivery issues).\n\
        \    \n\
        \     If a message is sent successfully but the acknowledgement is lost and the message is \
         resent with the same [MessageDeduplicationId] after the deduplication interval, Amazon \
         SNS can't detect duplicate messages. \n\
        \     \n\
        \      Amazon SNS continues to keep track of the message deduplication ID even after the \
         message is received and deleted. \n\
        \      \n\
        \       "]
  message_group_id : string_ option;
      [@ocaml.doc
        "FIFO topics: The tag that specifies that a message belongs to a specific message group. \
         Messages that belong to the same message group are processed in a FIFO manner (however, \
         messages in different message groups might be processed out of order). To interleave \
         multiple ordered streams within a single topic, use [MessageGroupId] values (for example, \
         session data for multiple users). In this scenario, multiple consumers can process the \
         topic, but the session data of each user is processed in a FIFO fashion. You must \
         associate a non-empty [MessageGroupId] with a message. If you do not provide a \
         [MessageGroupId], the action fails. \n\n\
        \ Standard topics: The [MessageGroupId] is optional and is forwarded only to Amazon SQS \
         standard subscriptions to activate \
         {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-fair-queues.html}fair \
         queues}. The [MessageGroupId] is not used for, or sent to, any other endpoint types.\n\
        \ \n\
        \  The length of [MessageGroupId] is 128 characters.\n\
        \  \n\
        \    [MessageGroupId] can contain alphanumeric characters [(a-z, A-Z,\n\
        \                0-9)] and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n\
        \   "]
}
[@@ocaml.doc
  "Contains the details of a single Amazon SNS message along with an [Id] that identifies a \
   message within the batch. \n"]

type nonrec publish_batch_request_entry_list = publish_batch_request_entry list [@@ocaml.doc ""]

type nonrec publish_batch_input = {
  topic_arn : topic_ar_n;
      [@ocaml.doc "The Amazon resource name (ARN) of the topic you want to batch publish to.\n"]
  publish_batch_request_entries : publish_batch_request_entry_list;
      [@ocaml.doc "A list of [PublishBatch] request entries to be sent to the SNS topic.\n"]
}
[@@ocaml.doc ""]

type nonrec publish_response = {
  message_id : message_id option;
      [@ocaml.doc
        "Unique identifier assigned to the published message.\n\n\
        \ Length Constraint: Maximum 100 characters\n\
        \ "]
  sequence_number : string_ option;
      [@ocaml.doc
        "This response element applies only to FIFO (first-in-first-out) topics. \n\n\
        \ The sequence number is a large, non-consecutive number that Amazon SNS assigns to each \
         message. The length of [SequenceNumber] is 128 bits. [SequenceNumber] continues to \
         increase for each [MessageGroupId].\n\
        \ "]
}
[@@ocaml.doc "Response for Publish action.\n"]

type nonrec phone_number = string [@@ocaml.doc ""]

type nonrec publish_input = {
  topic_arn : topic_ar_n option;
      [@ocaml.doc
        "The topic you want to publish to.\n\n\
        \ If you don't specify a value for the [TopicArn] parameter, you must specify a value for \
         the [PhoneNumber] or [TargetArn] parameters.\n\
        \ "]
  target_arn : string_ option;
      [@ocaml.doc
        "If you don't specify a value for the [TargetArn] parameter, you must specify a value for \
         the [PhoneNumber] or [TopicArn] parameters.\n"]
  phone_number : phone_number option;
      [@ocaml.doc
        "The phone number to which you want to deliver an SMS message. Use E.164 format.\n\n\
        \ If you don't specify a value for the [PhoneNumber] parameter, you must specify a value \
         for the [TargetArn] or [TopicArn] parameters.\n\
        \ "]
  message : message;
      [@ocaml.doc
        "The message you want to send.\n\n\
        \ If you are publishing to a topic and you want to send the same message to all transport \
         protocols, include the text of the message as a String value. If you want to send \
         different messages for each transport protocol, set the value of the [MessageStructure] \
         parameter to [json] and use a JSON object for the [Message] parameter. \n\
        \ \n\
        \  \n\
        \  \n\
        \   Constraints:\n\
        \   \n\
        \    {ul\n\
        \          {-  With the exception of SMS, messages must be UTF-8 encoded strings and at \
         most 256 KB in size (262,144 bytes, not 262,144 characters).\n\
        \              \n\
        \               }\n\
        \          {-  For SMS, each message can contain up to 140 characters. This character \
         limit depends on the encoding schema. For example, an SMS message can contain 160 GSM \
         characters, 140 ASCII characters, or 70 UCS-2 characters.\n\
        \              \n\
        \               If you publish a message that exceeds this size limit, Amazon SNS sends \
         the message as multiple messages, each fitting within the size limit. Messages aren't \
         truncated mid-word but are cut off at whole-word boundaries.\n\
        \               \n\
        \                The total size limit for a single SMS [Publish] action is 1,600 characters.\n\
        \                \n\
        \                 }\n\
        \          }\n\
        \   JSON-specific constraints:\n\
        \   \n\
        \    {ul\n\
        \          {-  Keys in the JSON object that correspond to supported transport protocols \
         must have simple JSON string values.\n\
        \              \n\
        \               }\n\
        \          {-  The values will be parsed (unescaped) before they are used in outgoing \
         messages.\n\
        \              \n\
        \               }\n\
        \          {-  Outbound notifications are JSON encoded (meaning that the characters will \
         be reescaped for sending).\n\
        \              \n\
        \               }\n\
        \          {-  Values have a minimum length of 0 (the empty string, \"\", is allowed).\n\
        \              \n\
        \               }\n\
        \          {-  Values have a maximum length bounded by the overall message size (so, \
         including multiple protocols may limit message sizes).\n\
        \              \n\
        \               }\n\
        \          {-  Non-string values will cause the key to be ignored.\n\
        \              \n\
        \               }\n\
        \          {-  Keys that do not correspond to supported transport protocols are ignored.\n\
        \              \n\
        \               }\n\
        \          {-  Duplicate keys are not allowed.\n\
        \              \n\
        \               }\n\
        \          {-  Failure to parse or validate any key or value in the message will cause the \
         [Publish] call to return an error (no partial delivery).\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  subject : subject option;
      [@ocaml.doc
        "Optional parameter to be used as the \"Subject\" line when the message is delivered to \
         email endpoints. This field will also be included, if present, in the standard JSON \
         messages delivered to other endpoints.\n\n\
        \ Constraints: Subjects must be UTF-8 text with no line breaks or control characters, and \
         less than 100 characters long.\n\
        \ "]
  message_structure : message_structure option;
      [@ocaml.doc
        "Set [MessageStructure] to [json] if you want to send a different message for each \
         protocol. For example, using one publish action, you can send a short message to your SMS \
         subscribers and a longer message to your email subscribers. If you set [MessageStructure] \
         to [json], the value of the [Message] parameter must: \n\n\
        \ {ul\n\
        \       {-  be a syntactically valid JSON object; and\n\
        \           \n\
        \            }\n\
        \       {-  contain at least a top-level JSON key of \"default\" with a value that is a \
         string.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can define other top-level keys that define the message you want to send to a \
         specific transport protocol (e.g., \"http\").\n\
        \   \n\
        \    Valid value: [json] \n\
        \    "]
  message_attributes : message_attribute_map option;
      [@ocaml.doc "Message attributes for Publish action.\n"]
  message_deduplication_id : string_ option;
      [@ocaml.doc
        "{ul\n\
        \      {-  This parameter applies only to FIFO (first-in-first-out) topics. The \
         [MessageDeduplicationId] can contain up to 128 alphanumeric characters [(a-z, A-Z, 0-9)] \
         and punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n\
        \          \n\
        \           }\n\
        \      {-  Every message must have a unique [MessageDeduplicationId], which is a token \
         used for deduplication of sent messages within the 5 minute minimum deduplication \
         interval.\n\
        \          \n\
        \           }\n\
        \      {-  The scope of deduplication depends on the [FifoThroughputScope] attribute, when \
         set to [Topic] the message deduplication scope is across the entire topic, when set to \
         [MessageGroup] the message deduplication scope is within each individual message group.\n\
        \          \n\
        \           }\n\
        \      {-  If a message with a particular [MessageDeduplicationId] is sent successfully, \
         subsequent messages within the deduplication scope and interval, with the same \
         [MessageDeduplicationId], are accepted successfully but aren't delivered.\n\
        \          \n\
        \           }\n\
        \      {-  Every message must have a unique [MessageDeduplicationId]:\n\
        \          \n\
        \           {ul\n\
        \                 {-  You may provide a [MessageDeduplicationId] explicitly.\n\
        \                     \n\
        \                      }\n\
        \                 {-  If you aren't able to provide a [MessageDeduplicationId] and you \
         enable [ContentBasedDeduplication] for your topic, Amazon SNS uses a SHA-256 hash to \
         generate the [MessageDeduplicationId] using the body of the message (but not the \
         attributes of the message).\n\
        \                     \n\
        \                      }\n\
        \                 {-  If you don't provide a [MessageDeduplicationId] and the topic \
         doesn't have [ContentBasedDeduplication] set, the action fails with an error.\n\
        \                     \n\
        \                      }\n\
        \                 {-  If the topic has a [ContentBasedDeduplication] set, your \
         [MessageDeduplicationId] overrides the generated one. \n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \       }\n\
        \        }\n\
        \      {-  When [ContentBasedDeduplication] is in effect, messages with identical content \
         sent within the deduplication scope and interval are treated as duplicates and only one \
         copy of the message is delivered.\n\
        \          \n\
        \           }\n\
        \      {-  If you send one message with [ContentBasedDeduplication] enabled, and then \
         another message with a [MessageDeduplicationId] that is the same as the one generated for \
         the first [MessageDeduplicationId], the two messages are treated as duplicates, within \
         the deduplication scope and interval, and only one copy of the message is delivered.\n\
        \          \n\
        \           }\n\
        \      }\n\
        \  "]
  message_group_id : string_ option;
      [@ocaml.doc
        "The [MessageGroupId] can contain up to 128 alphanumeric characters [(a-z, A-Z, 0-9)] and \
         punctuation [(!\"#$%&'()*+,-./:;<=>?@\\[\\\\]^_`{|}~)].\n\n\
        \  For FIFO topics: The [MessageGroupId] is a tag that specifies that a message belongs to \
         a specific message group. Messages that belong to the same message group are processed in \
         a FIFO manner (however, messages in different message groups might be processed out of \
         order). Every message must include a [MessageGroupId]. \n\
        \ \n\
        \   For standard topics: The [MessageGroupId] is optional and is forwarded only to Amazon \
         SQS standard subscriptions to activate \
         {{:https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-fair-queues.html}fair \
         queues}. The [MessageGroupId] is not used for, or sent to, any other endpoint types. When \
         provided, the same validation rules apply as for FIFO topics. \n\
        \  "]
}
[@@ocaml.doc "Input for Publish action.\n"]

type nonrec opt_in_phone_number_response = unit [@@ocaml.doc ""]

type nonrec opt_in_phone_number_input = {
  phone_number : phone_number; [@ocaml.doc "The phone number to opt in. Use E.164 format.\n"]
}
[@@ocaml.doc "Input for the OptInPhoneNumber action.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec topic = { topic_arn : topic_ar_n option [@ocaml.doc "The topic's ARN.\n"] }
[@@ocaml.doc
  "A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a topic's attributes, \
   use [GetTopicAttributes].\n"]

type nonrec topics_list = topic list [@@ocaml.doc ""]

type nonrec list_topics_response = {
  topics : topics_list option; [@ocaml.doc "A list of topic ARNs.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to pass along to the next [ListTopics] request. This element is returned if there \
         are additional topics to retrieve.\n"]
}
[@@ocaml.doc "Response for ListTopics action.\n"]

type nonrec list_topics_input = {
  next_token : next_token option;
      [@ocaml.doc "Token returned by the previous [ListTopics] request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags associated with the specified topic.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_name; [@ocaml.doc "The ARN of the topic for which to list tags.\n"]
}
[@@ocaml.doc ""]

type nonrec account = string [@@ocaml.doc ""]

type nonrec subscription = {
  subscription_arn : subscription_ar_n option; [@ocaml.doc "The subscription's ARN.\n"]
  owner : account option; [@ocaml.doc "The subscription's owner.\n"]
  protocol : protocol option; [@ocaml.doc "The subscription's protocol.\n"]
  endpoint : endpoint2 option;
      [@ocaml.doc "The subscription's endpoint (format depends on the protocol).\n"]
  topic_arn : topic_ar_n option; [@ocaml.doc "The ARN of the subscription's topic.\n"]
}
[@@ocaml.doc "A wrapper type for the attributes of an Amazon SNS subscription.\n"]

type nonrec subscriptions_list = subscription list [@@ocaml.doc ""]

type nonrec list_subscriptions_by_topic_response = {
  subscriptions : subscriptions_list option; [@ocaml.doc "A list of subscriptions.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to pass along to the next [ListSubscriptionsByTopic] request. This element is \
         returned if there are more subscriptions to retrieve.\n"]
}
[@@ocaml.doc "Response for ListSubscriptionsByTopic action.\n"]

type nonrec list_subscriptions_by_topic_input = {
  topic_arn : topic_ar_n;
      [@ocaml.doc "The ARN of the topic for which you wish to find subscriptions.\n"]
  next_token : next_token option;
      [@ocaml.doc "Token returned by the previous [ListSubscriptionsByTopic] request.\n"]
}
[@@ocaml.doc "Input for ListSubscriptionsByTopic action.\n"]

type nonrec list_subscriptions_response = {
  subscriptions : subscriptions_list option; [@ocaml.doc "A list of subscriptions.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Token to pass along to the next [ListSubscriptions] request. This element is returned if \
         there are more subscriptions to retrieve.\n"]
}
[@@ocaml.doc "Response for ListSubscriptions action\n"]

type nonrec list_subscriptions_input = {
  next_token : next_token option;
      [@ocaml.doc "Token returned by the previous [ListSubscriptions] request.\n"]
}
[@@ocaml.doc "Input for ListSubscriptions action.\n"]

type nonrec sms_sandbox_phone_number_verification_status =
  | Pending [@ocaml.doc ""]
  | Verified [@ocaml.doc ""]
[@@ocaml.doc
  "Enum listing out all supported destination phone number verification statuses. The following \
   enum values are supported. 1. PENDING : The destination phone number is pending verification. \
   2. VERIFIED : The destination phone number is verified."]

type nonrec sms_sandbox_phone_number = {
  phone_number : phone_number_string option; [@ocaml.doc "The destination phone number.\n"]
  status : sms_sandbox_phone_number_verification_status option;
      [@ocaml.doc "The destination phone number's verification status.\n"]
}
[@@ocaml.doc
  "A verified or pending destination phone number in the SMS sandbox.\n\n\
  \ When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in \
   the {i SMS sandbox}. The SMS sandbox provides a safe environment for you to try Amazon SNS \
   features without risking your reputation as an SMS sender. While your Amazon Web Services \
   account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can \
   send SMS messages only to verified destination phone numbers. For more information, including \
   how to move out of the sandbox to send messages without restrictions, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}SMS sandbox} in the {i Amazon \
   SNS Developer Guide}.\n\
  \ "]

type nonrec sms_sandbox_phone_number_list = sms_sandbox_phone_number list [@@ocaml.doc ""]

type nonrec list_sms_sandbox_phone_numbers_result = {
  phone_numbers : sms_sandbox_phone_number_list;
      [@ocaml.doc "A list of the calling account's pending and verified phone numbers.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "A [NextToken] string is returned when you call the [ListSMSSandboxPhoneNumbersInput] \
         operation if additional pages of records are available.\n"]
}
[@@ocaml.doc ""]

type nonrec max_items = int [@@ocaml.doc ""]

type nonrec list_sms_sandbox_phone_numbers_input = {
  next_token : next_token option;
      [@ocaml.doc "Token that the previous [ListSMSSandboxPhoneNumbersInput] request returns.\n"]
  max_results : max_items option; [@ocaml.doc "The maximum number of phone numbers to return.\n"]
}
[@@ocaml.doc ""]

type nonrec platform_application = {
  platform_application_arn : string_ option;
      [@ocaml.doc "PlatformApplicationArn for platform application object.\n"]
  attributes : map_string_to_string option;
      [@ocaml.doc "Attributes for platform application object.\n"]
}
[@@ocaml.doc "Platform application object.\n"]

type nonrec list_of_platform_applications = platform_application list [@@ocaml.doc ""]

type nonrec list_platform_applications_response = {
  platform_applications : list_of_platform_applications option;
      [@ocaml.doc
        "Platform applications returned when calling [ListPlatformApplications] action.\n"]
  next_token : string_ option;
      [@ocaml.doc
        " [NextToken] string is returned when calling [ListPlatformApplications] action if \
         additional records are available after the first page results.\n"]
}
[@@ocaml.doc "Response for [ListPlatformApplications] action.\n"]

type nonrec list_platform_applications_input = {
  next_token : string_ option;
      [@ocaml.doc
        " [NextToken] string is used when calling [ListPlatformApplications] action to retrieve \
         additional records that are available after the first page results.\n"]
}
[@@ocaml.doc "Input for [ListPlatformApplications] action.\n"]

type nonrec phone_number_list = phone_number list [@@ocaml.doc ""]

type nonrec list_phone_numbers_opted_out_response = {
  phone_numbers : phone_number_list option;
      [@ocaml.doc
        "A list of phone numbers that are opted out of receiving SMS messages. The list is \
         paginated, and each page can contain up to 100 phone numbers.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "A [NextToken] string is returned when you call the [ListPhoneNumbersOptedOut] action if \
         additional records are available after the first page of results.\n"]
}
[@@ocaml.doc "The response from the [ListPhoneNumbersOptedOut] action.\n"]

type nonrec list_phone_numbers_opted_out_input = {
  next_token : string_ option;
      [@ocaml.doc
        "A [NextToken] string is used when you call the [ListPhoneNumbersOptedOut] action to \
         retrieve additional records that are available after the first page of results.\n"]
}
[@@ocaml.doc "The input for the [ListPhoneNumbersOptedOut] action.\n"]

type nonrec number_capability = SMS [@ocaml.doc ""] | MMS [@ocaml.doc ""] | VOICE [@ocaml.doc ""]
[@@ocaml.doc "Enum listing out all supported number capabilities."]

type nonrec number_capability_list = number_capability list [@@ocaml.doc ""]

type nonrec route_type =
  | Transactional [@ocaml.doc ""]
  | Promotional [@ocaml.doc ""]
  | Premium [@ocaml.doc ""]
[@@ocaml.doc
  "Enum listing out all supported route types. The following enum values are supported. 1. \
   Transactional : Non-marketing traffic 2. Promotional : Marketing 3. Premium : Premium routes \
   for OTP delivery to the carriers"]

type nonrec iso2_country_code = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec phone_number_information = {
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the phone number was created.\n"]
  phone_number : phone_number option; [@ocaml.doc "The phone number.\n"]
  status : string_ option; [@ocaml.doc "The status of the phone number.\n"]
  iso2_country_code : iso2_country_code option;
      [@ocaml.doc
        "The two-character code for the country or region, in ISO 3166-1 alpha-2 format.\n"]
  route_type : route_type option; [@ocaml.doc "The list of supported routes.\n"]
  number_capabilities : number_capability_list option;
      [@ocaml.doc "The capabilities of each phone number.\n"]
}
[@@ocaml.doc "A list of phone numbers and their metadata.\n"]

type nonrec phone_number_information_list = phone_number_information list [@@ocaml.doc ""]

type nonrec list_origination_numbers_result = {
  next_token : next_token option;
      [@ocaml.doc
        "A [NextToken] string is returned when you call the [ListOriginationNumbers] operation if \
         additional pages of records are available.\n"]
  phone_numbers : phone_number_information_list option;
      [@ocaml.doc "A list of the calling account's verified and pending origination numbers.\n"]
}
[@@ocaml.doc ""]

type nonrec max_items_list_origination_numbers = int [@@ocaml.doc ""]

type nonrec list_origination_numbers_request = {
  next_token : next_token option;
      [@ocaml.doc "Token that the previous [ListOriginationNumbers] request returns.\n"]
  max_results : max_items_list_origination_numbers option;
      [@ocaml.doc "The maximum number of origination numbers to return.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint = {
  endpoint_arn : string_ option; [@ocaml.doc "The [EndpointArn] for mobile app and device.\n"]
  attributes : map_string_to_string option; [@ocaml.doc "Attributes for endpoint.\n"]
}
[@@ocaml.doc "The endpoint for mobile app and device.\n"]

type nonrec list_of_endpoints = endpoint list [@@ocaml.doc ""]

type nonrec list_endpoints_by_platform_application_response = {
  endpoints : list_of_endpoints option;
      [@ocaml.doc "Endpoints returned for [ListEndpointsByPlatformApplication] action.\n"]
  next_token : string_ option;
      [@ocaml.doc
        " [NextToken] string is returned when calling [ListEndpointsByPlatformApplication] action \
         if additional records are available after the first page results.\n"]
}
[@@ocaml.doc "Response for [ListEndpointsByPlatformApplication] action.\n"]

type nonrec list_endpoints_by_platform_application_input = {
  platform_application_arn : string_;
      [@ocaml.doc
        " [PlatformApplicationArn] for [ListEndpointsByPlatformApplicationInput] action.\n"]
  next_token : string_ option;
      [@ocaml.doc
        " [NextToken] string is used when calling [ListEndpointsByPlatformApplication] action to \
         retrieve additional records that are available after the first page results.\n"]
}
[@@ocaml.doc "Input for [ListEndpointsByPlatformApplication] action.\n"]

type nonrec topic_attributes_map = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec get_topic_attributes_response = {
  attributes : topic_attributes_map option;
      [@ocaml.doc
        "A map of the topic's attributes. Attributes in this map include the following:\n\n\
        \ {ul\n\
        \       {-   [DeliveryPolicy] \226\128\147 The JSON serialization of the topic's delivery \
         policy.\n\
        \           \n\
        \            }\n\
        \       {-   [DisplayName] \226\128\147 The human-readable name used in the [From] field \
         for notifications to [email] and [email-json] endpoints.\n\
        \           \n\
        \            }\n\
        \       {-   [EffectiveDeliveryPolicy] \226\128\147 The JSON serialization of the \
         effective delivery policy, taking system defaults into account.\n\
        \           \n\
        \            }\n\
        \       {-   [Owner] \226\128\147 The Amazon Web Services account ID of the topic's owner.\n\
        \           \n\
        \            }\n\
        \       {-   [Policy] \226\128\147 The JSON serialization of the topic's access control \
         policy.\n\
        \           \n\
        \            }\n\
        \       {-   [SignatureVersion] \226\128\147 The signature version corresponds to the \
         hashing algorithm used while creating the signature of the notifications, subscription \
         confirmations, or unsubscribe confirmation messages sent by Amazon SNS.\n\
        \           \n\
        \            {ul\n\
        \                  {-  By default, [SignatureVersion] is set to {b 1}. The signature is a \
         Base64-encoded {b SHA1withRSA} signature.\n\
        \                      \n\
        \                       }\n\
        \                  {-  When you set [SignatureVersion] to {b 2}. Amazon SNS uses a \
         Base64-encoded {b SHA256withRSA} signature. \n\
        \                      \n\
        \                        If the API response does not include the [SignatureVersion] \
         attribute, it means that the [SignatureVersion] for the topic has value {b 1}.\n\
        \                        \n\
        \                          }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [SubscriptionsConfirmed] \226\128\147 The number of confirmed subscriptions \
         for the topic.\n\
        \           \n\
        \            }\n\
        \       {-   [SubscriptionsDeleted] \226\128\147 The number of deleted subscriptions for \
         the topic.\n\
        \           \n\
        \            }\n\
        \       {-   [SubscriptionsPending] \226\128\147 The number of subscriptions pending \
         confirmation for the topic.\n\
        \           \n\
        \            }\n\
        \       {-   [TopicArn] \226\128\147 The topic's ARN.\n\
        \           \n\
        \            }\n\
        \       {-   [TracingConfig] \226\128\147 Tracing mode of an Amazon SNS topic. By default \
         [TracingConfig] is set to [PassThrough], and the topic passes through the tracing header \
         it receives from an Amazon SNS publisher to its subscriptions. If set to [Active], Amazon \
         SNS will vend X-Ray segment data to topic owner account if the sampled flag in the \
         tracing header is true. This is only supported on standard topics.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The following attribute applies only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html}server-side-encryption}:\n\
        \   \n\
        \    {ul\n\
        \          {-   [KmsMasterKeyId] - The ID of an Amazon Web Services managed customer \
         master key (CMK) for Amazon SNS or a custom CMK. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms}Key \
         Terms}. For more examples, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} \
         in the {i Key Management Service API Reference}.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following attributes apply only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html}FIFO topics}:\n\
        \   \n\
        \    {ul\n\
        \          {-   [ArchivePolicy] \226\128\147 The policy that sets the retention period for \
         messages stored in the message archive of an Amazon SNS FIFO topic.\n\
        \              \n\
        \               }\n\
        \          {-   [BeginningArchiveTime] \226\128\147 The earliest starting point at which a \
         message in the topic\226\128\153s archive can be replayed from. This point in time is \
         based on the configured message retention period set by the topic\226\128\153s message \
         archiving policy.\n\
        \              \n\
        \               }\n\
        \          {-   [ContentBasedDeduplication] \226\128\147 Enables content-based \
         deduplication for FIFO topics.\n\
        \              \n\
        \               {ul\n\
        \                     {-  By default, [ContentBasedDeduplication] is set to [false]. If \
         you create a FIFO topic and this attribute is [false], you must specify a value for the \
         [MessageDeduplicationId] parameter for the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_Publish.html}Publish} action. \n\
        \                         \n\
        \                          }\n\
        \                     {-  When you set [ContentBasedDeduplication] to [true], Amazon SNS \
         uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the \
         message (but not the attributes of the message).\n\
        \                         \n\
        \                          (Optional) To override the generated value, you can specify a \
         value for the [MessageDeduplicationId] parameter for the [Publish] action.\n\
        \                          \n\
        \                           }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          {-   [FifoTopic] \226\128\147 When this is set to [true], a FIFO topic is \
         created.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Response for GetTopicAttributes action.\n"]

type nonrec get_topic_attributes_input = {
  topic_arn : topic_ar_n; [@ocaml.doc "The ARN of the topic whose properties you want to get.\n"]
}
[@@ocaml.doc "Input for GetTopicAttributes action.\n"]

type nonrec get_subscription_attributes_response = {
  attributes : subscription_attributes_map option;
      [@ocaml.doc
        "A map of the subscription's attributes. Attributes in this map include the following:\n\n\
        \ {ul\n\
        \       {-   [ConfirmationWasAuthenticated] \226\128\147 [true] if the subscription \
         confirmation request was authenticated.\n\
        \           \n\
        \            }\n\
        \       {-   [DeliveryPolicy] \226\128\147 The JSON serialization of the subscription's \
         delivery policy.\n\
        \           \n\
        \            }\n\
        \       {-   [EffectiveDeliveryPolicy] \226\128\147 The JSON serialization of the \
         effective delivery policy that takes into account the topic delivery policy and account \
         system defaults.\n\
        \           \n\
        \            }\n\
        \       {-   [FilterPolicy] \226\128\147 The filter policy JSON that is assigned to the \
         subscription. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html}Amazon SNS \
         Message Filtering} in the {i Amazon SNS Developer Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   [FilterPolicyScope] \226\128\147 This attribute lets you choose the filtering \
         scope by using one of the following string value types:\n\
        \           \n\
        \            {ul\n\
        \                  {-   [MessageAttributes] (default) \226\128\147 The filter is applied \
         on the message attributes.\n\
        \                      \n\
        \                       }\n\
        \                  {-   [MessageBody] \226\128\147 The filter is applied on the message \
         body.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [Owner] \226\128\147 The Amazon Web Services account ID of the subscription's \
         owner.\n\
        \           \n\
        \            }\n\
        \       {-   [PendingConfirmation] \226\128\147 [true] if the subscription hasn't been \
         confirmed. To confirm a pending subscription, call the [ConfirmSubscription] action with \
         a confirmation token.\n\
        \           \n\
        \            }\n\
        \       {-   [RawMessageDelivery] \226\128\147 [true] if raw message delivery is enabled \
         for the subscription. Raw messages are free of JSON formatting and can be sent to HTTP/S \
         and Amazon SQS endpoints.\n\
        \           \n\
        \            }\n\
        \       {-   [RedrivePolicy] \226\128\147 When specified, sends undeliverable messages to \
         the specified Amazon SQS dead-letter queue. Messages that can't be delivered due to \
         client errors (for example, when the subscribed endpoint is unreachable) or server errors \
         (for example, when the service that powers the subscribed endpoint becomes unavailable) \
         are held in the dead-letter queue for further analysis or reprocessing.\n\
        \           \n\
        \            }\n\
        \       {-   [SubscriptionArn] \226\128\147 The subscription's ARN.\n\
        \           \n\
        \            }\n\
        \       {-   [TopicArn] \226\128\147 The topic ARN that the subscription is associated with.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The following attribute applies only to Amazon Data Firehose delivery stream \
         subscriptions:\n\
        \   \n\
        \    {ul\n\
        \          {-   [SubscriptionRoleArn] \226\128\147 The ARN of the IAM role that has the \
         following:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Permission to write to the Firehose delivery stream\n\
        \                         \n\
        \                          }\n\
        \                     {-  Amazon SNS listed as a trusted entity\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            Specifying a valid ARN for this attribute is required for Firehose delivery \
         stream subscriptions. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html}Fanout to \
         Firehose delivery streams} in the {i Amazon SNS Developer Guide}.\n\
        \            \n\
        \             }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Response for GetSubscriptionAttributes action.\n"]

type nonrec get_subscription_attributes_input = {
  subscription_arn : subscription_ar_n;
      [@ocaml.doc "The ARN of the subscription whose properties you want to get.\n"]
}
[@@ocaml.doc "Input for GetSubscriptionAttributes.\n"]

type nonrec get_sms_sandbox_account_status_result = {
  is_in_sandbox : boolean_;
      [@ocaml.doc
        "Indicates whether the calling Amazon Web Services account is in the SMS sandbox.\n"]
}
[@@ocaml.doc ""]

type nonrec get_sms_sandbox_account_status_input = unit [@@ocaml.doc ""]

type nonrec get_sms_attributes_response = {
  attributes : map_string_to_string option;
      [@ocaml.doc "The SMS attribute names and their values.\n"]
}
[@@ocaml.doc "The response from the [GetSMSAttributes] request.\n"]

type nonrec list_string = string_ list [@@ocaml.doc ""]

type nonrec get_sms_attributes_input = {
  attributes : list_string option;
      [@ocaml.doc
        "A list of the individual attribute names, such as [MonthlySpendLimit], for which you want \
         values.\n\n\
        \ For all attribute names, see \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html}SetSMSAttributes}.\n\
        \ \n\
        \  If you don't use this parameter, Amazon SNS returns all SMS attributes.\n\
        \  "]
}
[@@ocaml.doc "The input for the [GetSMSAttributes] request.\n"]

type nonrec get_platform_application_attributes_response = {
  attributes : map_string_to_string option;
      [@ocaml.doc
        "Attributes include the following:\n\n\
        \ {ul\n\
        \       {-   [AppleCertificateExpiryDate] \226\128\147 The expiry date of the SSL \
         certificate used to configure certificate-based authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [ApplePlatformTeamID] \226\128\147 The Apple developer account ID used to \
         configure token-based authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [ApplePlatformBundleID] \226\128\147 The app identifier used to configure \
         token-based authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [AuthenticationMethod] \226\128\147 Returns the credential type used when \
         sending push notifications from application to APNS/APNS_Sandbox, or application to GCM.\n\
        \           \n\
        \            {ul\n\
        \                  {-  APNS \226\128\147 Returns the token or certificate.\n\
        \                      \n\
        \                       }\n\
        \                  {-  GCM \226\128\147 Returns the token or key.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [EventEndpointCreated] \226\128\147 Topic ARN to which EndpointCreated event \
         notifications should be sent.\n\
        \           \n\
        \            }\n\
        \       {-   [EventEndpointDeleted] \226\128\147 Topic ARN to which EndpointDeleted event \
         notifications should be sent.\n\
        \           \n\
        \            }\n\
        \       {-   [EventEndpointUpdated] \226\128\147 Topic ARN to which EndpointUpdate event \
         notifications should be sent.\n\
        \           \n\
        \            }\n\
        \       {-   [EventDeliveryFailure] \226\128\147 Topic ARN to which DeliveryFailure event \
         notifications should be sent upon Direct Publish delivery failure (permanent) to one of \
         the application's endpoints.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Response for [GetPlatformApplicationAttributes] action.\n"]

type nonrec get_platform_application_attributes_input = {
  platform_application_arn : string_;
      [@ocaml.doc " [PlatformApplicationArn] for GetPlatformApplicationAttributesInput.\n"]
}
[@@ocaml.doc "Input for [GetPlatformApplicationAttributes] action.\n"]

type nonrec get_endpoint_attributes_response = {
  attributes : map_string_to_string option;
      [@ocaml.doc
        "Attributes include the following:\n\n\
        \ {ul\n\
        \       {-   [CustomUserData] \226\128\147 arbitrary user data to associate with the \
         endpoint. Amazon SNS does not use this data. The data must be in UTF-8 format and less \
         than 2KB.\n\
        \           \n\
        \            }\n\
        \       {-   [Enabled] \226\128\147 flag that enables/disables delivery to the endpoint. \
         Amazon SNS will set this to false when a notification service indicates to Amazon SNS \
         that the endpoint is invalid. Users can set it back to true, typically after updating \
         Token.\n\
        \           \n\
        \            }\n\
        \       {-   [Token] \226\128\147 device token, also referred to as a registration id, for \
         an app and mobile device. This is returned from the notification service when an app and \
         mobile device are registered with the notification service.\n\
        \           \n\
        \             The device token for the iOS platform is returned in lowercase.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Response from [GetEndpointAttributes] of the [EndpointArn].\n"]

type nonrec get_endpoint_attributes_input = {
  endpoint_arn : string_; [@ocaml.doc " [EndpointArn] for [GetEndpointAttributes] input.\n"]
}
[@@ocaml.doc "Input for [GetEndpointAttributes] action.\n"]

type nonrec get_data_protection_policy_response = {
  data_protection_policy : attribute_value option;
      [@ocaml.doc "Retrieves the [DataProtectionPolicy] in JSON string format.\n"]
}
[@@ocaml.doc ""]

type nonrec get_data_protection_policy_input = {
  resource_arn : topic_ar_n;
      [@ocaml.doc
        "The ARN of the topic whose [DataProtectionPolicy] you want to get.\n\n\
        \ For more information about ARNs, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs)} in the Amazon Web Services General Reference.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates that the specified state is not a valid state for an event source.\n"]

type nonrec delete_topic_input = {
  topic_arn : topic_ar_n; [@ocaml.doc "The ARN of the topic you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec user_error_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that a request parameter does not comply with the associated constraints.\n"]

type nonrec delete_sms_sandbox_phone_number_result = unit [@@ocaml.doc ""]

type nonrec delete_sms_sandbox_phone_number_input = {
  phone_number : phone_number_string; [@ocaml.doc "The destination phone number to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_platform_application_input = {
  platform_application_arn : string_;
      [@ocaml.doc " [PlatformApplicationArn] of platform application object to delete.\n"]
}
[@@ocaml.doc "Input for [DeletePlatformApplication] action.\n"]

type nonrec delete_endpoint_input = {
  endpoint_arn : string_; [@ocaml.doc " [EndpointArn] of endpoint to delete.\n"]
}
[@@ocaml.doc "Input for [DeleteEndpoint] action.\n"]

type nonrec topic_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates that the customer already owns the maximum allowed number of topics.\n"]

type nonrec create_topic_response = {
  topic_arn : topic_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) assigned to the created topic.\n"]
}
[@@ocaml.doc "Response from CreateTopic action.\n"]

type nonrec topic_name = string [@@ocaml.doc ""]

type nonrec create_topic_input = {
  name : topic_name;
      [@ocaml.doc
        "The name of the topic you want to create.\n\n\
        \ Constraints: Topic names must be made up of only uppercase and lowercase ASCII letters, \
         numbers, underscores, and hyphens, and must be between 1 and 256 characters long.\n\
        \ \n\
        \  For a FIFO (first-in-first-out) topic, the name must end with the [.fifo] suffix. \n\
        \  "]
  attributes : topic_attributes_map option;
      [@ocaml.doc
        "A map of attributes with their corresponding values.\n\n\
        \ The following lists names, descriptions, and values of the special request parameters \
         that the [CreateTopic] action uses:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DeliveryPolicy] \226\128\147 The policy that defines how Amazon SNS retries \
         failed deliveries to HTTP/S endpoints.\n\
        \            \n\
        \             }\n\
        \        {-   [DisplayName] \226\128\147 The display name to use for a topic with SMS \
         subscriptions.\n\
        \            \n\
        \             }\n\
        \        {-   [Policy] \226\128\147 The policy that defines who can access your topic. By \
         default, only the topic owner can publish or subscribe to the topic.\n\
        \            \n\
        \             }\n\
        \        {-   [TracingConfig] \226\128\147 Tracing mode of an Amazon SNS topic. By default \
         [TracingConfig] is set to [PassThrough], and the topic passes through the tracing header \
         it receives from an Amazon SNS publisher to its subscriptions. If set to [Active], Amazon \
         SNS will vend X-Ray segment data to topic owner account if the sampled flag in the \
         tracing header is true. This is only supported on standard topics.\n\
        \            \n\
        \             }\n\
        \        {-  HTTP\n\
        \            \n\
        \             {ul\n\
        \                   {-   [HTTPSuccessFeedbackRoleArn] \226\128\147 Indicates successful \
         message delivery status for an Amazon SNS topic that is subscribed to an HTTP endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   {-   [HTTPSuccessFeedbackSampleRate] \226\128\147 Indicates percentage \
         of successful messages to sample for an Amazon SNS topic that is subscribed to an HTTP \
         endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [HTTPFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an HTTP endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Amazon Data Firehose\n\
        \            \n\
        \             {ul\n\
        \                   {-   [FirehoseSuccessFeedbackRoleArn] \226\128\147 Indicates \
         successful message delivery status for an Amazon SNS topic that is subscribed to an \
         Amazon Data Firehose endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [FirehoseSuccessFeedbackSampleRate] \226\128\147 Indicates \
         percentage of successful messages to sample for an Amazon SNS topic that is subscribed to \
         an Amazon Data Firehose endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [FirehoseFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an Amazon Data \
         Firehose endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Lambda\n\
        \            \n\
        \             {ul\n\
        \                   {-   [LambdaSuccessFeedbackRoleArn] \226\128\147 Indicates successful \
         message delivery status for an Amazon SNS topic that is subscribed to an Lambda endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [LambdaSuccessFeedbackSampleRate] \226\128\147 Indicates \
         percentage of successful messages to sample for an Amazon SNS topic that is subscribed to \
         an Lambda endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [LambdaFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an Lambda endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Platform application endpoint\n\
        \            \n\
        \             {ul\n\
        \                   {-   [ApplicationSuccessFeedbackRoleArn] \226\128\147 Indicates \
         successful message delivery status for an Amazon SNS topic that is subscribed to a \
         platform application endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [ApplicationSuccessFeedbackSampleRate] \226\128\147 Indicates \
         percentage of successful messages to sample for an Amazon SNS topic that is subscribed to \
         an platform application endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [ApplicationFailureFeedbackRoleArn] \226\128\147 Indicates failed \
         message delivery status for an Amazon SNS topic that is subscribed to an platform \
         application endpoint.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \           In addition to being able to configure topic attributes for message delivery \
         status of notification messages sent to Amazon SNS application endpoints, you can also \
         configure application attributes for the delivery status of push notification messages \
         sent to push notification services.\n\
        \           \n\
        \            For example, For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html}Using Amazon SNS \
         Application Attributes for Message Delivery Status}. \n\
        \            \n\
        \              }\n\
        \        {-  Amazon SQS\n\
        \            \n\
        \             {ul\n\
        \                   {-   [SQSSuccessFeedbackRoleArn] \226\128\147 Indicates successful \
         message delivery status for an Amazon SNS topic that is subscribed to an Amazon SQS \
         endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   {-   [SQSSuccessFeedbackSampleRate] \226\128\147 Indicates percentage \
         of successful messages to sample for an Amazon SNS topic that is subscribed to an Amazon \
         SQS endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   {-   [SQSFailureFeedbackRoleArn] \226\128\147 Indicates failed message \
         delivery status for an Amazon SNS topic that is subscribed to an Amazon SQS endpoint. \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \    The SuccessFeedbackRoleArn and FailureFeedbackRoleArn attributes are used to give \
         Amazon SNS write access to use CloudWatch Logs on your behalf. The \
         SuccessFeedbackSampleRate attribute is for specifying the sample rate percentage (0-100) \
         of successfully delivered messages. After you configure the FailureFeedbackRoleArn \
         attribute, then all failed message deliveries generate CloudWatch Logs. \n\
        \    \n\
        \      The following attribute applies only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html}server-side \
         encryption}:\n\
        \      \n\
        \       {ul\n\
        \             {-   [KmsMasterKeyId] \226\128\147 The ID of an Amazon Web Services managed \
         customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms}Key \
         Terms}. For more examples, see \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters}KeyId} \
         in the {i Key Management Service API Reference}. \n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \   The following attributes apply only to \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html}FIFO topics}:\n\
        \   \n\
        \    {ul\n\
        \          {-   [ArchivePolicy] \226\128\147 The policy that sets the retention period for \
         messages stored in the message archive of an Amazon SNS FIFO topic.\n\
        \              \n\
        \               }\n\
        \          {-   [ContentBasedDeduplication] \226\128\147 Enables content-based \
         deduplication for FIFO topics.\n\
        \              \n\
        \               {ul\n\
        \                     {-  By default, [ContentBasedDeduplication] is set to [false]. If \
         you create a FIFO topic and this attribute is [false], you must specify a value for the \
         [MessageDeduplicationId] parameter for the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_Publish.html}Publish} action. \n\
        \                         \n\
        \                          }\n\
        \                     {-  When you set [ContentBasedDeduplication] to [true], Amazon SNS \
         uses a SHA-256 hash to generate the [MessageDeduplicationId] using the body of the \
         message (but not the attributes of the message).\n\
        \                         \n\
        \                          (Optional) To override the generated value, you can specify a \
         value for the [MessageDeduplicationId] parameter for the [Publish] action.\n\
        \                          \n\
        \                           }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \   {ul\n\
        \         {-   [FifoThroughputScope] \226\128\147 Enables higher throughput for your FIFO \
         topic by adjusting the scope of deduplication. This attribute has two possible values:\n\
        \             \n\
        \              {ul\n\
        \                    {-   [Topic] \226\128\147 The scope of message deduplication is \
         across the entire topic. This is the default value and maintains existing behavior, with \
         a maximum throughput of 3000 messages per second or 20MB per second, whichever comes \
         first.\n\
        \                        \n\
        \                         }\n\
        \                    {-   [MessageGroup] \226\128\147 The scope of deduplication is within \
         each individual message group, which enables higher throughput per topic subject to \
         regional quotas. For more information on quotas or to request an increase, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/sns.html}Amazon SNS service quotas} in \
         the Amazon Web Services General Reference.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \          }\n\
        \           }\n\
        \         }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "The list of tags to add to a new topic.\n\n\
        \  To be able to tag a topic on creation, you must have the [sns:CreateTopic] and \
         [sns:TagResource] permissions.\n\
        \  \n\
        \   "]
  data_protection_policy : attribute_value option;
      [@ocaml.doc
        "The body of the policy document you want to use for this topic.\n\n\
        \ You can only add one policy per topic.\n\
        \ \n\
        \  The policy must be in JSON string format.\n\
        \  \n\
        \   Length Constraints: Maximum length of 30,720.\n\
        \   "]
}
[@@ocaml.doc "Input for CreateTopic action.\n"]

type nonrec opted_out_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the specified phone number opted out of receiving SMS messages from your Amazon \
   Web Services account. You can't send SMS messages to phone numbers that opt out.\n"]

type nonrec create_sms_sandbox_phone_number_result = unit [@@ocaml.doc ""]

type nonrec language_code_string =
  | En_US [@ocaml.doc ""]
  | En_GB [@ocaml.doc ""]
  | Es_419 [@ocaml.doc ""]
  | Es_ES [@ocaml.doc ""]
  | De_DE [@ocaml.doc ""]
  | Fr_CA [@ocaml.doc ""]
  | Fr_FR [@ocaml.doc ""]
  | It_IT [@ocaml.doc ""]
  | Jp_JP [@ocaml.doc ""]
  | Pt_BR [@ocaml.doc ""]
  | Kr_KR [@ocaml.doc ""]
  | Zh_CN [@ocaml.doc ""]
  | Zh_TW [@ocaml.doc ""]
[@@ocaml.doc "Supported language code for sending OTP message"]

type nonrec create_sms_sandbox_phone_number_input = {
  phone_number : phone_number_string;
      [@ocaml.doc
        "The destination phone number to verify. On verification, Amazon SNS adds this phone \
         number to the list of verified phone numbers that you can send SMS messages to.\n"]
  language_code : language_code_string option;
      [@ocaml.doc "The language to use for sending the OTP. The default value is [en-US].\n"]
}
[@@ocaml.doc ""]

type nonrec create_endpoint_response = {
  endpoint_arn : string_ option; [@ocaml.doc "EndpointArn returned from CreateEndpoint action.\n"]
}
[@@ocaml.doc "Response from CreateEndpoint action.\n"]

type nonrec create_platform_endpoint_input = {
  platform_application_arn : string_;
      [@ocaml.doc
        " [PlatformApplicationArn] returned from CreatePlatformApplication is used to create a an \
         endpoint.\n"]
  token : string_;
      [@ocaml.doc
        "Unique identifier created by the notification service for an app on a device. The \
         specific name for Token will vary, depending on which notification service is being used. \
         For example, when using APNS as the notification service, you need the device token. \
         Alternatively, when using GCM (Firebase Cloud Messaging) or ADM, the device token \
         equivalent is called the registration ID.\n"]
  custom_user_data : string_ option;
      [@ocaml.doc
        "Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. \
         The data must be in UTF-8 format and less than 2KB.\n"]
  attributes : map_string_to_string option;
      [@ocaml.doc
        "For a list of attributes, see \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html} \
         [SetEndpointAttributes] }.\n"]
}
[@@ocaml.doc "Input for CreatePlatformEndpoint action.\n"]

type nonrec create_platform_application_response = {
  platform_application_arn : string_ option; [@ocaml.doc " [PlatformApplicationArn] is returned.\n"]
}
[@@ocaml.doc "Response from CreatePlatformApplication action.\n"]

type nonrec create_platform_application_input = {
  name : string_;
      [@ocaml.doc
        "Application names must be made up of only uppercase and lowercase ASCII letters, numbers, \
         underscores, hyphens, and periods, and must be between 1 and 256 characters long.\n"]
  platform : string_;
      [@ocaml.doc
        "The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push \
         Notification Service), APNS_SANDBOX, and GCM (Firebase Cloud Messaging).\n"]
  attributes : map_string_to_string;
      [@ocaml.doc
        "For a list of attributes, see \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html} \
         [SetPlatformApplicationAttributes] }.\n"]
}
[@@ocaml.doc "Input for CreatePlatformApplication action.\n"]

type nonrec confirm_subscription_response = {
  subscription_arn : subscription_ar_n option; [@ocaml.doc "The ARN of the created subscription.\n"]
}
[@@ocaml.doc "Response for ConfirmSubscriptions action.\n"]

type nonrec authenticate_on_unsubscribe = string [@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec confirm_subscription_input = {
  topic_arn : topic_ar_n;
      [@ocaml.doc "The ARN of the topic for which you wish to confirm a subscription.\n"]
  token : token;
      [@ocaml.doc "Short-lived token sent to an endpoint during the [Subscribe] action.\n"]
  authenticate_on_unsubscribe : authenticate_on_unsubscribe option;
      [@ocaml.doc
        "Disallows unauthenticated unsubscribes of the subscription. If the value of this \
         parameter is [true] and the request has an Amazon Web Services signature, then only the \
         topic owner and the subscription owner can unsubscribe the endpoint. The unsubscribe \
         action requires Amazon Web Services authentication. \n"]
}
[@@ocaml.doc "Input for ConfirmSubscription action.\n"]

type nonrec check_if_phone_number_is_opted_out_response = {
  is_opted_out : boolean_ option;
      [@ocaml.doc
        "Indicates whether the phone number is opted out:\n\n\
        \ {ul\n\
        \       {-   [true] \226\128\147 The phone number is opted out, meaning you cannot publish \
         SMS messages to it.\n\
        \           \n\
        \            }\n\
        \       {-   [false] \226\128\147 The phone number is opted in, meaning you can publish \
         SMS messages to it.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The response from the [CheckIfPhoneNumberIsOptedOut] action.\n"]

type nonrec check_if_phone_number_is_opted_out_input = {
  phone_number : phone_number;
      [@ocaml.doc "The phone number for which you want to check the opt out status.\n"]
}
[@@ocaml.doc "The input for the [CheckIfPhoneNumberIsOptedOut] action.\n"]
