type nonrec error_message = string [@@ocaml.doc ""]

type nonrec account_sending_paused_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that email sending is disabled for your entire Amazon SES account.\n\n\
  \ You can enable or disable email sending for your Amazon SES account using \
   [UpdateAccountSendingEnabled].\n\
  \ "]

type nonrec header_value = string [@@ocaml.doc ""]

type nonrec header_name = string [@@ocaml.doc ""]

type nonrec add_header_action = {
  header_name : header_name;
      [@ocaml.doc
        "The name of the header to add to the incoming message. The name must contain at least one \
         character, and can contain up to 50 characters. It consists of alphanumeric \
         (a\226\128\147z, A\226\128\147Z, 0\226\128\1479) characters and dashes.\n"]
  header_value : header_value;
      [@ocaml.doc
        "The content to include in the header. This value can contain up to 2048 characters. It \
         can't contain newline ([\\n]) or carriage return ([\\r]) characters.\n"]
}
[@@ocaml.doc
  "When included in a receipt rule, this action adds a header to the received email.\n\n\
  \ For information about adding a header using a receipt rule, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-add-header.html}Amazon SES \
   Developer Guide}.\n\
  \ "]

type nonrec address = string [@@ocaml.doc ""]

type nonrec address_list = address list [@@ocaml.doc ""]

type nonrec rule_or_rule_set_name = string [@@ocaml.doc ""]

