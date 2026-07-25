type nonrec access_denied_exception_reason =
  | INSUFFICIENT_ACCOUNT_REPUTATION [@ocaml.doc ""]
  | ACCOUNT_DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  reason : access_denied_exception_reason option; [@ocaml.doc "The reason for the exception.\n"]
}
[@@ocaml.doc
  "The request was denied because you don't have sufficient permissions to access the resource.\n"]

type nonrec account_attribute_name =
  | ACCOUNT_TIER [@ocaml.doc ""]
  | DEFAULT_PROTECT_CONFIGURATION_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_attribute = {
  name : account_attribute_name; [@ocaml.doc "The name of the account attribute.\n"]
  value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The value associated with the account attribute name.\n"]
}
[@@ocaml.doc "Displays the attributes associated with a single Amazon Web Services account.\n"]

type nonrec account_attribute_list = account_attribute list [@@ocaml.doc ""]

type nonrec account_limit_name =
  | PHONE_NUMBERS [@ocaml.doc ""]
  | POOLS [@ocaml.doc ""]
  | CONFIGURATION_SETS [@ocaml.doc ""]
  | OPT_OUT_LISTS [@ocaml.doc ""]
  | SENDER_IDS [@ocaml.doc ""]
  | REGISTRATIONS [@ocaml.doc ""]
  | REGISTRATION_ATTACHMENTS [@ocaml.doc ""]
  | VERIFIED_DESTINATION_NUMBERS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_limit = {
  name : account_limit_name;
      [@ocaml.doc "The name of the attribute to apply the account limit to.\n"]
  used : Smaws_Lib.Smithy_api.Types.primitive_long;
      [@ocaml.doc "The current amount that has been spent, in US dollars.\n"]
  max : Smaws_Lib.Smithy_api.Types.primitive_long;
      [@ocaml.doc "The Amazon Web Services set limit for that resource type, in US dollars.\n"]
}
[@@ocaml.doc "The current resource quotas associated with an Amazon Web Services account.\n"]

type nonrec account_limit_list = account_limit list [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the field.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The message associated with the validation exception with information to help determine \
         its cause.\n"]
}
[@@ocaml.doc "The field associated with the validation exception.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | CANNOT_ADD_OPTED_OUT_NUMBER [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | CHANNEL_NOT_ENABLED [@ocaml.doc ""]
  | COUNTRY_CODE_MISMATCH [@ocaml.doc ""]
  | COUNTRY_NOT_ENABLED [@ocaml.doc ""]
  | DESTINATION_COUNTRY_BLOCKED [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | ATTACHMENT_TYPE_NOT_SUPPORTED [@ocaml.doc ""]
  | INTERNATIONAL_SENDING_NOT_SUPPORTED [@ocaml.doc ""]
  | INVALID_ARN [@ocaml.doc ""]
  | INVALID_FILTER_VALUES [@ocaml.doc ""]
  | INVALID_IDENTITY_FOR_DESTINATION_COUNTRY [@ocaml.doc ""]
  | INVALID_NEXT_TOKEN [@ocaml.doc ""]
  | INVALID_PARAMETER [@ocaml.doc ""]
  | INVALID_REQUEST [@ocaml.doc ""]
  | INVALID_REGISTRATION_ASSOCIATION [@ocaml.doc ""]
  | MAXIMUM_SIZE_EXCEEDED [@ocaml.doc ""]
  | MEDIA_TYPE_NOT_SUPPORTED [@ocaml.doc ""]
  | MISSING_PARAMETER [@ocaml.doc ""]
  | PARAMETERS_CANNOT_BE_USED_TOGETHER [@ocaml.doc ""]
  | PHONE_NUMBER_CANNOT_BE_OPTED_IN [@ocaml.doc ""]
  | PHONE_NUMBER_CANNOT_BE_RELEASED [@ocaml.doc ""]
  | PRICE_OVER_THRESHOLD [@ocaml.doc ""]
  | RESOURCE_NOT_ACCESSIBLE [@ocaml.doc ""]
  | REQUESTED_SPEND_LIMIT_HIGHER_THAN_SERVICE_LIMIT [@ocaml.doc ""]
  | SENDER_ID_NOT_REGISTERED [@ocaml.doc ""]
  | SENDER_ID_NOT_SUPPORTED [@ocaml.doc ""]
  | SENDER_ID_REQUIRES_REGISTRATION [@ocaml.doc ""]
  | TWO_WAY_TOPIC_NOT_PRESENT [@ocaml.doc ""]
  | TWO_WAY_NOT_ENABLED [@ocaml.doc ""]
  | TWO_WAY_NOT_SUPPORTED_IN_COUNTRY [@ocaml.doc ""]
  | TWO_WAY_NOT_SUPPORTED_IN_REGION [@ocaml.doc ""]
  | TWO_WAY_CHANNEL_NOT_PRESENT [@ocaml.doc ""]
  | UNKNOWN_REGISTRATION_FIELD [@ocaml.doc ""]
  | UNKNOWN_REGISTRATION_SECTION [@ocaml.doc ""]
  | UNKNOWN_REGISTRATION_TYPE [@ocaml.doc ""]
  | UNKNOWN_REGISTRATION_VERSION [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
  | REGISTRATION_FIELD_CANNOT_BE_DELETED [@ocaml.doc ""]
  | VERIFICATION_CODE_MISMATCH [@ocaml.doc ""]
  | VOICE_CAPABILITY_NOT_AVAILABLE [@ocaml.doc ""]
  | UNSPECIFIED_PARAMETER_NOT_SUPPORTED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  reason : validation_exception_reason option; [@ocaml.doc "The reason for the exception.\n"]
  fields : validation_exception_field_list option; [@ocaml.doc "The field that failed validation.\n"]
}
[@@ocaml.doc "A validation exception for a field.\n"]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An error that occurred because too many requests were sent during a certain amount of time.\n"]

type nonrec service_quota_exceeded_exception_reason =
  | ASSOCIATIONS_PER_REGISTRATION [@ocaml.doc ""]
  | CONFIGURATION_SETS_PER_ACCOUNT [@ocaml.doc ""]
  | DAILY_DESTINATION_CALL_LIMIT [@ocaml.doc ""]
  | DAILY_NOTIFY_TIER_MESSAGE_LIMIT [@ocaml.doc ""]
  | EVENT_DESTINATIONS_PER_CONFIGURATION_SET [@ocaml.doc ""]
  | KEYWORDS_PER_PHONE_NUMBER [@ocaml.doc ""]
  | KEYWORDS_PER_POOL [@ocaml.doc ""]
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_MEDIA [@ocaml.doc ""]
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_NOTIFY [@ocaml.doc ""]
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_RCS [@ocaml.doc ""]
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_TEXT [@ocaml.doc ""]
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_VOICE [@ocaml.doc ""]
  | NOTIFY_CONFIGURATIONS_PER_ACCOUNT [@ocaml.doc ""]
  | OPT_OUT_LISTS_PER_ACCOUNT [@ocaml.doc ""]
  | ORIGINATION_IDENTITIES_PER_POOL [@ocaml.doc ""]
  | PHONE_NUMBERS_PER_ACCOUNT [@ocaml.doc ""]
  | PHONE_NUMBERS_PER_REGISTRATION [@ocaml.doc ""]
  | POOLS_PER_ACCOUNT [@ocaml.doc ""]
  | RCS_AGENTS_PER_ACCOUNT [@ocaml.doc ""]
  | REGISTRATION_ATTACHMENTS_CREATED_PER_DAY [@ocaml.doc ""]
  | REGISTRATION_ATTACHMENTS_PER_ACCOUNT [@ocaml.doc ""]
  | REGISTRATION_VERSIONS_CREATED_PER_DAY [@ocaml.doc ""]
  | REGISTRATIONS_PER_ACCOUNT [@ocaml.doc ""]
  | SENDER_IDS_PER_ACCOUNT [@ocaml.doc ""]
  | TAGS_PER_RESOURCE [@ocaml.doc ""]
  | VERIFIED_DESTINATION_NUMBERS_PER_ACCOUNT [@ocaml.doc ""]
  | VERIFICATION_ATTEMPTS_PER_DAY [@ocaml.doc ""]
  | PROTECT_CONFIGURATIONS_PER_ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  reason : service_quota_exceeded_exception_reason option;
      [@ocaml.doc "The reason for the exception.\n"]
}
[@@ocaml.doc "The request would cause a service quota to be exceeded.\n"]

type nonrec resource_type =
  | ACCOUNT [@ocaml.doc ""]
  | PHONE_NUMBER [@ocaml.doc ""]
  | SENDER_ID [@ocaml.doc ""]
  | POOL [@ocaml.doc ""]
  | CONFIGURATION_SET [@ocaml.doc ""]
  | OPT_OUT_LIST [@ocaml.doc ""]
  | EVENT_DESTINATION [@ocaml.doc ""]
  | KEYWORD [@ocaml.doc ""]
  | OPTED_OUT_NUMBER [@ocaml.doc ""]
  | REGISTRATION [@ocaml.doc ""]
  | REGISTRATION_ATTACHMENT [@ocaml.doc ""]
  | VERIFIED_DESTINATION_NUMBER [@ocaml.doc ""]
  | PROTECT_CONFIGURATION [@ocaml.doc ""]
  | NOTIFY_CONFIGURATION [@ocaml.doc ""]
  | NOTIFY_TEMPLATE [@ocaml.doc ""]
  | MESSAGE_TEMPLATE [@ocaml.doc ""]
  | POLICY [@ocaml.doc ""]
  | MESSAGE [@ocaml.doc ""]
  | RCS_AGENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  resource_type : resource_type option;
      [@ocaml.doc "The type of resource that caused the exception.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the resource.\n"]
}
[@@ocaml.doc "A requested resource couldn't be found.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  request_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the request.\n"]
}
[@@ocaml.doc
  "The API encountered an unexpected error and couldn't complete the request. You might be able to \
   successfully issue the request again in the future.\n"]

type nonrec conflict_exception_reason =
  | CREATE_REGISTRATION_VERSION_NOT_ALLOWED [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
  | DESTINATION_PHONE_NUMBER_NOT_VERIFIED [@ocaml.doc ""]
  | DESTINATION_PHONE_NUMBER_OPTED_OUT [@ocaml.doc ""]
  | DISASSOCIATE_REGISTRATION_NOT_ALLOWED [@ocaml.doc ""]
  | DISCARD_REGISTRATION_VERSION_NOT_ALLOWED [@ocaml.doc ""]
  | EDIT_REGISTRATION_FIELD_VALUES_NOT_ALLOWED [@ocaml.doc ""]
  | EVENT_DESTINATION_MISMATCH [@ocaml.doc ""]
  | KEYWORD_MISMATCH [@ocaml.doc ""]
  | LAST_PHONE_NUMBER [@ocaml.doc ""]
  | NUMBER_CAPABILITIES_MISMATCH [@ocaml.doc ""]
  | MESSAGE_TYPE_MISMATCH [@ocaml.doc ""]
  | NO_ORIGINATION_IDENTITIES_FOUND [@ocaml.doc ""]
  | OPT_OUT_LIST_MISMATCH [@ocaml.doc ""]
  | PHONE_NUMBER_ASSOCIATED_TO_POOL [@ocaml.doc ""]
  | PHONE_NUMBER_ASSOCIATED_TO_REGISTRATION [@ocaml.doc ""]
  | PHONE_NUMBER_NOT_ASSOCIATED_TO_POOL [@ocaml.doc ""]
  | PHONE_NUMBER_NOT_IN_REGISTRATION_REGION [@ocaml.doc ""]
  | REGISTRATION_ALREADY_SUBMITTED [@ocaml.doc ""]
  | REGISTRATION_NOT_COMPLETE [@ocaml.doc ""]
  | RESOURCE_ALREADY_ASSOCIATED [@ocaml.doc ""]
  | SENDER_ID_ASSOCIATED_TO_POOL [@ocaml.doc ""]
  | RCS_AGENT_ASSOCIATED_TO_POOL [@ocaml.doc ""]
  | POOL_ASSOCIATED_TO_NOTIFY_CONFIGURATION [@ocaml.doc ""]
  | RESOURCE_ALREADY_EXISTS [@ocaml.doc ""]
  | RESOURCE_DELETION_NOT_ALLOWED [@ocaml.doc ""]
  | RESOURCE_MODIFICATION_NOT_ALLOWED [@ocaml.doc ""]
  | RESOURCE_NOT_ACTIVE [@ocaml.doc ""]
  | RESOURCE_NOT_EMPTY [@ocaml.doc ""]
  | SELF_MANAGED_OPT_OUTS_MISMATCH [@ocaml.doc ""]
  | SUBMIT_REGISTRATION_VERSION_NOT_ALLOWED [@ocaml.doc ""]
  | TWO_WAY_CONFIG_MISMATCH [@ocaml.doc ""]
  | VERIFICATION_CODE_EXPIRED [@ocaml.doc ""]
  | VERIFICATION_ALREADY_COMPLETE [@ocaml.doc ""]
  | PROTECT_CONFIGURATION_IS_ACCOUNT_DEFAULT [@ocaml.doc ""]
  | PROTECT_CONFIGURATION_ASSOCIATED_WITH_CONFIGURATION_SET [@ocaml.doc ""]
  | PROTECT_CONFIGURATION_NOT_ASSOCIATED_WITH_CONFIGURATION_SET [@ocaml.doc ""]
  | DESTINATION_COUNTRY_BLOCKED_BY_PROTECT_CONFIGURATION [@ocaml.doc ""]
  | DESTINATION_PHONE_NUMBER_BLOCKED_BY_PROTECT_NUMBER_OVERRIDE [@ocaml.doc ""]
  | RCS_AGENT_ALREADY_ASSOCIATED_TO_REGISTRATION_TYPE [@ocaml.doc ""]
  | NOTIFY_CONFIGURATION_NOT_ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  reason : conflict_exception_reason option; [@ocaml.doc "The reason for the exception.\n"]
  resource_type : resource_type option;
      [@ocaml.doc "The type of resource that caused the exception.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the request.\n"]
}
[@@ocaml.doc
  "Your request has conflicting operations. This can occur if you're trying to perform more than \
   one operation on the same resource at the same time or it could be that the requested action \
   isn't valid for the current state or configuration of the resource.\n"]

type nonrec iso_country_code = string [@@ocaml.doc ""]

type nonrec associate_origination_identity_result = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the pool that is now associated with the origination \
         identity.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PoolId of the pool that is now associated with the origination identity.\n"]
  origination_identity_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberArn or SenderIdArn of the origination identity.\n"]
  origination_identity : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberId or SenderId of the origination identity.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec phone_or_sender_id_or_arn = string [@@ocaml.doc ""]

type nonrec pool_id_or_arn = string [@@ocaml.doc ""]

type nonrec associate_origination_identity_request = {
  pool_id : pool_id_or_arn;
      [@ocaml.doc
        "The pool to update with the new Identity. This value can be either the PoolId or PoolArn, \
         and you can find these values using \
         {{:https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_DescribePools.html}DescribePools}.\n\n\
        \  If you are using a shared End User Messaging SMS; resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  origination_identity : phone_or_sender_id_or_arn;
      [@ocaml.doc
        "The origination identity to use, such as PhoneNumberId, PhoneNumberArn, SenderId, or \
         SenderIdArn. You can use [DescribePhoneNumbers] to find the values for PhoneNumberId and \
         PhoneNumberArn, while [DescribeSenderIds] can be used to get the values for SenderId and \
         SenderIdArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The new two-character code, in ISO 3166-1 alpha-2 format, for the country or region of \
         the origination identity. This field is optional and is not required for origination \
         identity types that are not country-specific, such as RCS agents.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec protect_configuration_id = string [@@ocaml.doc ""]

type nonrec protect_configuration_arn = string [@@ocaml.doc ""]

type nonrec configuration_set_name = string [@@ocaml.doc ""]

type nonrec associate_protect_configuration_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configuration set.\n"]
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the ConfigurationSet.\n"]
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec configuration_set_name_or_arn = string [@@ocaml.doc ""]

type nonrec protect_configuration_id_or_arn = string [@@ocaml.doc ""]

type nonrec associate_protect_configuration_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc "The name of the ConfigurationSet.\n"]
}
[@@ocaml.doc ""]

type nonrec attachment_body = bytes [@@ocaml.doc ""]

type nonrec attachment_status =
  | UPLOAD_IN_PROGRESS [@ocaml.doc ""]
  | UPLOAD_COMPLETE [@ocaml.doc ""]
  | UPLOAD_FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec attachment_upload_error_reason = INTERNAL_ERROR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec attachment_url = string [@@ocaml.doc ""]

type nonrec phone_number_type =
  | MOBILE [@ocaml.doc ""]
  | LANDLINE [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | INVALID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mnc_type = string [@@ocaml.doc ""]

type nonrec mcc_type = string [@@ocaml.doc ""]

type nonrec dialing_country_code_type = string [@@ocaml.doc ""]

type nonrec e164_phone_number_type = string [@@ocaml.doc ""]

type nonrec carrier_lookup_result = {
  e164_phone_number : e164_phone_number_type;
      [@ocaml.doc
        "The phone number in E164 format, sanitized from the original input by removing any \
         formatting characters.\n"]
  dialing_country_code : dialing_country_code_type option;
      [@ocaml.doc "The country or region numeric dialing code for the phone number.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character country or region code, in ISO 3166-1 alpha-2 format, for the phone \
         number.\n"]
  country : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the country or region for the phone number.\n"]
  mc_c : mcc_type option;
      [@ocaml.doc "The phone number's mobile country code, for mobile phone number types\n"]
  mn_c : mnc_type option;
      [@ocaml.doc "The phone number's mobile network code, for mobile phone number types.\n"]
  carrier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The carrier or service provider that the phone number is currently registered with. In \
         some countries and regions, this value may be the carrier or service provider that the \
         phone number was originally registered with.\n"]
  phone_number_type : phone_number_type;
      [@ocaml.doc
        "Describes the type of phone number. Valid values are: MOBILE, LANDLINE, OTHER, and \
         INVALID. Avoid sending SMS or voice messages to INVALID phone numbers, as these numbers \
         are unlikely to belong to actual recipients.\n"]
}
[@@ocaml.doc ""]

type nonrec carrier_lookup_input_phone_number_type = string [@@ocaml.doc ""]

type nonrec carrier_lookup_request = {
  phone_number : carrier_lookup_input_phone_number_type;
      [@ocaml.doc
        "The phone number that you want to retrieve information about. You can provide the phone \
         number in various formats including special characters such as parentheses, brackets, \
         spaces, hyphens, periods, and commas. The service automatically converts the input to \
         E164 format for processing.\n"]
}
[@@ocaml.doc ""]

type nonrec carrier_status =
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec carrier_status_information = {
  carrier_name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the carrier.\n"]
  status : carrier_status; [@ocaml.doc "The launch status for this carrier.\n"]
}
[@@ocaml.doc "Contains carrier-level launch status details for an RCS agent within a country.\n"]

type nonrec carrier_status_information_list = carrier_status_information list [@@ocaml.doc ""]

type nonrec log_group_arn = string [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec cloud_watch_logs_destination = {
  iam_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an Identity and Access Management role that is able to \
         write event data to an Amazon CloudWatch destination.\n"]
  log_group_arn : log_group_arn;
      [@ocaml.doc
        "The name of the Amazon CloudWatch log group that you want to record events in. \n"]
}
[@@ocaml.doc
  "Contains the destination configuration to use when publishing message sending events. \n"]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_value_list = filter_value list [@@ocaml.doc ""]

type nonrec configuration_set_filter_name =
  | EVENT_DESTINATION_NAME [@ocaml.doc ""]
  | MATCHING_EVENT_TYPES [@ocaml.doc ""]
  | DEFAULT_MESSAGE_TYPE [@ocaml.doc ""]
  | DEFAULT_SENDER_ID [@ocaml.doc ""]
  | DEFAULT_MESSAGE_FEEDBACK_ENABLED [@ocaml.doc ""]
  | PROTECT_CONFIGURATION_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec configuration_set_filter = {
  name : configuration_set_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for configuration sets that meet a specified criteria.\n"]

type nonrec configuration_set_filter_list = configuration_set_filter list [@@ocaml.doc ""]

type nonrec sender_id = string [@@ocaml.doc ""]

type nonrec message_type = TRANSACTIONAL [@ocaml.doc ""] | PROMOTIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sns_topic_arn = string [@@ocaml.doc ""]

type nonrec sns_destination = {
  topic_arn : sns_topic_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to publish events to.\n"]
}
[@@ocaml.doc
  "An object that defines an Amazon SNS destination for events. You can use Amazon SNS to send \
   notification when certain events occur.\n"]

type nonrec delivery_stream_arn = string [@@ocaml.doc ""]

type nonrec kinesis_firehose_destination = {
  iam_role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of an Identity and Access Management role that is able to write event data to an \
         Amazon Data Firehose destination.\n"]
  delivery_stream_arn : delivery_stream_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the delivery stream.\n"]
}
[@@ocaml.doc
  "Contains the delivery stream Amazon Resource Name (ARN), and the ARN of the Identity and Access \
   Management (IAM) role associated with a Firehose event destination.\n\n\
  \ Event destinations, such as Firehose, are associated with configuration sets, which enable you \
   to publish message sending events.\n\
  \ "]

type nonrec event_type =
  | ALL [@ocaml.doc ""]
  | TEXT_ALL [@ocaml.doc ""]
  | TEXT_SENT [@ocaml.doc ""]
  | TEXT_PENDING [@ocaml.doc ""]
  | TEXT_QUEUED [@ocaml.doc ""]
  | TEXT_SUCCESSFUL [@ocaml.doc ""]
  | TEXT_DELIVERED [@ocaml.doc ""]
  | TEXT_INVALID [@ocaml.doc ""]
  | TEXT_INVALID_MESSAGE [@ocaml.doc ""]
  | TEXT_UNREACHABLE [@ocaml.doc ""]
  | TEXT_CARRIER_UNREACHABLE [@ocaml.doc ""]
  | TEXT_BLOCKED [@ocaml.doc ""]
  | TEXT_CARRIER_BLOCKED [@ocaml.doc ""]
  | TEXT_SPAM [@ocaml.doc ""]
  | TEXT_UNKNOWN [@ocaml.doc ""]
  | TEXT_TTL_EXPIRED [@ocaml.doc ""]
  | TEXT_PROTECT_BLOCKED [@ocaml.doc ""]
  | VOICE_ALL [@ocaml.doc ""]
  | VOICE_INITIATED [@ocaml.doc ""]
  | VOICE_RINGING [@ocaml.doc ""]
  | VOICE_ANSWERED [@ocaml.doc ""]
  | VOICE_COMPLETED [@ocaml.doc ""]
  | VOICE_BUSY [@ocaml.doc ""]
  | VOICE_NO_ANSWER [@ocaml.doc ""]
  | VOICE_FAILED [@ocaml.doc ""]
  | VOICE_TTL_EXPIRED [@ocaml.doc ""]
  | MEDIA_ALL [@ocaml.doc ""]
  | MEDIA_PENDING [@ocaml.doc ""]
  | MEDIA_QUEUED [@ocaml.doc ""]
  | MEDIA_SUCCESSFUL [@ocaml.doc ""]
  | MEDIA_DELIVERED [@ocaml.doc ""]
  | MEDIA_INVALID [@ocaml.doc ""]
  | MEDIA_INVALID_MESSAGE [@ocaml.doc ""]
  | MEDIA_UNREACHABLE [@ocaml.doc ""]
  | MEDIA_CARRIER_UNREACHABLE [@ocaml.doc ""]
  | MEDIA_BLOCKED [@ocaml.doc ""]
  | MEDIA_CARRIER_BLOCKED [@ocaml.doc ""]
  | MEDIA_SPAM [@ocaml.doc ""]
  | MEDIA_UNKNOWN [@ocaml.doc ""]
  | MEDIA_TTL_EXPIRED [@ocaml.doc ""]
  | MEDIA_FILE_INACCESSIBLE [@ocaml.doc ""]
  | MEDIA_FILE_TYPE_UNSUPPORTED [@ocaml.doc ""]
  | MEDIA_FILE_SIZE_EXCEEDED [@ocaml.doc ""]
  | RCS_ALL [@ocaml.doc ""]
  | RCS_QUEUED [@ocaml.doc ""]
  | RCS_SENT [@ocaml.doc ""]
  | RCS_DELIVERED [@ocaml.doc ""]
  | RCS_READ [@ocaml.doc ""]
  | RCS_FAILED [@ocaml.doc ""]
  | RCS_TTL_EXPIRED [@ocaml.doc ""]
  | RCS_PROTECT_BLOCKED [@ocaml.doc ""]
  | RCS_FALLEN_BACK_TO_SMS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type_list = event_type list [@@ocaml.doc ""]

type nonrec event_destination_name = string [@@ocaml.doc ""]

type nonrec event_destination = {
  event_destination_name : event_destination_name;
      [@ocaml.doc "The name of the EventDestination.\n"]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "When set to true events will be logged.\n"]
  matching_event_types : event_type_list;
      [@ocaml.doc
        "An array of event types that determine which events to log.\n\n\
        \  The [TEXT_SENT] event type is not supported.\n\
        \  \n\
        \   "]
  cloud_watch_logs_destination : cloud_watch_logs_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination that sends logging events \
         to Amazon CloudWatch logs.\n"]
  kinesis_firehose_destination : kinesis_firehose_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination for logging to Amazon Data \
         Firehose.\n"]
  sns_destination : sns_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination that sends logging events \
         to Amazon SNS.\n"]
}
[@@ocaml.doc
  "Contains information about an event destination.\n\n\
  \ Event destinations are associated with configuration sets, which enable you to publish message \
   sending events to CloudWatch, Firehose, or Amazon SNS.\n\
  \ "]

type nonrec event_destination_list = event_destination list [@@ocaml.doc ""]

type nonrec configuration_set_information = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Resource Name (ARN) of the ConfigurationSet.\n"]
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the ConfigurationSet.\n"]
  event_destinations : event_destination_list;
      [@ocaml.doc
        "An array of EventDestination objects that describe any events to log and where to log them.\n"]
  default_message_type : message_type option;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  default_sender_id : sender_id option;
      [@ocaml.doc "The default sender ID used by the ConfigurationSet.\n"]
  default_message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "True if message feedback is enabled.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the ConfigurationSet was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  protect_configuration_id : protect_configuration_id_or_arn option;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
}
[@@ocaml.doc
  "Information related to a given configuration set in your Amazon Web Services account.\n"]

type nonrec configuration_set_information_list = configuration_set_information list [@@ocaml.doc ""]

type nonrec configuration_set_name_list = configuration_set_name_or_arn list [@@ocaml.doc ""]

type nonrec context_key = string [@@ocaml.doc ""]

type nonrec context_value = string [@@ocaml.doc ""]

type nonrec context_map = (context_key * context_value) list [@@ocaml.doc ""]

type nonrec country_launch_status =
  | CREATED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | PARTIAL [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec country_launch_status_filter_name = COUNTRY_LAUNCH_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec country_launch_status_filter = {
  name : country_launch_status_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for a country launch status that meets a specified criteria.\n"]

type nonrec country_launch_status_filter_list = country_launch_status_filter list [@@ocaml.doc ""]

type nonrec country_launch_status_information = {
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  status : country_launch_status; [@ocaml.doc "The launch status for this country.\n"]
  rcs_platform_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The RCS platform identifier for this country.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The unique identifier of the registration associated with this country launch.\n"]
  carrier_status : carrier_status_information_list;
      [@ocaml.doc
        "An array of CarrierStatusInformation objects containing carrier-level launch status \
         details.\n"]
}
[@@ocaml.doc "Contains per-country launch status details for an RCS agent.\n"]

type nonrec country_launch_status_information_list = country_launch_status_information list
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key identifier, or name, of the tag.\n"]
  value : tag_value; [@ocaml.doc "The string value associated with the key of the tag.\n"]
}
[@@ocaml.doc "The list of tags to be added to the specified topic.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec create_configuration_set_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the newly created configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the new configuration set.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of key and value pair tags that's associated with the configuration set.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the configuration set was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_configuration_set_request = {
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name to use for the new configuration set.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of key and value pair tags that's associated with the new configuration set. \n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_destination_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ARN of the configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set.\n"]
  event_destination : event_destination option;
      [@ocaml.doc "The details of the destination where events are logged.\n"]
}
[@@ocaml.doc ""]

type nonrec create_event_destination_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "Either the name of the configuration set or the configuration set ARN to apply event \
         logging to. The ConfigurateSetName and ConfigurationSetArn can be found using the \
         [DescribeConfigurationSets] action.\n"]
  event_destination_name : event_destination_name;
      [@ocaml.doc "The name that identifies the event destination.\n"]
  matching_event_types : event_type_list;
      [@ocaml.doc
        "An array of event types that determine which events to log. If \"ALL\" is used, then End \
         User Messaging SMS logs every event type.\n\n\
        \  The [TEXT_SENT] event type is not supported.\n\
        \  \n\
        \   "]
  cloud_watch_logs_destination : cloud_watch_logs_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination for logging to Amazon \
         CloudWatch Logs.\n"]
  kinesis_firehose_destination : kinesis_firehose_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination for logging to Amazon Data \
         Firehose.\n"]
  sns_destination : sns_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination for logging to Amazon SNS.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec notify_configuration_status =
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | REQUIRES_VERIFICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tier_upgrade_status =
  | BASIC [@ocaml.doc ""]
  | PENDING_UPGRADE [@ocaml.doc ""]
  | ADVANCED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_configuration_tier = BASIC [@ocaml.doc ""] | ADVANCED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec number_capability =
  | SMS [@ocaml.doc ""]
  | VOICE [@ocaml.doc ""]
  | MMS [@ocaml.doc ""]
  | RCS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_enabled_channels_list = number_capability list [@@ocaml.doc ""]

type nonrec iso_country_code_list = iso_country_code list [@@ocaml.doc ""]

type nonrec notify_template_id = string [@@ocaml.doc ""]

type nonrec notify_configuration_use_case = CODE_VERIFICATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec notify_configuration_display_name = string [@@ocaml.doc ""]

type nonrec notify_configuration_id = string [@@ocaml.doc ""]

type nonrec notify_configuration_arn = string [@@ocaml.doc ""]

type nonrec create_notify_configuration_result = {
  notify_configuration_arn : notify_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the notify configuration.\n"]
  notify_configuration_id : notify_configuration_id;
      [@ocaml.doc "The unique identifier for the notify configuration.\n"]
  display_name : notify_configuration_display_name;
      [@ocaml.doc "The display name associated with the notify configuration.\n"]
  use_case : notify_configuration_use_case;
      [@ocaml.doc "The use case for the notify configuration.\n"]
  default_template_id : notify_template_id option;
      [@ocaml.doc "The default template identifier associated with the notify configuration.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the pool associated with the notify configuration.\n"]
  enabled_countries : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, that are \
         enabled for the notify configuration.\n"]
  enabled_channels : notify_enabled_channels_list;
      [@ocaml.doc
        "An array of channels enabled for the notify configuration. Supported values include [SMS] \
         and [VOICE].\n"]
  tier : notify_configuration_tier; [@ocaml.doc "The tier of the notify configuration.\n"]
  tier_upgrade_status : tier_upgrade_status;
      [@ocaml.doc "The tier upgrade status of the notify configuration.\n"]
  status : notify_configuration_status;
      [@ocaml.doc "The current status of the notify configuration.\n"]
  rejection_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason the notify configuration was rejected, if applicable.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) associated with the notify configuration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the notify configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_notify_configuration_request = {
  display_name : notify_configuration_display_name;
      [@ocaml.doc "The display name to associate with the notify configuration.\n"]
  use_case : notify_configuration_use_case;
      [@ocaml.doc "The use case for the notify configuration.\n"]
  default_template_id : notify_template_id option;
      [@ocaml.doc
        "The default template identifier to associate with the notify configuration. If specified, \
         this template is used when sending messages without an explicit template identifier.\n"]
  pool_id : pool_id_or_arn option;
      [@ocaml.doc "The identifier of the pool to associate with the notify configuration.\n"]
  enabled_countries : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, that are \
         enabled for the notify configuration.\n"]
  enabled_channels : notify_enabled_channels_list;
      [@ocaml.doc
        "An array of channels to enable for the notify configuration. Supported values include \
         [SMS] and [VOICE].\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the notify configuration can't be \
         deleted. You can change this value using the [UpdateNotifyConfiguration] action.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) associated with the notify configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec opt_out_list_name = string [@@ocaml.doc ""]

type nonrec create_opt_out_list_result = {
  opt_out_list_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the OptOutList.\n"]
  opt_out_list_name : opt_out_list_name option; [@ocaml.doc "The name of the new OptOutList.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) associated with the new OptOutList.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the pool was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_opt_out_list_request = {
  opt_out_list_name : opt_out_list_name; [@ocaml.doc "The name of the new OptOutList.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) to associate with the new OptOutList.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec two_way_channel_arn = string [@@ocaml.doc ""]

type nonrec pool_status =
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_pool_result = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the pool.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the pool.\n"]
  status : pool_status option;
      [@ocaml.doc
        "The current status of the pool.\n\n\
        \ {ul\n\
        \       {-  CREATING: The pool is currently being created and isn't yet available for use.\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE: The pool is active and available for use.\n\
        \           \n\
        \            }\n\
        \       {-  DELETING: The pool is being deleted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message_type : message_type option; [@ocaml.doc "The type of message for the pool to use.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to false, and an end recipient sends a message \
         that begins with HELP or STOP to one of your dedicated numbers, End User Messaging SMS \
         automatically replies with a customizable message and adds the end recipient to the \
         OptOutList. When set to true you're responsible for responding to HELP and STOP requests. \
         You're also responsible for tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList associated with the pool.\n"]
  shared_routes_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Indicates whether shared routes are enabled for the pool. Set to false and only \
         origination identities in this pool are used to send messages. \n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) associated with the pool.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the pool was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_pool_request = {
  origination_identity : phone_or_sender_id_or_arn;
      [@ocaml.doc
        "The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or \
         SenderIdArn. You can use \
         {{:https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_DescribePhoneNumbers.html}DescribePhoneNumbers} \
         to find the values for PhoneNumberId and PhoneNumberArn, and use \
         {{:https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_DescribeSenderIds.html}DescribeSenderIds} \
         can be used to get the values for SenderId and SenderIdArn.\n\n\
        \ After the pool is created you can add more origination identities to the pool by using \
         {{:https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_AssociateOriginationIdentity.html}AssociateOriginationIdentity}.\n\
        \ \n\
        \   If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \   \n\
        \    "]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The new two-character code, in ISO 3166-1 alpha-2 format, for the country or region of \
         the new pool. This field is optional and is not required for origination identity types \
         that are not country-specific, such as RCS agents.\n"]
  message_type : message_type;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive. After \
         the pool is created the MessageType can't be changed.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the pool can't be deleted. You can \
         change this value using the \
         {{:https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_UpdatePool.html}UpdatePool} \
         action.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) associated with the pool.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec create_protect_configuration_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the protect configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  account_default : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "This is true if the protect configuration is set as your account default protect \
         configuration.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  tags : tag_list option;
      [@ocaml.doc "An array of key and value pair tags that are associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_protect_configuration_request = {
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  tags : tag_list option;
      [@ocaml.doc "An array of key and value pair tags that are associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec rcs_event_type = string [@@ocaml.doc ""]

type nonrec rcs_event_type_list = rcs_event_type list [@@ocaml.doc ""]

type nonrec two_way_media_s3_key_prefix = string [@@ocaml.doc ""]

type nonrec two_way_media_s3_bucket_name = string [@@ocaml.doc ""]

type nonrec rcs_agent_status =
  | CREATED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | TESTING [@ocaml.doc ""]
  | PARTIAL [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_rcs_agent_result = {
  rcs_agent_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the newly created RCS agent.\n"]
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the RCS agent.\n"]
  status : rcs_agent_status; [@ocaml.doc "The current status of the RCS agent.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList associated with the RCS agent.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the RCS agent was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you're responsible for responding to \
         HELP and STOP requests. You're also responsible for tracking and honoring opt-out \
         requests.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_media_s3_bucket_name : two_way_media_s3_bucket_name option;
      [@ocaml.doc "The name of the S3 bucket where inbound RCS media files are stored.\n"]
  two_way_media_s3_key_prefix : two_way_media_s3_key_prefix option;
      [@ocaml.doc "The key prefix used for inbound RCS media objects in the S3 bucket.\n"]
  two_way_media_s3_role : iam_role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role used to write inbound RCS media files to the S3 bucket. The role \
         must have [s3:PutObject] permission on the bucket and a trust policy allowing \
         [sms-voice.amazonaws.com] to assume it.\n"]
  two_way_rcs_events_enabled : rcs_event_type_list option;
      [@ocaml.doc "The list of RCS event types enabled for two-way messaging on the agent.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) associated with the RCS agent.\n"]
}
[@@ocaml.doc ""]

type nonrec opt_out_list_name_or_arn = string [@@ocaml.doc ""]

type nonrec create_rcs_agent_request = {
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the RCS agent can't be deleted. You can \
         change this value using the [UpdateRcsAgent] action.\n"]
  opt_out_list_name : opt_out_list_name_or_arn option;
      [@ocaml.doc
        "The OptOutList to associate with the RCS agent. Valid values are either OptOutListName or \
         OptOutListArn.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) associated with the RCS agent.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec registration_version_number = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec registration_status =
  | CREATED [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
  | AWS_REVIEWING [@ocaml.doc ""]
  | REVIEWING [@ocaml.doc ""]
  | REQUIRES_AUTHENTICATION [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | REQUIRES_UPDATES [@ocaml.doc ""]
  | CLOSED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_type = string [@@ocaml.doc ""]

type nonrec create_registration_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form to create. The list of {b RegistrationTypes} can be found \
         using the [DescribeRegistrationTypeDefinitions] action.\n"]
  registration_status : registration_status;
      [@ocaml.doc
        "The status of the registration.\n\n\
        \ {ul\n\
        \       {-   [CLOSED]: The phone number or sender ID has been deleted and you must also \
         delete the registration for the number.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATED]: Your registration is created but not submitted.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE]: Your registration has been approved and your origination identity \
         has been created.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED]: The registration has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [PROVISIONING]: Your registration has been approved and your origination \
         identity is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_UPDATES]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted and is awaiting review.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  current_version_number : registration_version_number;
      [@ocaml.doc "The current version number of the registration.\n"]
  additional_attributes : string_map option;
      [@ocaml.doc
        "Metadata about a given registration which is specific to that registration type.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) to associate with the registration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_registration_request = {
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form to create. The list of {b RegistrationTypes} can be found \
         using the [DescribeRegistrationTypeDefinitions] action.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) to associate with the registration.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec phone_number = string [@@ocaml.doc ""]

type nonrec create_registration_association_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  resource_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the origination identity that is associated with the \
         registration. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The unique identifier for the origination identity. For example this could be a {b \
         PhoneNumberId} or {b SenderId}.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The registration type or origination identity type.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  phone_number : phone_number option;
      [@ocaml.doc "The phone number associated with the registration in E.164 format.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id_or_arn = string [@@ocaml.doc ""]

type nonrec registration_id_or_arn = string [@@ocaml.doc ""]

type nonrec create_registration_association_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  resource_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier for the origination identity. For example this could be a {b \
         PhoneNumberId} or {b SenderId}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_registration_attachment_result = {
  registration_attachment_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration attachment.\n"]
  registration_attachment_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
  attachment_status : attachment_status;
      [@ocaml.doc
        "The status of the registration attachment. \n\n\
        \ {ul\n\
        \       {-   [UPLOAD_IN_PROGRESS] The attachment is being uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [UPLOAD_COMPLETE] The attachment has been uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [UPLOAD_FAILED] The attachment failed to uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] The attachment has been deleted..\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) to associate with the registration attachment.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration attachment was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_registration_attachment_request = {
  attachment_body : attachment_body option;
      [@ocaml.doc
        "The registration file to upload. The maximum file size is 500KB and valid file extensions \
         are PDF, JPEG and PNG.\n"]
  attachment_url : attachment_url option;
      [@ocaml.doc
        "Registration files have to be stored in an Amazon S3 bucket. The URI to use when sending \
         is in the format [s3://BucketName/FileName].\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) to associate with the registration attachment.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_version_status_history = {
  draft_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration was in the draft state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  submitted_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the submitted state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  aws_reviewing_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the AWS reviewing state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  reviewing_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the reviewing state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  requires_authentication_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the requires authentication state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  approved_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the approved state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  discarded_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the discarded state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  denied_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the denied state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  revoked_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the revoked state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  archived_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the registration was in the archived state, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc
  "The {b RegistrationVersionStatusHistory} object contains the time stamps for when the \
   reservations status changes.\n"]

type nonrec registration_version_status =
  | DRAFT [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
  | AWS_REVIEWING [@ocaml.doc ""]
  | REVIEWING [@ocaml.doc ""]
  | REQUIRES_AUTHENTICATION [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | DISCARDED [@ocaml.doc ""]
  | DENIED [@ocaml.doc ""]
  | REVOKED [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | REQUIRES_OFFLINE_REVIEW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_registration_version_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number;
      [@ocaml.doc "The new version number of the registration.\n"]
  registration_version_status : registration_version_status;
      [@ocaml.doc
        "The status of the registration.\n\n\
        \ {ul\n\
        \       {-   [APPROVED]: Your registration has been approved.\n\
        \           \n\
        \            }\n\
        \       {-   [ARCHIVED]: Your previously approved registration version moves into this \
         status when a more recently submitted version is approved.\n\
        \           \n\
        \            }\n\
        \       {-   [DENIED]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [DISCARDED]: You've abandon this version of their registration to start over \
         with a new version. \n\
        \           \n\
        \            }\n\
        \       {-   [DRAFT]: The initial status of a registration version after it\226\128\153s \
         created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [REVOKED]: Your previously approved registration has been revoked.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  registration_version_status_history : registration_version_status_history;
      [@ocaml.doc
        "A {b RegistrationVersionStatusHistory} object that contains timestamps for the \
         registration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_registration_version_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
}
[@@ocaml.doc ""]

type nonrec verification_status =
  | PENDING [@ocaml.doc ""]
  | VERIFIED [@ocaml.doc ""]
  | UNSUPPORTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_verified_destination_number_result = {
  verified_destination_number_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the verified destination phone number.\n"]
  verified_destination_number_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the verified destination phone number.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The verified destination phone number, in E.164 format.\n"]
  status : verification_status;
      [@ocaml.doc
        "The status of the verified destination phone number.\n\n\
        \ {ul\n\
        \       {-   [PENDING]: The phone number hasn't been verified yet.\n\
        \           \n\
        \            }\n\
        \       {-   [VERIFIED]: The phone number is verified and can receive messages.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the RCS agent associated with the verified destination number.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) to associate with the destination number.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the verified phone number was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec rcs_agent_id_or_arn = string [@@ocaml.doc ""]

type nonrec create_verified_destination_number_request = {
  destination_phone_number : phone_number;
      [@ocaml.doc "The verified destination phone number, in E.164 format.\n"]
  rcs_agent_id : rcs_agent_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the RCS agent to associate with the verified destination number. \
         You can use either the RcsAgentId or RcsAgentArn.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) to associate with the destination number.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_default_protect_configuration_result = {
  default_protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the account default protect configuration.\n"]
  default_protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier of the account default protect configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_default_protect_configuration_request = unit [@@ocaml.doc ""]

type nonrec delete_configuration_set_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the deleted configuration set.\n"]
  event_destinations : event_destination_list option;
      [@ocaml.doc
        "An array of any EventDestination objects that were associated with the deleted \
         configuration set.\n"]
  default_message_type : message_type option;
      [@ocaml.doc "The default message type of the configuration set that was deleted.\n"]
  default_sender_id : sender_id option;
      [@ocaml.doc "The default Sender ID of the configuration set that was deleted.\n"]
  default_message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "True if the configuration set has message feedback enabled. By default this is set to \
         false. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time that the deleted configuration set was created in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_configuration_set_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The name of the configuration set or the configuration set ARN that you want to delete. \
         The ConfigurationSetName and ConfigurationSetArn can be found using the \
         [DescribeConfigurationSets] action.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_default_message_type_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set.\n"]
  message_type : message_type option;
      [@ocaml.doc "The current message type for the configuration set.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_default_message_type_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The name of the configuration set or the configuration set Amazon Resource Name (ARN) to \
         delete the default message type from. The ConfigurationSetName and ConfigurationSetArn \
         can be found using the [DescribeConfigurationSets] action.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_default_sender_id_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set.\n"]
  sender_id : sender_id option; [@ocaml.doc "The current sender ID for the configuration set.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_default_sender_id_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The name of the configuration set or the configuration set Amazon Resource Name (ARN) to \
         delete the default sender ID from. The ConfigurationSetName and ConfigurationSetArn can \
         be found using the [DescribeConfigurationSets] action.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_destination_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set the event destination was deleted from.\n"]
  event_destination : event_destination option;
      [@ocaml.doc "The event destination object that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_destination_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The name of the configuration set or the configuration set's Amazon Resource Name (ARN) \
         to remove the event destination from. The ConfigurateSetName and ConfigurationSetArn can \
         be found using the [DescribeConfigurationSets] action.\n"]
  event_destination_name : event_destination_name;
      [@ocaml.doc "The name of the event destination to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec keyword_action =
  | AUTOMATIC_RESPONSE [@ocaml.doc ""]
  | OPT_OUT [@ocaml.doc ""]
  | OPT_IN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec keyword_message = string [@@ocaml.doc ""]

type nonrec keyword = string [@@ocaml.doc ""]

type nonrec delete_keyword_result = {
  origination_identity_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberArn or PoolArn that the keyword was associated with.\n"]
  origination_identity : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberId or PoolId that the keyword was associated with.\n"]
  keyword : keyword option; [@ocaml.doc "The keyword that was deleted.\n"]
  keyword_message : keyword_message option;
      [@ocaml.doc "The message that was associated with the deleted keyword.\n"]
  keyword_action : keyword_action option;
      [@ocaml.doc "The action that was associated with the deleted keyword.\n"]
}
[@@ocaml.doc ""]

type nonrec phone_or_pool_id_or_arn = string [@@ocaml.doc ""]

type nonrec delete_keyword_request = {
  origination_identity : phone_or_pool_id_or_arn;
      [@ocaml.doc
        "The origination identity to use such as a PhoneNumberId, PhoneNumberArn, PoolId or \
         PoolArn. You can use [DescribePhoneNumbers] to find the values for PhoneNumberId and \
         PhoneNumberArn and [DescribePools] to find the values of PoolId and PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  keyword : keyword; [@ocaml.doc "The keyword to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec monthly_limit = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec delete_media_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option; [@ocaml.doc "The current monthly limit, in US dollars.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_media_message_spend_limit_override_request = unit [@@ocaml.doc ""]

type nonrec delete_notify_configuration_result = {
  notify_configuration_arn : notify_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the notify configuration.\n"]
  notify_configuration_id : notify_configuration_id;
      [@ocaml.doc "The unique identifier for the notify configuration.\n"]
  display_name : notify_configuration_display_name;
      [@ocaml.doc "The display name associated with the notify configuration.\n"]
  use_case : notify_configuration_use_case;
      [@ocaml.doc "The use case for the notify configuration.\n"]
  default_template_id : notify_template_id option;
      [@ocaml.doc "The default template identifier associated with the notify configuration.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the pool associated with the notify configuration.\n"]
  enabled_countries : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, that are \
         enabled for the notify configuration.\n"]
  enabled_channels : notify_enabled_channels_list;
      [@ocaml.doc
        "An array of channels enabled for the notify configuration. Supported values include [SMS] \
         and [VOICE].\n"]
  tier : notify_configuration_tier; [@ocaml.doc "The tier of the notify configuration.\n"]
  tier_upgrade_status : tier_upgrade_status;
      [@ocaml.doc "The tier upgrade status of the notify configuration.\n"]
  status : notify_configuration_status;
      [@ocaml.doc "The current status of the notify configuration.\n"]
  rejection_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason the notify configuration was rejected, if applicable.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the notify configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec notify_configuration_id_or_arn = string [@@ocaml.doc ""]

type nonrec delete_notify_configuration_request = {
  notify_configuration_id : notify_configuration_id_or_arn;
      [@ocaml.doc
        "The identifier of the notify configuration to delete. The NotifyConfigurationId can be \
         found using the [DescribeNotifyConfigurations] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_notify_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option; [@ocaml.doc "The current monthly limit, in US dollars.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_notify_message_spend_limit_override_request = unit [@@ocaml.doc ""]

type nonrec delete_opt_out_list_result = {
  opt_out_list_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the OptOutList that was removed.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList that was removed.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the OptOutList was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_opt_out_list_request = {
  opt_out_list_name : opt_out_list_name_or_arn;
      [@ocaml.doc
        "The OptOutListName or OptOutListArn of the OptOutList to delete. You can use \
         [DescribeOptOutLists] to find the values for OptOutListName and OptOutListArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_opted_out_number_result = {
  opt_out_list_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OptOutListArn that the phone number was removed from.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The OptOutListName that the phone number was removed from.\n"]
  opted_out_number : phone_number option;
      [@ocaml.doc "The phone number that was removed from the OptOutList.\n"]
  opted_out_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time that the number was removed at, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  end_user_opted_out : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "This is true if it was the end user who requested their phone number be removed. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_opted_out_number_request = {
  opt_out_list_name : opt_out_list_name_or_arn;
      [@ocaml.doc
        "The OptOutListName or OptOutListArn to remove the phone number from.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  opted_out_number : phone_number;
      [@ocaml.doc "The phone number, in E.164 format, to remove from the OptOutList.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_pool_result = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the pool that was deleted.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PoolId of the pool that was deleted.\n"]
  status : pool_status option;
      [@ocaml.doc
        "The current status of the pool.\n\n\
        \ {ul\n\
        \       {-  CREATING: The pool is currently being created and isn't yet available for use.\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE: The pool is active and available for use.\n\
        \           \n\
        \            }\n\
        \       {-  DELETING: The pool is being deleted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message_type : message_type option;
      [@ocaml.doc "The message type that was associated with the deleted pool.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the TwoWayChannel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to false and an end recipient sends a message \
         that begins with HELP or STOP to one of your dedicated numbers, End User Messaging SMS \
         automatically replies with a customizable message and adds the end recipient to the \
         OptOutList. When set to true you're responsible for responding to HELP and STOP requests. \
         You're also responsible for tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList that was associated with the deleted pool.\n"]
  shared_routes_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "Indicates whether shared routes are enabled for the pool.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the pool was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_pool_request = {
  pool_id : pool_id_or_arn;
      [@ocaml.doc
        "The PoolId or PoolArn of the pool to delete. You can use [DescribePools] to find the \
         values for PoolId and PoolArn .\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_protect_configuration_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the protect configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  account_default : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "This is true if the protect configuration is set as your account default protect \
         configuration.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "The status of deletion protection for the protect configuration. When set to true \
         deletion protection is enabled. By default this is set to false. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_protect_configuration_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec protect_configuration_rule_override_action =
  | ALLOW [@ocaml.doc ""]
  | BLOCK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_protect_configuration_rule_set_number_override_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the rule was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  action : protect_configuration_rule_override_action;
      [@ocaml.doc "The action associated with the rule.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  expiration_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the resource-based policy was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_protect_configuration_rule_set_number_override_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rcs_agent_result = {
  rcs_agent_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted RCS agent.\n"]
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the deleted RCS agent.\n"]
  status : rcs_agent_status; [@ocaml.doc "The current status of the RCS agent.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the RCS agent was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList that was associated with the deleted RCS agent.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you're responsible for responding to \
         HELP and STOP requests. You're also responsible for tracking and honoring opt-out \
         requests.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_rcs_events_enabled : rcs_event_type_list option;
      [@ocaml.doc
        "The list of RCS event types that were enabled for two-way messaging on the deleted agent.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rcs_agent_request = {
  rcs_agent_id : rcs_agent_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the RCS agent to delete. You can use either the RcsAgentId or \
         RcsAgentArn.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rcs_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option;
      [@ocaml.doc "The current monthly limit to enforce on RCS message spending.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rcs_message_spend_limit_override_request = unit [@@ocaml.doc ""]

type nonrec delete_registration_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  registration_status : registration_status;
      [@ocaml.doc
        "The status of the registration.\n\n\
        \ {ul\n\
        \       {-   [CLOSED]: The phone number or sender ID has been deleted and you must also \
         delete the registration for the number.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATED]: Your registration is created but not submitted.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE]: Your registration has been approved and your origination identity \
         has been created.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED]: The registration has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [PROVISIONING]: Your registration has been approved and your origination \
         identity is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_UPDATES]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted and is awaiting review.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  current_version_number : registration_version_number;
      [@ocaml.doc "The current version number of the registration.\n"]
  approved_version_number : registration_version_number option;
      [@ocaml.doc "The version number of the registration that was approved.\n"]
  latest_denied_version_number : registration_version_number option;
      [@ocaml.doc "The latest version number of the registration that was denied.\n"]
  additional_attributes : string_map option;
      [@ocaml.doc
        "Metadata about a given registration which is specific to that registration type.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registration_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registration_attachment_result = {
  registration_attachment_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration attachment.\n"]
  registration_attachment_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
  attachment_status : attachment_status;
      [@ocaml.doc
        "The status of the registration attachment. \n\n\
        \ {ul\n\
        \       {-   [UPLOAD_IN_PROGRESS] The attachment is being uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [UPLOAD_COMPLETE] The attachment has been uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [UPLOAD_FAILED] The attachment failed to uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] The attachment has been deleted..\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  attachment_upload_error_reason : attachment_upload_error_reason option;
      [@ocaml.doc "The error message if the upload failed.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration attachment was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_attachment_id_or_arn = string [@@ocaml.doc ""]

type nonrec delete_registration_attachment_request = {
  registration_attachment_id : registration_attachment_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec text_value = string [@@ocaml.doc ""]

type nonrec select_choice = string [@@ocaml.doc ""]

type nonrec select_choice_list = select_choice list [@@ocaml.doc ""]

type nonrec field_path = string [@@ocaml.doc ""]

type nonrec delete_registration_field_value_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number;
      [@ocaml.doc "The version number of the registration.\n"]
  field_path : field_path; [@ocaml.doc "The path to the registration form field.\n"]
  select_choices : select_choice_list option;
      [@ocaml.doc "An array of values for the form field.\n"]
  text_value : text_value option; [@ocaml.doc "The text data for a free form field.\n"]
  registration_attachment_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registration_field_value_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  field_path : field_path;
      [@ocaml.doc
        "The path to the registration form field. You can use \
         [DescribeRegistrationFieldDefinitions] for a list of {b FieldPaths}.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_policy = string [@@ocaml.doc ""]

type nonrec delete_resource_policy_result = {
  resource_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the End User Messaging SMS resource that the \
         resource-based policy was deleted from.\n"]
  policy : resource_policy option;
      [@ocaml.doc "The JSON formatted resource-based policy that was deleted.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the resource-based policy was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the End User Messaging SMS resource you're deleting the \
         resource-based policy from.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_text_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option; [@ocaml.doc "The current monthly limit, in US dollars.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_text_message_spend_limit_override_request = unit [@@ocaml.doc ""]

type nonrec delete_verified_destination_number_result = {
  verified_destination_number_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the verified destination phone number.\n"]
  verified_destination_number_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the verified destination phone number.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The verified destination phone number, in E.164 format.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the destination phone number was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec verified_destination_number_id_or_arn = string [@@ocaml.doc ""]

type nonrec delete_verified_destination_number_request = {
  verified_destination_number_id : verified_destination_number_id_or_arn;
      [@ocaml.doc "The unique identifier for the verified destination phone number.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_voice_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option; [@ocaml.doc "The current monthly limit, in US dollars.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_voice_message_spend_limit_override_request = unit [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec describe_account_attributes_result = {
  account_attributes : account_attribute_list option;
      [@ocaml.doc "An array of AccountAttributes objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec describe_account_attributes_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_limits_result = {
  account_limits : account_limit_list option;
      [@ocaml.doc "An array of AccountLimit objects that show the current spend limits.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_limits_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_configuration_sets_result = {
  configuration_sets : configuration_set_information_list option;
      [@ocaml.doc "An array of ConfigurationSets objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_configuration_sets_request = {
  configuration_set_names : configuration_set_name_list option;
      [@ocaml.doc
        "An array of strings. Each element can be either a ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  filters : configuration_set_filter_list option;
      [@ocaml.doc "An array of filters to apply to the results that are returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec keyword_information = {
  keyword : keyword; [@ocaml.doc "The keyword as a string.\n"]
  keyword_message : keyword_message;
      [@ocaml.doc "A custom message that can be used with the keyword.\n"]
  keyword_action : keyword_action; [@ocaml.doc "The action to perform for the keyword.\n"]
}
[@@ocaml.doc "The information for all keywords in a pool.\n"]

type nonrec keyword_information_list = keyword_information list [@@ocaml.doc ""]

type nonrec describe_keywords_result = {
  origination_identity_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The PhoneNumberArn or PoolArn that is associated with the OriginationIdentity. \n"]
  origination_identity : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberId or PoolId that is associated with the OriginationIdentity.\n"]
  keywords : keyword_information_list option;
      [@ocaml.doc "An array of KeywordInformation objects that contain the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec keyword_filter_name = KEYWORD_ACTION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec keyword_filter = {
  name : keyword_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for keywords that meet a specified criteria.\n"]

type nonrec keyword_filter_list = keyword_filter list [@@ocaml.doc ""]

type nonrec keyword_list = keyword list [@@ocaml.doc ""]

type nonrec describe_keywords_request = {
  origination_identity : phone_or_pool_id_or_arn;
      [@ocaml.doc
        "The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or \
         SenderIdArn. You can use [DescribePhoneNumbers] to find the values for PhoneNumberId and \
         PhoneNumberArn while [DescribeSenderIds] can be used to get the values for SenderId and \
         SenderIdArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  keywords : keyword_list option; [@ocaml.doc "An array of keywords to search for.\n"]
  filters : keyword_filter_list option;
      [@ocaml.doc "An array of keyword filters to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec notify_configuration_information = {
  notify_configuration_arn : notify_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the notify configuration.\n"]
  notify_configuration_id : notify_configuration_id;
      [@ocaml.doc "The unique identifier for the notify configuration.\n"]
  display_name : notify_configuration_display_name;
      [@ocaml.doc "The display name associated with the notify configuration.\n"]
  use_case : notify_configuration_use_case;
      [@ocaml.doc "The use case for the notify configuration.\n"]
  default_template_id : notify_template_id option;
      [@ocaml.doc "The default template identifier associated with the notify configuration.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the pool associated with the notify configuration.\n"]
  enabled_countries : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, that are \
         enabled for the notify configuration.\n"]
  enabled_channels : notify_enabled_channels_list;
      [@ocaml.doc
        "An array of channels enabled for the notify configuration. Supported values include [SMS] \
         and [VOICE].\n"]
  tier : notify_configuration_tier; [@ocaml.doc "The tier of the notify configuration.\n"]
  tier_upgrade_status : tier_upgrade_status;
      [@ocaml.doc "The tier upgrade status of the notify configuration.\n"]
  status : notify_configuration_status;
      [@ocaml.doc "The current status of the notify configuration.\n"]
  rejection_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason the notify configuration was rejected, if applicable.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the notify configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc "The information for a notify configuration in an Amazon Web Services account.\n"]

type nonrec notify_configuration_information_list = notify_configuration_information list
[@@ocaml.doc ""]

type nonrec describe_notify_configurations_result = {
  notify_configurations : notify_configuration_information_list option;
      [@ocaml.doc "An array of NotifyConfigurationInformation objects that contain the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec notify_configuration_filter_name =
  | DISPLAY_NAME [@ocaml.doc ""]
  | ENABLED_COUNTRIES [@ocaml.doc ""]
  | ENABLED_CHANNELS [@ocaml.doc ""]
  | DEFAULT_TEMPLATE [@ocaml.doc ""]
  | DEFAULT_POOL [@ocaml.doc ""]
  | USE_CASE [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
  | TIER_UPGRADE_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_configuration_filter = {
  name : notify_configuration_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for notify configurations that meet a specified criteria.\n"]

type nonrec notify_configuration_filter_list = notify_configuration_filter list [@@ocaml.doc ""]

type nonrec notify_configuration_id_list = notify_configuration_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_notify_configurations_request = {
  notify_configuration_ids : notify_configuration_id_list option;
      [@ocaml.doc "An array of notify configuration IDs to describe.\n"]
  filters : notify_configuration_filter_list option;
      [@ocaml.doc "An array of NotifyConfigurationFilter objects to filter the results on.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec voice_id =
  | AMY [@ocaml.doc ""]
  | ASTRID [@ocaml.doc ""]
  | BIANCA [@ocaml.doc ""]
  | BRIAN [@ocaml.doc ""]
  | CAMILA [@ocaml.doc ""]
  | CARLA [@ocaml.doc ""]
  | CARMEN [@ocaml.doc ""]
  | CELINE [@ocaml.doc ""]
  | CHANTAL [@ocaml.doc ""]
  | CONCHITA [@ocaml.doc ""]
  | CRISTIANO [@ocaml.doc ""]
  | DORA [@ocaml.doc ""]
  | EMMA [@ocaml.doc ""]
  | ENRIQUE [@ocaml.doc ""]
  | EWA [@ocaml.doc ""]
  | FILIZ [@ocaml.doc ""]
  | GERAINT [@ocaml.doc ""]
  | GIORGIO [@ocaml.doc ""]
  | GWYNETH [@ocaml.doc ""]
  | HANS [@ocaml.doc ""]
  | INES [@ocaml.doc ""]
  | IVY [@ocaml.doc ""]
  | JACEK [@ocaml.doc ""]
  | JAN [@ocaml.doc ""]
  | JOANNA [@ocaml.doc ""]
  | JOEY [@ocaml.doc ""]
  | JUSTIN [@ocaml.doc ""]
  | KARL [@ocaml.doc ""]
  | KENDRA [@ocaml.doc ""]
  | KIMBERLY [@ocaml.doc ""]
  | LEA [@ocaml.doc ""]
  | LIV [@ocaml.doc ""]
  | LOTTE [@ocaml.doc ""]
  | LUCIA [@ocaml.doc ""]
  | LUPE [@ocaml.doc ""]
  | MADS [@ocaml.doc ""]
  | MAJA [@ocaml.doc ""]
  | MARLENE [@ocaml.doc ""]
  | MATHIEU [@ocaml.doc ""]
  | MATTHEW [@ocaml.doc ""]
  | MAXIM [@ocaml.doc ""]
  | MIA [@ocaml.doc ""]
  | MIGUEL [@ocaml.doc ""]
  | MIZUKI [@ocaml.doc ""]
  | NAJA [@ocaml.doc ""]
  | NICOLE [@ocaml.doc ""]
  | PENELOPE [@ocaml.doc ""]
  | RAVEENA [@ocaml.doc ""]
  | RICARDO [@ocaml.doc ""]
  | RUBEN [@ocaml.doc ""]
  | RUSSELL [@ocaml.doc ""]
  | SALLI [@ocaml.doc ""]
  | SEOYEON [@ocaml.doc ""]
  | TAKUMI [@ocaml.doc ""]
  | TATYANA [@ocaml.doc ""]
  | VICKI [@ocaml.doc ""]
  | VITORIA [@ocaml.doc ""]
  | ZEINA [@ocaml.doc ""]
  | ZHIYU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec voice_id_list = voice_id list [@@ocaml.doc ""]

type nonrec template_variable_source = CUSTOMER [@ocaml.doc ""] | SYSTEM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec template_variable_type =
  | STRING [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec template_variable_metadata = {
  type_ : template_variable_type; [@ocaml.doc "The type of the variable.\n"]
  required : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "Whether the variable is required.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the variable.\n"]
  max_length : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum length for string variables.\n"]
  min_value : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The minimum value for numeric variables.\n"]
  max_value : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum value for numeric variables.\n"]
  default_value : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The default value for the variable.\n"]
  pattern : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The regex pattern the variable value must match.\n"]
  sample : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A sample value for the variable.\n"]
  source : template_variable_source option;
      [@ocaml.doc "The source of the variable, either [CUSTOMER] or [SYSTEM].\n"]
}
[@@ocaml.doc "Contains metadata about a template variable.\n"]

type nonrec template_variables_map =
  (Smaws_Lib.Smithy_api.Types.string_ * template_variable_metadata) list
[@@ocaml.doc ""]

type nonrec template_content = string [@@ocaml.doc ""]

type nonrec notify_language_code = string [@@ocaml.doc ""]

type nonrec notify_template_status = ACTIVE [@ocaml.doc ""] | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_configuration_tier_list = notify_configuration_tier list [@@ocaml.doc ""]

type nonrec number_capability_list = number_capability list [@@ocaml.doc ""]

type nonrec notify_template_type = OTP_VERIFICATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec notify_template_version = int [@@ocaml.doc ""]

type nonrec notify_template_information = {
  template_id : notify_template_id; [@ocaml.doc "The unique identifier for the template.\n"]
  version : notify_template_version; [@ocaml.doc "The version of the template.\n"]
  template_type : notify_template_type; [@ocaml.doc "The type of the template.\n"]
  channels : number_capability_list;
      [@ocaml.doc "The channels for the template. Supported values are [SMS] and [VOICE].\n"]
  tier_access : notify_configuration_tier_list option;
      [@ocaml.doc "The tier access level for the template.\n"]
  status : notify_template_status option; [@ocaml.doc "The current status of the template.\n"]
  supported_countries : iso_country_code_list option;
      [@ocaml.doc "An array of supported country codes for the template.\n"]
  language_code : notify_language_code option; [@ocaml.doc "The language code for the template.\n"]
  content : template_content option; [@ocaml.doc "The content of the template.\n"]
  variables : template_variables_map option;
      [@ocaml.doc "An array of template variable metadata for the template.\n"]
  supported_voice_ids : voice_id_list option;
      [@ocaml.doc "An array of supported voice IDs for voice templates.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the notify template was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc
  "The information for a system-managed notify template in an Amazon Web Services account.\n"]

type nonrec notify_template_information_list = notify_template_information list [@@ocaml.doc ""]

type nonrec describe_notify_templates_result = {
  notify_templates : notify_template_information_list option;
      [@ocaml.doc "An array of NotifyTemplateInformation objects that contain the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec notify_template_filter_name =
  | TEMPLATE_TYPE [@ocaml.doc ""]
  | CHANNELS [@ocaml.doc ""]
  | TIER_ACCESS [@ocaml.doc ""]
  | SUPPORTED_COUNTRIES [@ocaml.doc ""]
  | LANGUAGE_CODE [@ocaml.doc ""]
  | SUPPORTED_VOICE_IDS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_template_filter = {
  name : notify_template_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for notify templates that meet a specified criteria.\n"]

type nonrec notify_template_filter_list = notify_template_filter list [@@ocaml.doc ""]

type nonrec notify_template_id_list = notify_template_id list [@@ocaml.doc ""]

type nonrec describe_notify_templates_request = {
  template_ids : notify_template_id_list option;
      [@ocaml.doc "An array of template IDs to describe.\n"]
  filters : notify_template_filter_list option;
      [@ocaml.doc "An array of NotifyTemplateFilter objects to filter the results on.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec opt_out_list_information = {
  opt_out_list_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the OptOutList.\n"]
  opt_out_list_name : opt_out_list_name; [@ocaml.doc "The name of the OptOutList.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the OutOutList was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc "The information for all OptOutList in an Amazon Web Services account.\n"]

type nonrec opt_out_list_information_list = opt_out_list_information list [@@ocaml.doc ""]

type nonrec describe_opt_out_lists_result = {
  opt_out_lists : opt_out_list_information_list option;
      [@ocaml.doc
        "An array of OptOutListInformation objects that contain the details for the requested \
         OptOutLists.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec owner = SELF [@ocaml.doc ""] | SHARED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec opt_out_list_name_list = opt_out_list_name_or_arn list [@@ocaml.doc ""]

type nonrec describe_opt_out_lists_request = {
  opt_out_list_names : opt_out_list_name_list option;
      [@ocaml.doc
        "The OptOutLists to show the details of. This is an array of strings that can be either \
         the OptOutListName or OptOutListArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
  owner : owner option;
      [@ocaml.doc
        "Use [SELF] to filter the list of Opt-Out List to ones your account owns or use [SHARED] \
         to filter on Opt-Out List shared with your account. The [Owner] and [OptOutListNames] \
         parameters can't be used at the same time.\n"]
}
[@@ocaml.doc ""]

type nonrec opted_out_number_information = {
  opted_out_number : phone_number; [@ocaml.doc "The phone number that is opted out.\n"]
  opted_out_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time that the op tout occurred, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  end_user_opted_out : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "This is set to true if it was the end recipient that opted out.\n"]
}
[@@ocaml.doc "The information for an opted out number in an Amazon Web Services account.\n"]

type nonrec opted_out_number_information_list = opted_out_number_information list [@@ocaml.doc ""]

type nonrec describe_opted_out_numbers_result = {
  opt_out_list_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the OptOutList.\n"]
  opt_out_list_name : opt_out_list_name option; [@ocaml.doc "The name of the OptOutList.\n"]
  opted_out_numbers : opted_out_number_information_list option;
      [@ocaml.doc
        "An array of OptedOutNumbersInformation objects that provide information about the \
         requested OptedOutNumbers.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec opted_out_filter_name = END_USER_OPTED_OUT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec opted_out_filter = {
  name : opted_out_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter for.\n"]
}
[@@ocaml.doc "The information for opted out numbers that meet a specified criteria.\n"]

type nonrec opted_out_filter_list = opted_out_filter list [@@ocaml.doc ""]

type nonrec opted_out_number_list = phone_number list [@@ocaml.doc ""]

type nonrec describe_opted_out_numbers_request = {
  opt_out_list_name : opt_out_list_name_or_arn;
      [@ocaml.doc
        "The OptOutListName or OptOutListArn of the OptOutList. You can use [DescribeOptOutLists] \
         to find the values for OptOutListName and OptOutListArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  opted_out_numbers : opted_out_number_list option;
      [@ocaml.doc
        "An array of phone numbers to search for in the OptOutList.\n\n\
        \ If you specify an opted out number that isn't valid, an exception is returned.\n\
        \ "]
  filters : opted_out_filter_list option;
      [@ocaml.doc "An array of OptedOutFilter objects to filter the results on.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec number_type =
  | SHORT_CODE [@ocaml.doc ""]
  | LONG_CODE [@ocaml.doc ""]
  | TOLL_FREE [@ocaml.doc ""]
  | TEN_DLC [@ocaml.doc ""]
  | SIMULATOR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec number_status =
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ASSOCIATING [@ocaml.doc ""]
  | DISASSOCIATING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec phone_number_information = {
  phone_number_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with the phone number.\n"]
  phone_number_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the phone number.\n"]
  phone_number : phone_number; [@ocaml.doc "The phone number in E.164 format.\n"]
  status : number_status; [@ocaml.doc "The current status of the phone number.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
  message_type : message_type;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  number_capabilities : number_capability_list;
      [@ocaml.doc
        "Describes if the origination identity can be used for text messages, voice calls or both.\n"]
  number_type : number_type; [@ocaml.doc "The type of phone number.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The price, in US dollars, to lease the phone number.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients using the TwoWayChannelArn.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to false and an end recipient sends a message that begins with HELP or STOP to \
         one of your dedicated numbers, End User Messaging SMS automatically replies with a \
         customizable message and adds the end recipient to the OptOutList. When set to true \
         you're responsible for responding to HELP and STOP requests. You're also responsible for \
         tracking and honoring opt-out request. For more information see \
         {{:https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-managing.html#settings-account-sms-self-managed-opt-out}Self-managed \
         opt-outs} \n"]
  opt_out_list_name : opt_out_list_name;
      [@ocaml.doc "The name of the OptOutList associated with the phone number.\n"]
  international_sending_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "When set to true the international sending of phone number is Enabled.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "When set to true the phone number can't be deleted.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the pool associated with the phone number.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the phone number was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc
  "The information for a phone number, in E.164 format, in an Amazon Web Services account.\n"]

type nonrec phone_number_information_list = phone_number_information list [@@ocaml.doc ""]

type nonrec describe_phone_numbers_result = {
  phone_numbers : phone_number_information_list option;
      [@ocaml.doc
        "An array of PhoneNumberInformation objects that contain the details for the requested \
         phone numbers.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec phone_number_filter_name =
  | STATUS [@ocaml.doc ""]
  | ISO_COUNTRY_CODE [@ocaml.doc ""]
  | MESSAGE_TYPE [@ocaml.doc ""]
  | NUMBER_CAPABILITY [@ocaml.doc ""]
  | NUMBER_TYPE [@ocaml.doc ""]
  | TWO_WAY_ENABLED [@ocaml.doc ""]
  | SELF_MANAGED_OPT_OUTS_ENABLED [@ocaml.doc ""]
  | OPT_OUT_LIST_NAME [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
  | TWO_WAY_CHANNEL_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec phone_number_filter = {
  name : phone_number_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for a phone number that meets a specified criteria.\n"]

type nonrec phone_number_filter_list = phone_number_filter list [@@ocaml.doc ""]

type nonrec phone_number_id_or_arn = string [@@ocaml.doc ""]

type nonrec phone_number_id_list = phone_number_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_phone_numbers_request = {
  phone_number_ids : phone_number_id_list option;
      [@ocaml.doc
        "The unique identifier of phone numbers to find information about. This is an array of \
         strings that can be either the PhoneNumberId or PhoneNumberArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  filters : phone_number_filter_list option;
      [@ocaml.doc "An array of PhoneNumberFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
  owner : owner option;
      [@ocaml.doc
        "Use [SELF] to filter the list of phone numbers to ones your account owns or use [SHARED] \
         to filter on phone numbers shared with your account. The [Owner] and [PhoneNumberIds] \
         parameters can't be used at the same time.\n"]
}
[@@ocaml.doc ""]

type nonrec pool_information = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the pool.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The unique identifier for the pool.\n"]
  status : pool_status; [@ocaml.doc "The current status of the pool.\n"]
  message_type : message_type;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true you can receive incoming text messages from your end recipients using \
         the TwoWayChannelArn.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to false, an end recipient sends a message that begins with HELP or STOP to one \
         of your dedicated numbers, End User Messaging SMS automatically replies with a \
         customizable message and adds the end recipient to the OptOutList. When set to true \
         you're responsible for responding to HELP and STOP requests. You're also responsible for \
         tracking and honoring opt-out requests. For more information see \
         {{:https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-managing.html#settings-account-sms-self-managed-opt-out}Self-managed \
         opt-outs} \n"]
  opt_out_list_name : opt_out_list_name;
      [@ocaml.doc "The name of the OptOutList associated with the pool.\n"]
  shared_routes_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "Allows you to enable shared routes on your pool.\n\n\
        \ By default, this is set to [False]. If you set this value to [True], your messages are \
         sent using phone numbers or sender IDs (depending on the country) that are shared with \
         other users. In some countries, such as the United States, senders aren't allowed to use \
         shared routes and must use a dedicated phone number or short code.\n\
        \ "]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "When set to true the pool can't be deleted.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the pool was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
}
[@@ocaml.doc "The information for a pool in an Amazon Web Services account.\n"]

type nonrec pool_information_list = pool_information list [@@ocaml.doc ""]

type nonrec describe_pools_result = {
  pools : pool_information_list option;
      [@ocaml.doc
        "An array of PoolInformation objects that contain the details for the requested pools. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec pool_filter_name =
  | STATUS [@ocaml.doc ""]
  | MESSAGE_TYPE [@ocaml.doc ""]
  | TWO_WAY_ENABLED [@ocaml.doc ""]
  | SELF_MANAGED_OPT_OUTS_ENABLED [@ocaml.doc ""]
  | OPT_OUT_LIST_NAME [@ocaml.doc ""]
  | SHARED_ROUTES_ENABLED [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
  | TWO_WAY_CHANNEL_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pool_filter = {
  name : pool_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for a pool that meets a specified criteria.\n"]

type nonrec pool_filter_list = pool_filter list [@@ocaml.doc ""]

type nonrec pool_id_list = pool_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_pools_request = {
  pool_ids : pool_id_list option;
      [@ocaml.doc
        "The unique identifier of pools to find. This is an array of strings that can be either \
         the PoolId or PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  filters : pool_filter_list option;
      [@ocaml.doc "An array of PoolFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
  owner : owner option;
      [@ocaml.doc
        "Use [SELF] to filter the list of Pools to ones your account owns or use [SHARED] to \
         filter on Pools shared with your account. The [Owner] and [PoolIds] parameters can't be \
         used at the same time.\n"]
}
[@@ocaml.doc ""]

type nonrec protect_configuration_information = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the protect configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  account_default : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "This is true if the protect configuration is set as your account default protect \
         configuration.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "The status of deletion protection for the protect configuration. When set to true \
         deletion protection is enabled. By default this is set to false. \n"]
}
[@@ocaml.doc "Provides information on the specified protect configuration.\n"]

type nonrec protect_configuration_information_list = protect_configuration_information list
[@@ocaml.doc ""]

type nonrec describe_protect_configurations_result = {
  protect_configurations : protect_configuration_information_list option;
      [@ocaml.doc
        "An array of ProtectConfigurationInformation objects that contain the details for the \
         request. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec protect_configuration_filter_name =
  | ACCOUNT_DEFAULT [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protect_configuration_filter = {
  name : protect_configuration_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter for.\n"]
}
[@@ocaml.doc
  "The filter definition for filtering protect configurations that meet a specified criteria.\n"]

type nonrec protect_configuration_filter_list = protect_configuration_filter list [@@ocaml.doc ""]

type nonrec protect_configuration_id_list = protect_configuration_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_protect_configurations_request = {
  protect_configuration_ids : protect_configuration_id_list option;
      [@ocaml.doc "An array of protect configuration identifiers to search for.\n"]
  filters : protect_configuration_filter_list option;
      [@ocaml.doc "An array of ProtectConfigurationFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rcs_agent_country_launch_status_result = {
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the RCS agent.\n"]
  rcs_agent_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the RCS agent.\n"]
  country_launch_status : country_launch_status_information_list option;
      [@ocaml.doc
        "An array of CountryLaunchStatusInformation objects that contain the per-country launch \
         status details.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rcs_agent_country_launch_status_request = {
  rcs_agent_id : rcs_agent_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the RCS agent. You can use either the RcsAgentId or RcsAgentArn.\n"]
  iso_country_codes : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, to filter the \
         results.\n"]
  filters : country_launch_status_filter_list option;
      [@ocaml.doc "An array of CountryLaunchStatusFilter objects to filter the results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec testing_agent_status =
  | CREATED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec testing_agent_information = {
  status : testing_agent_status; [@ocaml.doc "The current status of the testing agent.\n"]
  testing_agent_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the testing agent.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the registration associated with the testing agent.\n"]
}
[@@ocaml.doc "Contains details about the testing agent associated with an RCS agent.\n"]

type nonrec rcs_agent_information = {
  rcs_agent_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the RCS agent.\n"]
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the RCS agent.\n"]
  status : rcs_agent_status; [@ocaml.doc "The current status of the RCS agent.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the RCS agent was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "When set to true the RCS agent can't be deleted.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList associated with the RCS agent.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true you're responsible for responding to HELP and STOP requests. You're also \
         responsible for tracking and honoring opt-out requests.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true you can receive incoming text messages from your end recipients using \
         the TwoWayChannelArn.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the pool associated with the RCS agent.\n"]
  two_way_media_s3_bucket_name : two_way_media_s3_bucket_name option;
      [@ocaml.doc "The name of the S3 bucket where inbound RCS media files are stored.\n"]
  two_way_media_s3_key_prefix : two_way_media_s3_key_prefix option;
      [@ocaml.doc "The key prefix used for inbound RCS media objects in the S3 bucket.\n"]
  two_way_media_s3_role : iam_role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role used to write inbound RCS media files to the S3 bucket.\n"]
  two_way_rcs_events_enabled : rcs_event_type_list option;
      [@ocaml.doc "The list of RCS event types enabled for two-way messaging on the agent.\n"]
  testing_agent : testing_agent_information option;
      [@ocaml.doc "The testing agent information associated with the RCS agent.\n"]
}
[@@ocaml.doc "The information for an RCS agent in an Amazon Web Services account.\n"]

type nonrec rcs_agent_information_list = rcs_agent_information list [@@ocaml.doc ""]

type nonrec describe_rcs_agents_result = {
  rcs_agents : rcs_agent_information_list option;
      [@ocaml.doc
        "An array of RcsAgentInformation objects that contain the details for the requested RCS \
         agents.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec rcs_agent_filter_name =
  | STATUS [@ocaml.doc ""]
  | TWO_WAY_ENABLED [@ocaml.doc ""]
  | SELF_MANAGED_OPT_OUTS_ENABLED [@ocaml.doc ""]
  | OPT_OUT_LIST_NAME [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
  | TWO_WAY_CHANNEL_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rcs_agent_filter = {
  name : rcs_agent_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc "The information for an RCS agent that meets a specified criteria.\n"]

type nonrec rcs_agent_filter_list = rcs_agent_filter list [@@ocaml.doc ""]

type nonrec rcs_agent_id_list = rcs_agent_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_rcs_agents_request = {
  rcs_agent_ids : rcs_agent_id_list option;
      [@ocaml.doc
        "An array of unique identifiers for the RCS agents. This is an array of strings that can \
         be either the RcsAgentId or RcsAgentArn.\n"]
  owner : owner option;
      [@ocaml.doc
        "Use [SELF] to filter the list of RCS agents to ones your account owns or use [SHARED] to \
         filter on RCS agents shared with your account. The [Owner] and [RcsAgentIds] parameters \
         can't be used at the same time.\n"]
  filters : rcs_agent_filter_list option;
      [@ocaml.doc "An array of RcsAgentFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_attachments_information = {
  registration_attachment_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration attachment.\n"]
  registration_attachment_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
  attachment_status : attachment_status;
      [@ocaml.doc
        "The status of the registration attachment. \n\n\
        \ {ul\n\
        \       {-   [UPLOAD_IN_PROGRESS] The attachment is being uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [UPLOAD_COMPLETE] The attachment has been uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [UPLOAD_FAILED] The attachment failed to uploaded.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] The attachment has been deleted..\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  attachment_upload_error_reason : attachment_upload_error_reason option;
      [@ocaml.doc "A description of why the upload didn't successfully complete.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration attachment was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  attachment_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL to the document that's associated with the registration attachment.\n"]
}
[@@ocaml.doc "Provides information on the specified registration attachments.\n"]

type nonrec registration_attachments_information_list = registration_attachments_information list
[@@ocaml.doc ""]

type nonrec describe_registration_attachments_result = {
  registration_attachments : registration_attachments_information_list;
      [@ocaml.doc
        "An array of {b RegistrationAttachments} objects that contain the details for the \
         requested registration attachments. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_attachment_filter_name = ATTACHMENT_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_attachment_filter = {
  name : registration_attachment_filter_name;
      [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter on.\n"]
}
[@@ocaml.doc
  "The filter definition for filtering registration attachments that meets a specified criteria.\n"]

type nonrec registration_attachment_filter_list = registration_attachment_filter list
[@@ocaml.doc ""]

type nonrec registration_attachment_id_list = registration_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_registration_attachments_request = {
  registration_attachment_ids : registration_attachment_id_list option;
      [@ocaml.doc
        "The unique identifier of registration attachments to find. This is an array of {b \
         RegistrationAttachmentId}.\n"]
  filters : registration_attachment_filter_list option;
      [@ocaml.doc "An array of RegistrationAttachmentFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec select_option_description = {
  option_ : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The value of the option.\n"]
  title : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The title of the select option.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of the option meaning.\n"]
}
[@@ocaml.doc "A description of each select option.\n"]

type nonrec select_option_descriptions_list = select_option_description list [@@ocaml.doc ""]

type nonrec registration_field_display_hints = {
  title : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The title of the display hint.\n"]
  short_description : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A short description of the display hint.\n"]
  long_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A full description of the display hint.\n"]
  documentation_title : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The title of the document the display hint is associated with.\n"]
  documentation_link : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The link to the document the display hint is associated with.\n"]
  select_option_descriptions : select_option_descriptions_list option;
      [@ocaml.doc "An array of SelectOptionDescription objects.\n"]
  text_validation_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The validation rules for the text field.\n"]
  example_text_value : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Example text of what the value of a field should contain.\n"]
}
[@@ocaml.doc "Provides help information on the registration field.\n"]

type nonrec text_validation = {
  min_length : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The minimum number of characters for the text field.\n"]
  max_length : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The maximum number of characters for the text field.\n"]
  pattern : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The regular expression used to validate the text field.\n"]
}
[@@ocaml.doc "Validation rules for a text field.\n"]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec select_validation = {
  min_choices : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The minimum number of choices for the select.\n"]
  max_choices : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The maximum number of choices for the select.\n"]
  options : string_list; [@ocaml.doc "An array of strings for the possible selection options. \n"]
}
[@@ocaml.doc "Validation rules for a select field.\n"]

type nonrec field_requirement =
  | REQUIRED [@ocaml.doc ""]
  | CONDITIONAL [@ocaml.doc ""]
  | OPTIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_type =
  | SELECT [@ocaml.doc ""]
  | TEXT [@ocaml.doc ""]
  | ATTACHMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec section_path = string [@@ocaml.doc ""]

type nonrec registration_field_definition = {
  section_path : section_path; [@ocaml.doc "The section path of the field.\n"]
  field_path : field_path;
      [@ocaml.doc
        "The path to the registration form field. You can use \
         [DescribeRegistrationFieldDefinitions] for a list of {b FieldPaths}.\n"]
  field_type : field_type; [@ocaml.doc "The type of field.\n"]
  field_requirement : field_requirement;
      [@ocaml.doc
        "Specifies if the field for the registration form is required, conditional or optional.\n"]
  select_validation : select_validation option;
      [@ocaml.doc "The validation rules for a select field.\n"]
  text_validation : text_validation option; [@ocaml.doc "The validation rules for a text field.\n"]
  display_hints : registration_field_display_hints;
      [@ocaml.doc "An array of RegistrationFieldDisplayHints objects for the field.\n"]
}
[@@ocaml.doc "Provides a description of the specified field.\n"]

type nonrec registration_field_definition_list = registration_field_definition list [@@ocaml.doc ""]

type nonrec describe_registration_field_definitions_result = {
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  registration_field_definitions : registration_field_definition_list;
      [@ocaml.doc
        "An array of RegistrationFieldDefinitions objects that contain the details for the \
         requested fields. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec field_path_list = field_path list [@@ocaml.doc ""]

type nonrec describe_registration_field_definitions_request = {
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  section_path : section_path option; [@ocaml.doc "The path to the section of the registration.\n"]
  field_paths : field_path_list option;
      [@ocaml.doc "An array of paths to the registration form field.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_field_value_information = {
  field_path : field_path;
      [@ocaml.doc
        "The path to the registration form field. You can use \
         [DescribeRegistrationFieldDefinitions] for a list of {b FieldPaths}.\n"]
  select_choices : select_choice_list option;
      [@ocaml.doc "An array of values for the form field.\n"]
  text_value : text_value option; [@ocaml.doc "The text data for a free form field.\n"]
  registration_attachment_id : registration_attachment_id_or_arn option;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
  denied_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A description of why the registration was denied.\n"]
  feedback : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Generative AI feedback information provided for this specific field during the \
         registration review process. This may include validation errors, suggestions for \
         improvement, or additional requirements.\n"]
}
[@@ocaml.doc "Provides the values of the specified field.\n"]

type nonrec registration_field_value_information_list = registration_field_value_information list
[@@ocaml.doc ""]

type nonrec describe_registration_field_values_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number;
      [@ocaml.doc "The current version of the registration.\n"]
  registration_field_values : registration_field_value_information_list;
      [@ocaml.doc
        "An array of RegistrationFieldValues objects that contain the values for the requested \
         registration. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_registration_field_values_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number option;
      [@ocaml.doc "The version number of the registration.\n"]
  section_path : section_path option; [@ocaml.doc "The path to the section of the registration.\n"]
  field_paths : field_path_list option;
      [@ocaml.doc "An array of paths to the registration form field.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_section_display_hints = {
  title : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The title of the display hint.\n"]
  short_description : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A short description of the display hint.\n"]
  long_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A full description of the display hint.\n"]
  documentation_title : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The title of the document the display hint is associated with.\n"]
  documentation_link : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The link to the document the display hint is associated with.\n"]
}
[@@ocaml.doc "Provides help information on the registration section.\n"]

type nonrec registration_section_definition = {
  section_path : section_path; [@ocaml.doc "The path to the section of the registration.\n"]
  display_hints : registration_section_display_hints;
      [@ocaml.doc "The path to the section of the registration.\n"]
}
[@@ocaml.doc "Provides information on the specified section definition.\n"]

type nonrec registration_section_definition_list = registration_section_definition list
[@@ocaml.doc ""]

type nonrec describe_registration_section_definitions_result = {
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  registration_section_definitions : registration_section_definition_list;
      [@ocaml.doc "An array of RegistrationSectionDefinition objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec section_path_list = section_path list [@@ocaml.doc ""]

type nonrec describe_registration_section_definitions_request = {
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  section_paths : section_path_list option;
      [@ocaml.doc "An array of paths for the registration form section.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_type_display_hints = {
  title : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The title of the display hint.\n"]
  short_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A short description of the display hint.\n"]
  long_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A full description of the display hint.\n"]
  documentation_title : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The title of the document the display hint is associated with.\n"]
  documentation_link : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The link to the document the display hint is associated with.\n"]
}
[@@ocaml.doc "Provides help information on the registration type.\n"]

type nonrec registration_disassociation_behavior =
  | DISASSOCIATE_ALL_CLOSES_REGISTRATION [@ocaml.doc ""]
  | DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION [@ocaml.doc ""]
  | DELETE_REGISTRATION_DISASSOCIATES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_association_behavior =
  | ASSOCIATE_BEFORE_SUBMIT [@ocaml.doc ""]
  | ASSOCIATE_ON_APPROVAL [@ocaml.doc ""]
  | ASSOCIATE_AFTER_COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec supported_association = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "Defines the behavior of when an origination identity and registration can be associated \
         with each other.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  association_behavior : registration_association_behavior;
      [@ocaml.doc
        "The association behavior.\n\n\
        \ {ul\n\
        \       {-   [ASSOCIATE_BEFORE_SUBMIT] The origination identity has to be supplied when \
         creating a registration.\n\
        \           \n\
        \            }\n\
        \       {-   [ASSOCIATE_ON_APPROVAL] This applies to all sender ID registrations. The \
         sender ID will be automatically provisioned once the registration is approved.\n\
        \           \n\
        \            }\n\
        \       {-   [ASSOCIATE_AFTER_COMPLETE] This applies to phone number registrations when \
         you must complete a registration first, then associate one or more phone numbers later. \
         For example 10DLC campaigns and long codes. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  disassociation_behavior : registration_disassociation_behavior;
      [@ocaml.doc
        "The disassociation behavior.\n\n\
        \ {ul\n\
        \       {-   [DISASSOCIATE_ALL_CLOSES_REGISTRATION] All origination identities must be \
         disassociated from the registration before the registration can be closed.\n\
        \           \n\
        \            }\n\
        \       {-   [DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION] All origination identities must \
         be disassociated from the registration before the registration can be deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_REGISTRATION_DISASSOCIATES] The registration can be deleted and all \
         origination identities will be disasscoiated.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The processing rules for when a registration can be associated with an origination identity and \
   disassociated from an origination identity.\n"]

type nonrec supported_association_list = supported_association list [@@ocaml.doc ""]

type nonrec registration_type_definition = {
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  supported_associations : supported_association_list option;
      [@ocaml.doc "The supported association behavior for the registration type.\n"]
  display_hints : registration_type_display_hints;
      [@ocaml.doc "Provides help information on the registration.\n"]
}
[@@ocaml.doc "Provides information on the supported registration type.\n"]

type nonrec registration_type_definition_list = registration_type_definition list [@@ocaml.doc ""]

type nonrec describe_registration_type_definitions_result = {
  registration_type_definitions : registration_type_definition_list;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_type_filter_name =
  | SUPPORTED_ASSOCIATION_RESOURCE_TYPE [@ocaml.doc ""]
  | SUPPORTED_ASSOCIATION_ISO_COUNTRY_CODE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_type_filter = {
  name : registration_type_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter on.\n"]
}
[@@ocaml.doc
  "The filter definition for filtering registration types that meets a specified criteria.\n"]

type nonrec registration_type_filter_list = registration_type_filter list [@@ocaml.doc ""]

type nonrec registration_type_list = registration_type list [@@ocaml.doc ""]

type nonrec describe_registration_type_definitions_request = {
  registration_types : registration_type_list option;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  filters : registration_type_filter_list option;
      [@ocaml.doc "An array of RegistrationFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_denied_reason_information = {
  reason : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The reason a registration was rejected.\n"]
  short_description : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A short description of the rejection reason.\n"]
  long_description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A long description of the rejection reason.\n"]
  documentation_title : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The title of the document.\n"]
  documentation_link : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The link to the document.\n"]
}
[@@ocaml.doc "Provides the reason a registration was rejected.\n"]

type nonrec registration_denied_reason_information_list =
  registration_denied_reason_information list
[@@ocaml.doc ""]

type nonrec registration_version_information = {
  version_number : registration_version_number;
      [@ocaml.doc "The version number of the registration.\n"]
  registration_version_status : registration_version_status;
      [@ocaml.doc
        "The status of the registration.\n\n\
        \ {ul\n\
        \       {-   [APPROVED]: Your registration has been approved.\n\
        \           \n\
        \            }\n\
        \       {-   [ARCHIVED]: Your previously approved registration version moves into this \
         status when a more recently submitted version is approved.\n\
        \           \n\
        \            }\n\
        \       {-   [DENIED]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [DISCARDED]: You've abandon this version of their registration to start over \
         with a new version. \n\
        \           \n\
        \            }\n\
        \       {-   [DRAFT]: The initial status of a registration version after it\226\128\153s \
         created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [REVOKED]: Your previously approved registration has been revoked.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  registration_version_status_history : registration_version_status_history;
      [@ocaml.doc
        "The {b RegistrationVersionStatusHistory} object contains the time stamps for when the \
         reservations status changes.\n"]
  denied_reasons : registration_denied_reason_information_list option;
      [@ocaml.doc "An array of RegistrationDeniedReasonInformation objects. \n"]
  feedback : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Generative AI feedback information provided during the registration review process. This \
         includes comments, suggestions, or additional requirements.\n"]
}
[@@ocaml.doc "Provides information about the specified version of the registration.\n"]

type nonrec registration_version_information_list = registration_version_information list
[@@ocaml.doc ""]

type nonrec describe_registration_versions_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  registration_versions : registration_version_information_list;
      [@ocaml.doc "An array of RegistrationVersions objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_version_filter_name = REGISTRATION_VERSION_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_version_filter = {
  name : registration_version_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter on.\n"]
}
[@@ocaml.doc
  "The filter definition for filtering registration versions that meets a specified criteria.\n"]

type nonrec registration_version_filter_list = registration_version_filter list [@@ocaml.doc ""]

type nonrec registration_version_number_list = registration_version_number list [@@ocaml.doc ""]

type nonrec describe_registration_versions_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_numbers : registration_version_number_list option;
      [@ocaml.doc "An array of registration version numbers.\n"]
  filters : registration_version_filter_list option;
      [@ocaml.doc "An array of RegistrationVersionFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_information = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  registration_status : registration_status;
      [@ocaml.doc
        "The status of the registration.\n\n\
        \ {ul\n\
        \       {-   [CLOSED]: The phone number or sender ID has been deleted and you must also \
         delete the registration for the number.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATED]: Your registration is created but not submitted.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE]: Your registration has been approved and your origination identity \
         has been created.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED]: The registration has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [PROVISIONING]: Your registration has been approved and your origination \
         identity is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_UPDATES]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted and is awaiting review.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  current_version_number : registration_version_number;
      [@ocaml.doc "The current version number of the registration.\n"]
  approved_version_number : registration_version_number option;
      [@ocaml.doc "The version number of the registration that was approved.\n"]
  latest_denied_version_number : registration_version_number option;
      [@ocaml.doc "The latest version number of the registration that was denied.\n"]
  additional_attributes : string_map option;
      [@ocaml.doc
        "Metadata about a given registration which is specific to that registration type.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the registration was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc "Provides information about the requested registration.\n"]

type nonrec registration_information_list = registration_information list [@@ocaml.doc ""]

type nonrec describe_registrations_result = {
  registrations : registration_information_list;
      [@ocaml.doc "An array of RegistrationInformation objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_filter_name =
  | REGISTRATION_TYPE [@ocaml.doc ""]
  | REGISTRATION_STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_filter = {
  name : registration_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter on.\n"]
}
[@@ocaml.doc "The filter definition for filtering registrations that meets a specified criteria.\n"]

type nonrec registration_filter_list = registration_filter list [@@ocaml.doc ""]

type nonrec registration_id_list = registration_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_registrations_request = {
  registration_ids : registration_id_list option;
      [@ocaml.doc "An array of unique identifiers for each registration.\n"]
  filters : registration_filter_list option;
      [@ocaml.doc "An array of RegistrationFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec message_type_list = message_type list [@@ocaml.doc ""]

type nonrec sender_id_information = {
  sender_id_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with the SenderId.\n"]
  sender_id : sender_id;
      [@ocaml.doc "The alphanumeric sender ID in a specific country that you'd like to describe.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
  message_types : message_type_list;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The monthly leasing price, in US dollars.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true the sender ID can't be deleted.\n"]
  registered : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "True if the sender ID is registered.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
}
[@@ocaml.doc "The information for all SenderIds in an Amazon Web Services account.\n"]

type nonrec sender_id_information_list = sender_id_information list [@@ocaml.doc ""]

type nonrec describe_sender_ids_result = {
  sender_ids : sender_id_information_list option;
      [@ocaml.doc
        "An array of SernderIdInformation objects that contain the details for the requested \
         SenderIds.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec sender_id_filter_name =
  | SENDER_ID [@ocaml.doc ""]
  | ISO_COUNTRY_CODE [@ocaml.doc ""]
  | MESSAGE_TYPE [@ocaml.doc ""]
  | DELETION_PROTECTION_ENABLED [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sender_id_filter = {
  name : sender_id_filter_name; [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter for.\n"]
}
[@@ocaml.doc "The information for a sender ID that meets a specified criteria.\n"]

type nonrec sender_id_filter_list = sender_id_filter list [@@ocaml.doc ""]

type nonrec sender_id_or_arn = string [@@ocaml.doc ""]

type nonrec sender_id_and_country = {
  sender_id : sender_id_or_arn; [@ocaml.doc "The unique identifier of the sender.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
}
[@@ocaml.doc
  " The alphanumeric sender ID in a specific country that you want to describe. For more \
   information on sender IDs see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/sender-id-request.html}Requesting \
   sender IDs } in the {i End User Messaging SMS User Guide}.\n"]

type nonrec sender_id_list = sender_id_and_country list [@@ocaml.doc ""]

type nonrec describe_sender_ids_request = {
  sender_ids : sender_id_list option;
      [@ocaml.doc
        "An array of SenderIdAndCountry objects to search for.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  filters : sender_id_filter_list option;
      [@ocaml.doc "An array of SenderIdFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
  owner : owner option;
      [@ocaml.doc
        "Use [SELF] to filter the list of Sender Ids to ones your account owns or use [SHARED] to \
         filter on Sender Ids shared with your account. The [Owner] and [SenderIds] parameters \
         can't be used at the same time. \n"]
}
[@@ocaml.doc ""]

type nonrec spend_limit_name =
  | TEXT_MESSAGE_MONTHLY_SPEND_LIMIT [@ocaml.doc ""]
  | VOICE_MESSAGE_MONTHLY_SPEND_LIMIT [@ocaml.doc ""]
  | MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT [@ocaml.doc ""]
  | NOTIFY_MESSAGE_MONTHLY_SPEND_LIMIT [@ocaml.doc ""]
  | RCS_MESSAGE_MONTHLY_SPEND_LIMIT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec spend_limit = {
  name : spend_limit_name; [@ocaml.doc "The name for the SpendLimit.\n"]
  enforced_limit : Smaws_Lib.Smithy_api.Types.primitive_long;
      [@ocaml.doc
        "The maximum amount of money, in US dollars, that you want to be able to spend sending \
         messages each month. This value has to be less than or equal to the amount in [MaxLimit]. \
         To use this custom limit, [Overridden] must be set to true.\n"]
  max_limit : Smaws_Lib.Smithy_api.Types.primitive_long;
      [@ocaml.doc
        " The maximum amount of money that you are able to spend to send messages each month, in \
         US dollars.\n"]
  overridden : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to [True], the value that has been specified in the [EnforcedLimit] is used to \
         determine the maximum amount in US dollars that can be spent to send messages each month, \
         in US dollars.\n"]
}
[@@ocaml.doc
  "Describes the current monthly spend limits for sending voice and text messages. For more \
   information on increasing your monthly spend limit, see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/awssupport-spend-threshold.html} \
   Requesting a spending quota increase } in the {i End User Messaging SMS User Guide}. \n"]

type nonrec spend_limit_list = spend_limit list [@@ocaml.doc ""]

type nonrec describe_spend_limits_result = {
  spend_limits : spend_limit_list option;
      [@ocaml.doc
        "An array of SpendLimit objects that contain the details for the requested spend limits.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_spend_limits_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec verified_destination_number_information = {
  verified_destination_number_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the verified destination phone number.\n"]
  verified_destination_number_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the verified destination phone number.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The verified destination phone number, in E.164 format.\n"]
  status : verification_status;
      [@ocaml.doc
        "The status of the verified destination phone number.\n\n\
        \ {ul\n\
        \       {-   [PENDING]: The phone number hasn't been verified yet.\n\
        \           \n\
        \            }\n\
        \       {-   [VERIFIED]: The phone number is verified and can receive messages.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the RCS agent associated with the verified destination number.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the destination phone number was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc "Provides information about the requested verified destintion phone number.\n"]

type nonrec verified_destination_number_information_list =
  verified_destination_number_information list
[@@ocaml.doc ""]

type nonrec describe_verified_destination_numbers_result = {
  verified_destination_numbers : verified_destination_number_information_list;
      [@ocaml.doc "An array of VerifiedDestinationNumberInformation objects\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec verified_destination_number_filter_name =
  | STATUS [@ocaml.doc ""]
  | RCS_AGENT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec verified_destination_number_filter = {
  name : verified_destination_number_filter_name;
      [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter on.\n"]
}
[@@ocaml.doc
  "The filter definition for filtering verified destination phone numbers that meets a specified \
   criteria.\n"]

type nonrec verified_destination_number_filter_list = verified_destination_number_filter list
[@@ocaml.doc ""]

type nonrec destination_phone_number_list = phone_number list [@@ocaml.doc ""]

type nonrec verified_destination_number_id_list = verified_destination_number_id_or_arn list
[@@ocaml.doc ""]

type nonrec describe_verified_destination_numbers_request = {
  verified_destination_number_ids : verified_destination_number_id_list option;
      [@ocaml.doc "An array of VerifiedDestinationNumberid to retrieve.\n"]
  destination_phone_numbers : destination_phone_number_list option;
      [@ocaml.doc "An array of verified destination phone number, in E.164 format.\n"]
  filters : verified_destination_number_filter_list option;
      [@ocaml.doc "An array of VerifiedDestinationNumberFilter objects to filter the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec destination_country_parameter_key =
  | IN_TEMPLATE_ID [@ocaml.doc ""]
  | IN_ENTITY_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec destination_country_parameter_value = string [@@ocaml.doc ""]

type nonrec destination_country_parameters =
  (destination_country_parameter_key * destination_country_parameter_value) list
[@@ocaml.doc ""]

type nonrec disassociate_origination_identity_result = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the pool.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PoolId of the pool no longer associated with the origination identity.\n"]
  origination_identity_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberArn or SenderIdArn of the origination identity.\n"]
  origination_identity : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberId or SenderId of the origination identity.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_origination_identity_request = {
  pool_id : pool_id_or_arn;
      [@ocaml.doc
        "The unique identifier for the pool to disassociate with the origination identity. This \
         value can be either the PoolId or PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  origination_identity : phone_or_sender_id_or_arn;
      [@ocaml.doc
        "The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or \
         SenderIdArn. You can use [DescribePhoneNumbers] find the values for PhoneNumberId and \
         PhoneNumberArn, or use [DescribeSenderIds] to get the values for SenderId and \
         SenderIdArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. This \
         field is optional and is not required for origination identity types that are not \
         country-specific, such as RCS agents.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier you provide to ensure the idempotency of the request. \
         If you don't specify a client token, a randomly generated token is used for the request \
         to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_protect_configuration_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configuration set.\n"]
  configuration_set_name : configuration_set_name;
      [@ocaml.doc "The name of the ConfigurationSet.\n"]
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_protect_configuration_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc "The name of the ConfigurationSet.\n"]
}
[@@ocaml.doc ""]

type nonrec discard_registration_version_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number;
      [@ocaml.doc "The version number of the registration.\n"]
  registration_version_status : registration_version_status;
      [@ocaml.doc
        "The status of the registration version.\n\n\
        \ {ul\n\
        \       {-   [APPROVED]: Your registration has been approved.\n\
        \           \n\
        \            }\n\
        \       {-   [ARCHIVED]: Your previously approved registration version moves into this \
         status when a more recently submitted version is approved.\n\
        \           \n\
        \            }\n\
        \       {-   [DENIED]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [DISCARDED]: You've abandon this version of their registration to start over \
         with a new version. \n\
        \           \n\
        \            }\n\
        \       {-   [DRAFT]: The initial status of a registration version after it\226\128\153s \
         created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [REVOKED]: Your previously approved registration has been revoked.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  registration_version_status_history : registration_version_status_history;
      [@ocaml.doc
        "The {b RegistrationVersionStatusHistory} object contains the time stamps for when the \
         reservations status changes.\n"]
}
[@@ocaml.doc ""]

type nonrec discard_registration_version_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
}
[@@ocaml.doc ""]

type nonrec protect_status =
  | ALLOW [@ocaml.doc ""]
  | BLOCK [@ocaml.doc ""]
  | MONITOR [@ocaml.doc ""]
  | FILTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protect_configuration_country_rule_set_information = {
  protect_status : protect_status; [@ocaml.doc "The types of protection that can be used.\n"]
}
[@@ocaml.doc "The types of statuses that can be used.\n"]

type nonrec protect_configuration_country_rule_set =
  (iso_country_code * protect_configuration_country_rule_set_information) list
[@@ocaml.doc ""]

type nonrec get_protect_configuration_country_rule_set_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  number_capability : number_capability;
      [@ocaml.doc
        "The capability type associated with the returned \
         ProtectConfigurationCountryRuleSetInformation objects.\n"]
  country_rule_set : protect_configuration_country_rule_set;
      [@ocaml.doc
        "A map of ProtectConfigurationCountryRuleSetInformation objects that contain the details \
         for the requested NumberCapability. The Key is the two-letter ISO country code. For a \
         list of supported ISO country codes, see \
         {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-sms-by-country.html}Supported \
         countries and regions (SMS channel)} in the End User Messaging SMS User Guide.\n"]
}
[@@ocaml.doc ""]

type nonrec get_protect_configuration_country_rule_set_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  number_capability : number_capability;
      [@ocaml.doc
        "The capability type to return the CountryRuleSet for. Valid values are [SMS], [VOICE], or \
         [MMS].\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_result = {
  resource_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the End User Messaging SMS resource attached to the \
         resource-based policy.\n"]
  policy : resource_policy option;
      [@ocaml.doc
        "The JSON formatted string that contains the resource-based policy attached to the End \
         User Messaging SMS resource. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the resource-based policy was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the End User Messaging SMS resource attached to the \
         resource-based policy.\n"]
}
[@@ocaml.doc ""]

type nonrec iam_role_arn_or_unset = string [@@ocaml.doc ""]

type nonrec language_code =
  | DE_DE [@ocaml.doc ""]
  | EN_GB [@ocaml.doc ""]
  | EN_US [@ocaml.doc ""]
  | ES_419 [@ocaml.doc ""]
  | ES_ES [@ocaml.doc ""]
  | FR_CA [@ocaml.doc ""]
  | FR_FR [@ocaml.doc ""]
  | IT_IT [@ocaml.doc ""]
  | JA_JP [@ocaml.doc ""]
  | KO_KR [@ocaml.doc ""]
  | PT_BR [@ocaml.doc ""]
  | ZH_CN [@ocaml.doc ""]
  | ZH_TW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_tier_list = notify_configuration_tier list [@@ocaml.doc ""]

type nonrec notify_use_case_list = notify_configuration_use_case list [@@ocaml.doc ""]

type nonrec notify_country_information = {
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  country_name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the country.\n"]
  supported_channels : notify_enabled_channels_list;
      [@ocaml.doc
        "An array of supported channels for the country. Supported values include [SMS] and [VOICE].\n"]
  supported_use_cases : notify_use_case_list;
      [@ocaml.doc "An array of supported use cases for the country.\n"]
  supported_tiers : notify_tier_list; [@ocaml.doc "An array of supported tiers for the country.\n"]
  customer_owned_identity_required : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "Whether a customer-owned identity is required to send notify messages to this country.\n"]
}
[@@ocaml.doc "The information for a country that supports notify messaging.\n"]

type nonrec notify_country_information_list = notify_country_information list [@@ocaml.doc ""]

type nonrec list_notify_countries_result = {
  notify_countries : notify_country_information_list option;
      [@ocaml.doc "An array of NotifyCountryInformation objects that contain the results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_notify_countries_request = {
  channels : notify_enabled_channels_list option;
      [@ocaml.doc "An array of channels to filter the results by.\n"]
  use_cases : notify_use_case_list option;
      [@ocaml.doc "An array of use cases to filter the results by.\n"]
  tier : notify_configuration_tier option; [@ocaml.doc "The tier to filter the results by.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec origination_identity_metadata = {
  origination_identity_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with the origination identity.\n"]
  origination_identity : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the origination identity.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. This \
         field is optional and may not be present for origination identity types that are not \
         country-specific, such as RCS agents.\n"]
  number_capabilities : number_capability_list;
      [@ocaml.doc
        "Describes if the origination identity can be used for text messages, voice calls or both.\n"]
  phone_number : phone_number option; [@ocaml.doc "The phone number in E.164 format.\n"]
}
[@@ocaml.doc "The metadata for an origination identity associated with a pool.\n"]

type nonrec origination_identity_metadata_list = origination_identity_metadata list [@@ocaml.doc ""]

type nonrec list_pool_origination_identities_result = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the pool.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique PoolId of the pool.\n"]
  origination_identities : origination_identity_metadata_list option;
      [@ocaml.doc "An array of any OriginationIdentityMetadata objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. If this field is empty then \
         there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec pool_origination_identities_filter_name =
  | ISO_COUNTRY_CODE [@ocaml.doc ""]
  | NUMBER_CAPABILITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pool_origination_identities_filter = {
  name : pool_origination_identities_filter_name;
      [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc
  "Information about origination identities associated with a pool that meets a specified criteria.\n"]

type nonrec pool_origination_identities_filter_list = pool_origination_identities_filter list
[@@ocaml.doc ""]

type nonrec list_pool_origination_identities_request = {
  pool_id : pool_id_or_arn;
      [@ocaml.doc
        "The unique identifier for the pool. This value can be either the PoolId or PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  filters : pool_origination_identities_filter_list option;
      [@ocaml.doc "An array of PoolOriginationIdentitiesFilter objects to filter the results..\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec protect_configuration_rule_set_number_override_filter_name =
  | ISO_COUNTRY_CODE [@ocaml.doc ""]
  | DESTINATION_PHONE_NUMBER_BEGINS_WITH [@ocaml.doc ""]
  | ACTION [@ocaml.doc ""]
  | EXPIRES_BEFORE [@ocaml.doc ""]
  | EXPIRES_AFTER [@ocaml.doc ""]
  | CREATED_BEFORE [@ocaml.doc ""]
  | CREATED_AFTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protect_configuration_rule_set_number_override_filter_item = {
  name : protect_configuration_rule_set_number_override_filter_name;
      [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array values to filter for.\n"]
}
[@@ocaml.doc
  "The information for a protect configuration rule set number override that meets a specified \
   criteria.\n"]

type nonrec list_protect_configuration_rule_set_number_override_filter =
  protect_configuration_rule_set_number_override_filter_item list
[@@ocaml.doc ""]

type nonrec protect_configuration_rule_set_number_override = {
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the rule was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  action : protect_configuration_rule_override_action;
      [@ocaml.doc
        "The action for the rule to perform of either blocking or allowing messages to the \
         destination phone number.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  expiration_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time the rule will expire at. If [ExpirationTimestamp] is not set then the rule will \
         not expire.\n"]
}
[@@ocaml.doc "Provides details on phone number rule overrides for a protect configuration.\n"]

type nonrec protect_configuration_rule_set_number_override_list =
  protect_configuration_rule_set_number_override list
[@@ocaml.doc ""]

type nonrec list_protect_configuration_rule_set_number_overrides_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  rule_set_number_overrides : protect_configuration_rule_set_number_override_list option;
      [@ocaml.doc "An array of RuleSetNumberOverrides objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_protect_configuration_rule_set_number_overrides_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  filters : list_protect_configuration_rule_set_number_override_filter option;
      [@ocaml.doc
        "An array of ProtectConfigurationRuleSetNumberOverrideFilterItem objects to filter the \
         results.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_association_metadata = {
  resource_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the origination identity that is associated with the \
         registration. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The unique identifier for the origination identity. For example this could be a {b \
         PhoneNumberId} or {b SenderId}.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The origination identity type.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  phone_number : phone_number option;
      [@ocaml.doc "The phone number associated with the registration in E.164 format.\n"]
}
[@@ocaml.doc "Metadata for the origination identity that is associated with the registration.\n"]

type nonrec registration_association_metadata_list = registration_association_metadata list
[@@ocaml.doc ""]

type nonrec list_registration_associations_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  registration_type : registration_type;
      [@ocaml.doc
        "The type of registration form. The list of {b RegistrationTypes} can be found using the \
         [DescribeRegistrationTypeDefinitions] action.\n"]
  registration_associations : registration_association_metadata_list;
      [@ocaml.doc "An array of RegistrationAssociationMetadata objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
}
[@@ocaml.doc ""]

type nonrec registration_association_filter_name =
  | RESOURCE_TYPE [@ocaml.doc ""]
  | ISO_COUNTRY_CODE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_association_filter = {
  name : registration_association_filter_name;
      [@ocaml.doc "The name of the attribute to filter on.\n"]
  values : filter_value_list; [@ocaml.doc "An array of values to filter for.\n"]
}
[@@ocaml.doc "The filter definition for filtering registrations that meets a specified criteria.\n"]

type nonrec registration_association_filter_list = registration_association_filter list
[@@ocaml.doc ""]

type nonrec list_registration_associations_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  filters : registration_association_filter_list option;
      [@ocaml.doc
        "An array of RegistrationAssociationFilter to apply to the results that are returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to be used for the next set of paginated results. You don't need to supply a \
         value for this field in the initial request.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return per each request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_result = {
  resource_arn : amazon_resource_name option; [@ocaml.doc "The ARN of the resource.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of key and value pair tags that are associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to query for.\n"]
}
[@@ocaml.doc ""]

type nonrec max_price = string [@@ocaml.doc ""]

type nonrec media_message_origination_identity = string [@@ocaml.doc ""]

type nonrec media_url_value = string [@@ocaml.doc ""]

type nonrec media_url_list = media_url_value list [@@ocaml.doc ""]

type nonrec message_feedback_status = RECEIVED [@ocaml.doc ""] | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec message_id = string [@@ocaml.doc ""]

type nonrec non_empty_tag_list = tag list [@@ocaml.doc ""]

type nonrec notify_pool_id_or_unset = string [@@ocaml.doc ""]

type nonrec verify_destination_number_result = {
  verified_destination_number_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the verified destination phone number.\n"]
  verified_destination_number_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the verified destination phone number.\n"]
  destination_phone_number : phone_number; [@ocaml.doc "The phone number in E.164 format.\n"]
  status : verification_status;
      [@ocaml.doc "The status for being able to send messages to the phone number.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the destination phone number was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec verification_code = string [@@ocaml.doc ""]

type nonrec verify_destination_number_request = {
  verified_destination_number_id : verified_destination_number_id_or_arn;
      [@ocaml.doc "The unique identifier for the verififed destination phone number.\n"]
  verification_code : verification_code;
      [@ocaml.doc
        "The verification code that was received by the verified destination phone number.\n"]
}
[@@ocaml.doc ""]

type nonrec update_sender_id_result = {
  sender_id_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with the SenderId.\n"]
  sender_id : sender_id; [@ocaml.doc "The sender ID that was updated.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  message_types : message_type_list;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The monthly price, in US dollars, to lease the sender ID.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true the sender ID can't be deleted.\n"]
  registered : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "True if the sender ID is registered..\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
}
[@@ocaml.doc ""]

type nonrec update_sender_id_request = {
  sender_id : sender_id_or_arn; [@ocaml.doc "The sender ID to update.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the sender ID can't be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec update_rcs_agent_result = {
  rcs_agent_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated RCS agent.\n"]
  rcs_agent_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the RCS agent.\n"]
  status : rcs_agent_status; [@ocaml.doc "The current status of the RCS agent.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the RCS agent was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList associated with the RCS agent.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you're responsible for responding to \
         HELP and STOP requests. You're also responsible for tracking and honoring opt-out \
         requests.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_media_s3_bucket_name : two_way_media_s3_bucket_name option;
      [@ocaml.doc "The name of the S3 bucket where inbound RCS media files are stored.\n"]
  two_way_media_s3_key_prefix : two_way_media_s3_key_prefix option;
      [@ocaml.doc "The key prefix used for inbound RCS media objects in the S3 bucket.\n"]
  two_way_media_s3_role : iam_role_arn option;
      [@ocaml.doc
        "The ARN of the IAM role used to write inbound RCS media files to the S3 bucket.\n"]
  two_way_rcs_events_enabled : rcs_event_type_list option;
      [@ocaml.doc "The list of RCS event types enabled for two-way messaging on the agent.\n"]
}
[@@ocaml.doc ""]

type nonrec two_way_media_s3_bucket_name_or_unset = string [@@ocaml.doc ""]

type nonrec update_rcs_agent_request = {
  rcs_agent_id : rcs_agent_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the RCS agent to update. You can use either the RcsAgentId or \
         RcsAgentArn.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the RCS agent can't be deleted.\n"]
  opt_out_list_name : opt_out_list_name_or_arn option;
      [@ocaml.doc
        "The OptOutList to associate with the RCS agent. Valid values are either OptOutListName or \
         OptOutListArn.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true you're responsible for responding to \
         HELP and STOP requests. You're also responsible for tracking and honoring opt-out \
         requests.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_media_s3_bucket_name : two_way_media_s3_bucket_name_or_unset option;
      [@ocaml.doc
        "The name of the S3 bucket where inbound RCS media files are stored. Two-way messaging \
         must be enabled on the agent. To remove the media configuration, pass the sentinel value \
         [UNSET_RCS_MEDIA_CONFIGURATION] for both this field and TwoWayMediaS3Role.\n"]
  two_way_media_s3_key_prefix : two_way_media_s3_key_prefix option;
      [@ocaml.doc "The key prefix used for inbound RCS media objects in the S3 bucket.\n"]
  two_way_media_s3_role : iam_role_arn_or_unset option;
      [@ocaml.doc
        "The ARN of the IAM role used to write inbound RCS media files to the S3 bucket. The role \
         must have [s3:PutObject] permission on the bucket and a trust policy allowing \
         [sms-voice.amazonaws.com] to assume it. To remove the media configuration, pass the \
         sentinel value [UNSET_RCS_MEDIA_CONFIGURATION] for both this field and \
         TwoWayMediaS3BucketName.\n"]
  two_way_rcs_events_enabled : rcs_event_type_list option;
      [@ocaml.doc
        "The list of RCS event types to enable for two-way messaging. Pass an empty list to \
         disable all event types. The special value [ALL] enables all current and future event \
         types and must be the sole element if used.\n"]
}
[@@ocaml.doc ""]

type nonrec update_protect_configuration_country_rule_set_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  number_capability : number_capability; [@ocaml.doc "The number capability that was updated\n"]
  country_rule_set : protect_configuration_country_rule_set;
      [@ocaml.doc
        "An array of ProtectConfigurationCountryRuleSetInformation containing the rules for the \
         NumberCapability.\n"]
}
[@@ocaml.doc ""]

type nonrec update_protect_configuration_country_rule_set_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  number_capability : number_capability;
      [@ocaml.doc "The number capability to apply the CountryRuleSetUpdates updates to.\n"]
  country_rule_set_updates : protect_configuration_country_rule_set;
      [@ocaml.doc
        "A map of ProtectConfigurationCountryRuleSetInformation objects that contain the details \
         for the requested NumberCapability. The Key is the two-letter ISO country code. For a \
         list of supported ISO country codes, see \
         {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-sms-by-country.html}Supported \
         countries and regions (SMS channel)} in the End User Messaging SMS User Guide.\n\n\
        \ For example, to set the United States as allowed and Canada as blocked, the \
         [CountryRuleSetUpdates] would be formatted as: [\"CountryRuleSetUpdates\": { \"US\" : { \
         \"ProtectStatus\": \"ALLOW\" } \"CA\" : { \"ProtectStatus\": \"BLOCK\" } }] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_protect_configuration_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the protect configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  account_default : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "This is true if the protect configuration is set as your account default protect \
         configuration.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "The status of deletion protection for the protect configuration. When set to true \
         deletion protection is enabled. By default this is set to false. \n"]
}
[@@ocaml.doc ""]

type nonrec update_protect_configuration_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
}
[@@ocaml.doc ""]

type nonrec update_pool_result = {
  pool_arn : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The ARN of the pool.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the pool.\n"]
  status : pool_status option; [@ocaml.doc "The current status of the pool update request.\n"]
  message_type : message_type option; [@ocaml.doc "The type of message for the pool to use.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to false and an end recipient sends a message that begins with HELP or STOP to \
         one of your dedicated numbers, End User Messaging SMS automatically replies with a \
         customizable message and adds the end recipient to the OptOutList. When set to true \
         you're responsible for responding to HELP and STOP requests. You're also responsible for \
         tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList associated with the pool.\n"]
  shared_routes_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "Indicates whether shared routes are enabled for the pool.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "When set to true the pool can't be deleted.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the pool was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec update_pool_request = {
  pool_id : pool_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the pool to update. Valid values are either the PoolId or \
         PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to false and an end recipient sends a message \
         that begins with HELP or STOP to one of your dedicated numbers, End User Messaging SMS \
         automatically replies with a customizable message and adds the end recipient to the \
         OptOutList. When set to true you're responsible for responding to HELP and STOP requests. \
         You're also responsible for tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name_or_arn option;
      [@ocaml.doc
        "The OptOutList to associate with the pool. Valid values are either OptOutListName or \
         OptOutListArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  shared_routes_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether shared routes are enabled for the pool.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "When set to true the pool can't be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec update_phone_number_result = {
  phone_number_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated phone number.\n"]
  phone_number_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the phone number.\n"]
  phone_number : phone_number option; [@ocaml.doc "The phone number that was updated.\n"]
  status : number_status option; [@ocaml.doc "The current status of the request.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
  message_type : message_type option;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  number_capabilities : number_capability_list option;
      [@ocaml.doc "Specifies if the number could be used for text messages, voice or both.\n"]
  number_type : number_type option; [@ocaml.doc "The type of number that was requested.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The monthly leasing price of the phone number, in US dollars.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "This is true if self managed opt-out are enabled.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList associated with the phone number.\n"]
  international_sending_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "When set to true the international sending of phone number is Enabled.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "When set to true the phone number can't be deleted.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the phone number was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec update_phone_number_request = {
  phone_number_id : phone_number_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the phone number. Valid values for this field can be either the \
         PhoneNumberId or PhoneNumberArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to false and an end recipient sends a message \
         that begins with HELP or STOP to one of your dedicated numbers, End User Messaging SMS \
         automatically replies with a customizable message and adds the end recipient to the \
         OptOutList. When set to true you're responsible for responding to HELP and STOP requests. \
         You're also responsible for tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name_or_arn option;
      [@ocaml.doc
        "The OptOutList to add the phone number to. You can use either the opt out list name or \
         the opt out list ARN.\n"]
  international_sending_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the international sending of phone \
         number is Enabled. \n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the phone number can't be deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec update_notify_configuration_result = {
  notify_configuration_arn : notify_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the notify configuration.\n"]
  notify_configuration_id : notify_configuration_id;
      [@ocaml.doc "The unique identifier for the notify configuration.\n"]
  display_name : notify_configuration_display_name;
      [@ocaml.doc "The display name associated with the notify configuration.\n"]
  use_case : notify_configuration_use_case;
      [@ocaml.doc "The use case for the notify configuration.\n"]
  default_template_id : notify_template_id option;
      [@ocaml.doc "The default template identifier associated with the notify configuration.\n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the pool associated with the notify configuration.\n"]
  enabled_countries : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, that are \
         enabled for the notify configuration.\n"]
  enabled_channels : notify_enabled_channels_list;
      [@ocaml.doc
        "An array of channels enabled for the notify configuration. Supported values include [SMS] \
         and [VOICE].\n"]
  tier : notify_configuration_tier; [@ocaml.doc "The tier of the notify configuration.\n"]
  tier_upgrade_status : tier_upgrade_status;
      [@ocaml.doc "The tier upgrade status of the notify configuration.\n"]
  status : notify_configuration_status;
      [@ocaml.doc "The current status of the notify configuration.\n"]
  rejection_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason the notify configuration was rejected, if applicable.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "When set to true deletion protection is enabled. By default this is set to false. \n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the notify configuration was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec update_notify_configuration_request = {
  notify_configuration_id : notify_configuration_id_or_arn;
      [@ocaml.doc
        "The identifier of the notify configuration to update. The NotifyConfigurationId can be \
         found using the [DescribeNotifyConfigurations] operation.\n"]
  default_template_id : notify_template_id option;
      [@ocaml.doc
        "The default template identifier to associate with the notify configuration. If specified, \
         this template is used when sending messages without an explicit template identifier. Pass \
         the special value [UNSET_DEFAULT_TEMPLATE] to clear the current default template from the \
         notify configuration.\n"]
  pool_id : notify_pool_id_or_unset option;
      [@ocaml.doc
        "The pool identifier or Amazon Resource Name (ARN) to associate with the notify \
         configuration. Pass the special value [UNSET_DEFAULT_POOL_FOR_NOTIFY] to clear the \
         current default pool from the notify configuration.\n"]
  enabled_countries : iso_country_code_list option;
      [@ocaml.doc
        "An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format, that are \
         enabled for the notify configuration.\n"]
  enabled_channels : notify_enabled_channels_list option;
      [@ocaml.doc
        "An array of channels to enable for the notify configuration. Supported values include \
         [SMS] and [VOICE].\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "When set to true the notify configuration can't be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec update_event_destination_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the ConfigurationSet that was updated.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set.\n"]
  event_destination : event_destination option;
      [@ocaml.doc
        "An EventDestination object containing the details of where events will be logged. \n"]
}
[@@ocaml.doc ""]

type nonrec update_event_destination_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The configuration set to update with the new event destination. Valid values for this can \
         be the ConfigurationSetName or ConfigurationSetArn.\n"]
  event_destination_name : event_destination_name;
      [@ocaml.doc "The name to use for the event destination.\n"]
  enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "When set to true logging is enabled.\n"]
  matching_event_types : event_type_list option;
      [@ocaml.doc
        "An array of event types that determine which events to log.\n\n\
        \  The [TEXT_SENT] event type is not supported.\n\
        \  \n\
        \   "]
  cloud_watch_logs_destination : cloud_watch_logs_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination that sends data to \
         CloudWatch Logs.\n"]
  kinesis_firehose_destination : kinesis_firehose_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination for logging to Firehose.\n"]
  sns_destination : sns_destination option;
      [@ocaml.doc
        "An object that contains information about an event destination that sends data to Amazon \
         SNS.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_result = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc "An array of tag key values to unassociate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_result = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  tags : non_empty_tag_list;
      [@ocaml.doc "An array of key and value pair tags that are associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_registration_version_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number;
      [@ocaml.doc "The version number of the registration.\n"]
  registration_version_status : registration_version_status;
      [@ocaml.doc
        "The status of the registration version.\n\n\
        \ {ul\n\
        \       {-   [APPROVED]: Your registration has been approved.\n\
        \           \n\
        \            }\n\
        \       {-   [ARCHIVED]: Your previously approved registration version moves into this \
         status when a more recently submitted version is approved.\n\
        \           \n\
        \            }\n\
        \       {-   [DENIED]: You must fix your registration and resubmit it.\n\
        \           \n\
        \            }\n\
        \       {-   [DISCARDED]: You've abandon this version of their registration to start over \
         with a new version. \n\
        \           \n\
        \            }\n\
        \       {-   [DRAFT]: The initial status of a registration version after it\226\128\153s \
         created.\n\
        \           \n\
        \            }\n\
        \       {-   [REQUIRES_AUTHENTICATION]: You need to complete email authentication.\n\
        \           \n\
        \            }\n\
        \       {-   [REVIEWING]: Your registration has been accepted and is being reviewed.\n\
        \           \n\
        \            }\n\
        \       {-   [REVOKED]: Your previously approved registration has been revoked.\n\
        \           \n\
        \            }\n\
        \       {-   [SUBMITTED]: Your registration has been submitted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  registration_version_status_history : registration_version_status_history;
      [@ocaml.doc
        "The {b RegistrationVersionStatusHistory} object contains the time stamps for when the \
         reservations status changes.\n"]
  aws_review : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "Indicates whether AWS review was requested for this registration submission.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_registration_version_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  aws_review : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Set to true to request AWS review of the registration. When enabled, AWS will perform \
         additional validation and review of the registration submission before processing.\n"]
}
[@@ocaml.doc ""]

type nonrec set_voice_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option;
      [@ocaml.doc "The current monthly limit to enforce on sending voice messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_voice_message_spend_limit_override_request = {
  monthly_limit : monthly_limit; [@ocaml.doc "The new monthly limit to enforce on voice messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_text_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option;
      [@ocaml.doc "The current monthly limit to enforce on sending text messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_text_message_spend_limit_override_request = {
  monthly_limit : monthly_limit; [@ocaml.doc "The new monthly limit to enforce on text messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_rcs_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option;
      [@ocaml.doc "The current monthly limit to enforce on RCS message spending.\n"]
}
[@@ocaml.doc ""]

type nonrec set_rcs_message_spend_limit_override_request = {
  monthly_limit : monthly_limit;
      [@ocaml.doc "The new monthly limit to enforce on RCS message spending.\n"]
}
[@@ocaml.doc ""]

type nonrec set_notify_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option; [@ocaml.doc "The current monthly limit, in US dollars.\n"]
}
[@@ocaml.doc ""]

type nonrec set_notify_message_spend_limit_override_request = {
  monthly_limit : monthly_limit;
      [@ocaml.doc "The new monthly limit to enforce on notify messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_media_message_spend_limit_override_result = {
  monthly_limit : monthly_limit option;
      [@ocaml.doc "The current monthly limit to enforce on sending text messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_media_message_spend_limit_override_request = {
  monthly_limit : monthly_limit; [@ocaml.doc "The new monthly limit to enforce on text messages.\n"]
}
[@@ocaml.doc ""]

type nonrec set_default_sender_id_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set that was updated.\n"]
  sender_id : sender_id option;
      [@ocaml.doc "The default sender ID to set for the ConfigurationSet.\n"]
}
[@@ocaml.doc ""]

type nonrec set_default_sender_id_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The configuration set to updated with a new default SenderId. This field can be the \
         ConsigurationSetName or ConfigurationSetArn.\n"]
  sender_id : sender_id;
      [@ocaml.doc
        "The current sender ID for the configuration set. When sending a text message to a \
         destination country which supports SenderIds, the default sender ID on the configuration \
         set specified on [SendTextMessage] will be used if no dedicated origination phone numbers \
         or registered SenderIds are available in your account, instead of a generic sender ID, \
         such as 'NOTICE'.\n"]
}
[@@ocaml.doc ""]

type nonrec set_default_message_type_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration set that was updated.\n"]
  message_type : message_type option;
      [@ocaml.doc "The new default message type of the configuration set.\n"]
}
[@@ocaml.doc ""]

type nonrec set_default_message_type_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The configuration set to update with a new default message type. This field can be the \
         ConsigurationSetName or ConfigurationSetArn.\n"]
  message_type : message_type;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
}
[@@ocaml.doc ""]

type nonrec set_default_message_feedback_enabled_result = {
  configuration_set_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The arn of the configuration set.\n"]
  configuration_set_name : configuration_set_name option;
      [@ocaml.doc "The name of the configuration.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "True if message feedback is enabled.\n"]
}
[@@ocaml.doc ""]

type nonrec set_default_message_feedback_enabled_request = {
  configuration_set_name : configuration_set_name_or_arn;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Set to true to enable message feedback.\n"]
}
[@@ocaml.doc ""]

type nonrec set_account_default_protect_configuration_result = {
  default_protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the account default protect configuration.\n"]
  default_protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier of the account default protect configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec set_account_default_protect_configuration_request = {
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec send_voice_message_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the message.\n"]
}
[@@ocaml.doc ""]

type nonrec time_to_live = int [@@ocaml.doc ""]

type nonrec voice_message_body_text_type = TEXT [@ocaml.doc ""] | SSML [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec voice_message_body = string [@@ocaml.doc ""]

type nonrec voice_message_origination_identity = string [@@ocaml.doc ""]

type nonrec send_voice_message_request = {
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  origination_identity : voice_message_origination_identity;
      [@ocaml.doc
        "The origination identity to use for the voice call. This can be the PhoneNumber, \
         PhoneNumberId, PhoneNumberArn, PoolId, or PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  message_body : voice_message_body option; [@ocaml.doc "The text to convert to a voice message.\n"]
  message_body_text_type : voice_message_body_text_type option;
      [@ocaml.doc
        "Specifies if the MessageBody field contains text or \
         {{:https://docs.aws.amazon.com/polly/latest/dg/what-is.html}speech synthesis markup \
         language (SSML)}.\n\n\
        \ {ul\n\
        \       {-  TEXT: This is the default value. When used the maximum character limit is 3000.\n\
        \           \n\
        \            }\n\
        \       {-  SSML: When used the maximum character limit is 6000 including SSML tagging.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  voice_id : voice_id option;
      [@ocaml.doc
        "The voice for the {{:https://docs.aws.amazon.com/polly/latest/dg/what-is.html}Amazon \
         Polly} service to use. By default this is set to \"MATTHEW\".\n"]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  max_price_per_minute : max_price option;
      [@ocaml.doc "The maximum amount to spend per voice message, in US dollars.\n"]
  time_to_live : time_to_live option;
      [@ocaml.doc "How long the voice message is valid for. By default this is 72 hours.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  dry_run : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true, the message is checked and validated, but isn't sent to the end \
         recipient.\n"]
  protect_configuration_id : protect_configuration_id_or_arn option;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Set to true to enable message feedback for the message. When a user receives the message \
         you need to update the message status using [PutMessageFeedback].\n"]
}
[@@ocaml.doc ""]

type nonrec send_text_message_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the message.\n"]
}
[@@ocaml.doc ""]

type nonrec text_message_body = string [@@ocaml.doc ""]

type nonrec text_message_origination_identity = string [@@ocaml.doc ""]

type nonrec send_text_message_request = {
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  origination_identity : text_message_origination_identity option;
      [@ocaml.doc
        "The origination identity of the message. This can be either the PhoneNumber, \
         PhoneNumberId, PhoneNumberArn, RcsAgentId, RcsAgentArn, SenderId, SenderIdArn, PoolId, or \
         PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  message_body : text_message_body option; [@ocaml.doc "The body of the text message.\n"]
  message_type : message_type option;
      [@ocaml.doc
        "The type of message. Valid values are for messages that are critical or time-sensitive \
         and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  keyword : keyword option;
      [@ocaml.doc
        "When you register a short code in the US, you must specify a program name. If you \
         don\226\128\153t have a US short code, omit this attribute.\n"]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  max_price : max_price option;
      [@ocaml.doc
        "The maximum amount that you want to spend, in US dollars, per each text message. If the \
         calculated amount to send the text message is greater than [MaxPrice], the message is not \
         sent and an error is returned.\n"]
  time_to_live : time_to_live option;
      [@ocaml.doc
        "How long the text message is valid for, in seconds. By default this is 72 hours. If the \
         messages isn't handed off before the TTL expires we stop attempting to hand off the \
         message and return [TTL_EXPIRED] event.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  destination_country_parameters : destination_country_parameters option;
      [@ocaml.doc
        "This field is used for any country-specific registration requirements. Currently, this \
         setting is only used when you send messages to recipients in India using a sender ID. For \
         more information see \
         {{:https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-senderid-india.html}Special \
         requirements for sending SMS messages to recipients in India}. \n\n\
        \ {ul\n\
        \       {-   [IN_ENTITY_ID] The entity ID or Principal Entity (PE) ID that you received \
         after completing the sender ID registration process.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_TEMPLATE_ID] The template ID that you received after completing the \
         sender ID registration process.\n\
        \           \n\
        \             Make sure that the Template ID that you specify matches your message \
         template exactly. If your message doesn't match the template that you provided during the \
         registration process, the mobile carriers might reject your message.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  dry_run : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true, the message is checked and validated, but isn't sent to the end \
         recipient. You are not charged for using [DryRun].\n\n\
        \ The Message Parts per Second (MPS) limit when using [DryRun] is five. If your \
         origination identity has a lower MPS limit then the lower MPS limit is used. For more \
         information about MPS limits, see \
         {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/sms-limitations-mps.html}Message \
         Parts per Second (MPS) limits} in the {i End User Messaging SMS User Guide}..\n\
        \ "]
  protect_configuration_id : protect_configuration_id_or_arn option;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Set to true to enable message feedback for the message. When a user receives the message \
         you need to update the message status using [PutMessageFeedback].\n"]
}
[@@ocaml.doc ""]

type nonrec send_rcs_message_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the message.\n"]
}
[@@ocaml.doc ""]

type nonrec rcs_fallback_origination_identity = string [@@ocaml.doc ""]

type nonrec rcs_fallback_message_body = string [@@ocaml.doc ""]

type nonrec rcs_fallback_channel = SMS [@ocaml.doc ""] | MMS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rcs_fallback_configuration = {
  channel : rcs_fallback_channel;
      [@ocaml.doc
        "The fallback channel to use when RCS delivery fails. Valid values are SMS and MMS. SMS \
         and MMS are mutually exclusive.\n"]
  message_body : rcs_fallback_message_body option;
      [@ocaml.doc
        "The text body of the fallback message. Required for SMS fallback. For MMS fallback, at \
         least one of MessageBody or MediaUrls must be provided.\n"]
  media_urls : media_url_list option;
      [@ocaml.doc
        "An array of S3 URIs to media files for MMS fallback. Only valid when Channel is MMS.\n"]
  origination_identity : rcs_fallback_origination_identity option;
      [@ocaml.doc
        "The origination identity to use for the fallback message. This can be a PhoneNumber, \
         PhoneNumberId, PhoneNumberArn, SenderId, or SenderIdArn. Pool IDs and pool ARNs are not \
         accepted. If not specified and the original message was sent via a pool, the service \
         selects a suitable number from the pool.\n"]
}
[@@ocaml.doc
  "Configuration for SMS or MMS fallback when RCS delivery fails or the TimeToLive expires without \
   delivery confirmation.\n"]

type nonrec rcs_message_traffic_type = string [@@ocaml.doc ""]

type nonrec rcs_time_to_live = int [@@ocaml.doc ""]

type nonrec rcs_calendar_event_description = string [@@ocaml.doc ""]

type nonrec rcs_calendar_event_title = string [@@ocaml.doc ""]

type nonrec rcs_postback_data = string [@@ocaml.doc ""]

type nonrec rcs_suggested_action_text = string [@@ocaml.doc ""]

type nonrec rcs_create_calendar_event_action = {
  text : rcs_suggested_action_text;
      [@ocaml.doc "The display text of the action. Maximum 25 characters.\n"]
  postback_data : rcs_postback_data;
      [@ocaml.doc
        "The postback data sent to your webhook when the user taps this action. Maximum 2048 \
         characters.\n"]
  title : rcs_calendar_event_title;
      [@ocaml.doc "The title of the calendar event. Maximum 100 characters.\n"]
  start_time : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The start time of the calendar event in ISO 8601 format.\n"]
  end_time : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The end time of the calendar event in ISO 8601 format.\n"]
  description : rcs_calendar_event_description option;
      [@ocaml.doc "An optional description for the calendar event. Maximum 500 characters.\n"]
}
[@@ocaml.doc "A suggested action that creates a calendar event on the recipient's device.\n"]

type nonrec rcs_request_location_action = {
  text : rcs_suggested_action_text;
      [@ocaml.doc "The display text of the action. Maximum 25 characters.\n"]
  postback_data : rcs_postback_data;
      [@ocaml.doc
        "The postback data sent to your webhook when the user taps this action. Maximum 2048 \
         characters.\n"]
}
[@@ocaml.doc "A suggested action that requests the recipient's current location.\n"]

type nonrec rcs_location_label = string [@@ocaml.doc ""]

type nonrec rcs_show_location_action = {
  text : rcs_suggested_action_text;
      [@ocaml.doc "The display text of the action. Maximum 25 characters.\n"]
  postback_data : rcs_postback_data;
      [@ocaml.doc
        "The postback data sent to your webhook when the user taps this action. Maximum 2048 \
         characters.\n"]
  latitude : Smaws_Lib.Smithy_api.Types.double;
      [@ocaml.doc "The latitude of the location. Valid values are -90 to 90.\n"]
  longitude : Smaws_Lib.Smithy_api.Types.double;
      [@ocaml.doc "The longitude of the location. Valid values are -180 to 180.\n"]
  label : rcs_location_label option;
      [@ocaml.doc "An optional label for the location pin. Maximum 100 characters.\n"]
}
[@@ocaml.doc "A suggested action that shows a location on a map when tapped by the recipient.\n"]

type nonrec rcs_dial_phone_action = {
  text : rcs_suggested_action_text;
      [@ocaml.doc "The display text of the action. Maximum 25 characters.\n"]
  postback_data : rcs_postback_data;
      [@ocaml.doc
        "The postback data sent to your webhook when the user taps this action. Maximum 2048 \
         characters.\n"]
  phone_number : phone_number; [@ocaml.doc "The phone number to dial in E.164 format.\n"]
}
[@@ocaml.doc
  "A suggested action that initiates a phone call to a specified number when tapped by the \
   recipient.\n"]

type nonrec rcs_open_url_value = string [@@ocaml.doc ""]

type nonrec rcs_open_url_action = {
  text : rcs_suggested_action_text;
      [@ocaml.doc "The display text of the action. Maximum 25 characters.\n"]
  postback_data : rcs_postback_data;
      [@ocaml.doc
        "The postback data sent to your webhook when the user taps this action. Maximum 2048 \
         characters.\n"]
  url : rcs_open_url_value;
      [@ocaml.doc "The URL to open. Must start with https://. Maximum 2048 characters.\n"]
  application : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "How to open the URL. BROWSER opens in the device's default browser. WEBVIEW opens in an \
         in-app webview.\n"]
  webview_view_mode : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The display mode of the webview. Valid values are FULL, HALF, and TALL. Only applicable \
         when Application is WEBVIEW.\n"]
}
[@@ocaml.doc
  "A suggested action that opens a URL in the recipient's browser or an in-app webview.\n"]

type nonrec rcs_reply_action = {
  text : rcs_suggested_action_text;
      [@ocaml.doc "The display text of the suggested reply. Maximum 25 characters.\n"]
  postback_data : rcs_postback_data;
      [@ocaml.doc
        "The postback data sent to your webhook when the user taps this reply. Maximum 2048 \
         characters.\n"]
}
[@@ocaml.doc
  "A suggested reply action that sends predefined text and postback data when tapped by the \
   recipient.\n"]

type nonrec rcs_suggested_action =
  | Reply of rcs_reply_action
      [@ocaml.doc "A suggested reply that sends predefined text and postback data when tapped.\n"]
  | OpenUrl of rcs_open_url_action
      [@ocaml.doc "A suggested action that opens a URL in the user's browser or a webview.\n"]
  | DialPhone of rcs_dial_phone_action
      [@ocaml.doc "A suggested action that initiates a phone call to the specified number.\n"]
  | ShowLocation of rcs_show_location_action
      [@ocaml.doc "A suggested action that shows a location on a map.\n"]
  | RequestLocation of rcs_request_location_action
      [@ocaml.doc "A suggested action that requests the user's current location.\n"]
  | CreateCalendarEvent of rcs_create_calendar_event_action
      [@ocaml.doc "A suggested action that creates a calendar event on the user's device.\n"]
[@@ocaml.doc
  "A suggested action displayed to the RCS message recipient. Can be a reply, open URL, dial \
   phone, show location, request location, or create calendar event.\n"]

type nonrec rcs_suggested_action_list = rcs_suggested_action list [@@ocaml.doc ""]

type nonrec rcs_card_suggested_action_list = rcs_suggested_action list [@@ocaml.doc ""]

type nonrec rcs_media_url = string [@@ocaml.doc ""]

type nonrec rcs_carousel_card_media = {
  file_url : rcs_media_url;
      [@ocaml.doc "The S3 URI of the media file for the carousel card. Maximum 2000 characters.\n"]
  thumbnail_url : rcs_media_url option;
      [@ocaml.doc
        "The S3 URI of an optional thumbnail image for the carousel card media. Maximum 2000 \
         characters.\n"]
  height : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The display height of the media in the carousel card. Valid values are SHORT and MEDIUM.\n"]
}
[@@ocaml.doc
  "The media content of a carousel card. Display height is restricted to SHORT or MEDIUM (TALL is \
   not supported in carousels).\n"]

type nonrec rcs_card_description = string [@@ocaml.doc ""]

type nonrec rcs_card_title = string [@@ocaml.doc ""]

type nonrec rcs_carousel_card_content = {
  title : rcs_card_title option;
      [@ocaml.doc "The title of the carousel card. Maximum 200 characters.\n"]
  description : rcs_card_description option;
      [@ocaml.doc "The description text of the carousel card. Maximum 2000 characters.\n"]
  media : rcs_carousel_card_media option;
      [@ocaml.doc
        "The media content of the carousel card. Media height is restricted to SHORT or MEDIUM \
         (TALL is not supported in carousels).\n"]
  suggestions : rcs_card_suggested_action_list option;
      [@ocaml.doc
        "Card-level suggested actions for this carousel card. Maximum 4 suggestions per card.\n"]
}
[@@ocaml.doc
  "The content of a carousel card, including title, description, media, and card-level suggested \
   actions. Media height is restricted to SHORT or MEDIUM.\n"]

type nonrec rcs_carousel_card_content_list = rcs_carousel_card_content list [@@ocaml.doc ""]

type nonrec rcs_carousel = {
  card_width : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The width of cards in the carousel. Valid values are SMALL and MEDIUM.\n"]
  card_contents : rcs_carousel_card_content_list;
      [@ocaml.doc "The list of cards in the carousel. Minimum 2, maximum 10 cards.\n"]
}
[@@ocaml.doc "A carousel of 2 to 10 scrollable rich cards.\n"]

type nonrec rcs_card_media = {
  file_url : rcs_media_url;
      [@ocaml.doc
        "The S3 URI of the media file for the card, in the format [s3://bucket-name/key]. Maximum \
         2000 characters.\n"]
  thumbnail_url : rcs_media_url option;
      [@ocaml.doc
        "The S3 URI of an optional thumbnail image for the card media. Maximum 2000 characters.\n"]
  height : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The display height of the media in the card. Valid values are SHORT, MEDIUM, and TALL.\n"]
}
[@@ocaml.doc
  "The media content of a rich card, including the file URL, optional thumbnail, and display height.\n"]

type nonrec rcs_card_content = {
  title : rcs_card_title option; [@ocaml.doc "The title of the card. Maximum 200 characters.\n"]
  description : rcs_card_description option;
      [@ocaml.doc "The description text of the card. Maximum 2000 characters.\n"]
  media : rcs_card_media option;
      [@ocaml.doc
        "The media content of the card, including the file URL, optional thumbnail, and display \
         height.\n"]
  suggestions : rcs_card_suggested_action_list option;
      [@ocaml.doc "Card-level suggested actions. Maximum 4 suggestions per card.\n"]
}
[@@ocaml.doc
  "The content of a rich card, including title, description, media, and card-level suggested \
   actions.\n"]

type nonrec rcs_standalone_card = {
  card_orientation : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The orientation of the rich card. Valid values are HORIZONTAL and VERTICAL.\n"]
  thumbnail_image_alignment : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The alignment of the thumbnail image in a horizontal card. Valid values are LEFT and \
         RIGHT. Only applicable when CardOrientation is HORIZONTAL.\n"]
  card_content : rcs_card_content;
      [@ocaml.doc
        "The content of the rich card, including title, description, media, and card-level \
         suggested actions.\n"]
}
[@@ocaml.doc "A standalone rich card with media, title, description, and suggested actions.\n"]

type nonrec rcs_file_message = {
  file_url : rcs_media_url;
      [@ocaml.doc
        "The S3 URI of the media file to send, in the format [s3://bucket-name/key]. The service \
         downloads the file from your S3 bucket, rehosts it, and generates a presigned URL for the \
         aggregator. Maximum 2000 characters.\n"]
  thumbnail_url : rcs_media_url option;
      [@ocaml.doc
        "The S3 URI of an optional thumbnail image for the media file, in the format \
         [s3://bucket-name/key]. Maximum 2000 characters.\n"]
}
[@@ocaml.doc
  "A file message containing a media file (image, video, audio, or PDF) with an optional thumbnail.\n"]

type nonrec rcs_text_body = string [@@ocaml.doc ""]

type nonrec rcs_text_message = {
  body : rcs_text_body; [@ocaml.doc "The text body of the RCS message. Maximum 3072 characters.\n"]
}
[@@ocaml.doc "A plain text RCS message body.\n"]

type nonrec rcs_content =
  | TextMessage of rcs_text_message [@ocaml.doc "A plain text RCS message.\n"]
  | FileMessage of rcs_file_message
      [@ocaml.doc
        "A file message containing a media file (image, video, audio, or PDF) with an optional \
         thumbnail.\n"]
  | RichCard of rcs_standalone_card
      [@ocaml.doc "A standalone rich card with media, title, description, and suggested actions.\n"]
  | Carousel of rcs_carousel
      [@ocaml.doc
        "A carousel of 2 to 10 scrollable cards, each with media, title, description, and \
         suggested actions.\n"]
[@@ocaml.doc "The message body of an RCS message. Exactly one content type must be specified.\n"]

type nonrec rcs_message_content = {
  content : rcs_content;
      [@ocaml.doc
        "The content of the RCS message. Exactly one content type must be specified: TextMessage, \
         FileMessage, RichCard, or Carousel.\n"]
  suggestions : rcs_suggested_action_list option;
      [@ocaml.doc
        "Message-level suggested actions displayed to the recipient. Maximum 11 suggestions per \
         message.\n"]
}
[@@ocaml.doc
  "The content of an RCS message, containing the message body (text, file, rich card, or carousel) \
   and optional message-level suggested actions.\n"]

type nonrec rcs_message_origination_identity = string [@@ocaml.doc ""]

type nonrec send_rcs_message_request = {
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  origination_identity : rcs_message_origination_identity;
      [@ocaml.doc
        "The origination identity of the message. This can be either the RcsAgentId, RcsAgentArn, \
         PoolId, or PoolArn.\n"]
  rcs_message_content : rcs_message_content option;
      [@ocaml.doc
        "The content of the RCS message. Contains the message content (text, file, rich card, or \
         carousel) and optional message-level suggested actions.\n"]
  time_to_live : rcs_time_to_live option;
      [@ocaml.doc
        "The duration in seconds that the RCS message is valid for delivery. If the message cannot \
         be delivered within this duration, it is considered expired. Valid values are 1 to 172800 \
         (48 hours). If a FallbackConfiguration is provided, the fallback is triggered when the \
         duration expires without delivery confirmation.\n"]
  message_traffic_type : rcs_message_traffic_type option;
      [@ocaml.doc
        "The traffic type of the RCS message. Valid values are AUTHENTICATION, TRANSACTION, \
         PROMOTION, SERVICE_REQUEST, and ACKNOWLEDGEMENT. This field is reserved for future use.\n"]
  fallback_configuration : rcs_fallback_configuration option;
      [@ocaml.doc
        "Configuration for SMS or MMS fallback when RCS delivery fails. If provided, the service \
         sends a fallback message via the specified channel when the RCS message fails or the \
         TimeToLive expires.\n"]
  protect_configuration_id : protect_configuration_id_or_arn option;
      [@ocaml.doc "The unique identifier of the protect configuration to use.\n"]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  max_price : max_price option;
      [@ocaml.doc
        "The maximum amount that you want to spend, in US dollars, per each RCS message.\n"]
  dry_run : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true, the message is checked and validated, but isn't sent to the end \
         recipient.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Set to true to enable message feedback for the message. When a user receives the message \
         you need to update the message status using [PutMessageFeedback].\n"]
}
[@@ocaml.doc ""]

type nonrec send_notify_voice_message_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the message.\n"]
  template_id : notify_template_id option;
      [@ocaml.doc "The unique identifier of the template used for the message.\n"]
  resolved_message_body : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The message body after template variable substitution has been applied.\n"]
}
[@@ocaml.doc ""]

type nonrec template_variable_value = string [@@ocaml.doc ""]

type nonrec template_variable_name = string [@@ocaml.doc ""]

type nonrec template_variable_substitution_map =
  (template_variable_name * template_variable_value) list
[@@ocaml.doc ""]

type nonrec send_notify_voice_message_request = {
  notify_configuration_id : notify_configuration_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the notify configuration to use for sending the message. This \
         can be either the NotifyConfigurationId or NotifyConfigurationArn.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  template_id : notify_template_id option;
      [@ocaml.doc "The unique identifier of the template to use for the message.\n"]
  template_variables : template_variable_substitution_map;
      [@ocaml.doc
        "A map of template variable names and their values. All variable values are passed as \
         strings regardless of the declared variable type. For example, pass [INTEGER] values as \
         [\"42\"] and [BOOLEAN] values as [\"true\"] or [\"false\"].\n"]
  voice_id : voice_id option; [@ocaml.doc "The voice ID to use for the voice message.\n"]
  time_to_live : time_to_live option;
      [@ocaml.doc
        "How long the voice message is valid for, in seconds. By default this is 72 hours.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  dry_run : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true, the message is checked and validated, but isn't sent to the end \
         recipient.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Set to true to enable message feedback for the message. When a user receives the message \
         you need to update the message status using [PutMessageFeedback].\n"]
}
[@@ocaml.doc ""]

type nonrec send_notify_text_message_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the message.\n"]
  template_id : notify_template_id option;
      [@ocaml.doc "The unique identifier of the template used for the message.\n"]
  resolved_message_body : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The message body after template variable substitution has been applied.\n"]
}
[@@ocaml.doc ""]

type nonrec send_notify_text_message_request = {
  notify_configuration_id : notify_configuration_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the notify configuration to use for sending the message. This \
         can be either the NotifyConfigurationId or NotifyConfigurationArn.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  template_id : notify_template_id option;
      [@ocaml.doc "The unique identifier of the template to use for the message.\n"]
  template_variables : template_variable_substitution_map;
      [@ocaml.doc
        "A map of template variable names and their values. All variable values are passed as \
         strings regardless of the declared variable type. For example, pass [INTEGER] values as \
         [\"42\"] and [BOOLEAN] values as [\"true\"] or [\"false\"].\n"]
  time_to_live : time_to_live option;
      [@ocaml.doc
        "How long the text message is valid for, in seconds. By default this is 72 hours.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  dry_run : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true, the message is checked and validated, but isn't sent to the end \
         recipient.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Set to true to enable message feedback for the message. When a user receives the message \
         you need to update the message status using [PutMessageFeedback].\n"]
}
[@@ocaml.doc ""]

type nonrec send_media_message_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the message.\n"]
}
[@@ocaml.doc ""]

type nonrec send_media_message_request = {
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  origination_identity : media_message_origination_identity;
      [@ocaml.doc
        "The origination identity of the message. This can be either the PhoneNumber, \
         PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId, or PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  message_body : text_message_body option; [@ocaml.doc "The text body of the message.\n"]
  media_urls : media_url_list option;
      [@ocaml.doc
        "An array of URLs to each media file to send. \n\n\
        \ The media files have to be stored in an S3 bucket. Supported media file formats are \
         listed in \
         {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/mms-limitations-character.html}MMS \
         file types, size and character limits}. For more information on creating an S3 bucket and \
         managing objects, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-overview.html}Creating \
         a bucket}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/upload-objects.html}Uploading \
         objects} in the {i Amazon S3 User Guide}, and \
         {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/send-mms-message.html#send-mms-message-bucket}Setting \
         up an Amazon S3 bucket for MMS files} in the {i Amazon Web Services End User Messaging \
         SMS User Guide}.\n\
        \ "]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  max_price : max_price option;
      [@ocaml.doc
        "The maximum amount that you want to spend, in US dollars, per each MMS message.\n"]
  time_to_live : time_to_live option;
      [@ocaml.doc "How long the media message is valid for. By default this is 72 hours.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  dry_run : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "When set to true, the message is checked and validated, but isn't sent to the end \
         recipient.\n"]
  protect_configuration_id : protect_configuration_id_or_arn option;
      [@ocaml.doc "The unique identifier of the protect configuration to use.\n"]
  message_feedback_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Set to true to enable message feedback for the message. When a user receives the message \
         you need to update the message status using [PutMessageFeedback].\n"]
}
[@@ocaml.doc ""]

type nonrec send_destination_number_verification_code_result = {
  message_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the message.\n"]
}
[@@ocaml.doc ""]

type nonrec verification_message_origination_identity = string [@@ocaml.doc ""]

type nonrec verification_channel = TEXT [@ocaml.doc ""] | VOICE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec send_destination_number_verification_code_request = {
  verified_destination_number_id : verified_destination_number_id_or_arn;
      [@ocaml.doc "The unique identifier for the verified destination phone number.\n"]
  verification_channel : verification_channel;
      [@ocaml.doc "Choose to send the verification code as an SMS or voice message.\n"]
  language_code : language_code option; [@ocaml.doc "Choose the language to use for the message.\n"]
  origination_identity : verification_message_origination_identity option;
      [@ocaml.doc
        "The origination identity of the message. This can be either the PhoneNumber, \
         PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId, or PoolArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  configuration_set_name : configuration_set_name_or_arn option;
      [@ocaml.doc
        "The name of the configuration set to use. This can be either the ConfigurationSetName or \
         ConfigurationSetArn.\n"]
  context : context_map option;
      [@ocaml.doc
        "You can specify custom data in this field. If you do, that data is logged to the event \
         destination.\n"]
  destination_country_parameters : destination_country_parameters option;
      [@ocaml.doc
        "This field is used for any country-specific registration requirements. Currently, this \
         setting is only used when you send messages to recipients in India using a sender ID. For \
         more information see \
         {{:https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-senderid-india.html}Special \
         requirements for sending SMS messages to recipients in India}. \n"]
}
[@@ocaml.doc ""]

type nonrec request_sender_id_result = {
  sender_id_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with the SenderId.\n"]
  sender_id : sender_id; [@ocaml.doc "The sender ID that was requested.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  message_types : message_type_list;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The monthly price, in US dollars, to lease the sender ID.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "By default this is set to false. When set to true the sender ID can't be deleted.\n"]
  registered : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "True if the sender ID is registered.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) to associate with the sender ID.\n"]
}
[@@ocaml.doc ""]

type nonrec request_sender_id_request = {
  sender_id : sender_id;
      [@ocaml.doc
        "The sender ID string to request. The sender ID can be 1-11 alphanumeric characters \
         including letters (A-Z, a-z), numbers (0-9), or hyphens (-). The sender ID must contain \
         at least one letter and cannot start or end with a hyphen.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  message_types : message_type_list option;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the sender ID can't be deleted.\n"]
  tags : tag_list option;
      [@ocaml.doc "An array of tags (key and value pairs) to associate with the sender ID.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec requestable_number_type =
  | LONG_CODE [@ocaml.doc ""]
  | TOLL_FREE [@ocaml.doc ""]
  | TEN_DLC [@ocaml.doc ""]
  | SIMULATOR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec request_phone_number_result = {
  phone_number_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the requested phone number.\n"]
  phone_number_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the new phone number.\n"]
  phone_number : phone_number option; [@ocaml.doc "The new phone number that was requested.\n"]
  status : number_status option; [@ocaml.doc "The current status of the request.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
  message_type : message_type option;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  number_capabilities : number_capability_list option;
      [@ocaml.doc
        "Indicates if the phone number will be used for text messages, voice messages or both. \n"]
  number_type : requestable_number_type option;
      [@ocaml.doc "The type of number that was released.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The monthly price, in US dollars, to lease the phone number.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The ARN used to identify the two way channel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to false and an end recipient sends a message \
         that begins with HELP or STOP to one of your dedicated numbers, End User Messaging SMS \
         automatically replies with a customizable message and adds the end recipient to the \
         OptOutList. When set to true you're responsible for responding to HELP and STOP requests. \
         You're also responsible for tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc
        "The name of the OptOutList that is associated with the requested phone number.\n"]
  international_sending_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true the international sending of phone \
         number is Enabled. \n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true the phone number can't be deleted. \n"]
  pool_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the pool associated with the phone number \n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of key and value pair tags that are associated with the phone number.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the phone number was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec request_phone_number_request = {
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region. \n"]
  message_type : message_type;
      [@ocaml.doc
        "The type of message. Valid values are [TRANSACTIONAL] for messages that are critical or \
         time-sensitive and [PROMOTIONAL] for messages that aren't critical or time-sensitive.\n"]
  number_capabilities : number_capability_list;
      [@ocaml.doc
        "Indicates if the phone number will be used for text messages, voice messages, or both. \n"]
  number_type : requestable_number_type;
      [@ocaml.doc
        "The type of phone number to request.\n\n\
        \ When you request a [SIMULATOR] phone number, you must set {b MessageType} as \
         [TRANSACTIONAL]. \n\
        \ "]
  opt_out_list_name : opt_out_list_name_or_arn option;
      [@ocaml.doc
        "The name of the OptOutList to associate with the phone number. You can use the \
         OptOutListName or OptOutListArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  pool_id : pool_id_or_arn option;
      [@ocaml.doc
        "The pool to associated with the phone number. You can use the PoolId or PoolArn. \n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  registration_id : registration_id_or_arn option;
      [@ocaml.doc
        "Use this field to attach your phone number for an external registration process.\n"]
  international_sending_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the international sending of phone \
         number is Enabled. \n"]
  deletion_protection_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "By default this is set to false. When set to true the phone number can't be deleted.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of tags (key and value pairs) to associate with the requested phone number. \n"]
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
}
[@@ocaml.doc ""]

type nonrec release_sender_id_result = {
  sender_id_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) associated with the SenderId.\n"]
  sender_id : sender_id; [@ocaml.doc "The sender ID that was released.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  message_types : message_type_list;
      [@ocaml.doc
        "The type of message. Valid values are TRANSACTIONAL for messages that are critical or \
         time-sensitive and PROMOTIONAL for messages that aren't critical or time-sensitive.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The monthly price, in US dollars, to lease the sender ID.\n"]
  registered : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "True if the sender ID is registered.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
}
[@@ocaml.doc ""]

type nonrec release_sender_id_request = {
  sender_id : sender_id_or_arn; [@ocaml.doc "The sender ID to release.\n"]
  iso_country_code : iso_country_code;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
}
[@@ocaml.doc ""]

type nonrec release_phone_number_result = {
  phone_number_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberArn of the phone number that was released.\n"]
  phone_number_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberId of the phone number that was released.\n"]
  phone_number : phone_number option; [@ocaml.doc "The phone number that was released.\n"]
  status : number_status option; [@ocaml.doc "The current status of the request.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  message_type : message_type option;
      [@ocaml.doc "The message type that was associated with the phone number.\n"]
  number_capabilities : number_capability_list option;
      [@ocaml.doc "Specifies if the number could be used for text messages, voice, or both.\n"]
  number_type : number_type option; [@ocaml.doc "The type of number that was released.\n"]
  monthly_leasing_price : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The monthly price of the phone number, in US dollars.\n"]
  two_way_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to true you can receive incoming text messages \
         from your end recipients.\n"]
  two_way_channel_arn : two_way_channel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the TwoWayChannel.\n"]
  two_way_channel_role : iam_role_arn option;
      [@ocaml.doc
        "An optional IAM Role Arn for a service to assume, to be able to post inbound SMS messages.\n"]
  self_managed_opt_outs_enabled : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "By default this is set to false. When set to false and an end recipient sends a message \
         that begins with HELP or STOP to one of your dedicated numbers, End User Messaging SMS \
         automatically replies with a customizable message and adds the end recipient to the \
         OptOutList. When set to true you're responsible for responding to HELP and STOP requests. \
         You're also responsible for tracking and honoring opt-out requests.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The name of the OptOutList that was associated with the phone number.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the phone number was created, in {{:https://www.epochconverter.com/}UNIX \
         epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec release_phone_number_request = {
  phone_number_id : phone_number_id_or_arn;
      [@ocaml.doc
        "The PhoneNumberId or PhoneNumberArn of the phone number to release. You can use \
         [DescribePhoneNumbers] to get the values for PhoneNumberId and PhoneNumberArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_result = {
  resource_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the End User Messaging SMS resource attached to the \
         resource-based policy.\n"]
  policy : resource_policy option; [@ocaml.doc "The JSON formatted Resource Policy.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time when the resource-based policy was created, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  resource_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the End User Messaging SMS resource to attach the \
         resource-based policy to.\n"]
  policy : resource_policy; [@ocaml.doc "The JSON formatted resource-based policy to attach.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registration_field_value_result = {
  registration_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the registration.\n"]
  registration_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  version_number : registration_version_number;
      [@ocaml.doc "The version number of the registration.\n"]
  field_path : field_path;
      [@ocaml.doc
        "The path to the registration form field. You can use \
         [DescribeRegistrationFieldDefinitions] for a list of {b FieldPaths}.\n"]
  select_choices : select_choice_list option;
      [@ocaml.doc "An array of values for the form field.\n"]
  text_value : text_value option; [@ocaml.doc "The text data for a free form field.\n"]
  registration_attachment_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registration_field_value_request = {
  registration_id : registration_id_or_arn;
      [@ocaml.doc "The unique identifier for the registration.\n"]
  field_path : field_path;
      [@ocaml.doc
        "The path to the registration form field. You can use \
         [DescribeRegistrationFieldDefinitions] for a list of {b FieldPaths}.\n"]
  select_choices : select_choice_list option;
      [@ocaml.doc "An array of values for the form field.\n"]
  text_value : text_value option; [@ocaml.doc "The text data for a free form field.\n"]
  registration_attachment_id : registration_attachment_id_or_arn option;
      [@ocaml.doc "The unique identifier for the registration attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec put_protect_configuration_rule_set_number_override_result = {
  protect_configuration_arn : protect_configuration_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the protect configuration.\n"]
  protect_configuration_id : protect_configuration_id;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "The time when the rule was created, in {{:https://www.epochconverter.com/}UNIX epoch \
         time} format.\n"]
  action : protect_configuration_rule_override_action;
      [@ocaml.doc "The action for the rule to take.\n"]
  iso_country_code : iso_country_code option;
      [@ocaml.doc
        "The two-character code, in ISO 3166-1 alpha-2 format, for the country or region.\n"]
  expiration_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time the rule will expire at.\n"]
}
[@@ocaml.doc ""]

type nonrec put_protect_configuration_rule_set_number_override_request = {
  client_token : client_token option;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, a randomly generated token is used for the \
         request to ensure idempotency.\n"]
  protect_configuration_id : protect_configuration_id_or_arn;
      [@ocaml.doc "The unique identifier for the protect configuration.\n"]
  destination_phone_number : phone_number;
      [@ocaml.doc "The destination phone number in E.164 format.\n"]
  action : protect_configuration_rule_override_action;
      [@ocaml.doc
        "The action for the rule to either block or allow messages to the destination phone number.\n"]
  expiration_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time the rule will expire at. If [ExpirationTimestamp] is not set then the rule does \
         not expire.\n"]
}
[@@ocaml.doc ""]

type nonrec put_opted_out_number_result = {
  opt_out_list_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OptOutListArn that the phone number was removed from.\n"]
  opt_out_list_name : opt_out_list_name option;
      [@ocaml.doc "The OptOutListName that the phone number was removed from.\n"]
  opted_out_number : phone_number option;
      [@ocaml.doc "The phone number that was added to the OptOutList.\n"]
  opted_out_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The time that the phone number was added to the OptOutList, in \
         {{:https://www.epochconverter.com/}UNIX epoch time} format.\n"]
  end_user_opted_out : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "This is true if it was the end user who requested their phone number be removed. \n"]
}
[@@ocaml.doc ""]

type nonrec put_opted_out_number_request = {
  opt_out_list_name : opt_out_list_name_or_arn;
      [@ocaml.doc
        "The OptOutListName or OptOutListArn to add the phone number to.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  opted_out_number : phone_number;
      [@ocaml.doc "The phone number to add to the OptOutList in E.164 format.\n"]
}
[@@ocaml.doc ""]

type nonrec put_message_feedback_result = {
  message_id : message_id; [@ocaml.doc "The unique identifier for the message.\n"]
  message_feedback_status : message_feedback_status;
      [@ocaml.doc "The current status of the message.\n"]
}
[@@ocaml.doc ""]

type nonrec put_message_feedback_request = {
  message_id : message_id; [@ocaml.doc "The unique identifier for the message.\n"]
  message_feedback_status : message_feedback_status;
      [@ocaml.doc "Set the message feedback to be either [RECEIVED] or [FAILED].\n"]
}
[@@ocaml.doc ""]

type nonrec put_keyword_result = {
  origination_identity_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberArn or PoolArn that the keyword was associated with.\n"]
  origination_identity : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The PhoneNumberId or PoolId that the keyword was associated with.\n"]
  keyword : keyword option; [@ocaml.doc "The keyword that was added.\n"]
  keyword_message : keyword_message option;
      [@ocaml.doc "The message associated with the keyword.\n"]
  keyword_action : keyword_action option;
      [@ocaml.doc "The action to perform when the keyword is used.\n"]
}
[@@ocaml.doc ""]

type nonrec put_keyword_request = {
  origination_identity : phone_or_pool_id_or_arn;
      [@ocaml.doc
        "The origination identity to use such as a PhoneNumberId, PhoneNumberArn, SenderId or \
         SenderIdArn. You can use [DescribePhoneNumbers] get the values for PhoneNumberId and \
         PhoneNumberArn while [DescribeSenderIds] can be used to get the values for SenderId and \
         SenderIdArn.\n\n\
        \  If you are using a shared End User Messaging SMS resource then you must use the full \
         Amazon Resource Name(ARN).\n\
        \  \n\
        \   "]
  keyword : keyword; [@ocaml.doc "The new keyword to add.\n"]
  keyword_message : keyword_message; [@ocaml.doc "The message associated with the keyword.\n"]
  keyword_action : keyword_action option;
      [@ocaml.doc
        "The action to perform for the new keyword when it is received.\n\n\
        \ {ul\n\
        \       {-  AUTOMATIC_RESPONSE: A message is sent to the recipient.\n\
        \           \n\
        \            }\n\
        \       {-  OPT_OUT: Keeps the recipient from receiving future messages.\n\
        \           \n\
        \            }\n\
        \       {-  OPT_IN: The recipient wants to receive future messages.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]