type nonrec already_exists_exception = {
  name : rule_or_rule_set_name option;
      [@ocaml.doc
        "Indicates that a resource could not be created because the resource name already exists.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that a resource could not be created because of a naming conflict.\n"]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec arrival_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec behavior_on_mx_failure =
  | UseDefaultValue [@ocaml.doc ""]
  | RejectMessage [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec charset = string [@@ocaml.doc ""]

type nonrec message_data = string [@@ocaml.doc ""]

type nonrec content = {
  data : message_data; [@ocaml.doc "The textual data of the content.\n"]
  charset : charset option; [@ocaml.doc "The character set of the content.\n"]
}
[@@ocaml.doc
  "Represents textual data, plus an optional character set specification.\n\n\
  \ By default, the text must be 7-bit ASCII, due to the constraints of the SMTP protocol. If the \
   text must contain any other characters, then you must also specify a character set. Examples \
   include UTF-8, ISO-8859-1, and Shift_JIS.\n\
  \ "]

type nonrec body = {
  text : content option;
      [@ocaml.doc
        "The content of the message, in text format. Use this for text-based email clients, or \
         clients on high-latency networks (such as mobile devices).\n"]
  html : content option;
      [@ocaml.doc
        "The content of the message, in HTML format. Use this for email clients that can process \
         HTML. You can include clickable links, formatted text, and much more in an HTML message.\n"]
}
[@@ocaml.doc
  "Represents the body of the message. You can specify text, HTML, or both. If you use both, then \
   the message should display correctly in the widest variety of email clients.\n"]

type nonrec bounce_message = string [@@ocaml.doc ""]

type nonrec bounce_status_code = string [@@ocaml.doc ""]

type nonrec bounce_smtp_reply_code = string [@@ocaml.doc ""]

type nonrec bounce_action = {
  topic_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the bounce action \
         is taken. You can find the ARN of a topic by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} operation \
         in Amazon SNS.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
  smtp_reply_code : bounce_smtp_reply_code;
      [@ocaml.doc
        "The SMTP reply code, as defined by {{:https://tools.ietf.org/html/rfc5321}RFC 5321}.\n"]
  status_code : bounce_status_code option;
      [@ocaml.doc
        "The SMTP enhanced status code, as defined by {{:https://tools.ietf.org/html/rfc3463}RFC \
         3463}.\n"]
  message : bounce_message; [@ocaml.doc "Human-readable text to include in the bounce message.\n"]
  sender : address;
      [@ocaml.doc
        "The email address of the sender of the bounced email. This is the address from which the \
         bounce message is sent.\n"]
}
[@@ocaml.doc
  "When included in a receipt rule, this action rejects the received email by returning a bounce \
   response to the sender and, optionally, publishes a notification to Amazon Simple Notification \
   Service (Amazon SNS).\n\n\
  \ For information about sending a bounce message in response to a received email, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-bounce.html}Amazon SES \
   Developer Guide}.\n\
  \ "]

type nonrec bounce_type =
  | DoesNotExist [@ocaml.doc ""]
  | MessageTooLarge [@ocaml.doc ""]
  | ExceededQuota [@ocaml.doc ""]
  | ContentRejected [@ocaml.doc ""]
  | Undefined [@ocaml.doc ""]
  | TemporaryFailure [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec extension_field_value = string [@@ocaml.doc ""]

type nonrec extension_field_name = string [@@ocaml.doc ""]

type nonrec extension_field = {
  name : extension_field_name;
      [@ocaml.doc
        "The name of the header to add. Must be between 1 and 50 characters, inclusive, and \
         consist of alphanumeric (a-z, A-Z, 0-9) characters and dashes only.\n"]
  value : extension_field_value;
      [@ocaml.doc
        "The value of the header to add. Must contain 2048 characters or fewer, and must not \
         contain newline characters (\"\\r\" or \"\\n\").\n"]
}
[@@ocaml.doc
  "Additional X-headers to include in the Delivery Status Notification (DSN) when an email that \
   Amazon SES receives on your behalf bounces.\n\n\
  \ For information about receiving email through Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html}Amazon SES Developer Guide}.\n\
  \ "]

type nonrec extension_field_list = extension_field list [@@ocaml.doc ""]

type nonrec last_attempt_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec diagnostic_code = string [@@ocaml.doc ""]

type nonrec dsn_status = string [@@ocaml.doc ""]

type nonrec remote_mta = string [@@ocaml.doc ""]

type nonrec dsn_action =
  | FAILED [@ocaml.doc ""]
  | DELAYED [@ocaml.doc ""]
  | DELIVERED [@ocaml.doc ""]
  | RELAYED [@ocaml.doc ""]
  | EXPANDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recipient_dsn_fields = {
  final_recipient : address option;
      [@ocaml.doc
        "The email address that the message was ultimately delivered to. This corresponds to the \
         [Final-Recipient] in the DSN. If not specified, [FinalRecipient] is set to the \
         [Recipient] specified in the [BouncedRecipientInfo] structure. Either [FinalRecipient] or \
         the recipient in [BouncedRecipientInfo] must be a recipient of the original bounced \
         message.\n\n\
        \  Do not prepend the [FinalRecipient] email address with [rfc\n\
        \                    822;], as described in {{:https://tools.ietf.org/html/rfc3798}RFC \
         3798}.\n\
        \  \n\
        \   "]
  action : dsn_action;
      [@ocaml.doc
        "The action performed by the reporting mail transfer agent (MTA) as a result of its \
         attempt to deliver the message to the recipient address. This is required by \
         {{:https://tools.ietf.org/html/rfc3464}RFC 3464}.\n"]
  remote_mta : remote_mta option;
      [@ocaml.doc
        "The MTA to which the remote MTA attempted to deliver the message, formatted as specified \
         in {{:https://tools.ietf.org/html/rfc3464}RFC 3464} ([mta-name-type; mta-name]). This \
         parameter typically applies only to propagating synchronous bounces.\n"]
  status : dsn_status;
      [@ocaml.doc
        "The status code that indicates what went wrong. This is required by \
         {{:https://tools.ietf.org/html/rfc3464}RFC 3464}.\n"]
  diagnostic_code : diagnostic_code option;
      [@ocaml.doc
        "An extended explanation of what went wrong; this is usually an SMTP response. See \
         {{:https://tools.ietf.org/html/rfc3463}RFC 3463} for the correct formatting of this \
         parameter.\n"]
  last_attempt_date : last_attempt_date option;
      [@ocaml.doc
        "The time the final delivery attempt was made, in \
         {{:https://www.ietf.org/rfc/rfc0822.txt}RFC 822} date-time format.\n"]
  extension_fields : extension_field_list option;
      [@ocaml.doc "Additional X-headers to include in the DSN.\n"]
}
[@@ocaml.doc
  "Recipient-related information to include in the Delivery Status Notification (DSN) when an \
   email that Amazon SES receives on your behalf bounces.\n\n\
  \ For information about receiving email through Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html}Amazon SES Developer Guide}.\n\
  \ "]

type nonrec bounced_recipient_info = {
  recipient : address; [@ocaml.doc "The email address of the recipient of the bounced email.\n"]
  recipient_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to receive email for \
         the recipient of the bounced email. For more information about sending authorization, see \
         the {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n"]
  bounce_type : bounce_type option;
      [@ocaml.doc
        "The reason for the bounce. You must provide either this parameter or [RecipientDsnFields].\n"]
  recipient_dsn_fields : recipient_dsn_fields option;
      [@ocaml.doc
        "Recipient-related DSN fields, most of which would normally be filled in automatically \
         when provided with a [BounceType]. You must provide either this parameter or [BounceType].\n"]
}
[@@ocaml.doc
  "Recipient-related information to include in the Delivery Status Notification (DSN) when an \
   email that Amazon SES receives on your behalf bounces.\n\n\
  \ For information about receiving email through Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html}Amazon SES Developer Guide}.\n\
  \ "]

type nonrec bounced_recipient_info_list = bounced_recipient_info list [@@ocaml.doc ""]

type nonrec template_data = string [@@ocaml.doc ""]

type nonrec message_tag_value = string [@@ocaml.doc ""]

type nonrec message_tag_name = string [@@ocaml.doc ""]

type nonrec message_tag = {
  name : message_tag_name;
      [@ocaml.doc
        "The name of the tag. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Contain 256 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  value : message_tag_value;
      [@ocaml.doc
        "The value of the tag. The value must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Contain 256 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains the name and value of a tag that you can provide to [SendEmail] or [SendRawEmail] to \
   apply to an email.\n\n\
  \ Message tags, which you use with configuration sets, enable you to publish email sending \
   events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\
  \ "]

type nonrec message_tag_list = message_tag list [@@ocaml.doc ""]

type nonrec destination = {
  to_addresses : address_list option;
      [@ocaml.doc "The recipients to place on the To: line of the message.\n"]
  cc_addresses : address_list option;
      [@ocaml.doc "The recipients to place on the CC: line of the message.\n"]
  bcc_addresses : address_list option;
      [@ocaml.doc "The recipients to place on the BCC: line of the message.\n"]
}
[@@ocaml.doc
  "Represents the destination of the message, consisting of To:, CC:, and BCC: fields.\n\n\
  \  Amazon SES does not support the SMTPUTF8 extension, as described in \
   {{:https://tools.ietf.org/html/rfc6531}RFC6531}. For this reason, the email address string must \
   be 7-bit ASCII. If you want to send to or from email addresses that contain Unicode characters \
   in the domain part of an address, you must encode the domain using Punycode. Punycode is not \
   permitted in the local part of the email address (the part before the \\@ sign) nor in the \
   \"friendly from\" name. If you want to use Unicode characters in the \"friendly from\" name, \
   you must encode the \"friendly from\" name using MIME encoded-word syntax, as described in \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Sending raw email using the \
   Amazon SES API}. For more information about Punycode, see \
   {{:http://tools.ietf.org/html/rfc3492}RFC 3492}.\n\
  \  \n\
  \   "]

type nonrec bulk_email_destination = {
  destination : destination; [@ocaml.doc ""]
  replacement_tags : message_tag_list option;
      [@ocaml.doc
        "A list of tags, in the form of name/value pairs, to apply to an email that you send using \
         [SendBulkTemplatedEmail]. Tags correspond to characteristics of the email that you \
         define, so that you can publish email sending events.\n"]
  replacement_template_data : template_data option;
      [@ocaml.doc
        "A list of replacement values to apply to the template. This parameter is a JSON object, \
         typically consisting of key-value pairs in which the keys correspond to replacement tags \
         in the email template.\n"]
}
[@@ocaml.doc
  "An array that contains one or more Destinations, as well as the tags and replacement data \
   associated with each of those Destinations.\n"]

type nonrec bulk_email_destination_list = bulk_email_destination list [@@ocaml.doc ""]

type nonrec message_id = string [@@ocaml.doc ""]

type nonrec error = string [@@ocaml.doc ""]

type nonrec bulk_email_status =
  | Success [@ocaml.doc ""]
  | MessageRejected [@ocaml.doc ""]
  | MailFromDomainNotVerified [@ocaml.doc ""]
  | ConfigurationSetDoesNotExist [@ocaml.doc ""]
  | TemplateDoesNotExist [@ocaml.doc ""]
  | AccountSuspended [@ocaml.doc ""]
  | AccountThrottled [@ocaml.doc ""]
  | AccountDailyQuotaExceeded [@ocaml.doc ""]
  | InvalidSendingPoolName [@ocaml.doc ""]
  | AccountSendingPaused [@ocaml.doc ""]
  | ConfigurationSetSendingPaused [@ocaml.doc ""]
  | InvalidParameterValue [@ocaml.doc ""]
  | TransientFailure [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec bulk_email_destination_status = {
  status : bulk_email_status option;
      [@ocaml.doc
        "The status of a message sent using the [SendBulkTemplatedEmail] operation.\n\n\
        \ Possible values for this parameter include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Success]: Amazon SES accepted the message, and attempts to deliver it to \
         the recipients.\n\
        \            \n\
        \             }\n\
        \        {-   [MessageRejected]: The message was rejected because it contained a virus.\n\
        \            \n\
        \             }\n\
        \        {-   [MailFromDomainNotVerified]: The sender's email address or domain was not \
         verified.\n\
        \            \n\
        \             }\n\
        \        {-   [ConfigurationSetDoesNotExist]: The configuration set you specified does not \
         exist.\n\
        \            \n\
        \             }\n\
        \        {-   [TemplateDoesNotExist]: The template you specified does not exist.\n\
        \            \n\
        \             }\n\
        \        {-   [AccountSuspended]: Your account has been shut down because of issues \
         related to your email sending practices.\n\
        \            \n\
        \             }\n\
        \        {-   [AccountThrottled]: The number of emails you can send has been reduced \
         because your account has exceeded its allocated sending limit.\n\
        \            \n\
        \             }\n\
        \        {-   [AccountDailyQuotaExceeded]: You have reached or exceeded the maximum number \
         of emails you can send from your account in a 24-hour period.\n\
        \            \n\
        \             }\n\
        \        {-   [InvalidSendingPoolName]: The configuration set you specified refers to an \
         IP pool that does not exist.\n\
        \            \n\
        \             }\n\
        \        {-   [AccountSendingPaused]: Email sending for the Amazon SES account was \
         disabled using the [UpdateAccountSendingEnabled] operation.\n\
        \            \n\
        \             }\n\
        \        {-   [ConfigurationSetSendingPaused]: Email sending for this configuration set \
         was disabled using the [UpdateConfigurationSetSendingEnabled] operation.\n\
        \            \n\
        \             }\n\
        \        {-   [InvalidParameterValue]: One or more of the parameters you specified when \
         calling this operation was invalid. See the error message for additional information.\n\
        \            \n\
        \             }\n\
        \        {-   [TransientFailure]: Amazon SES was unable to process your request because of \
         a temporary issue.\n\
        \            \n\
        \             }\n\
        \        {-   [Failed]: Amazon SES was unable to process your request. See the error \
         message for additional information.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  error : error option;
      [@ocaml.doc
        "A description of an error that prevented a message being sent using the \
         [SendBulkTemplatedEmail] operation.\n"]
  message_id : message_id option;
      [@ocaml.doc
        "The unique message identifier returned from the [SendBulkTemplatedEmail] operation.\n"]
}
[@@ocaml.doc "An object that contains the response from the [SendBulkTemplatedEmail] operation.\n"]

type nonrec bulk_email_destination_status_list = bulk_email_destination_status list [@@ocaml.doc ""]

type nonrec cannot_delete_exception = {
  name : rule_or_rule_set_name option;
      [@ocaml.doc
        "Indicates that a resource could not be deleted because no resource with the specified \
         name exists.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the delete operation could not be completed.\n"]

type nonrec cidr = string [@@ocaml.doc ""]

type nonrec rule_set_does_not_exist_exception = {
  name : rule_or_rule_set_name option;
      [@ocaml.doc "Indicates that the named receipt rule set does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the provided receipt rule set does not exist.\n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that a resource could not be created because of service limits. For a list of Amazon \
   SES limits, see the {{:https://docs.aws.amazon.com/ses/latest/DeveloperGuide/limits.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec clone_receipt_rule_set_response = unit [@@ocaml.doc ""]

type nonrec receipt_rule_set_name = string [@@ocaml.doc ""]

type nonrec clone_receipt_rule_set_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc
        "The name of the rule set to create. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Start and end with a letter or number.\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  original_rule_set_name : receipt_rule_set_name; [@ocaml.doc "The name of the rule set to clone.\n"]
}
[@@ocaml.doc
  "Represents a request to create a receipt rule set by cloning an existing one. You use receipt \
   rule sets to receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec default_dimension_value = string [@@ocaml.doc ""]

type nonrec dimension_value_source =
  | MESSAGE_TAG [@ocaml.doc ""]
  | EMAIL_HEADER [@ocaml.doc ""]
  | LINK_TAG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dimension_name = string [@@ocaml.doc ""]

type nonrec cloud_watch_dimension_configuration = {
  dimension_name : dimension_name;
      [@ocaml.doc
        "The name of an Amazon CloudWatch dimension associated with an email sending metric. The \
         name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), dashes \
         (-), or colons (:).\n\
        \           \n\
        \            }\n\
        \       {-  Contain 256 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dimension_value_source : dimension_value_source;
      [@ocaml.doc
        "The place where Amazon SES finds the value of a dimension to publish to Amazon \
         CloudWatch. To use the message tags that you specify using an [X-SES-MESSAGE-TAGS] header \
         or a parameter to the [SendEmail]/[SendRawEmail] API, specify [messageTag]. To use your \
         own email headers, specify [emailHeader]. To put a custom tag on any link included in \
         your email, specify [linkTag].\n"]
  default_dimension_value : default_dimension_value;
      [@ocaml.doc
        "The default value of the dimension that is published to Amazon CloudWatch if you do not \
         provide the value of the dimension when you send an email. The default value must meet \
         the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), dashes \
         (-), at signs (\\@), or periods (.).\n\
        \           \n\
        \            }\n\
        \       {-  Contain 256 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains the dimension configuration to use when you publish email sending events to Amazon \
   CloudWatch.\n\n\
  \ For information about publishing email sending events to Amazon CloudWatch, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\
  \ "]

type nonrec cloud_watch_dimension_configurations = cloud_watch_dimension_configuration list
[@@ocaml.doc ""]

type nonrec cloud_watch_destination = {
  dimension_configurations : cloud_watch_dimension_configurations;
      [@ocaml.doc
        "A list of dimensions upon which to categorize your emails when you publish email sending \
         events to Amazon CloudWatch.\n"]
}
[@@ocaml.doc
  "Contains information associated with an Amazon CloudWatch event destination to which email \
   sending events are published.\n\n\
  \ Event destinations, such as Amazon CloudWatch, are associated with configuration sets, which \
   enable you to publish email sending events. For information about using configuration sets, see \
   the {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES \
   Developer Guide}.\n\
  \ "]

type nonrec configuration_set_name = string [@@ocaml.doc ""]

type nonrec configuration_set = {
  name : configuration_set_name;
      [@ocaml.doc
        "The name of the configuration set. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The name of the configuration set.\n\n\
  \ Configuration sets let you create groups of rules that you can apply to the emails you send \
   using Amazon SES. For more information about using configuration sets, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/using-configuration-sets.html}Using Amazon SES \
   Configuration Sets} in the {{:https://docs.aws.amazon.com/ses/latest/dg/}Amazon SES Developer \
   Guide}.\n\
  \ "]

type nonrec configuration_set_already_exists_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the configuration set could not be created because of a naming conflict.\n"]

type nonrec configuration_set_attribute =
  | EVENT_DESTINATIONS [@ocaml.doc ""]
  | TRACKING_OPTIONS [@ocaml.doc ""]
  | DELIVERY_OPTIONS [@ocaml.doc ""]
  | REPUTATION_OPTIONS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec configuration_set_attribute_list = configuration_set_attribute list [@@ocaml.doc ""]

type nonrec configuration_set_does_not_exist_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the configuration set does not exist.\n"]

type nonrec configuration_set_sending_paused_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set for which email sending is disabled.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that email sending is disabled for the configuration set.\n\n\
  \ You can enable or disable email sending for a configuration set using \
   [UpdateConfigurationSetSendingEnabled].\n\
  \ "]

type nonrec configuration_sets = configuration_set list [@@ocaml.doc ""]

type nonrec iam_role_ar_n = string [@@ocaml.doc ""]

type nonrec connect_instance_arn = string [@@ocaml.doc ""]

type nonrec connect_action = {
  instance_ar_n : connect_instance_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the Amazon Connect instance that Amazon SES integrates \
         with for starting email contacts.\n\n\
        \ For more information about Amazon Connect instances, see the \
         {{:https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-instances.html}Amazon \
         Connect Administrator Guide} \n\
        \ "]
  iam_role_ar_n : iam_role_ar_n;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the IAM role to be used by Amazon Simple Email Service \
         while starting email contacts to the Amazon Connect instance. This role should have \
         permission to invoke [connect:StartEmailContact] for the given Amazon Connect instance.\n"]
}
[@@ocaml.doc
  "When included in a receipt rule, this action parses the received message and starts an email \
   contact in Amazon Connect on your behalf.\n\n\
  \  When you receive emails, the maximum email size (including headers) is 40 MB. Additionally, \
   emails may only have up to 10 attachments. Emails larger than 40 MB or with more than 10 \
   attachments will be bounced.\n\
  \  \n\
  \    We recommend that you configure this action via Amazon Connect.\n\
  \    "]

type nonrec counter = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec invalid_configuration_set_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the configuration set is invalid. See the error message for details.\n"]

type nonrec create_configuration_set_response = unit [@@ocaml.doc ""]

type nonrec create_configuration_set_request = {
  configuration_set : configuration_set;
      [@ocaml.doc "A data structure that contains the name of the configuration set.\n"]
}
[@@ocaml.doc
  "Represents a request to create a configuration set. Configuration sets enable you to publish \
   email sending events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec event_destination_name = string [@@ocaml.doc ""]

type nonrec invalid_sns_destination_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  event_destination_name : event_destination_name option;
      [@ocaml.doc "Indicates that the event destination does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the Amazon Simple Notification Service (Amazon SNS) destination is invalid. See \
   the error message for details.\n"]

type nonrec invalid_firehose_destination_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  event_destination_name : event_destination_name option;
      [@ocaml.doc "Indicates that the event destination does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the Amazon Kinesis Firehose destination is invalid. See the error message for \
   details.\n"]

type nonrec invalid_cloud_watch_destination_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  event_destination_name : event_destination_name option;
      [@ocaml.doc "Indicates that the event destination does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the Amazon CloudWatch destination is invalid. See the error message for details.\n"]

type nonrec event_destination_already_exists_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  event_destination_name : event_destination_name option;
      [@ocaml.doc "Indicates that the event destination does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the event destination could not be created because of a naming conflict.\n"]

type nonrec create_configuration_set_event_destination_response = unit [@@ocaml.doc ""]

type nonrec sns_destination = {
  topic_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the Amazon SNS topic for email sending events. You can find the ARN of a topic \
         by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} Amazon SNS \
         operation.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "Contains the topic ARN associated with an Amazon Simple Notification Service (Amazon SNS) event \
   destination.\n\n\
  \ Event destinations, such as Amazon SNS, are associated with configuration sets, which enable \
   you to publish email sending events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\
  \ "]

type nonrec kinesis_firehose_destination = {
  iam_role_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the IAM role under which Amazon SES publishes email sending events to the \
         Amazon Kinesis Firehose stream.\n"]
  delivery_stream_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The ARN of the Amazon Kinesis Firehose stream that email sending events should be \
         published to.\n"]
}
[@@ocaml.doc
  "Contains the delivery stream ARN and the IAM role ARN associated with an Amazon Kinesis \
   Firehose event destination.\n\n\
  \ Event destinations, such as Amazon Kinesis Firehose, are associated with configuration sets, \
   which enable you to publish email sending events. For information about using configuration \
   sets, see the {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon \
   SES Developer Guide}.\n\
  \ "]

type nonrec event_type =
  | SEND [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
  | BOUNCE [@ocaml.doc ""]
  | COMPLAINT [@ocaml.doc ""]
  | DELIVERY [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""]
  | CLICK [@ocaml.doc ""]
  | RENDERING_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_types = event_type list [@@ocaml.doc ""]

type nonrec enabled = bool [@@ocaml.doc ""]

type nonrec event_destination = {
  name : event_destination_name;
      [@ocaml.doc
        "The name of the event destination. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  enabled : enabled option;
      [@ocaml.doc
        "Sets whether Amazon SES publishes events to this destination when you send an email with \
         the associated configuration set. Set to [true] to enable publishing to this destination; \
         set to [false] to prevent publishing to this destination. The default value is [false].\n"]
  matching_event_types : event_types;
      [@ocaml.doc
        "The type of email sending events to publish to the event destination.\n\n\
        \ {ul\n\
        \       {-   [send] - The call was successful and Amazon SES is attempting to deliver the \
         email.\n\
        \           \n\
        \            }\n\
        \       {-   [reject] - Amazon SES determined that the email contained a virus and \
         rejected it.\n\
        \           \n\
        \            }\n\
        \       {-   [bounce] - The recipient's mail server permanently rejected the email. This \
         corresponds to a hard bounce.\n\
        \           \n\
        \            }\n\
        \       {-   [complaint] - The recipient marked the email as spam.\n\
        \           \n\
        \            }\n\
        \       {-   [delivery] - Amazon SES successfully delivered the email to the recipient's \
         mail server.\n\
        \           \n\
        \            }\n\
        \       {-   [open] - The recipient received the email and opened it in their email client.\n\
        \           \n\
        \            }\n\
        \       {-   [click] - The recipient clicked one or more links in the email.\n\
        \           \n\
        \            }\n\
        \       {-   [renderingFailure] - Amazon SES did not send the email because of a template \
         rendering issue.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  kinesis_firehose_destination : kinesis_firehose_destination option;
      [@ocaml.doc
        "An object that contains the delivery stream ARN and the IAM role ARN associated with an \
         Amazon Kinesis Firehose event destination.\n"]
  cloud_watch_destination : cloud_watch_destination option;
      [@ocaml.doc
        "An object that contains the names, default values, and sources of the dimensions \
         associated with an Amazon CloudWatch event destination.\n"]
  sns_destination : sns_destination option;
      [@ocaml.doc
        "An object that contains the topic ARN associated with an Amazon Simple Notification \
         Service (Amazon SNS) event destination.\n"]
}
[@@ocaml.doc
  "Contains information about an event destination.\n\n\
  \  When you create or update an event destination, you must provide one, and only one, \
   destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose or Amazon Simple \
   Notification Service (Amazon SNS).\n\
  \  \n\
  \    Event destinations are associated with configuration sets, which enable you to publish \
   email sending events to Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple \
   Notification Service (Amazon SNS). For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\
  \    "]

type nonrec create_configuration_set_event_destination_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc
        "The name of the configuration set that the event destination should be associated with.\n"]
  event_destination : event_destination;
      [@ocaml.doc
        "An object that describes the Amazon Web Services service that email sending event where \
         information is published.\n"]
}
[@@ocaml.doc
  "Represents a request to create a configuration set event destination. A configuration set event \
   destination, which can be either Amazon CloudWatch or Amazon Kinesis Firehose, describes an \
   Amazon Web Services service in which Amazon SES publishes the email sending events associated \
   with a configuration set. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec tracking_options_already_exists_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc
        "Indicates that a TrackingOptions object already exists in the specified configuration set.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the configuration set you specified already contains a TrackingOptions object.\n"]

type nonrec invalid_tracking_options_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the custom domain to be used for open and click tracking redirects is invalid. \
   This error appears most often in the following situations:\n\n\
  \ {ul\n\
  \       {-  When the tracking domain you specified is not verified in Amazon SES.\n\
  \           \n\
  \            }\n\
  \       {-  When the tracking domain you specified is not a valid domain or subdomain.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec create_configuration_set_tracking_options_response = unit [@@ocaml.doc ""]

type nonrec custom_redirect_domain = string [@@ocaml.doc ""]

type nonrec tracking_options = {
  custom_redirect_domain : custom_redirect_domain option;
      [@ocaml.doc
        "The custom subdomain that is used to redirect email recipients to the Amazon SES event \
         tracking domain.\n"]
}
[@@ocaml.doc
  "A domain that is used to redirect email recipients to an Amazon SES-operated domain. This \
   domain captures open and click events generated by Amazon SES emails.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html}Configuring \
   Custom Domains to Handle Open and Click Tracking} in the {i Amazon SES Developer Guide}.\n\
  \ "]

type nonrec create_configuration_set_tracking_options_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc
        "The name of the configuration set that the tracking options should be associated with.\n"]
  tracking_options : tracking_options; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Represents a request to create an open and click tracking option object in a configuration set. \n"]

type nonrec from_address = string [@@ocaml.doc ""]

type nonrec from_email_address_not_verified_exception = {
  from_email_address : from_address option;
      [@ocaml.doc
        "Indicates that the from email address associated with the custom verification email \
         template is not verified.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the sender address specified for a custom verification email is not verified, \
   and is therefore not eligible to send the custom verification email. \n"]

type nonrec template_name = string [@@ocaml.doc ""]

type nonrec custom_verification_email_template_already_exists_exception = {
  custom_verification_email_template_name : template_name option;
      [@ocaml.doc
        "Indicates that the provided custom verification email template with the specified \
         template name already exists.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that a custom verification email template with the name you specified already exists.\n"]

type nonrec custom_verification_email_invalid_content_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that custom verification email template provided content is invalid.\n"]

type nonrec failure_redirection_ur_l = string [@@ocaml.doc ""]

type nonrec success_redirection_ur_l = string [@@ocaml.doc ""]

type nonrec template_content = string [@@ocaml.doc ""]

type nonrec subject = string [@@ocaml.doc ""]

type nonrec create_custom_verification_email_template_request = {
  template_name : template_name;
      [@ocaml.doc "The name of the custom verification email template.\n"]
  from_email_address : from_address;
      [@ocaml.doc "The email address that the custom verification email is sent from.\n"]
  template_subject : subject; [@ocaml.doc "The subject line of the custom verification email.\n"]
  template_content : template_content;
      [@ocaml.doc
        "The content of the custom verification email. The total size of the email must be less \
         than 10 MB. The message body may contain HTML, with some limitations. For more \
         information, see \
         {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Custom \
         Verification Email Frequently Asked Questions} in the {i Amazon SES Developer Guide}.\n"]
  success_redirection_ur_l : success_redirection_ur_l;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         successfully verified.\n"]
  failure_redirection_ur_l : failure_redirection_ur_l;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         not successfully verified.\n"]
}
[@@ocaml.doc "Represents a request to create a custom verification email template.\n"]

type nonrec create_receipt_filter_response = unit [@@ocaml.doc ""]

type nonrec receipt_filter_policy = Block [@ocaml.doc ""] | Allow [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec receipt_ip_filter = {
  policy : receipt_filter_policy;
      [@ocaml.doc
        "Indicates whether to block or allow incoming mail from the specified IP addresses.\n"]
  cidr : cidr;
      [@ocaml.doc
        "A single IP address or a range of IP addresses to block or allow, specified in Classless \
         Inter-Domain Routing (CIDR) notation. An example of a single email address is 10.0.0.1. \
         An example of a range of IP addresses is 10.0.0.1/24. For more information about CIDR \
         notation, see {{:https://tools.ietf.org/html/rfc2317}RFC 2317}.\n"]
}
[@@ocaml.doc
  "A receipt IP address filter enables you to specify whether to accept or reject mail originating \
   from an IP address or range of IP addresses.\n\n\
  \ For information about setting up IP address filters, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ "]

type nonrec receipt_filter_name = string [@@ocaml.doc ""]

type nonrec receipt_filter = {
  name : receipt_filter_name;
      [@ocaml.doc
        "The name of the IP address filter. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Start and end with a letter or number.\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ip_filter : receipt_ip_filter;
      [@ocaml.doc
        "A structure that provides the IP addresses to block or allow, and whether to block or \
         allow incoming mail from them.\n"]
}
[@@ocaml.doc
  "A receipt IP address filter enables you to specify whether to accept or reject mail originating \
   from an IP address or range of IP addresses.\n\n\
  \ For information about setting up IP address filters, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ "]

type nonrec create_receipt_filter_request = {
  filter : receipt_filter;
      [@ocaml.doc
        "A data structure that describes the IP address filter to create, which consists of a \
         name, an IP address range, and whether to allow or block mail from it.\n"]
}
[@@ocaml.doc
  "Represents a request to create a new IP address filter. You use IP address filters when you \
   receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec rule_does_not_exist_exception = {
  name : rule_or_rule_set_name option;
      [@ocaml.doc "Indicates that the named receipt rule does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the provided receipt rule does not exist.\n"]

type nonrec invalid_sns_topic_exception = {
  topic : amazon_resource_name option; [@ocaml.doc "Indicates that the topic does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the provided Amazon SNS topic is invalid, or that Amazon SES could not publish \
   to the topic, possibly due to permissions issues. For information about giving permissions, see \
   the \
   {{:https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec invalid_s3_configuration_exception = {
  bucket : s3_bucket_name option; [@ocaml.doc "Indicated that the S3 Bucket was not found.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the provided Amazon S3 bucket or Amazon Web Services KMS encryption key is \
   invalid, or that Amazon SES could not publish to the bucket, possibly due to permissions \
   issues. For information about giving permissions, see the \
   {{:https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec invalid_lambda_function_exception = {
  function_arn : amazon_resource_name option;
      [@ocaml.doc "Indicates that the ARN of the function was not found.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the provided Amazon Web Services Lambda function is invalid, or that Amazon SES \
   could not execute the provided function, possibly due to permissions issues. For information \
   about giving permissions, see the \
   {{:https://docs.aws.amazon.com/ses/latest/DeveloperGuide/receiving-email-permissions.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec create_receipt_rule_response = unit [@@ocaml.doc ""]

type nonrec sns_action_encoding = UTF8 [@ocaml.doc ""] | Base64 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sns_action = {
  topic_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to notify. You can find the ARN of \
         a topic by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} operation \
         in Amazon SNS.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
  encoding : sns_action_encoding option;
      [@ocaml.doc
        "The encoding to use for the email within the Amazon SNS notification. UTF-8 is easier to \
         use, but may not preserve all special characters when a message was encoded with a \
         different encoding format. Base64 preserves all special characters. The default value is \
         UTF-8.\n"]
}
[@@ocaml.doc
  "When included in a receipt rule, this action publishes a notification to Amazon Simple \
   Notification Service (Amazon SNS). This action includes a complete copy of the email content in \
   the Amazon SNS notifications. Amazon SNS notifications for all other actions simply provide \
   information about the email. They do not include the email content itself.\n\n\
  \ If you own the Amazon SNS topic, you don't need to do anything to give Amazon SES permission \
   to publish emails to it. However, if you don't own the Amazon SNS topic, you need to attach a \
   policy to the topic to give Amazon SES permissions to access it. For information about giving \
   permissions, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html}Amazon SES \
   Developer Guide}.\n\
  \ \n\
  \   You can only publish emails that are 150 KB or less (including the header) to Amazon SNS. \
   Larger emails bounce. If you anticipate emails larger than 150 KB, use the S3 action instead.\n\
  \   \n\
  \     For information about using a receipt rule to publish an Amazon SNS notification, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-sns.html}Amazon SES \
   Developer Guide}.\n\
  \     "]

type nonrec stop_scope = RULE_SET [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec stop_action = {
  scope : stop_scope;
      [@ocaml.doc "The scope of the StopAction. The only acceptable value is [RuleSet].\n"]
  topic_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the stop action is \
         taken. You can find the ARN of a topic by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} Amazon SNS \
         operation.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "When included in a receipt rule, this action terminates the evaluation of the receipt rule set \
   and, optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).\n\n\
  \ For information about setting a stop action in a receipt rule, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-stop.html}Amazon SES \
   Developer Guide}.\n\
  \ "]

type nonrec invocation_type = Event [@ocaml.doc ""] | RequestResponse [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_action = {
  topic_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the Lambda action \
         is executed. You can find the ARN of a topic by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} operation \
         in Amazon SNS.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
  function_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function. An example of \
         an Amazon Web Services Lambda function ARN is \
         [arn:aws:lambda:us-west-2:account-id:function:MyFunction]. For more information about \
         Amazon Web Services Lambda, see the \
         {{:https://docs.aws.amazon.com/lambda/latest/dg/welcome.html}Amazon Web Services Lambda \
         Developer Guide}.\n"]
  invocation_type : invocation_type option;
      [@ocaml.doc
        "The invocation type of the Amazon Web Services Lambda function. An invocation type of \
         [RequestResponse] means that the execution of the function immediately results in a \
         response, and a value of [Event] means that the function is invoked asynchronously. The \
         default value is [Event]. For information about Amazon Web Services Lambda invocation \
         types, see the {{:https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html}Amazon Web \
         Services Lambda Developer Guide}.\n\n\
        \  There is a 30-second timeout on [RequestResponse] invocations. You should use [Event] \
         invocation in most cases. Use [RequestResponse] only to make a mail flow decision, such \
         as whether to stop the receipt rule or the receipt rule set.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "When included in a receipt rule, this action calls an Amazon Web Services Lambda function and, \
   optionally, publishes a notification to Amazon Simple Notification Service (Amazon SNS).\n\n\
  \ To enable Amazon SES to call your Amazon Web Services Lambda function or to publish to an \
   Amazon SNS topic of another account, Amazon SES must have permission to access those resources. \
   For information about giving permissions, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html}Amazon SES \
   Developer Guide}.\n\
  \ \n\
  \  For information about using Amazon Web Services Lambda actions in receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-lambda.html}Amazon SES \
   Developer Guide}.\n\
  \  "]

type nonrec workmail_action = {
  topic_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to notify when the WorkMail action \
         is called. You can find the ARN of a topic by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} operation \
         in Amazon SNS.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
  organization_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon WorkMail organization. Amazon WorkMail ARNs \
         use the following format:\n\n\
        \  \n\
        \ {[\n\
        \ arn:aws:workmail:::organization/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  You can find the ID of your organization by using the \
         {{:https://docs.aws.amazon.com/workmail/latest/APIReference/API_ListOrganizations.html}ListOrganizations} \
         operation in Amazon WorkMail. Amazon WorkMail organization IDs begin with \"[m-]\", \
         followed by a string of alphanumeric characters.\n\
        \  \n\
        \   For information about Amazon WorkMail organizations, see the \
         {{:https://docs.aws.amazon.com/workmail/latest/adminguide/organizations_overview.html}Amazon \
         WorkMail Administrator Guide}.\n\
        \   "]
}
[@@ocaml.doc
  "When included in a receipt rule, this action calls Amazon WorkMail and, optionally, publishes a \
   notification to Amazon Simple Notification Service (Amazon SNS). It usually isn't necessary to \
   set this up manually, because Amazon WorkMail adds the rule automatically during its setup \
   procedure.\n\n\
  \ For information using a receipt rule to call Amazon WorkMail, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-workmail.html}Amazon SES \
   Developer Guide}.\n\
  \ "]

type nonrec s3_key_prefix = string [@@ocaml.doc ""]

type nonrec s3_action = {
  topic_arn : amazon_resource_name option;
      [@ocaml.doc
        "The ARN of the Amazon SNS topic to notify when the message is saved to the Amazon S3 \
         bucket. You can find the ARN of a topic by using the \
         {{:https://docs.aws.amazon.com/sns/latest/api/API_ListTopics.html}ListTopics} operation \
         in Amazon SNS.\n\n\
        \ For more information about Amazon SNS topics, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html}Amazon SNS Developer Guide}.\n\
        \ "]
  bucket_name : s3_bucket_name;
      [@ocaml.doc "The name of the Amazon S3 bucket for incoming email.\n"]
  object_key_prefix : s3_key_prefix option;
      [@ocaml.doc
        "The key prefix of the Amazon S3 bucket. The key prefix is similar to a directory name \
         that enables you to store similar data under the same directory in a bucket.\n"]
  kms_key_arn : amazon_resource_name option;
      [@ocaml.doc
        "The customer managed key that Amazon SES should use to encrypt your emails before saving \
         them to the Amazon S3 bucket. You can use the Amazon Web Services managed key or a \
         customer managed key that you created in Amazon Web Services KMS as follows:\n\n\
        \ {ul\n\
        \       {-  To use the Amazon Web Services managed key, provide an ARN in the form of \
         [arn:aws:kms:REGION:ACCOUNT-ID-WITHOUT-HYPHENS:alias/aws/ses]. For example, if your \
         Amazon Web Services account ID is 123456789012 and you want to use the Amazon Web \
         Services managed key in the US West (Oregon) Region, the ARN of the Amazon Web Services \
         managed key would be [arn:aws:kms:us-west-2:123456789012:alias/aws/ses]. If you use the \
         Amazon Web Services managed key, you don't need to perform any extra steps to give Amazon \
         SES permission to use the key.\n\
        \           \n\
        \            }\n\
        \       {-  To use a customer managed key that you created in Amazon Web Services KMS, \
         provide the ARN of the customer managed key and ensure that you add a statement to your \
         key's policy to give Amazon SES permission to use it. For more information about giving \
         permissions, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html}Amazon SES \
         Developer Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information about key policies, see the \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html}Amazon Web \
         Services KMS Developer Guide}. If you do not specify an Amazon Web Services KMS key, \
         Amazon SES does not encrypt your emails.\n\
        \   \n\
        \     Your mail is encrypted by Amazon SES using the Amazon S3 encryption client before \
         the mail is submitted to Amazon S3 for storage. It is not encrypted using Amazon S3 \
         server-side encryption. This means that you must use the Amazon S3 encryption client to \
         decrypt the email after retrieving it from Amazon S3, as the service has no access to use \
         your Amazon Web Services KMS keys for decryption. This encryption client is currently \
         available with the {{:http://aws.amazon.com/sdk-for-java/}Amazon Web Services SDK for \
         Java} and {{:http://aws.amazon.com/sdk-for-ruby/}Amazon Web Services SDK for Ruby} only. \
         For more information about client-side encryption using Amazon Web Services KMS managed \
         keys, see the \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html}Amazon \
         S3 Developer Guide}.\n\
        \     \n\
        \      "]
  iam_role_arn : iam_role_ar_n option;
      [@ocaml.doc
        " The ARN of the IAM role to be used by Amazon Simple Email Service while writing to the \
         Amazon S3 bucket, optionally encrypting your mail via the provided customer managed key, \
         and publishing to the Amazon SNS topic. This role should have access to the following \
         APIs: \n\n\
        \ {ul\n\
        \       {-   [s3:PutObject], [kms:Encrypt] and [kms:GenerateDataKey] for the given Amazon \
         S3 bucket.\n\
        \           \n\
        \            }\n\
        \       {-   [kms:GenerateDataKey] for the given Amazon Web Services KMS customer managed \
         key. \n\
        \           \n\
        \            }\n\
        \       {-   [sns:Publish] for the given Amazon SNS topic.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If an IAM role ARN is provided, the role (and only the role) is used to access all \
         the given resources (Amazon S3 bucket, Amazon Web Services KMS customer managed key and \
         Amazon SNS topic). Therefore, setting up individual resource access permissions is not \
         required.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "When included in a receipt rule, this action saves the received message to an Amazon Simple \
   Storage Service (Amazon S3) bucket and, optionally, publishes a notification to Amazon Simple \
   Notification Service (Amazon SNS).\n\n\
  \ To enable Amazon SES to write emails to your Amazon S3 bucket, use an Amazon Web Services KMS \
   key to encrypt your emails, or publish to an Amazon SNS topic of another account, Amazon SES \
   must have permission to access those resources. For information about granting permissions, see \
   the {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-permissions.html}Amazon SES \
   Developer Guide}.\n\
  \ \n\
  \   When you save your emails to an Amazon S3 bucket, the maximum email size (including headers) \
   is 40 MB. Emails larger than that bounces.\n\
  \   \n\
  \     For information about specifying Amazon S3 actions in receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-action-s3.html}Amazon SES \
   Developer Guide}.\n\
  \     "]

type nonrec receipt_action = {
  s3_action : s3_action option;
      [@ocaml.doc
        "Saves the received message to an Amazon Simple Storage Service (Amazon S3) bucket and, \
         optionally, publishes a notification to Amazon SNS.\n"]
  bounce_action : bounce_action option;
      [@ocaml.doc
        "Rejects the received email by returning a bounce response to the sender and, optionally, \
         publishes a notification to Amazon Simple Notification Service (Amazon SNS).\n"]
  workmail_action : workmail_action option;
      [@ocaml.doc
        "Calls Amazon WorkMail and, optionally, publishes a notification to Amazon Amazon SNS.\n"]
  lambda_action : lambda_action option;
      [@ocaml.doc
        "Calls an Amazon Web Services Lambda function, and optionally, publishes a notification to \
         Amazon SNS.\n"]
  stop_action : stop_action option;
      [@ocaml.doc
        "Terminates the evaluation of the receipt rule set and optionally publishes a notification \
         to Amazon SNS.\n"]
  add_header_action : add_header_action option;
      [@ocaml.doc "Adds a header to the received email.\n"]
  sns_action : sns_action option;
      [@ocaml.doc "Publishes the email content within a notification to Amazon SNS.\n"]
  connect_action : connect_action option;
      [@ocaml.doc
        "Parses the received message and starts an email contact in Amazon Connect on your behalf.\n"]
}
[@@ocaml.doc
  "An action that Amazon SES can take when it receives an email on behalf of one or more email \
   addresses or domains that you own. An instance of this data type can represent only one \
   action.\n\n\
  \ For information about setting up receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ "]

type nonrec receipt_actions_list = receipt_action list [@@ocaml.doc ""]

type nonrec recipient = string [@@ocaml.doc ""]

type nonrec recipients_list = recipient list [@@ocaml.doc ""]

type nonrec tls_policy = Require [@ocaml.doc ""] | Optional [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec receipt_rule_name = string [@@ocaml.doc ""]

type nonrec receipt_rule = {
  name : receipt_rule_name;
      [@ocaml.doc
        "The name of the receipt rule. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), dashes \
         (-), or periods (.). \n\
        \           \n\
        \            }\n\
        \       {-  Start and end with a letter or number.\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  enabled : enabled option;
      [@ocaml.doc "If [true], the receipt rule is active. The default value is [false].\n"]
  tls_policy : tls_policy option;
      [@ocaml.doc
        "Specifies whether Amazon SES should require that incoming email is delivered over a \
         connection encrypted with Transport Layer Security (TLS). If this parameter is set to \
         [Require], Amazon SES bounces emails that are not received over TLS. The default is \
         [Optional].\n"]
  recipients : recipients_list option;
      [@ocaml.doc
        "The recipient domains and email addresses that the receipt rule applies to. If this field \
         is not specified, this rule matches all recipients on all verified domains.\n"]
  actions : receipt_actions_list option;
      [@ocaml.doc
        "An ordered list of actions to perform on messages that match at least one of the \
         recipient email addresses or domains specified in the receipt rule.\n"]
  scan_enabled : enabled option;
      [@ocaml.doc
        "If [true], then messages that this receipt rule applies to are scanned for spam and \
         viruses. The default value is [false].\n"]
}
[@@ocaml.doc
  "Receipt rules enable you to specify which actions Amazon SES should take when it receives mail \
   on behalf of one or more email addresses or domains that you own.\n\n\
  \ Each receipt rule defines a set of email addresses or domains that it applies to. If the email \
   addresses or domains match at least one recipient address of the message, Amazon SES executes \
   all of the receipt rule's actions on the message.\n\
  \ \n\
  \  For information about setting up receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \  "]

type nonrec create_receipt_rule_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc "The name of the rule set where the receipt rule is added.\n"]
  after : receipt_rule_name option;
      [@ocaml.doc
        "The name of an existing rule after which the new rule is placed. If this parameter is \
         null, the new rule is inserted at the beginning of the rule list.\n"]
  rule : receipt_rule;
      [@ocaml.doc
        "A data structure that contains the specified rule's name, actions, recipients, domains, \
         enabled status, scan status, and TLS policy.\n"]
}
[@@ocaml.doc
  "Represents a request to create a receipt rule. You use receipt rules to receive email with \
   Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec create_receipt_rule_set_response = unit [@@ocaml.doc ""]

type nonrec create_receipt_rule_set_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc
        "The name of the rule set to create. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Start and end with a letter or number.\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Represents a request to create an empty receipt rule set. You use receipt rule sets to receive \
   email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec invalid_template_exception = {
  template_name : template_name option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the template that you specified could not be rendered. This issue may occur when \
   a template refers to a partial that does not exist.\n"]

type nonrec create_template_response = unit [@@ocaml.doc ""]

type nonrec html_part = string [@@ocaml.doc ""]

type nonrec text_part = string [@@ocaml.doc ""]

type nonrec subject_part = string [@@ocaml.doc ""]

type nonrec template = {
  template_name : template_name;
      [@ocaml.doc
        "The name of the template. You use this name when you send email using the \
         [SendTemplatedEmail] or [SendBulkTemplatedEmail] operations.\n"]
  subject_part : subject_part option; [@ocaml.doc "The subject line of the email.\n"]
  text_part : text_part option;
      [@ocaml.doc
        "The email body that is visible to recipients whose email clients do not display HTML \
         content.\n"]
  html_part : html_part option; [@ocaml.doc "The HTML body of the email.\n"]
}
[@@ocaml.doc
  "The content of the email, composed of a subject line and either an HTML part or a text-only part.\n"]

type nonrec create_template_request = {
  template : template;
      [@ocaml.doc
        "The content of the email, composed of a subject line and either an HTML part or a \
         text-only part.\n"]
}
[@@ocaml.doc
  "Represents a request to create an email template. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec custom_mail_from_status =
  | Pending [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | TemporaryFailure [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec custom_verification_email_template = {
  template_name : template_name option;
      [@ocaml.doc "The name of the custom verification email template.\n"]
  from_email_address : from_address option;
      [@ocaml.doc "The email address that the custom verification email is sent from.\n"]
  template_subject : subject option;
      [@ocaml.doc "The subject line of the custom verification email.\n"]
  success_redirection_ur_l : success_redirection_ur_l option;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         successfully verified.\n"]
  failure_redirection_ur_l : failure_redirection_ur_l option;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         not successfully verified.\n"]
}
[@@ocaml.doc "Contains information about a custom verification email template.\n"]

type nonrec custom_verification_email_template_does_not_exist_exception = {
  custom_verification_email_template_name : template_name option;
      [@ocaml.doc
        "Indicates that the provided custom verification email template does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that a custom verification email template with the name you specified does not exist.\n"]

type nonrec custom_verification_email_templates = custom_verification_email_template list
[@@ocaml.doc ""]

type nonrec delete_configuration_set_response = unit [@@ocaml.doc ""]

type nonrec delete_configuration_set_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set to delete.\n"]
}
[@@ocaml.doc
  "Represents a request to delete a configuration set. Configuration sets enable you to publish \
   email sending events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec event_destination_does_not_exist_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Indicates that the configuration set does not exist.\n"]
  event_destination_name : event_destination_name option;
      [@ocaml.doc "Indicates that the event destination does not exist.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the event destination does not exist.\n"]

type nonrec delete_configuration_set_event_destination_response = unit [@@ocaml.doc ""]

type nonrec delete_configuration_set_event_destination_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set from which to delete the event destination.\n"]
  event_destination_name : event_destination_name;
      [@ocaml.doc "The name of the event destination to delete.\n"]
}
[@@ocaml.doc
  "Represents a request to delete a configuration set event destination. Configuration set event \
   destinations are associated with configuration sets, which enable you to publish email sending \
   events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec tracking_options_does_not_exist_exception = {
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc
        "Indicates that a TrackingOptions object does not exist in the specified configuration set.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the TrackingOptions object you specified does not exist.\n"]

type nonrec delete_configuration_set_tracking_options_response = unit [@@ocaml.doc ""]

type nonrec delete_configuration_set_tracking_options_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set.\n"]
}
[@@ocaml.doc
  "Represents a request to delete open and click tracking options in a configuration set. \n"]

type nonrec delete_custom_verification_email_template_request = {
  template_name : template_name;
      [@ocaml.doc "The name of the custom verification email template to delete.\n"]
}
[@@ocaml.doc "Represents a request to delete an existing custom verification email template.\n"]

type nonrec delete_identity_response = unit [@@ocaml.doc ""]

type nonrec identity = string [@@ocaml.doc ""]

type nonrec delete_identity_request = {
  identity : identity;
      [@ocaml.doc
        "The identity to be removed from the list of identities for the Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "Represents a request to delete one of your Amazon SES identities (an email address or domain).\n"]

type nonrec delete_identity_policy_response = unit [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec delete_identity_policy_request = {
  identity : identity;
      [@ocaml.doc
        "The identity that is associated with the policy to delete. You can specify the identity \
         by using its name or by using its Amazon Resource Name (ARN). Examples: \
         [user@example.com], [example.com], \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com].\n\n\
        \ To successfully call this operation, you must own the identity.\n\
        \ "]
  policy_name : policy_name; [@ocaml.doc "The name of the policy to be deleted.\n"]
}
[@@ocaml.doc
  "Represents a request to delete a sending authorization policy for an identity. Sending \
   authorization is an Amazon SES feature that enables you to authorize other senders to use your \
   identities. For information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec delete_receipt_filter_response = unit [@@ocaml.doc ""]

type nonrec delete_receipt_filter_request = {
  filter_name : receipt_filter_name; [@ocaml.doc "The name of the IP address filter to delete.\n"]
}
[@@ocaml.doc
  "Represents a request to delete an IP address filter. You use IP address filters when you \
   receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec delete_receipt_rule_response = unit [@@ocaml.doc ""]

type nonrec delete_receipt_rule_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc "The name of the receipt rule set that contains the receipt rule to delete.\n"]
  rule_name : receipt_rule_name; [@ocaml.doc "The name of the receipt rule to delete.\n"]
}
[@@ocaml.doc
  "Represents a request to delete a receipt rule. You use receipt rules to receive email with \
   Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec delete_receipt_rule_set_response = unit [@@ocaml.doc ""]

type nonrec delete_receipt_rule_set_request = {
  rule_set_name : receipt_rule_set_name; [@ocaml.doc "The name of the receipt rule set to delete.\n"]
}
[@@ocaml.doc
  "Represents a request to delete a receipt rule set and all of the receipt rules it contains. You \
   use receipt rule sets to receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec delete_template_response = unit [@@ocaml.doc ""]

type nonrec delete_template_request = {
  template_name : template_name; [@ocaml.doc "The name of the template to be deleted.\n"]
}
[@@ocaml.doc
  "Represents a request to delete an email template. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec delete_verified_email_address_request = {
  email_address : address;
      [@ocaml.doc "An email address to be removed from the list of verified addresses.\n"]
}
[@@ocaml.doc
  "Represents a request to delete an email address from the list of email addresses you have \
   attempted to verify under your Amazon Web Services account.\n"]

type nonrec delivery_options = {
  tls_policy : tls_policy option;
      [@ocaml.doc
        "Specifies whether messages that use the configuration set are required to use Transport \
         Layer Security (TLS). If the value is [Require], messages are only delivered if a TLS \
         connection can be established. If the value is [Optional], messages can be delivered in \
         plain text if a TLS connection can't be established.\n"]
}
[@@ocaml.doc
  "Specifies whether messages that use the configuration set are required to use Transport Layer \
   Security (TLS).\n"]

type nonrec receipt_rules_list = receipt_rule list [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec receipt_rule_set_metadata = {
  name : receipt_rule_set_name option;
      [@ocaml.doc
        "The name of the receipt rule set. The name must meet the following requirements:\n\n\
        \ {ul\n\
        \       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), underscores (_), or \
         dashes (-).\n\
        \           \n\
        \            }\n\
        \       {-  Start and end with a letter or number.\n\
        \           \n\
        \            }\n\
        \       {-  Contain 64 characters or fewer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  created_timestamp : timestamp option;
      [@ocaml.doc "The date and time the receipt rule set was created.\n"]
}
[@@ocaml.doc
  "Information about a receipt rule set.\n\n\
  \ A receipt rule set is a collection of rules that specify what Amazon SES should do with mail \
   it receives on behalf of your account's verified domains.\n\
  \ \n\
  \  For information about setting up receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules}Amazon \
   SES Developer Guide}.\n\
  \  "]

type nonrec describe_active_receipt_rule_set_response = {
  metadata : receipt_rule_set_metadata option;
      [@ocaml.doc
        "The metadata for the currently active receipt rule set. The metadata consists of the rule \
         set name and a timestamp of when the rule set was created.\n"]
  rules : receipt_rules_list option;
      [@ocaml.doc "The receipt rules that belong to the active rule set.\n"]
}
[@@ocaml.doc
  "Represents the metadata and receipt rules for the receipt rule set that is currently active.\n"]

type nonrec describe_active_receipt_rule_set_request = unit [@@ocaml.doc ""]

type nonrec last_fresh_start = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec reputation_options = {
  sending_enabled : enabled option;
      [@ocaml.doc
        "Describes whether email sending is enabled or disabled for the configuration set. If the \
         value is [true], then Amazon SES sends emails that use the configuration set. If the \
         value is [false], Amazon SES does not send emails that use the configuration set. The \
         default value is [true]. You can change this setting using \
         [UpdateConfigurationSetSendingEnabled].\n"]
  reputation_metrics_enabled : enabled option;
      [@ocaml.doc
        "Describes whether or not Amazon SES publishes reputation metrics for the configuration \
         set, such as bounce and complaint rates, to Amazon CloudWatch.\n\n\
        \ If the value is [true], reputation metrics are published. If the value is [false], \
         reputation metrics are not published. The default value is [false].\n\
        \ "]
  last_fresh_start : last_fresh_start option;
      [@ocaml.doc
        "The date and time at which the reputation metrics for the configuration set were last \
         reset. Resetting these metrics is known as a {i fresh start}.\n\n\
        \ When you disable email sending for a configuration set using \
         [UpdateConfigurationSetSendingEnabled] and later re-enable it, the reputation metrics for \
         the configuration set (but not for the entire Amazon SES account) are reset.\n\
        \ \n\
        \  If email sending for the configuration set has never been disabled and later \
         re-enabled, the value of this attribute is [null].\n\
        \  "]
}
[@@ocaml.doc "Contains information about the reputation settings for a configuration set.\n"]

type nonrec event_destinations = event_destination list [@@ocaml.doc ""]

type nonrec describe_configuration_set_response = {
  configuration_set : configuration_set option;
      [@ocaml.doc "The configuration set object associated with the specified configuration set.\n"]
  event_destinations : event_destinations option;
      [@ocaml.doc "A list of event destinations associated with the configuration set. \n"]
  tracking_options : tracking_options option;
      [@ocaml.doc
        "The name of the custom open and click tracking domain associated with the configuration \
         set.\n"]
  delivery_options : delivery_options option; [@ocaml.doc ""]
  reputation_options : reputation_options option;
      [@ocaml.doc "An object that represents the reputation settings for the configuration set. \n"]
}
[@@ocaml.doc
  "Represents the details of a configuration set. Configuration sets enable you to publish email \
   sending events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec describe_configuration_set_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set to describe.\n"]
  configuration_set_attribute_names : configuration_set_attribute_list option;
      [@ocaml.doc "A list of configuration set attributes to return.\n"]
}
[@@ocaml.doc
  "Represents a request to return the details of a configuration set. Configuration sets enable \
   you to publish email sending events. For information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec describe_receipt_rule_response = {
  rule : receipt_rule option;
      [@ocaml.doc
        "A data structure that contains the specified receipt rule's name, actions, recipients, \
         domains, enabled status, scan status, and Transport Layer Security (TLS) policy.\n"]
}
[@@ocaml.doc "Represents the details of a receipt rule.\n"]

type nonrec describe_receipt_rule_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc "The name of the receipt rule set that the receipt rule belongs to.\n"]
  rule_name : receipt_rule_name; [@ocaml.doc "The name of the receipt rule.\n"]
}
[@@ocaml.doc
  "Represents a request to return the details of a receipt rule. You use receipt rules to receive \
   email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec describe_receipt_rule_set_response = {
  metadata : receipt_rule_set_metadata option;
      [@ocaml.doc
        "The metadata for the receipt rule set, which consists of the rule set name and the \
         timestamp of when the rule set was created.\n"]
  rules : receipt_rules_list option;
      [@ocaml.doc "A list of the receipt rules that belong to the specified receipt rule set.\n"]
}
[@@ocaml.doc "Represents the details of the specified receipt rule set.\n"]

type nonrec describe_receipt_rule_set_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc "The name of the receipt rule set to describe.\n"]
}
[@@ocaml.doc
  "Represents a request to return the details of a receipt rule set. You use receipt rule sets to \
   receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec verification_token = string [@@ocaml.doc ""]

type nonrec verification_token_list = verification_token list [@@ocaml.doc ""]

type nonrec verification_status =
  | Pending [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | TemporaryFailure [@ocaml.doc ""]
  | NotStarted [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec identity_dkim_attributes = {
  dkim_enabled : enabled;
      [@ocaml.doc
        "Is true if DKIM signing is enabled for email sent from the identity. It's false \
         otherwise. The default value is true.\n"]
  dkim_verification_status : verification_status;
      [@ocaml.doc
        "Describes whether Amazon SES has successfully verified the DKIM DNS records (tokens) \
         published in the domain name's DNS. (This only applies to domain identities, not email \
         address identities.)\n"]
  dkim_tokens : verification_token_list option;
      [@ocaml.doc
        "A set of character strings that represent the domain's identity. Using these tokens, you \
         need to create DNS CNAME records that point to DKIM public keys that are hosted by Amazon \
         SES. Amazon Web Services eventually detects that you've updated your DNS records. This \
         detection process might take up to 72 hours. After successful detection, Amazon SES is \
         able to DKIM-sign email originating from that domain. (This only applies to domain \
         identities, not email address identities.)\n\n\
        \ For more information about creating DNS records using DKIM tokens, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}Amazon \
         SES Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc "Represents the DKIM attributes of a verified email address or a domain.\n"]

type nonrec dkim_attributes = (identity * identity_dkim_attributes) list [@@ocaml.doc ""]

type nonrec domain = string [@@ocaml.doc ""]

type nonrec explanation = string [@@ocaml.doc ""]

type nonrec get_account_sending_enabled_response = {
  enabled : enabled option;
      [@ocaml.doc
        "Describes whether email sending is enabled or disabled for your Amazon SES account in the \
         current Amazon Web Services Region.\n"]
}
[@@ocaml.doc
  "Represents a request to return the email sending status for your Amazon SES account in the \
   current Amazon Web Services Region.\n"]

type nonrec get_custom_verification_email_template_response = {
  template_name : template_name option;
      [@ocaml.doc "The name of the custom verification email template.\n"]
  from_email_address : from_address option;
      [@ocaml.doc "The email address that the custom verification email is sent from.\n"]
  template_subject : subject option;
      [@ocaml.doc "The subject line of the custom verification email.\n"]
  template_content : template_content option;
      [@ocaml.doc "The content of the custom verification email.\n"]
  success_redirection_ur_l : success_redirection_ur_l option;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         successfully verified.\n"]
  failure_redirection_ur_l : failure_redirection_ur_l option;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         not successfully verified.\n"]
}
[@@ocaml.doc "The content of the custom verification email template.\n"]

type nonrec get_custom_verification_email_template_request = {
  template_name : template_name;
      [@ocaml.doc "The name of the custom verification email template to retrieve.\n"]
}
[@@ocaml.doc "Represents a request to retrieve an existing custom verification email template.\n"]

type nonrec get_identity_dkim_attributes_response = {
  dkim_attributes : dkim_attributes;
      [@ocaml.doc "The DKIM attributes for an email address or a domain.\n"]
}
[@@ocaml.doc
  "Represents the status of Amazon SES Easy DKIM signing for an identity. For domain identities, \
   this response also contains the DKIM tokens that are required for Easy DKIM signing, and \
   whether Amazon SES successfully verified that these tokens were published.\n"]

type nonrec identity_list = identity list [@@ocaml.doc ""]

type nonrec get_identity_dkim_attributes_request = {
  identities : identity_list;
      [@ocaml.doc
        "A list of one or more verified identities - email addresses, domains, or both.\n"]
}
[@@ocaml.doc
  "Represents a request for the status of Amazon SES Easy DKIM signing for an identity. For domain \
   identities, this request also returns the DKIM tokens that are required for Easy DKIM signing, \
   and whether Amazon SES successfully verified that these tokens were published. For more \
   information about Easy DKIM, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec mail_from_domain_name = string [@@ocaml.doc ""]

type nonrec identity_mail_from_domain_attributes = {
  mail_from_domain : mail_from_domain_name;
      [@ocaml.doc "The custom MAIL FROM domain that the identity is configured to use.\n"]
  mail_from_domain_status : custom_mail_from_status;
      [@ocaml.doc
        "The state that indicates whether Amazon SES has successfully read the MX record required \
         for custom MAIL FROM domain setup. If the state is [Success], Amazon SES uses the \
         specified custom MAIL FROM domain when the verified identity sends an email. All other \
         states indicate that Amazon SES takes the action described by [BehaviorOnMXFailure].\n"]
  behavior_on_mx_failure : behavior_on_mx_failure;
      [@ocaml.doc
        "The action that Amazon SES takes if it cannot successfully read the required MX record \
         when you send an email. A value of [UseDefaultValue] indicates that if Amazon SES cannot \
         read the required MX record, it uses amazonses.com (or a subdomain of that) as the MAIL \
         FROM domain. A value of [RejectMessage] indicates that if Amazon SES cannot read the \
         required MX record, Amazon SES returns a [MailFromDomainNotVerified] error and does not \
         send the email.\n\n\
        \ The custom MAIL FROM setup states that result in this behavior are [Pending], [Failed], \
         and [TemporaryFailure].\n\
        \ "]
}
[@@ocaml.doc
  "Represents the custom MAIL FROM domain attributes of a verified identity (email address or \
   domain).\n"]

type nonrec mail_from_domain_attributes = (identity * identity_mail_from_domain_attributes) list
[@@ocaml.doc ""]

type nonrec get_identity_mail_from_domain_attributes_response = {
  mail_from_domain_attributes : mail_from_domain_attributes;
      [@ocaml.doc "A map of identities to custom MAIL FROM attributes.\n"]
}
[@@ocaml.doc "Represents the custom MAIL FROM attributes for a list of identities.\n"]

type nonrec get_identity_mail_from_domain_attributes_request = {
  identities : identity_list; [@ocaml.doc "A list of one or more identities.\n"]
}
[@@ocaml.doc
  "Represents a request to return the Amazon SES custom MAIL FROM attributes for a list of \
   identities. For information about using a custom MAIL FROM domain, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/mail-from.html}Amazon SES Developer Guide}.\n"]

type nonrec notification_topic = string [@@ocaml.doc ""]

type nonrec identity_notification_attributes = {
  bounce_topic : notification_topic;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES publishes bounce \
         notifications.\n"]
  complaint_topic : notification_topic;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES publishes \
         complaint notifications.\n"]
  delivery_topic : notification_topic;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic where Amazon SES publishes \
         delivery notifications.\n"]
  forwarding_enabled : enabled;
      [@ocaml.doc
        "Describes whether Amazon SES forwards bounce and complaint notifications as email. [true] \
         indicates that Amazon SES forwards bounce and complaint notifications as email, while \
         [false] indicates that bounce and complaint notifications are published only to the \
         specified bounce and complaint Amazon SNS topics.\n"]
  headers_in_bounce_notifications_enabled : enabled option;
      [@ocaml.doc
        "Describes whether Amazon SES includes the original email headers in Amazon SNS \
         notifications of type [Bounce]. A value of [true] specifies that Amazon SES includes \
         headers in bounce notifications, and a value of [false] specifies that Amazon SES does \
         not include headers in bounce notifications.\n"]
  headers_in_complaint_notifications_enabled : enabled option;
      [@ocaml.doc
        "Describes whether Amazon SES includes the original email headers in Amazon SNS \
         notifications of type [Complaint]. A value of [true] specifies that Amazon SES includes \
         headers in complaint notifications, and a value of [false] specifies that Amazon SES does \
         not include headers in complaint notifications.\n"]
  headers_in_delivery_notifications_enabled : enabled option;
      [@ocaml.doc
        "Describes whether Amazon SES includes the original email headers in Amazon SNS \
         notifications of type [Delivery]. A value of [true] specifies that Amazon SES includes \
         headers in delivery notifications, and a value of [false] specifies that Amazon SES does \
         not include headers in delivery notifications.\n"]
}
[@@ocaml.doc
  "Represents the notification attributes of an identity, including whether an identity has Amazon \
   Simple Notification Service (Amazon SNS) topics set for bounce, complaint, and/or delivery \
   notifications, and whether feedback forwarding is enabled for bounce and complaint \
   notifications.\n"]

type nonrec notification_attributes = (identity * identity_notification_attributes) list
[@@ocaml.doc ""]

type nonrec get_identity_notification_attributes_response = {
  notification_attributes : notification_attributes;
      [@ocaml.doc "A map of Identity to IdentityNotificationAttributes.\n"]
}
[@@ocaml.doc "Represents the notification attributes for a list of identities.\n"]

type nonrec get_identity_notification_attributes_request = {
  identities : identity_list;
      [@ocaml.doc
        "A list of one or more identities. You can specify an identity by using its name or by \
         using its Amazon Resource Name (ARN). Examples: [user@example.com], [example.com], \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com].\n"]
}
[@@ocaml.doc
  "Represents a request to return the notification attributes for a list of identities you \
   verified with Amazon SES. For information about Amazon SES notifications, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec policy_map = (policy_name * policy) list [@@ocaml.doc ""]

type nonrec get_identity_policies_response = {
  policies : policy_map; [@ocaml.doc "A map of policy names to policies.\n"]
}
[@@ocaml.doc "Represents the requested sending authorization policies.\n"]

type nonrec policy_name_list = policy_name list [@@ocaml.doc ""]

type nonrec get_identity_policies_request = {
  identity : identity;
      [@ocaml.doc
        "The identity for which the policies are retrieved. You can specify an identity by using \
         its name or by using its Amazon Resource Name (ARN). Examples: [user@example.com], \
         [example.com], [arn:aws:ses:us-east-1:123456789012:identity/example.com].\n\n\
        \ To successfully call this operation, you must own the identity.\n\
        \ "]
  policy_names : policy_name_list;
      [@ocaml.doc
        "A list of the names of policies to be retrieved. You can retrieve a maximum of 20 \
         policies at a time. If you do not know the names of the policies that are attached to the \
         identity, you can use [ListIdentityPolicies].\n"]
}
[@@ocaml.doc
  "Represents a request to return the requested sending authorization policies for an identity. \
   Sending authorization is an Amazon SES feature that enables you to authorize other senders to \
   use your identities. For information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec identity_verification_attributes = {
  verification_status : verification_status;
      [@ocaml.doc
        "The verification status of the identity: \"Pending\", \"Success\", \"Failed\", or \
         \"TemporaryFailure\".\n"]
  verification_token : verification_token option;
      [@ocaml.doc
        "The verification token for a domain identity. Null for email address identities.\n"]
}
[@@ocaml.doc "Represents the verification attributes of a single identity.\n"]

type nonrec verification_attributes = (identity * identity_verification_attributes) list
[@@ocaml.doc ""]

type nonrec get_identity_verification_attributes_response = {
  verification_attributes : verification_attributes;
      [@ocaml.doc "A map of Identities to IdentityVerificationAttributes objects.\n"]
}
[@@ocaml.doc
  "The Amazon SES verification status of a list of identities. For domain identities, this \
   response also contains the verification token.\n"]

type nonrec get_identity_verification_attributes_request = {
  identities : identity_list; [@ocaml.doc "A list of identities.\n"]
}
[@@ocaml.doc
  "Represents a request to return the Amazon SES verification status of a list of identities. For \
   domain identities, this request also returns the verification token. For information about \
   verifying identities with Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec sent_last24_hours = float [@@ocaml.doc ""]

type nonrec max_send_rate = float [@@ocaml.doc ""]

type nonrec max24_hour_send = float [@@ocaml.doc ""]

type nonrec get_send_quota_response = {
  max24_hour_send : max24_hour_send option;
      [@ocaml.doc
        "The maximum number of emails the user is allowed to send in a 24-hour interval. A value \
         of -1 signifies an unlimited quota.\n"]
  max_send_rate : max_send_rate option;
      [@ocaml.doc
        "The maximum number of emails that Amazon SES can accept from the user's account per \
         second.\n\n\
        \  The rate at which Amazon SES accepts the user's messages might be less than the maximum \
         send rate.\n\
        \  \n\
        \   "]
  sent_last24_hours : sent_last24_hours option;
      [@ocaml.doc "The number of emails sent during the previous 24 hours.\n"]
}
[@@ocaml.doc
  "Represents your Amazon SES daily sending quota, maximum send rate, and the number of emails you \
   have sent in the last 24 hours.\n"]

type nonrec send_data_point = {
  timestamp : timestamp option; [@ocaml.doc "Time of the data point.\n"]
  delivery_attempts : counter option; [@ocaml.doc "Number of emails that have been sent.\n"]
  bounces : counter option; [@ocaml.doc "Number of emails that have bounced.\n"]
  complaints : counter option;
      [@ocaml.doc "Number of unwanted emails that were rejected by recipients.\n"]
  rejects : counter option; [@ocaml.doc "Number of emails rejected by Amazon SES.\n"]
}
[@@ocaml.doc
  "Represents sending statistics data. Each [SendDataPoint] contains statistics for a 15-minute \
   period of sending activity. \n"]

type nonrec send_data_point_list = send_data_point list [@@ocaml.doc ""]

type nonrec get_send_statistics_response = {
  send_data_points : send_data_point_list option;
      [@ocaml.doc "A list of data points, each of which represents 15 minutes of activity.\n"]
}
[@@ocaml.doc
  "Represents a list of data points. This list contains aggregated data from the previous two \
   weeks of your sending activity with Amazon SES.\n"]

type nonrec template_does_not_exist_exception = {
  template_name : template_name option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that the Template object you specified does not exist in your Amazon SES account.\n"]

type nonrec get_template_response = { template : template option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec get_template_request = {
  template_name : template_name; [@ocaml.doc "The name of the template to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec identity_type = EmailAddress [@ocaml.doc ""] | Domain [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec invalid_delivery_options_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Indicates that provided delivery option is invalid.\n"]

type nonrec invalid_policy_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the provided policy is invalid. Check the error stack for more information about \
   what caused the error.\n"]

type nonrec invalid_rendering_parameter_exception = {
  template_name : template_name option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that one or more of the replacement values you provided is invalid. This error may \
   occur when the TemplateData object contains invalid JSON.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_configuration_sets_response = {
  configuration_sets : configuration_sets option; [@ocaml.doc "A list of configuration sets.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token indicating that there are additional configuration sets available to be listed. \
         Pass this token to successive calls of [ListConfigurationSets]. \n"]
}
[@@ocaml.doc
  "A list of configuration sets associated with your Amazon Web Services account. Configuration \
   sets enable you to publish email sending events. For information about using configuration \
   sets, see the {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec max_items = int [@@ocaml.doc ""]

type nonrec list_configuration_sets_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from a previous call to [ListConfigurationSets] to indicate the position \
         of the configuration set in the configuration set list.\n"]
  max_items : max_items option; [@ocaml.doc "The number of configuration sets to return.\n"]
}
[@@ocaml.doc
  "Represents a request to list the configuration sets associated with your Amazon Web Services \
   account. Configuration sets enable you to publish email sending events. For information about \
   using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec list_custom_verification_email_templates_response = {
  custom_verification_email_templates : custom_verification_email_templates option;
      [@ocaml.doc "A list of the custom verification email templates that exist in your account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token indicating that there are additional custom verification email templates \
         available to be listed. Pass this token to a subsequent call to [ListTemplates] to \
         retrieve the next 50 custom verification email templates.\n"]
}
[@@ocaml.doc "A paginated list of custom verification email templates.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_custom_verification_email_templates_request = {
  next_token : next_token option;
      [@ocaml.doc
        "An array the contains the name and creation time stamp for each template in your Amazon \
         SES account.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of custom verification email templates to return. This value must be \
         at least 1 and less than or equal to 50. If you do not specify a value, or if you specify \
         a value less than 1 or greater than 50, the operation returns up to 50 results.\n"]
}
[@@ocaml.doc
  "Represents a request to list the existing custom verification email templates for your account.\n\n\
  \ For more information about custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ "]

type nonrec list_identities_response = {
  identities : identity_list; [@ocaml.doc "A list of identities.\n"]
  next_token : next_token option; [@ocaml.doc "The token used for pagination.\n"]
}
[@@ocaml.doc
  "A list of all identities that you have attempted to verify under your Amazon Web Services \
   account, regardless of verification status.\n"]

type nonrec list_identities_request = {
  identity_type : identity_type option;
      [@ocaml.doc
        "The type of the identities to list. Possible values are \"EmailAddress\" and \"Domain\". \
         If this parameter is omitted, then all identities are listed.\n"]
  next_token : next_token option; [@ocaml.doc "The token to use for pagination.\n"]
  max_items : max_items option;
      [@ocaml.doc
        "The maximum number of identities per page. Possible values are 1-1000 inclusive.\n"]
}
[@@ocaml.doc
  "Represents a request to return a list of all identities (email addresses and domains) that you \
   have attempted to verify under your Amazon Web Services account, regardless of verification \
   status.\n"]

type nonrec list_identity_policies_response = {
  policy_names : policy_name_list;
      [@ocaml.doc "A list of names of policies that apply to the specified identity.\n"]
}
[@@ocaml.doc "A list of names of sending authorization policies that apply to an identity.\n"]

type nonrec list_identity_policies_request = {
  identity : identity;
      [@ocaml.doc
        "The identity that is associated with the policy for which the policies are listed. You \
         can specify an identity by using its name or by using its Amazon Resource Name (ARN). \
         Examples: [user@example.com], [example.com], \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com].\n\n\
        \ To successfully call this operation, you must own the identity.\n\
        \ "]
}
[@@ocaml.doc
  "Represents a request to return a list of sending authorization policies that are attached to an \
   identity. Sending authorization is an Amazon SES feature that enables you to authorize other \
   senders to use your identities. For information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec receipt_filter_list = receipt_filter list [@@ocaml.doc ""]

type nonrec list_receipt_filters_response = {
  filters : receipt_filter_list option;
      [@ocaml.doc
        "A list of IP address filter data structures, which each consist of a name, an IP address \
         range, and whether to allow or block mail from it.\n"]
}
[@@ocaml.doc "A list of IP address filters that exist under your Amazon Web Services account.\n"]

type nonrec list_receipt_filters_request = unit [@@ocaml.doc ""]

type nonrec receipt_rule_sets_lists = receipt_rule_set_metadata list [@@ocaml.doc ""]

type nonrec list_receipt_rule_sets_response = {
  rule_sets : receipt_rule_sets_lists option;
      [@ocaml.doc
        "The metadata for the currently active receipt rule set. The metadata consists of the rule \
         set name and the timestamp of when the rule set was created.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token indicating that there are additional receipt rule sets available to be listed. \
         Pass this token to successive calls of [ListReceiptRuleSets] to retrieve up to 100 \
         receipt rule sets at a time.\n"]
}
[@@ocaml.doc "A list of receipt rule sets that exist under your Amazon Web Services account.\n"]

type nonrec list_receipt_rule_sets_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from a previous call to [ListReceiptRuleSets] to indicate the position \
         in the receipt rule set list.\n"]
}
[@@ocaml.doc
  "Represents a request to list the receipt rule sets that exist under your Amazon Web Services \
   account. You use receipt rule sets to receive email with Amazon SES. For more information, see \
   the {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec template_metadata = {
  name : template_name option; [@ocaml.doc "The name of the template.\n"]
  created_timestamp : timestamp option; [@ocaml.doc "The time and date the template was created.\n"]
}
[@@ocaml.doc "Contains information about an email template.\n"]

type nonrec template_metadata_list = template_metadata list [@@ocaml.doc ""]

type nonrec list_templates_response = {
  templates_metadata : template_metadata_list option;
      [@ocaml.doc
        "An array the contains the name and creation time stamp for each template in your Amazon \
         SES account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token indicating that there are additional email templates available to be listed. Pass \
         this token to a subsequent call to [ListTemplates] to retrieve the next set of email \
         templates within your page size.\n"]
}
[@@ocaml.doc ""]

type nonrec list_templates_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A token returned from a previous call to [ListTemplates] to indicate the position in the \
         list of email templates.\n"]
  max_items : max_items option;
      [@ocaml.doc
        "The maximum number of templates to return. This value must be at least 1 and less than or \
         equal to 100. If more than 100 items are requested, the page size will automatically set \
         to 100. If you do not specify a value, 10 is the default page size. \n"]
}
[@@ocaml.doc ""]

type nonrec list_verified_email_addresses_response = {
  verified_email_addresses : address_list option;
      [@ocaml.doc "A list of email addresses that have been verified.\n"]
}
[@@ocaml.doc
  "A list of email addresses that you have verified with Amazon SES under your Amazon Web Services \
   account.\n"]

type nonrec mail_from_domain_not_verified_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Indicates that the message could not be sent because Amazon SES could not read the MX record \
   required to use the specified MAIL FROM domain. For information about editing the custom MAIL \
   FROM domain settings for an identity, see the \
   {{:https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mail-from-edit.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec message = {
  subject : content;
      [@ocaml.doc
        "The subject of the message: A short summary of the content, which appears in the \
         recipient's inbox.\n"]
  body : body; [@ocaml.doc "The message body.\n"]
}
[@@ocaml.doc "Represents the message to be sent, composed of a subject and a body.\n"]

type nonrec reporting_mta = string [@@ocaml.doc ""]

type nonrec message_dsn = {
  reporting_mta : reporting_mta;
      [@ocaml.doc
        "The reporting MTA that attempted to deliver the message, formatted as specified in \
         {{:https://tools.ietf.org/html/rfc3464}RFC 3464} ([mta-name-type; mta-name]). The default \
         value is [dns;\n\
        \                inbound-smtp.\\[region\\].amazonaws.com].\n"]
  arrival_date : arrival_date option;
      [@ocaml.doc
        "When the message was received by the reporting mail transfer agent (MTA), in \
         {{:https://www.ietf.org/rfc/rfc0822.txt}RFC 822} date-time format.\n"]
  extension_fields : extension_field_list option;
      [@ocaml.doc "Additional X-headers to include in the DSN.\n"]
}
[@@ocaml.doc
  "Message-related information to include in the Delivery Status Notification (DSN) when an email \
   that Amazon SES receives on your behalf bounces.\n\n\
  \ For information about receiving email through Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html}Amazon SES Developer Guide}.\n\
  \ "]

type nonrec message_rejected = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Indicates that the action failed, and the message could not be sent. Check the error stack for \
   more information about what caused the error.\n"]

type nonrec missing_rendering_attribute_exception = {
  template_name : template_name option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Indicates that one or more of the replacement values for the specified template was not \
   specified. Ensure that the TemplateData object contains references to all of the replacement \
   tags in the specified template.\n"]

type nonrec notification_type =
  | Bounce [@ocaml.doc ""]
  | Complaint [@ocaml.doc ""]
  | Delivery [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec production_access_not_granted_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the account has not been granted production access.\n"]

type nonrec put_configuration_set_delivery_options_response = unit [@@ocaml.doc ""]

type nonrec put_configuration_set_delivery_options_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set.\n"]
  delivery_options : delivery_options option;
      [@ocaml.doc
        "Specifies whether messages that use the configuration set are required to use Transport \
         Layer Security (TLS).\n"]
}
[@@ocaml.doc "A request to modify the delivery options for a configuration set.\n"]

type nonrec put_identity_policy_response = unit [@@ocaml.doc ""]

type nonrec put_identity_policy_request = {
  identity : identity;
      [@ocaml.doc
        "The identity to which that the policy applies. You can specify an identity by using its \
         name or by using its Amazon Resource Name (ARN). Examples: [user@example.com], \
         [example.com], [arn:aws:ses:us-east-1:123456789012:identity/example.com].\n\n\
        \ To successfully call this operation, you must own the identity.\n\
        \ "]
  policy_name : policy_name;
      [@ocaml.doc
        "The name of the policy.\n\n\
        \ The policy name cannot exceed 64 characters and can only include alphanumeric \
         characters, dashes, and underscores.\n\
        \ "]
  policy : policy;
      [@ocaml.doc
        "The text of the policy in JSON format. The policy cannot exceed 4 KB.\n\n\
        \ For information about the syntax of sending authorization policies, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-policies.html}Amazon \
         SES Developer Guide}. \n\
        \ "]
}
[@@ocaml.doc
  "Represents a request to add or update a sending authorization policy for an identity. Sending \
   authorization is an Amazon SES feature that enables you to authorize other senders to use your \
   identities. For information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec raw_message_data = bytes [@@ocaml.doc ""]

type nonrec raw_message = {
  data : raw_message_data;
      [@ocaml.doc
        "The raw data of the message. This data needs to base64-encoded if you are accessing \
         Amazon SES directly through the HTTPS interface. If you are accessing Amazon SES using an \
         Amazon Web Services SDK, the SDK takes care of the base 64-encoding for you. In all \
         cases, the client must ensure that the message format complies with Internet email \
         standards regarding email header fields, MIME types, and MIME encoding.\n\n\
        \ The To:, CC:, and BCC: headers in the raw message can contain a group list.\n\
        \ \n\
        \  If you are using [SendRawEmail] with sending authorization, you can include X-headers \
         in the raw message to specify the \"Source,\" \"From,\" and \"Return-Path\" addresses. \
         For more information, see the documentation for [SendRawEmail]. \n\
        \  \n\
        \    Do not include these X-headers in the DKIM signature, because they are removed by \
         Amazon SES before sending the email.\n\
        \    \n\
        \      For more information, go to the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Amazon SES Developer \
         Guide}.\n\
        \      "]
}
[@@ocaml.doc "Represents the raw data of the message.\n"]

type nonrec receipt_rule_names_list = receipt_rule_name list [@@ocaml.doc ""]

type nonrec rendered_template = string [@@ocaml.doc ""]

type nonrec reorder_receipt_rule_set_response = unit [@@ocaml.doc ""]

type nonrec reorder_receipt_rule_set_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc "The name of the receipt rule set to reorder.\n"]
  rule_names : receipt_rule_names_list;
      [@ocaml.doc "The specified receipt rule set's receipt rules, in order.\n"]
}
[@@ocaml.doc
  "Represents a request to reorder the receipt rules within a receipt rule set. You use receipt \
   rule sets to receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec send_bounce_response = {
  message_id : message_id option; [@ocaml.doc "The message ID of the bounce message.\n"]
}
[@@ocaml.doc "Represents a unique message ID.\n"]

type nonrec send_bounce_request = {
  original_message_id : message_id; [@ocaml.doc "The message ID of the message to be bounced.\n"]
  bounce_sender : address;
      [@ocaml.doc
        "The address to use in the \"From\" header of the bounce message. This must be an identity \
         that you have verified with Amazon SES.\n"]
  explanation : explanation option;
      [@ocaml.doc
        "Human-readable text for the bounce message to explain the failure. If not specified, the \
         text is auto-generated based on the bounced recipient information.\n"]
  message_dsn : message_dsn option;
      [@ocaml.doc "Message-related DSN fields. If not specified, Amazon SES chooses the values.\n"]
  bounced_recipient_info_list : bounced_recipient_info_list;
      [@ocaml.doc
        "A list of recipients of the bounced message, including the information required to create \
         the Delivery Status Notifications (DSNs) for the recipients. You must specify at least \
         one [BouncedRecipientInfo] in the list.\n"]
  bounce_sender_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to use the address \
         in the \"From\" header of the bounce. For more information about sending authorization, \
         see the {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon \
         SES Developer Guide}.\n"]
}
[@@ocaml.doc
  "Represents a request to send a bounce message to the sender of an email you received through \
   Amazon SES.\n"]

type nonrec send_bulk_templated_email_response = {
  status : bulk_email_destination_status_list;
      [@ocaml.doc
        "One object per intended recipient. Check each response object and retry any messages with \
         a failure status. (Note that order of responses will be respective to order of \
         destinations in the request.)Receipt rules enable you to specify which actions \n"]
}
[@@ocaml.doc ""]

type nonrec send_bulk_templated_email_request = {
  source : address;
      [@ocaml.doc
        "The email address that is sending the email. This email address must be either \
         individually verified with Amazon SES, or from a domain that has been verified with \
         Amazon SES. For information about verifying identities, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html}Amazon SES \
         Developer Guide}.\n\n\
        \ If you are sending on behalf of another user and have been permitted to do so by a \
         sending authorization policy, then you must also specify the [SourceArn] parameter. For \
         more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \ \n\
        \   Amazon SES does not support the SMTPUTF8 extension, as described in \
         {{:https://tools.ietf.org/html/rfc6531}RFC6531}. For this reason, the email address \
         string must be 7-bit ASCII. If you want to send to or from email addresses that contain \
         Unicode characters in the domain part of an address, you must encode the domain using \
         Punycode. Punycode is not permitted in the local part of the email address (the part \
         before the \\@ sign) nor in the \"friendly from\" name. If you want to use Unicode \
         characters in the \"friendly from\" name, you must encode the \"friendly from\" name \
         using MIME encoded-word syntax, as described in \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Sending raw email using \
         the Amazon SES API}. For more information about Punycode, see \
         {{:http://tools.ietf.org/html/rfc3492}RFC 3492}.\n\
        \   \n\
        \    "]
  source_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to send for the \
         email address specified in the [Source] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to send from [user@example.com], then you would specify the [SourceArn] to \
         be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [Source] to be \
         [user@example.com].\n\
        \ \n\
        \  For more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \  "]
  reply_to_addresses : address_list option;
      [@ocaml.doc
        "The reply-to email address(es) for the message. If the recipient replies to the message, \
         each reply-to address receives the reply.\n"]
  return_path : address option;
      [@ocaml.doc
        "The email address that bounces and complaints are forwarded to when feedback forwarding \
         is enabled. If the message cannot be delivered to the recipient, then an error message is \
         returned from the recipient's ISP; this message is forwarded to the email address \
         specified by the [ReturnPath] parameter. The [ReturnPath] parameter is never overwritten. \
         This email address must be either individually verified with Amazon SES, or from a domain \
         that has been verified with Amazon SES. \n"]
  return_path_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to use the email \
         address specified in the [ReturnPath] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to use [feedback@example.com], then you would specify the [ReturnPathArn] \
         to be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [ReturnPath] to \
         be [feedback@example.com].\n\
        \ \n\
        \  For more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \  "]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc
        "The name of the configuration set to use when you send an email using \
         [SendBulkTemplatedEmail].\n"]
  default_tags : message_tag_list option;
      [@ocaml.doc
        "A list of tags, in the form of name/value pairs, to apply to an email that you send to a \
         destination using [SendBulkTemplatedEmail].\n"]
  template : template_name; [@ocaml.doc "The template to use when sending this email.\n"]
  template_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the template to use when sending this email.\n"]
  default_template_data : template_data;
      [@ocaml.doc
        "A list of replacement values to apply to the template when replacement data is not \
         specified in a Destination object. These values act as a default or fallback option when \
         no other data is available.\n\n\
        \ The template data is a JSON object, typically consisting of key-value pairs in which the \
         keys correspond to replacement tags in the email template.\n\
        \ "]
  destinations : bulk_email_destination_list;
      [@ocaml.doc
        "One or more [Destination] objects. All of the recipients in a [Destination] receive the \
         same version of the email. You can specify up to 50 [Destination] objects within a \
         [Destinations] array.\n"]
}
[@@ocaml.doc
  "Represents a request to send a templated email to multiple destinations using Amazon SES. For \
   more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec send_custom_verification_email_response = {
  message_id : message_id option;
      [@ocaml.doc
        "The unique message identifier returned from the [SendCustomVerificationEmail] operation.\n"]
}
[@@ocaml.doc "The response received when attempting to send the custom verification email.\n"]

type nonrec send_custom_verification_email_request = {
  email_address : address; [@ocaml.doc "The email address to verify.\n"]
  template_name : template_name;
      [@ocaml.doc
        "The name of the custom verification email template to use when sending the verification \
         email.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "Name of a configuration set to use when sending the verification email.\n"]
}
[@@ocaml.doc "Represents a request to send a custom verification email to a specified recipient.\n"]

type nonrec send_email_response = {
  message_id : message_id;
      [@ocaml.doc "The unique message identifier returned from the [SendEmail] action. \n"]
}
[@@ocaml.doc "Represents a unique message ID.\n"]

type nonrec send_email_request = {
  source : address;
      [@ocaml.doc
        "The email address that is sending the email. This email address must be either \
         individually verified with Amazon SES, or from a domain that has been verified with \
         Amazon SES. For information about verifying identities, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html}Amazon SES \
         Developer Guide}.\n\n\
        \ If you are sending on behalf of another user and have been permitted to do so by a \
         sending authorization policy, then you must also specify the [SourceArn] parameter. For \
         more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \ \n\
        \   Amazon SES does not support the SMTPUTF8 extension, as described in \
         {{:https://tools.ietf.org/html/rfc6531}RFC6531}. For this reason, the email address \
         string must be 7-bit ASCII. If you want to send to or from email addresses that contain \
         Unicode characters in the domain part of an address, you must encode the domain using \
         Punycode. Punycode is not permitted in the local part of the email address (the part \
         before the \\@ sign) nor in the \"friendly from\" name. If you want to use Unicode \
         characters in the \"friendly from\" name, you must encode the \"friendly from\" name \
         using MIME encoded-word syntax, as described in \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Sending raw email using \
         the Amazon SES API}. For more information about Punycode, see \
         {{:http://tools.ietf.org/html/rfc3492}RFC 3492}.\n\
        \   \n\
        \    "]
  destination : destination;
      [@ocaml.doc "The destination for this email, composed of To:, CC:, and BCC: fields.\n"]
  message : message; [@ocaml.doc "The message to be sent.\n"]
  reply_to_addresses : address_list option;
      [@ocaml.doc
        "The reply-to email address(es) for the message. If the recipient replies to the message, \
         each reply-to address receives the reply.\n"]
  return_path : address option;
      [@ocaml.doc
        "The email address that bounces and complaints are forwarded to when feedback forwarding \
         is enabled. If the message cannot be delivered to the recipient, then an error message is \
         returned from the recipient's ISP; this message is forwarded to the email address \
         specified by the [ReturnPath] parameter. The [ReturnPath] parameter is never overwritten. \
         This email address must be either individually verified with Amazon SES, or from a domain \
         that has been verified with Amazon SES. \n"]
  source_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to send for the \
         email address specified in the [Source] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to send from [user@example.com], then you would specify the [SourceArn] to \
         be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [Source] to be \
         [user@example.com].\n\
        \ \n\
        \  For more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \  "]
  return_path_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to use the email \
         address specified in the [ReturnPath] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to use [feedback@example.com], then you would specify the [ReturnPathArn] \
         to be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [ReturnPath] to \
         be [feedback@example.com].\n\
        \ \n\
        \  For more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \  "]
  tags : message_tag_list option;
      [@ocaml.doc
        "A list of tags, in the form of name/value pairs, to apply to an email that you send using \
         [SendEmail]. Tags correspond to characteristics of the email that you define, so that you \
         can publish email sending events.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc
        "The name of the configuration set to use when you send an email using [SendEmail].\n"]
}
[@@ocaml.doc
  "Represents a request to send a single formatted email using Amazon SES. For more information, \
   see the {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-formatted.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec send_raw_email_response = {
  message_id : message_id;
      [@ocaml.doc "The unique message identifier returned from the [SendRawEmail] action. \n"]
}
[@@ocaml.doc "Represents a unique message ID.\n"]

type nonrec send_raw_email_request = {
  source : address option;
      [@ocaml.doc
        "The identity's email address. If you do not provide a value for this parameter, you must \
         specify a \"From\" address in the raw text of the message. (You can also specify both.)\n\n\
        \  Amazon SES does not support the SMTPUTF8 extension, as described \
         in{{:https://tools.ietf.org/html/rfc6531}RFC6531}. For this reason, the email address \
         string must be 7-bit ASCII. If you want to send to or from email addresses that contain \
         Unicode characters in the domain part of an address, you must encode the domain using \
         Punycode. Punycode is not permitted in the local part of the email address (the part \
         before the \\@ sign) nor in the \"friendly from\" name. If you want to use Unicode \
         characters in the \"friendly from\" name, you must encode the \"friendly from\" name \
         using MIME encoded-word syntax, as described in \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Sending raw email using \
         the Amazon SES API}. For more information about Punycode, see \
         {{:http://tools.ietf.org/html/rfc3492}RFC 3492}.\n\
        \  \n\
        \    If you specify the [Source] parameter and have feedback forwarding enabled, then \
         bounces and complaints are sent to this email address. This takes precedence over any \
         Return-Path header that you might include in the raw text of the message.\n\
        \    "]
  destinations : address_list option;
      [@ocaml.doc
        "A list of destinations for the message, consisting of To:, CC:, and BCC: addresses.\n"]
  raw_message : raw_message;
      [@ocaml.doc
        "The raw email message itself. The message has to meet the following criteria:\n\n\
        \ {ul\n\
        \       {-  The message has to contain a header and a body, separated by a blank line.\n\
        \           \n\
        \            }\n\
        \       {-  All of the required header fields must be present in the message.\n\
        \           \n\
        \            }\n\
        \       {-  Each part of a multipart MIME message must be formatted properly.\n\
        \           \n\
        \            }\n\
        \       {-  Attachments must be of a content type that Amazon SES supports. For a list on \
         unsupported content types, see \
         {{:https://docs.aws.amazon.com/ses/latest/dg/mime-types.html}Unsupported Attachment \
         Types} in the {i Amazon SES Developer Guide}.\n\
        \           \n\
        \            }\n\
        \       {-  The entire message must be base64-encoded.\n\
        \           \n\
        \            }\n\
        \       {-  If any of the MIME parts in your message contain content that is outside of \
         the 7-bit ASCII character range, we highly recommend that you encode that content. For \
         more information, see \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Sending Raw Email} in \
         the {i Amazon SES Developer Guide}.\n\
        \           \n\
        \            }\n\
        \       {-  Per {{:https://tools.ietf.org/html/rfc5321#section-4.5.3.1.6}RFC 5321}, the \
         maximum length of each line of text, including the , must not exceed 1,000 characters.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  from_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to specify a \
         particular \"From\" address in the header of the raw email.\n\n\
        \ Instead of using this parameter, you can use the X-header [X-SES-FROM-ARN] in the raw \
         message of the email. If you use both the [FromArn] parameter and the corresponding \
         X-header, Amazon SES uses the value of the [FromArn] parameter.\n\
        \ \n\
        \   For information about when to use this parameter, see the description of \
         [SendRawEmail] in this guide, or see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-delegate-sender-tasks-email.html}Amazon \
         SES Developer Guide}.\n\
        \   \n\
        \    "]
  source_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to send for the \
         email address specified in the [Source] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to send from [user@example.com], then you would specify the [SourceArn] to \
         be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [Source] to be \
         [user@example.com].\n\
        \ \n\
        \  Instead of using this parameter, you can use the X-header [X-SES-SOURCE-ARN] in the raw \
         message of the email. If you use both the [SourceArn] parameter and the corresponding \
         X-header, Amazon SES uses the value of the [SourceArn] parameter.\n\
        \  \n\
        \    For information about when to use this parameter, see the description of \
         [SendRawEmail] in this guide, or see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-delegate-sender-tasks-email.html}Amazon \
         SES Developer Guide}.\n\
        \    \n\
        \     "]
  return_path_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to use the email \
         address specified in the [ReturnPath] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to use [feedback@example.com], then you would specify the [ReturnPathArn] \
         to be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [ReturnPath] to \
         be [feedback@example.com].\n\
        \ \n\
        \  Instead of using this parameter, you can use the X-header [X-SES-RETURN-PATH-ARN] in \
         the raw message of the email. If you use both the [ReturnPathArn] parameter and the \
         corresponding X-header, Amazon SES uses the value of the [ReturnPathArn] parameter.\n\
        \  \n\
        \    For information about when to use this parameter, see the description of \
         [SendRawEmail] in this guide, or see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization-delegate-sender-tasks-email.html}Amazon \
         SES Developer Guide}.\n\
        \    \n\
        \     "]
  tags : message_tag_list option;
      [@ocaml.doc
        "A list of tags, in the form of name/value pairs, to apply to an email that you send using \
         [SendRawEmail]. Tags correspond to characteristics of the email that you define, so that \
         you can publish email sending events.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc
        "The name of the configuration set to use when you send an email using [SendRawEmail].\n"]
}
[@@ocaml.doc
  "Represents a request to send a single raw email using Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Amazon SES Developer Guide}.\n"]

type nonrec send_templated_email_response = {
  message_id : message_id;
      [@ocaml.doc "The unique message identifier returned from the [SendTemplatedEmail] action. \n"]
}
[@@ocaml.doc ""]

type nonrec send_templated_email_request = {
  source : address;
      [@ocaml.doc
        "The email address that is sending the email. This email address must be either \
         individually verified with Amazon SES, or from a domain that has been verified with \
         Amazon SES. For information about verifying identities, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html}Amazon SES \
         Developer Guide}.\n\n\
        \ If you are sending on behalf of another user and have been permitted to do so by a \
         sending authorization policy, then you must also specify the [SourceArn] parameter. For \
         more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \ \n\
        \   Amazon SES does not support the SMTPUTF8 extension, as described in \
         {{:https://tools.ietf.org/html/rfc6531}RFC6531}. for this reason, The email address \
         string must be 7-bit ASCII. If you want to send to or from email addresses that contain \
         Unicode characters in the domain part of an address, you must encode the domain using \
         Punycode. Punycode is not permitted in the local part of the email address (the part \
         before the \\@ sign) nor in the \"friendly from\" name. If you want to use Unicode \
         characters in the \"friendly from\" name, you must encode the \"friendly from\" name \
         using MIME encoded-word syntax, as described in \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html}Sending raw email using \
         the Amazon SES API}. For more information about Punycode, see \
         {{:http://tools.ietf.org/html/rfc3492}RFC 3492}.\n\
        \   \n\
        \    "]
  destination : destination;
      [@ocaml.doc
        "The destination for this email, composed of To:, CC:, and BCC: fields. A Destination can \
         include up to 50 recipients across these three fields.\n"]
  reply_to_addresses : address_list option;
      [@ocaml.doc
        "The reply-to email address(es) for the message. If the recipient replies to the message, \
         each reply-to address receives the reply.\n"]
  return_path : address option;
      [@ocaml.doc
        "The email address that bounces and complaints are forwarded to when feedback forwarding \
         is enabled. If the message cannot be delivered to the recipient, then an error message is \
         returned from the recipient's ISP; this message is forwarded to the email address \
         specified by the [ReturnPath] parameter. The [ReturnPath] parameter is never overwritten. \
         This email address must be either individually verified with Amazon SES, or from a domain \
         that has been verified with Amazon SES. \n"]
  source_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to send for the \
         email address specified in the [Source] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to send from [user@example.com], then you would specify the [SourceArn] to \
         be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [Source] to be \
         [user@example.com].\n\
        \ \n\
        \  For more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \  "]
  return_path_arn : amazon_resource_name option;
      [@ocaml.doc
        "This parameter is used only for sending authorization. It is the ARN of the identity that \
         is associated with the sending authorization policy that permits you to use the email \
         address specified in the [ReturnPath] parameter.\n\n\
        \ For example, if the owner of [example.com] (which has ARN \
         [arn:aws:ses:us-east-1:123456789012:identity/example.com]) attaches a policy to it that \
         authorizes you to use [feedback@example.com], then you would specify the [ReturnPathArn] \
         to be [arn:aws:ses:us-east-1:123456789012:identity/example.com], and the [ReturnPath] to \
         be [feedback@example.com].\n\
        \ \n\
        \  For more information about sending authorization, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES \
         Developer Guide}.\n\
        \  "]
  tags : message_tag_list option;
      [@ocaml.doc
        "A list of tags, in the form of name/value pairs, to apply to an email that you send using \
         [SendTemplatedEmail]. Tags correspond to characteristics of the email that you define, so \
         that you can publish email sending events.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc
        "The name of the configuration set to use when you send an email using [SendTemplatedEmail].\n"]
  template : template_name; [@ocaml.doc "The template to use when sending this email.\n"]
  template_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the template to use when sending this email.\n"]
  template_data : template_data;
      [@ocaml.doc
        "A list of replacement values to apply to the template. This parameter is a JSON object, \
         typically consisting of key-value pairs in which the keys correspond to replacement tags \
         in the email template.\n"]
}
[@@ocaml.doc
  "Represents a request to send a templated email using Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec set_active_receipt_rule_set_response = unit [@@ocaml.doc ""]

type nonrec set_active_receipt_rule_set_request = {
  rule_set_name : receipt_rule_set_name option;
      [@ocaml.doc
        "The name of the receipt rule set to make active. Setting this value to null disables all \
         email receiving.\n"]
}
[@@ocaml.doc
  "Represents a request to set a receipt rule set as the active receipt rule set. You use receipt \
   rule sets to receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec set_identity_dkim_enabled_response = unit [@@ocaml.doc ""]

type nonrec set_identity_dkim_enabled_request = {
  identity : identity;
      [@ocaml.doc "The identity for which DKIM signing should be enabled or disabled.\n"]
  dkim_enabled : enabled;
      [@ocaml.doc
        "Sets whether DKIM signing is enabled for an identity. Set to [true] to enable DKIM \
         signing for this identity; [false] to disable it. \n"]
}
[@@ocaml.doc
  "Represents a request to enable or disable Amazon SES Easy DKIM signing for an identity. For \
   more information about setting up Easy DKIM, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec set_identity_feedback_forwarding_enabled_response = unit [@@ocaml.doc ""]

type nonrec set_identity_feedback_forwarding_enabled_request = {
  identity : identity;
      [@ocaml.doc
        "The identity for which to set bounce and complaint notification forwarding. Examples: \
         [user@example.com], [example.com].\n"]
  forwarding_enabled : enabled;
      [@ocaml.doc
        "Sets whether Amazon SES forwards bounce and complaint notifications as email. [true] \
         specifies that Amazon SES forwards bounce and complaint notifications as email, in \
         addition to any Amazon SNS topic publishing otherwise specified. [false] specifies that \
         Amazon SES publishes bounce and complaint notifications only through Amazon SNS. This \
         value can only be set to [false] when Amazon SNS topics are set for both [Bounce] and \
         [Complaint] notification types.\n"]
}
[@@ocaml.doc
  "Represents a request to enable or disable whether Amazon SES forwards you bounce and complaint \
   notifications through email. For information about email feedback forwarding, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications-email.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec set_identity_headers_in_notifications_enabled_response = unit [@@ocaml.doc ""]

type nonrec set_identity_headers_in_notifications_enabled_request = {
  identity : identity;
      [@ocaml.doc
        "The identity for which to enable or disable headers in notifications. Examples: \
         [user@example.com], [example.com].\n"]
  notification_type : notification_type;
      [@ocaml.doc
        "The notification type for which to enable or disable headers in notifications. \n"]
  enabled : enabled;
      [@ocaml.doc
        "Sets whether Amazon SES includes the original email headers in Amazon SNS notifications \
         of the specified notification type. A value of [true] specifies that Amazon SES includes \
         headers in notifications, and a value of [false] specifies that Amazon SES does not \
         include headers in notifications.\n\n\
        \ This value can only be set when [NotificationType] is already set to use a particular \
         Amazon SNS topic.\n\
        \ "]
}
[@@ocaml.doc
  "Represents a request to set whether Amazon SES includes the original email headers in the \
   Amazon SNS notifications of a specified type. For information about notifications, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications-sns.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec set_identity_mail_from_domain_response = unit [@@ocaml.doc ""]

type nonrec set_identity_mail_from_domain_request = {
  identity : identity; [@ocaml.doc "The verified identity.\n"]
  mail_from_domain : mail_from_domain_name option;
      [@ocaml.doc
        "The custom MAIL FROM domain for the verified identity to use. The MAIL FROM domain must \
         1) be a subdomain of the verified identity, 2) not be used in a \"From\" address if the \
         MAIL FROM domain is the destination of email feedback forwarding (for more information, \
         see the {{:https://docs.aws.amazon.com/ses/latest/dg/mail-from.html}Amazon SES Developer \
         Guide}), and 3) not be used to receive emails. A value of [null] disables the custom MAIL \
         FROM setting for the identity.\n"]
  behavior_on_mx_failure : behavior_on_mx_failure option;
      [@ocaml.doc
        "The action for Amazon SES to take if it cannot successfully read the required MX record \
         when you send an email. If you choose [UseDefaultValue], Amazon SES uses amazonses.com \
         (or a subdomain of that) as the MAIL FROM domain. If you choose [RejectMessage], Amazon \
         SES returns a [MailFromDomainNotVerified] error and not send the email.\n\n\
        \ The action specified in [BehaviorOnMXFailure] is taken when the custom MAIL FROM domain \
         setup is in the [Pending], [Failed], and [TemporaryFailure] states.\n\
        \ "]
}
[@@ocaml.doc
  "Represents a request to enable or disable the Amazon SES custom MAIL FROM domain setup for a \
   verified identity. For information about using a custom MAIL FROM domain, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/mail-from.html}Amazon SES Developer Guide}.\n"]

type nonrec set_identity_notification_topic_response = unit [@@ocaml.doc ""]

type nonrec set_identity_notification_topic_request = {
  identity : identity;
      [@ocaml.doc
        "The identity (email address or domain) for the Amazon SNS topic.\n\n\
        \  You can only specify a verified identity for this parameter.\n\
        \  \n\
        \    You can specify an identity by using its name or by using its Amazon Resource Name \
         (ARN). The following examples are all valid identities: [sender@example.com], \
         [example.com], [arn:aws:ses:us-east-1:123456789012:identity/example.com].\n\
        \    "]
  notification_type : notification_type;
      [@ocaml.doc
        "The type of notifications that are published to the specified Amazon SNS topic.\n"]
  sns_topic : notification_topic option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic. If the parameter is omitted from \
         the request or a null value is passed, [SnsTopic] is cleared and publishing is disabled.\n"]
}
[@@ocaml.doc
  "Represents a request to specify the Amazon SNS topic to which Amazon SES publishes bounce, \
   complaint, or delivery notifications for emails sent with that identity as the source. For \
   information about Amazon SES notifications, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications-sns.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec set_receipt_rule_position_response = unit [@@ocaml.doc ""]

type nonrec set_receipt_rule_position_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc
        "The name of the receipt rule set that contains the receipt rule to reposition.\n"]
  rule_name : receipt_rule_name; [@ocaml.doc "The name of the receipt rule to reposition.\n"]
  after : receipt_rule_name option;
      [@ocaml.doc "The name of the receipt rule after which to place the specified receipt rule.\n"]
}
[@@ocaml.doc
  "Represents a request to set the position of a receipt rule in a receipt rule set. You use \
   receipt rule sets to receive email with Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec verify_email_identity_response = unit [@@ocaml.doc ""]

type nonrec verify_email_identity_request = {
  email_address : address; [@ocaml.doc "The email address to be verified.\n"]
}
[@@ocaml.doc
  "Represents a request to begin email address verification with Amazon SES. For information about \
   email address verification, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#verify-email-addresses-procedure}Amazon \
   SES Developer Guide}.\n"]

type nonrec verify_email_address_request = {
  email_address : address; [@ocaml.doc "The email address to be verified.\n"]
}
[@@ocaml.doc
  "Represents a request to begin email address verification with Amazon SES. For information about \
   email address verification, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#verify-email-addresses-procedure}Amazon \
   SES Developer Guide}.\n"]

type nonrec verify_domain_identity_response = {
  verification_token : verification_token;
      [@ocaml.doc
        "A TXT record that you must place in the DNS settings of the domain to complete domain \
         verification with Amazon SES.\n\n\
        \ As Amazon SES searches for the TXT record, the domain's verification status is \
         \"Pending\". When Amazon SES detects the record, the domain's verification status changes \
         to \"Success\". If Amazon SES is unable to detect the record within 72 hours, the \
         domain's verification status changes to \"Failed.\" In that case, to verify the domain, \
         you must restart the verification process from the beginning. The domain's verification \
         status also changes to \"Success\" when it is DKIM verified.\n\
        \ "]
}
[@@ocaml.doc
  "Returns a TXT record that you must publish to the DNS server of your domain to complete domain \
   verification with Amazon SES.\n"]

type nonrec verify_domain_identity_request = {
  domain : domain; [@ocaml.doc "The domain to be verified.\n"]
}
[@@ocaml.doc
  "Represents a request to begin Amazon SES domain verification and to generate the TXT records \
   that you must publish to the DNS server of your domain to complete the verification. For \
   information about domain verification, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#verify-domain-procedure}Amazon \
   SES Developer Guide}.\n"]

type nonrec verify_domain_dkim_response = {
  dkim_tokens : verification_token_list;
      [@ocaml.doc
        "A set of character strings that represent the domain's identity. If the identity is an \
         email address, the tokens represent the domain of that address.\n\n\
        \ Using these tokens, you need to create DNS CNAME records that point to DKIM public keys \
         that are hosted by Amazon SES. Amazon Web Services eventually detects that you've updated \
         your DNS records. This detection process might take up to 72 hours. After successful \
         detection, Amazon SES is able to DKIM-sign email originating from that domain. (This only \
         applies to domain identities, not email address identities.)\n\
        \ \n\
        \  For more information about creating DNS records using DKIM tokens, see the \
         {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}Amazon \
         SES Developer Guide}.\n\
        \  "]
}
[@@ocaml.doc
  "Returns CNAME records that you must publish to the DNS server of your domain to set up Easy \
   DKIM with Amazon SES.\n"]

type nonrec verify_domain_dkim_request = {
  domain : domain; [@ocaml.doc "The name of the domain to be verified for Easy DKIM signing.\n"]
}
[@@ocaml.doc
  "Represents a request to generate the CNAME records needed to set up Easy DKIM with Amazon SES. \
   For more information about setting up Easy DKIM, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}Amazon \
   SES Developer Guide}.\n"]

type nonrec update_template_response = unit [@@ocaml.doc ""]

type nonrec update_template_request = { template : template [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec update_receipt_rule_response = unit [@@ocaml.doc ""]

type nonrec update_receipt_rule_request = {
  rule_set_name : receipt_rule_set_name;
      [@ocaml.doc "The name of the receipt rule set that the receipt rule belongs to.\n"]
  rule : receipt_rule;
      [@ocaml.doc "A data structure that contains the updated receipt rule information.\n"]
}
[@@ocaml.doc
  "Represents a request to update a receipt rule. You use receipt rules to receive email with \
   Amazon SES. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html}Amazon SES Developer \
   Guide}.\n"]

type nonrec update_custom_verification_email_template_request = {
  template_name : template_name;
      [@ocaml.doc "The name of the custom verification email template to update.\n"]
  from_email_address : from_address option;
      [@ocaml.doc "The email address that the custom verification email is sent from.\n"]
  template_subject : subject option;
      [@ocaml.doc "The subject line of the custom verification email.\n"]
  template_content : template_content option;
      [@ocaml.doc
        "The content of the custom verification email. The total size of the email must be less \
         than 10 MB. The message body may contain HTML, with some limitations. For more \
         information, see \
         {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Custom \
         Verification Email Frequently Asked Questions} in the {i Amazon SES Developer Guide}.\n"]
  success_redirection_ur_l : success_redirection_ur_l option;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         successfully verified.\n"]
  failure_redirection_ur_l : failure_redirection_ur_l option;
      [@ocaml.doc
        "The URL that the recipient of the verification email is sent to if his or her address is \
         not successfully verified.\n"]
}
[@@ocaml.doc "Represents a request to update an existing custom verification email template.\n"]

type nonrec update_configuration_set_tracking_options_response = unit [@@ocaml.doc ""]

type nonrec update_configuration_set_tracking_options_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set.\n"]
  tracking_options : tracking_options; [@ocaml.doc ""]
}
[@@ocaml.doc "Represents a request to update the tracking options for a configuration set. \n"]

type nonrec update_configuration_set_sending_enabled_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set to update.\n"]
  enabled : enabled;
      [@ocaml.doc
        "Describes whether email sending is enabled or disabled for the configuration set. \n"]
}
[@@ocaml.doc
  "Represents a request to enable or disable the email sending capabilities for a specific \
   configuration set.\n"]

type nonrec update_configuration_set_reputation_metrics_enabled_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set to update.\n"]
  enabled : enabled;
      [@ocaml.doc
        "Describes whether or not Amazon SES publishes reputation metrics for the configuration \
         set, such as bounce and complaint rates, to Amazon CloudWatch.\n"]
}
[@@ocaml.doc
  "Represents a request to modify the reputation metric publishing settings for a configuration set.\n"]

type nonrec update_configuration_set_event_destination_response = unit [@@ocaml.doc ""]

type nonrec update_configuration_set_event_destination_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the configuration set that contains the event destination.\n"]
  event_destination : event_destination; [@ocaml.doc "The event destination object.\n"]
}
[@@ocaml.doc
  "Represents a request to update the event destination of a configuration set. Configuration sets \
   enable you to publish email sending events. For information about using configuration sets, see \
   the {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES \
   Developer Guide}.\n"]

type nonrec update_account_sending_enabled_request = {
  enabled : enabled option;
      [@ocaml.doc
        "Describes whether email sending is enabled or disabled for your Amazon SES account in the \
         current Amazon Web Services Region.\n"]
}
[@@ocaml.doc
  "Represents a request to enable or disable the email sending capabilities for your entire Amazon \
   SES account.\n"]

type nonrec test_render_template_response = {
  rendered_template : rendered_template option;
      [@ocaml.doc
        "The complete MIME message rendered by applying the data in the TemplateData parameter to \
         the template specified in the TemplateName parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec test_render_template_request = {
  template_name : template_name; [@ocaml.doc "The name of the template to render.\n"]
  template_data : template_data;
      [@ocaml.doc
        "A list of replacement values to apply to the template. This parameter is a JSON object, \
         typically consisting of key-value pairs in which the keys correspond to replacement tags \
         in the email template.\n"]
}
[@@ocaml.doc ""]
